const express = require('express');
const mysql = require('mysql2');
const router = express.Router();

// Configuração do banco de dados
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'seu_usuario',
    password: 'sua_senha',
    database: 'pi2dsm'
});

connection.connect((err) => {
    if (err) throw err;
    console.log('Conectado ao banco de dados!');
});

// Rota para exibir o formulário de login
router.get('/', (req, res) => {
    res.sendFile('index.html', { root: './public' });
});

// Rota para processar o login e exibir os dados da tabela Avaliacoes
router.post('/login', (req, res) => {
    console.log('Dados recebidos do formulário:', req.headers['content-type']);
    console.log(req.body);

    const { usuario, senha } = req.body;
    console.log(`Usuário: ${usuario}, Senha: ${senha}`);

    // Verificar credenciais de login
    const query = 'SELECT * FROM usuario WHERE usuario = ? AND senha = ?';
    connection.query(query, [usuario, senha], (err, results) => {
        if (err) throw err;
        if (results.length > 0) {
            const nomeUsuario = results[0].nome;

            // Obter ID_Aluno da tabela Aluno
            const alunoQuery = 'SELECT ID_Aluno FROM Aluno WHERE Nome_Aluno = ?';
            connection.query(alunoQuery, [nomeUsuario], (err, alunoResults) => {
                if (err) throw err;
                if (alunoResults.length > 0) {
                    const ID_Aluno = alunoResults[0].ID_Aluno;

                    // Obter dados da tabela Avaliacoes
                    const avaliacoesQuery = 'SELECT * FROM Avaliacoes WHERE ID_Aluno = ?';
                    connection.query(avaliacoesQuery, [ID_Aluno], (err, avaliacoesResults) => {
                        if (err) throw err;

                        let tableRows = '';
                        avaliacoesResults.forEach(row => {
                            tableRows += `
                            <tr>
                                <td>${row.ID_Disciplina}</td>
                                <td>${row.ID_Aluno}</td>
                                <td>${row.Nota1}</td>
                                <td>${row.Nota2}</td>
                                <td>${row.Nota3}</td>
                                <td>${row.Media_Final}</td>
                                <td>${row.Presencas}</td>
                                <td>${row.Ausencias}</td>
                            </tr>
                            `;
                        });

                        res.send(`
                        <html>
                            <head>
                                <title>Sistema Escolar</title>
                                <link rel="stylesheet" href="style.css">
                            </head>
                            <body>
                                <table border="1">
                                    <thead>
                                        <tr>
                                            <th>ID Disciplina</th>
                                            <th>ID Aluno</th>
                                            <th>Nota1</th>
                                            <th>Nota2</th>
                                            <th>Nota3</th>
                                            <th>Media Final</th>
                                            <th>Presenças</th>
                                            <th>Ausências</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        ${tableRows}
                                    </tbody>
                                </table>
                            </body>
                        </html>
                        `); // Retorna a estrutura completa da página com a tabela
                    });
                } else {
                    res.send('Aluno não encontrado.');
                }
            });
        } else {
            res.send('Usuário ou senha incorretos.');
        }
    });
});

module.exports = router;
