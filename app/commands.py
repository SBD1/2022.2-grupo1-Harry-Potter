

class Commands:
    def cmd(inp):
        if inp == 'help' or inp == 'Help':
            print('''Comandos disponíveis:
            help -> informa os comandos disponíveis.
            mover + N/S/L/O -> Movimenta o jogador pelo mapa nas direções Norte, Sul, Leste e Oeste, respectivamente, quando for possível se deslocar.
            loja <nome> -> Abre a loja selecionada da área (digitar o nome sem os sinais < e >).
            inventario -> Abre o inventario.
            (não implementado)grimorio -> Informa as magias disponíveis para o jogador.
            combate -> Inicia o combate com o inimigo da área.
            atacar -> Ataca o unimigo com a magia equipada.
            sair -> Sai do Jogo.
            ''')

            return 'help'

        elif inp == 'sair' or inp == 'Sair':
            print("\nVocê tem certeza?\n")
            print('1 - Sim')
            print('2 - Não')

            inp = 0
            while(inp not in [1, 2]):
                inp = input('> ')

                if inp == '1':
                    print("obrigado por jogar hoje, até a próxima!\n")
                    exit()
                elif inp == '2':
                    return 'sair'
                else:
                    print('\nOpção Inválida!')

        else:
            return False
