# Challenge de Programación - Módulo de Empleados

[cite_start]Este proyecto es una solución integral para la gestión de empleados, desarrollada como parte del proceso de evaluación técnica para **PROVEDATOS**[cite: 1, 5].

## 🚀 Tecnologías Utilizadas

### Frontend
- **React 19** con **TypeScript** para un tipado fuerte y desarrollo moderno.
- **Vite** como herramienta de construcción (build tool) para un desarrollo ultra rápido.
- [cite_start]**Bootstrap 5 & React-Bootstrap** para garantizar un diseño responsivo y profesional[cite: 149].
- **Bootstrap Icons** para la iconografía del sistema.

### Backend
- [cite_start]**PHP** siguiendo una arquitectura **MVC** simplificada para la gestión de la lógica de negocio y API[cite: 149].
- **PDO** para conexiones seguras a la base de datos y prevención de inyecciones SQL.

### Base de Datos
- [cite_start]**MySQL** con soporte para **UTF8**[cite: 148, 152].

## 📋 Características del Proyecto

1. [cite_start]**Listado de Empleados:** Visualización de los primeros 20 registros con búsqueda dinámica por nombre y código[cite: 4, 9].
2. **Gestión de Empleados (CRUD):** Creación y edición de fichas de empleados con validaciones de formulario.
3. [cite_start]**Formulario en Dos Pasos:** Separación lógica entre *Datos Personales* y *Datos Laborales*[cite: 17, 42].
4. [cite_start]**Carga de Imágenes:** Sistema para subir y previsualizar la fotografía del empleado[cite: 31, 35].
5. [cite_start]**Reporte General:** Pantalla de reporte detallado con funcionalidad de ordenamiento dinámico por columnas[cite: 12, 103, 146].
6. [cite_start]**Validaciones:** Control de formato para emails, cédulas y campos obligatorios[cite: 148].

## 🛠️ Instalación y Configuración

### Requisitos Previos
- [cite_start]Servidor local (XAMPP, WAMP, Laragon) con **PHP** y **MySQL**[cite: 151, 152].
- **Node.js** para el entorno de ejecución del frontend.

### Configuración del Backend
1. Ubica la carpeta `backend-provedatos` en tu servidor local (ej. `htdocs`).
2. Configura las credenciales de tu base de datos en `config/Database.php`.
3. [cite_start]Importa el script SQL proporcionado (incluyendo los datos de provincias) en tu gestor de base de datos[cite: 155].

### Configuración del Frontend
1. Navega a la carpeta `prueba_provedatos`.
2. Instala las dependencias:
   ```bash
   npm install
