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
(3, 'r pub e hospedaria bruxo localizado em Londres', 'Calderão Furado'),
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
('Expecto Patronum', 'Conjura uma espécie de espírito protetor, um guardião de magia capaz de proteger o bruxo de criaturas das trevas ', 10, 50);

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

