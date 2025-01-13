use DesafioAtletico;

-- Trigger 1: Não deixa pontuações negativas serem adicionadas
DELIMITER $$

CREATE TRIGGER Verifica_Pontuacao_Valida
BEFORE INSERT ON Jogo
FOR EACH ROW
BEGIN
    -- Verifica se as pontuações são válidas (não negativas)
    IF NEW.Pontuacao_Participante1 < 0 OR NEW.Pontuacao_Participante2 < 0 THEN
        -- Se qualquer pontuação for negativa, gera um erro
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Pontuação não pode ser negativa!';
    END IF;
END$$

DELIMITER ;

-- Teste 1:
INSERT INTO Jogo
	(Id_Modalidade, Data_Jogo, Tipo_Jogo, Pontuacao_Participante1, Pontuacao_Participante2, Id_Torneio)
    VALUES
	(1, '2024-12-23 18:00:00', 'Individual', -10, 10, 2); -- Empate (Individual);
    
-- Procedure 1:
DELIMITER $$

CREATE PROCEDURE Atualiza_Pontos_Atleta(
    IN p_Id_Atleta INT,
    IN p_Id_Torneio INT,
    IN p_Pontos INT
)
BEGIN
    -- Verificar se o atleta já tem classificação no torneio
    IF EXISTS (SELECT 1 FROM Classificacao_Individual WHERE Id_Atleta = p_Id_Atleta AND Id_Torneio = p_Id_Torneio) THEN
        -- Se já existir, atualizar os pontos
        UPDATE Classificacao_Individual
        SET Pontos = Pontos + p_Pontos
        WHERE Id_Atleta = p_Id_Atleta AND Id_Torneio = p_Id_Torneio;
    ELSE
        -- Se não existir, inserir a classificação com os pontos iniciais
        INSERT INTO Classificacao_Individual (Id_Torneio, Id_Atleta, Pontos)
        VALUES (p_Id_Torneio, p_Id_Atleta, p_Pontos);
    END IF;
END$$

DELIMITER ;

-- Teste 2:
CALL Atualiza_Pontos_Atleta(5, 2, 2);


