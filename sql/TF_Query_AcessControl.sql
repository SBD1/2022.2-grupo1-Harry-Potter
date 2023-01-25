-- -----------------------------------------------------------------------------------
-- Data Criacao ...........: 25/01/2023
-- Autor(es) ..............: Letícia Araújo
-- Versao ..............: 1.0
-- Banco de Dados .........: PostgreSQL
-- Descricao .........: Criando as roles e usuários do jogo para controle de acesso.
-- -----------------------------------------------------------------------------------

-- Role e usuário administradores
create role administrator with superuser;
create user hp_admin with password 'hp123' in role administrator;

-- Role e usuários dos donos do jogo
create role owners;
grant select, insert, update, delete on hp.area, hp.grimorio, hp.item, hp.jogador, hp.loja to owners with grant option; 
create user hp_game_owner with password 'hp_owner123' in role owners;

-- Role dos jogadores para acessa a view
create role jogadores;
grant select, insert, delete on hp.grimorio_jogador to jogadores with grant option;
create user hp_jogadores with password 'hp_jogadores123' in role jogadores;
