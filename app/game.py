from player import TestPlayer
from area import Area
import os

def clear():
    os.system('cls')

A1 = Area(1, 'Portao de Hogwarts', 2, 5, -1, -1)
A2 = Area(2, 'Salao Principal', 3, 1, 4, -1)
A3 = Area(3, 'Refeitorio', -1, 2, -1, -1)
A4 = Area(4, 'Biblioteca', -1, -1, -1, 2)
A5 = Area(5, 'Floresta', 1, -1, -1, -1)

regiao = [A1, A2, A3, A4, A5]

class HarryPotterGame():
    player = ""

    def start_game(self):
        self.display_main_menu()


    # Exibe o menu principal
    def display_main_menu(self):

        
        print(' __   __  _______  ______    ______    __   __      _______  _______  _______  _______  _______  ______        __   __  __   __  ______')    
        print('|  | |  ||   _   ||    _ |  |    _ |  |  | |  |    |       ||       ||       ||       ||       ||    _ |      |  |_|  ||  | |  ||      |')   
        print('|  |_|  ||  |_|  ||   | ||  |   | ||  |  |_|  |    |    _  ||   _   ||_     _||_     _||    ___||   | ||      |       ||  | |  ||  _    |') 
        print('|       ||       ||   |_||_ |   |_||_ |       |    |   |_| ||  | |  |  |   |    |   |  |   |___ |   |_||_     |       ||  |_|  || | |   |')  
        print('|       ||       ||    __  ||    __  ||_     _|    |    ___||  |_|  |  |   |    |   |  |    ___||    __  |    |       ||       || |_|   |')  
        print('|   _   ||   _   ||   |  | ||   |  | |  |   |      |   |    |       |  |   |    |   |  |   |___ |   |  | |    | ||_|| ||       ||       |')  
        print('|__| |__||__| |__||___|  |_||___|  |_|  |___|      |___|    |_______|  |___|    |___|  |_______||___|  |_|    |_|   |_||_______||______|\n\n')

        print('Escolha uma das opções abaixo(1-3):\n')

        print('1 - Criar Novo Personagem\n' +
              '2 - Carregar Personagem\n' +
              '3 - Sair\n\n\n')

        inp = 0

        while(inp not in [1, 2, 3]):
            inp = input('> ')

            if inp == '1':
                
                break;
            if inp == '2':
                self.load_game()
                break;
            if inp == '3':
                exit()
            else:
                print('\nOpção Inválida!')

    # Carrega um personagem existente        
    def load_game(self):
        clear()
        self.player = TestPlayer()      
        print('Digite o id do seu personagem(id teste = 1):')
    
        inp = 0
        while(inp not in ['1']):
            inp = input('> ')

            if inp == str(self.player.idJogador):
                self.gameplay()
                break;
            else:
                print('\nOpção Inválida!')

    # Roda o Jogo em si    
    def gameplay(self):
        while(True):
            clear()
            self.player.show_player_info()
            
            current_area = self.get_area(self.player.idArea)

            area_norte = self.get_area(current_area.areaNorte).nome

            #Completa o nome do mapa oeste com espacos em branco para manter um tamanho fixo e manter a estrutura do mapa
            area_oeste = self.get_area(current_area.areaOeste).nome
            while len((area_oeste)) < 25:
                area_oeste = area_oeste + ' '

            area_leste = self.get_area(current_area.areaLeste).nome
            area_sul = self.get_area(current_area.areaSul).nome

            print(f"\nArea atual: {current_area.nome}\n")

            print(f'                            1. {area_norte}\n')
            print(f'          2. {area_oeste}' + f'         3. {area_leste}\n')
            print(f'                            4. {area_sul}\n')

            inp = 0
            while(inp not in ['1','2','3','4']):
                inp = input('> ')
                if inp == '1':
                    if current_area.areaNorte != -1:  
                        self.player.idArea = current_area.areaNorte
                        break
                if inp == '2':
                    if current_area.areaOeste != -1:  
                        self.player.idArea = current_area.areaOeste
                        break
                if inp == '3':
                    if current_area.areaLeste != -1:  
                        self.player.idArea = current_area.areaLeste
                        break
                if inp == '4': 
                    if current_area.areaSul != -1:  
                        self.player.idArea = current_area.areaSul
                        break
                else:
                    print('\nOpção Inválida!')

    def get_area(self, id):
        for area in regiao:
            if area.idArea == id:
                return area
        return Area(-1, "Nada", -1, -1, -1, -1)





if __name__ == '__main__':
    initGame = HarryPotterGame()
    initGame.start_game()