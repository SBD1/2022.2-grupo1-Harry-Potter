  |Data|Versão|Alteração|Autor| 
  |----|------|---------|-----|
  |26/11/2022|0.1|Primeira versão do Dicionário de Dados |[Alexia](https://github.com/alexianaa) e [Letícia](https://github.com/leticiaarj).|
  |27/11/2022|0.2|Adição de Exemplos |[Letícia](https://github.com/leticiaarj).|
  |05/12/2022|0.2|Correções de acordo com dicas do professor |[Alexia](https://github.com/alexianaa), [Iago](https://github.com/iagoscm)|
 
# Dicionário de Dados

## Entidade: Jogador
#### Descrição: Personagem jogável.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição| Exemplo |
| ---- | ---- | ---- | ---- | ---- | ---- | 
| idJogador | Obrigatório | int | 3 | Identificação do jogador. | 001 |
| idDisciplina | Obrigatório | int | 3 |  Identificação das disciplinas do jogador. | 1 |
| idGrimorio | Obrigatório | int | 3 | Identificação do grimório do jogador. | 1 |
| idCasa | Obrigatório | int | 3 | Identificação da casa do jogador. | 1 |
| idArea | Obrigatório | int | 3 | Identificação do mapa do jogador. | 1 |
| nome | Obrigatório | char | 20 | Nickname do jogador. | Harry Potter |
| pontosVida | Obrigatório | int | 30 | Quantidade de vida que o jogador tem. | 100 |

## Entidade: Casa
#### Descrição: 4 Equipes que se identificam por um nome, animal e tem um professor responsável e um local específico nos dormitórios.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição| Exemplo |
| ---- | ---- | ---- | ---- | ---- | ---- | 
| idCasa | Obrigatório | int | 3 | Identificação da casa. | 1 |
| nomeCasa | Obrigatório | char | 10 | nome da casa. | Grifinória |
| petCasa | Obrigatório | varchar | 8 | animal de cada casa. | Leão | 
| idNPC | Obrigatório  | int | 3 | Identificação do professor da casa. | 1 |

## Entidade: Disciplina
#### Descrição: Conjunto de períodos os quais os jogadores estarão aprendendo algo com o professor.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição| Exemplo |
| ---- | ---- | ---- | ---- | ---- | ---- | 
| idDisciplina | Obrigatório | int | 3 | Identificação da disciplina. | 1 |
| idNPC| Obrigatório | int | 3 | Identificação do NPC. | 1 |
| nomeDisciplina | Obrigatório | char | 20 | Nome identificador da disciplina. | Defesa contra as Artes das Trevas |

## Entidade: NPC
#### Descrição: Personagem não jogável.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição| Exemplo |
| ---- | ---- | ---- | ---- | ---- | ---- | 
| idNPC | Obrigatório | int | 3 | Identificador do NPC. | 1 |
| idItem | Não obrigatório | int | 3 | NPC pode deixar ou entregar um item para o jogador. | 1 |
| nomeNPC | Obrigatório | char | 20 | nome identificador do NPC. | Severus Snape |
| tipo | Obrigatório | char | 10 | Especialização do NPC. | Professor |

## Entidade: Inimigo
#### Descrição: NPC hostil ao jogador.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição| Exemplo |
| ---- | ---- | ---- | ---- | ---- | ---- |  
| idHabilidade | Obrigatório | int | 3 | Identificador da habilidade do inimigo. | 1 |
| pontosVida | Obrigatório | int | 100 | Quantidade de vida que o inimigo tem. | 100 |
| Multiplicador | Obrigatório | int | 5 | Multiplica o dano e aumenta a dificulade no combate. | 100 |

## Entidade: Mercador
#### Descrição: NPC que vende ou compra itens.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição| Exemplo |
| ---- | ---- | ---- | ---- | ---- | ---- |  
| idLoja | Obrigatório | int | 3 | Identificador da loja do mercador. | 1 |

## Entidade: Inventario
#### Descrição: Espaço para guardar itens e dinheiro do jogador.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição| Exemplo |
| ---- | ---- | ---- | ---- | ---- | ---- |  
| idJogador | Obrigatório | int | 3 | Identificador do jogador. | 1 |
| idItem | Não obrigatório | int | 3 | Identificador do item. | 1 |
| dinheiro | Não obrigatório | int | 9999 | Quantidade de dinheiro que o jogador pode ter. | 20000 |

## Entidade: Ferramenta
#### Descrição: Item que pode ser equipado e utilizado.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição| Exemplo |
| ---- | ---- | ---- | ---- | ---- | ---- |  
| forca | Obrigatório | int | 20 | Pontos de vida que retira do inimigo no ataque. | 50 |


## Entidade: Pocao
#### Descrição: Item com efeito sobre o jogador ou inimigo.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição| Exemplo |
| ---- | ---- | ---- | ---- | ---- | ---- |  
| idIngrediente | Obrigatório | char | 15 | Identificação do ingrediente. | 1 |


## Entidade: Livro
#### Descrição: Livros que contém os feitiços.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição| Exemplo |
| ---- | ---- | ---- | ---- | ---- | ---- |  
| idFeitico | Obrigatório  | int | 3 | Identificação do Feitiço. | 1 |


## Entidade: Mapa
#### Descrição: Mapa que vai abrigar as regiões.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição| Exemplo |
| ---- | ---- | ---- | ---- | ---- | ---- |  
| idMapa | Obrigatório  | int | 3 | Identificação do Mapa.  | 1 |
| regiao | Obrigatório | char | 30 | Local que abriga as regiões. | Altas Terras da Escócia |
| descricao | Obrigatório | varchar | 80 | Descrição do local que abriga as regiões. | Zona montanhosa do norte da Escócia com muita neblina. |


## Entidade: Regiao
#### Descrição: Regiões que vai abrigar as áreas.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição| Exemplo |
| ---- | ---- | ---- | ---- | ---- | ---- |  
| idRegiao | Obrigatório  | int | 3 | Identificação da Região. | 1 |
| idArea | Obrigatório  | int | 3 | Identificação da Área. | 1 |
| descricaoRegiao | Obrigatório  | varchar | 60 | Detalhamento das características das Regiões. | Escola de Magia e Bruxaria de Hogwarts |

## Entidade: Area
#### Descrição: Identificação do local específico que um jogador está.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição| Exemplo | 
| ---- | ---- | ---- | ---- | ---- | ---- |  
| idArea | Obrigatório  | int | 3 | Identificação da Área. | 1 |
| idRegiao | Obrigatório  | int | 3 | Identificação da Região. | 1 |
| idNPC | Obrigatório  | int | 3 | Identificação do NPC. | 1 |
| areaDireita | Obrigatório  | int | 3 | Posição na direita. | 2 |
| areaEsquerda | Obrigatório  |  int | 3 | Posição na Esquerda. | 5 |
| areaSul | Obrigatório  |  int | 3 | Posição no Sul. | 9 |
| areaNorte | Obrigatório  |  int | 3 | Posição no Norte. | 1 |

## Entidade: InstanciaItem
#### Descrição: Identificação da quantidade de itens que um jogador específico tem.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição| Exemplo |
| ---- | ---- | ---- | ---- | ---- | ---- |  
| idInstanciaItem | Obrigatório  | int | 3 | Identificação da InstanciaItem. | 1 | 
| idItem | Obrigatório  | int | 3 | Identificação do Item. | 1 | 
| idJogador | Não Obrigatório  | int | 3 | Identificação do Jogador. | 1 | 
| quantidade | Obrigatório  | numeric  | 2,1 | Quantidade de itens que um jogador tem. | 2 |
## Entidade: Item
#### Descrição: Itens que um jogador pode ter.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição| Exemplo | 
| ---- | ---- | ---- | ---- | ---- | ---- |  
| idItem | Obrigatório  | int | 3 | Identificação do Item. | 1 |
| nome | Obrigatório  | char | 30 | Nome do Item. | Mapa do Maroto |
| acao | Obrigatório  | char | 30 | A ação que esse item pode realizar dentro do jogo. |É capaz de mostrar a localização exata de cada pessoa dentro dos limites de Hogwarts, além de indicar caminhos, passagens secretas e outros pontos de interesse pelo castelo e seus terrenos. |
| valor | Obrigatório  | numeric | 2,1 | Valor monetário que esse item tem dentro do jogo. | 1000 |
| tipo | Obrigatório  | char | 20 | Tipo de item. | Acessório de Navegação. |
| descricaoItem | Obrigatório | varchar | 60 | A atuação do item dentro do jogo. | Um mapa. |
| utilizado | Obrigatório  | boolean | 1 | Se o item foi utilizado ou não. | False |

## Entidade: Feitico
#### Descrição: Os feitiços que podem ser realizados dentro do jogo.

| Atributo      | Obrigatoriedade | Tipo    | Tamanho | Descrição| Exemplo |
| ---- | ---- | ---- | ---- | ---- | ---- |  
| idFeitico | Obrigatório  | int | 3 | Identificação do Feitiço. | 1 |
| nome | Obrigatório  | char | 30 | Nome do Feitiço. | Expecto Patronum |
| efeito | Obrigatório  | varchar | 40 | Define qual o efeito produzido pelo feitiço. | Conjura uma espécie de espírito protetor, um guardião de magia capaz de proteger o bruxo de criaturas das trevas.|
| dano | Obrigatório  | numeric | 2,1 | Define qual o dano produzido pelo feitiço. | 0 |
| quantidadeUso | Obrigatório  | numeric | 2,1 | Define qual a quantidade de uso do feitiço. | 0 |

## Entidade: Habilidade
#### Descrição: As habilidades que um NPC - Inimigo pode ter .

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição| Exemplo |
| ---- | ---- | ---- | ---- | ---- | ---- |  
| idHabilidade | Obrigatório  | int | 3 | Identificação da Habilidade. | 1 |
| nomeHabilidade | Obrigatório  | char | 30 | Nome da Habilidade. | Ofidioglossia. |
| dano | Obrigatório  | numeric | 2,1 | Define qual o dano produzido pela habilidade. | 10 |
| descricaoHabilidade | Obrigatório | varchar | 60 | A atuação da habilidade dentro do jogo. | A língua das cobras é falada num som sibilante, semelhante ao de uma serpente; como tal, as pessoas normais não podem entendê-la. Além da simples comunicação, ofidioglotas parecem ser também capazes de influenciar a vontade das serpentes em certa medida. |

## Entidade: Loja
#### Descrição: Local em que o jogador pode vender ou comprar itens.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição| Exemplo |
| ---- | ---- | ---- | ---- | ---- | ---- |  
| idLoja | Obrigatório  | int | 3 | Identificação da Loja. | 1 |
| idItem | Obrigatório  | int | 3 | Identificação do Item. | 1 |
| descricaoLoja | Obrigatório | varchar | 60 | Detalhamento das características da Loja. | Floreios e Borrões é uma livraria no Lado Norte, Beco Diagonal. É onde os alunos de Hogwarts adquire seus livros escolares. |


## Entidade: Grimorio
#### Descrição: Coleção de feitiços, rituais e encantamentos mágicos.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição| Exemplo |
| ---- | ---- | ---- | ---- | ---- | ---- |  
| idGrimorio | Obrigatório | int | 3 | Identificação do Grimório. | 1 
| idFeitico | Obrigatório  | int | 3 | Identificação do Feitiço. | 1 |
| numSlots | Obrigatório  | int | 3 | Quantidade de Feitiços que um jogador pode ter. | 20 |

## Entidade: Ingrediente
#### Descrição: Ingredientes necessários para produzir uma poção.

|Atributo| Obrigatoriedade| Tipo | Tamanho | Descrição| Exemplo |
| ---- | ---- | ---- | ---- | ---- | ---- |  
| idIngrediente | Obrigatório  | int | 3 | Identificação do Ingrediente. | 1 |
| nomeIngrediente | Obrigatório  | varchar | 30 | Nome do Ingrediente. | Bezoar. |
