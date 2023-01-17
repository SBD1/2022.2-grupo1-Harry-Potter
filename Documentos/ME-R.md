| Data       | Versão | Alteração                                  | Autor                                                                                                                                                                                                       |
| ---------- | ------ | ------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 25/11/2022 | 0.1    | Primeira versão do MER                     | [Alexia](https://github.com/alexianaa), [André](https://github.com/dartmol203), [Iago](https://github.com/iagoscm), [Letícia](https://github.com/leticiaarj) e [Felipe](https://github.com/felipecdmoura ). |
| 05/12/2022 | 0.2    | Correções de acordo com dicas do professor | [Alexia](https://github.com/alexianaa), [Iago](https://github.com/iagoscm)                                                                                                                                  |
# Modelo Entidade-Relacionamento

## Entidades
* AREA;
* CASA;
* DISCIPLINA;
* FEITICO;
* GRIMORIO; 
* HABILIDADE;
* INSTANCIAINIMIGO;
* INSTANCIAITEM;
* INSTANCIANPCTIPO;
* INSTANCIAJOGADORDISCIPLINA;
* INVENTARIO;
* ITEM;
    * FERRAMENTA;
    * POCAO.
* JOGADOR;
* LIVOR;
* LOJA; 
* MAPA;
* NPC
    * INIMIGO;
    * PROFESSOR.
* REGIAO;

## Atributos
* Area(<ins>idArea</ins>, areaLeste, areaOeste, areaSul, areaNorte); 
* Casa(<ins>idCasa</ins>, nomeCasa, petCasa, professorResponsavel);
* Disciplina(<ins>idDisciplina</ins>, NPC, nomeDisciplina, feitico);
* Feitico(<ins>idFeitico</ins>, efeito, ponto, quantidadeUso);
* Grimorio(<ins>idGrimorio</ins>, nome, numSlots, feitico);
* Habilidade(<ins>idHabilidade</ins>, nome, dano, descricao);
* InstanciaInimigo(<ins>NPC</ins>, pontosVida, multiplicador, area, instanciaItem)
* InstanciaItem(<ins>idInstanciaItem</ins>, item, utilizado);
* InstanciaNPCTipo(<ins>NPC</ins>, tipo, area);
* InstanciaJogadorDisciplina(<ins>idJogador</ins>,codDisciplina); 
* Inventario(<ins>idJogador</ins>, dinheiro, instanciaItem); 
* Item(<ins>idItem</ins>, nome, acao, valor, tipo, descricaoItem); 
    * Ferramenta(forca);
    * Pocao(ingrediente).
* Jogador(<ins>idJogador</ins>, nome, area, pontosVida, casa, grimorio);
* Livro(<ins>idItem</ins>, feitico);
* Loja(<ins>idLoja</ins>, descricaoLoja, instanciaItem, area);
* Mapa(<ins>idMapa</ins>, regiao, descricao);
* NPC(<ins>idNPC</ins> nomeNPC, item);
    * Inimigo(moedas, habilidade);
    * Professor(casa, disciplina).
* Regiao(<ins>idRegiao</ins>, nome, descricaoRegiao, area);

## Relacionamentos
* **Jogador** -  *possui* -  **Casa**:
    * Um **Jogador** *possui* uma **Casa** e uma **Casa** *possui* um ou mais **Jogador**(es); 
    * Cardinalidade: 1 : 1 - 1 : N.
* **Jogador** -  *cursa* -  **Disciplina**:
    * Um **Jogador** *cursa* em uma ou mais **Disciplina**(s) e uma **Disciplina**(s) *pode ser cursada* por um ou mais **Jogador**(s). 
    * Cardinalidade: 1 : N - 1 : N.
* **Jogador** - *tem* - **Grimorio**:
    * Um **Jogador** *tem* um **Grimorio** e um **Grimorio** *é tido* por um **Jogador**;
    * Cardinalidade: 1 : 1 - 1 : 1.
* **Jogador** - *possui* - **Inventario**:
    * Um **Jogador** *possui* um **Inventario** e um **Inventario** *é possuido* por um **Jogador**;
    * Cardinalidade: 1 : 1 - 1 : 1.    
* **Jogador** - *estar* - **Area**:
    * Um **jogador** *esta* em uma **Area** e uma **Area** *tem* um **Jogador**;
    * Cardinalidade: 1 : 1 - 1 : 1.
* **Inventario** - *possui* - **InstanciaItem**:
    * Um **Inventario** *possui* nenhuma ou várias **InstanciaItem** e uma **InstanciaItem** *é possuida* por um ou nenhum **Inventario**;
    * Cardinalidade: 1 : N - 1 : 0,1. 
* **NPC** - *porta* - **Item**:
    * Um **NPC** *porta* um ou vários **Item**(s) e um **Item** *é portado* por um ou vários **NPC**(s);
    * Cardinalidade: 1 : N - 1 : N.
* **Loja** - *contem* - **Item**:
    * Uma **Loja** *contem* um ou vários **Item**(s) e um **Item** *é contidos* por uma ou mais **Lojas**;
    * Cardinalidade: 1 : N - 1 : N.
* **Livro** - *ensina* - **Feitico**
    * Uma **Livro** *ensina* um **Feitico**(s) e um **Feitico**(s) *é ensinado* por um **Livro**;
    * Cardinalidade: 1 : 1 - 1 : 1.
* **Mapa** - *tem* - **Regiao**:
    * Um **Mapa** *tem* uma ou várias **Regiao**(oes) e uma **Regiao** *constui* um **Mapa**;
    * Cardinalidade: 1 : N - 1 : 1.
* **Regiao** - *tem* - **Area**:
    * Uma **Regiao** *tem* uma ou mais **Areas** e uma **Area** *constitui* uma **Regiao**;
    * Cardinalidade: 1 : N - 1 : 1.
* **Area** - *contém* - **Loja**
    * Uma **Loja** *está contida* em uma ou varias **Area**(s) e uma **Area**(s) *contém* zero ou uma **Lojas**;
    * Cardinalidade: 1 : N - 1 - N.
* **Item** - *gera* - **InstanciaItem**:
    * Um **Item** *gera* uma ou várias **InstanciaItem** e uma **InstanciaItem** *é gerada* por um **Item**;
    * Cardinalidade: N : 1 - 1 : 1.
* **Grimorio** - *possui* - **Feitico**:
    * Um **Grimorio** *possui* um ou vários **Feitico**(s) e um **Feitico** *é possuído* por um **Grimorio**;
    * Cardinalidade: 1 : 0,N - 1 : 1.
* **Professor** - *responsável* - **Casa**:
    * Um **Professor** *é responsável* por uma **Casa** e uma **Casa** *é responsabilidade* de um **Professor**;
    * Cardinalidade: 1 : 1 - 1 : 1.
* **Disciplina** - *tem* - **Professor**:
    * Uma **Disciplina** *tem* um **Professor** e um **Professor** *tem* uma **Disciplina**;
    * Cardinalidade: 1 : 1 - 1 : 1.
* **Disciplina** - *ensina* - **Feitico**:
    * Uma **Disciplina** *ensina* zero ou mais **Feitico**(s) e um **Feitico** *é ensinado* por uma **Disciplina**;
    * Cardinalidade: 1 : 1.
