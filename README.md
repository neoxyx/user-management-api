# User Management API

API desarrollada con Laravel para gestionar usuarios. Este proyecto incluye funcionalidades como agregar, editar, eliminar y listar usuarios.

## Requisitos previos

Antes de comenzar, asegúrate de tener instalados los siguientes elementos:

- **PHP** >= 8.1  
- **Composer** >= 2.0  
- **MySQL** >= 5.7 o PostgreSQL >= 10  
- **Servidor web** (Apache o Nginx)  
- **Laravel** >= 10  
- **Node.js** y **npm** (opcional, si usas herramientas de frontend integradas)

---

## Configuración del proyecto

Sigue los pasos a continuación para levantar el proyecto en tu entorno local:

### 1. Clonar el repositorio

```bash
git clone https://github.com/usuario/user-management-api.git
cd user-management-api

### 2. Instalar dependencias
```bash
composer install

### 3. Configurar variables de entorno
```bash
cp .env.example .env

### 4. Generar clave de aplicación
```bash
php artisan key:generate


### 5. Migrar y poblar la base de datos
```bash
php artisan migrate --seed

### 6. Levantar el servidor de desarrollo
```bash
php artisan serve

### El servidor estará disponible en http://localhost:8000.

