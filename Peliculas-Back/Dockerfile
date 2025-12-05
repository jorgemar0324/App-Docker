# Usar versión específica de Node.js
FROM node:18-alpine

# Crear directorio de trabajo
WORKDIR /app

# Copiar archivos de configuración de dependencias
COPY package*.json ./

# Instalar dependencias
RUN npm install --only=production

# Se copia el resto del código
COPY . .

# Exponer el puerto que usa tu backend (8080)
EXPOSE 8080

# Comando para iniciar la aplicación
CMD ["npm", "start"]