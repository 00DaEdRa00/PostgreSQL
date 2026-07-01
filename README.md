# Культурные дворцы и клубы — Работа с PostgreSQL

*Версия 2201 от 19.06.2026*
## Задание 3.1 — Первичный ключ и последовательность

### Определение уникальной колонки

Гарантированно уникальная колонка — `data.general.id`.


### Проверка уникальности

Подсчёт дубликатов: если результат = 0, все значения уникальны.

```sql
SELECT
    count("data.general.id") - count(DISTINCT "data.general.id") AS duplicates
FROM culture_palaces_clubs;
```

### Создание последовательности (sequence)

```sql
CREATE SEQUENCE IF NOT EXISTS "data.general.id.seq"
    AS INTEGER
    OWNED BY culture_palaces_clubs."data.general.id";
```

### Проверка секвенций

```sql
SELECT * FROM pg_sequences;
```

### Добавление первичного ключа

```sql
ALTER TABLE culture_palaces_clubs
    ADD PRIMARY KEY ("data.general.id");
```

### Удаление строк с NULL перед добавлением PK

```sql
DELETE FROM culture_palaces_clubs
WHERE "data.general.id" IS NULL;
```

---

## Задание 3.2 — Ограничения NOT NULL и UNIQUE

### Уникальные колонки

| Колонка | Ограничение |
|---------|-------------|
| `data.general.id` | UNIQUE |
| `data.general.address.mapPosition` | UNIQUE |

```sql
ALTER TABLE culture_palaces_clubs
    ADD CONSTRAINT unique_id  UNIQUE ("data.general.id"),
    ADD CONSTRAINT unique_map UNIQUE ("data.general.address.mapPosition");
```

### NOT NULL колонки

| Колонка |
|---------|
| `data.general.name` |
| `data.general.locale.name` |
| `data.general.locale.timezone` |
| `data.general.address.fullAddress` |
| `data.general.description` |
| `data.general.category.name` |
| `data.general.organization.name` |

```sql
ALTER TABLE culture_palaces_clubs
    ALTER COLUMN "data.general.name"                SET NOT NULL,
    ALTER COLUMN "data.general.locale.name"         SET NOT NULL,
    ALTER COLUMN "data.general.locale.timezone"     SET NOT NULL,
    ALTER COLUMN "data.general.address.fullAddress" SET NOT NULL,
    ALTER COLUMN "data.general.description"         SET NOT NULL,
    ALTER COLUMN "data.general.category.name"       SET NOT NULL,
    ALTER COLUMN "data.general.organization.name"   SET NOT NULL;
```

---

## Задание 3.3 — Основные запросы

### 3.3.1 — Удаление записей вне Вологодской области

Проверка перед удалением — убедимся, что данные с «Волого» в адресе действительно есть:

```sql
SELECT
    "data.general.address.fullAddress",
    "data.general.organization.locale.name",
    "data.general.organization.address.fullAddress",
    "data.general.organization.subordination.name"
FROM culture_palaces_clubs
WHERE "data.general.address.fullAddress"              LIKE '%Волого%'
   OR "data.general.organization.locale.name"          LIKE '%Волого%'
   OR "data.general.organization.address.fullAddress"  LIKE '%Волого%'
   OR "data.general.organization.subordination.name"   LIKE '%Волого%';
```

Удаление всех записей, не относящихся к Вологодской области:

```sql
DELETE FROM culture_palaces_clubs
WHERE "data.general.address.fullAddress" NOT LIKE '%Волого%';
```

---

### 3.3.2 — Включение PostGIS и создание колонки geom

Проверка / установка расширения PostGIS:

```sql
CREATE EXTENSION IF NOT EXISTS postgis;
```

Создание колонки `geom` типа `geometry(Point, 4326)`:

```sql
ALTER TABLE culture_palaces_clubs
    ADD COLUMN geom geometry(Point, 4326);
```

---

### 3.3.3–3.3.4 — Преобразование координат в геометрию

Перенос данных из `data.general.address.mapPosition` в `geom`:

```sql
UPDATE culture_palaces_clubs
SET geom = ST_SetSRID(
    ST_GeomFromGeoJSON("data.general.address.mapPosition"::text),
    4326
)
WHERE "data.general.address.mapPosition" IS NOT NULL;
```

Проверка результата:

```sql
SELECT geom FROM culture_palaces_clubs;
```

---

### 3.3.5 — Создание таблицы `tags`

```sql
CREATE TABLE tags (
    id       SERIAL       PRIMARY KEY,
    sys_id   INTEGER      NOT NULL UNIQUE,
    name     VARCHAR(255) NOT NULL,
    sys_name VARCHAR(255) NOT NULL
);
```

---

### 3.3.6 — Заполнение таблицы `tags`

Разархивирование JSON-массива (для PostgreSQL 17+):

```sql
SELECT jt.*
FROM culture_palaces_clubs,
     JSON_TABLE(
         "data.general.tags",
         '$[*]' COLUMNS (
             id     INTEGER     PATH '$.id',
             name   VARCHAR(255) PATH '$.name',
             sysName VARCHAR(255) PATH '$.sysName'
         )
     ) AS jt;
```

Вставка уникальных тегов:

```sql
INSERT INTO tags (sys_id, name, sys_name)
SELECT DISTINCT
    jt.id,
    jt.name,
    jt.sysName
FROM culture_palaces_clubs,
     JSON_TABLE(
         "data.general.tags",
         '$[*]' COLUMNS (
             id      INTEGER     PATH '$.id',
             name    VARCHAR(255) PATH '$.name',
             sysName VARCHAR(255) PATH '$.sysName'
         )
     ) AS jt;
```

---

### 3.3.7 — Связь «многие ко многим»

Создание промежуточной таблицы:

```sql
CREATE TABLE m2m_culture_palaces_clubs_tags (
    culture_palaces_clubs_id BIGINT  NOT NULL
        REFERENCES culture_palaces_clubs("data.general.id"),
    tag_sys_id               INTEGER NOT NULL
        REFERENCES tags(sys_id),
    PRIMARY KEY (culture_palaces_clubs_id, tag_sys_id)
);
```

> **`REFERENCES`** — внешний ключ: нельзя вставить ID, которого нет в связанной таблице.
> **`PRIMARY KEY (a, b)`** — составной первичный ключ: гарантирует уникальность пары.

Заполнение промежуточной таблицы:

```sql
INSERT INTO m2m_culture_palaces_clubs_tags
    (culture_palaces_clubs_id, tag_sys_id)
SELECT DISTINCT
    cpc."data.general.id",
    jt.id
FROM culture_palaces_clubs cpc,
     JSON_TABLE(
         "data.general.tags",
         '$[*]' COLUMNS (
             id INTEGER PATH '$.id'
         )
     ) AS jt;
```

---

### 3.3.8 — Индексы

```sql
CREATE INDEX idx_m2m_tag_sys_id
    ON m2m_culture_palaces_clubs_tags (tag_sys_id);
```
