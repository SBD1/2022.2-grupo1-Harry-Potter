from database import DataBase
import sys
import os


def clear():
    os.system('cls')


connection = DataBase.create_connection()
id_player = -1


def start():

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
            create_new_character()
            break

        if inp == '2':
            load_character()
            break

        if inp == '3':
            sys.exit()
            break

        else:
            print('\nOpção Inválida!')


def create_new_character():
    clear()
    new_name = input('Digite o nome do seu personagem: ')
    print(DataBase.find_character(connection, new_name))
    while(DataBase.find_character(connection, new_name) != -1):
        new_name = input('Nome já registrado, escolha outro:')

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

    DataBase.create_new_character(connection, new_name, new_casa)
    print("OPA, TO AQUI\n")
    id_player = DataBase.find_character(connection, new_name)
    gameplay()


def gameplay():
    while(True):
        clear()
        # player.show_player_info()

        current_area = DataBase.get_area()

        #area_norte = self.get_area(current_area.areaNorte).nome

        # Completa o nome do mapa oeste com espacos em branco para manter um tamanho fixo e manter a estrutura do mapa
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
        while(inp not in ['1', '2', '3', '4']):
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


def load_character():
    nome = input("digite o nome do personagem: ")
    id_player = DataBase.find_character(connection, nome)
    while(id_player == -1):
        nome = input("Jogador não encontrado! digite outro: ")
        id_player = DataBase.find_character(connection, nome)
    gameplay()


if __name__ == '__main__':
    start()
