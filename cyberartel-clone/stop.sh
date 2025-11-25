#!/bin/bash

# CYBER ARTEL - Скрипт остановки
# Остановка и удаление контейнеров

echo "🛑 CYBER ARTEL - Остановка сайта..."
echo ""

# Остановка контейнеров
docker-compose down

echo ""
echo "✅ Контейнеры успешно остановлены!"
echo ""
