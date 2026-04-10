# Challenge de Programación - Módulo de Empleados

Este proyecto es una solución integral para la gestión de empleados, desarrollada como parte del proceso de evaluación técnica para **PROVEDATOS**

## 🚀 Tecnologías Utilizadas

### Frontend
- **React 19** con **TypeScript** para un tipado fuerte y desarrollo moderno.
- **Vite** como herramienta de construcción (build tool) para un desarrollo ultra rápido.
- **Bootstrap 5 & React-Bootstrap** para garantizar un diseño responsivo y profesional.
- **Bootstrap Icons** para la iconografía del sistema.

### Backend
- **PHP** siguiendo una arquitectura **MVC** simplificada para la gestión de la lógica de negocio y API.
- **PDO** para conexiones seguras a la base de datos y prevención de inyecciones SQL.

### Base de Datos
- **MySQL** con soporte para **UTF8**.

## 📋 Características del Proyecto

1. *Listado de Empleados:** Visualización de los primeros 20 registros con búsqueda dinámica por nombre y código.
2. **Gestión de Empleados (CRUD):** Creación y edición de fichas de empleados con validaciones de formulario.
3. **Formulario en Dos Pasos:** Separación lógica entre *Datos Personales* y *Datos Laborales*.
4. **Carga de Imágenes:** Sistema para subir y previsualizar la fotografía del empleado.
5. **Reporte General:** Pantalla de reporte detallado con funcionalidad de ordenamiento dinámico por columnas.
6. **Validaciones:** Control de formato para emails, cédulas y campos obligatorios.

## 🛠️ Instalación y Configuración

### Requisitos Previos
- Servidor local (XAMPP, WAMP, Laragon) con **PHP** y **MySQL**.
- **Node.js** para el entorno de ejecución del frontend.

## 🛠️ Instalación y Configuración

### 1. Preparación de la Base de Datos (Copiar y Pegar) 🗄️
Para configurar el entorno de datos, siga estos pasos:
1. Localice el archivo `database.sql` dentro de la carpeta `docs/`.
2. Copie todo el contenido del archivo.
3. En su gestor de base de datos (ej. phpMyAdmin), diríjase a la pestaña **SQL**.
4. Pegue el código y ejecútelo. El script se encargará automáticamente de:
   - Crear la base de datos `provedatos_db`.
   - Crear las tablas `provincia` y `empleados`.
   - Insertar las 24 provincias del Ecuador necesarias para el funcionamiento y usuarios de prueba.

### Configuración del Backend
1. Ubica la carpeta `backend-provedatos` en tu servidor local (ej. `htdocs`).
2. Configura las credenciales de tu base de datos en `config/Database.php`.

### Configuración del Frontend
1. Navega a la carpeta `prueba_provedatos`.
2. Instala las dependencias:
   ```bash
   npm install
   ```
3. Inicia el servidor de desarrollo:
   ```bash
   npm run dev
   ```
