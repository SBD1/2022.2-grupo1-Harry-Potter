  |Data|Versão|Alteração|Autor| 
  |----|------|---------|-----|
  |26/11/2022|0.1|Primeira versão do Dicionário de Dados |[Alexia]((https://github.com/alexianaa)) e [Letícia]((https://github.com/leticiaarj)).|

# Dicionário de Dados

## Entidade: Jogador
#### Descrição: Personagem jogável.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição|
| ---- | ---- | ---- | ---- | ---- | 
| idJogador | Obrigatório | int | 3 | Identificação do jogador. |
| idDisciplina | Obrigatório | int | 3 | Identificação das disciplinas do jogador. |
| idGrimorio | Obrigatório | int | 3 | Identificação do grimório do jogador. |
| idCasa | Obrigatório | int | 3 | Identificação da casa do jogador. |
| idMapa | Obrigatório | int | 3 | Identificação do mapa do jogador. |
| nome | Obrigatório | varchar | 30 | Nickname do jogador. |
| pontosVida | Obrigatório | int | 30 | Quantidade de vida que o jogador tem. |

## Entidade: Casa
#### Descrição: 4 Equipes que se identificam por um nome, animal e tem um professor responsável e um local específico nos dormitórios.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição|
| ---- | ---- | ---- | ---- | ---- | 
| idCasa | Obrigatório | int | 3 | Identificação da casa. |
| nomeCasa | Obrigatório | varchar | 10 | nome da casa. |
| petCasa | Obrigatório | varchar | 8 | animal de cada casa. |
| idNPC | Obrigatório  | int | 3 | Identificação do professor da casa. |

## Entidade: Disciplina
#### Descrição: Conjunto de períodos os quais os jogadores estarão aprendendo algo com o professor.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição|
| ---- | ---- | ---- | ---- | ---- | 
| idDisciplina | Obrigatório | int | 3 | Identificação da disciplina. |
| nomeDisciplina | Obrigatório | varchar | 20 | nome identificador da disciplina. |

## Entidade: NPC
#### Descrição: Personagem não jogável.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição|
| ---- | ---- | ---- | ---- | ---- | 
| idNPC | Obrigatório | int | 3 | Identificador do NPC. |
| idItem | Não obrigatório | int | 3 | NPC pode deixar ou entregar um item para o jogador. |
| nomeNPC | Obrigatório | varchar | 30 | nome identificador do NPC. |
| tipo | Obrigatório | varchar | 10 | Especialização do NPC. |

## Entidade: Inimigo
#### Descrição: NPC hostil ao jogador.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição|
| ---- | ---- | ---- | ---- | ---- |  
| idHabilidade | Obrigatório | int | 3 | Identificador da habilidade do inimigo. |
| pontosVida | Obrigatório | int | 100 | Quantidade de vida que o inimigo tem. |
| forca | Obrigatório | int | 5 | Multiplica o dano e aumenta a dificulade no combate. |
| dano | Obrigatório | int | 5 | Pontos de vida que o inimigo pode tirar do jogador. |

## Entidade: Mercador
#### Descrição: NPC que vende ou compra itens.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição|
| ---- | ---- | ---- | ---- | ---- |  
| idLoja | Obrigatório | int | 3 | Identificador da loja do mercador. |

## Entidade: Inventario
#### Descrição: Espaço para guardar itens e dinheiro do jogador.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição|
| ---- | ---- | ---- | ---- | ---- |  
| idJogador | Obrigatório | int | 3 | Identificador do jogador. |
| idItem | Não obrigatório | int | 3 | Identificador do item. |
| dinheiro | Não obrigatório | int | 9999 | Quantidade de dinheiro que o jogador pode ter. |

## Entidade: Ferramenta
#### Descrição: Item que pode ser equipado e utilizado.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição|
| ---- | ---- | ---- | ---- | ---- |  
| forca | Obrigatório | int | 20 | Pontos de vida que retira do inimigo no ataque. |


## Entidade: Pocao
#### Descrição: Item com efeito sobre o jogador ou inimigo.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição|
| ---- | ---- | ---- | ---- | ---- |  
| idIngrediente | Obrigatório | varchar | 15 | Identificação do ingrediente. |


## Entidade: Livro
#### Descrição: Livros que contém os feitiços.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição|
| ---- | ---- | ---- | ---- | ---- |  
| idFeitico | Obrigatório  | int | 3 | Identificação do Feitiço. |


## Entidade: Mapa
#### Descrição: Mapa que vai abrigar as regiões.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição|
| ---- | ---- | ---- | ---- | ---- |   
| idMapa | Obrigatório  | int | 3 | Identificação do Mapa.  |
| Regiao | Obrigatório | varchar | 10 | Local que abriga as regiões. |


## Entidade: Regiao
#### Descrição: Regiões que vai abrigar as áreas.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição|
| ---- | ---- | ---- | ---- | ---- |  
| idRegiao | Obrigatório  | int | 3 | Identificação da Região. |
| idArea | Obrigatório  | int | 3 | Identificação da Área. |
| descricaoRegiao | Obrigatório  | varchar | 60 | Detalhamento das características das Regiões. |

## Entidade: Area
#### Descrição: Identificação do local específico que um jogador está.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição|
| ---- | ---- | ---- | ---- | ---- |  
| idArea | Obrigatório  | int | 3 | Identificação da Área. |
| idRegiao | Obrigatório  | int | 3 | Identificação da Região. |
| idNPC | Obrigatório  | int | 3 | Identificação do NPC. |
| areaDireita | Obrigatório  | numeric | 2, 1 | Posição na direita. |
| areaEsquerda | Obrigatório  |  numeric | 2, 1 | Posição na Esquerda. |
| areaSul | Obrigatório  |  numeric | 2, 1 | Posição no Sul. |
| areaNorte | Obrigatório  |  numeric | 2, 1 | Posição no Norte. |

## Entidade: InstanciaItem
#### Descrição: Identificação da quantidade de itens que um jogador específico tem.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição|
| ---- | ---- | ---- | ---- | ---- |  
| idItem | Obrigatório  | int | 3 | Identificação do Item. |
| idJogador | Obrigatório  | int | 3 | Identificação do Jogador. |
| quantidade | Obrigatório  | numeric  | 2,1 | Quantidade de itens que um jogador tem. |
## Entidade: Item
#### Descrição: Itens que um jogador pode ter.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição|
| ---- | ---- | ---- | ---- | ---- |  
| idItem | Obrigatório  | int | 3 | Identificação do Item. |
| nome | Obrigatório  | varchar | 30 | Nome do Item. |
| acao | Obrigatório  | varchar | 30 | A ação que esse item pode realizar dentro do jogo. |
| valor | Obrigatório  | numeric | 2,1 | Valor monetário que esse item tem dentro do jogo. |
| tipo | Obrigatório  | varchar | 20 | Tipo de item. |
| descricaoItem | Obrigatório | varchar | 60 | A atuação do item dentro do jogo. |
| utilizado | Obrigatório  | boolean | 1 | Se o item foi utilizado ou não. |

## Entidade: Feitico
#### Descrição: Os feitiços que podem ser realizados dentro do jogo.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição|
| ---- | ---- | ---- | ---- | ---- |  
| idFeitico | Obrigatório  | int | 3 | Identificação do Feitiço. |
| nome | Obrigatório  | varchar | 30 | Nome do Feitiço. |
| efeito | Obrigatório  | varchar | 60 | Define qual o efeito produzido pelo feitiço. |
| dano | Obrigatório  | varchar | 60 | Define qual o dano produzido pelo feitiço. |
| quantidadeUso | Obrigatório  | numeric | 2,1 | Define qual a quantidade de uso do feitiço. |

## Entidade: Habilidade
#### Descrição: As habilidades que um NPC - Inimigo pode ter .

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição|
| ---- | ---- | ---- | ---- | ---- |  
| idHabilidade | Obrigatório  | int | 3 | Identificação da Habilidade. |
| nomeHabilidade | Obrigatório  | varchar | 30 | Nome da Habilidade. |
| dano | Obrigatório  | varchar | 60 | Define qual o dano produzido pela habilidade. |
| descricaoHabilidade | Obrigatório | varchar | 60 | A atuação da habilidade dentro do jogo. |

## Entidade: Loja
#### Descrição: Local em que o jogador pode vender ou comprar itens.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição|
| ---- | ---- | ---- | ---- | ---- |  
| idLoja | Obrigatório  | int | 3 | Identificação da Loja. |
| idItem | Obrigatório  | int | 3 | Identificação do Item. |
| descricaoLoja | Obrigatório | varchar | 60 | Detalhamento das características da Loja. |


## Entidade: Grimorio
#### Descrição: Coleção de feitiços, rituais e encantamentos mágicos.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição|
| ---- | ---- | ---- | ---- | ---- |  
| idGrimorio | Obrigatório | int | 3 | Identificação do Grimório. |
| idFeitico | Obrigatório  | int | 3 | Identificação do Feitiço. |
| numSlots | Obrigatório  | int | 3 | Quantidade de Feitiços que um jogador pode ter. |

## Entidade: Ingrediente
#### Descrição: Ingredientes necessários para produzir uma poção.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição|
| ---- | ---- | ---- | ---- | ---- |  
| idIngrediente | Obrigatório  | int | 3 | Identificação do Ingrediente. |
| nomeIngrediente | Obrigatório  | varchar | 30 | Nome do Ingrediente. |
