create database pi2dsm;

use pi2dsm;

CREATE TABLE Aluno (
    ID_Aluno INT PRIMARY key AUTO_INCREMENT,
    Nome_Aluno VARCHAR(100),
    Documento_Aluno VARCHAR(50),
    Data_Nasc DATE,
    Telefone VARCHAR(20),
    Email VARCHAR(100),
    Curso VARCHAR(100)
);

CREATE TABLE Professor (
    ID_Professor INT PRIMARY key AUTO_INCREMENT,
    Nome_Professor VARCHAR(100),
    Documento_Professor VARCHAR(50),
    Data_Nasc DATE,
    Telefone VARCHAR(20),
    Email VARCHAR(100),
    Disciplinas_Ministradas VARCHAR(100)
);

CREATE TABLE Disciplina (
    ID_Disciplina INT PRIMARY key AUTO_INCREMENT,
    Nome_Disciplina VARCHAR(100),
    Carga_Horaria INT
);

CREATE TABLE Avaliacoes (
    ID_Disciplina INT,
    ID_Aluno INT,
    Nota1 DECIMAL(5,2),
    Nota2 DECIMAL(5,2),
    Nota3 DECIMAL(5,2),
    Media_Final DECIMAL(5,2),
    Presencas INT,
    Ausencias INT,
    PRIMARY KEY (ID_Disciplina, ID_Aluno),
    FOREIGN KEY (ID_Disciplina) REFERENCES Disciplina(ID_Disciplina),
    FOREIGN KEY (ID_Aluno) REFERENCES Aluno(ID_Aluno)
);

CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) not null, 
    usuario VARCHAR(50) NOT NULL,
    senha VARCHAR(50) NOT NULL
);

INSERT INTO usuario (nome, usuario, senha) VALUES 
('João Silva', 'joao.silva', '1234'),
('Carlos Costa', 'carlos.costa', '5678'),
('José Oliveira', 'jose.oliveira', '123456');

select * from usuario u 

INSERT INTO Aluno (Nome_Aluno, Documento_Aluno, Data_Nasc, Telefone, Email, Curso) VALUES 
('João Silva', '12345678901', '2000-07-10', '91234-5678', 'joao.silva@example.com', 'Engenharia de Software'),
('Carlos Costa', '12345678902', '2002-01-15', '91234-5679', 'carlos.costa@example.com', 'Engenharia de Software'),
('José Oliveira', '12345678903', '2001-03-21', '91234-5680', 'jose.oliveira@example.com', 'Engenharia de Software'),
('Max Silva', '12345678904', '1998-04-01', '91234-5681', 'max.silva@example.com', 'Engenharia de Software'),
('John Jones', '12345678905', '2000-05-22', '91234-5682', 'john.jones@example.com', 'Engenharia de Software'),
('Anderson Silva', '12345678906', '1999-10-13', '91234-5683', 'anderson.silva@example.com', 'Engenharia de Software'),
('Amanda Teixeira', '12345678907', '1995-01-07', '91234-5684', 'amanda.teixeira@example.com', 'Engenharia de Software'),
('Caroline Santos', '12345678908', '1992-12-03', '91234-5685', 'caroline.santos@example.com', 'Engenharia de Software'),
('Karen Turner', '12345678909', '2003-04-30', '91234-5686', 'karen.turner@example.com', 'Engenharia de Software'),
('Gabriel Gonçalves', '12345678910', '2001-11-27', '91234-5687', 'gabriel.gonçalves@example.com', 'Engenharia de Software');


INSERT INTO Professor (Nome_Professor, Documento_Professor, Data_Nasc, Telefone, Email, Disciplinas_Ministradas) values
('Maria Oliveira', '98765432100', '1980-11-20', '99876-5432', 'maria.oliveira@example.com', 'Cálculo I'),
('Benecildo Riguetto', '98765432101', '1975-02-12', '99876-5431', 'benecildo.riguetto@example.com', 'Química p/ Engenharia'),
('Alex Silva', '98765432102', '1982-07-25', '99876-5430', 'alex.silva@example.com', 'Geometria Analítica'),
('Igor Mendez', '98765432103', '1987-03-13', '99876-5429', 'igor.mendez@example.com', 'Metodologia Científica'),
('Letícia Branco', '98765432104', '1971-10-05', '99876-5428', 'leticia.branco@example.com', 'Física I'),
('Marli Santos', '98765432105', '1967-09-30', '99876-542', 'marli.santos@example.com', 'Ciências do Ambiente');

INSERT INTO Disciplina (Nome_Disciplina, Carga_Horaria) values
('Cálculo I', 80),
('Química p/ Engenharia', 80),
('Geometria Analítica', 80),
('Metodologia Científica', 40),
('Física I', 80),
('Ciências do Ambiente', 40);

select * from aluno a 

select* from avaliacoes 

INSERT INTO Avaliacoes (ID_Disciplina, ID_Aluno, Nota1, Nota2, Nota3, Media_Final, Presencas, Ausencias) values
(1, 1, 8.5, 7, 9.5, 8.33, 72, 8),
(2, 1, 4, 7, 10, 7, 68, 12),
(3, 1, 6.5, 5, 9.5, 7, 74, 6),
(4, 1, 8.5, 8, 9.5, 8.67, 30, 10),
(5, 1, 8, 7, 5, 6.67, 60, 20),
(6, 1, 9, 9, 10, 9.33, 34, 6);

INSERT INTO Avaliacoes (ID_Disciplina, ID_Aluno, Nota1, Nota2, Nota3, Media_Final, Presencas, Ausencias) values
(1, 2, 7.5, 7, 6.5, 7, 72, 8),
(2, 2, 4, 4, 5, 4.33, 68, 12),
(3, 2, 6.5, 8, 9.5, 8, 74, 6),
(4, 2, 8.5, 8, 9, 8.5, 30, 10),
(5, 2, 0, 6, 9, 5, 60, 20),
(6, 2, 5, 10, 9, 8, 34, 6);

INSERT INTO Avaliacoes (ID_Disciplina, ID_Aluno, Nota1, Nota2, Nota3, Media_Final, Presencas, Ausencias) values
(1, 3, 0, 2, 0, 7, 46, 34),
(2, 3, 10, 10, 10, 10, 80, 0),
(3, 3, 2, 3, 10, 5, 72, 8),
(4, 3, 9.5, 10, 9, 9.5, 38, 2),
(5, 3, 4, 7, 8, 6.33, 70, 10),
(6, 3, 3, 4, 0, 2.33, 20, 20);

