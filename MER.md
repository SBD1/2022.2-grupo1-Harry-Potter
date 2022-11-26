|Data|Versão|Alteração|Autor| 
|----|------|---------|-----|
|25/11/2022|0.1|Primeira versão do MER |Alexia, André, Iago, Letícia e Felipe.|

# Modelo Entidade-Relacionamento

## Entidades
* CASA;
* JOGADOR;
* DISCIPLINA;
* NPC
    * INIMIGO.
* INVENTARIO;
* ITEM;
    * FERRAMENTA;
    * POCAO;
    * LIVRO
* MAPA;
* AREA;
* FEITICO;
* HABILIDADE;
* LOJA;
* GRIMORIO.

## Atributos
* Jogador(<ins>idJogador</ins>, nome);
* Inventario(dinheiro); 
* Disciplina(<ins>idDisciplina</ins>, nomeDisciplina);
* Casa(<ins>idCasa</ins>, nomeCasa, petCasa);
* NPC(<ins>idNPC</ins> nomeNPC, tipo);
    * Inimigo(pontosVida, força);
* Loja(<ins>idLoja</ins>, descricaoLoja);
* Mapa(<ins>idMapa</ins>, Regiao);
* Regiao(<ins>idRegiao</ins>, descricaoArea); 
* Area(<ins>idArea</ins>, areaDireita, areaEsquerda, areaSul, areaNorte); 
* InstanciaItem(<ins>idItem</ins>, quantidade) 
* Item(<ins>idItem</ins>, nome, acao, valor, tipo, descricaoItem, utilizado); 
    * Ferramenta(forca).
* Feitico(<ins>idFeitico</ins>, nome, efeito, dano, quantidadeUso); 
* Grimorio(<ins>idGrimorio</ins>, numSlots);
* Habilidade(idHabilidade, nomeHabilidade, dano, descricaoHabilidade);
* Ingrediente(idIngrediente, nomeIngrediente).

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
* **Jogador** - *estar* - **Mapa**:
    * Um **jogador** *esta* em um **Mapa** e um **Mapa** *tem* um **Jogador**;
    * Cardinalidade: 1 : 1.
* **NPC** - *tem* - **Item**:
    * Um ou vários NPC(s) porta um ou vários Item(s) e uma ou vários Item(s) é portado um ou vários NPC(s);
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
* **Area** - *possui* - **NPC**:
    * Uma **Area** *possui* um ou nenhum **NPC** e um **NPC** *está ou não* em uma **Area**;
    * Cardinalidade: 0 : 1.
* **Grimorio** - *possui* - **Feitico**:
    * Um **Grimorio** *possui* um ou vários **Feitico**(s) e zero ou vários **Feitico**(s) *são possuídos* por um **Grimorio**;
    * Cardinalidade: 0 : N.
* **Grimorio** - *tem* - **NPC**
    * Um **Grimorio** *tem* um ou vários **NPC**(s) e um ou vários NPC(s) *é tido* por um **Grimorio**.
    * Cardinalidade: 1 : N.



