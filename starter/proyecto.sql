-- ============================================
-- PROYECTO SEMANAL: Conoce tu Dominio
-- Semana 01 — Introducción a Bases de Datos Relacionales
-- ============================================

-- NOTA PARA EL APRENDIZ:
-- Adapta este esquema al dominio que te fue asignado.
-- Renombra las tablas y columnas según corresponda.
-- Ejemplos:
--   Biblioteca  → books, members, loans
--   Farmacia    → medicines, sales, inventory
--   Gimnasio    → members, routines, attendance
--   Restaurante → dishes, tables, orders

-- ============================================
-- PASO 1: Crear la entidad principal
-- ============================================

-- TODO: Renombrar 'items' según tu dominio (ej: books, medicines, dishes)
-- TODO: Agregar columnas específicas de tu entidad principal
CREATE TABLE services (
    id         INTEGER PRIMARY KEY,
    name        TEXT    NOT NULL,
    price       REAL    NOT NULL,
    time_hours  INTEGER NOT NULL

    -- TODO: Agregar al menos 2 columnas más relevantes para tu dominio
    -- Ejemplos: price REAL, description TEXT, is_active INTEGER DEFAULT 1
);

-- ============================================
-- PASO 2: Crear una segunda entidad
-- ============================================

-- TODO: Renombrar 'entities' según tu dominio (ej: members, clients, users)
-- TODO: Agregar columnas específicas
CREATE TABLE clients (
    id          INTEGER PRIMARY KEY,
    name        TEXT    NOT NULL,
    email       TEXT    NOT NULL UNIQUE,
    phone       TEXT    NOT NULL UNIQUE
    -- TODO: Agregar columnas relevantes
    -- Ejemplos: email TEXT, phone TEXT, created_at TEXT
);

-- ============================================
-- PASO 3: Insertar datos de prueba
-- ============================================

-- TODO: Insertar al menos 5 registros en cada tabla
-- Usa datos realistas relacionados con tu dominio
INSERT INTO services (id, name, price, time_hours) VALUES
    (1, 'Podada de Césped', 50000, 2);
    (2, 'Rocio de Plagas',75000, 3);
    (3, 'Diseño de Paisajismo', 150000, 5);
    (4, 'Mantenimiento de Jardin', 150000, 4);
    (5, 'Instalación de Riego', 200000, 6);

    -- TODO: Agregar más registros

INSERT INTO clients (id, name, email, phone) VALUES
    (1, 'Daniel Rocha', 'A.drc@gmail.com', '3155040012');
    (2, 'Juan Rincon', 'juan.rincon@gmail.com', '314 2182527');
    (3, 'Tomas Martin', 'Lrush@gmail.com', '316 2182527');
    (4, 'Lizabeth Moreno', 'liz@gmail.com', '317 2182527');
    (5, 'Sofia Ramirez', 'sofia.ramirez@gmail.com', '318 2182527');
    -- TODO: Agregar más registros

-- ============================================
-- PASO 4: Consultas SELECT básicas
-- ============================================

-- Mostrar todos los servicios con todas sus columnas
SELECT *
FROM   servicios;

-- Mostrar solo el nombre de los servicios ordenados alfabéticamente
SELECT nombre
FROM   servicios
ORDER BY nombre ASC;

-- Contar cuántos servicios hay en total
SELECT COUNT(*) AS total_servicios
FROM   servicios;