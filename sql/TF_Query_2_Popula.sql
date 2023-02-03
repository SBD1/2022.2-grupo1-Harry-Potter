-- -----------------------------------------------------------------
-- Data Criacao ...........: 13/01/2023
-- Autor(es) ..............: André
-- Versao ..............: 1.0
-- Banco de Dados .........: PostgreSQL
-- Descricao .........: Iniciando popula das tabelas
-- ------------------------------------------------------------------
-- Data Atualizacao ...........: 14/01/2023
-- Autor(es) ..............: Letícia Araújo
-- Descricao .........: Finalizando popula das tabelas.
-- ------------------------------------------------------------------

-- Popula casas
INSERT INTO CASA (nomecasa, petcasa ) VALUES
('Grifinória', 'Águia'),
('Sonserina', 'Cobra'),
('Corvinal', 'Corvo'),
('LufaLufa', 'Furão');

-- Popula mapa
INSERT INTO MAPA (descricao) VALUES
('Hogwarts'),
('Estacao'),
('Beco Diagonal'),
('Ottery St. Catchpole'),
('Rua dos Alfeneiros'),
('Hogsmeade');

-- Popula Regiao
INSERT INTO REGIAO (idMapa, descricao, nome) VALUES
(1, 'portao da escola de magia e bruxaria da regiao', 'Portao da escola'),
(2, 'Estacao de trem secreta que leva para a escola de bruxaria de Hogwarts', 'Estacao 9 3/4'),
(3, 'Um pub e hospedaria bruxo localizado em Londres', 'Calderão Furado'),
(4, 'Casa da família Weasley. Localizada nos arredores de Ottery St. Catchpole em Devon, Inglaterra, é uma habitação completamente mágico', 'A Toca'),
(5, 'Rua dos Alfeneiros, nº 4', 'Casa dos Dursley'),
(6, 'É uma loja bem popular entre os alunos de Hogwarts pelos variados doces que nela se encontra, vai dos mais simples até os bem exóticos', 'Dedos de Mel');

-- Popula Area
INSERT INTO AREA(idArea, idRegiao, nome, areaOeste, areaLeste, areaNorte,  areaSul) VALUES
(1, 1, 'Nada', 1, 1, 1, 1),
(2, 1, 'Portao de Hogwarts', 3, 4, 5, 6),
(3, 1, 'Beco Diagonal', 1, 2, 1, 1),
(4, 1, 'Patio exterior', 2, 1, 1, 1),
(5, 1, 'Salao Principal', 12, 11, 13, 2),
(6, 1, 'Floresta', 9, 10, 2, 7),
(7, 1, 'Montanha', 1, 1, 6, 8),
(8, 1, 'Floresta oculta', 1, 1, 7, 1),
(9, 1, 'Clareira', 1, 6, 1, 1),
(10, 1, 'Rio', 6, 1, 1, 1),
(11, 1, 'Torre leste', 5, 1, 22, 23),
(12, 1, 'Torre oeste', 1, 5, 20, 21),
(13, 1, 'Corredor', 14, 15, 16, 5),
(14, 1, 'Refeitorio', 1, 13, 1, 1),
(15, 1, 'Biblioteca', 13, 1, 1, 1),
(16, 1, 'Primeiro andar', 17, 18, 19, 13),
(17, 1, 'Sala de aula 1', 1, 16, 1, 1),
(18, 1, 'Sala de aula 2', 16, 1, 1, 1),
(19, 1, 'Sala de aula 3', 1, 1, 1, 16),
(20, 1, 'Dormitório: Grifinória', 1, 1, 1, 12),
(21, 1, 'Dormitório: Cornival', 1, 1, 12, 1),
(22, 1, 'Dormitório: Sonserina', 1, 1, 1, 11), 
(23, 1, 'Dormitório: Lufa-lufa', 1, 1, 11, 1);

-- Popula Falas
INSERT INTO FALAS(idNPC, idArea, momento, texto) VALUES
(1,2,1,'Bem vindo à Hogwards'),
(17,5,2,'Calouro? posso te ensinar alguns truques...'),
(8,6,2,'Nessa floresta há sempre monstros a espreita cuidado!'),
(5,15,2,'Se quiser aprender um feitiço novo tente pedir um livro ao seu professor!'),
(6,13,2,'Saia do meu caminho!');
()

-- Popula Feitico
INSERT INTO FEITICO (nome, efeito, ponto, quantidadeUso) VALUES
('Expelliarmus', 'Derrubar a arma do inimigo', 6, 99),
('Accio', 'Este feitiço é usado para convocar objetos', 0, 99),
('Aqua Eructo', 'conjura um intenso jato de água', 2, 99),
('Bombarda', 'Usado para destruir obstáculos', 3, 99),
('Petrificus Totalus', 'etrifica por completo o oponente temporariamente', 5, 99),
('Expecto Patronum', 'Conjura uma espécie de espírito protetor, um guardião de magia capaz de proteger o bruxo de criaturas das trevas ', 10, 50),
('Lapifors', 'Transforma um alvo em um coelho', 1, 99),
('Avada Kedavra', 'Tira a vida de quem é atingido por', 400, 1),
('Up', 'Faz a vassoura subir', 1, 99);

-- Popula Grimorio
INSERT INTO GRIMORIO (numSlots, feitico) VALUES
(99, 1),
(99, 2),
(99, 3),
(99, 4),
(99, 5),
(99, 6);

-- Popula Jogador
INSERT INTO JOGADOR (idGrimorio, nome, idArea, pontosVida, idCasa) VALUES
(1, 'Harry Potter', 4, 20, 1),
(2, 'Lily Williamson', 1, 20, 1),
(3, 'Ben Kent', 2, 20, 2),
(4, 'Morgan Kerr', 3, 20, 3),
(5, 'Edward Simpson', 4, 20, 4),
(6, 'Emma Parkes', 5, 20, 1);

-- Popula LOJA
INSERT INTO LOJA(idArea, descricao) VALUES
(3, ' Sorveteria Florean Fortescue'),
(3, 'Olivaras Varinhas'),
(3, 'Genialidades Weasley'),
(3, ' Caldeirão Furado'),
(3, ' Borgin e Burkes'),
(3, 'Profeta Diário');

-- Popula Item
INSERT INTO ITEM(IdLoja, nome, acao, valor, tipo, descricaoItem) VALUES
(4, 'Varinha', 'Realiza Feiticos', 90, 'ATAQUE', 'Onde um bruxo canaliza seus poderes mágicos'),
(4, 'Mapa do Maroto', 'Mostra a localização exata de cada pessoa dentro dos limites de Hogwarts', 40, 'LOCOMOCAO', 'Indica pontos de interesse pelo castelo'),
(4, 'Capa da Invisibilidade', 'Torna o usuário invisível', 60, 'DEFESA', 'Única capa de invisibilidade conhecida'),
(4, 'Desiluminador', 'Remove e devolve fontes de luz à suas devidas fontes', 10, 'DEFESA', 'Aparenta ser um isqueiro de prata padrão'),
(4, 'Livros de Feitiços', 'Explica ao leitor como realizar feitiços', 50, 'ATAQUE', 'Existem vários tipos'),
(4, 'Livros de Poções', 'Explica ao leitor como realizar poções', 70, 'DEFESA', 'Existem vários tipos'),
(4, 'Livros de Criaturas Mágicas', 'Explica sobre as criaturas mágicas', 50, 'ATAQUE', 'Existem vários tipos'),
(4, 'Vassoura', 'Usada para moder voar', 50, 'DEFESA', 'Transporte entre locais'),
(4, 'Vira-tempo', 'Utilizado para viajar no tempo', 50, 'DEFESA', 'Retorna horas ao passado'),
(4, 'Osso', 'Pode ser vendido ou usado como ingrediente de pocoes', 3, 'DIVERSOS', 'Um osso em perfeito estado'),

INSERT INTO ITEM(nome, acao, valor, tipo, descricaoItem) VALUES
('Casca de banana', 'Pode fazer pessoas cairem', 0, 'LIXO', 'Casca de banana pegajosa e nojenta, eca!');

-- Popula NPC
INSERT INTO NPC(item, nome) VALUES
(5, 'Albus Dumbledore'), 
(6, 'Severus Snape'),
(7, 'Rúbeo Hagrid'), 
(5, 'Fílio Flitwick'),
(5, 'Pomona Sprout'),
(5, 'Horácio Slughorn'),
(5, 'Minerva McGonagall'), 
(1, 'Hermione Granger'),
(1, 'Ron Weasley'),
(4, 'Luna Lovegood'),
(5, 'Draco Malfoy'),
(1, 'Lobo'),
(3, 'Lord Voldemort'),
(8, 'Dementador');

-- Popula DISCIPLINA
INSERT INTO DISCIPLINA (NPC, nomeDisciplina, feitico) VALUES
(1, 'DEFESA ARTE TREVAS', 5),
(2, 'TRANSFORMAÇÕES', 7),
(7, 'VÔO COM VASSOURAS', 7),
(8, 'TRATO CRIATURAS', 2),
(6, 'POÇÕES', 2),
(9, 'ARITMANCIA', 2);

-- Popula PROFESSOR
INSERT INTO PROFESSOR(idNPC, casa, disciplina) VALUES
(1, 1, 1),
(2, 1, 1),
(5, 1, 2),
(6, 2, 5),
(7, 3, 3),
(8, 1, 4),
(9, 4, 6);

-- Popula INSTANCIA_ITEM
INSERT INTO INSTANCIA_ITEM(idItem, idJogador) VALUES
(1, NULL),
(2, NULL),
(3, NULL),
(4, NULL),
(5, NULL),
(6, NULL),
(10, 1);

-- Popula INVENTARIO
INSERT INTO INVENTARIO(idJogador, dinheiro) VALUES
(1, 2000),
(2, 2000),
(3, 2000),
(4, 2000),
(5, 200),
(6, 2000);

-- Popula INSTANCIA_JOGADOR_DISCIPLINA
INSERT INTO INSTANCIA_JOGADOR_DISCIPLINA(idJogador, idDisciplina) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 1);

-- Popula HABILIDADE
INSERT INTO HABILIDADE(nomeHabilidade, dano, descricao) VALUES
('Vidência', 3, 'Capacidade de saber os eventos futuros'),
('Animagos', 5, 'Capacidade em se transformar em animais'),
('Metamorfomagos', 0, 'Muda a forma de seus atributos físicos'),
('Legilimência', 7, 'Capacidade de entrar nas mentes das outras pessoas'),
('Oclumência', 0, 'Capacidade de proteger suas mentes dos Legilimens'),
('Ofidioglossia', 5, 'Capacidade natural de falar língua de cobra'),
('Realizar Feitiços', 5, 'Realizar feitiços com a varinha'),
('Mordida', 4, 'O lobo morde o jogador');

-- Popula INIMIGO
INSERT INTO INIMIGO(idNPC, idHabilidade, moedas) VALUES
(9, 6, 1000),
(10, 6, 1000),
(11, 6, 1000),
(12, 6, 1000),
(13, 6, 1000),
(14, 6, 1000),
(21, 8, 4);

-- Popula INSTANCIA_INIMIGO
INSERT INTO INSTANCIA_INIMIGO(idNPC, idArea, idItem, pontosVida, multiplicador) VALUES
(9, 1, 1, 400, 1),
(10, 1, 2, 400, 2),
(11, 1, 3, 400, 3),
(12, 1, 4, 400, 1),
(13, 1, 5, 400, 2),
(14, 1, 6, 400, 3),
(21, 6, 10, 10, 1);

-- Popula FERRAMENTA
INSERT INTO FERRAMENTA(idItem, forca) VALUES
(1, 1000),
(2, 0),
(3, 500),
(4, 0),
(8, 500),
(9, 500);

-- Popula POCAO
INSERT INTO POCAO(idItem, ingrediente) VALUES
(6, 'Sanguinária'),
(6, 'Osso'),
(6, 'Diafanina'),
(6, 'Bezoar'),
(6, 'Ovo de Cinzal'),
(6, 'Chifre de Unicórnio');



-- Popula LIVRO
INSERT INTO LIVRO(idItem, feitico) VALUES
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6);

-- Popula Instancia_NPC_Tipo
INSERT INTO INSTANCIA_NPC_TIPO(idNPC, idArea, tipo) VALUES
(1, 1, 'Professor'),
(2, 1, 'Professor'),
(3, 1, 'Amigo'),
(4, 1, 'Amigo'),
(5, 1, 'Professor'),
(6, 1, 'Professor'),
(7, 1, 'Professor'),
(8, 1, 'Professor'),
(9, 1, 'Professor'),
(10, 1, 'Inimigo'),
(11, 1, 'Inimigo'),
(12, 2, 'Inimigo'),
(13, 3, 'Inimigo'),
(14, 4, 'Inimigo'),
(15, 2, 'Inimigo');

