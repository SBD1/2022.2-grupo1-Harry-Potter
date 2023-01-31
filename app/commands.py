

class Commands:
    def cmd(inp):
        if inp == 'help' or inp == 'Help':
            print('''Comandos disponíveis:
            help -> informa os comandos disponíveis.
            mover + N/S/L/O -> Movimenta o jogador pelo mapa nas direções Norte, Sul, Leste e Oeste, respectivamente, quando for possível se deslocar.
            inventario -> Abre o inventario.
            grimorio -> Informa as magias disponíveis para o jogador.
            combate +  (nome do inimigo) -> Inicia o combate com o inimigo em especifico.
            atacar + (nome da magia) -> Utiliza a magia respectiva.
            sair -> Sai do Jogo.
            ''')

            return 'help'

        elif inp == 'sair' or inp =='Sair':
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

        elif inp in ['mover n', 'Mover n', 'mover N', 'Mover N', 'mover s', 'Mover s', 'mover S', 'Mover S', 'mover l', 'Mover l', 'mover L', 'Mover L', 'mover o', 'Mover o', 'mover O', 'Mover O']:
            return 'mover'
        
        elif inp =='combate' or inp == 'Combate':
            return 'combate'

        elif inp == "atacar" or inp == "Atacar":
            return 'atacar'
        else:
            return False

