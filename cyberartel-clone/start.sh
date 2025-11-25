#!/bin/bash

# CYBER ARTEL - Скрипт запуска
# Автоматический запуск сайта в Docker

echo "🚀 CYBER ARTEL - Запуск сайта..."
echo ""

# Проверка наличия Docker
if ! command -v docker &> /dev/null; then
    echo "❌ Docker не установлен!"
    echo "Пожалуйста, установите Docker:"
    echo "https://docs.docker.com/get-docker/"
    exit 1
fi

# Проверка наличия Docker Compose
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose не установлен!"
    echo "Пожалуйста, установите Docker Compose:"
    echo "https://docs.docker.com/compose/install/"
    exit 1
fi

echo "✅ Docker установлен"
echo "✅ Docker Compose установлен"
echo ""

# Остановка существующих контейнеров
echo "🛑 Остановка существующих контейнеров (если есть)..."
docker-compose down 2>/dev/null

echo ""
echo "🔨 Сборка Docker образа..."
docker-compose build

echo ""
echo "🚀 Запуск контейнера..."
docker-compose up -d

echo ""
echo "✅ Сайт успешно запущен!"
echo ""
echo "🌐 Откройте браузер и перейдите на:"
echo "   http://localhost:8080"
echo ""
echo "📋 Полезные команды:"
echo "   Остановить:    docker-compose down"
echo "   Перезапустить: docker-compose restart"
echo "   Логи:          docker-compose logs -f"
echo ""
