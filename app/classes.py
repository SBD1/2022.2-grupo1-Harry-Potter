
class Player:
    def __init__(self, idJogador, nome, idArea, pontosvida, idCasa, estado):
        self.idJogador = idJogador
        self.nome = nome
        self. idArea = idArea
        self.pontosVida = pontosvida
        self.idCasa = idCasa
        self.estado = estado

        
class Area:
    def __init__(self, idArea, idRegiao, nome, areaLeste, areaOeste, areaSul, areaNorte):
        self.idArea = idArea
        self.idRegiao = idRegiao
        self.nome = nome
        self.areaLeste = areaLeste
        self.areaOeste = areaOeste
        self.areaSul = areaSul
        self.areaNorte = areaNorte


class Inimigo:
    def __init__(self, idInstInim, idNPC, nome, idArea, idItem, nomeItem, moedas,pontosVidamax, pontosVida, multiplicador):
        self.idInstInim = idInstInim
        self.idNPC = idNPC
        self.nome = nome
        self.idArea = idArea
        self.idItem = idItem
        self.nomeItem = nomeItem
        self.moedas = moedas
        self.pontosVida = pontosVida
        self.pontosVidamax = pontosVidamax
        self.multiplicador = multiplicador

class Loja:
    def __init__(self, idloja, idarea, descricao):
        self.idloja = idloja
        self.idarea = idarea
        self.descricao = descricao
        
class Feitico:
    def __init__(self, idfeitico, nome, efeito, ponto):
        self.idfeitico = idfeitico
        self.nome = nome
        self.efeito = efeito
        self.ponto = ponto
        
class Habilidade:
    def __init__(self, idHabilidade, nomeHabilidade, dano, descricao):
        self.idHabilidade = idHabilidade
        self.nomeHabilidade = nomeHabilidade
        self.dano = dano
        self.descricao = descricao
        