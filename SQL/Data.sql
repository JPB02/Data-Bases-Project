-- -- 
-- Universidade do Minho
-- Unidade Curricular de Bases de Dados
-- Caso de Estudo: Desafio Atlético
-- Povoamento da Base de Dados
-- 2024, Outubro/Novembro
-- João Pedro da Silva Barbosa
-- --

USE DesafioAtletico;

INSERT INTO Pais
	(Pais)
    VALUES
		('Portugal'),
        ('USA');
        
INSERT INTO Cidade
	(Cidade, Id_Pais)
    VALUES
		('Braga', 1),
        ('Los Angeles', 2),
        ('Viana do Castelo', 1),
        ('Guimarães', 1);
        
INSERT INTO Morada
	(Morada, Distrito, Codigo_Postal, Id_Cidade)
    VALUES
		('Rua da Universidade', 'Braga', '4710-057', 1),
        ('1000 Vin Scully Ave', NULL, '90090', 2),
        ('Rua Escola Industrial e Comercial de NunAlvares', 'Viana do Castelo', '4900-367', 3);

INSERT INTO Modalidade
	(Nome, Tipo, Nr_Jogadores)
    VALUES
		('Futebol', 'Equipa', 11),
        ('Badminton', 'Individual', 1);
        
INSERT INTO Patrocinador
	(Marca, eMail)
    VALUES
    ('Sumol', 'contacto@sumol.pt'),
    ('LG', 'contacto@LG.com');
        
INSERT INTO Funcionario
	(Nome, Data_de_Nascimento, eMail, Telemovel, Cargo, Id_Morada)
    VALUES
    ('Luke Hemmings', '1996-07-16', 'luke.hemmings@desafioatletico.org', '901684924', 'Organizador', 1),
    ('Ashton Irwin', '1994-07-07', 'ashton.irwin@desafioatletico.org', '912864940', 'Árbitro', 2);
        
INSERT INTO Torneio
	(Nome, Faixa_Etaria, Data_Inicio, Data_Fim, Id_Patrocinador)
    VALUES
		('Torneio Juvenil de Verão', 'Juvenil', '2024-08-01', '2024-09-01', 1),
        ('Torneio Senior de Inverno', 'Senior', '2024-12-01', '2025-01-10', NULL),
        ('Torneio Infantil de Natal', 'Infantil', '2024-12-15', '2024-12-23', 2);
        
INSERT Funcionario_Torneio
	(Id_Funcionario, Id_Torneio)
    VALUES
    (1, 1),
    (1, 2),
    (2, 2);
        
INSERT INTO Equipa
	(Nome, Faixa_Etaria, Id_Torneio, Id_Cidade)
    VALUES
    ('Bracara Augusta', 'Juvenil', 1, 1),
    ('Los Angeles Elders', 'Senior', 2, 2),
    ('Os Vianenses', 'Infantil', 3, 3),
    ('Guimeiros', 'Juvenil', 1, 4);
    
INSERT INTO Atleta
	(Nome, Faixa_Etaria, Data_de_Nascimento, Id_Pais, Id_Equipa)
    VALUES
    ('Dean Winchester', 'Senior', '1979-01-24', 2, '2'),
    ('César Augusto Jr.', 'Juvenil', '2010-05-11', 1, 1),
    ('Ana Bacalhau', 'Infantil', '2017-01-01', 1, 3),
    ('Rufus Oliveira', 'Juvenil', '2009-07-04', 1, 4),
    ('Afonso Bacon', 'Senior', '1982-02-14', 1, NULL),
    ('Flávio Peixe', 'Senior', '1975-09-19', 1, NULL),
    ('João das Neves', 'Senior', '1975-03-26', 1, 2);
    
INSERT INTO Jogo
	(Id_Modalidade, Data_Jogo, Tipo_Jogo, Pontuacao_Participante1, Pontuacao_Participante2, Id_Torneio)
    VALUES
    (1, '2024-08-01 10:30:00', 'Equipa', 3, 2, 1), -- Vitória Equipa 1 (E1 +3p, E2+0p) (Equipa)
    (1, '2024-12-05 17:00:00', 'Individual', 10, 10, 2); -- Empate (Individual)
    
INSERT INTO Jogo_Individual
	(Id_Jogo, Id_Participante1, Id_Participante2)
    VALUES
    (2, 5, 6);

INSERT INTO Jogo_Equipa
	(Id_Jogo, Id_Equipa1, Id_Equipa2)
	VALUES
	(1, 1, 4);
    
INSERT INTO Classificacao_Equipa
	(Id_Torneio, Id_Equipa, Pontos)
    VALUES
    (1, 1, 3),
    (1, 4, 0);

INSERT INTO Classificacao_Individual
	(Id_Torneio, Id_Atleta, Pontos)
    VALUES
	(2, 5, 1),
    (2, 6, 1);

INSERT INTO Espectador
	(Nome)
    VALUES
    ('Artur Mendes Oliveira'),
    ('Floribela Castro'),
    ('Mateus Pereira');
    
INSERT INTO Espectador_Jogo
	(Id_Espectador, Id_Jogo)
    VALUES
    (1, 1),
    (1, 2),
    (2, 2),
    (3, 2);
