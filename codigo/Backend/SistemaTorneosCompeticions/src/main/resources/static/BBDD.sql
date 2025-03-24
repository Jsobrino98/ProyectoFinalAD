CREATE DATABASE IF NOT EXISTS CompetenciasDeportivas;
USE CompetenciasDeportivas;

-- Tabla de Torneos
CREATE TABLE torneos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    ubicacion VARCHAR(255),
    logo_competicion VARCHAR(255)  -- Logo de la competición
);

-- Tabla de Equipos
CREATE TABLE equipos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    ciudad VARCHAR(255),
    escudo_url VARCHAR(255),
    torneo_id BIGINT,                  -- Relación con un torneo específico
    competicion_secundaria_id BIGINT,    -- Relación con competición secundaria, si aplica
    FOREIGN KEY (torneo_id) REFERENCES torneos(id) ON DELETE SET NULL,
    FOREIGN KEY (competicion_secundaria_id) REFERENCES torneos(id) ON DELETE SET NULL
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
    FOREIGN KEY (torneo_id) REFERENCES torneos(id) ON DELETE CASCADE
);

-- Tabla de Usuarios
CREATE TABLE usuario (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nombre_completo VARCHAR(255),
    email VARCHAR(255) NOT NULL UNIQUE,
    rol ENUM('ADMIN', 'NORMAL') NOT NULL  -- Role: ADMIN or NORMAL
);
-- Tabla de equipo_torneo (Relación Muchos a Muchos entre Equipos y Torneos)
CREATE TABLE equipo_torneo (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    equipo_id BIGINT,
    torneo_id BIGINT,
    FOREIGN KEY (equipo_id) REFERENCES equipos(id) ON DELETE CASCADE,
    FOREIGN KEY (torneo_id) REFERENCES torneos(id) ON DELETE CASCADE
);

CREATE TABLE balonOro (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,  -- El año del Balón de Oro será la clave primaria
    nombre VARCHAR(255) NOT NULL,
    edad INT,
    posicion VARCHAR(255),
    equipo_id BIGINT,
    fotoJugador VARCHAR(255),  -- URL o ruta de la imagen del jugador
    FOREIGN KEY (equipo_id) REFERENCES equipos(id) ON DELETE SET NULL
);

-- SCRIPT LIGAS --
INSERT INTO torneos (id, nombre, fecha_inicio, fecha_fin, ubicacion, logo_competicion) VALUES
(1, 'Premier League', '2024-08-01', '2025-05-15', 'Inglaterra', 'https://paladarnegro.net/escudoteca/ligas/ligas/img/inglaterra.jpg'),
(2, 'Championship', '2024-08-01', '2025-05-15', 'Inglaterra', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi1bk0O8YLTBWWxw7VhEt1EfVuD5x0T82VwElx-a1RZ2bEpEKfbmYFQi_byHriYeVilszvBoS_9I3ERvhakAGIrDQO6IaavhuC1UipS5prP36qLGVZE4vpTJ4VSQhm6y-nnmt9eq-ld4w/s320/Sky+Bet+Championship.png'),
(3, 'Scottish Premiership', '2024-08-01', '2025-05-15', 'Escocia', 'https://paladarnegro.net/escudoteca/ligas/ligas/img/escocia.jpg'),
(4, 'Bundesliga', '2024-08-10', '2025-05-20', 'Alemania', 'https://paladarnegro.net/escudoteca/ligas/ligas/img/alemania.jpg'),
(5, 'Serie A', '2024-08-15', '2025-05-25', 'Italia', 'https://paladarnegro.net/escudoteca/ligas/ligas/img/italia.jpg'),
(6, 'Ligue 1', '2024-08-05', '2025-05-18', 'Francia', 'https://paladarnegro.net/escudoteca/ligas/ligas/img/francia.jpg'),
(7, 'LaLiga', '2024-08-12', '2025-05-22', 'España', 'https://assets.laliga.com/assets/public/logospage/pressroom/laliga/LL_RGB_h_color.png'),
(8, 'Superliga de Grecia', '2024-08-10', '2025-05-20', 'Grecia', 'https://paladarnegro.net/escudoteca/ligas/ligas/img/grecia.jpg'),
(9, 'Eredivisie', '2024-08-10', '2025-05-20', 'Países Bajos', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiKqzMnnQcAUxCzd0w-5EN-zW0U6Hv5exyzxaXulWT2ASKYYnvXJwfZa3Cm7C6j4COnnrG2hd31pvQsPsub_nyFaWwXYEVx93rjOTOOa3G19WJdootTABUhlnHTj_sGpJBbTxsrtXl4-A/s320/Eredivisie+v2.png'),
(10, 'Jupiler Pro League', '2024-08-10', '2025-05-20', 'Bélgica', 'https://paladarnegro.net/escudoteca/ligas/ligas/img/belgica.jpg'),
(11, 'Süper Lig', '2024-08-10', '2025-05-20', 'Turquía', 'https://paladarnegro.net/escudoteca/ligas/ligas/img/turquia.jpg'),
(12, 'Superliga Danesa', '2024-08-10', '2025-05-20', 'Dinamarca', 'https://1000marcas.net/wp-content/uploads/2020/03/logo-Danish-Superliga-640x360.png'),
(13, 'Primeira Liga', '2024-08-10', '2025-05-20', 'Portugal', 'https://paladarnegro.net/escudoteca/ligas/ligas/img/portugal.jpg'),
(14, 'MLS', '2024-02-25', '2024-12-15', 'Estados Unidos', 'https://paladarnegro.net/escudoteca/ligas/ligas/img/estadosunidos.jpg'),
(15, 'Allsvenskan', '2024-04-01', '2024-11-15', 'Suecia', 'https://paladarnegro.net/escudoteca/ligas/ligas/img/suecia.jpg'),
(16, 'Liga MX', '2024-07-20', '2025-05-30', 'México', 'https://paladarnegro.net/escudoteca/ligas/ligas/img/mexico.jpg'),
(17, 'Brasileirão', '2024-04-15', '2024-12-10', 'Brasil', 'https://paladarnegro.net/escudoteca/ligas/ligas/img/brasil.jpg'),
(18, 'Liga Premier de Ucrania', '2024-08-10', '2025-05-20', 'Ucrania', 'https://upl.ua/images/logo-horizontal-en.png'),
(19, 'Liga Premier de Rusia', '2024-08-10', '2025-05-20', 'Rusia', 'https://paladarnegro.net/escudoteca/ligas/ligas/img/rusia.jpg'),
(20, 'A-League', '2024-10-01', '2025-05-31', 'Australia', 'https://paladarnegro.net/escudoteca/ligas/ligas/img/australia.jpg'),
(21, 'Eliteserien', '2024-04-10', '2024-11-20', 'Noruega', 'https://www.eliteserien.no/_/asset/no.seeds.app.football:0000019494ae4320/img/elite_header.svg'),
(29, 'LaLiga 2', '2024-08-10', '2025-05-20', 'España', 'https://assets.laliga.com/assets/public/logospage/pressroom/laliga/LALIGA_HYPERMOTION_RGB_h_color.png'),
(40, 'UEFA Champions League', '2024-06-25', '2025-06-01', 'Europa', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhyt2VQGXlYN9FWhc07l5Qc8h4NO1w0Nsmk5hBtuh2AqSQ4LEFMEyLTJQacA-Jiz8baIGRXjtRVpGm-myVOSPbh4zWrJUSZKznmWCe68o21EkkfP_88F2eWaheroWE7r1nxkfw0RLGDpw/s320/UEFA+Champions+League.png'),
(39, 'UEFA Europa League', '2024-07-11', '2025-05-21', 'Europa', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhmpxWM5nRaZgTyXzN4VI653s21kXq7TBMSUdFPBP3bL5HRc7uiPDcdtY6xC6OmqFYYaJYPqEUysMKTsV-uGClg5fFWKH0i0tUg0VlGe8IsMqcy9NIHEXYl5dJt84ADGG4yqF3-LWvZ7g/s320/UEFA+Europa+League.png'),
(38, 'UEFA Europa Conference League', '2024-07-11', '2025-05-28', 'Europa', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/UEFA_Conference_League_full_logo_%282024_version%29.svg/605px-UEFA_Conference_League_full_logo_%282024_version%29.svg.png');
;



SET FOREIGN_KEY_CHECKS = 0;

-- SCRIPT CON TODOS LOS EQUIPOS --

INSERT INTO equipos (id, nombre, ciudad, torneo_id, escudo_url, competicion_secundaria_id) VALUES
-- PREMIER --
(1, 'Arsenal', 'Londres', 1, 'https://resources.premierleague.com/premierleague/badges/50/t3@x2.png', 40),
(2, 'Manchester City', 'Manchester', 1, 'https://resources.premierleague.com/premierleague/badges/50/t43@x2.png', 40),
(3, 'Manchester United', 'Manchester', 1, 'https://resources.premierleague.com/premierleague/badges/50/t1@x2.png', null),
(4, 'Chelsea', 'Londres', 1, 'https://resources.premierleague.com/premierleague/badges/50/t8@x2.png', null),
(5, 'Liverpool', 'Liverpool', 1, 'https://resources.premierleague.com/premierleague/badges/50/t14@x2.png', 40),
(6, 'Tottenham Hotspur', 'Londres', 1, 'https://resources.premierleague.com/premierleague/badges/50/t6@x2.png', null),
(7, 'Newcastle United', 'Newcastle', 1, 'https://resources.premierleague.com/premierleague/badges/50/t4@x2.png', null),
(8, 'Aston Villa', 'Birmingham', 1, 'https://resources.premierleague.com/premierleague/badges/50/t7@x2.png', 40),
(9, 'West Ham United', 'Londres', 1, 'https://resources.premierleague.com/premierleague/badges/50/t21@x2.png', null),
(10, 'Brighton & Hove Albion', 'Brighton', 1, 'https://resources.premierleague.com/premierleague/badges/50/t36@x2.png', null),
(11, 'Brentford', 'Londres', 1, 'https://resources.premierleague.com/premierleague/badges/50/t94@x2.png', null),
(12, 'Crystal Palace', 'Londres', 1, 'https://resources.premierleague.com/premierleague/badges/50/t31@x2.png', null),
(13, 'Fulham', 'Londres', 1, 'https://resources.premierleague.com/premierleague/badges/50/t54@x2.png', null),
(14, 'Wolverhampton Wanderers', 'Wolverhampton', 1, 'https://resources.premierleague.com/premierleague/badges/50/t39@x2.png', null),
(15, 'Nottingham Forest', 'Nottingham', 1, 'https://resources.premierleague.com/premierleague/badges/50/t17@x2.png', null),
(16, 'Everton', 'Liverpool', 1, 'https://resources.premierleague.com/premierleague/badges/50/t11@x2.png', null),
(17, 'Burnley', 'Burnley', 1, 'https://resources.premierleague.com/premierleague/badges/50/t90@x2.png', null),
(18, 'Sheffield United', 'Sheffield', 1, 'https://resources.premierleague.com/premierleague/badges/50/t49@x2.png', null),
(19, 'Luton Town', 'Luton', 1, 'https://resources.premierleague.com/premierleague/badges/50/t102@x2.png', null),
(20, 'Bournemouth', 'Bournemouth', 1, 'https://resources.premierleague.com/premierleague/badges/50/t91@x2.png', null),
-- LIGUE 1 --
(61, 'Paris Saint-Germain', 'París', 6, 'https://upload.wikimedia.org/wikipedia/en/a/a7/Paris_Saint-Germain_F.C..svg',40),
(62, 'Olympique de Marseille', 'Marsella', 6, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/338.png',null),
(63, 'OGC Nice', 'Niza', 6, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/118.png',null),
(64, 'AS Monaco', 'Mónaco', 6, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/197.png',40),
(65, 'LOSC Lille', 'Lille', 6, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/124.png',40),
(66, 'Olympique Lyonnais', 'Lyon', 6, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/106.png',null),
(67, 'RC Lens', 'Lens', 6, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/120.png',null),
(68, 'Stade Brestois 29', 'Brest', 6, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/104.png',40),
(69, 'RC Strasbourg Alsace', 'Estrasburgo', 6, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/119.png',null),
(70, 'Toulouse FC', 'Toulouse', 6, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/350.png',null),
(71, 'AJ Auxerre', 'Auxerre', 6, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/105.png',null),
(72, 'Stade Rennais FC', 'Rennes', 6, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/123.png',null),
(73, 'Angers SCO', 'Angers', 6, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4241.png',null),
(74, 'Stade de Reims', 'Reims', 6, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/1496.png',null),
(75, 'FC Nantes', 'Nantes', 6, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/134.png',null),
(76, 'AS Saint-Étienne', 'Saint-Étienne', 6, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/473.png',null),
(77, 'Le Havre AC', 'Le Havre', 6, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/479.png',null),
(78, 'Montpellier HSC', 'Montpellier', 6, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/480.png',null),
-- SERIE A --
(41, 'Nápoles', 'Nápoles', 5, 'https://img.legaseriea.it/vimages/6681d23a/Napoli.png?webp&q=70&size=210x-', null),
(42, 'Juventus', 'Turín', 5, 'https://img.legaseriea.it/vimages/62cfda28/colore=BLACK.png?webp&q=70&size=210x-', 40),
(43, 'Inter de Milán', 'Milán', 5, 'https://img.legaseriea.it/vimages/62cef496/inter.png?webp&q=70&size=210x-', 40),
(44, 'AC Milan', 'Milán', 5, 'https://img.legaseriea.it/vimages/62cef513/milan.png?webp&q=70&size=210x-', 40),
(45, 'AS Roma', 'Roma', 5, 'https://img.legaseriea.it/vimages/62cfd5ce/roma.png?webp&q=70&size=210x-', null),
(46, 'Lazio', 'Roma', 5, 'https://img.legaseriea.it/vimages/62cef4d5/lazio.png?webp&q=70&size=210x-', null),
(47, 'Atalanta', 'Bérgamo', 5, 'https://img.legaseriea.it/vimages/62cfd69d/atalanta.png?webp&q=70&size=130.5x-', 40),
(48, 'Fiorentina', 'Florencia', 5, 'https://img.legaseriea.it/vimages/62cef452/fiorentina.png?webp&q=70&size=210x-', null),
(49, 'Bologna', 'Bolonia', 5, 'https://img.legaseriea.it/vimages/62cef3f6/bologna.png?webp&q=70&size=130.5x-', 40),
(50, 'Torino', 'Turín', 5, 'https://img.legaseriea.it/vimages/62cef5cb/torino.png?webp&q=70&size=204x-', null),
(51, 'Sampdoria', 'Génova', 5, 'https://d5rzfs5ck83rq.cloudfront.net/legab.it/img/club/loghi/sampdoria.png', null),
(52, 'Lecce', 'Lecce', 5, 'https://img.legaseriea.it/vimages/62cef4f6/lecce.png?webp&q=70&size=130.5x-', null),
(53, 'Udinese', 'Udine', 5, 'https://img.legaseriea.it/vimages/62cef5e9/udinese.png?webp&q=70&size=210x-', null),
(54, 'Monza', 'Monza', 5, 'https://img.legaseriea.it/vimages/62c6acbd/monza.png?webp&q=70&size=210x-', null),
(55, 'Empoli', 'Empoli', 5, 'https://img.legaseriea.it/vimages/62cef42e/empoli.png?webp&q=70&size=210x-', null),
(56, 'Sassuolo', 'Reggio Emilia', 5, 'https://d5rzfs5ck83rq.cloudfront.net/legab.it/img/club/loghi/sassuolo.png', null),
(57, 'Salernitana', 'Salerno', 5, 'https://d5rzfs5ck83rq.cloudfront.net/legab.it/img/club/loghi/salernitana.png', null),
(58, 'Cagliari', 'Cagliari', 5, 'https://img.legaseriea.it/vimages/62cfd202/cagliari.png?webp&q=70&size=210x-', null),
(59, 'Verona', 'Verona', 5, 'https://img.legaseriea.it/vimages/62cfe8b8/colore=BLUE.png?webp&q=70&size=210x-', null),
(60, 'Frosinone', 'Frosinone', 5, 'https://d5rzfs5ck83rq.cloudfront.net/legab.it/img/club/loghi/frosinone.png', null),

-- LA LIGA --
(21, 'Athletic Club', 'Bilbao', 7, 'https://assets.laliga.com/assets/2019/06/07/xsmall/athletic.png', NULL),
(22, 'Atlético de Madrid', 'Madrid', 7, 'https://d2bk74em32frqb.cloudfront.net/assets/2024/06/17/xsmall/cbc5c8cc8c3e8abd0e175c00ee53b723.png', 40),
(23, 'CA Osasuna', 'Pamplona', 7, 'https://d2bk74em32frqb.cloudfront.net/assets/2019/06/07/xsmall/osasuna.png', NULL),
(24, 'CD Leganés', 'Leganés', 7, 'https://d2bk74em32frqb.cloudfront.net/assets/2019/06/07/xsmall/leganes.png', NULL),
(25, 'Deportivo Alavés', 'Vitoria-Gasteiz', 7, 'https://d2bk74em32frqb.cloudfront.net/assets/2020/09/01/xsmall/27002754a98bf535807fe49a24cc63ea.png', NULL),
(26, 'FC Barcelona', 'Barcelona', 7, 'https://assets.laliga.com/assets/2019/06/07/xsmall/barcelona.png', 40),
(27, 'Getafe CF', 'Getafe', 7, 'https://assets.laliga.com/assets/2023/05/12/xsmall/dc59645c96bc2c9010341c16dd6d4bfa.png', NULL),
(28, 'Girona FC', 'Girona', 7, 'https://assets.laliga.com/assets/2022/06/22/xsmall/8f43addbb29e4a72f5e90b6edfe4728f.png', 40),
(29, 'Rayo Vallecano', 'Madrid', 7, 'https://assets.laliga.com/assets/2023/04/27/xsmall/57d9950a8745ead226c04d37235c0786.png', NULL),
(30, 'RC Celta', 'Vigo', 7, 'https://d2bk74em32frqb.cloudfront.net/assets/2019/06/07/xsmall/celta.png', NULL),
(31, 'RCD Espanyol de Barcelona', 'Cornellà de Llobregat', 7, 'https://d2bk74em32frqb.cloudfront.net/assets/2019/06/07/xsmall/espanyol.png', NULL),
(32, 'RCD Mallorca', 'Palma de Mallorca', 7, 'https://assets.laliga.com/assets/2023/03/22/xsmall/013ae97735bc8e519dcf30f6826168ca.png', NULL),
(33, 'Real Betis', 'Sevilla', 7, 'https://assets.laliga.com/assets/2022/09/15/xsmall/e4a09419d3bd115b8f3dab73d480e146.png', NULL),
(34, 'Real Madrid', 'Madrid', 7, 'https://assets.laliga.com/assets/2019/06/07/xsmall/real-madrid.png', 40),
(35, 'Real Sociedad', 'San Sebastián', 7, 'https://assets.laliga.com/assets/2019/06/07/xsmall/real-sociedad.png', NULL),
(36, 'Real Valladolid CF', 'Valladolid', 7, 'https://assets.laliga.com/assets/2024/06/17/xsmall/1467dcd5efb813a742d86f8eb39504a3.png', NULL),
(37, 'Sevilla FC', 'Sevilla', 7, 'https://assets.laliga.com/assets/2019/06/07/xsmall/sevilla.png', NULL),
(38, 'UD Las Palmas', 'Las Palmas de Gran Canaria', 7, 'https://assets.laliga.com/assets/2019/06/07/xsmall/las-palmas.png', NULL),
(39, 'Valencia CF', 'Valencia', 7, 'https://assets.laliga.com/assets/2019/06/07/xsmall/valencia.png', NULL),
(40, 'Villarreal CF', 'Villarreal', 7, 'https://assets.laliga.com/assets/2019/06/07/xsmall/villarreal.png', NULL),

-- BUNDESLIGA --
(79, 'FC Bayern München', 'Múnich', 4, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/170.png', 40),
(80, 'Bayer 04 Leverkusen', 'Leverkusen', 4, 'https://upload.wikimedia.org/wikipedia/en/5/59/Bayer_04_Leverkusen_logo.svg', 40),
(81, 'Eintracht Frankfurt', 'Fráncfort', 4, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/469.png', NULL),
(82, 'VfB Stuttgart', 'Stuttgart', 4, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/86.png', 40),
(83, 'RB Leipzig', 'Leipzig', 4, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4281.png', 40),
(84, '1. FSV Mainz 05', 'Maguncia', 4, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/1674.png', NULL),
(85, 'VfL Wolfsburg', 'Wolfsburgo', 4, 'https://upload.wikimedia.org/wikipedia/commons/f/f3/Logo-VfL-Wolfsburg.svg', NULL),
(86, 'SC Freiburg', 'Friburgo', 4, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/467.png', NULL),
(87, 'SV Werder Bremen', 'Bremen', 4, 'https://upload.wikimedia.org/wikipedia/commons/b/be/SV-Werder-Bremen-Logo.svg', NULL),
(88, 'Borussia Dortmund', 'Dortmund', 4, 'https://upload.wikimedia.org/wikipedia/commons/6/67/Borussia_Dortmund_logo.svg', 40),
(89, 'Borussia Mönchengladbach', 'Mönchengladbach', 4, 'https://upload.wikimedia.org/wikipedia/commons/8/81/Borussia_Mönchengladbach_logo.svg', NULL),
(90, 'FC Augsburg', 'Augsburgo', 4, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/3679.png', NULL),
(91, '1. FC Union Berlin', 'Berlín', 4, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/1287.png', NULL),
(92, 'FC St. Pauli', 'Hamburgo', 4, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/553.png', NULL),
(93, 'TSG 1899 Hoffenheim', 'Sinsheim', 4, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/2892.png', NULL),
(94, '1. FC Heidenheim', 'Heidenheim', 4, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/5964.png', NULL),
(95, 'Holstein Kiel', 'Kiel', 4, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/2373.png', NULL),
(96, 'VfL Bochum', 'Bochum', 4, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/247.png', NULL),

-- LA LIGA 2 --
(121, 'R. Racing Club', 'Santander', 29, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/15.png', NULL),
(122, 'SD Huesca', 'Huesca', 29, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/864.png', NULL),
(123, 'Elche CF', 'Elche', 29, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/121.png', NULL),
(124, 'CD Mirandés', 'Miranda de Ebro', 29, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/843.png', NULL),
(125, 'Real Oviedo', 'Oviedo', 29, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/14.png', NULL),
(126, 'UD Almería', 'Almería', 29, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/85.png', NULL),
(127, 'Levante UD', 'Valencia', 29, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/136.png', NULL),
(128, 'Granada CF', 'Granada', 29, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/347.png', NULL),
(129, 'Real Sporting', 'Gijón', 29, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/76.png', NULL),
(130, 'RC Deportivo', 'La Coruña', 29, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/7.png', NULL),
(131, 'Real Zaragoza', 'Zaragoza', 29, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/20.png', NULL),
(132, 'Cádiz CF', 'Cádiz', 29, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/91.png', NULL),
(133, 'Albacete BP', 'Albacete', 29, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/103.png', NULL),
(134, 'SD Eibar', 'Eibar', 29, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/108.png', NULL),
(135, 'Córdoba CF', 'Córdoba', 29, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/342.png', NULL),
(136, 'Málaga CF', 'Málaga', 29, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/10.png', NULL),
(137, 'CD Castellón', 'Castellón de la Plana', 29, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/122.png', NULL),
(138, 'Burgos CF', 'Burgos', 29, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/261.png', NULL),
(139, 'CD Eldense', 'Elda', 29, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/672.png', NULL),
(140, 'Racing Club Ferrol', 'Ferrol', 29, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/92.png', NULL),
(141, 'CD Tenerife', 'Santa Cruz de Tenerife', 29, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/162.png', NULL),
(142, 'FC Cartagena', 'Cartagena', 29, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/404.png', NULL),

-- LIGA NORUEGA --
(143, 'Bodø/Glimt', 'Bodø', 21, 'https://www.glimt.no/_/asset/no.seeds.app.football:00000194b2525600/img/logo/bod/logo.png', NULL),
(144, 'Brann', 'Bergen', 21, 'https://www.eliteserien.no/klubbene/_/image/85a189b6-e6b0-49c9-a767-62a4c7dad0c1:821be56583626c06c70949c04bc85e1d8d297651/height-300/brann.jpg', NULL),
(145, 'Bryne FK', 'Bryne', 21, 'https://www.eliteserien.no/klubbene/_/image/4cde210f-8a09-40b1-a76b-edcd68fee0a6:0e0e12e3c7bf6468857e654c00b889fc3a8adb76/height-300/Bryne.png', NULL),
(146, 'Fredrikstad FK', 'Fredrikstad', 21, 'https://www.eliteserien.no/klubbene/_/image/4766981e-9bbc-40db-8fe5-7b633e62bf52:74fb92e49eef49f68328f9bb991b695de35a1416/height-300/FFK%20Logo.jpg', NULL),
(147, 'HamKam', 'Hamar', 21, 'https://www.eliteserien.no/klubbene/_/image/f9d8e793-4f64-465b-8077-30a21513f227:06c89d0a3a9b4eb552ccaa696d7e25abb2306d1f/height-300/Hamkam%20logo%20farger.png', NULL),
(148, 'Haugesund', 'Haugesund', 21, 'https://www.eliteserien.no/klubbene/_/image/ccbdb0b3-4a81-4f04-9e84-a614903493fa:d279c0a696f5af29a70b1650eaa750977f7864ac/height-300/FKH_hoved_RGB.svg', NULL),
(149, 'KFUM Oslo', 'Oslo', 21, 'https://www.eliteserien.no/klubbene/kristiansund.gif', NULL),
(150, 'Kristiansund BK', 'Kristiansund', 21, 'https://www.eliteserien.no/klubbene/_/image/cdbc05bd-265f-4508-b2f9-d07093f04d07:e89407ce7e6d742f14a7bc6f7db5dfaec77846e3/height-300/KFUM.png', NULL),
(151, 'Molde FK', 'Molde', 21, 'https://www.eliteserien.no/klubbene/_/image/2a5597c2-a8b8-41df-b376-f5ae58e4a51e:a53e7e1c76d66d221efc180c5a2e2fd9cb037755/height-300/Molde.jpg', NULL),
(152, 'Rosenborg BK', 'Trondheim', 21, 'https://www.eliteserien.no/klubbene/_/image/ee847d17-0d59-42fe-b990-6832786dd363:bff439a6e67a9c57a36e872ee2dbe6770910bb1e/height-300/RBK-logo.png', NULL),
(153, 'Sarpsborg 08', 'Sarpsborg', 21, 'https://www.eliteserien.no/klubbene/_/image/5359d499-9736-40c1-a490-344d9b70aa85:041cf57554f238d16fcfe91d08ace3395287a962/height-300/Sandefjord.svg', NULL),
(154, 'Stabæk', 'Bekkestua', 21, 'https://www.eliteserien.no/klubbene/_/image/590dfe5a-28c4-4533-82f7-df1dc25bd810:ca8587a5b5a86b88df855155c31eec5699974d46/height-300/Sarpsborg_08_logo.png', NULL),
(155, 'Strømsgodset', 'Drammen', 21, 'https://www.eliteserien.no/klubbene/_/image/1ff07bfb-13d5-4caf-8428-36ac65f56500:5ecbcd9d19e9c1e2f291acc2f3378771052092da/height-300/Stromsgodset%20ny.jpg', NULL),
(156, 'Tromsø IL', 'Tromsø', 21, 'https://www.eliteserien.no/klubbene/_/image/0020623a-fcfe-4060-9ec8-ab14a9cc88bd:2de82e23695164cbe449592d71e8167b58f70f9d/height-300/TIL-gold_RGB.png', NULL),
(157, 'Viking FK', 'Stavanger', 21, 'https://www.eliteserien.no/klubbene/_/image/6b12c7da-b3e1-442e-96af-fdaa29be1afd:146b388e0a9be3439d662f22fb76a07bfc039f8d/height-300/Viking_Logo_RGB.png', NULL),
(158, 'Vålerenga', 'Oslo', 21, 'https://www.eliteserien.no/klubbene/_/image/ed0967ed-c835-4ef2-b19f-10ca95f79b43:dadd8b0dfacbb5b400cb0b285f16a602dcbeb866/height-300/V%C3%A5lerenga.svg', NULL),

-- LIGA ESCOCESA --
(159, 'Aberdeen FC', 'Aberdeen', 3, 'https://spfl.co.uk/cms-content/images/shares/crests/Aberdeen_150x150.jpg', NULL),
(160, 'Celtic FC', 'Glasgow', 3, 'https://spfl.co.uk/cms-content/images/shares/crests/Celtic%20FC_Primary%20Crest_RGB.png', 40),
(161, 'Dundee FC', 'Dundee', 3, 'https://spfl.co.uk/cms-content/images/shares/crests/Dundee%202024.png', NULL),
(162, 'Dundee United FC', 'Dundee', 3, 'https://spfl.co.uk/cms-content/images/shares/crests/DUFC_Crest-2021_RGB.png', NULL),
(163, 'Heart of Midlothian FC', 'Edimburgo', 3, 'https://spfl.co.uk/cms-content/images/shares/crests/HMFC%20Crest%20Full%20Colour%202023.jpg', NULL),
(164, 'Hibernian FC', 'Edimburgo', 3, 'https://spfl.co.uk/cms-content/images/shares/crests/RGB-HIBS%20CREST.png', NULL),
(165, 'Kilmarnock FC', 'Kilmarnock', 3, 'https://spfl.co.uk/cms-content/images/shares/crests/Killie%20Website.png', NULL),
(166, 'Motherwell FC', 'Motherwell', 3, 'https://spfl.co.uk/cms-content/images/shares/crests/Motherwell%20FC%20badge%202021.png', NULL),
(167, 'Rangers FC', 'Glasgow', 3, 'https://spfl.co.uk/cms-content/images/shares/crests/150%20150%20Rangers.png', NULL),
(168, 'Ross County FC', 'Dingwall', 3, 'https://spfl.co.uk/cms-content/images/shares/crests/Ross-County_150x150.jpg', NULL),
(169, 'St Johnstone FC', 'Perth', 3, 'https://spfl.co.uk/cms-content/images/shares/crests/St.%20Johnstone.png', NULL),
(170, 'St Mirren FC', 'Paisley', 3, 'https://spfl.co.uk/cms-content/images/shares/crests/St%20Mirren%20Crest%202023.jpg', NULL),

-- CHAMPIONS LEAGUE --

(171, 'RB Salzburgo', 'Salzburgo', 34, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/50030.png', 40),
(172, 'Sturm Graz', 'Graz', 34, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/50111.png', 40),
(173, 'Dinamo Zagreb', 'Zagreb', 34, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/50164.png', 40),
(174, 'Sparta de Praga', 'Praga', 34, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/50033.png', 40),
(175, 'Estrella Roja', 'Belgrado', 34, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/50069.png', 40),
(176, 'Slovan Bratislava', 'Bratislava', 34, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/52797.png', 40),
(177, 'Young Boys', 'Berna', 34, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/50031.png', 40),

(178, 'RFS', 'Riga', 34, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/2609104.png', 40),
(179, 'Slavia Praga', 'Praga', 34, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/52498.png', 40),
(180, 'Lugano', 'Lugano', 34, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/8538.png', 40),
(181, 'Viktoria Plzeň', 'Plzeň', 34, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/64388.png', 40),
(182, 'Ludogorets', 'Razgrad', 34, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/2603104.png', 40),
(183, 'APOEL', 'Nicosia', 34, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/50118.png', 40),

-- CHAMPIONSHIP --

(184, 'Blackburn Rovers', 'Blackburn', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/365.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(185, 'Bristol City', 'Bristol', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/333.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(186, 'Burnley', 'Burnley', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/379.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(187, 'Cardiff City', 'Cardiff', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/347.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(188, 'Coventry City', 'Coventry', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/388.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(189, 'Derby County', 'Derby', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/374.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(190, 'Hull City', 'Hull', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/306.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(191, 'Leeds United', 'Leeds', 2, "https://assets-es.imgfoot.com/media/cache/150x150/club/leeds-united.png", NULL),
(192, 'Luton Town', 'Luton', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/301.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(193, 'Middlesbrough', 'Middlesbrough', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/369.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(194, 'Millwall', 'Londres', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/391.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(195, 'Norwich City', 'Norwich', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/381.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(196, 'Oxford United', 'Oxford', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/311.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(197, 'Plymouth Argyle', 'Plymouth', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/307.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(198, 'Portsmouth', 'Portsmouth', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/385.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(199, 'Preston North End', 'Preston', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/394.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(200, 'Queens Park Rangers', 'Londres', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/334.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(201, 'Sheffield United', 'Sheffield', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/398.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(202, 'Sheffield Wednesday', 'Sheffield', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/399.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(203, 'Stoke City', 'Stoke-on-Trent', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/336.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(204, 'Sunderland', 'Sunderland', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/366.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(205, 'Swansea City', 'Swansea', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/318.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(206, 'Watford', 'Watford', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/395.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(207, 'West Bromwich Albion', 'West Bromwich', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/383.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),

-- SUPERLIGA GRIEGA --

(208, 'AEK Atenas', 'Atenas', 8, 'https://www.slgr.gr/img/uploads/big/156284491142.png', 40),
(209, 'Aris Salónica', 'Salónica', 8, 'https://www.slgr.gr/img/uploads/big/153009594452.png', NULL),
(210, 'Asteras Tripolis', 'Trípoli', 8, 'https://www.slgr.gr/img/uploads/big/17207032014.png', NULL),
(211, 'Atromitos', 'Atenas', 8, 'https://www.slgr.gr/img/uploads/big/137355275659.png', NULL),
(212, 'Kallithea', 'Atenas', 8, 'https://www.slgr.gr/img/uploads/big/171982790863.png', NULL),
(213, 'Lamia', 'Lamia', 8, 'https://www.slgr.gr/img/uploads/big/149977153979.png', NULL),
(214, 'Levadiakos', 'Levadia', 8, 'https://www.slgr.gr/img/uploads/big/126376876379.png', NULL),
(215, 'OFI Creta', 'Heraclión', 8, 'https://www.slgr.gr/img/uploads/big/159680285453.png', NULL),
(216, 'Olympiacos', 'Pireo', 8, 'https://www.slgr.gr/img/uploads/big/172070387647.png', 39),
(217, 'Panaitolikos', 'Agrinio', 8, 'https://www.slgr.gr/img/uploads/big/153451533633.png', NULL),
(218, 'Panathinaikos', 'Atenas', 8, 'http://slgr.gr/img/uploads/big/126935356667.png', 40),
(219, 'Panserraikos', 'Serres', 8, 'https://www.slgr.gr/img/uploads/big/172172693345.png', NULL),
(220, 'PAOK Salónica', 'Salónica', 8, 'https://www.slgr.gr/img/uploads/big/137355273012.png', 38),
(221, 'Volos NFC', 'Volos', 8, 'https://www.slgr.gr/img/uploads/big/159946830579.png', NULL),

-- Eredivise --

(239, 'Ajax', 'Ámsterdam', 9, 'https://d3et0fncpz2hhr.cloudfront.net/clubs/ajax/_120x120_fit_center-center_85_none/AFC-Ajax-logo.png', 40),
(222, 'Almere City FC', 'Almere', 9, 'https://d3et0fncpz2hhr.cloudfront.net/clubs/almere-city-fc/_120x120_fit_center-center_85_none/Almere-City-FC-logo.png', NULL),
(223, 'AZ Alkmaar', 'Alkmaar', 9, 'https://d3et0fncpz2hhr.cloudfront.net/clubs/az/_120x120_fit_center-center_85_none/AZ-logo.png', NULL),
(224, 'Feyenoord', 'Róterdam', 9, 'https://d3et0fncpz2hhr.cloudfront.net/clubs/feyenoord/_120x120_fit_center-center_85_none/Feyenoord-logo.png', 40),
(225, 'Fortuna Sittard', 'Sittard', 9, 'https://d3et0fncpz2hhr.cloudfront.net/clubs/fortuna-sittard/_120x120_fit_center-center_85_none/Fortuna-Sittard-logo.png', NULL),
(226, 'Go Ahead Eagles', 'Deventer', 9, 'https://d3et0fncpz2hhr.cloudfront.net/clubs/go-ahead-eagles/_120x120_fit_center-center_85_none/Go-Ahead-Eagles-logo.png', NULL),
(227, 'FC Groningen', 'Groninga', 9, 'https://d3et0fncpz2hhr.cloudfront.net/clubs/fc-groningen/_120x120_fit_center-center_85_none/FC-Groningen-logo.png', NULL),
(228, 'SC Heerenveen', 'Heerenveen', 9, 'https://d3et0fncpz2hhr.cloudfront.net/clubs/sc-heerenveen/_120x120_fit_center-center_85_none/sc-Heerenveen-logo.png', NULL),
(229, 'Heracles Almelo', 'Almelo', 9, 'https://d3et0fncpz2hhr.cloudfront.net/clubs/heracles-almelo/_120x120_fit_center-center_85_none/Heracles-Almelo-logo.png', NULL),
(230, 'NAC Breda', 'Breda', 9, 'https://d3et0fncpz2hhr.cloudfront.net/clubs/nac-breda/_120x120_fit_center-center_85_none/NAC-Breda-logo.png', NULL),
(231, 'NEC Nijmegen', 'Nimega', 9, 'https://d3et0fncpz2hhr.cloudfront.net/clubs/nec-nijmegen/_120x120_fit_center-center_85_none/logo-nec.png', NULL),
(232, 'PSV Eindhoven', 'Eindhoven', 9, 'https://d3et0fncpz2hhr.cloudfront.net/clubs/psv/_120x120_fit_center-center_85_none/PSV-logo.png', 40),
(233, 'RKC Waalwijk', 'Waalwijk', 9, 'https://d3et0fncpz2hhr.cloudfront.net/clubs/rkc-waalwijk/_120x120_fit_center-center_85_none/RKC-Waalwijk-logo.png', NULL),
(234, 'Sparta Rotterdam', 'Róterdam', 9, 'https://d3et0fncpz2hhr.cloudfront.net/clubs/sparta-rotterdam/_120x120_fit_center-center_85_none/Sparta-Rotterdam-logo.png', NULL),
(235, 'FC Twente', 'Enschede', 9, 'https://d3et0fncpz2hhr.cloudfront.net/clubs/fc-twente/_120x120_fit_center-center_85_none/FC-Twente-logo.png', NULL),
(236, 'FC Utrecht', 'Utrecht', 9, 'https://d3et0fncpz2hhr.cloudfront.net/clubs/fc-utrecht/_120x120_fit_center-center_85_none/FC-Utrecht-logo.png', NULL),
(237, 'Willem II', 'Tilburg', 9, 'https://d3et0fncpz2hhr.cloudfront.net/clubs/willem-ii/_120x120_fit_center-center_85_none/Willem-II-logo.png', NULL),
(238, 'PEC Zwolle', 'Zwolle', 9, 'https://d3et0fncpz2hhr.cloudfront.net/clubs/pec-zwolle/_120x120_fit_center-center_85_none/PEC-Zwolle-logo.png', NULL),



-- Jupiter Pro League --

(255, 'KRC Genk', 'Genk', 10, 'https://statics-maker.llt-services.com/prl/images/2023/08/07/xlarge/2388705e-e7e2-4b84-b169-361e9fd6e37c.png', 40), -- Champions League
(240, 'Club Brujas', 'Brujas', 10, 'https://statics-maker.llt-services.com/prl/images/2023/06/22/xlarge/2fe3ad4a-c545-4ed7-b4d7-dedf4b4f5547.png', 40), -- Champions League
(241, 'Union Saint-Gilloise', 'Saint-Gilles', 10, 'https://statics-maker.llt-services.com/prl/images/2023/06/22/xlarge/a44eb600-b056-48a4-8d56-30b3c97475ad.png', 39), -- Europa League
(242, 'RSC Anderlecht', 'Anderlecht', 10, 'https://statics-maker.llt-services.com/prl/images/2023/07/31/xlarge/a8f619ab-bb32-46f2-a762-6e861486890e.png', 39), -- Europa League
(243, 'Royal Antwerp FC', 'Amberes', 10, 'https://statics-maker.llt-services.com/prl/images/2023/06/22/xlarge/3bd3b69f-0e66-427c-b5c5-641899cc4571.png', 38), -- Conference League
(244, 'KAA Gent', 'Gante', 10, 'https://statics-maker.llt-services.com/prl/images/2023/08/07/xlarge/6990c98d-f539-47b6-b63b-2f370aa17370.png', NULL), -- No participa en competiciones europeas
(245, 'Standard Liège', 'Liège', 10, 'https://statics-maker.llt-services.com/prl/images/2024/08/01/xsmall-wp/cf44703b-48d2-4a92-b859-968d86e19340-383.webp', NULL),
(246, 'Charleroi SC', 'Charleroi', 10, 'https://statics-maker.llt-services.com/prl/images/2024/09/18/xsmall-wp/55b8f4cf-9d25-4165-881f-917dbd1a3600-545.webp', NULL),
(247, 'Oud-Heverlee Leuven', 'Leuven', 10, 'https://statics-maker.llt-services.com/prl/images/2023/06/26/xlarge/90035629-3fb2-4ae9-a5ca-c12e246b0c38.png', NULL),
(248, 'KV Mechelen', 'Malinas', 10, 'https://statics-maker.llt-services.com/prl/images/2024/09/18/original/9f1986e1-deaa-48a2-8d55-7304f4106590-47.png', NULL),
(249, 'Dender EH', 'Denderleeuw', 10, 'https://statics-maker.llt-services.com/prl/images/2023/06/20/xlarge/e9192442-91af-4445-9d4c-af8b52ec11a1.png', NULL),
(250, 'KVC Westerlo', 'Westerlo', 10, 'https://statics-maker.llt-services.com/prl/images/2023/06/22/xlarge/8e129235-d163-428a-b8be-2f1fcdfa59dc.png', NULL),
(251, 'Cercle Brugge', 'Brujas', 10, 'https://statics-maker.llt-services.com/prl/images/2023/06/22/xlarge/4dfcfbef-c97d-49eb-9a96-f417b9304b67.png', NULL),
(252, 'Sint-Truidense VV', 'Sint-Truiden', 10, 'https://statics-maker.llt-services.com/prl/images/2023/06/22/xlarge/701b2f6c-b092-43f1-a0c1-d802af4c6b94.png', NULL),
(253, 'KV Kortrijk', 'Kortrijk', 10, 'https://statics-maker.llt-services.com/prl/images/2023/06/22/xlarge/59180eb1-8326-42db-85ce-681a6285545e.png', NULL),
(254, 'Beerschot', 'Amberes', 10, 'https://statics-maker.llt-services.com/prl/images/2023/06/20/xlarge/08b410ee-ddfc-49f9-a19b-3e51b05b11c6.png', NULL),

-- Superliga Turca --
(274, 'Fenerbahçe', 'Estambul', 11, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/90.png', 40), -- Champions League
(256, 'Galatasaray', 'Estambul', 11, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/109.png', 40), -- Champions League
(257, 'Beşiktaş', 'Estambul', 11, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/249.png', 39), -- Europa League
(258, 'Trabzonspor', 'Trabzon', 11, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/1359.png', 39), -- Europa League
(259, 'Başakşehir', 'Estambul', 11, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4379.png', 38), -- Conference League
(260, 'Konyaspor', 'Konya', 11, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4292.png', NULL), -- No participa en competiciones europeas
(261, 'Sivasspor', 'Sivas', 11, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/3272.png', NULL),
(262, 'Kayserispor', 'Kayseri', 11, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/3167.png', NULL),
(263, 'Antalyaspor', 'Antalya', 11, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/947.png', NULL),
(264, 'Alanyaspor', 'Alanya', 11, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4497.png', NULL),
(265, 'Gaziantep FK', 'Gaziantep', 11, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/5979.png', NULL),
(266, 'Kasımpaşa', 'Estambul', 11, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/3611.png', NULL),
(267, 'Çaykur Rizespor', 'Rize', 11, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/995.png', NULL),
(268, 'Hatayspor', 'Antioquía', 11, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/5263.png', NULL),
(269, 'Göztepe SK', 'Esmirna', 11, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/1277.png', NULL),
(270, 'Bodrum FK', 'Bodrum', 11, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/6154.png', NULL),
(271, 'Eyüpspor', 'Estambul', 11, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/6153.png', NULL),
(272, 'Samsunspor', 'Samsun', 11, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/993.png', NULL),
(273, 'Adana Demirspor', 'Adana', 11, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/998.png', NULL),

-- Liga Danesa --

(286, 'FC Copenhague', 'Copenhague', 12, 'https://dxugi372p6nmc.cloudfront.net/spdk/current/64x64/8391/teamlogo.png', 40), -- Champions League
(275, 'Brøndby IF', 'Copenhague', 12, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/575.png&scale=crop&cquality=40&location=origin&w=80&h=80', 39), -- Europa League
(276, 'AGF Aarhus', 'Aarhus', 12, 'https://dxugi372p6nmc.cloudfront.net/spdk/current/64x64/8071/teamlogo.png', 39), -- Europa League
(277, 'Randers FC', 'Randers', 12, 'https://dxugi372p6nmc.cloudfront.net/spdk/current/64x64/8410/teamlogo.png', 38), -- Conference League
(278, 'Silkeborg IF', 'Silkeborg', 12, 'https://dxugi372p6nmc.cloudfront.net/spdk/current/64x64/8415/teamlogo.png', NULL), -- No participa en competiciones europeas
(279, 'Viborg FF', 'Viborg', 12, 'https://dxugi372p6nmc.cloudfront.net/spdk/current/64x64/9939/teamlogo.png', NULL),
(280, 'SønderjyskE Fodbold', 'Haderslev', 12, 'https://dxugi372p6nmc.cloudfront.net/spdk/current/64x64/8487/teamlogo.png', NULL),
(281, 'Vejle BK', 'Vejle', 12, 'https://dxugi372p6nmc.cloudfront.net/spdk/current/64x64/8231/teamlogo.png', NULL),
(282, 'Lyngby BK', 'Kongens Lyngby', 12, 'https://dxugi372p6nmc.cloudfront.net/spdk/current/64x64/9907/teamlogo.png', NULL),
(283, 'FC Nordsjælland', 'Farum', 12, 'https://dxugi372p6nmc.cloudfront.net/spdk/current/64x64/10202/teamlogo.png', NULL),
(284, 'AaB Aalborg', 'Aalborg', 12, 'https://dxugi372p6nmc.cloudfront.net/spdk/current/64x64/8470/teamlogo.png', NULL),
(285, 'FC Midtjylland', 'Herning', 12, "https://dxugi372p6nmc.cloudfront.net/spdk/current/64x64/8113/teamlogo.png", 40), -- Champions League

-- Liga Portuguesa --
(304, 'Sporting CP', 'Lisboa', 13, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/39.png', 40), -- Champions League
(287, 'SL Benfica', 'Lisboa', 13, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/44.png', 40), -- Champions League
(288, 'FC Porto', 'Oporto', 13, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/45.png', 40), -- Champions League
(289, 'SC Braga', 'Braga', 13, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/83.png', 39), -- Europa League
(290, 'Santa Clara', 'Ponta Delgada', 13, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/1689.png', NULL), -- No participa en competiciones europeas
(291, 'Vitória SC', 'Guimarães', 13, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/257.png', 38), -- Conference League
(292, 'Casa Pia AC', 'Lisboa', 13, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/1837.png', NULL),
(293, 'Estoril Praia', 'Estoril', 13, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/235.png', NULL),
(294, 'FC Famalicão', 'Famalicão', 13, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/1249.png', NULL),
(295, 'Moreirense FC', 'Moreira de Cónegos', 13, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/107.png', NULL),
(296, 'CD Nacional', 'Funchal', 13, 'https://ligaportugalstorage.blob.core.windows.net/backoffice/assets/thumbnail_Emb_CD_Nacional_AF_200x200_300_a3a56992f4.png', NULL),
(297, 'Rio Ave FC', 'Vila do Conde', 13, 'https://ligaportugalstorage.blob.core.windows.net/backoffice/assets/thumbnail_Emb_Rio_Ave_FC_AF_200x200_300_e2e84f5563.png', NULL),
(298, 'FC Arouca', 'Arouca', 13, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4226.png', NULL),
(299, 'Gil Vicente FC', 'Barcelos', 13, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/1688.png', NULL),
(300, 'Estrela Amadora', 'Amadora', 13, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/1855.png', NULL),
(301, 'AFS', 'Portugal', 13, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/6155.png', NULL),
(302, 'SC Farense', 'Faro', 13, 'https://ligaportugalstorage.blob.core.windows.net/backoffice/assets/thumbnail_Emb_SC_Farense_AF_200x200_300_cada639191.png', NULL),
(303, 'Boavista FC', 'Oporto', 13, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/84.png', NULL),

-- MLS --

(331, 'LA Galaxy', 'Los Ángeles', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1620997961/assets/logos/LA-Logo-480px.png', NULL),
(305, 'Los Angeles FC', 'Los Ángeles', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1620998598/assets/logos/LAFC-Logo-480px.png', NULL),
(306, 'San Jose Earthquakes', 'San José', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1620997962/assets/logos/SJ-Logo-480px.png', NULL),
(307, 'San Diego FC', 'San Diego', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1736287039/assets/sdn/logos/sd_logo_pri_fc_rgb_480x480__1__720_1_jlm4tx.png', NULL),
(308, 'Seattle Sounders FC', 'Seattle', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1702319240/assets/sea/logos/SEA2023-Full_Color-480x480_fk6mpu.png', NULL),
(309, 'Portland Timbers', 'Portland', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1626094359/assets/logos/POR-Logo-480px_xh4gvt.png', NULL),
(310, 'Vancouver Whitecaps FC', 'Vancouver', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1614970751/assets/logos/1708-vancouver-logo_znac8n.png', NULL),
(311, 'Real Salt Lake', 'Salt Lake City', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1625175977/assets/logos/RSL-Logo-480px_j5pblf.png', NULL),
(312, 'Colorado Rapids', 'Denver', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1614970746/assets/logos/436-colorado-logo_yifx69.png', NULL),
(313, 'FC Dallas', 'Frisco', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1614970753/assets/logos/1903-fc-dallas-logo_zf5uiy.png', NULL),
(314, 'Houston Dynamo FC', 'Houston', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1614970752/assets/logos/1897-houston-logo_mwdpxd.png', NULL),
(315, 'Sporting Kansas City', 'Kansas City', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1614970745/assets/logos/421-sporting-kc-logo_pyhxo8.png', NULL),
(316, 'Minnesota United FC', 'Saint Paul', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1614970757/assets/logos/6977-minnesota-logo_tzjlhe.png', NULL),
(317, 'Chicago Fire FC', 'Chicago', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1633358356/assets/logos/CHI_Logo_480x480-2021-v2.png', NULL),
(318, 'Columbus Crew', 'Columbus', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1621373535/assets/logos/CLB-Logo-New-480.png', NULL),
(319, 'Montreal Impact', 'Montreal', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1668018026/assets/mtl/logos/Montreal-Primary-480x480.png', NULL),
(320, 'New England Revolution', 'Foxborough', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1639491780/assets/ner/logos/NE-Logo-New-480px-v2.png', NULL),
(321, 'New York City FC', 'Nueva York', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1734711060/assets/logos/NYFC_2060_uwikmr.png', NULL),
(322, 'New York Red Bulls', 'Harrison', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1614970744/assets/logos/399-ny-red-bulls-logo_o6xw9r.png', NULL),
(323, 'Orlando City SC', 'Orlando', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1614970757/assets/logos/6900-orlando-logo_tfcjmq.png', NULL),
(324, 'Philadelphia Union', 'Chester', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1614970756/assets/logos/5513-philadelphia-logo_ea33hb.png', NULL),
(325, 'Toronto FC', 'Toronto', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1614970755/assets/logos/2077-toronto-fc-logo_gx1gtb.png', NULL),
(326, 'Atlanta United FC', 'Atlanta', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1620997957/assets/logos/ATL-Logo-480px.png', NULL),
(327, 'Charlotte FC', 'Charlotte', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1634242594/assets/logos/CLT_Logo_480x480v2.png', NULL),
(328, 'Inter Miami CF', 'Fort Lauderdale', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1614970761/assets/logos/14880-miami-logo_m0n453.png', NULL),
(329, 'Nashville SC', 'Nashville', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1614970761/assets/logos/15154-nashville-logo_ldatso.png', NULL),
(330, 'St. Louis CITY SC', 'San Luis', 14, 'https://images.mlssoccer.com/image/upload/t_q-best/v1632227611/assets/logos/STL-Logo-800_fxwprk.png', NULL),


-- Allsvenskan Sueca --

(347, 'AIK', 'Estocolmo', 15, 'https://www.zerozero.pt/img/logos/equipas/1101_imgbank_1688574574.png', NULL),
(332, 'BK Häcken', 'Gotemburgo', 15, 'https://www.ceroacero.es/img/logos/equipas/5009_imgbank_1690532689.png', 40), -- Champions League
(333, 'Brommapojkarna', 'Estocolmo', 15, 'https://www.ceroacero.es/img/logos/equipas/8603_imgbank_1674831072.png', NULL),
(334, 'Degerfors IF', 'Degerfors', 15, 'https://www.ceroacero.es/img/logos/equipas/8657_imgbank_1690532614.png', NULL),
(335, 'Djurgårdens IF', 'Estocolmo', 15, 'https://www.ceroacero.es/img/logos/equipas/173_imgbank_1729786314.png', 39), -- Europa League
(336, 'Elfsborg', 'Borås', 15, 'https://www.ceroacero.es/img/logos/equipas/2134_imgbank_1690532492.png', NULL),
(337, 'GAIS', 'Gotemburgo', 15, 'https://www.ceroacero.es/img/logos/equipas/98/7698_logo_gais.gif', NULL),
(338, 'Halmstads BK', 'Halmstad', 15, 'https://www.ceroacero.es/img/logos/equipas/2133_imgbank_1691657884.png', NULL),
(339, 'Hammarby IF', 'Estocolmo', 15, 'https://www.ceroacero.es/img/logos/equipas/2128_imgbank_1690531428.png', 39), -- Europa League
(340, 'IFK Göteborg', 'Gotemburgo', 15, 'https://www.ceroacero.es/img/logos/equipas/2131_imgbank_1690532163.png', NULL),
(341, 'IFK Norrköping', 'Norrköping', 15, 'https://www.ceroacero.es/img/logos/equipas/5214_imgbank_1690532243.png', NULL),
(342, 'IFK Värnamo', 'Värnamo', 15, 'https://www.ceroacero.es/img/logos/equipas/7748_imgbank_1690532319.png', NULL),
(343, 'Malmö FF', 'Malmö', 15, 'https://www.ceroacero.es/img/logos/equipas/1100_imgbank_1688574494.png', 40), -- Champions League
(344, 'Mjällby AIF', 'Målilla', 15, 'https://www.ceroacero.es/img/logos/equipas/8431_imgbank_1690532010.png', NULL),
(345, 'Östers IF', 'Växjö', 15, 'https://www.ceroacero.es/img/logos/equipas/2137_imgbank_1691657838.png', NULL),
(346, 'IK Sirius', 'Uppsala', 15, 'https://www.ceroacero.es/img/logos/equipas/8655_imgbank_1690531922.png', NULL),

-- Liga MX --

(364, 'Club América', 'Ciudad de México', 16, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/227.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(348, 'Chivas Guadalajara', 'Guadalajara', 16, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/219.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(349, 'Cruz Azul', 'Ciudad de México', 16, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/218.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(350, 'Pumas UNAM', 'Ciudad de México', 16, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/233.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(351, 'Club Tigres UANL', 'Monterrey', 16, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/232.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(352, 'Club Santos Laguna', 'Torreón', 16, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/225.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(353, 'Monterrey', 'Monterrey', 16, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/220.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(354, 'Club León', 'León', 16, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/228.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(355, 'Puebla FC', 'Puebla', 16, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/231.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(356, 'Atlas FC', 'Guadalajara', 16, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/216.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(357, 'Toluca', 'Toluca', 16, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/223.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(358, 'Atlético San Luis', 'San Luis Potosí', 16, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/15720.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(359, 'FC Juárez', 'Ciudad Juárez', 16, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/17851.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(360, 'Necaxa', 'Aguascalientes', 16, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/229.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(361, 'Querétaro', 'Querétaro', 16, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/222.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(362, 'Tijuana', 'Tijuana', 16, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/10125.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(363, 'Mazatlán FC', 'Mazatlán', 16, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/20702.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),


-- Brasileirao --

(384, 'Atlético Mineiro', 'Belo Horizonte', 17, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4222.png', NULL),
(365, 'Bahía', 'Salvador', 17, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/1853.png', NULL),
(366, 'Botafogo', 'Río de Janeiro', 17, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4316.png', NULL),
(367, 'Bragantino', 'Bragança Paulista', 17, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/231.png', NULL),
(368, 'Ceará', 'Fortaleza', 17, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4524.png', NULL),
(369, 'Corinthians', 'São Paulo', 17, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4216.png', NULL),
(370, 'Cruzeiro', 'Belo Horizonte', 17, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4211.png', NULL),
(371, 'Flamengo', 'Río de Janeiro', 17, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4315.png', NULL),
(372, 'Fluminense', 'Río de Janeiro', 17, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4322.png', NULL),
(373, 'Fortaleza EC', 'Fortaleza', 17, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4839.png', NULL),
(374, 'Grêmio', 'Porto Alegre', 17, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4279.png', NULL),
(375, 'Internacional', 'Porto Alegre', 17, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/1196.png', NULL),
(376, 'Juventude', 'Caxias do Sul', 17, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/985.png', NULL),
(377, 'Mirassol', 'Mirassol', 17, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/2805.png', NULL),
(378, 'Palmeiras', 'São Paulo', 17, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4280.png', NULL),
(379, 'Santos FC', 'Santos', 17, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/168.png', NULL),
(380, 'Sport Recife', 'Recife', 17, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4323.png', NULL),
(381, 'São Paulo FC', 'São Paulo', 17, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4224.png', NULL),
(382, 'Vasco da Gama', 'Río de Janeiro', 17, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/228.png', NULL),
(383, 'Vitória', 'Salvador', 17, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/972.png', NULL),


-- Liga Ucraniana --
(400, 'Shakhtar Donetsk', 'Donetsk', 18, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/288.png', 40),
(385, 'Dynamo Kyiv', 'Kiev', 18, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/331.png', 39),
(386, 'Zorya Luhansk', 'Luhansk', 18, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4293.png', NULL),
(387, 'Vorskla Poltava', 'Poltava', 18, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/952.png', NULL),
(388, 'Oleksandria', 'Oleksandria', 18, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4381.png', NULL),
(389, 'Polessya Zhytomir', 'Zhytomir', 18, 'https://tmssl.akamaized.net//images/wappen/head/53646.png?lm=1718547005', NULL),
(390, 'Cherkasy', 'Cherkasy', 18, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/5969.png', NULL),
(391, 'Chernomorets O.', 'Odesa', 18, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/2750.png', NULL),
(392, 'Inhulets Petrove', 'Petrove', 18, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/5371.png', NULL),
(393, 'Karpaty Lvov', 'Lvov', 18, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/1660.png', NULL),
(394, 'Kolos Kovalivka', 'Kovalivka', 18, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4979.png', NULL),
(395, 'Kryvbas KR', 'Krivoy Rog', 18, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/5967.png', NULL),
(396, 'Livyi Bereh', 'Kyiv', 18, 'https://static.flashscore.com/res/image/data/nLaZbsjl-MX0StiSh.png', NULL),
(397, 'Obolon Kyiv', 'Kyiv', 18, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/2749.png', NULL),
(398, 'Rukh Vynnyky', 'Vynnyky', 18, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/5372.png', NULL),
(399, 'Veres Livne', 'Livne', 18, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/5370.png', NULL),

-- Liga Rusa --

(416, 'CSKA Moscú', 'Moscú', 19, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/165.png', NULL),
(401, 'Dynamo Moscú', 'Moscú', 19, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/166.png', NULL),
(402, 'Dynamo Makhachkala', 'Makhachkala', 19, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/6139.png', NULL),
(403, 'Fakel Voronezh', 'Voronezh', 19, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/329.png', NULL),
(404, 'FC Khimki', 'Khimki', 19, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/5256.png', NULL),
(405, 'FC Krasnodar', 'Krasnodar', 19, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4171.png', NULL),
(406, 'FC Orenburg', 'Orenburg', 19, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4692.png', NULL),
(407, 'FK Akron Togliatti', 'Togliatti', 19, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/6138.png', NULL),
(408, 'Kriliev Sovietov', 'Samara', 19, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/1834.png', NULL),
(409, 'Lokomotiv Moscú', 'Moscú', 19, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/561.png', NULL),
(410, 'Nizhny Novgorod', 'Nizhny Novgorod', 19, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/5369.png', NULL),
(411, 'Rostov', 'Rostov', 19, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4291.png', NULL),
(412, 'Rubin Kazan', 'Kazan', 19, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/3075.png', NULL),
(413, 'Spartak Moscú', 'Moscú', 19, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/206.png', 40),  -- Champions League
(414, 'Terek Grozniy', 'Grozniy', 19, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/3073.png', NULL),
(415, 'Zenit', 'San Petersburgo', 19, 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/1575.png', 39),

-- A-League (Australia) --

(427, 'Adelaide United', 'Adelaida', 20, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/5321.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(417, 'Brisbane Roar', 'Brisbane', 20, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/5326.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(418, 'Central Coast Mariners', 'Gosford', 20, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/5325.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(419, 'Melbourne City', 'Melbourne', 20, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/11143.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(420, 'Melbourne Victory', 'Melbourne', 20, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/5328.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(421, 'Newcastle Jets', 'Newcastle', 20, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/5323.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(422, 'Perth Glory', 'Perth', 20, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/5322.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(423, 'Sydney FC', 'Sídney', 20, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/5327.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(424, 'Wellington Phoenix', 'Wellington', 20, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/8352.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(425, 'Western Sydney Wanderers', 'Sídney', 20, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/13696.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL),
(426, 'Western United', 'Melbourne', 20, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/20086.png&scale=crop&cquality=40&location=origin&w=80&h=80', NULL)

;









INSERT INTO jugadores (nombre, edad, posicion, equipo_id) VALUES
-- LaLiga (España)
('Vinícius Jr.', 24, 'Delantero', 34), -- Real Madrid
('Jude Bellingham', 21, 'Centrocampista', 34), -- Real Madrid
('Robert Lewandowski', 36, 'Delantero', 26), -- FC Barcelona
('Pedri', 22, 'Centrocampista', 26), -- FC Barcelona
('Antoine Griezmann', 33, 'Delantero', 22), -- Atlético de Madrid
('Jan Oblak', 32, 'Portero', 22), -- Atlético de Madrid
('Isco', 32, 'Centrocampista', 33), -- Real Betis
('Julian Alvarez', 22, 'Delantero', 22), -- Atlético de Madrid
('Iago Aspas', 37, 'Delantero', 30), -- RC Celta
('Takefusa Kubo', 23, 'Centrocampista', 35), -- Real Sociedad

-- Premier League (Inglaterra)
('Erling Haaland', 24, 'Delantero', 2), -- Manchester City
('Kevin De Bruyne', 33, 'Centrocampista', 2), -- Manchester City
('Bukayo Saka', 23, 'Centrocampista', 1), -- Arsenal
('Declan Rice', 26, 'Centrocampista', 1), -- Arsenal
('Mohamed Salah', 32, 'Delantero', 5), -- Liverpool
('Virgil van Dijk', 33, 'Defensa', 5), -- Liverpool
('Marcus Rashford', 27, 'Delantero', 3), -- Manchester United
('Bruno Fernandes', 30, 'Centrocampista', 3), -- Manchester United
('Enzo Fernández', 24, 'Centrocampista', 4), -- Chelsea
('Christopher Nkunku', 27, 'Delantero', 4), -- Chelsea

-- Bundesliga (Alemania)
('Harry Kane', 31, 'Delantero', 79), -- Bayern Múnich
('Jamal Musiala', 22, 'Centrocampista', 79), -- Bayern Múnich
('Florian Wirtz', 22, 'Centrocampista', 80), -- Bayer Leverkusen
('Joshua Kimmich', 30, 'Centrocampista', 79), -- Bayern Múnich
('Donyell Malen', 26, 'Delantero', 88), -- Borussia Dortmund
('Marco Reus', 35, 'Centrocampista', 88), -- Borussia Dortmund
('Xavi Simons', 22, 'Centrocampista', 83), -- RB Leipzig
('Serhou Guirassy', 29, 'Delantero', 82), -- VfB Stuttgart
('Jonathan Tah', 29, 'Defensa', 80), -- Bayer Leverkusen
('Leroy Sané', 29, 'Delantero', 79), -- Bayern Múnich

-- Serie A (Italia)
('Victor Osimhen', 26, 'Delantero', 41), -- Napoli
('Khvicha Kvaratskhelia', 24, 'Centrocampista', 41), -- Napoli
('Lautaro Martínez', 27, 'Delantero', 43), -- Inter de Milán
('Nicolò Barella', 28, 'Centrocampista', 43), -- Inter de Milán
('Paulo Dybala', 31, 'Delantero', 45), -- AS Roma
('Federico Chiesa', 27, 'Delantero', 42), -- Juventus
('Dusan Vlahovic', 25, 'Delantero', 42), -- Juventus
('Rafael Leão', 25, 'Delantero', 44), -- AC Milan
('Theo Hernández', 27, 'Defensa', 44), -- AC Milan
('Sergej Milinković-Savić', 29, 'Centrocampista', 46), -- Lazio
('Randal Kolo Muani', 26, 'Delantero', 42), -- Juventus

-- Ligue 1 (Francia)
('Kylian Mbappé', 26, 'Delantero', 34), -- Real Madrid
('Ousmane Dembélé', 27, 'Delantero', 61), -- PSG
('Achraf Hakimi', 26, 'Defensa', 61), -- PSG
('Jonathan David', 25, 'Delantero', 65), -- Lille
('Alexandre Lacazette', 33, 'Delantero', 66), -- Lyon
('Wissam Ben Yedder', 34, 'Delantero', 64), -- AS Monaco
('Moses Simon', 29, 'Delantero', 75), -- Nantes
('Pierre-Emerick Aubameyang', 35, 'Delantero', 62), -- Olympique de Marsella
('Benjamin Bourigeaud', 31, 'Centrocampista', 72); -- Rennes



-- Balon de oro --
INSERT INTO balonOro (id, nombre, edad, posicion, equipo_id, fotoJugador) VALUES
(1956, 'Stanley Matthews', 41, 'Extremo Derecho', 184, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/matthews.jpg'),
(1957, 'Alfredo Di Stéfano', 32, 'Delantero', 34, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/di-stefano-57.jpg'),
(1958, 'Raymond Kopa', 26, 'Mediapunta', 34, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/kopa.jpg'),
(1959, 'Alfredo Di Stéfano', 33, 'Delantero', 34, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/di-stefano-59.jpg'),
(1960, 'Luis Suárez', 25, 'Centrocampista', 26, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/suarez.jpg'),
(1961, 'Omar Sívori', 23, 'Delantero', 42, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/sivori.jpg'),
(1962, 'Josef Masopust', 31, 'Centrocampista', 174, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/masopust.jpg'),
(1963, 'Lev Yashin', 34, 'Portero', 401, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/yashin.jpg'),
(1964, 'Denis Law', 24, 'Delantero', 3, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/law.jpg'),
(1965, 'Eusébio', 24, 'Delantero', 287, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/eusebio.jpg'),
(1966, 'Bobby Charlton', 30, 'Centrocampista', 3, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/charlton.jpg'),
(1968, 'George Best', 22, 'Extremo', 3, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/best.jpg'),
(1969, 'Gianni Rivera', 26, 'Mediapunta', 44, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/rivera.jpg'),
(1970, 'Gerd Müller', 25, 'Delantero', 79, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/muller.jpg'),
(1971, 'Johan Cruyff', 24, 'Delantero', 239, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/cruyff-71.jpg'),
(1972, 'Franz Beckenbauer', 27, 'Defensa', 79, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/beckenbauer-72.jpg'),
(1973, 'Johan Cruyff', 26, 'Delantero', 239, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/cruyff-73.jpg'),
(1974, 'Johan Cruyff', 27, 'Delantero', 239, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/cruyff-74.jpg'),
(1975, 'Oleg Blojín', 28, 'Delantero', 79, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/blokhin.jpg'),
(1976, 'Franz Beckenbauer', 31, 'Defensa', 79, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/beckenbauer-76.jpg'),
(1977, 'Allan Simonsen', 25, 'Delantero', 89, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/simonsen.jpg'),
(1978, 'Kevin Keegan', 27, 'Delantero', 34, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/keegan-78.jpg'),
(1979, 'Kevin Keegan', 28, 'Delantero', 34, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/keegan-79.jpg'),
(1980, 'Karl-Heinz Rummenigge', 24, 'Delantero', 79, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/rummenigge-80.jpg'),
(1981, 'Karl-Heinz Rummenigge', 25, 'Delantero', 79, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/rummenigge-81.jpg'),
(1982, 'Paolo Rossi', 25, 'Delantero', 42, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/rossi.jpg'),
(1983, 'Michel Platini', 28, 'Centrocampista', 42, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/platini-83.jpg'),
(1984, 'Michel Platini', 29, 'Centrocampista', 42, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/platini-84.jpg'),
(1985, 'Michel Platini', 30, 'Centrocampista', 42, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/platini-85.jpg'),
(1986, 'Igor Belánov', 26, 'Delantero', 401, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/belanov.jpg'),
(1987, 'Ruud Gullit', 24, 'Centrocampista', 44, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/gullit.jpg'),
(1988, 'Marco van Basten', 24, 'Delantero', 44, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/van-basten-88.jpg'),
(1989, 'Marco van Basten', 25, 'Delantero', 44, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/van-basten-89.jpg'),
(1990, 'Lothar Matthäus', 29, 'Centrocampista', 43, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/matthaus.jpg'),
(1991, 'Jean-Pierre Papin', 27, 'Delantero', 62, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/papin.jpg'),
(1992, 'Marco van Basten', 28, 'Delantero', 44, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/van-basten-92.jpg'),
(1993, 'Roberto Baggio', 27, 'Delantero', 42, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/baggio.jpg'),
(1994, 'Hristo Stoichkov', 28, 'Delantero', 26, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/stoichkov.jpg'),
(1995, 'George Weah', 29, 'Delantero', 44, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/weah.jpg'),
(1996, 'Matthias Sammer', 29, 'Defensa', 88, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/sammer.jpg'),
(1997, 'Ronaldo', 21, 'Delantero', 43, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/ronaldo-97.jpg'),
(1998, 'Zinedine Zidane', 26, 'Centrocampista', 42, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/zidane.jpg'),
(1999, 'Rivaldo', 27, 'Mediapunta', 26, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/rivaldo.jpg'),
(2000, 'Luís Figo', 28, 'Extremo', 34, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/figo.jpg'),
(2001, 'Michael Owen', 22, 'Delantero', 5, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/owen.jpg'),
(2002, 'Ronaldo', 26, 'Delantero', 34, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/ronaldo-2002.jpg'),
(2003, 'Pavel Nedvěd', 31, 'Centrocampista', 42, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/nedved.jpg'),
(2004, 'Andriy Shevchenko', 28, 'Delantero', 44, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/shevchenko.jpg'),
(2005, 'Ronaldinho', 25, 'Mediapunta', 26, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/ronaldinho.jpg'),
(2006, 'Fabio Cannavaro', 33, 'Defensa', 34, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/cannavaro.jpg'),
(2007, 'Kaká', 25, 'Centrocampista', 44, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/kaka.jpg'),
(2008, 'Cristiano Ronaldo', 23, 'Delantero', 3, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/cristiano-ronaldo-2008.jpg'),
(2009, 'Lionel Messi', 22, 'Delantero', 26, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/messi-2009.jpg'),
(2010, 'Lionel Messi', 23, 'Delantero', 26, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/messi-2010.jpg'),
(2011, 'Lionel Messi', 24, 'Delantero', 26, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/messi-2011.jpg'),
(2012, 'Lionel Messi', 25, 'Delantero', 26, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/messi-2012.jpg'),
(2013, 'Cristiano Ronaldo', 28, 'Delantero', 34, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/cristiano-ronaldo-2013.jpg'),
(2014, 'Cristiano Ronaldo', 29, 'Delantero', 34, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/cristiano-ronaldo-2014.jpg'),
(2015, 'Lionel Messi', 28, 'Delantero', 61, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/messi-2015.jpg'),
(2016, 'Cristiano Ronaldo', 31, 'Delantero', 34, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/cristiano-ronaldo-2016.jpg'),
(2017, 'Cristiano Ronaldo', 32, 'Delantero', 34, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/cristiano-ronaldo-2017.jpg'),
(2018, 'Luka Modrić', 32, 'Centrocampista', 34, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/modric-2018.jpg'),
(2019, 'Lionel Messi', 32, 'Delantero', 26, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/messi-2019.jpg'),
(2021, 'Lionel Messi', 34, 'Delantero', 328, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/messi-2021.jpg'),
(2022, 'Karim Benzema', 34, 'Delantero', 34, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/benzema-2022.jpg'),
(2023, 'Lionel Messi', 36, 'Delantero', 328, 'https://e00-marca.uecdn.es/deporte/balon-de-oro/imagenes/palmares/messi-2023.jpg'),
(2024, 'Rodri Hernández', 28, 'Centrocampista', 328, 'https://e00-xlk-ue-marca.uecdn.es/files/article_828_widen_webp/uploads/2024/10/28/672008c6685ac.webp');


