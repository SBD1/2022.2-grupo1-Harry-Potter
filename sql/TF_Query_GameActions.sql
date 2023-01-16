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
UPDATE INVENTARIO SET dinheiro = dinheiro - (SELECT ITEM.valor from ITEM where ITEM.iditem = 
(SELECT INSTANCIA.idItem from INVENTARIO as INVENTARIO INNER JOIN INSTANCIA_ITEM as INSTANCIA
on (INVENTARIO.instanciaitem = INVENTARIO.idinstanciaitem)
where INVENTARIO.idjogador  = 1))
where idjogador = 1; 

-- Relação Professores e Disciplinas:
SELECT D.nomeDisciplina, N.nome FROM disciplina d 
INNER JOIN NPC N 
ON (D.NPC = N.idNPC);

-- Descobrir os dados do inimigo:
select N.nome as "Nome Inimigo", ITM.nome as "Nome do Item", I.moedas, 
II.pontosvida as "Pontos de Vida", II.multiplicador, H.nomehabilidade as "Nome da habilidade", H.dano, 
H.descricao as "Descrição da Habilidade", ITM.acao as "Ação da Habilidade", ITM.nome as "Nome do Item", 
R.nome as "Região"  
from npc N
inner join inimigo I on  (N.idnpc = I.idnpc)
inner join instancia_inimigo II on (I.idnpc = II.idnpc)
inner join habilidade H on (I.idhabilidade = H.idhabilidade)
inner join item ITM on (ITM.iditem = N.item)
inner join area A on (A.idArea = II.idarea)
inner join regiao R on (R.idregiao = A.idRegiao);

-- Visualizar Grimório do Jogador:
select J.nome as "Jogador", G.numSlots as "Número de Slots", G.feitico as "Feitiços"
from jogador J
inner join grimorio G on (J.idgrimorio = G.idgrimorio);

-- Visualizar Feitiços de um Livro:
select I.nome as "Nome Livro", F.nome as "Feitiços" 
from item I
inner join Livro L on(I.iditem = L.iditem)
inner join Feitico F on (L.feitico = F.idfeitico);

-- Visualizar Ferramentas:
select I.nome as "Ferramenta", F.forca as "Força"
from item I
inner join ferramenta F on (I.iditem = F.iditem);

-- Visualizar Ingredientes de uma Poção:
select I.nome as "Poção", P.ingrediente as "Ingredientes"
from item I
inner join pocao P on (I.iditem = P.iditem);

-- Visualizar inventário de um jogador:
select J.nome as "Jogador", I.dinheiro as "Dinheiro", ITM.nome as "Itens"
from jogador J
inner join Inventario I on (I.idjogador = J.idjogador)
inner join instancia_item II on (II.idinstanciaitem  = I.instanciaitem)
inner join item ITM on (II.iditem = ITM.iditem);
