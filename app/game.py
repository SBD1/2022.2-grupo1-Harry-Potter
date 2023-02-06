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
        self.player = Player(-1, ' ', -1, -1, -1, -1)
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
        if new_name == '':
            print("Não é possível registrar um nome vazio!")
            return
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
        nome = input("Digite o nome do personagem ou sair: ")
        self.player = DataBase.get_character(self.connection, nome)
        while(self.player.idJogador == -1):
            if nome == 'sair':
                return
            nome = input("Jogador não encontrado! digite outro ou sair: ")
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
            
            if valid_loja == True and current_area.idArea == 3:
                print("\nLojas na area: ")
                for i in Loja:
                    print(f"{i[2]}")

            # Procura se ha algum inimigo na area
            Inimigo, valid_inim = DataBase.search_enemy(self.connection, current_area.idArea)
            
            # Procura se ha alguma fala na area
            texto = DataBase.getSpeech(self.connection, current_area.idArea, self.player.estado)
            if texto != None:
                print('\n#----------------------------------------------------#')
                print(DataBase.getSpeech(self.connection, current_area.idArea, self.player.estado)) 
                print('#----------------------------------------------------#\n')

                if self.player.estado == 1: # tira fala de boas vindas
                    DataBase.updateState(self.connection, self.player.idJogador, self.player.estado+1)
                else:
                    DataBase.updateState(self.connection, self.player.idJogador, self.player.estado)

            # Se ele entrar nas salas de aula aprende feitico
        

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
                inp = inp.lower()
                Commands.cmd(inp)
                
                if inp == 'mover n':
                    if current_area.areaNorte != 1:
                        self.player = DataBase.update_player_area(
                            self.connection, self.player.idJogador, current_area.areaNorte)
                    break

                elif inp == 'mover o':
                    if current_area.areaOeste != 1:
                        self.player = DataBase.update_player_area(
                            self.connection, self.player.idJogador, current_area.areaOeste)
                    break

                elif inp == 'mover l':
                    if current_area.areaLeste != 1:
                        self.player = DataBase.update_player_area(
                            self.connection, self.player.idJogador, current_area.areaLeste)
                    break

                elif inp == 'mover s':
                    if current_area.areaSul != 1:
                        self.player = DataBase.update_player_area(
                            self.connection, self.player.idJogador, current_area.areaSul)
                    break

                elif inp == 'combate' and valid_inim == True:
                    self.combat(Inimigo)
                    break

                elif inp == 'loja sorveteria florean fortescue' and valid_loja == True:
                    self.store('Sorveteria Florean Fortescue')
                    break

                elif inp == 'loja olivaras varinhas' and valid_loja == True:
                    self.store('Olivaras Varinhas')
                    break

                elif inp == 'loja genialidades weasley' and valid_loja == True:
                    self.store('Genialidades Weasley')
                    break

                elif inp == 'loja caldeirao furado' and valid_loja == True:
                    self.store('Caldeirão Furado')
                    break

                elif inp == 'loja profeta diario' and valid_loja == True:
                    self.store('Profeta Diário')
                    break

                elif inp == 'loja vassourax' and valid_loja == True:
                    self.store('Vassourax')
                    break

                elif inp == 'loja farmacia' and valid_loja == True:
                    self.store('Farmacia')
                    break
                
                elif inp == 'inventario':
                    self.inventario()
                    break

                elif inp == False or (inp == 'combate' and valid_inim == False)or (inp == 'loja' and valid_loja == False):
                    print('\nOpção Inválida!')

                else: 
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
            n_items = DataBase.get_view_store(self.connection, Loja)

            dinheiro = DataBase.get_money(self.connection, self.player.idJogador)
            print(f'\nDinheiro do Jogador: {dinheiro}')

            print(f'\n(Digite o id do item para comprar-lo, ou digite "sair" para voltar)')

            while(inp != 'sair'):
                inp = input('> ')

                if inp == 'sair':
                    break

                elif inp.isnumeric() == False:
                    print('\nOpção Inválida!')

                elif DataBase.ver_item_store(self.connection, inp, Loja) == False: #verifica se o item esta na loja
                    print('\nNão há este item nesta loja, procure em outra!')

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
        grimorio = DataBase.get_spells(self.connection, self.player.idJogador)
        if not grimorio:
            print("Você não tem feitiços para lançar!! tá maluco?")
            input('pressione _enter_ para voltar...')
            self.gameplay()

        while(self.player.pontosVida > 0 and Inimigo.pontosVida > 0):
            Habilidade = DataBase.get_habi(self.connection, Inimigo.idNPC)
            
            inp = 0
            self.valid_cmd = True
            while(self.valid_cmd == True or self.valid_cmd == 'help'):            
                self.show_player_info()
                print(f"\nInimigo: {Inimigo.nome}")
                print(f"PV Inimigo: {Inimigo.pontosVida}\n")
                inp = input('Digite o id do feitico\n>')
                self.valid_cmd = Commands.cmd(inp)

                if self.valid_cmd == False:
                    print('\nOpção Inválida!')
                else: 
                    # verifica se o jogador tem aquele feitico
                    feitico = DataBase.get_one_spell(self.connection, self.player.idJogador, int(inp))
                    if feitico == False and feitico != 'help':
                        print('\nVocê não possui este feitiço!\n')
                    elif(feitico != 'help'):
                        dano_player = random.randint(0, feitico.ponto)
                        Inimigo.pontosVida = Inimigo.pontosVida - dano_player
                        print(f"\n{self.player.nome} usou {feitico.nome} causando {dano_player} de dano!\n")

                    # mesmo se nao tiver o feitico ele ainda recebe dano
                    if Inimigo.pontosVida <= 0 or self.player.pontosVida <= 0:
                        break

                    dano_inimigo = random.randint(0, Habilidade.dano)
                    self.player.pontosVida = self.player.pontosVida - dano_inimigo
                    print(f"{Inimigo.nome} usou {Habilidade.nomeHabilidade} causando {dano_inimigo} de dano!\n")



        if Inimigo.pontosVida <= 0:
            print(f'{Inimigo.nome} derrotado!')
            print(f'Moedas ganhas: {Inimigo.moedas}')
            print(f'Itens ganhos: {Inimigo.nomeItem}')


            self.player = DataBase.set_player_pv(self.connection, self.player.idJogador, self.player.pontosVida)
            DataBase.gen_new_item_instance(self.connection, Inimigo.idItem, self.player.idJogador)
            dinheiro = DataBase.get_money(self.connection, self.player.idJogador)
            dinheiro += Inimigo.moedas
            DataBase.update_player_money(self.connection, self.player.idJogador, dinheiro)
            DataBase.reset_enemy_pv(self.connection, Inimigo.idInstInim, Inimigo.pontosVidamax, Inimigo.idArea)            
            # Exluir o inimigo por um tempo
            input('\npressione _enter_ para continuar...')

        if self.player.pontosVida <= 0:
            print("Você morreu!")

            input('Pressione  enter_ para renascer no Portão de Hogwarts')

            self.player = DataBase.set_player_pv(self.connection, self.player.idJogador, 20)
            self.player = DataBase.update_player_area(self.connection, self.player.idJogador, 2)
            DataBase.set_enemy_pv(self.connection, Inimigo.idInstInim, Inimigo.pontosVida)  


    def show_player_info(self):
        print(f'Nome: {self.player.nome}\n' +
              f'Casa: {DataBase.get_casa(self.connection, self.player.idCasa)}\n' +
              f'PV: {self.player.pontosVida}'
              )


if __name__ == '__main__':
    game = Game()
    game.start()
