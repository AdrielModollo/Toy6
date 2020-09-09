CREATE DATABASE CLIG;

USE CLIG;

CREATE TABLE SISTEMA (
	codigo INT AUTO_INCREMENT PRIMARY KEY, 
	nome VARCHAR(255) NOT NULL
);

CREATE TABLE TAREFAS(
	Codigo INT AUTO_INCREMENT PRIMARY KEY, 
	Nome VARCHAR(255) NOT NULL,
	Comando TEXT,
	Periodicidade ENUM ('diaria','semanal','mensal','semestral','anual'),
	Horario TIME,
	QuantidadeMinutosEsperadoExecucao INT,
	StatusTarefa ENUM ('parado','executando','travado'),
	StatusSistema TINYINT,
	DataCadastro DATETIME,
	idLinguagem INT,
	IdSistema INT,
	FOREIGN KEY (idLinguagem) REFERENCES LINGUAGENS (codigo),
	FOREIGN KEY (idSistema) REFERENCES PROJETOS (codigo)
);

CREATE TABLE LINGUAGENS(
	codigo INT AUTO_INCREMENT PRIMARY KEY, 
	nome VARCHAR(255) NOT NULL,
	tarefas_idLinguagem INT NOT NULL,
	FOREIGN KEY(tarefas_idLinguagem) REFERENCES tarefas (idLinguagem)
);

CREATE TABLE PROJETOS(
	codigo INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	descricao TEXT NOT NULL,
	quantidadeClientesAtivos INT NOT NULL
);

CREATE TABLE CLIENTES(
	Codigo INT AUTO_INCREMENT PRIMARY KEY,
	Nome VARCHAR(255) NOT NULL,
	Servidor VARCHAR(255) NOT NULL,
	status ENUM ('ativo','inativo'),
	sistema_Codigo INT NOT NULL,
	FOREIGN KEY (sistema_codigo) REFERENCES SISTEMA (codigo)
);