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
