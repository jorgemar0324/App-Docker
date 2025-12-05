import axios from "axios";

const axiosConfig = axios.create({
    baseURL: process.env.REACT_APP_API_URL || "http://localhost:8080/api",
    timeout: 10000,
    headers: {
        'Content-Type': 'application/json'
    }
});

export {axiosConfig};