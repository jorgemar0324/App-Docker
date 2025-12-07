# 🎬 Sistema de Gestión de Películas - Dockerizado

## Descripción
Aplicación full-stack para gestión de catálogo de películas usando Docker.

## 🚀 Inicio Rápido

### Prerrequisitos
- Docker Desktop instalado y corriendo

### Instalación en 3 pasos:

1. **Descargar/Clonar el proyecto**
2. **Estando en la raiz de la aplicacion en la terminal de windows o vscode ejecutar los siguientes comandos:**
1**CONSTRUIR IMAGEN DEL BACKEND

    docker-compose build backend

2**CONSTRUIR IMAGEN DEL FRONTEND

    docker-compose build frontend

3**VERIFICAR IMÁGENES CREADAS

    docker images

4**CREAR Y EJECUTAR CONTENEDORES   
   
   docker-compose up -d

5**VERIFICAR ESTADO DE CONTENEDORES

   docker-compose ps

**PROBAR LA APLICACIÓN

   Backend
   http://localhost:8080/api/media
   
   Frontend
   http://localhost:3000