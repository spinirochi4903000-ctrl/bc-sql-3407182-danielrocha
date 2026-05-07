-- ============================================
-- PROYECTO SEMANAL: Empresa de Jardinería
-- Semana 02 — DDL: Diseño de Esquemas
-- ============================================

-- ============================================
-- LIMPIEZA: eliminar tablas si existen
-- ============================================

DROP TABLE IF EXISTS schedules;
DROP TABLE IF EXISTS workers;
DROP TABLE IF EXISTS clients;

-- ============================================
-- TABLA 1: Clientes
-- ============================================

CREATE TABLE IF NOT EXISTS clients (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name       TEXT    NOT NULL,
    phone           TEXT    NOT NULL UNIQUE,
    address         TEXT    NOT NULL,
    is_active       INTEGER NOT NULL DEFAULT 1,

    CHECK (length(full_name) >= 3)
);

-- ============================================
-- TABLA 2: Trabajadores
-- ============================================

CREATE TABLE IF NOT EXISTS workers (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name       TEXT    NOT NULL,
    specialty       TEXT    NOT NULL,
    salary          REAL    NOT NULL,
    email           TEXT    UNIQUE,
    is_available    INTEGER NOT NULL DEFAULT 1,

    CHECK (salary > 0)
);

-- ============================================
-- TABLA 3: Horarios
-- ============================================

CREATE TABLE IF NOT EXISTS schedules (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    client_id       INTEGER NOT NULL,
    worker_id       INTEGER NOT NULL,
    service_date    DATE    NOT NULL,
    service_time    TEXT    NOT NULL,
    status          TEXT    NOT NULL DEFAULT 'pending',

    CHECK (status IN ('pending', 'completed', 'cancelled')),

    FOREIGN KEY (client_id)
        REFERENCES clients(id),

    FOREIGN KEY (worker_id)
        REFERENCES workers(id)
);

-- ============================================
-- VERIFICACIÓN
-- ============================================

-- .tables

-- PRAGMA table_info(clients);
-- PRAGMA table_info(workers);
-- PRAGMA table_info(schedules);