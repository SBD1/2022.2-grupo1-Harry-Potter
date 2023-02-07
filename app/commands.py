

class Commands:
    def cmd(inp):
        
        if inp == 'help' or inp == 'Help':
            print('''Comandos disponíveis:
            help -> informa os comandos disponíveis.
            mover + N/S/L/O -> Movimenta o jogador pelo mapa nas direções Norte, Sul, Leste e Oeste, respectivamente, quando for possível se deslocar.
            loja <nome> -> Abre a loja selecionada da área (digitar o nome sem os sinais < e >).
            inventario -> Abre o inventario.
            tomar -> Ao entrar no inventario é possível tomar um sorvete ou cerveja se você tiver e recuperar sua vida.
            <nome comida> -> Após digitar tomar o jogo pede qual comida vai ser ingerida.
            grimorio -> Informa as magias disponíveis para o jogador.
            combate -> Inicia o combate com o inimigo da área.
            <nome feitico> -> Pode ser usado em um combate para causar dano ao inimigo, para consultar seus feiticos digite grimorio.
            sair -> Sai do Jogo.

            obs.: não coloque acentuação nos comandos!
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

        # inputs validos no combate: id dos feiticos e acionar o grimorio
        elif inp == '1' or inp == '2' or inp == '3' or inp == '4' or inp == 'grimorio':
            return True

        elif inp == 'tomar':
            return True

        else:
            return False
