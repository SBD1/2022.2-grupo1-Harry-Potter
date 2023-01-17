
class Player:
    def __init__(self, idJogador, idGrimorio, nome, idArea, pontosvida, idCasa):
        self.idJogador = idJogador
        self.idGrimorio = idGrimorio
        self.nome = nome
        self. idArea = idArea
        self.pontosVida = pontosvida
        self.idCasa = idCasa


class Area:
    def __init__(self, idArea, idRegiao, nome, areaLeste, areaOeste, areaSul, areaNorte):
        self.idArea = idArea
        self.idRegiao = idRegiao
        self.nome = nome
        self.areaLeste = areaLeste
        self.areaOeste = areaOeste
        self.areaSul = areaSul
        self.areaNorte = areaNorte
