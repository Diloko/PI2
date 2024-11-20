const express = require('express');
const mysql = require('mysql2');
const multer = require('multer');
const upload = multer();

const app = express();
const port = 3000;

// Configuração do middleware para processar dados do formulário
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(upload.array()); // Adiciona multer para processar multipart/form-data

// Configuração para servir arquivos estáticos
app.use(express.static('public'));

// Importar rotas
const routes = require('./routes/index');
app.use('/', routes);

app.listen(port, () => {
    console.log(`Servidor rodando em http://localhost:${port}`);
});
