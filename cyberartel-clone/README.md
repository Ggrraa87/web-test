# CYBER ARTEL - Клон сайта

Полная копия сайта cyberartel.ru с Docker инфраструктурой для быстрого развертывания.

## 🚀 Особенности

- ✅ Темная тема в стиле оригинального сайта
- ✅ Адаптивный дизайн (Mobile-first)
- ✅ Анимации на Canvas (система частиц)
- ✅ Плавная прокрутка
- ✅ Интерактивные элементы
- ✅ Docker контейнеризация
- ✅ Nginx веб-сервер
- ✅ Оптимизация производительности (gzip, кэширование)

## 📋 Требования

Для запуска проекта необходимо установить:

- **Docker** (версия 20.10 или выше)
- **Docker Compose** (версия 1.29 или выше)

### Установка Docker

#### Ubuntu/Debian:
```bash
sudo apt update
sudo apt install docker.io docker-compose -y
sudo systemctl start docker
sudo systemctl enable docker
```

#### macOS:
Скачайте Docker Desktop: https://www.docker.com/products/docker-desktop

#### Windows:
Скачайте Docker Desktop: https://www.docker.com/products/docker-desktop

## 🔧 Установка и запуск

### Вариант 1: Использование Docker Compose (рекомендуется)

1. **Перейдите в директорию проекта:**
```bash
cd cyberartel-clone
```

2. **Запустите контейнер:**
```bash
docker-compose up -d
```

3. **Откройте браузер и перейдите на:**
```
http://localhost:8080
```

### Вариант 2: Использование Docker напрямую

1. **Соберите Docker образ:**
```bash
cd cyberartel-clone
docker build -t cyberartel-website .
```

2. **Запустите контейнер:**
```bash
docker run -d -p 8080:80 --name cyberartel cyberartel-website
```

3. **Откройте браузер и перейдите на:**
```
http://localhost:8080
```

## 🛠️ Управление контейнером

### Остановка контейнера:
```bash
# С Docker Compose
docker-compose down

# С Docker напрямую
docker stop cyberartel
```

### Перезапуск контейнера:
```bash
# С Docker Compose
docker-compose restart

# С Docker напрямую
docker restart cyberartel
```

### Просмотр логов:
```bash
# С Docker Compose
docker-compose logs -f

# С Docker напрямую
docker logs -f cyberartel
```

### Удаление контейнера:
```bash
# С Docker Compose
docker-compose down -v

# С Docker напрямую
docker stop cyberartel
docker rm cyberartel
docker rmi cyberartel-website
```

## 📁 Структура проекта

```
cyberartel-clone/
├── html/
│   └── index.html          # Главная страница
├── css/
│   └── style.css           # Стили сайта
├── js/
│   └── script.js           # JavaScript и анимации
├── images/                 # Папка для изображений
├── Dockerfile              # Конфигурация Docker образа
├── docker-compose.yml      # Docker Compose конфигурация
├── nginx.conf              # Конфигурация Nginx
└── README.md               # Документация
```

## 🎨 Кастомизация

### Изменение порта

По умолчанию сайт доступен на порту `8080`. Чтобы изменить порт, отредактируйте файл `docker-compose.yml`:

```yaml
ports:
  - "3000:80"  # Изменить 8080 на нужный порт
```

### Изменение контента

1. Отредактируйте файлы в папках `html/`, `css/`, `js/`
2. Пересоберите и перезапустите контейнер:

```bash
docker-compose down
docker-compose up -d --build
```

## 🔍 Технические детали

### Использованные технологии:

- **HTML5** - Структура страницы
- **CSS3** - Стилизация и анимации
- **JavaScript (ES6+)** - Интерактивность
- **Canvas API** - Анимация частиц
- **Nginx Alpine** - Легковесный веб-сервер
- **Docker** - Контейнеризация
- **Docker Compose** - Оркестрация контейнеров

### Производительность:

- **Gzip сжатие** для уменьшения размера файлов
- **Кэширование** статических ресурсов
- **Lazy loading** для изображений
- **Оптимизированные анимации** с использованием requestAnimationFrame

### Безопасность:

- Заголовки безопасности (X-Frame-Options, X-XSS-Protection)
- Минимальный Docker образ (Alpine Linux)
- Изоляция через Docker сети

## 🐛 Устранение неполадок

### Проблема: Порт уже занят

**Решение:** Измените порт в `docker-compose.yml` или остановите процесс, использующий порт 8080:

```bash
# Найти процесс на порту 8080
sudo lsof -i :8080

# Остановить процесс
sudo kill -9 <PID>
```

### Проблема: Контейнер не запускается

**Решение:** Проверьте логи:

```bash
docker-compose logs
```

### Проблема: Изменения не отображаются

**Решение:** Очистите кэш Docker и пересоберите:

```bash
docker-compose down
docker system prune -a
docker-compose up -d --build
```

## 📝 Лицензия

Этот проект создан в образовательных целях как клон сайта cyberartel.ru.

## 👨‍💻 Автор

Создано с помощью Claude AI

## 🔗 Полезные ссылки

- [Документация Docker](https://docs.docker.com/)
- [Документация Nginx](https://nginx.org/ru/docs/)
- [Оригинальный сайт](https://cyberartel.ru/)

---

**Приятного использования! 🎮**
