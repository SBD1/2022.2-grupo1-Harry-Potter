-- -----------------------------------------------------------------
-- Data Criacao ...........: 05/01/2023
-- Autor(es) ..............: Felipe Moura e Letícia Araújo
-- Versao ..............: 1.0
-- Banco de Dados .........: PostgreSQL
-- Descricao .........: Criando primeiras tabelas do banco de dados.
-- ------------------------------------------------------------------------------
-- Data Atualizacao ...........: 14/01/2023
-- Autor(es) ..............: Letícia Araújo
-- Descricao .........: Criando tabelas faltantes e modificando o tipo do ID.
-- ------------------------------------------------------------------------------
-- Data Atualizacao ...........: 24/01/2023
-- Autor(es) ..............: Letícia Araújo
-- Descricao .........: Criando transactions para savepoint
-- ------------------------------------------------------------------------------

-- Tabela MAPA
begin;
	CREATE SEQUENCE mapa_id_seq START 1;
	CREATE TABLE IF NOT EXISTS MAPA(
	   idMapa            int NOT NULL DEFAULT nextval('mapa_id_seq') PRIMARY KEY,
	   descricao         CHAR(60) NOT NULL
	);
	ALTER SEQUENCE mapa_id_seq OWNED BY MAPA.idMapa;
	savepoint create_tb_MAPA;
commit;


-- Tabela REGIAO
begin;
   CREATE SEQUENCE regiao_id_seq START 1;
   CREATE TABLE IF NOT EXISTS REGIAO(
      idRegiao          int NOT NULL DEFAULT nextval('regiao_id_seq') PRIMARY KEY,
      idMapa            INT NOT NULL,
      descricao         VARCHAR NOT NULL,
      nome              CHAR(20) NOT NULL,
      FOREIGN KEY (idMapa) REFERENCES MAPA (idMapa)
   );
   ALTER SEQUENCE regiao_id_seq OWNED BY REGIAO.idRegiao;
   savepoint create_tb_REGIAO;
commit;


-- Tabela AREA
begin;
   CREATE SEQUENCE area_id_seq START 1;
   CREATE TABLE IF NOT EXISTS AREA(
      idArea        int NOT NULL DEFAULT nextval('area_id_seq') PRIMARY KEY,
      idRegiao      INT NOT NULL,
      nome          VARCHAR(50) NOT NULL,
      areaLeste     INT  REFERENCES AREA(idArea),
      areaOeste     INT  REFERENCES AREA(idArea),
      areaSul       INT  REFERENCES AREA(idArea),
      areaNorte     INT  REFERENCES AREA(idArea),
      FOREIGN KEY (idRegiao) REFERENCES REGIAO (idRegiao)
   );
   ALTER SEQUENCE area_id_seq OWNED BY AREA.idArea;
   savepoint create_tb_AREA;
commit;


-- Tabela FEITICO
begin;
   CREATE SEQUENCE feitico_id_seq START 1;
   CREATE TABLE IF NOT EXISTS FEITICO(
      idFeitico       int NOT NULL DEFAULT nextval('feitico_id_seq') PRIMARY KEY,
      nome            VARCHAR(20) NOT NULL,
      efeito          VARCHAR NOT NULL,
      ponto           NUMERIC(4,2) NOT NULL,
      quantidadeUso   NUMERIC(4,2) NOT NULL
   );
   ALTER SEQUENCE feitico_id_seq OWNED BY FEITICO.idFeitico;
   savepoint create_tb_FEITICO;
commit;


-- Tabela GRIMORIO
begin;
   CREATE SEQUENCE grimorio_id_seq START 1;
   CREATE TABLE IF NOT EXISTS GRIMORIO(
      idGrimorio  int NOT NULL DEFAULT nextval('grimorio_id_seq') PRIMARY KEY,
      numSlots    INT  NOT NULL,
      feitico     INT  NOT NULL,
      FOREIGN KEY (feitico) REFERENCES FEITICO (idFeitico)
   );
   ALTER SEQUENCE grimorio_id_seq OWNED BY GRIMORIO.idGrimorio;
   savepoint create_tb_GRIMORIO;
commit;

-- Tabela LOJA
begin;
   CREATE SEQUENCE loja_id_seq START 1;
   CREATE TABLE IF NOT EXISTS LOJA(
      idLoja              INT NOT NULL DEFAULT nextval('loja_id_seq') PRIMARY KEY,
      idArea              INT NOT NULL,
      descricao           VARCHAR(60) NOT NULL,
      FOREIGN KEY (idArea) REFERENCES AREA (idArea)
   );
   ALTER SEQUENCE loja_id_seq OWNED BY LOJA.idLoja;
   savepoint create_tb_LOJA;
commit;

-- Tabela ITEM
begin;
   CREATE SEQUENCE item_id_seq START 1;
   CREATE TABLE IF NOT EXISTS ITEM(
      idItem           int NOT NULL DEFAULT nextval('item_id_seq') PRIMARY KEY,
      idLoja           INT NULL, 
      nome             VARCHAR(30) NOT NULL,
      acao             VARCHAR(200) NOT NULL,
      valor            NUMERIC(4,2) NOT NULL,
      tipo             CHAR(20) NOT NULL,
      descricaoItem    VARCHAR(60) NOT NULL, 
      FOREIGN KEY (idLoja) REFERENCES LOJA (idLoja)
   );
   ALTER SEQUENCE item_id_seq OWNED BY ITEM.idItem;
   savepoint create_tb_ITEM;
commit;


-- Tabela NPC
begin;
   CREATE SEQUENCE npc_id_seq START 1;
   CREATE TABLE IF NOT EXISTS NPC(
      idNPC      INT NOT NULL DEFAULT nextval('npc_id_seq') PRIMARY KEY,
      item       INT NOT NULL,
      nome       VARCHAR(20) NOT NULL,
      FOREIGN KEY (item) REFERENCES ITEM (idItem)
   );
   ALTER SEQUENCE npc_id_seq OWNED BY NPC.idNPC;
   savepoint create_tb_NPC;
commit;


-- Tabela CASA
begin;
   CREATE SEQUENCE casa_id_seq START 1;
   CREATE TABLE IF NOT EXISTS CASA(
      idCasa         int NOT NULL DEFAULT nextval('casa_id_seq') PRIMARY KEY,
      nomeCasa       VARCHAR(10) NOT NULL,
      petCasa        CHAR(8) NOT NULL
   );
   ALTER SEQUENCE casa_id_seq OWNED BY CASA.idCasa;
   savepoint create_tb_CASA;
commit;


-- Tabela DISCIPLINA
begin;
   CREATE SEQUENCE disciplina_id_seq START 1;
   CREATE TABLE IF NOT EXISTS DISCIPLINA(
      idDisciplina         int NOT NULL DEFAULT nextval('disciplina_id_seq') PRIMARY KEY,
      NPC                  INT  NOT NULL,
      nomeDisciplina       VARCHAR(20) NOT NULL,
      feitico              INT  NOT NULL,
      FOREIGN KEY (NPC) REFERENCES NPC (idNPC),
      FOREIGN KEY (feitico) REFERENCES FEITICO (idFeitico)
   );
   ALTER SEQUENCE disciplina_id_seq OWNED BY DISCIPLINA.idDisciplina;
   savepoint create_tb_DISCIPLINA;
commit;


-- Tabela PROFESSOR
begin;
   CREATE TABLE IF NOT EXISTS PROFESSOR(
      idNPC            INT  NOT NULL,
      casa             INT  NOT NULL,
      disciplina       INT  NOT NULL,
      FOREIGN KEY (idNPC) REFERENCES NPC (idNPC),
      FOREIGN KEY (casa) REFERENCES CASA (idCasa),
      FOREIGN KEY (disciplina) REFERENCES DISCIPLINA (idDisciplina)
   );
   savepoint create_tb_PROFESSOR;
commit;


-- Tabela JOGADOR
begin;
   CREATE SEQUENCE jogador_id_seq START 1;
   CREATE TABLE IF NOT EXISTS JOGADOR(
      idJogador    INT NOT NULL DEFAULT nextval('jogador_id_seq') PRIMARY KEY,
      idGrimorio   INT  NOT NULL,
      nome         VARCHAR(20) NOT NULL,
      idArea       INT  NOT NULL,
      pontosVida   INT  NOT NULL,
      idCasa       INT  NOT NULL,
      estado       INT  NOT NULL DEFAULT 1,
      FOREIGN KEY (idGrimorio) REFERENCES GRIMORIO (idGrimorio),
      FOREIGN KEY (idArea) REFERENCES AREA (idArea),
      FOREIGN KEY (idCasa) REFERENCES CASA (idCasa),
      UNIQUE (nome)
   );
   ALTER SEQUENCE jogador_id_seq OWNED BY JOGADOR.idJogador;
   savepoint create_tb_JOGADOR;
commit;


-- Tabela INSTANCIA_ITEM
begin;
   CREATE SEQUENCE instancia_item_id_seq START 1;
   CREATE TABLE IF NOT EXISTS INSTANCIA_ITEM(
      idInstanciaItem      INT NOT NULL DEFAULT nextval('instancia_item_id_seq') PRIMARY KEY,
      idItem               INT  NOT NULL,
      idJogador            INT NULL DEFAULT NULL,
      FOREIGN KEY (idItem) REFERENCES ITEM (idItem),
      FOREIGN KEY (idJogador) REFERENCES JOGADOR (idJogador)
   );
   ALTER SEQUENCE instancia_item_id_seq OWNED BY INSTANCIA_ITEM.idInstanciaItem;
   savepoint create_tb_INSTANCIA_ITEM;
commit;


-- Tabela INVENTARIO
begin;
   CREATE TABLE IF NOT EXISTS INVENTARIO(
      idJogador               INT NOT NULL,
      dinheiro                INT NULL,
      FOREIGN KEY (idJogador) REFERENCES JOGADOR (idJogador)
   );
   savepoint create_tb_INVENTARIO;
commit;  


-- Tabela INSTANCIA_JOGADOR_DISCIPLINA
begin;
   CREATE TABLE IF NOT EXISTS INSTANCIA_JOGADOR_DISCIPLINA(
      idJogador            INT NOT NULL,
      idDisciplina         INT NULL,
      FOREIGN KEY (idJogador) REFERENCES JOGADOR (idJogador),
      FOREIGN KEY (idDisciplina) REFERENCES DISCIPLINA (idDisciplina)
   );
   savepoint create_tb_INSTANCIA_JOGADOR_DISCIPLINA;
commit;


-- Tabela HABILIDADE
begin;
   CREATE SEQUENCE habilidade_id_seq START 1;
   CREATE TABLE IF NOT EXISTS HABILIDADE(
      idHabilidade     INT NOT NULL DEFAULT nextval('habilidade_id_seq') PRIMARY KEY,
      nomeHabilidade   VARCHAR(30) NOT NULL,
      dano             INT NULL,
      descricao        VARCHAR(60) NOT NULL
   );
   ALTER SEQUENCE habilidade_id_seq OWNED BY HABILIDADE.idHabilidade;
   savepoint create_tb_HABILIDADE;
commit;


-- Tabela INIMIGO
begin;
   CREATE TABLE IF NOT EXISTS INIMIGO(
      idNPC            INT NOT NULL,
      idHabilidade     INT NULL,
      moedas           INT NOT NULL,
      FOREIGN KEY (idNPC) REFERENCES NPC (idNPC),
      FOREIGN KEY (idHabilidade) REFERENCES HABILIDADE (idHabilidade)
   );
      savepoint create_tb_INIMIGO;
commit;


-- Tabela INSTANCIA_INIMIGO
begin;
   CREATE SEQUENCE instancia_inimigo_id_seq START 1;
   CREATE TABLE IF NOT EXISTS INSTANCIA_INIMIGO(
      idInstancia_Inimigo INT NOT NULL DEFAULT nextval('instancia_inimigo_id_seq') PRIMARY KEY,
      idNPC             INT NOT NULL,
      idArea            INT NOT NULL,
      idItem            INT NULL,
      pontosVida        INT NOT NULL,
      multiplicador     INT NOT NULL,
      FOREIGN KEY (idNPC) REFERENCES NPC (idNPC),
      FOREIGN KEY (idArea) REFERENCES AREA (idArea),
      FOREIGN KEY (idItem) REFERENCES ITEM (idItem)
   );
   ALTER SEQUENCE instancia_inimigo_id_seq OWNED BY INSTANCIA_INIMIGO.idInstancia_Inimigo;
   savepoint create_tb_INSTANCIA_INIMIGO;
commit;

-- Tabela FERRAMENTA
begin;
   CREATE TABLE IF NOT EXISTS FERRAMENTA(
      idItem          INT NOT NULL,
      forca           INT NULL,
      FOREIGN KEY (idItem) REFERENCES ITEM (idItem)
   );
   savepoint create_tb_FERRAMENTA;
commit;


-- Tabela POCAO
begin;
CREATE TABLE IF NOT EXISTS POCAO(
   idItem            INT NOT NULL,
   ingrediente       CHAR(30) NOT NULL,
   FOREIGN KEY (idItem) REFERENCES ITEM (idItem)
);
   savepoint create_tb_POCAO;
commit;

-- Tabela Livro
begin;
   CREATE TABLE IF NOT EXISTS LIVRO(
      idItem           INT NOT NULL,
      feitico          INT NOT NULL,
      FOREIGN KEY (idItem) REFERENCES ITEM (idItem),
      FOREIGN KEY (feitico) REFERENCES FEITICO (idFeitico)
   );
   savepoint create_tb_LIVRO;
commit;

-- Tabela Falas
begin;
   CREATE TABLE IF NOT EXISTS FALAS(
      idNPC           INT NOT NULL,
      idArea          INT NOT NULL,
      texto           VARCHAR(300),
      momento         INT NOT NULL,
      FOREIGN KEY (idNPC) REFERENCES NPC (idNPC),
      FOREIGN KEY (idArea) REFERENCES AREA (idArea)
   );
commit;

-- Tabela Instancia_NPC_Tipo
begin;
   CREATE TABLE IF NOT EXISTS INSTANCIA_NPC_TIPO(
      idNPC           INT NOT NULL,
      idArea          INT NOT NULL,
      tipo            CHAR(30) NOT NULL,
      FOREIGN KEY (idNPC) REFERENCES NPC (idNPC),
      FOREIGN KEY (idArea) REFERENCES AREA (idArea)
   );
   savepoint create_tb_INSTANCIA_NPC_TIPO;
commit;
