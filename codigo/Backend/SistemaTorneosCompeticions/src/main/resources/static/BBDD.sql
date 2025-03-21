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
(173, 'Feyenoord', 'Róterdam', 9, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/52749.png', 40),
(174, 'PSV Eindhoven', 'Eindhoven', 9, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/50062.png', 40),
(175, 'Benfica', 'Lisboa', 13, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/50147.png', 40),
(176, 'Sporting CP', 'Lisboa', 13, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/50149.png', 40),
(177, 'Brujas', 'Brujas', 34, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/50043.png', 40),
(178, 'Dinamo Zagreb', 'Zagreb', 34, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/50164.png', 40),
(179, 'Sparta de Praga', 'Praga', 34, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/50033.png', 40),
(180, 'Estrella Roja', 'Belgrado', 34, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/50069.png', 40),
(181, 'Slovan Bratislava', 'Bratislava', 34, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/52797.png', 40),
(182, 'Young Boys', 'Berna', 34, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/50031.png', 40),
(183, 'Shakhtar Donetsk', 'Donetsk', 18, 'https://img.uefa.com/imgml/TP/teams/logos/64x64/52707.png', 40),

-- CHAMPIONSHIP --

(184, 'Blackburn Rovers', 'Blackburn', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/365.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(185, 'Bristol City', 'Bristol', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/333.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(186, 'Burnley', 'Burnley', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/379.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(187, 'Cardiff City', 'Cardiff', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/347.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(188, 'Coventry City', 'Coventry', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/388.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(189, 'Derby County', 'Derby', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/374.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(190, 'Hull City', 'Hull', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/306.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
(191, 'Leeds United', 'Leeds', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/306.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL),
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
(207, 'West Bromwich Albion', 'West Bromwich', 2, "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/383.png&scale=crop&cquality=40&location=origin&w=80&h=80", NULL)


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
