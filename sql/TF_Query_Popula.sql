-- cria casas
INSERT INTO casa (idcasa, nomecasa, petcasa ) VALUES
(1, 'Grifinória', 'Águia'),
(2, 'Sonserina', 'Cobra'),
(3, 'Corvinal', 'Corvo'),
(4, 'LufaLufa', 'Furão');

-- cria mapa
INSERT INTO MAPA (idMapa, descricao) VALUES
(1, 'Hogwarts'),
(2, 'Estacao');

-- cria Regiao
INSERT INTO REGIAO (idRegiao, idMapa, descricao, nome) VALUES
(1, 1, 'portao da escola de magia e bruxaria da regiao', 'Portao da escola'),
(2, 2, 'Estacao de trem secreta que leva para a escola de bruxaria de Hogwarts', 'Estacao 9 3/4');

INSERT INTO AREA (idArea, idRegiao, areaLeste, areaOeste, areaSul, areaNorte) VALUES
(1, 1, NULL, 3, NULL, 2),
(2, 1, NULL, NULL, 1, NULL),
(3, 2, 1, NULL, 4, NULL),
(4, 2, NULL, NULL, NULL, 3);

INSERT INTO FEITICO (idFeitico, nome, efeito, ponto, quantidadeUso) VALUES
(1, 'Expelliarmus', 'Derrubar a arma do inimigo', 1, 99);

INSERT INTO GRIMORIO (idGrimorio, numSlots, feitico) VALUES
(1, 99, 1);

INSERT INTO JOGADOR (idJogador, idGrimorio, nome, idArea, pontosVida, idCasa) VALUES
(1, 1, 'Harry Potter', 4, 20, 1);

