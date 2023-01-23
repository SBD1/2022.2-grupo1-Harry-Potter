-- -----------------------------------------------------------------
-- Data Criacao ...........: 23/01/2023
-- Autor(es) ..............: Letícia Araújo
-- Versao ..............: 1.0
-- Banco de Dados .........: PostgreSQL
-- Descricao .........: Criando triggers para especialização
-- ------------------------------------------------------------------

-- TRIGGER ITEM (Generalização e especialização)

CREATE OR REPLACE FUNCTION check_livro_fc() RETURNS trigger AS $check_livro_fc$
BEGIN
	PERFORM * FROM LIVRO WHERE idItem = NEW.idItem;
	IF FOUND THEN
	RAISE EXCEPTION 'Este item já existe na tabela de livros';
	END IF;
	RETURN NEW; 
END;
$check_livro_fc$ LANGUAGE plpgsql;

CREATE TRIGGER check_livro
BEFORE UPDATE OR INSERT ON FERRAMENTA
FOR EACH ROW EXECUTE PROCEDURE check_livro_fc();

CREATE TRIGGER check_livro
BEFORE UPDATE OR INSERT ON POCAO
FOR EACH ROW EXECUTE PROCEDURE check_livro_fc();

DROP TRIGGER check_livro ON FERRAMENTA;
DROP TRIGGER check_livro ON POCAO;

-- TRIGGER NPC (Generalização e especialização)

CREATE OR REPLACE FUNCTION check_inimigo_fc() RETURNS trigger AS $check_inimigo_fc$
BEGIN
	PERFORM * FROM INIMIGO WHERE idNPC = NEW.idNPC;
	IF FOUND THEN
	RAISE EXCEPTION 'Este NPC já existe na tabela de inimigos';
	END IF;
	RETURN NEW; 
END;
$check_inimigo_fc$ LANGUAGE plpgsql;

CREATE TRIGGER check_inimigo
BEFORE UPDATE OR INSERT ON PROFESSOR
FOR EACH ROW EXECUTE PROCEDURE check_inimigo_fc();

DROP TRIGGER check_inimigo ON PROFESSOR;
