#!/bin/bash

echo "🧪 PRUEBA DEL SISTEMA DE PELÍCULAS"
echo "=================================="

echo ""
echo "1. Verificando contenedores..."
docker-compose ps

echo ""
echo "2. Probando conexión al backend..."
echo "   URL: http://localhost:8080/api/productora"
curl -s -o /tmp/response.txt -w "Código HTTP: %{http_code}\n" http://localhost:8080/api

echo ""
echo "3. Contenido de la respuesta:"
cat /tmp/response.txt | jq . 2>/dev/null || cat /tmp/response.txt

echo ""
echo "4. Verificando frontend..."
echo "   URL: http://localhost:3000"
curl -s -o /dev/null -w "Código HTTP: %{http_code}\n" http://localhost:3000

echo ""
echo "5. Últimos logs del backend:"
docker-compose logs --tail=3 backend

echo ""
echo "=================================="
echo "✅ Prueba completada"
echo "   Frontend: http://localhost:3000"
echo "   Backend:  http://localhost:8080/api"