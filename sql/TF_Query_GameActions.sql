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

-- Descobrir os dados do inimigo
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
