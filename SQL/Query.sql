-- -- 
-- Universidade do Minho
-- Unidade Curricular de Bases de Dados
-- Caso de Estudo: Desafio Atlético
-- Queries na Base de Dados
-- 2024, Outubro/Novembro
-- João Pedro da Silva Barbosa
-- --

USE DesafioAtletico;
SHOW TABLES;

-- QUERY 1: Pontuações de todas as equipas classificadas de um certo torneio (Ordenado Decrescente)
SELECT t.Nome as Torneio, e.Nome as Equipa, ce.Pontos
	FROM Classificacao_Equipa ce
    INNER JOIN Torneio t ON t.Id_Torneio = ce.Id_Torneio
    INNER JOIN Equipa e ON e.Id_Equipa = ce.Id_Equipa
    WHERE t.Id_Torneio = 1
	ORDER BY ce.Pontos DESC;
    
-- QUERY 2: Pontuações de todas os atletas individuais classificados de um certo torneio (Ordenado Decrescente)
SELECT t.Nome as Torneio, a.Nome as Atleta, ci.Pontos
	FROM Classificacao_Individual ci
    INNER JOIN Torneio t ON t.Id_Torneio = ci.Id_Torneio
    INNER JOIN Atleta a ON a.Id_Atleta = ci.Id_Atleta
    WHERE t.Id_Torneio = 2
    ORDER BY ci.Pontos DESC;
    
-- QUERY 3: Ver todos os Atletas que pertencem a uma equipa
SELECT a.Nome, e.Nome as Equipa, a.Id_Equipa
	FROM Atleta a
    INNER JOIN Equipa e ON e.Id_Equipa = a.Id_Equipa
	WHERE a.Id_Equipa = 2;
    
-- QUERY 4: Obter Morada, Cidade e País de cada funcionário
SELECT f.Id_Funcionario, f.Nome, f.Cargo, m.Morada, c.Cidade, p.Pais
	FROM Funcionario f
    INNER JOIN Morada m ON m.Id_Morada = f.Id_Morada
    INNER JOIN Cidade c ON c.Id_Cidade = m.Id_Cidade
    INNER JOIN Pais p ON p.Id_Pais = c.Id_Pais;
    
-- QUERY 5: Obter Espectadores de um jogo escolhido
SELECT ej.Id_Jogo, ej.Id_Espectador, ep.Nome, j.Data_Jogo
	FROM Espectador_Jogo ej
    INNER JOIN Espectador ep ON ep.Id_Espectador = ej.Id_Espectador
    INNER JOIN Jogo j ON j.Id_Jogo = ej.Id_Jogo
    WHERE ej.Id_Jogo = 2;

-- QUERY 6: Obter Patrocinadores de cada Torneio (Caso tenha!)
SELECT t.Nome, p.Marca
	FROM Torneio t
    INNER JOIN Patrocinador p ON p.Id_Patrocinador = t.Id_Patrocinador;
    
-- QUERY 7: Obter quais funcionarios estao a trabalhar em um torneio particular
SELECT ft.Id_Funcionario, f.Nome, f.Cargo, f.Telemovel, t.Nome, t.Data_Inicio, t.Data_Fim
	FROM Funcionario_Torneio ft
    INNER JOIN Funcionario f ON f.Id_Funcionario = ft.Id_Funcionario
    INNER JOIN Torneio t ON t.Id_Torneio = ft.Id_Torneio
