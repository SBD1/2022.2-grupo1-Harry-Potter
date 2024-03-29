-- -----------------------------------------------------------------
-- Data Criacao ...........: 16/01/2023
-- Autor(es) ..............: Letícia Araújo
-- Versao ..............: 1.0
-- Banco de Dados .........: PostgreSQL
-- Descricao .........: Criando queries para ações no jogo
-- ------------------------------------------------------------------

-- Dados do Jogador:
SELECT * FROM JOGADOR;

-- Jogadores de cada Casa:
SELECT J.nome, C.nomeCasa from JOGADOR 
AS J INNER JOIN CASA AS C 
ON (J.idjogador = C.idcasa);

-- Atualizar o dinheiro de um jogador X:
-- UPDATE INVENTARIO SET dinheiro = dinheiro - (SELECT ITEM.valor from ITEM where ITEM.iditem = 
-- (SELECT INSTANCIA.idItem from INVENTARIO as INVENTARIO INNER JOIN INSTANCIA_ITEM as INSTANCIA
-- on (INVENTARIO.instanciaitem = INVENTARIO.instanciaitem)
-- where INVENTARIO.idjogador  = 1))
-- where idjogador = 1; 

-- Relação Professores e Disciplinas:
SELECT D.nomeDisciplina, N.nome FROM disciplina d 
INNER JOIN NPC N 
ON (D.NPC = N.idNPC);

-- View dados do inimigo:
create or REPLACE VIEW dados_inimigos AS
	select N.nome as "Nome Inimigo", ITM.nome as "Nome do Item", I.moedas, 
	II.pontosvida as "Pontos de Vida", II.multiplicador, H.nomehabilidade as "Nome da habilidade", H.dano, 
	H.descricao as "Descrição da Habilidade", ITM.acao as "Ação da Habilidade", 
	R.nome as "Região"  
	from npc N
	inner join inimigo I on  (N.idnpc = I.idnpc)
	inner join instancia_inimigo II on (I.idnpc = II.idnpc)
	inner join habilidade H on (I.idhabilidade = H.idhabilidade)
	inner join item ITM on (ITM.iditem = N.item)
	inner join area A on (A.idArea = II.idarea)
	inner join regiao R on (R.idregiao = A.idRegiao);
  
select * from dados_inimigos;

/* -- View Grimório do Jogador:
create view grimorio_jogador as
	select J.nome as "Jogador", G.feitico as "Feitiços"
	from jogador J
	inner join grimorio G on (J.idgrimorio = G.idgrimorio);
  
select * from grimorio_jogador; */

-- View Feitiços de um Livro:
create view feiticos_livro as
  select I.nome as "Nome Livro", F.nome as "Feitiços" 
  from item I
  inner join Livro L on(I.iditem = L.iditem)
  inner join Feitico F on (L.feitico = F.idfeitico);

select * from feiticos_livro;

-- Visualizar Ferramentas:
--select I.nome as "Ferramenta", F.forca as "Força"
--from item I
--inner join ferramenta F on (I.iditem = F.iditem);
  
-- Visualizar Ingredientes de uma Poção:
--select I.nome as "Poção", P.ingrediente as "Ingredientes"
--from item I
--inner join pocao P on (I.iditem = P.iditem)

-- View inventário de um jogador:
create OR REPLACE view inventario_jogador as
	select I.idjogador as "idjogador", ITM.nome as "Itens", ITM.valor as "Dinheiro"
	from inventario I
	inner join instancia_item II on (II.idjogador  = I.idjogador)
	inner join item ITM on (II.iditem = ITM.iditem);

select * from inventario_jogador;

-- View itens de uma loja
create OR REPLACE view produtos_loja as
	select i.idItem as "iditem",  i.nome as "Item",  i.descricaoitem as "Descricao", i.valor as "Valor", i.idloja as "idloja"
	from loja l
	inner join item i on(i.idLoja = l.idloja);

select * from produtos_loja;

-- View feiticos dos jogadores
create OR REPLACE view feitico_jogador as
	select l.idgrimorio as "idgrimorio", i.idFeitico as "idFeitico", i.nome as "nome", i.efeito as "descricao", i.ponto as "dano" 
	from grimorio l
	inner join feitico i on(i.idFeitico = l.feitico);

select * from feitico_jogador;

-- CREATE OR REPLACE FUNCTION st_respawn_enemy() RETURNS TRIGGER AS $st_respawn_enemy$
-- BEGIN
-- 	PERFORM pg_sleep(30);
-- 	UPDATE INSTANCIA_INIMIGO SET pontosvida = old.pontosvidamax WHERE idinstancia_inimigo = old.idinstancia_inimigo;
-- END;
-- 
-- $st_respawn_enemy$ LANGUAGE plpgsql;
-- 
-- CREATE TRIGGER respawn_enemy
-- AFTER UPDATE ON INSTANCIA_INIMIGO
-- EXECUTE PROCEDURE st_respawn_enemy();
