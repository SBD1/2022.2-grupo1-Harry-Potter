from database import create_connection
import sys
import os

def clear():
    os.system('cls')

connection = create_connection()

cursor = connection.cursor()

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

    option = start_options()

    if option == '1':
        create_new_character()
    elif option == '2':
        load_character()
    elif option == '3':
        sys.exit()
    else:
        print('Opção inválida, tente novamente!')
        start()


def start_options():
    option = input('Digite a opção desejada: ')

    return option

def create_new_character():
    clear()
    new_name = input('Digite o nome do seu personagem: ')

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


def load_character():
    nome = input("digite o id do personagem: ")

if __name__ == '__main__':

    start()
