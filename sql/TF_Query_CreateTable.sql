-- -----------------------------------------------------------------
-- Data Criacao ...........: 05/01/2023
-- Autor(es) ..............: Felipe Moura e Letícia Araújo
-- Versao ..............: 1.0
-- Banco de Dados .........: PostgreSQL
-- Descricao .........: Criando primeiras tabelas do banco de dados.
-- ------------------------------------------------------------------
-- Data Atualizacao ...........: 14/01/2023
-- Autor(es) ..............: Letícia Araújo
-- Descricao .........: Criando tabelas faltantes e modificando o tipo do ID.
-- ------------------------------------------------------------------

-- Tabela MAPA
CREATE SEQUENCE mapa_id_seq;
CREATE TABLE IF NOT EXISTS MAPA(
   idMapa            int NOT NULL DEFAULT nextval('mapa_id_seq') PRIMARY KEY,
   descricao         CHAR(60) NOT NULL
);
ALTER SEQUENCE mapa_id_seq OWNED BY MAPA.idMapa;

-- Tabela REGIAO
CREATE SEQUENCE regiao_id_seq;
CREATE TABLE IF NOT EXISTS REGIAO(
   idRegiao          int NOT NULL DEFAULT nextval('regiao_id_seq') PRIMARY KEY,
   idMapa            INT NOT NULL,
   descricao         VARCHAR NOT NULL,
   nome              CHAR(20) NOT NULL,
   FOREIGN KEY (idMapa) REFERENCES MAPA (idMapa)
);
ALTER SEQUENCE regiao_id_seq OWNED BY REGIAO.idRegiao;

-- Tabela AREA
CREATE SEQUENCE area_id_seq;
CREATE TABLE IF NOT EXISTS AREA(
   idArea        int NOT NULL DEFAULT nextval('area_id_seq') PRIMARY KEY,
   idRegiao      INT NOT NULL,
   areaLeste     INT  REFERENCES AREA(idArea),
   areaOeste     INT  REFERENCES AREA(idArea),
   areaSul       INT  REFERENCES AREA(idArea),
   areaNorte     INT  REFERENCES AREA(idArea),
   FOREIGN KEY (idRegiao) REFERENCES REGIAO (idRegiao)
);
ALTER SEQUENCE area_id_seq OWNED BY AREA.idArea;

-- Tabela FEITICO
CREATE SEQUENCE feitico_id_seq;
CREATE TABLE IF NOT EXISTS FEITICO(
   idFeitico       int NOT NULL DEFAULT nextval('feitico_id_seq') PRIMARY KEY,
   nome            CHAR(20) NOT NULL,
   efeito          VARCHAR NOT NULL,
   ponto           NUMERIC(4,2) NOT NULL,
   quantidadeUso   NUMERIC(4,2) NOT NULL
);
ALTER SEQUENCE feitico_id_seq OWNED BY FEITICO.idFeitico;

-- Tabela GRIMORIO
CREATE SEQUENCE grimorio_id_seq;
CREATE TABLE IF NOT EXISTS GRIMORIO(
   idGrimorio  int NOT NULL DEFAULT nextval('grimorio_id_seq') PRIMARY KEY,
   numSlots    INT  NOT NULL,
   feitico     INT  NOT NULL,
   FOREIGN KEY (feitico) REFERENCES FEITICO (idFeitico)
);
ALTER SEQUENCE grimorio_id_seq OWNED BY GRIMORIO.idGrimorio;

-- Tabela ITEM
CREATE SEQUENCE item_id_seq;
CREATE TABLE IF NOT EXISTS ITEM(
   idItem           int NOT NULL DEFAULT nextval('item_id_seq') PRIMARY KEY,
   nome             VARCHAR(30) NOT NULL,
   acao             VARCHAR(200) NOT NULL,
   valor            NUMERIC(4,2) NOT NULL,
   tipo             CHAR(20) NOT NULL,
   descricaoItem    VARCHAR(60) NOT NULL
);
ALTER SEQUENCE item_id_seq OWNED BY ITEM.idItem;

-- Tabela NPC
CREATE SEQUENCE npc_id_seq;
CREATE TABLE IF NOT EXISTS NPC(
   idNPC      int NOT NULL DEFAULT nextval('npc_id_seq') PRIMARY KEY,
   item       INT  NOT NULL,
   nome       CHAR(20) NOT NULL,
   FOREIGN KEY (item) REFERENCES ITEM (idItem)
);
ALTER SEQUENCE npc_id_seq OWNED BY NPC.idNPC;

-- Tabela CASA
CREATE SEQUENCE casa_id_seq;
CREATE TABLE IF NOT EXISTS CASA(
   idCasa         int NOT NULL DEFAULT nextval('casa_id_seq') PRIMARY KEY,
   nomeCasa       CHAR(10) NOT NULL,
   petCasa        CHAR(8) NOT NULL
);
ALTER SEQUENCE casa_id_seq OWNED BY CASA.idCasa;

-- Tabela DISCIPLINA
CREATE SEQUENCE disciplina_id_seq;
CREATE TABLE IF NOT EXISTS DISCIPLINA(
   idDisciplina         int NOT NULL DEFAULT nextval('disciplina_id_seq') PRIMARY KEY,
   NPC                  INT  NOT NULL,
   nomeDisciplina       CHAR(20) NOT NULL,
   feitico              INT  NOT NULL,
   FOREIGN KEY (NPC) REFERENCES NPC (idNPC),
   FOREIGN KEY (feitico) REFERENCES FEITICO (idFeitico)
);
ALTER SEQUENCE disciplina_id_seq OWNED BY DISCIPLINA.idDisciplina;

-- Tabela PROFESSOR
CREATE TABLE IF NOT EXISTS PROFESSOR(
   idNPC            INT  NOT NULL,
   casa             INT  NOT NULL,
   disciplina       INT  NOT NULL,
   FOREIGN KEY (idNPC) REFERENCES NPC (idNPC),
   FOREIGN KEY (casa) REFERENCES CASA (idCasa),
   FOREIGN KEY (disciplina) REFERENCES DISCIPLINA (idDisciplina)
);

-- Tabela JOGADOR
CREATE SEQUENCE jogador_id_seq;
CREATE TABLE IF NOT EXISTS JOGADOR(
   idJogador    INT NOT NULL DEFAULT nextval('jogador_id_seq') PRIMARY KEY,
   idGrimorio   INT  NOT NULL,
   nome         CHAR(20) NOT NULL,
   idArea       INT  NOT NULL,
   pontosVida   INT  NOT NULL,
   idCasa       INT  NOT NULL,
   FOREIGN KEY (idGrimorio) REFERENCES GRIMORIO (idGrimorio),
   FOREIGN KEY (idArea) REFERENCES AREA (idArea),
   FOREIGN KEY (idCasa) REFERENCES CASA (idCasa),
   UNIQUE(nome)
);
ALTER SEQUENCE jogador_id_seq OWNED BY JOGADOR.idJogador;

-- Tabela INSTANCIA_ITEM
CREATE SEQUENCE instancia_item_id_seq;
CREATE TABLE IF NOT EXISTS INSTANCIA_ITEM(
   idInstanciaItem      INT NOT NULL DEFAULT nextval('instancia_item_id_seq') PRIMARY KEY,
   idItem               INT  NOT NULL,
   FOREIGN KEY (idItem) REFERENCES ITEM (idItem)
);
ALTER SEQUENCE instancia_item_id_seq OWNED BY INSTANCIA_ITEM.idInstanciaItem;

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

-- Tabela HABILIDADE
CREATE SEQUENCE habilidade_id_seq;
CREATE TABLE IF NOT EXISTS HABILIDADE(
   idHabilidade     INT NOT NULL DEFAULT nextval('habilidade_id_seq') PRIMARY KEY,
   nomeHabilidade   CHAR(30) NOT NULL,
   dano             INT NULL,
   descricao        CHAR(60) NOT NULL
);
ALTER SEQUENCE habilidade_id_seq OWNED BY HABILIDADE.idHabilidade;

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

-- Tabela FERRAMENTA
CREATE TABLE IF NOT EXISTS FERRAMENTA(
   idItem          INT NOT NULL,
   forca           INT NULL,
   FOREIGN KEY (idItem) REFERENCES ITEM (idItem)
);

-- Tabela POCAO
CREATE TABLE IF NOT EXISTS POCAO(
   idItem            INT NOT NULL,
   ingrediente       CHAR(30) NOT NULL,
   FOREIGN KEY (idItem) REFERENCES ITEM (idItem)
);

-- Tabela LOJA
CREATE SEQUENCE loja_id_seq;
CREATE TABLE IF NOT EXISTS LOJA(
   idLoja              INT NOT NULL DEFAULT nextval('loja_id_seq') PRIMARY KEY,
   idNPC               INT NOT NULL,
   idArea              INT NOT NULL,
   idInstanciaItem     INT NOT NULL,
   descricao           CHAR(60) NOT NULL,
   FOREIGN KEY (idNPC) REFERENCES NPC (idNPC),
   FOREIGN KEY (idArea) REFERENCES AREA (idArea),
   FOREIGN KEY (idInstanciaItem) REFERENCES INSTANCIA_ITEM (idInstanciaItem)
);
ALTER SEQUENCE loja_id_seq OWNED BY LOJA.idLoja;

-- Tabela Livro
CREATE TABLE IF NOT EXISTS LIVRO(
   idItem           INT NOT NULL,
   feitico          INT NOT NULL,
   FOREIGN KEY (idItem) REFERENCES ITEM (idItem),
   FOREIGN KEY (feitico) REFERENCES FEITICO (idFeitico)
);

-- Tabela Instancia_NPC_Tipo
CREATE TABLE IF NOT EXISTS INSTANCIA_NPC_TIPO(
   idNPC           INT NOT NULL,
   idArea          INT NOT NULL,
   tipo            CHAR(30) NOT NULL,
   FOREIGN KEY (idNPC) REFERENCES NPC (idNPC),
   FOREIGN KEY (idArea) REFERENCES AREA (idArea)
);

