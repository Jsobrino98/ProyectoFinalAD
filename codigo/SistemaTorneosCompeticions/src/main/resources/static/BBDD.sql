CREATE DATABASE IF NOT EXISTS CompetenciasDeportivas;
USE CompetenciasDeportivas;

-- Tabla de Torneos
CREATE TABLE torneos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    ubicacion VARCHAR(255)
);

-- Tabla de Equipos
CREATE TABLE equipos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    ciudad VARCHAR(255)
);

-- Relación Muchos a Muchos entre Equipos y Torneos
CREATE TABLE equipo_torneo (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    equipo_id BIGINT,
    torneo_id BIGINT,
    FOREIGN KEY (equipo_id) REFERENCES equipos(id) ON DELETE CASCADE,
    FOREIGN KEY (torneo_id) REFERENCES torneos(id) ON DELETE CASCADE
);

-- Tabla de Jugadores
CREATE TABLE jugadores (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    edad INT,
    posicion VARCHAR(255),
    equipo_id BIGINT,
    FOREIGN KEY (equipo_id) REFERENCES equipos(id) ON DELETE SET NULL
);

-- Tabla de Partidos
CREATE TABLE partidos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    equipo_local_id BIGINT,
    equipo_visitante_id BIGINT,
    torneo_id BIGINT,
    FOREIGN KEY (equipo_local_id) REFERENCES equipos(id) ON DELETE CASCADE,
    FOREIGN KEY (equipo_visitante_id) REFERENCES equipos(id) ON DELETE CASCADE,
    FOREIGN KEY (torneo_id) REFERENCES torneos(id) ON DELETE CASCADE,
    CONSTRAINT chk_equipos_diferentes CHECK (equipo_local_id <> equipo_visitante_id) -- Restricción para evitar que un equipo juegue contra sí mismo
);

-- Tabla de Resultados
CREATE TABLE resultados (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    partido_id BIGINT,
    goles_local INT,
    goles_visitante INT,
    ganador_id BIGINT NULL, -- Nuevo campo para guardar el equipo ganador
    FOREIGN KEY (partido_id) REFERENCES partidos(id) ON DELETE CASCADE,
    FOREIGN KEY (ganador_id) REFERENCES equipos(id) ON DELETE SET NULL
);


-- Añadir columnas para guardar imagenes de los equipos y torneos --
ALTER TABLE equipos ADD COLUMN escudo_url VARCHAR(500);
ALTER TABLE torneos ADD COLUMN logo_url VARCHAR(500);

-- Insertar torneos en la base de datos --
INSERT INTO torneos (nombre, fecha_inicio, fecha_fin, ubicacion, logo_url)
VALUES
('Premier League', '2024-08-01', '2025-05-15', 'Inglaterra', NULL),
('Championship', '2024-08-01', '2025-05-15', 'Inglaterra', NULL),
('Scottish Premiership', '2024-08-01', '2025-05-15', 'Escocia', NULL),
('Bundesliga', '2024-08-10', '2025-05-20', 'Alemania', NULL),
('Serie A', '2024-08-15', '2025-05-25', 'Italia', NULL),
('Ligue 1', '2024-08-05', '2025-05-18', 'Francia', NULL),
('LaLiga', '2024-08-12', '2025-05-22', 'España', NULL),
('Superliga de Grecia', '2024-08-10', '2025-05-20', 'Grecia', NULL),
('Eredivisie', '2024-08-10', '2025-05-20', 'Países Bajos', NULL),
('Jupiler Pro League', '2024-08-10', '2025-05-20', 'Bélgica', NULL),
('Süper Lig', '2024-08-10', '2025-05-20', 'Turquía', NULL),
('Superliga Danesa', '2024-08-10', '2025-05-20', 'Dinamarca', NULL),
('Primeira Liga', '2024-08-10', '2025-05-20', 'Portugal', NULL),
('MLS', '2024-02-25', '2024-12-15', 'Estados Unidos', NULL),
('Allsvenskan', '2024-04-01', '2024-11-15', 'Suecia', NULL),
('Liga MX', '2024-07-20', '2025-05-30', 'México', NULL),
('Brasileirão', '2024-04-15', '2024-12-10', 'Brasil', NULL),
('Liga Premier de Ucrania', '2024-08-10', '2025-05-20', 'Ucrania', NULL),
('Liga Premier de Rusia', '2024-08-10', '2025-05-20', 'Rusia', NULL),
('A-League', '2024-10-01', '2025-05-31', 'Australia', NULL),
('Eliteserien', '2024-04-10', '2024-11-20', 'Noruega', NULL),
('Superliga China', '2024-03-01', '2024-11-30', 'China', NULL),
('Serie B', '2024-08-10', '2025-05-20', 'Italia', NULL),
('Scottish Championship', '2024-08-10', '2025-05-20', 'Escocia', NULL),
('League One', '2024-08-10', '2025-05-20', 'Inglaterra', NULL),
('League Two', '2024-08-10', '2025-05-20', 'Inglaterra', NULL),
('Serie C', '2024-08-10', '2025-05-20', 'Italia', NULL),
('2. Bundesliga', '2024-08-10', '2025-05-20', 'Alemania', NULL),
('LaLiga 2', '2024-08-10', '2025-05-20', 'España', NULL),
('Ligue 2', '2024-08-10', '2025-05-20', 'Francia', NULL),
('Superettan', '2024-04-01', '2024-11-15', 'Suecia', NULL),
('Brasileirão Serie B', '2024-04-15', '2024-12-10', 'Brasil', NULL),
('Liga Profesional Argentina', '2024-07-15', '2025-05-30', 'Argentina', NULL);



-- PARA BUSCAR UN LOGO DE UNA LIGA --
    -- https://cdn.footystats.org/img/competitions/[nombre_de_la_liga].png  --









