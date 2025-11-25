#!/bin/bash

# IT SALES - Скрипт остановки
# Остановка и удаление контейнеров

echo "🛑 IT SALES - Остановка сайта..."
echo ""

# Остановка контейнеров
docker-compose down

echo ""
echo "✅ Контейнеры успешно остановлены!"
echo ""
