-- -- 
-- Universidade do Minho
-- Unidade Curricular de Bases de Dados
-- Caso de Estudo: Desafio Atlético
-- Queries na Base de Dados
-- 2024, Dezembro
-- João Pedro da Silva Barbosa
-- --

USE DesafioAtletico;

-- Criação Perfil Organizador
CREATE USER 'organizador'@'localhost'
	IDENTIFIED BY 'passOrganizador';

GRANT ALL PRIVILEGES
	ON *.*
	TO 'organizador'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'organizador'@'localhost';

-- Criação do perfil do Árbitro
CREATE USER 'arbitro'@'localhost' IDENTIFIED BY 'passArbitro';

-- Conceder permissões para o árbitro
GRANT SELECT ON DesafioAtletico.Jogo TO 'arbitro'@'localhost';
GRANT SELECT ON DesafioAtletico.Jogo_Equipa TO 'arbitro'@'localhost';
GRANT SELECT ON DesafioAtletico.Jogo_Individual TO 'arbitro'@'localhost';
GRANT SELECT ON DesafioAtletico.Classificacao_Equipa TO 'arbitro'@'localhost';
GRANT SELECT ON DesafioAtletico.Classificacao_Individual TO 'arbitro'@'localhost';

-- Permitir o acesso a detalhes de torneios, incluindo o nome, data de início/fim, etc.
GRANT SELECT ON DesafioAtletico.Torneio TO 'arbitro'@'localhost';

-- Permitir o acesso a detalhes sobre os atletas, incluindo nomes e suas equipas
GRANT SELECT ON DesafioAtletico.Atleta TO 'arbitro'@'localhost';

-- Permitir o acesso às modalidades, pois são importantes para o árbitro entender os tipos de competição
GRANT SELECT ON DesafioAtletico.Modalidade TO 'arbitro'@'localhost';

FLUSH PRIVILEGES;
SHOW GRANTS FOR 'arbitro'@'localhost';

-- Criação do perfil espectador
CREATE USER 'espectador'@'localhost' IDENTIFIED BY 'passEspectador';

-- Permitir que o espectador visualize detalhes de torneios (sem dados pessoais)
GRANT SELECT ON DesafioAtletico.Torneio TO 'espectador'@'localhost';

-- Permitir que o espectador visualize detalhes de jogos (sem dados pessoais dos atletas ou equipas)
GRANT SELECT ON DesafioAtletico.Jogo TO 'espectador'@'localhost';
GRANT SELECT ON DesafioAtletico.Jogo_Equipa TO 'espectador'@'localhost';
GRANT SELECT ON DesafioAtletico.Jogo_Individual TO 'espectador'@'localhost';

-- Permitir que o espectador veja os resultados das classificações (sem dados pessoais)
GRANT SELECT ON DesafioAtletico.Classificacao_Equipa TO 'espectador'@'localhost';
GRANT SELECT ON DesafioAtletico.Classificacao_Individual TO 'espectador'@'localhost';

-- Aplicar as permissões concedidas
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'espectador'@'localhost';

-- Criação do perfil atleta
CREATE USER 'atleta'@'localhost' IDENTIFIED BY 'passAtleta';

-- Permitir que o atleta visualize os detalhes dos torneios (sem dados pessoais de outros atletas)
GRANT SELECT ON DesafioAtletico.Torneio TO 'atleta'@'localhost';

-- Permitir que o atleta visualize os detalhes dos jogos em que participou (sem dados pessoais de outras equipas ou atletas)
GRANT SELECT ON DesafioAtletico.Jogo TO 'atleta'@'localhost';
GRANT SELECT ON DesafioAtletico.Jogo_Equipa TO 'atleta'@'localhost';  -- Detalhes dos jogos por equipa
GRANT SELECT ON DesafioAtletico.Jogo_Individual TO 'atleta'@'localhost';  -- Detalhes dos jogos individuais (sem outros atletas)

-- Permitir que o atleta veja sua classificação nas competições (sem dados de outros atletas ou equipas)
GRANT SELECT ON DesafioAtletico.Classificacao_Individual TO 'atleta'@'localhost';
GRANT SELECT ON DesafioAtletico.Classificacao_Equipa TO 'atleta'@'localhost';  -- Caso o atleta pertença a uma equipa

-- Aplicar as permissões concedidas
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'atleta'@'localhost';


-- Criação do perfil patrocinador
CREATE USER 'patrocinador'@'localhost' IDENTIFIED BY 'passPatrocinador';

-- Permitir que o patrocinador visualize os detalhes dos torneios
GRANT SELECT ON DesafioAtletico.Torneio TO 'patrocinador'@'localhost';

-- Permitir que o patrocinador visualize os detalhes das equipas e os jogos
GRANT SELECT ON DesafioAtletico.Equipa TO 'patrocinador'@'localhost';  -- Detalhes das equipas
GRANT SELECT ON DesafioAtletico.Jogo TO 'patrocinador'@'localhost';  -- Detalhes dos jogos
GRANT SELECT ON DesafioAtletico.Jogo_Equipa TO 'patrocinador'@'localhost';  -- Detalhes das equipas em cada jogo
GRANT SELECT ON DesafioAtletico.Jogo_Individual TO 'patrocinador'@'localhost';  -- Detalhes dos jogos individuais

-- Permitir que o patrocinador visualize as classificações das equipas
GRANT SELECT ON DesafioAtletico.Classificacao_Equipa TO 'patrocinador'@'localhost';

-- Permitir que o patrocinador visualize os eventos associados aos torneios
GRANT SELECT ON DesafioAtletico.Evento TO 'patrocinador'@'localhost';

-- Aplicar as permissões concedidas
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'patrocinador'@'localhost';
