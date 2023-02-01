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

-- DROP TRIGGER check_livro ON FERRAMENTA;

CREATE TRIGGER check_livro
BEFORE UPDATE OR INSERT ON FERRAMENTA
FOR EACH ROW EXECUTE PROCEDURE check_livro_fc();

-- DROP TRIGGER check_livro ON POCAO;

CREATE TRIGGER check_livro
BEFORE UPDATE OR INSERT ON POCAO
FOR EACH ROW EXECUTE PROCEDURE check_livro_fc();


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

-- DROP TRIGGER check_inimigo ON PROFESSOR;

CREATE TRIGGER check_inimigo
BEFORE UPDATE OR INSERT ON PROFESSOR
FOR EACH ROW EXECUTE PROCEDURE check_inimigo_fc();


-- TRIGGER AREA (Atualização para comandos: Insert, update e delete)
CREATE OR REPLACE FUNCTION update_area() RETURNS trigger AS $update_area$
BEGIN
	IF (TG_OP = 'DELETE') THEN
		UPDATE AREA SET NArea = NArea - 1 WHERE idArea = old.idArea;
	ELSIF (TG_OP = 'INSERT') then
		UPDATE AREA SET NArea = NArea + 1 WHERE idArea = old.idArea;
	ELSIF (TG_OP = 'UPDATE') THEN
		IF(NEW.idArea <> OLD.idArea) THEN
			UPDATE AREA SET NArea = NArea - 1 WHERE idArea = old.idArea;
			UPDATE AREA SET NArea = NArea + 1 WHERE idArea = new.idArea;
		END IF;
	END IF;
	RETURN NULL;
END;

$update_area$ LANGUAGE plpgsql;

-- DROP TRIGGER NroDeAreas ON JOGADOR;

CREATE TRIGGER NroDeAreas
AFTER DELETE OR UPDATE OR INSERT ON JOGADOR
FOR EACH ROW EXECUTE PROCEDURE update_area();

-- TRIGGER AREA (Atualização para comandos: Insert, update e delete)
CREATE OR REPLACE FUNCTION update_grimorio() RETURNS trigger AS $update_grimorio$
BEGIN
	IF (TG_OP = 'DELETE') THEN
		UPDATE AREA SET Ngrimorio = Ngrimorio - 1 WHERE idGrimorio = old.idGrimorio;
	ELSIF (TG_OP = 'INSERT') then
		UPDATE AREA SET Ngrimorio = Ngrimorio + 1 WHERE idGrimorio = old.idGrimorio;
	ELSIF (TG_OP = 'UPDATE') THEN
		IF(NEW.idGrimorio <> OLD.idGrimorio) THEN
			UPDATE AREA SET Ngrimorio = Ngrimorio - 1 WHERE idGrimorio = old.idGrimorio;
			UPDATE AREA SET Ngrimorio = Ngrimorio + 1 WHERE idGrimorio = new.idGrimorio;
		END IF;
	END IF;
	RETURN NULL;
END;

$update_grimorio$ LANGUAGE plpgsql;

-- DROP TRIGGER NroDeGrimorios ON JOGADOR;

CREATE TRIGGER NroDeGrimorios
AFTER DELETE OR UPDATE OR INSERT ON JOGADOR
FOR EACH ROW EXECUTE PROCEDURE update_grimorio();

-- TRIGGER NPC (Atualização para comandos: Insert, update e delete)

CREATE OR REPLACE FUNCTION update_npc() RETURNS trigger AS $update_npc$
BEGIN
	IF (TG_OP = 'DELETE') THEN
		UPDATE AREA SET N_NPC = N_NPC - 1 WHERE idNPC = old.idNPC;
	ELSIF (TG_OP = 'INSERT') then
		UPDATE AREA SET N_NPC = N_NPC + 1 WHERE idNPC = old.idNPC;
	ELSIF (TG_OP = 'UPDATE') THEN
		IF(NEW.idNPC <> OLD.idNPC) THEN
			UPDATE AREA SET N_NPC = N_NPC - 1 WHERE idNPC = old.idNPC;
			UPDATE AREA SET N_NPC = N_NPC + 1 WHERE idNPC = new.idNPC;
		END IF;
	END IF;
	RETURN NULL;
END;

$update_npc$ LANGUAGE plpgsql;

-- DROP TRIGGER NroDeNPC ON DISCIPLINA;

CREATE TRIGGER NroDeNPC
AFTER DELETE OR UPDATE OR INSERT ON DISCIPLINA
FOR EACH ROW EXECUTE PROCEDURE update_npc();

-- DROP TRIGGER NroDeNPC ON LOJA;

CREATE TRIGGER NroDeNPC
AFTER DELETE OR UPDATE OR INSERT ON LOJA
FOR EACH ROW EXECUTE PROCEDURE update_npc();


-- TRIGGER FEITICO (Atualização para comandos: Insert, update e delete)
CREATE OR REPLACE FUNCTION update_feitico() RETURNS trigger AS $update_feitico$
BEGIN
	IF (TG_OP = 'DELETE') THEN
		UPDATE AREA SET NFeitico = NFeitico - 1 WHERE idFeitico = old.idFeitico;
	ELSIF (TG_OP = 'INSERT') then
		UPDATE AREA SET NFeitico = NFeitico + 1 WHERE idFeitico = old.idFeitico;
	ELSIF (TG_OP = 'UPDATE') THEN
		IF(NEW.idFeitico <> OLD.idFeitico) THEN
			UPDATE AREA SET NFeitico = NFeitico - 1 WHERE idFeitico = old.idFeitico;
			UPDATE AREA SET NFeitico = NFeitico + 1 WHERE idFeitico = new.idFeitico;
		END IF;
	END IF;
	RETURN NULL;
END;

$update_feitico$ LANGUAGE plpgsql;

-- DROP TRIGGER NroDeFeitico ON GRIMORIO;

CREATE TRIGGER NroDeFeitico
AFTER DELETE OR UPDATE OR INSERT ON GRIMORIO
FOR EACH ROW EXECUTE PROCEDURE update_feitico();

-- DROP TRIGGER NroDeFeitico ON DISCIPLINA;

CREATE TRIGGER NroDeFeitico
AFTER DELETE OR UPDATE OR INSERT ON DISCIPLINA
FOR EACH ROW EXECUTE PROCEDURE update_feitico();


-- TRIGGER ITEM (Atualização para comandos: Insert, update e delete)
CREATE OR REPLACE FUNCTION update_item() RETURNS trigger AS $update_item$
BEGIN
	IF (TG_OP = 'DELETE') THEN
		UPDATE AREA SET NItem = NItem - 1 WHERE idItem = old.idItem;
	ELSIF (TG_OP = 'INSERT') then
		UPDATE AREA SET NItem = NItem + 1 WHERE idItem = old.idItem;
	ELSIF (TG_OP = 'UPDATE') THEN
		IF(NEW.idItem <> OLD.idItem) THEN
			UPDATE AREA SET NItem = NItem - 1 WHERE idItem = old.idItem;
			UPDATE AREA SET NItem = NItem + 1 WHERE idItem = new.idItem;
		END IF;
	END IF;
	RETURN NULL;
END;

$update_item$ LANGUAGE plpgsql;

-- DROP TRIGGER NroDeItem ON INSTANCIA_ITEM;

CREATE TRIGGER NroDeItem
AFTER DELETE OR UPDATE OR INSERT ON INSTANCIA_ITEM
FOR EACH ROW EXECUTE PROCEDURE update_item();

-- DROP TRIGGER NroDeItem ON NPC;

CREATE TRIGGER NroDeItem
AFTER DELETE OR UPDATE OR INSERT ON NPC
FOR EACH ROW EXECUTE PROCEDURE update_item();


-- TRIGGER MAPA (Atualização para comandos: Insert, update e delete)
CREATE OR REPLACE FUNCTION update_mapa() RETURNS trigger AS $update_mapa$
BEGIN
	IF (TG_OP = 'DELETE') THEN
		UPDATE AREA SET NMapa = NMapa - 1 WHERE idMapa = old.idMapa;
	ELSIF (TG_OP = 'INSERT') then
		UPDATE AREA SET NMapa = NMapa + 1 WHERE idMapa = old.idMapa;
	ELSIF (TG_OP = 'UPDATE') THEN
		IF(NEW.idMapa <> OLD.idMapa) THEN
			UPDATE AREA SET NMapa = NMapa - 1 WHERE idMapa = old.idMapa;
			UPDATE AREA SET NMapa = NMapa + 1 WHERE idMapa = new.idMapa;
		END IF;
	END IF;
	RETURN NULL;
END;

$update_mapa$ LANGUAGE plpgsql;

-- DROP TRIGGER NroDeMapa ON REGIAO;

CREATE TRIGGER NroDeMapa
AFTER DELETE OR UPDATE OR INSERT ON REGIAO
FOR EACH ROW EXECUTE PROCEDURE update_mapa();


-- TRIGGER CASA (delete)
CREATE OR REPLACE FUNCTION st_alteracoes_casa() RETURNS trigger AS $st_alteracoes_casa$
BEGIN
	RAISE NOTICE 'Statement - Tentou-se remover dados da tabela Casa';
	RETURN NULL;
END;

$st_alteracoes_casa$ LANGUAGE plpgsql;

-- DROP TRIGGER st_alteracoes_casa_aviso ON JOGADOR;

CREATE TRIGGER st_alteracoes_casa_aviso
AFTER DELETE ON JOGADOR
EXECUTE PROCEDURE st_alteracoes_casa();
