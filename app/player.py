
class TestPlayer:
    idJogador = 1
    name = 'Harry'
    idArea = 1
    pontosVida = 10
    idCasa = 'Grifinoria'

    def __init__(self):
        self.idJogador = 1
        self.name = 'Harry'
        self.idArea = 1
        self.pontosVida = 10
        self.idCasa = 1   
    
    def show_player_info(self):
        print(f'Nome: {self.name}\n' +
              f'Casa: {self.idCasa}\n' +
              f'PV: {self.pontosVida}'
              )
 
