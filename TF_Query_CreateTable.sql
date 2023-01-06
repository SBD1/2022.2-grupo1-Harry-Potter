-- -----------------------------------------------------------------
-- Data Criacao ...........: 31/08/2022
-- Autor(es) ..............: Felipe Moura e Letícia Araújo
-- Versao ..............: 1.0
-- Banco de Dados .........: PostgreSQL
-- Descricao .........: Criando primeiras tabelas do banco de dados 
-- ------------------------------------------------------------------

-- Tabela FEITICO

CREATE TABLE IF NOT EXISTS FEITICO(
   idFeitico       SERIAL PRIMARY KEY, 
   nome            CHAR(20) NOT NULL,
   efeito          CHAR(20) NOT NULL,
   ponto           NUMERIC(4,2) NOT NULL,
   quantidadeUso   NUMERIC(4,2) NOT NULL
);

-- Tabela GRIMORIO

CREATE TABLE IF NOT EXISTS GRIMORIO(
   idGrimorio  SERIAL PRIMARY KEY, 
   numSlots    INT  NOT NULL,
   feitico     INT  NOT NULL,
   FOREIGN KEY (feitico) REFERENCES FEITICO (idFeitico)
);

-- Tabela AREA

CREATE TABLE IF NOT EXISTS AREA(
   idArea        SERIAL PRIMARY KEY, 
   areaLeste     INT  NOT NULL,
   areaOeste     INT  NOT NULL,
   areaSul       INT  NOT NULL,
   areaNorte     INT  NOT NULL
);

-- Tabela ITEM

CREATE TABLE IF NOT EXISTS ITEM(
   idItem           SERIAL PRIMARY KEY, 
   nome             VARCHAR(30) NOT NULL,
   acao             VARCHAR(200) NOT NULL,
   valor            NUMERIC(4,2) NOT NULL,
   tipo             CHAR(20) NOT NULL,
   descricaoItem    VARCHAR(60) NOT NULL
);

-- Tabela NPC

CREATE TABLE IF NOT EXISTS NPC(
   idNPC      SERIAL PRIMARY KEY, 
   item       INT  NOT NULL,
   nome       CHAR(20) NOT NULL,
   FOREIGN KEY (item) REFERENCES ITEM (idItem)
);

-- Tabela CASA

CREATE TABLE IF NOT EXISTS CASA(
   idCasa                       SERIAL PRIMARY KEY, 
   nomeCasa                     CHAR(10) NOT NULL,
   petCasa                      CHAR(8) NOT NULL,
   professorResponsavel         INT  NOT NULL,
   FOREIGN KEY (professorResponsavel) REFERENCES NPC (idNPC)
);

-- Tabela DISCIPLINA

CREATE TABLE IF NOT EXISTS DISCIPLINA(
   idDisciplina         SERIAL PRIMARY KEY, 
   NPC                  INT  NOT NULL,
   nomeDisciplina       CHAR(20) NOT NULL,
   feitico              INT  NOT NULL,
   FOREIGN KEY (NPC) REFERENCES NPC (idNPC),
   FOREIGN KEY (feitico) REFERENCES FEITICO (idFeitico)
);

-- Tabela GRIMPROFESSORORIO

CREATE TABLE IF NOT EXISTS PROFESSOR(
   idNPC            INT  NOT NULL,
   casa             INT  NOT NULL,
   disciplina       INT  NOT NULL,
   FOREIGN KEY (idNPC) REFERENCES NPC (idNPC),
   FOREIGN KEY (casa) REFERENCES CASA (idCasa),
   FOREIGN KEY (disciplina) REFERENCES DISCIPLINA (idDisciplina)
);

-- Tabela JOGADOR

CREATE TABLE IF NOT EXISTS JOGADOR(
   idJogador  SERIAL PRIMARY KEY, 
   idGrimorio INT  NOT NULL,
   nome       CHAR(20) NOT NULL,
   idArea     INT  NOT NULL,
   pontosVida INT  NOT NULL,
   idCasa     INT  NOT NULL,
   FOREIGN KEY (idGrimorio) REFERENCES GRIMORIO (idGrimorio),
   FOREIGN KEY (idArea) REFERENCES AREA (idArea),
   FOREIGN KEY (idCasa) REFERENCES CASA (idCasa)
);

-- Tabela INSTANCIA_ITEM

CREATE TABLE IF NOT EXISTS INSTANCIA_ITEM(
   idInstanciaItem      SERIAL PRIMARY KEY, 
   idItem               INT  NOT NULL,
   FOREIGN KEY (idItem) REFERENCES ITEM (idItem)
);

-- Tabela INVENTARIO

CREATE TABLE IF NOT EXISTS INVENTARIO(
   idJogador               INT NOT NULL,
   instanciaItem	         INT NULL,
   dinheiro                INT NULL,
   FOREIGN KEY (idJogador) REFERENCES JOGADOR (idJogador),
   FOREIGN KEY (instanciaItem) REFERENCES INSTANCIA_ITEM (idInstanciaItem)
);

