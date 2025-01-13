-- -- 
-- Universidade do Minho
-- Unidade Curricular de Bases de Dados
-- Caso de Estudo: Desafio Atlético
-- Implementação do Esquema Global
-- 2024, Outubro/Novembro
-- João Pedro da Silva Barbosa
-- --

-- Remoção da Base de Dados caso já exista
DROP SCHEMA IF EXISTS DesafioAtletico;

-- Criação da Base de Dados
CREATE DATABASE DesafioAtletico
	DEFAULT CHARSET=utf8mb4
    DEFAULT ENCRYPTION='N';

-- Indicação da base de dados de trabalho
USE DesafioAtletico;

-- Criação da Tabela "Pais"
CREATE TABLE Pais (
	Id_Pais INT NOT NULL AUTO_INCREMENT,
    Pais VARCHAR(50) NOT NULL,
		PRIMARY KEY (Id_Pais)
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;

-- Criação da Tabela "Cidade"
CREATE TABLE Cidade (
	Id_Cidade INT NOT NULL AUTO_INCREMENT,
    Cidade VARCHAR(50) NOT NULL,
    Id_Pais INT NOT NULL,
		PRIMARY KEY (Id_Cidade),
		FOREIGN KEY (Id_Pais) REFERENCES Pais(Id_Pais)
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;

-- Criação da Tabela "Morada"
CREATE TABLE Morada (
	Id_Morada INT NOT NULL AUTO_INCREMENT,
    Morada VARCHAR(50) NOT NULL,
    Distrito VARCHAR(20) NULL, -- Caso não haja distrito (ex. USA)
    Codigo_Postal VARCHAR(10) NOT NULL,
    Id_Cidade INT NOT NULL,
		PRIMARY KEY (Id_Morada),
		FOREIGN KEY (Id_Cidade) REFERENCES Cidade(Id_Cidade)
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;

-- Criação da Tabela "Modalidade"
CREATE TABLE Modalidade (
	Id_Modalidade INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(25) NOT NULL,
    Tipo ENUM ('Individual', 'Equipa') NOT NULL,
    Nr_Jogadores INT NOT NULL,
		PRIMARY KEY (Id_Modalidade)
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;
    
-- Criação da Tabela "Patrocinador"
CREATE TABLE Patrocinador (
	Id_Patrocinador INT NOT NULL AUTO_INCREMENT,
    Marca VARCHAR(50) NOT NULL,
    eMail VARCHAR(100) NOT NULL,
		PRIMARY KEY (Id_Patrocinador)
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;
    
-- Criação da Tabela "Torneio" (1 Torneio tem Apenas 1 Patrocinador, ou nenhum:NULL!)
CREATE TABLE Torneio (
	Id_Torneio INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Faixa_Etaria ENUM ('Juvenil', 'Senior', 'Infantil') NOT NULL,
    Data_Inicio DATE NOT NULL,
    Data_Fim DATE NOT NULL,
    Id_Patrocinador INT, -- Pode ser NULL se não tiver patrocinador
		PRIMARY KEY (Id_Torneio),
        FOREIGN KEY (Id_Patrocinador) REFERENCES Patrocinador(Id_Patrocinador)
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;
	
-- Criação da Tabela "Equipa"
CREATE TABLE Equipa (
	Id_Equipa INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(25) NOT NULL,
    Faixa_Etaria ENUM ('Juvenil', 'Senior', 'Infantil') NOT NULL,
    Id_Torneio INT NOT NULL,
    Id_Cidade INT NOT NULL,
		PRIMARY KEY (Id_Equipa),
        FOREIGN KEY (Id_Torneio) REFERENCES Torneio(Id_Torneio),
        FOREIGN KEY (Id_Cidade) REFERENCES Cidade(Id_Cidade)
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;
    
-- Criação da Tabela "Atleta"
CREATE TABLE Atleta (
	Id_Atleta INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR (100) NOT NULL,
    Faixa_Etaria ENUM ('Juvenil', 'Senior', 'Infantil') NOT NULL,
    Data_de_Nascimento DATE NULL,
    Id_Pais INT NOT NULL,
    Id_Equipa INT NULL, -- NULL caso não tenha equipa
		PRIMARY KEY (Id_Atleta),
        FOREIGN KEY (Id_Pais) REFERENCES Pais(Id_Pais),
        FOREIGN KEY (Id_Equipa) REFERENCES Equipa(Id_Equipa)
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;
    
-- Criação da Tabela "Jogo"
CREATE TABLE Jogo (
	Id_Jogo INT NOT NULL AUTO_INCREMENT,
    Id_Modalidade INT NOT NULL,
    Data_Jogo DATETIME NOT NULL,
    Tipo_Jogo ENUM ('Equipa', 'Individual'),
    Pontuacao_Participante1 INT,
    Pontuacao_Participante2 INT,
    Id_Torneio INT NOT NULL,
		PRIMARY KEY (Id_Jogo),
        FOREIGN KEY (Id_Modalidade) REFERENCES Modalidade(Id_Modalidade),
        FOREIGN KEY (Id_Torneio) REFERENCES Torneio(Id_Torneio)
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;
    
-- Criação da Tabela "Jogo_Individual"
CREATE TABLE Jogo_Individual (
	Id_Jogo INT NOT NULL,
	Id_Participante1 INT NOT NULL,
    Id_Participante2 INT NOT NULL,
		PRIMARY KEY (Id_Jogo),
		FOREIGN KEY (Id_Participante1) REFERENCES Atleta(Id_Atleta),
        FOREIGN KEY (Id_Participante2) REFERENCES Atleta(Id_Atleta)
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;
    
-- Criação da Tabela "Jogo_Equipa"
CREATE TABLE Jogo_Equipa (
	Id_Jogo INT NOT NULL,
    Id_Equipa1 INT NOT NULL,
    ID_Equipa2 INT NOT NULL,
		PRIMARY KEY (Id_Jogo),
		FOREIGN KEY (Id_Equipa1) REFERENCES Equipa(Id_Equipa),
        FOREIGN KEY (Id_Equipa2) REFERENCES Equipa(Id_Equipa)
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;
    
-- Criação da Tabela "Classificacao_Individual"
CREATE TABLE Classificacao_Individual (
	Id_Classificacao_Individual INT NOT NULL AUTO_INCREMENT,
    Id_Torneio INT NOT NULL,
    Id_Atleta INT NOT NULL,
    Pontos INT,
		PRIMARY KEY (Id_Classificacao_Individual),
        FOREIGN KEY (Id_Torneio) REFERENCES Torneio(Id_Torneio),
        FOREIGN KEY (Id_Atleta) REFERENCES Atleta(Id_Atleta)
)		
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;
    
-- Criação da Tabela "Classificacao_Equipa"
CREATE TABLE Classificacao_Equipa (
	Id_Classificacao_Equipa INT NOT NULL AUTO_INCREMENT,
    Id_Torneio INT NOT NULL,
    Id_Equipa INT NOT NULL,
    Pontos INT,
		PRIMARY KEY (Id_Classificacao_Equipa),
        FOREIGN KEY (Id_Torneio) REFERENCES Torneio(Id_Torneio),
        FOREIGN KEY (Id_Equipa) REFERENCES Equipa(Id_Equipa)
)		
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;
    
-- Criação da Tabela "Funcionario"
CREATE TABLE Funcionario (
	Id_Funcionario INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
	Data_de_Nascimento DATE NULL,
	eMail VARCHAR(100) NOT NULL,
    Telemovel VARCHAR(9) NOT NULL,
    Cargo ENUM ('Organizador', 'Árbitro'),
    Id_Morada INT NOT NULL,
		PRIMARY KEY (Id_Funcionario),
        FOREIGN KEY (Id_Morada) REFERENCES Morada(Id_Morada)
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;
    
-- Criação da Tabela Relação "Funcionario_Torneio"
CREATE TABLE Funcionario_Torneio (
	Id_Funcionario INT NOT NULL,
    Id_Torneio INT NOT NULL,
		PRIMARY KEY (Id_Funcionario, Id_Torneio),
        FOREIGN KEY (Id_Funcionario) REFERENCES Funcionario(Id_Funcionario) ON DELETE CASCADE,
        FOREIGN KEY (Id_Torneio) REFERENCES Torneio(Id_Torneio) ON DELETE CASCADE
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;
    
-- Criação da Tabela "Espectador"
CREATE TABLE Espectador (
	Id_Espectador INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
		PRIMARY KEY (Id_Espectador)
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;

-- Criação da Tabela Relação "Espectador_Jogo"
CREATE TABLE Espectador_Jogo (
    Id_Espectador INT NOT NULL,
    Id_Jogo INT NOT NULL,
		PRIMARY KEY (Id_Espectador, Id_Jogo),
		FOREIGN KEY (Id_Espectador) REFERENCES Espectador(Id_Espectador) ON DELETE CASCADE,
		FOREIGN KEY (Id_Jogo) REFERENCES Jogo(Id_Jogo) ON DELETE CASCADE
)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8mb4;

-- Indexação
CREATE INDEX nome_do_torneio ON Torneio(Nome);
CREATE INDEX data_inicio_torneio ON Torneio(Data_Inicio);
CREATE INDEX data_fim_torneio ON Torneio(Data_Fim);

CREATE INDEX data_jogo ON Jogo(Data_Jogo);
  
SHOW INDEX FROM Jogo;