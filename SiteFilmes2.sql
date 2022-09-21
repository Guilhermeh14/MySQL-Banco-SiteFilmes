CREATE DATABASE IF NOT EXISTS SiteFilmes;
USE SiteFilmes;

CREATE TABLE IF NOT EXISTS TipoAtuacao (
	IdTipoAtuacao INT UNSIGNED NOT NULL AUTO_INCREMENT,
    NomeTipoAtuacao VARCHAR (50),
    PRIMARY KEY (IdTipoAtuacao)
);

CREATE TABLE IF NOT EXISTS Genero (
	IdGenero INT UNSIGNED NOT NULL AUTO_INCREMENT,
    NomeGenero VARCHAR (50),
    PRIMARY KEY (IdGenero)
);

CREATE TABLE IF NOT EXISTS Pais (
	IdPais INT UNSIGNED NOT NULL AUTO_INCREMENT,
    NomePais VARCHAR (50),
    PRIMARY KEY (IdPais)
);

CREATE TABLE IF NOT EXISTS Pessoa (
	IdPessoa INT UNSIGNED NOT NULL AUTO_INCREMENT,
    IdPais INT UNSIGNED NOT NULL,
    NomePessoa VARCHAR (60),
    PRIMARY KEY (IdPessoa)
);

ALTER TABLE Pessoa ADD CONSTRAINT FK_Pessoa_Pais
FOREIGN KEY (IdPais) REFERENCES Pais(IdPais);

CREATE TABLE IF NOT EXISTS Filme (
	IdFilme INT UNSIGNED NOT NULL AUTO_INCREMENT,
    NomeFilme VARCHAR (200),
    Sinopse	 VARCHAR (8000),
    Duracao INT,
    AnoEstreia DATE,
    PRIMARY KEY (IdFilme)
);

CREATE TABLE IF NOT EXISTS PaisFilme (
	IdFilme INT UNSIGNED NOT NULL,
    IdPais INT UNSIGNED NOT NULL,
    PRIMARY KEY(IdFilme,IdPais)
);

ALTER TABLE PaisFilme ADD CONSTRAINT FK_PaisFilme_Filme
FOREIGN KEY (IdFilme) REFERENCES Filme(IdFilme);

ALTER TABLE PaisFilme ADD CONSTRAINT FK_PaisFilme_Pais
FOREIGN KEY (IdPais) REFERENCES Pais(IdPais);

CREATE TABLE IF NOT EXISTS Equipe (
	IdPessoa INT UNSIGNED NOT NULL,
	IdFilme INT UNSIGNED NOT NULL,
    IdTipoAtuacao INT UNSIGNED NOT NULL,
    PRIMARY KEY (IdPessoa,IdFilme,IdTipoAtuacao)
);

CREATE TABLE IF NOT EXISTS GeneroFilme (
	IdFilme INT UNSIGNED NOT NULL,
    IdGenero INT UNSIGNED NOT NULL,
    PRIMARY KEY(IdFilme,IdGenero)
);

ALTER TABLE GeneroFilme ADD CONSTRAINT FK_GeneroFilme_Filme
FOREIGN KEY (IdFilme) REFERENCES Filme(IdFilme);

ALTER TABLE GeneroFilme ADD CONSTRAINT FK_GeneroFilme_Genero
FOREIGN KEY (IdGenero) REFERENCES Genero(IdGenero);

ALTER TABLE Equipe ADD CONSTRAINT FK_Equipe_Pessoa
FOREIGN KEY (IdPessoa) REFERENCES Pessoa(IdPessoa);

ALTER TABLE Equipe ADD CONSTRAINT FK_Equipe_Filme
FOREIGN KEY (IdFilme) REFERENCES Filme(IdFilme);

ALTER TABLE Equipe ADD CONSTRAINT FK_Equipe_TipoAtuacao
FOREIGN KEY (IdTipoAtuacao) REFERENCES TipoAtuacao(IdTipoAtuacao);

INSERT INTO Genero(NomeGenero) VALUES ('Acão'),('Suspense'),('Terror'),('Comédia'),('Drama');

INSERT INTO Pais(NomePais) VALUES ('Canadá'),('Portugal'),('Espanha'),('Estados Unidos'),('Reino Unido');

INSERT INTO Filme(NomeFilme, Sinopse, Duracao, AnoEstreia) VALUES 
('A Colonia','A era glacial força um grupo de sobreviventes a viver em um mundo subterrâneo, e agora eles devem lutar para preservar a humanidade contra algo mais selvagem do que a natureza.',95,'2013/04/26'),
('Chamada de Emergência','dolescente raptada consegue ligar para serviço de emergência e pedir socorro. A atendente reconhece a voz do assassino perigoso que fez parte de seu passado e precisa ajudar a salvar a vida da menina sequestrada.',94,'2013/04/12'),
('Mama','Quando o pai de Victoria e Lilly mata a esposa, as meninas fogem assustadas. Durante cinco anos, ninguém sabe delas, até o dia em que reaparecem, sem explicação de como sobreviveram. Os tios Lucas e Annabel adotam as irmãs e tentam lhes dar uma vida tranquila, mas logo percebem que existe algo errado. As duas conversam frequentemente com uma entidade invisível que chamam de Mama. Lucas e Annabel não sabem se acreditam nas meninas ou se devem culpá-las pelos estranhos acontecimentos na casa.',100,'2013/04/05'),
('Familia do Bagulho','Um traficante é forçado por seu chefe a ir ao México pegar uma carga de maconha. A fim de melhorar suas chances de passar pela fronteira, David pede a uma stripper e dois adolescentes locais para acompanhá-lo e fingir que são uma família em férias.',110,'2013/09/27'),
('Diana','Prestes a se divorciar de Charles, a princesa Diana divide seu tempo entre a solidão da vida no palácio em que vive e os compromissos que possui com diversas entidades beneficentes. Um dia, ela vai visitar um amigo que está internado em um hospital e lá conhece o doutor Hasnat Khan. Diana fica encantada pelo fato dele não a tratar como uma princesa. Não demora muito para que iniciem um relacionamento, mantido em segredo devido ao desejo de Hasnat em ter uma vida reservada.',113,'2013/10/18');

INSERT INTO GeneroFilme VALUES (1, 1);

INSERT INTO GeneroFilme VALUES (2, 2);

INSERT INTO GeneroFilme VALUES (3, 3);

INSERT INTO GeneroFilme VALUES (4, 4);

INSERT INTO GeneroFilme VALUES (5, 5);

INSERT INTO PaisFilme VALUES (1, 1);

INSERT INTO PaisFilme VALUES (2, 2);

INSERT INTO PaisFilme VALUES (3, 3);

INSERT INTO PaisFilme VALUES (4, 4);

INSERT INTO PaisFilme VALUES (5, 5);

INSERT INTO Pessoa VALUES (1, 1,'Guilherme');

UPDATE Pessoa 
SET NomePessoa = 'Gallo'
WHERE IdPessoa = 1;

DELETE FROM GeneroFilme 
WHERE IdFilme = 1;

DELETE FROM PaisFilme 
WHERE IdFilme = 1;

DELETE FROM Filme 
WHERE IdFilme = 1;