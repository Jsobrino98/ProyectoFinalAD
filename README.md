Proyecto Final - Gestión de Equipos Deportivos
Descripción
Este sistema es una aplicación de gestión de equipos deportivos, jugadores, torneos y partidos, que permite realizar operaciones sobre las entidades como equipos, jugadores y torneos. Además, facilita la gestión de usuarios con roles de administrador y usuario normal, permitiendo realizar operaciones de autenticación y autorización en la plataforma.

Funcionalidades
Gestión de equipos: Registrar y administrar equipos deportivos, incluyendo su nombre, ciudad y escudo.
Gestión de jugadores: Registrar jugadores, asociándolos a equipos y almacenando su información (nombre, edad).
Gestión de torneos: Crear y gestionar torneos deportivos, con su nombre, fechas de inicio y fin, y logo.
Gestión de partidos: Registrar partidos, especificando el equipo local y visitante, y la fecha de cada encuentro.
Gestión de usuarios: Administrar usuarios con roles distintos (ADMIN, NORMAL), incluyendo registro, login y control de permisos.
Tecnologías Utilizadas
Backend:

Spring Boot (Java): Framework para la creación de la API RESTful.
Base de Datos:

MySQL: Sistema de gestión de bases de datos relacional para almacenar la información del proyecto.
Documentación de API:

Swagger: Herramienta integrada para la documentación automática y pruebas de los endpoints.
Frontend:

Thymeleaf: Motor de plantillas para la creación de vistas dinámicas y facilitar la interacción con el usuario.
Pruebas de API:

Postman: Utilizado para diseñar y probar los endpoints de la API.
Requisitos
Para ejecutar este proyecto localmente, necesitas tener instalados los siguientes programas:

Java 11+
MySQL
Maven (para gestionar las dependencias)
Postman (para pruebas de la API)
Instalación
1. Clonar el repositorio:

git clone https://github.com/Jsobrino98/ProyectoFinalAD.git

2. Configuración de la base de datos:
Crea una base de datos en MySQL llamada proyecto_deportivo:

CREATE DATABASE CompetenciasDeportivas;

Configura las credenciales de la base de datos en el archivo src/main/resources/application.properties:
properties

spring.datasource.url=jdbc:mysql://localhost:3306/CompetenciasDeportivas
spring.datasource.username=usuario
spring.datasource.password=usuario

3. Ejecutar el proyecto:
Para ejecutar el proyecto, utiliza Maven:

4. Acceder a la API:
Una vez que el servidor esté en ejecución, podrás acceder a la API a través de http://localhost:8080.

La documentación completa de la API está disponible en Swagger:
http://localhost:8080/swagger-ui.html

Endpoints

Algunos de los endpoints principales de la API:

POST api/equipos: Crear un nuevo equipo.

GET api/equipos: Obtener todos los equipos.

POST api/jugadores: Crear un jugador.

GET api/jugadores: Obtener todos los jugadores.

POST api/torneos: Crear un torneo.

GET api/torneos: Obtener todos los torneos.

POST auth/login: Autenticación de usuario.

Contribución
Si deseas contribuir al proyecto, puedes seguir estos pasos:

Haz un fork de este repositorio.
Crea una nueva rama (git checkout -b feature/nueva-funcionalidad).
Realiza tus cambios y haz un commit (git commit -am 'Añadir nueva funcionalidad').
Empuja tu rama (git push origin feature/nueva-funcionalidad).
Abre un pull request.

Licencia
Este proyecto está bajo la licencia MIT. Para más detalles, consulta el archivo LICENSE.

