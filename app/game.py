from database import DataBase
from classes import *
from commands import Commands
import sys
import os
import random

def clear():
    os.system('cls' if os.name == 'nt' else 'clear')


class Game:

    def __init__(self):
        self.connection = DataBase.create_connection()
        self.player = Player(-1, -1, ' ', -1, -1, -1)
        self.valid_cmd = 0
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
        self.player = DataBase.get_character(self.connection, new_name)
        while(self.player.idJogador != -1):
            new_name = input('Nome já registrado, escolha outro:')
            self.player = DataBase.get_character(self.connection, new_name)

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
        self.player = DataBase.get_character(self.connection, new_name)
        DataBase.create_new_inventory(self.connection, self.player.idJogador)
        DataBase.gen_new_item_instance(self.connection, 1, self.player.idJogador)

        print(
            f'\nSeja bem vinde ao jogo {new_name}! Você está chegando no portão da escola!\nAproveite a estadia.\n')
        input('pressione _enter_ para continuar...')
        self.gameplay()

    def load_character(self):
        clear()
        nome = input("Digite o nome do personagem: ")
        self.player = DataBase.get_character(self.connection, nome)
        while(self.player.idJogador == -1):
            nome = input("Jogador não encontrado! digite outro: ")
            self.player = DataBase.get_character(self.connection, nome)
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

            # Procura se ha alguma loja na area
            Loja, valid_loja = DataBase.search_store(self.connection, current_area.idArea)

            if valid_loja == True:
                print("\nLojas na area: ")
                print(f"{Loja.descricao}\n")

            # Procura se ha algum inimigo na area
            Inimigo, valid_inim = DataBase.search_enemy(self.connection, current_area.idArea)

            if valid_inim == True:
                print("\nInimigo na area: ")
                print(f"{Inimigo.nome}\n")




            print(f"\nArea atual: {current_area.nome}\n")

            print(f'                            N. {area_norte}\n')
            print(f'          O. {area_oeste}' + f'         L. {area_leste}\n')
            print(f'                            S. {area_sul}\n')
            print('######################################################\n')

            print('(Digite "help" para ver todos os comandos disponíveis)')
            inp = 0
            self.valid_cmd = 0
            while(self.valid_cmd == False or self.valid_cmd == 'help' or valid_inim == True or  valid_loja == True):
                inp = input('> ')
                self.valid_cmd = Commands.cmd(inp)

                if (inp == 'mover N' or inp == 'mover n' or inp == 'Mover N' or inp == 'Mover n') and self.valid_cmd == 'mover':
                    if current_area.areaNorte != 1:
                        self.player = DataBase.update_player_area(
                            self.connection, self.player.idJogador, current_area.areaNorte)
                    break

                elif (inp == 'mover O' or inp == 'mover o' or inp == 'Mover O' or inp == 'Mover o') and self.valid_cmd == 'mover':
                    if current_area.areaOeste != 1:
                        self.player = DataBase.update_player_area(
                            self.connection, self.player.idJogador, current_area.areaOeste)
                    break

                elif (inp == 'mover L' or inp == 'mover l' or inp == 'Mover L' or inp == 'Mover l') and self.valid_cmd == 'mover':
                    if current_area.areaLeste != 1:
                        self.player = DataBase.update_player_area(
                            self.connection, self.player.idJogador, current_area.areaLeste)
                    break

                elif (inp == 'mover S' or inp == 'mover s' or inp == 'Mover S' or inp == 'Mover s') and self.valid_cmd == 'mover':
                    if current_area.areaSul != 1:
                        self.player = DataBase.update_player_area(
                            self.connection, self.player.idJogador, current_area.areaSul)
                    break

                elif(self.valid_cmd == 'combate' and valid_inim == True):
                    self.combat(Inimigo)
                    break

                elif(self.valid_cmd == 'loja' and valid_loja == True):
                    self.store(Loja)
                    break

                elif(self.valid_cmd == 'inventario'):
                    self.inventario()
                    break

                elif self.valid_cmd == False or (self.valid_cmd == 'combate' and valid_inim == False)or (self.valid_cmd == 'loja' and valid_loja == False):
                    print('\nOpção Inválida!')

    def inventario(self):
        clear()
        inp = 0
        while(inp != 'sair'):
            DataBase.get_view_inventory(self.connection, self.player.idJogador)

            dinheiro = DataBase.get_money(self.connection, self.player.idJogador)
            print(f'\nDinheiro do Jogador: {dinheiro}')

            print(f'\n(Digite "sair" para voltar)')

            while(inp != 'sair' and inp != 'Sair'):
                inp = input('> ')

                if inp != 'sair' and inp != 'Sair':
                    print('\nOpção Inválida!')



    def store(self, Loja):
        clear()
        inp = 0
        while(inp != 'sair'):
            n_items = DataBase.get_view_store(self.connection, Loja.idloja)

            dinheiro = DataBase.get_money(self.connection, self.player.idJogador)
            print(f'\nDinheiro do Jogador: {dinheiro}')

            print(f'\n(Digite o id do item para comprar-lo, ou digite "sair" para voltar)')

            while(inp != 'sair'):
                inp = input('> ')

                if inp == 'sair':
                    break

                elif inp.isnumeric() == False:
                    print('\nOpção Inválida!')

                elif DataBase.ver_item_store(self.connection, inp, Loja.idloja) == False:
                    print('\nOpção Inválida!')

                else:
                    val_item = DataBase.get_item_value(self.connection, inp)
                    if (dinheiro - int(val_item)) >= 0:
                        DataBase.gen_new_item_instance(self.connection, inp, self.player.idJogador)
                        dinheiro -= int(val_item)
                        DataBase.update_player_money(self.connection, self.player.idJogador, dinheiro)
                    else:
                        print("\n------------------------------------")
                        print("Dinheiro insuficiente para compra ")
                        print("------------------------------------")
                    break


    def combat(self, Inimigo):
        clear()
        while(self.player.pontosVida > 0 and Inimigo.pontosVida > 0):
            Feitico = DataBase.get_spells(self.connection, self.player.idGrimorio)
            Habilidade = DataBase.get_habi(self.connection, Inimigo.idNPC)

            self.show_player_info()

            print(f"\nInimigo: {Inimigo.nome}")
            print(f"PV Inimigo: {Inimigo.pontosVida}\n")

            inp = 0
            self.valid_cmd = 0
            while(self.valid_cmd == False or self.valid_cmd == 'help'):
                inp = input('> ')
                self.valid_cmd = Commands.cmd(inp)

                if(self.valid_cmd == 'atacar'):
                    dano_player = random.randint(0, Feitico.ponto)
                    Inimigo.pontosVida = Inimigo.pontosVida - dano_player
                    print(f"\n{self.player.nome} usou {Feitico.nome} causando {dano_player} de dano!\n")

                    if Inimigo.pontosVida <= 0:
                        break

                    dano_inimigo = random.randint(0, Habilidade.dano)
                    self.player.pontosVida = self.player.pontosVida - dano_inimigo
                    print(f"{Inimigo.nome} usou {Habilidade.nomeHabilidade} causando {dano_inimigo} de dano!\n")
                elif self.valid_cmd == False:
                    print('\nOpção Inválida!')



        if Inimigo.pontosVida <= 0:
            print(f'{Inimigo.nome} derrotado!')
            print(f'Moedas ganhas: {Inimigo.moedas}')
            print(f'Itens ganhos: {Inimigo.nomeItem}')


            self.player = DataBase.set_player_pv(self.connection, self.player.idJogador, self.player.pontosVida)
            DataBase.gen_new_item_instance(self.connection, Inimigo.idItem, self.player.idJogador)
            dinheiro = DataBase.get_money(self.connection, self.player.idJogador)
            dinheiro += Inimigo.moedas
            DataBase.update_player_money(self.connection, self.player.idJogador, dinheiro)
            # Exluir o inimigo por um tempo
            input('\npressione _enter_ para continuar...')

        elif self.player.pontosVida <= 0:
            print("Você morreu!")

            input('Pressione  enter_ para renascer no Portão de Hogwarts')

            self.player = DataBase.set_player_pv(self.connection, self.player.idJogador, 20)
            self.player = DataBase.update_player_area(self.connection, self.player.idJogador, 2)


    def show_player_info(self):
        print(f'Nome: {self.player.nome}\n' +
              f'Casa: {DataBase.get_casa(self.connection, self.player.idCasa)}\n' +
              f'PV: {self.player.pontosVida}'
              )


if __name__ == '__main__':
    game = Game()
    game.start()
