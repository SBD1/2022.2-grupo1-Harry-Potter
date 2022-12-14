|Data|Versão|Alteração|Autor| 
|----|------|---------|-----|
|25/11/2022|0.1|Primeira versão do MER |[Alexia](https://github.com/alexianaa), [André](https://github.com/dartmol203), [Iago](https://github.com/iagoscm), [Letícia](https://github.com/leticiaarj) e [Felipe](https://github.com/felipecdmoura ).|
|05/12/2022|0.2|Correções de acordo com dicas do professor |[Alexia](https://github.com/alexianaa), [Iago](https://github.com/iagoscm)|
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
* Loja(<ins>idLoja</ins>, descricaoLoja, NPC, instanciaItem, area);
* Mapa(<ins>idMapa</ins>, regiao, descricao);
* NPC(<ins>idNPC</ins> nomeNPC, item);
    * Inimigo(moedas, habilidade);
    * Professor(casa, disciplina).
* Regiao(<ins>idRegiao</ins>, nome, descricaoRegiao, area);

## Relacionamentos
* **Jogador** -  *possui* -  **Casa**:
    * Um **Jogador** *possui* uma **Casa** e uma **Casa** *possui* um ou mais **Jogador**(es); 
    * Cardinalidade: 1 : N.
* **Jogador** -  *cursa* -  **Disciplina**:
    * Um **Jogador** *cursa* em uma ou mais **Disciplina**(s) e uma ou mais **Disciplina**(s) *pode ser cursada* um ou mais **Jogador**(s). 
    * Cardinalidade: N : M.
* **Jogador** - *tem* - **Grimorio**:
    * Um **Jogador** *tem* um **Grimorio** e um **Grimorio** *é tido* por um **Jogador**;
    * Cardinalidade: 1 : 1.
* **Jogador** - *possui* - **Inventario**:
    * Um **Jogador** *possui* um **Inventario** e um **Inventario** *é possuido* por um **Jogador**;
    * Cardinalidade: 1 : 1.    
* **Jogador** - *estar* - **Area**:
    * Um **jogador** *esta* em uma **Area** e uma **Area** *tem* um **Jogador**;
    * Cardinalidade: 1 : 1.
* **Inventario** - *possui* - **InstanciaItem**:
    * Um **Inventario** *possui* nenhuma ou várias **InstanciaItem** e um **Inventario** *é possuido* por um **InstanciaItem**;
    * Cardinalidade: 1 : 1. 
* **NPC** - *porta* - **Item**:
    * Um ou vários **NPC**(s) *porta* um ou vários **Item**(s) e uma ou vários **Item**(s) *é portado* por um ou vários **NPC**(s);
    * Cardinalidade: N : M.
* **Loja** - *contem* - **Item**:
    *    Uma **Loja** *contem* um ou varios **Item**(s) e um ou varios **Item**(s) *são contidos* por uma Loja;
    * Cardinalidade: N : 1.
* **Mapa** - *tem* - **Regiao**:
    * Um **Mapa** *tem* uma ou várias **Regiao**(oes) e uma ou várias **Regiao**(oes) *é constituído* por um ou vários **Mapa**(s);
    * Cardinalidade: 1 : N.
* **Regiao** - *tem* - **Area**:
    * Uma **Regiao** *tem* uma **Area** e uma **Area** *tem* uma ou mais **Regiao**(oes);
    * Cardinalidade: 1 : N
* **Item** - *gera* - **InstanciaItem**:
    * Um **Item** *gera* uma ou várias **InstanciaItem** e uma **InstanciaItem** *é gerada* por um **Item**;
    * Cardinalidade: N : 1.
* **Grimorio** - *possui* - **Feitico**:
    * Um **Grimorio** *possui* um ou vários **Feitico**(s) e zero ou vários **Feitico**(s) *são possuídos* por um **Grimorio**;
    * Cardinalidade: 0 : N.
* **Professor** - *responsável* - **Casa**:
    * Um **Professor** *é responsável* por uma **Casa** e uma **Casa** *é responsabilidade* de um **Professor**;
    * Cardinalidade: 1 : 1.
* **Disciplina** - *tem* - **Professor**:
    * Uma **Disciplina** *tem* um **Professor** e um **Professor** *tem* uma **Disciplina**;
    * Cardinalidade: 1 : 1.
* **Disciplina** - *ensina* - **Feitico**:
    * Uma **Disciplina** *ensina* zero ou mais **Feitico**(s) e um **Feitico** *é ensinado* por uma **Disciplina**;
    * Cardinalidade: 1 : 1.
