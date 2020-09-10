CREATE DATABASE CLIG;

USE CLIG;

CREATE TABLE SISTEMA (
	codigo INT AUTO_INCREMENT PRIMARY KEY, 
	nome VARCHAR(255) NOT NULL,
	descricao TEXT NOT NULL,
    idProgramador INT,
    cliente_Codigo INT NOT NULL,
    FOREIGN KEY (idProgramador) REFERENCES Programador (codigo),
	FOREIGN KEY (cliente_Codigo) REFERENCES CLIENTES (codigo)
);

/*Verifica total de clientes ativos que possua um sistema:

select *, count(s.nome) as 'Total de Registros' from sistema s
inner JOIN clientes c on c.Codigo = s.cliente_Codigo
where status like 'ativo%'; 
*/

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
    IdSistema INT,
    idCliente INT,
    idLinguagem INT,
	FOREIGN KEY (idSistema) REFERENCES SISTEMA (codigo),
    FOREIGN KEY (idCliente) REFERENCES CLIENTES (codigo),
    FOREIGN KEY (idLinguagem) REFERENCES Linguagens (codigo)	
);


CREATE TABLE CLIENTES(
	Codigo INT AUTO_INCREMENT PRIMARY KEY,
	Nome VARCHAR(255) NOT NULL,
	Servidor VARCHAR(255) NOT NULL,
	status ENUM ('ativo','inativo')
);

/*Verifica total de clientes ativos, mesmo que não esteja vinculado a um sistema.

select *, count(nome) as 'Total de Clientes' from clientes where status like 'ativo%'
*/

CREATE TABLE Programador (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Nome Varchar(255)
);

CREATE TABLE Linguagens (
	Codigo INT AUTO_INCREMENT PRIMARY KEY,
	Nome VARCHAR(255) NOT NULL
);


/* Este select é foi feito para exibir o nome de cada cliente, sistema ou linguagem ao invés de mostrar o código. 

SELECT t.Codigo, t.Nome, t.Comando, t.Periodicidade, t.Horario, t.QuantidadeMinutosEsperadoExecucao, t.StatusTarefa, 
t.StatusSistema, t.DataCadastro, c.nome as 'Cliente', l.nome as 'linguagem', s.nome as 'Sistema'
FROM tarefas t
INNER JOIN clientes c on  c.codigo = t.idCliente
INNER JOIN sistema s on s.codigo = t.IdSistema
INNER JOIN linguagens l on l.codigo = t.idLinguagem
*/

