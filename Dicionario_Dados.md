  | Data       | Versão | Alteração                                  | Autor                                                                              |
  | ---------- | ------ | ------------------------------------------ | ---------------------------------------------------------------------------------- |
  | 26/11/2022 | 0.1    | Primeira versão do Dicionário de Dados     | [Alexia](https://github.com/alexianaa) e [Letícia](https://github.com/leticiaarj). |
  | 27/11/2022 | 0.2    | Adição de Exemplos                         | [Letícia](https://github.com/leticiaarj).                                          |
  | 05/12/2022 | 0.2    | Correções de acordo com dicas do professor | [Alexia](https://github.com/alexianaa), [Iago](https://github.com/iagoscm)         |
 
# Dicionário de Dados

## Entidade: Jogador
#### Descrição: Personagem jogável.

| Atributo   | Obrigatoriedade | Tipo    | Tamanho | Descrição                             | Exemplo      |
| ---------- | --------------- | ------- | ------- | ------------------------------------- | ------------ |
| idJogador  | Obrigatório     | tinyint | 1       | Identificação do jogador.             | 1            |
| grimorio   | Obrigatório     | tinyint | 1       | Identificação do grimório do jogador. | 1            |
| casa       | Obrigatório     | tinyint | 1       | Identificação da casa do jogador.     | 1            |
| area       | Obrigatório     | tinyint | 1       | Identificação do mapa do jogador.     | 1            |
| nome       | Obrigatório     | char    | 20      | Nickname do jogador.                  | Harry Potter |
| pontosVida | Obrigatório     | tinyint | 1       | Quantidade de vida que o jogador tem. | 100          |

## Entidade: Casa
#### Descrição: 4 Equipes que se identificam por um nome, animal e tem um professor responsável e um local específico nos dormitórios.

| Atributo             | Obrigatoriedade | Tipo    | Tamanho | Descrição                           | Exemplo    |
| -------------------- | --------------- | ------- | ------- | ----------------------------------- | ---------- |
| idCasa               | Obrigatório     | tinyint | 1       | Identificação da casa.              | 1          |
| nomeCasa             | Obrigatório     | char    | 10      | nome da casa.                       | Grifinória |
| petCasa              | Obrigatório     | varchar | 8       | animal de cada casa.                | Leão       |
| professorResponsavel | Obrigatório     | tinyint | 1       | Identificação do professor da casa. | 1          |

## Entidade: Disciplina
#### Descrição: Conjunto de períodos os quais os jogadores estarão aprendendo algo com o professor.

| Atributo       | Obrigatoriedade | Tipo    | Tamanho | Descrição                                        | Exemplo                           |
| -------------- | --------------- | ------- | ------- | ------------------------------------------------ | --------------------------------- |
| idDisciplina   | Obrigatório     | tinyint | 1       | Identificação da disciplina.                     | 1                                 |
| NPC            | Obrigatório     | tinyint | 1       | Identificação do NPC.                            | 1                                 |
| nomeDisciplina | Obrigatório     | char    | 20      | Nome identificador da disciplina.                | Defesa contra as Artes das Trevas |
| feitico        | Não obrigatório | tinyint | 1       | Identificação do feitico aprendido na disciplina | 6                                 |

## Entidade: NPC
#### Descrição: Personagem não jogável.

| Atributo | Obrigatoriedade | Tipo    | Tamanho | Descrição                                           | Exemplo       |
| -------- | --------------- | ------- | ------- | --------------------------------------------------- | ------------- |
| idNPC    | Obrigatório     | tinyint | 1       | Identificador do NPC.                               | 1             |
| idItem   | Não obrigatório | tinyint | 1       | NPC pode deixar ou entregar um item para o jogador. | 1             |
| nomeNPC  | Obrigatório     | char    | 20      | nome identificador do NPC.                          | Severus Snape |

## Entidade: Inimigo
#### Descrição: NPC hostil ao jogador.

| Atributo   | Obrigatoriedade | Tipo    | Tamanho | Descrição                                       | Exemplo |
| ---------- | --------------- | ------- | ------- | ----------------------------------------------- | ------- |
| habilidade | Obrigatório     | tinyint | 1       | Identificador da habilidade do inimigo.         | 1       |
| moedas     | Obrigatório     | tinyint | 1       | Quantidade de moedas ganha por matar o inimigo. | 10      |

## Entidade: InstanciaInimigo
### Descrição: Instancia que vai estar no jogo de cada jogador

| Atributo      | Obrigatoriedade | Tipo    | Tamanho | Descrição                                            | Exemplo |
| ------------- | --------------- | ------- | ------- | ---------------------------------------------------- | ------- |
| NPC           | Obrigatório     | tinyint | 1       | Identificador do NPC                                 | 26      |
| pontosVida    | Obrigatório     | tinyint | 1       | Quantidade de vida que o inimigo tem.                | 100     |
| multiplicador | Obrigatório     | tinyint | 1       | Multiplica o dano e aumenta a dificulade no combate. | 100     |
| InstanciaItem | Não obrigatório | tinyint | 1       | Instancia do item o qual o inimigo deixa ao morrer.  | 8       |
| area          | Obrigatório     | tinyint | 1       | Identificação do mapa do inimigo.                    | 1       |

## Entidade: Inventario
#### Descrição: Espaço para guardar itens e dinheiro do jogador.

| Atributo      | Obrigatoriedade | Tipo     | Tamanho | Descrição                                      | Exemplo |
| ------------- | --------------- | -------- | ------- | ---------------------------------------------- | ------- |
| idJogador     | Obrigatório     | tinyint  | 1       | Identificador do jogador.                      | 1       |
| instanciaItem | Não obrigatório | tinyint  | 1       | Identificador do item.                         | 1       |
| dinheiro      | Não obrigatório | smallint | 2       | Quantidade de dinheiro que o jogador pode ter. | 2000    |

## Entidade: Ferramenta
#### Descrição: Item que pode ser equipado e utilizado.

| Atributo | Obrigatoriedade | Tipo    | Tamanho | Descrição                                       | Exemplo |
| -------- | --------------- | ------- | ------- | ----------------------------------------------- | ------- |
| idItem   | Obrigatório     | tinyint | 1       | Identificação do item.                          | 1       |
| forca    | Obrigatório     | tinyint | 1       | Pontos de vida que retira do inimigo no ataque. | 50      |


## Entidade: Pocao
#### Descrição: Item com efeito sobre o jogador ou inimigo.

| Atributo    | Obrigatoriedade | Tipo    | Tamanho | Descrição              | Exemplo              |
| ----------- | --------------- | ------- | ------- | ---------------------- | -------------------- |
| idItem      | Obrigatório     | tinyint | 1       | Identificação do item. | 5                    |
| ingrediente | Obrigatório     | char    | 30      | nome do ingrediente.   | Sangue de salamandra |

## Entidade: Mapa
#### Descrição: Mapa que vai abrigar as regiões.

| Atributo  | Obrigatoriedade | Tipo    | Tamanho | Descrição                                 | Exemplo                                                |
| --------- | --------------- | ------- | ------- | ----------------------------------------- | ------------------------------------------------------ |
| idMapa    | Obrigatório     | tinyint | 1       | Identificação do Mapa.                    | 1                                                      |
| regiao    | Obrigatório     | char    | 30      | Local que abriga as regiões.              | Altas Terras da Escócia                                |
| descricao | Obrigatório     | varchar | 80      | Descrição do local que abriga as regiões. | Zona montanhosa do norte da Escócia com muita neblina. |


## Entidade: Regiao
#### Descrição: Regiões que vai abrigar as áreas.

| Atributo        | Obrigatoriedade | Tipo    | Tamanho | Descrição                                     | Exemplo                                |
| --------------- | --------------- | ------- | ------- | --------------------------------------------- | -------------------------------------- |
| idRegiao        | Obrigatório     | tinyint | 1       | Identificação da Região.                      | 1                                      |
| idArea          | Obrigatório     | tinyint | 1       | Identificação da Área.                        | 1                                      |
| descricaoRegiao | Obrigatório     | varchar | 60      | Detalhamento das características das Regiões. | Escola de Magia e Bruxaria de Hogwarts |

## Entidade: Area
#### Descrição: Identificação do local específico que um jogador está.

| Atributo  | Obrigatoriedade | Tipo    | Tamanho | Descrição              | Exemplo |
| --------- | --------------- | ------- | ------- | ---------------------- | ------- |
| idArea    | Obrigatório     | tinyint | 1       | Identificação da Área. | 1       |
| areaLeste | Obrigatório     | tinyint | 1       | Posição na Leste.      | 2       |
| areaOeste | Obrigatório     | tinyint | 1       | Posição na Oeste.      | 5       |
| areaSul   | Obrigatório     | tinyint | 1       | Posição no Sul.        | 9       |
| areaNorte | Obrigatório     | tinyint | 1       | Posição no Norte.      | 1       |

## Entidade: InstanciaItem
#### Descrição: Identificação da quantidade de itens que um jogador específico tem.

| Atributo        | Obrigatoriedade | Tipo    | Tamanho | Descrição                       | Exemplo |
| --------------- | --------------- | ------- | ------- | ------------------------------- | ------- |
| idInstanciaItem | Obrigatório     | tinyint | 1       | Identificação da InstanciaItem. | 1       |
| idItem          | Obrigatório     | tinyint | 1       | Identificação do Item.          | 1       |
## Entidade: Item
#### Descrição: Itens que um jogador pode ter.

| Atributo      | Obrigatoriedade | Tipo    | Tamanho | Descrição                                          | Exemplo                                                                                                                                                                                       |
| ------------- | --------------- | ------- | ------- | -------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| idItem        | Obrigatório     | tinyint | 1       | Identificação do Item.                             | 1                                                                                                                                                                                             |
| nome          | Obrigatório     | char    | 30      | Nome do Item.                                      | Mapa do Maroto                                                                                                                                                                                |
| acao          | Obrigatório     | varchar | 200     | A ação que esse item pode realizar dentro do jogo. | É capaz de mostrar a localização exata de cada pessoa dentro dos limites de Hogwarts, além de indicar caminhos, passagens secretas e outros pontos de interesse pelo castelo e seus terrenos. |
| valor         | Obrigatório     | numeric | 2,1     | Valor monetário que esse item tem dentro do jogo.  | 50                                                                                                                                                                                            |
| tipo          | Obrigatório     | char    | 20      | Tipo de item.                                      | Acessório de Navegação.                                                                                                                                                                       |
| descricaoItem | Obrigatório     | varchar | 60      | A atuação do item dentro do jogo.                  | Um mapa.                                                                                                                                                                                      |

## Entidade: InstanciaItem
## Descrição: Instancia dos itens do jogo

| Atributo        | Obrigatoriedade | Tipo    | Tamanho | Descrição                           | Exemplo |
| --------------- | --------------- | ------- | ------- | ----------------------------------- | ------- |
| idInstanciaItem | Obrigatório     | tinyint | 1       | Identificação da Instancia do Item. | 1       |
| item            | Obrigatório     | tinyint | 1       | Identificação do Item.              | 1       |
| utilizado       | Obrigatório     | boolean | 1       | Se o item foi utilizado ou não.     | False   |

## Entidade: Feitico
#### Descrição: Os feitiços que podem ser realizados dentro do jogo.

| Atributo      | Obrigatoriedade | Tipo    | Tamanho | Descrição                                                       | Exemplo                                                                                                           |
| ------------- | --------------- | ------- | ------- | --------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| idFeitico     | Obrigatório     | tinyint | 1       | Identificação do Feitiço.                                       | 1                                                                                                                 |
| nome          | Obrigatório     | char    | 30      | Nome do Feitiço.                                                | Expecto Patronum                                                                                                  |
| efeito        | Obrigatório     | varchar | 40      | Define qual o efeito produzido pelo feitiço.                    | Conjura uma espécie de espírito protetor, um guardião de magia capaz de proteger o bruxo de criaturas das trevas. |
| ponto         | Obrigatório     | numeric | 2,1     | Define quantos pontos de dano ou cura é produzido pelo feitiço. | 0                                                                                                                 |
| quantidadeUso | Obrigatório     | numeric | 2,1     | Define qual a quantidade de uso do feitiço.                     | 0                                                                                                                 |

## Entidade: Habilidade
#### Descrição: As habilidades que um NPC - Inimigo pode ter .

| Atributo     | Obrigatoriedade | Tipo    | Tamanho | Descrição                                     | Exemplo        |
| ------------ | --------------- | ------- | ------- | --------------------------------------------- | -------------- |
| idHabilidade | Obrigatório     | tinyint | 1       | Identificação da Habilidade.                  | 1              |
| nome         | Obrigatório     | char    | 30      | Nome da Habilidade.                           | Ofidioglossia. |
| dano         | Obrigatório     | numeric | 2,1     | Define qual o dano produzido pela habilidade. | 10             |
| descricao    | Obrigatório     | varchar | 60      | A atuação da habilidade dentro do jogo.       | A língua das cobras é falada num som sibilante, semelhante ao de uma serpente; como tal, as pessoas normais não podem entendê-la. Além da simples comunicação, ofidioglotas parecem ser também capazes de influenciar a vontade das serpentes em certa medida. |

## Entidade: Loja
#### Descrição: Local em que o jogador pode vender ou comprar itens.

| Atributo      | Obrigatoriedade | Tipo    | Tamanho | Descrição                                  | Exemplo                                                                                                                     |
| ------------- | --------------- | ------- | ------- | ------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------- |
| idLoja        | Obrigatório     | tinyint | 1       | Identificação da Loja.                     | 1                                                                                                                           |
| instanciaItem | Obrigatório     | tinyint | 1       | Identificação da Instancia do Item.        | 1                                                                                                                           |
| descricaoLoja | Obrigatório     | varchar | 60      | Detalhamento das características da Loja.  | Floreios e Borrões é uma livraria no Lado Norte, Beco Diagonal. É onde os alunos de Hogwarts adquire seus livros escolares. |
| NPC           | Obrigatório     | tinyint | 1       | Identificador do NPC responsável pela Loja | 2                                                                                                                           |


## Entidade: Grimorio
#### Descrição: Coleção de feitiços, rituais e encantamentos mágicos.

| Atributo   | Obrigatoriedade | Tipo    | Tamanho | Descrição                                       | Exemplo |
| ---------- | --------------- | ------- | ------- | ----------------------------------------------- | ------- |
| idGrimorio | Obrigatório     | tinyint | 1       | Identificação do Grimório.                      | 1       |
| feitico    | Obrigatório     | tinyint | 1       | Identificação do Feitiço.                       | 1       |
| numSlots   | Obrigatório     | tinyint | 1       | Quantidade de Feitiços que um jogador pode ter. | 20      |

