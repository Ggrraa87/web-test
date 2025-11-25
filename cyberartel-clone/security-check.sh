#!/bin/bash

# Скрипт проверки безопасности IT SALES

echo "🔒 Проверка безопасности IT SALES"
echo "=================================="
echo ""

# Цвета для вывода
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

passed=0
failed=0
warnings=0

# Функция проверки
check() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓${NC} $1"
        ((passed++))
    else
        echo -e "${RED}✗${NC} $1"
        ((failed++))
    fi
}

warn() {
    echo -e "${YELLOW}⚠${NC} $1"
    ((warnings++))
}

# 1. Проверка Docker
echo "1. Проверка Docker"
echo "-------------------"
docker --version > /dev/null 2>&1
check "Docker установлен"

docker-compose --version > /dev/null 2>&1
check "Docker Compose установлен"

echo ""

# 2. Проверка файлов конфигурации
echo "2. Проверка файлов конфигурации"
echo "--------------------------------"

if [ -f "nginx.conf" ]; then
    grep -q "server_tokens off" nginx.conf
    check "Nginx скрывает версию (server_tokens off)"

    grep -q "X-Frame-Options" nginx.conf
    check "X-Frame-Options заголовок настроен"

    grep -q "X-Content-Type-Options" nginx.conf
    check "X-Content-Type-Options заголовок настроен"

    grep -q "Content-Security-Policy" nginx.conf
    check "Content-Security-Policy заголовок настроен"

    grep -q "client_max_body_size" nginx.conf
    check "Ограничение размера запроса настроено"
else
    echo -e "${RED}✗${NC} nginx.conf не найден"
    ((failed++))
fi

echo ""

# 3. Проверка Docker Compose
echo "3. Проверка Docker Compose"
echo "--------------------------"

if [ -f "docker-compose.yml" ]; then
    grep -q "restart:" docker-compose.yml
    check "Политика перезапуска настроена"

    if [ -f "docker-compose.secure.yml" ]; then
        grep -q "no-new-privileges" docker-compose.secure.yml
        check "Безопасный docker-compose.secure.yml создан"

        grep -q "limits:" docker-compose.secure.yml
        check "Ограничения ресурсов настроены"
    else
        warn "docker-compose.secure.yml не найден (опционально)"
    fi
else
    echo -e "${RED}✗${NC} docker-compose.yml не найден"
    ((failed++))
fi

echo ""

# 4. Проверка .gitignore
echo "4. Проверка .gitignore"
echo "----------------------"

if [ -f ".gitignore" ]; then
    grep -q ".env" .gitignore
    check ".env файл в .gitignore"

    grep -q "*.key" .gitignore
    check "Ключи в .gitignore"

    grep -q "*.log" .gitignore
    check "Логи в .gitignore"
else
    echo -e "${RED}✗${NC} .gitignore не найден"
    ((failed++))
fi

echo ""

# 5. Проверка портов
echo "5. Проверка портов"
echo "------------------"

if docker ps | grep -q "itsales-website"; then
    docker port itsales-website > /dev/null 2>&1
    check "Контейнер запущен"

    # Проверка заголовков безопасности
    if command -v curl > /dev/null 2>&1; then
        response=$(curl -s -I http://localhost:8080 2>/dev/null)

        echo "$response" | grep -q "X-Frame-Options"
        check "X-Frame-Options заголовок активен"

        echo "$response" | grep -q "X-Content-Type-Options"
        check "X-Content-Type-Options заголовок активен"

        echo "$response" | grep -q "Content-Security-Policy"
        check "Content-Security-Policy заголовок активен"

        if echo "$response" | grep -q "Server: nginx"; then
            echo "$response" | grep -qv "nginx/"
            check "Версия Nginx скрыта"
        fi
    else
        warn "curl не установлен - пропускаем проверку заголовков"
    fi
else
    warn "Контейнер не запущен - запустите: docker-compose up -d"
fi

echo ""

# 6. Проверка UFW (если установлен)
echo "6. Проверка Firewall"
echo "--------------------"

if command -v ufw > /dev/null 2>&1; then
    sudo ufw status | grep -q "Status: active"
    check "UFW firewall активен"

    sudo ufw status | grep -q "80/tcp"
    check "Порт 80 разрешен"
else
    warn "UFW не установлен - рекомендуется установить"
fi

echo ""

# 7. Проверка обновлений
echo "7. Проверка обновлений"
echo "----------------------"

if [ -f "/var/run/reboot-required" ]; then
    warn "Требуется перезагрузка системы"
else
    check "Перезагрузка не требуется"
fi

echo ""

# Итоги
echo "=================================="
echo "ИТОГИ ПРОВЕРКИ:"
echo "=================================="
echo -e "${GREEN}Пройдено:${NC} $passed"
echo -e "${YELLOW}Предупреждений:${NC} $warnings"
echo -e "${RED}Провалено:${NC} $failed"
echo ""

if [ $failed -eq 0 ]; then
    echo -e "${GREEN}✓ Базовая безопасность настроена!${NC}"
    echo ""
    echo "Дополнительные рекомендации:"
    echo "- Настройте SSL/HTTPS для продакшна"
    echo "- Установите fail2ban для защиты от брутфорса"
    echo "- Настройте регулярное резервное копирование"
    echo "- Используйте docker-compose.secure.yml для продакшна"
    exit 0
else
    echo -e "${RED}✗ Обнаружены проблемы безопасности!${NC}"
    echo "Пожалуйста, исправьте указанные ошибки."
    exit 1
fi
