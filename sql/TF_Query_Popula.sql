-- Popula casas
INSERT INTO casa (nomecasa, petcasa ) VALUES
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
(2, 'Estacao de trem secreta que leva para a escola de bruxaria de Hogwarts', 'Estacao 9 3/4')
(3, 'Um pub e hospedaria bruxo localizado em Londres', 'Calderão Furado'),
(4, 'Casa da família Weasley. Localizada nos arredores de Ottery St. Catchpole em Devon, Inglaterra, é uma habitação completamente mágico', 'A Toca'),
(5, 'Rua dos Alfeneiros, nº 4', 'Casa dos Dursley'),
(6, 'É uma loja bem popular entre os alunos de Hogwarts pelos variados doces que nela se encontra, vai dos mais simples até os bem exóticos', 'Dedos de Mel');

-- Popula Area
INSERT INTO AREA(idRegiao, areaLeste, areaOeste, areaSul, areaNorte) VALUES
(1, NULL, 3, NULL, 2),
(2, NULL, NULL, 1, NULL),
(3, 1, NULL, 4, NULL),
(4, 1, NULL, 4, NULL),
(5, 1, NULL, 4, NULL),
(6, NULL, NULL, NULL, 3);

-- Popula Feitico
INSERT INTO FEITICO (nome, efeito, ponto, quantidadeUso) VALUES
('Expelliarmus', 'Derrubar a arma do inimigo', 1, 99),
('Accio', 'Este feitiço é usado para convocar objetos', 0, 99),
('Aqua Eructo', 'conjura um intenso jato de água', 2, 99),
('Bombarda', 'Usado para destruir obstáculos', 3, 99),
('Petrificus Totalus', 'etrifica por completo o oponente temporariamente', 5, 99),
('Expecto Patronum', 'Conjura uma espécie de espírito protetor, um guardião de magia capaz de proteger o bruxo de criaturas das trevas ', 10, 50),
('Lapifors', 'Transforma um alvo em um coelho', 1, 99),
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
(1, 'Harry Potter', 4, 20, 1)
(2, 'Lily Williamson', 1, 20, 1)
(3, 'Ben Kent', 2, 20, 2)
(4, 'Morgan Kerr', 3, 20, 3)
(5, 'Edward Simpson', 4, 20, 4)
(6, 'Emma Parkes', 5, 20, 1);

-- Popula Item
INSERT INTO ITEM(nome, acao, valor, tipo, descricaoItem) VALUES
('Varinha', 'Realiza Feiticos', 900, 'ATAQUE', 'Uma varinha é um instrumento mágico quase consciente pelo qual um bruxo canaliza seus poderes mágicos'),
('Mapa do Maroto', 'Mostra a localização exata de cada pessoa dentro dos limites de Hogwarts', 400, 'LOCOMOCAO', 'Indica caminhos, passagens secretas e outros pontos de interesse pelo castelo'),
('Capa da Invisibilidade', 'Torna o usuário invisível', 600, 'DEFESA', 'Única capa de invisibilidade conhecida que não se desvaneceria com a idade e proporcionaria proteção eterna ao usuário'),
('Desiluminador', 'Remove e devolve fontes de luz à suas devidas fontes', 100, 'DEFESA', 'Aparenta ser um isqueiro de prata padrão'),
('Livros de Feitiços', 'Explica ao leitor como realizar feitiços', 1000, 'ATAQUE', 'Existem vários tipos'),
('Livros de Poções', 'Explica ao leitor como realizar poções', 700, 'DEFESA', 'Existem vários tipos'),
('Livros de Criaturas Mágicas', 'Explica sobre as criaturas mágicas', 'ATAQUE', 'Existem vários tipos'),
('Vassoura', 'Usada para moder voar', 500, 'Um dos meios empregados por bruxos para se transportar entre locais'),
('Vira-tempo', 'Dispositivo utilizado para viajar no tempo', 500, 'O número de vezes que alguém vira a ampulheta corresponde ao número de horas que o indivíduo irá retornar ao passado. No entanto, eles só podem permanecer no passado por cerca de cinco horas');

-- Popula NPC
INSERT INTO NPC(item, nome) VALUES
(5, 'Albus Dumbledore'), 
(2, 'Remo Lupin'), 
(3, 'Tiago Potter'), 
(4, 'Ron Weasley'), 
(5, 'Minerva McGonagall'), 
(6, 'Severus Snape'),
(1, 'Rolanda Hooch'), 
(7, 'Rúbeo Hagrid'), 
(5, 'Séptima Vector'), 
(5, 'Herpo, o Sujo'),
(5, 'Morgana le Fay'),
(5, 'Gerardo Grindelwald'),
(1, 'Tom Riddle'),
(1, 'Emerico, o Mal'),
(1, 'Florean Fortescue'),
(1, 'Garrick Olivaras'),
(1, 'Fred Weasley'),
(1, 'Daisy Dodderidge'),
(1, 'Sr. Borgin'),
(1, ' Barnabas Cuffe');

-- Popula DISCIPLINA
INSERT INTO NPC(NPC, nomeDisciplina, feitico) VALUES
(1, 'DEFESA CONTRA AS ARTES DAS TREVAS', 5),
(2, 'TRANSFORMAÇÕES', 7),
(7, 'VÔO COM VASSOURAS', 7),
(8, 'TRATO DE CRIATURAS MÁGICAS', 2),
(6, 'POÇÕES', 2),
(9, 'ARITMANCIA', 2),

-- Popula PROFESSOR
INSERT INTO NPC(idNPC, casa, disciplina) VALUES
(1, 1, 1),
(2, 1, 1),
(5, 1, 2),
(6, 2, 5),
(7, 3, 3),
(8, 1, 4)
(9, 4, 6);

-- Popula INSTANCIA_ITEM
INSERT INTO INSTANCIA_ITEM(idItem) VALUES
(1),
(2),
(3),
(4),
(5),
(6);

-- Popula INVENTARIO
INSERT INTO INVENTARIO(idJogador, instanciaItem, dinheiro) VALUES
(1, 1, 2000),
(2, 2, 2000),
(3, 3, 2000),
(4, 4, 2000),
(5, 5, 200),
(6, 6, 2000);

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
('Metamorfomagos', 0, 'Muda a forma de seu nariz, da cor de seu cabelo e outros atributos físicos'),
('Legilimência', 7, 'Capacidade de entrar nas mentes das outras pessoas'),
('Oclumência', 0, 'Capacidade de proteger suas mentes dos Legilimens'),
('Ofidioglossia', 5, 'Capacidade natural de falar língua de cobra');
('Realizar Feitiços', 5, 'Realizar feitiços com a varinha e com ou sem auxílio de livros');

-- Popula INIMIGO
INSERT INTO INIMIGO(idNPC, idHabilidade, moedas) VALUES
(9, 6, 1000),
(10, 6, 1000),
(11, 6, 1000),
(12, 6, 1000),
(13, 6, 1000),
(14, 6, 1000);

-- Popula INSTANCIA_INIMIGO
INSERT INTO INSTANCIA_INIMIGO(idNPC, idArea, idInstanciaItem, pontosVida, multiplicador) VALUES
(9, 1, 400, 1),
(10, 2, 400, 2),
(11, 3, 400, 3),
(12, 4, 400, 1),
(13, 5, 400, 2),
(14, 6, 400, 3);

-- Popula FERRAMENTA
INSERT INTO FERRAMENTA(idItem, forca) VALUES
(1, 1000),
(2, 0),
(3, 500),
(4, 0),
(8), 500,
(9, 500);

-- Popula POCAO
INSERT INTO POCAO(idItem, ingrediente) VALUES
(6, 'Sanguinária'),
(6, 'Osso'),
(6, 'Diafanina'),
(6, 'Bezoar'),
(6, 'Ovo de Cinzal'),
(6, 'Chifre de Unicórnio');

-- Popula LOJA
INSERT INTO LOJA(idNPC, idArea, idInstanciaItem, descricao) VALUES
(15, 3, 1, ' Sorveteria Florean Fortescue'),
(16, 3, 1, 'Olivaras Varinhas'),
(17, 3, 1, 'Gemialidades Weasley'),
(18, 3, 1, ' Caldeirão Furado'),
(19, 3, 1, ' Borgin e Burkes'),
(20, 3, 1, 'Profeta Diário');

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
(15, 2, 'Inimigo'),
(16, 3, 'Vendedor'),
(17, 3, 'Vendedor'),
(18, 3'Vendedor'),
(19, 3, 'Vendedor'),
(20, 3, 'Vendedor');



