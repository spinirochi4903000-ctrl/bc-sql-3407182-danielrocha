-- ============================================
-- PROYECTO SEMANAL: DML — Manipulación de Datos
-- Semana 03 — INSERT INTO, UPDATE, DELETE
-- Empresa de jardinería
-- ============================================

DROP TABLE IF EXISTS schedules;
DROP TABLE IF EXISTS workers;
DROP TABLE IF EXISTS clients;


CREATE TABLE clients (
    id              INTEGER PRIMARY KEY,
    full_name       TEXT    NOT NULL,
    phone           TEXT    NOT NULL UNIQUE,
    address         TEXT    NOT NULL,
    is_active       INTEGER NOT NULL DEFAULT 1,

    CHECK (length(full_name) >= 3)
);



CREATE TABLE workers (
    id              INTEGER PRIMARY KEY,
    full_name       TEXT    NOT NULL,
    specialty       TEXT    NOT NULL,
    salary          REAL    NOT NULL,
    email           TEXT    UNIQUE,
    is_available    INTEGER NOT NULL DEFAULT 1,

    CHECK (salary > 0)
);



CREATE TABLE schedules (
    
    
    
    id              INTEGER PRIMARY KEY,
    client_id       INTEGER NOT NULL,
    worker_id       INTEGER NOT NULL,
    service_date    DATE    NOT NULL,
    service_time    TEXT    NOT NULL,
    status          TEXT    NOT NULL DEFAULT 'pending',

    CHECK (status IN ('pending', 'completed', 'cancelled')),

    FOREIGN KEY (client_id) REFERENCES clients(id),
    FOREIGN KEY (worker_id) REFERENCES workers(id)
);


INSERT INTO clients (id, full_name, phone, address, is_active)
VALUES
    (1, 'Juan Perez', '3001111111', 'Calle 10 #15-20', 1),
    (2, 'Maria Lopez', '3002222222', 'Cra 8 #12-34', 1),
    (3, 'Carlos Ruiz', '3003333333', 'Av 5 #9-18', 1),
    (4, 'Ana Torres', '3004444444', 'Calle 22 #7-45', 1),
    (5, 'Luis Gomez', '3005555555', 'Cra 14 #30-12', 0);

INSERT INTO workers (id, full_name, specialty, salary, email, is_available)
VALUES
    (1, 'Pedro Diaz', 'Poda', 1500000, 'pedro@gmail.com', 1),
    (2, 'Laura Castro', 'Riego', 1400000, 'laura@gmail.com', 1),
    (3, 'Andres Vega', 'Paisajismo', 1800000, 'andres@gmail.com', 0),
    (4, 'Sofia Rojas', 'Fumigacion', 1600000, 'sofia@gmail.com', 1),
    (5, 'Diego Mora', 'Mantenimiento', 1450000, 'diego@gmail.com', 1);

INSERT INTO schedules (id, client_id, worker_id, service_date, service_time, status)
VALUES
    (1, 1, 1, '2026-05-10', '08:00', 'pending'),
    (2, 2, 2, '2026-05-11', '09:30', 'completed'),
    (3, 3, 4, '2026-05-12', '10:00', 'pending'),
    (4, 4, 5, '2026-05-13', '14:00', 'cancelled'),
    (5, 5, 3, '2026-05-14', '16:00', 'pending');



-- ============================================
-- PROYECTO SEMANAL: Funciones de Agregación
-- Semana 06 — COUNT, SUM, AVG, GROUP BY, HAVING
-- ============================================

-- ============================================
-- REPORTE 1: Totales globales
-- ============================================

SELECT 
    COUNT(*) AS total_registros,
    SUM(service_date) AS total_horas,
    AVG(service_date) AS promedio_horas
FROM schedules;

-- ============================================
-- REPORTE 2: Extremos
-- ============================================

SELECT 
    MIN(salary) AS menos,
    MAX(salary) AS mayor
FROM workers;

-- ============================================
-- REPORTE 3: Subtotales por categoría (GROUP BY)
-- ============================================

SELECT 
    full_name,
    COUNT(*)    AS total,
    AVG(salary) AS promedio
FROM workers
GROUP BY fullname
ORDER BY total DESC;

-- ============================================
-- REPORTE 4: Filtro de grupos (HAVING)
-- ============================================

SELECT 
    salary,
    COUNT(*) AS total
FROM workers
GROUP BY salary
HAVING COUNT(*) > 1;
