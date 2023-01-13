from database import create_connection
import sys

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
    print("a")

def load_character():
    nome = input("digite o nome do personagem: ")


if __name__ == '__main__':

    start()
