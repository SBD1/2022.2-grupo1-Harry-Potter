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

-- Popula Feitico
INSERT INTO FEITICO (nome, efeito, ponto) VALUES
('Expelliarmus', 'Derrubar a arma do inimigo', 6),
('Petrificus Totalus', 'etrifica por completo o oponente temporariamente', 5),
('Expecto Patronum', 'Conjura uma espécie de espírito protetor capaz de proteger o bruxo', 12),
('Avada Kedavra', 'Tira a vida de quem é atingido por', 400);

-- Popula Jogador
INSERT INTO JOGADOR (nome, idArea, pontosVida, idCasa) VALUES
('Harry Potter', 4, 20, 1),
('Lily Williamson', 1, 20, 1),
('Ben Kent', 2, 20, 2),
('Morgan Kerr', 3, 20, 3),
('Edward Simpson', 4, 20, 4);

-- Popula Grimorio
INSERT INTO GRIMORIO (idGrimorio, feitico) VALUES
(1, 3),
(2, 4),
(2, 2),
(4, 2),
(5, 1);

-- Popula LOJA
INSERT INTO LOJA(idArea, descricao) VALUES
(3, 'Sorveteria'),
(3, 'Olivaras Varinhas'),
(3, 'Genialidades Weasley'),
(3, 'Caldeirão Furado'),
(3, 'Profeta Diario'),
(3, 'Vassourax'),
(3, 'Floreios e Borroes'),
(3, 'Farmacia');

-- Popula Item
INSERT INTO ITEM(IdLoja, nome, acao, valor, tipo, descricaoItem) VALUES
(2, 'Varinha de teixo', 'Realiza Feiticos', 90, 'ATAQUE', 'Onde um bruxo canaliza seus poderes mágicos'),
(2, 'Varinha de azevinho', 'Realiza Feiticos', 80, 'ATAQUE', 'Onde um bruxo canaliza seus poderes mágicos'),
(2, 'Varinha de videira', 'Realiza Feiticos', 60, 'ATAQUE', 'Onde um bruxo canaliza seus poderes mágicos'),
(3, 'Pena Auto-Revisora', 'Decoracao', 3, 'DEIVERSOS', 'Corrige qualquer palavra escrita errada.'),
(3, 'Marcas Negras Comestíveis', 'Deixa alguém doente',10, 'DIVERSOS', 'Vêm em um tubinho e deixam qualquer um doente.'),
(3, 'Poção do Amor', 'Poção', 20, 'DIVERSOS', 'Cria uma paixão obsessiva'),
(4, 'Cerveja amanteigada', 'Bedida', 20, 'CURA', 'Cerveja fermentada amanteigada'),
(5, 'Jornal do dia', 'Jornal para leitura', 2, 'DIVERSOS', 'Monstros entranhos vem cercando Hogwards'),
(7, 'Livros de Feitiços', 'Explica ao leitor como realizar feitiços', 50, 'ATAQUE', 'Existem vários tipos'),
(7, 'Livros de Poções', 'Explica ao leitor como realizar poções', 70, 'DEFESA', 'Existem vários tipos'),
(7, 'Livros de Criaturas Mágicas', 'Explica sobre as criaturas mágicas', 50, 'ATAQUE', 'Existem vários tipos'),
(6, 'Vassoura', 'Usada para moder voar', 50, 'DEFESA', 'Transporte entre locais'),
(8, 'Osso', 'Pode ser vendido ou usado como ingrediente de pocoes', 3, 'DIVERSOS', 'Um osso em perfeito estado'),
(8, 'Sanguinária', 'Pode ser vendido ou usado como ingrediente de pocoes', 3, 'DIVERSOS', 'Planta com propriedades mágicas'),
(8, 'Diafanina', 'Pode ser vendido ou usado como ingrediente de pocoes', 3, 'DIVERSOS', 'Planta mágica que parece ter tentáculos longos e oscilantes.'),
(8, 'Bezoar', 'Pode ser vendido ou usado como ingrediente de pocoes', 3, 'DIVERSOS', 'Massa pétrea retirada do estômago de um bode'),
(8, 'Ovo de Cinzal', 'Pode ser vendido ou usado como ingrediente de pocoes', 3, 'DIVERSOS', 'Ovos do Cinzal, uma serpente mágica'),
(8, 'Chifre de Unicórnio', 'Pode ser vendido ou usado como ingrediente de pocoes', 3, 'DIVERSOS', 'Chifres de unicórnio têm propriedades de purificação'),
(1, 'Sorvete de morango', 'Traz felicidade', 5, 'CURA', 'Sorvete sabor morango'),
(1, 'Sorvete de vida', 'Traz felicidade', 30, 'CURA', 'Sorvete sabor vida'),
(1, 'Sorvete de chocolate', 'Traz felicidade', 10, 'CURA', 'Sorvete sabor chocolate');

-- Popula ITEM que nao estao em lojas
INSERT INTO ITEM(nome, acao, valor, tipo, descricaoItem) VALUES
('Casca de banana', 'Pode fazer pessoas cairem', 0, 'LIXO', 'Casca de banana pegajosa e nojenta, eca!'),
('Vira-tempo', 'Utilizado para viajar no tempo', 50, 'DEFESA', 'Retorna horas ao passado'),
('Mapa do Maroto', 'Mostra a localização exata de cada pessoa dentro dos limites de Hogwarts', 40, 'LOCOMOCAO', 'Indica pontos de interesse pelo castelo'),
('Capa da Invisibilidade', 'Torna o usuário invisível', 60, 'DEFESA', 'Única capa de invisibilidade conhecida'),
('Desiluminador', 'Remove e devolve fontes de luz à suas devidas fontes', 10, 'DEFESA', 'Aparenta ser um isqueiro de prata padrão');

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
(21, 'Draco Malfoy'),
(8, 'Lobo'),
(2, 'Dementador'),
(3, 'Lord Voldemort'),
(1, 'Neville Longbottom');

-- Popula Instancia_NPC_Tipo
INSERT INTO INSTANCIA_NPC_TIPO(idNPC, tipo) VALUES
(1, 'Professor'),
(2, 'Professor'),
(3, 'Amigo'),
(4, 'Professor'),
(5, 'Professor'),
(6, 'Professor'),
(7, 'Professor'),
(8, 'Amigo'),
(9, 'Amigo'),
(10, 'Amigo'),
(11, 'Amigo'),
(12, 'Inimigo'),
(13, 'Inimigo'),
(14, 'Inimigo');

-- Popula Falas
INSERT INTO FALAS(idNPC, idArea, momento, texto) VALUES
(1,2,1,'Bem vindo à Hogwards'),
(9,5,2,'Calouro? posso te ensinar alguns truques...'),
(3,6,2,'Nessa floresta há sempre monstros a espreita cuidado!'),
(7,15,2,'Para aprender um feitiço é preciso assistir as aulas!'),
(11,13,2,'Saia do meu caminho!'),
(2,17,2,'Hoje vou ensinar o feitiço Expelliarmus.'),
(2,17,3,'Você não tem mais nada para aprender aqui.'),
(4,18,2,'Você não tem experiência para essa aula ainda.'),
(4,18,3,'Hoje vou ensinar o feitiço Petrificus Totalus.'),
(5,19,2,'Você não tem experiência para essa aula ainda.'),
(5,19,3,'Hoje vou ensinar o feitiço Expecto Patronum.'),
(10,4,2,'Seria tão legal poder ter uma vassoura voadora né? talvez você ache algo interessante para comprar no Beco Diagonal.'),
(9,5,4,'Na floresta oculta há o maior dos nossos medos, procure a Hermione para conseguir derrota-lo!'),
(8,12,4,'Vejo que você precisa aprender algo a mais, mas cuidado é um feitiço muito perigoso!'),
(8,3,2,'Tome um sorvete ou cerveja e se cure o quanto você estiver disposto a pagar.'),
(9,3,3,'Tome um sorvete ou cerveja e se cure o quanto você estiver disposto a pagar.'),
(10,3,4,'Tome um sorvete ou cerveja e se cure o quanto você estiver disposto a pagar.'),
(13,16,2,'Eu soube que o professor Fílio Flitwick não ensina o Petrificus Totalus se você já souber o Expecto Patronum, maluquice né?!\n Se eu fosse você eu ia na sala 2 primeiro...');

-- Popula Falas
INSERT INTO FALAS(idNPC, idArea, momento, texto) VALUES
(1,2,1,'Bem vindo à Hogwards'),
(7,5,2,'Calouro? posso te ensinar alguns truques...'),
(8,6,2,'Nessa floresta há sempre monstros a espreita cuidado!'),
(5,15,2,'Se quiser aprender um feitiço novo tente pedir um livro ao seu professor!'),
(6,13,2,'Saia do meu caminho!');


-- Popula DISCIPLINA
INSERT INTO DISCIPLINA (NPC, nomeDisciplina, feitico) VALUES
(1, 'DEFESA ARTE TREVAS', 1),
(2, 'TRANSFORMAÇÕES', 1),
(7, 'VÔO COM VASSOURAS', 2),
(8, 'TRATO CRIATURAS', 2),
(6, 'POÇÕES', 3),
(9, 'ARITMANCIA', 4);

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
(3, 1);

-- Popula INVENTARIO
INSERT INTO INVENTARIO(idJogador, dinheiro) VALUES
(1, 2000),
(2, 2000),
(3, 2000),
(4, 2000),
(5, 200);

-- Popula INSTANCIA_JOGADOR_DISCIPLINA
INSERT INTO INSTANCIA_JOGADOR_DISCIPLINA(idJogador, idDisciplina) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6);

-- Popula HABILIDADE
INSERT INTO HABILIDADE(nomeHabilidade, dano, descricao) VALUES
('Vidência', 3, 'Capacidade de saber os eventos futuros'),
('Animagos', 5, 'Capacidade em se transformar em animais'),
('Metamorfomagos', 0, 'Muda a forma de seus atributos físicos'),
('Legilimência', 7, 'Capacidade de entrar nas mentes das outras pessoas'),
('Oclumência', 0, 'Capacidade de proteger suas mentes dos Legilimens'),
('Ofidioglossia', 5, 'Capacidade natural de falar língua de cobra'),
('Realizar Feitiços', 5, 'Realizar feitiços com a varinha'),
('Mordida', 4, 'O lobo morde o jogador'),
('Sugar a alegria', 5, 'Cria um ambiente de frio, escuridão, tristeza e desespero ');

-- Popula INIMIGO
INSERT INTO INIMIGO(idNPC, idHabilidade, moedas) VALUES
(12, 8, 10),
(13, 9, 80),
(14, 4, 120);

-- Popula INSTANCIA_INIMIGO
INSERT INTO INSTANCIA_INIMIGO(idNPC, idArea, idItem, pontosVida, pontosVidaMax, multiplicador) VALUES
(12, 6, 13, 10, 10, 1),
(13, 7, 2, 40, 40, 1),
(14, 8, 3, 400, 400, 3),
(12, 6, 13, 10, 10, 2),
(13, 7, 5, 40, 40, 2),
(14, 8, 6, 400, 400, 3),
(12, 6, 13, 10, 10, 3);

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
(9, 1),
(9, 2),
(9, 3),
(9, 4);

