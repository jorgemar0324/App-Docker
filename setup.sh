#!/bin/bash

echo "🎬 CONFIGURACIÓN DEL SISTEMA DE PELÍCULAS CON DOCKER"
echo "===================================================="

echo ""
echo "1. Verificando Docker Desktop..."
if ! docker --version > /dev/null 2>&1; then
    echo "❌ Docker no está instalado o no está corriendo"
    echo "   Por favor, abre Docker Desktop y vuelve a intentar"
    exit 1
fi
echo "✅ Docker está instalado: $(docker --version)"

echo ""
echo "2. Creando archivos de configuración..."

# Crear .env para backend si no existe
if [ ! -f "PELICULAS-BACK/.env" ]; then
    echo "📝 Creando PELICULAS-BACK/.env..."
    cat > PELICULAS-BACK/.env << EOF
PORT=8080
MONGODB_URI=mongodb+srv://jorgerivas_db_user:x3ZJokKf7RbIOHk6@jorgemario.3axpa2x.mongodb.net/peliculas?retryWrites=true&w=majority&appName=JorgeMario
NODE_ENV=production
EOF
    echo "✅ Archivo .env creado para backend"
else
    echo "📄 PELICULAS-BACK/.env ya existe"
fi

# Crear .env para frontend si no existe
if [ ! -f "PELICULAS-FRONT/.env" ]; then
    echo "📝 Creando PELICULAS-FRONT/.env..."
    cat > PELICULAS-FRONT/.env << EOF
REACT_APP_API_URL=http://localhost:8080/api
EOF
    echo "✅ Archivo .env creado para frontend"
else
    echo "📄 PELICULAS-FRONT/.env ya existe"
fi

echo ""
echo "3. Construyendo imágenes Docker..."
echo "   Esto puede tomar unos minutos la primera vez..."
docker-compose build

echo ""
echo "4. Iniciando contenedores..."
docker-compose up -d

echo ""
echo "⏳ Esperando que los servicios inicien (15 segundos)..."
sleep 15

echo ""
echo "5. Verificando estado de los contenedores..."
docker-compose ps

echo ""
echo "===================================================="
echo "✅ CONFIGURACIÓN COMPLETADA!"
echo ""
echo "🌐 TU APLICACIÓN ESTÁ DISPONIBLE EN:"
echo "   • Frontend:  http://localhost:3000"
echo "   • Backend API: http://localhost:8080/api"
echo ""
echo "🔧 COMANDOS ÚTILES:"
echo "   • Ver logs: docker-compose logs -f"
echo "   • Detener: docker-compose down"
echo "   • Reiniciar: docker-compose restart"
echo "   • Estado: docker-compose ps"
echo ""
echo "🐛 PARA SOLUCIONAR PROBLEMAS:"
echo "   • Ver logs del backend: docker-compose logs backend"
echo "   • Ver logs del frontend: docker-compose logs frontend"
echo "   • Probar API: curl http://localhost:8080/api"
echo "===================================================="