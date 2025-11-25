# Папка для изображений IT SALES

## 📁 Структура изображений

Эта папка содержит все изображения для сайта. Ниже приведены примеры типов изображений, которые вы можете добавить.

## 🎨 Рекомендуемые изображения

### 1. Логотипы (уже созданы)
- `logo.svg` - Логотип сайта

### 2. Изображения компьютеров (классы ПК)
Добавьте фотографии для каждого класса:
- `pc-b-class-1.jpg` (400x400px) - Бюджетная сборка
- `pc-e-class-1.jpg` (400x400px) - Игровая в Full HD
- `pc-s-class-1.jpg` (400x400px) - Топовая сборка
- `pc-x-class-1.jpg` (400x400px) - Профессиональная
- `pc-v-class-1.jpg` (400x400px) - Компактная
- `pc-individual-1.jpg` (400x400px) - Индивидуальная

**Пример имён:**
```
pc-b-class-1.jpg
pc-b-class-2.jpg
pc-e-class-1.jpg
pc-s-class-1.jpg
```

### 3. Портфолио (индивидуальные сборки)
Размер: 800x600px
- `portfolio-cyberpunk.jpg` - Неоновый киберпанк стиль
- `portfolio-minimal.jpg` - Минималистичный дизайн
- `portfolio-ocean.jpg` - Жидкостное охлаждение
- `portfolio-red-dragon.jpg` - Красный дракон
- `portfolio-white-ice.jpg` - Белая ледяная тема

### 4. Блог/Статьи
Размер: 600x400px
- `article-gpu-guide.jpg` - Выбор видеокарты
- `article-cooling.jpg` - Системы охлаждения
- `article-benchmark.jpg` - Тесты производительности

### 5. Иконки услуг
Размер: 128x128px (SVG предпочтительно)
- `icon-customization.svg` - Кастомизация
- `icon-support.svg` - Техподдержка
- `icon-diagnostic.svg` - Диагностика
- `icon-trade-in.svg` - Trade-in
- `icon-upgrade.svg` - Апгрейд
- `icon-recycle.svg` - Утилизация
- `icon-finance.svg` - Рассрочка
- `icon-warranty.svg` - Гарантия

### 6. Компоненты
Размер: 400x300px
- `component-cpu.jpg` - Процессоры
- `component-gpu.jpg` - Видеокарты
- `component-ram.jpg` - Оперативная память
- `component-ssd.jpg` - Накопители
- `component-cooling.jpg` - Охлаждение
- `component-case.jpg` - Корпуса

### 7. Фон
- `hero-bg.svg` (уже создан) - Фон для главного экрана
- `hero-bg-particles.png` - Альтернативный фон

## 📐 Рекомендуемые размеры

| Тип изображения | Размер | Формат |
|----------------|--------|--------|
| Карточки ПК | 400x400px | JPG/PNG |
| Портфолио | 800x600px | JPG/PNG |
| Статьи | 600x400px | JPG/PNG |
| Иконки | 128x128px | SVG/PNG |
| Компоненты | 400x300px | JPG/PNG |
| Фоны | 1920x1080px | JPG/SVG |

## 🎯 Где взять изображения

### Бесплатные стоки:
1. **Unsplash** (https://unsplash.com/)
   - Поиск: "gaming pc", "computer", "rgb pc", "gaming setup"

2. **Pexels** (https://www.pexels.com/)
   - Поиск: "gaming computer", "pc build", "custom pc"

3. **Pixabay** (https://pixabay.com/)
   - Поиск: "computer", "gaming", "technology"

### Поисковые запросы:
- "gaming pc setup"
- "custom pc build"
- "rgb gaming computer"
- "pc case with lights"
- "water cooling pc"
- "minimalist pc build"

## 🛠️ Инструменты для создания

### Создание SVG иконок:
- **Figma** (https://figma.com) - бесплатный онлайн редактор
- **Inkscape** (https://inkscape.org) - бесплатный десктоп редактор
- **SVG Repo** (https://www.svgrepo.com/) - готовые SVG иконки

### Редактирование изображений:
- **GIMP** (https://www.gimp.org/) - бесплатный аналог Photoshop
- **Photopea** (https://www.photopea.com/) - онлайн редактор

## 📝 Как добавить изображения

1. Скачайте нужные изображения
2. Переименуйте их согласно структуре выше
3. Поместите в папку `itsales-clone/images/`
4. Пересоберите Docker образ:
   ```bash
   docker-compose down
   docker-compose up -d --build
   ```

## 🎨 Стиль изображений

Для соответствия дизайну сайта используйте:
- **Цвета:** Черный, красный (#E60606), белый
- **Стиль:** Современный, минималистичный, технологичный
- **Освещение:** RGB подсветка, неоновые акценты
- **Настроение:** Агрессивный, мощный, премиальный

## ✅ Готовые файлы в этой папке

- ✅ `logo.svg` - Логотип IT SALES
- ✅ `pc-class-b.svg` - Заглушка для B-Class
- ✅ `pc-class-s.svg` - Заглушка для S-Class
- ✅ `hero-bg.svg` - Фон для главного экрана
- ✅ `placeholder-pc.jpg` - Универсальная заглушка

---

**Примечание:** Все placeholder файлы (SVG) уже созданы и сайт будет работать. Вы можете заменить их реальными фотографиями для улучшения визуала.
