# User Management API - Documentación

Esta API proporciona un conjunto de endpoints para gestionar usuarios. Incluye funcionalidades como autenticación, listado, creación, edición y eliminación de usuarios.

---

## Tabla de Contenidos

1. [Autenticación](#autenticación)
   - [Login](#1-login)
2. [Usuarios](#usuarios)
   - [Listar Usuarios](#2-listar-usuarios)
   - [Crear Usuario](#3-crear-usuario)
   - [Editar Usuario](#4-editar-usuario)
   - [Eliminar Usuario](#5-eliminar-usuario)

---

## Autenticación

### 1. Login

- **Método:** `POST`  
- **URL:** `/api/login`  
- **Descripción:** Autentica a un usuario y devuelve un token de acceso.

#### Headers

```json
{
  "Content-Type": "application/json"
}

#### Body

```json
{
  "email": "usuario@example.com",
  "password": "contraseña123"
}

#### Respuesta Exitosa

```json
json
Copy code
{
  "token": "Bearer token"
}

#### Respuesta de Error
```json
Copy code
{
  "message": "Credenciales inválidas"
}

Usuarios
2. Listar Usuarios
Método: GET
URL: /api/users
Descripción: Devuelve una lista de todos los usuarios registrados.
Headers
json
Copy code
{
  "Authorization": "Bearer token"
}
Respuesta Exitosa
json
Copy code
[
  {
    "id": 1,
    "nombre": "John",
    "apellido": "Doe",
    "correo": "john.doe@example.com",
    "telefono": "123456789"
  }
]
Respuesta de Error
json
Copy code
{
  "message": "No autorizado"
}
3. Crear Usuario
Método: POST
URL: /api/users
Descripción: Crea un nuevo usuario en el sistema.
Headers
json
Copy code
{
  "Authorization": "Bearer token",
  "Content-Type": "application/json"
}
Body (JSON)
json
Copy code
{
  "nombre": "Jane",
  "apellido": "Doe",
  "correo": "jane.doe@example.com",
  "telefono": "987654321",
  "password": "contraseña123"
}
Respuesta Exitosa
json
Copy code
{
  "message": "Usuario creado con éxito",
  "user": {
    "id": 2,
    "nombre": "Jane",
    "apellido": "Doe",
    "correo": "jane.doe@example.com",
    "telefono": "987654321"
  }
}
Respuesta de Error
json
Copy code
{
  "message": "Error de validación",
  "errors": {
    "correo": ["El correo ya está en uso"]
  }
}
4. Editar Usuario
Método: PUT
URL: /api/users/{id}
Descripción: Actualiza los datos de un usuario existente.
Headers
json
Copy code
{
  "Authorization": "Bearer token",
  "Content-Type": "application/json"
}
Body (JSON)
json
Copy code
{
  "nombre": "Jane Updated",
  "apellido": "Doe Updated",
  "correo": "jane.updated@example.com",
  "telefono": "111222333"
}
Respuesta Exitosa
json
Copy code
{
  "message": "Usuario actualizado con éxito",
  "user": {
    "id": 2,
    "nombre": "Jane Updated",
    "apellido": "Doe Updated",
    "correo": "jane.updated@example.com",
    "telefono": "111222333"
  }
}
Respuesta de Error
json
Copy code
{
  "message": "Usuario no encontrado"
}
5. Eliminar Usuario
Método: DELETE
URL: /api/users/{id}
Descripción: Elimina un usuario del sistema.
Headers
json
Copy code
{
  "Authorization": "Bearer token"
}
Respuesta Exitosa
json
Copy code
{
  "message": "Usuario eliminado con éxito"
}
Respuesta de Error
json
Copy code
{
  "message": "Usuario no encontrado"
}
