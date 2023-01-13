-- -----------------------------------------------------------------
-- Data Criacao ...........: 31/08/2022
-- Autor(es) ..............: Felipe Moura e Letícia Araújo
-- Versao ..............: 1.0
-- Banco de Dados .........: PostgreSQL
-- Descricao .........: Criando primeiras tabelas do banco de dados
-- ------------------------------------------------------------------

-- Tabela FEITICO


CREATE DATABASE IF NOT EXISTS "HARRY_POTTER"
   WITH
   OWNER = postgres
   ENCODING = 'UTF8'
   CONNECTION LIMIT = -1;

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

-- Tabela INSTANCIA_JOGADOR_DISCIPLINA

CREATE TABLE IF NOT EXISTS INSTANCIA_JOGADOR_DISCIPLINA(
   idJogador            INT NOT NULL,
   idDisciplina         INT NULL,           
   FOREIGN KEY (idJogador) REFERENCES JOGADOR (idJogador),
   FOREIGN KEY (idDisciplina) REFERENCES DISCIPLINA (idDisciplina)
);

-- Tabela INIMIGO

CREATE TABLE IF NOT EXISTS INIMIGO(
   idNPC            INT NOT NULL,
   idHabilidade     INT NULL,        
   moedas           INT NOT NULL,   
   FOREIGN KEY (idNPC) REFERENCES NPC (idNPC),
   FOREIGN KEY (idHabilidade) REFERENCES HABILIDADE (idHabilidade)
);

-- Tabela INSTANCIA_INIMIGO

CREATE TABLE IF NOT EXISTS INSTANCIA_INIMIGO(
   idNPC             INT NOT NULL,
   idArea            INT NOT NULL,  
   idInstanciaItem   INT NULL, 
   pontosVida        INT NOT NULL,
   multiplicador     INT NOT NULL, 
   FOREIGN KEY (idNPC) REFERENCES NPC (idNPC),
   FOREIGN KEY (idArea) REFERENCES AREA (idArea),
   FOREIGN KEY (idInstanciaItem) REFERENCES INSTANCIA_ITEM (idInstanciaItem)
);

-- Tabela HABILIDADE

CREATE TABLE IF NOT EXISTS HABILIDADE(
   idHabilidade     SERIAL PRIMARY KEY,
   nomeHabilidade   CHAR(30) NOT NULL,  
   dano             INT NULL, 
   descricao        CHAR(60) NOT NULL,
);

-- Tabela FERRAMENTA

CREATE TABLE IF NOT EXISTS FERRAMENTA(
   idItem          INT NOT NULL,
   forca           INT NULL,  
   FOREIGN KEY (idItem) REFERENCES ITEM (idItem),
);

-- Tabela POCAO

CREATE TABLE IF NOT EXISTS POCAO(
   idItem            INT NOT NULL,
   ingrediente       CHAR(30) NOT NULL,   
   FOREIGN KEY (idItem) REFERENCES ITEM (idItem)
);

-- Tabela LOJA

CREATE TABLE IF NOT EXISTS LOJA(
   idLoja            SERIAL PRIMARY KEY,
   idNPC             INT NOT NULL, 
   idArea              INT NOT NULL,  
   idInstanciaItem   INT NOT NULL, 
   descricao         CHAR(60) NOT NULL,
   FOREIGN KEY (idNPC) REFERENCES NPC (idNPC),
   FOREIGN KEY (idArea) REFERENCES AREA (idArea),
   FOREIGN KEY (idInstanciaItem) REFERENCES INSTANCIA_ITEM (idInstanciaItem)
);

-- Tabela MAPA

CREATE TABLE IF NOT EXISTS MAPA(
   idMapa            SERIAL PRIMARY KEY,
   descricao         CHAR(60) NOT NULL, 
);

-- Tabela REGIAO

CREATE TABLE IF NOT EXISTS REGIAO(
   idRegiao          SERIAL PRIMARY KEY,
   idMapa            INT NOT NULL, 
   descricao         INT NOT NULL,  
   nome              CHAR(20) NOT NULL,
   FOREIGN KEY (idMapa) REFERENCES MAPA (idMapa),
);

-- Tabela AREA

CREATE TABLE IF NOT EXISTS AREA(
   idArea        SERIAL PRIMARY KEY, 
   idRegiao      INT NOT NULL,
   areaLeste     INT  NOT NULL,
   areaOeste     INT  NOT NULL,
   areaSul       INT  NOT NULL,
   areaNorte     INT  NOT NULL,
   FOREIGN KEY (idRegiao) REFERENCES REGIAO (idRegiao)
);
