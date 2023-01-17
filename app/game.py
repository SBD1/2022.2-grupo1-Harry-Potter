from database import DataBase
from classes import *
import sys
import os


def clear():
    os.system('cls')


class Game:

    def __init__(self):
        self.connection = DataBase.create_connection()
        self.player = Player(-1, -1, ' ', -1, -1, -1)
        pass

    def start(self):

        print(' __   __  _______  ______    ______    __   __      _______  _______  _______  _______  _______  ______        __   __  __   __  ______')
        print('|  | |  ||   _   ||    _ |  |    _ |  |  | |  |    |       ||       ||       ||       ||       ||    _ |      |  |_|  ||  | |  ||      |')
        print('|  |_|  ||  |_|  ||   | ||  |   | ||  |  |_|  |    |    _  ||   _   ||_     _||_     _||    ___||   | ||      |       ||  | |  ||  _    |')
        print('|       ||       ||   |_||_ |   |_||_ |       |    |   |_| ||  | |  |  |   |    |   |  |   |___ |   |_||_     |       ||  |_|  || | |   |')
        print('|       ||       ||    __  ||    __  ||_     _|    |    ___||  |_|  |  |   |    |   |  |    ___||    __  |    |       ||       || |_|   |')
        print('|   _   ||   _   ||   |  | ||   |  | |  |   |      |   |    |       |  |   |    |   |  |   |___ |   |  | |    | ||_|| ||       ||       |')
        print('|__| |__||__| |__||___|  |_||___|  |_|  |___|      |___|    |_______|  |___|    |___|  |_______||___|  |_|    |_|   |_||_______||______|\n\n')

        print("Bem vinde ao jogo!\n")

        print('Escolha uma das opções abaixo(1-3):\n')

        print('1 - Criar Novo Personagem\n' +
              '2 - Carregar Personagem\n' +
              '3 - Sair\n\n\n')

        print('Digite a opção desejada: \n')

        inp = 0

        while(inp not in [1, 2, 3]):
            inp = input('> ')

            if inp == '1':
                self.create_new_character()
                break

            if inp == '2':
                self.load_character()
                break

            if inp == '3':
                sys.exit()
                break

            else:
                print('\nOpção Inválida!')

    def create_new_character(self):
        clear()
        new_name = input('Digite o nome do seu personagem: ')
        self.player = DataBase.find_character(self.connection, new_name)
        while(self.player.idJogador != -1):
            new_name = input('Nome já registrado, escolha outro:')
            self.player = DataBase.find_character(self.connection, new_name)

        print('Qual a casa que o seu personagem pertence?\n')
        print('1- Grifinória')
        print('2- Sonserina')
        print('3- Corvinal')
        print('4- LufaLufa')

        inp = 0

        while(inp not in [1, 2, 3, 4]):
            inp = input('> ')

            if inp == '1':
                new_casa = 1
                break

            if inp == '2':
                new_casa = 2
                break

            if inp == '3':
                new_casa = 3
                break

            if inp == '4':
                new_casa = 4
                break

            else:
                print('\nOpção Inválida!')

        DataBase.create_new_character(self.connection, new_name, new_casa)
        self.player = DataBase.find_character(self.connection, new_name)
        print(
            f'Seja bem vinde ao jogo _{new_name}_! Você está chegando no portão da escola!\nAproveite a estadia.\n')
        input('pressione _enter_ para continuar...')
        self.gameplay()

    def load_character(self):
        clear()
        nome = input("Digite o nome do personagem: ")
        self.player = DataBase.find_character(self.connection, nome)
        while(self.player.idJogador == -1):
            nome = input("Jogador não encontrado! digite outro: ")
            self.player = DataBase.find_character(self.connection, nome)
        self.gameplay()

    def gameplay(self):
        while(True):
            clear()
            self.show_player_info()

            current_area = DataBase.get_area(
                self.connection, self.player.idArea)
            area_norte = DataBase.get_area(
                self.connection, current_area.areaNorte).nome

            # Completa o nome do mapa oeste com espacos em branco para manter um tamanho fixo e manter a estrutura do mapa
            area_oeste = DataBase.get_area(
                self.connection, current_area.areaOeste).nome
            while len((area_oeste)) < 25:
                area_oeste = area_oeste + ' '

            area_leste = DataBase.get_area(
                self.connection, current_area.areaLeste).nome
            area_sul = DataBase.get_area(
                self.connection, current_area.areaSul).nome

            print(f"\nArea atual: {current_area.nome}\n")

            print(f'                            N. {area_norte}\n')
            print(f'          O. {area_oeste}' + f'         L. {area_leste}\n')
            print(f'                            S. {area_sul}\n')
            print('######################################################\n')
            print('Q. sair do jogo\n')

            inp = 0
            while(inp not in ['N', 'n', 'O', 'o', 'L', 'l', 'S', 's', 'q', 'Q']):
                inp = input('> ')
                if inp == 'N' or inp == 'n':
                    if current_area.areaNorte != -1:
                        self.player = DataBase.update_player_area(
                            self.connection, self.player.idJogador, current_area.areaNorte)
                        break
                if inp == 'O' or inp == 'o':
                    if current_area.areaOeste != -1:
                        self.player = DataBase.update_player_area(
                            self.connection, self.player.idJogador, current_area.areaOeste)
                        break
                if inp == 'L' or inp == 'l':
                    if current_area.areaLeste != -1:
                        self.player = DataBase.update_player_area(
                            self.connection, self.player.idJogador, current_area.areaLeste)
                        break
                if inp == 'S' or inp == 's':
                    if current_area.areaSul != -1:
                        self.player = DataBase.update_player_area(
                            self.connection, self.player.idJogador, current_area.areaSul)
                        break
                if inp == 'q' or inp == 'Q':
                    print("obrigado por jogar hoje, até a próxima!\n")
                    exit()
                else:
                    print('\nOpção Inválida!')

    def show_player_info(self):
        print(f'Nome: {self.player.nome}\n' +
              f'Casa: {DataBase.get_casa(self.connection, self.player.idCasa)}\n' +
              f'PV: {self.player.pontosVida}'
              )


if __name__ == '__main__':
    game = Game()
    game.start()
