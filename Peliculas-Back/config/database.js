const mongoose = require('mongoose');

const getConnection = async () => {
    try {
        // Usar la variable de entorno correcta
        const url = process.env.MONGODB_URI || process.env.MONGO_URI;
        
        if (!url) {
            throw new Error('MongoDB URI no está definida en las variables de entorno');
        }
        
        await mongoose.connect(url);
        console.log('✅ Database connected successfully');
        
    } catch (error) {
        console.error('❌ Error connecting to database:', error.message);
        process.exit(1);
    }
}

module.exports = {
    getConnection,
};