import psycopg2
import pandas as pd
from classes import *


class DataBase():

    def create_connection():
        connect = psycopg2.connect(
            host="localhost",
            database="postgres",
            user="postgres",
            password="postgres")
        return connect

    def create_new_character(connection, nome, casa):
        cursor = connection.cursor()

        querry = "INSERT INTO JOGADOR (idGrimorio, nome, idArea, pontosVida, idCasa) VALUES ( 1 , '%s', 2, 20, %s)" % (
            nome, casa)

        cursor.execute(querry)

        connection.commit()
        cursor.close()

    def create_new_inventory(connection, id_jogador):

        cursor = connection.cursor()

        querry = "INSERT INTO INVENTARIO (idJogador, dinheiro) VALUES (%s, 100)" % (
            id_jogador)

        cursor.execute(querry)

        connection.commit()
        cursor.close()

    def get_character(connection, name):

        cursor = connection.cursor()

        querry = """SELECT idJogador FROM JOGADOR
                    WHERE( JOGADOR.nome = '%s') 
                    """ % (name)

        cursor.execute(querry)
        rtn = cursor.fetchone()
        if(rtn == None):
            cursor.close()
            return Player(-1, -1, -1, -1, -1, -1, -1)
        else:
            querry = """SELECT * FROM JOGADOR
                    WHERE( JOGADOR.nome = '%s') 
                    """ % (name)
            cursor.execute(querry)
            id_player, id_grimorio, nome, id_area, pontos_vida, id_casa, estado = cursor.fetchone()

            cursor.close()
            return Player(id_player, id_grimorio, nome, id_area, pontos_vida, id_casa, estado)

    def get_casa(connection, id_casa):
        cursor = connection.cursor()

        querry = """SELECT nomecasa FROM CASA
                    WHERE( CASA.idcasa = '%s') 
                    """ % (id_casa)
        cursor.execute(querry)
        nome_casa = cursor.fetchone()[0]
        cursor.close()

        return nome_casa


    def get_money(connection, id_jogador):

        cursor = connection.cursor()

        querry = """SELECT dinheiro FROM INVENTARIO
                    WHERE( INVENTARIO.idJogador = '%s') 
                    """ % (id_jogador)
        cursor.execute(querry)
        dinheiro = cursor.fetchone()[0]
        cursor.close()

        return dinheiro

    def update_player_area(connection, id, area):

        cursor = connection.cursor()

        querry = """UPDATE JOGADOR
                    SET idarea = '%s'
                    WHERE( JOGADOR.idJogador = '%s') 
                    """ % (area, id)

        cursor.execute(querry)
        connection.commit()

        querry = """SELECT * FROM JOGADOR
                    WHERE( JOGADOR.idJogador = '%s') 
                    """ % (id)

        cursor.execute(querry)
        id_player, id_grimorio, nome, id_area, pontos_vida, id_casa, estado = cursor.fetchone()

        cursor.close()
        return Player(id_player, id_grimorio, nome, id_area, pontos_vida, id_casa, estado)

    def update_player_money(connection, id_jogador, dinheiro):
        cursor = connection.cursor()

        querry = """UPDATE INVENTARIO
                    SET dinheiro = '%s'
                    WHERE( idJogador = '%s') 
                    """ % (dinheiro, id_jogador)

        cursor.execute(querry)
        connection.commit()
        cursor.close()

    def get_view_inventory(connection, id_jogador):
        
        cursor = connection.cursor()

        querry = """SELECT * FROM inventario_jogador WHERE (idjogador = %s) """ % (
            id_jogador)
        cursor.execute(querry)            
    
        rtn = cursor.fetchall()
        table = pd.DataFrame(rtn, columns=['idJogador', 'Item', 'Valor'])
        table = table.drop('idJogador', axis=1)
        table = table.set_index('Item')
        
        print(table)
        cursor.close()

        

    def get_area(connection, id_area):
        cursor = connection.cursor()

        querry = """SELECT * FROM AREA WHERE (AREA.idArea = %s) """ % (id_area)
        cursor.execute(querry)
        idArea, idRegiao, nome, areaLeste, areaOeste, areaSul, areaNorte = cursor.fetchone()
        cursor.close()
        return Area(idArea, idRegiao, nome, areaLeste, areaOeste, areaSul, areaNorte)

    def search_enemy(connection, id_area):
        cursor = connection.cursor()

        querry = """SELECT * FROM INSTANCIA_INIMIGO WHERE (INSTANCIA_INIMIGO.idArea = %s) AND (INSTANCIA_INIMIGO.pontosvida <> 0) """ % (
            id_area)
        cursor.execute(querry)

        rtn = cursor.fetchone()

        if rtn == None:
            cursor.close()
            return Inimigo(-1, -1, '', -1, -1, -1, -1, -1, -1), False

        else:
            idInstInim, idNPC, idArea, idItem, pontosVida, multiplicador = rtn

            querry = """SELECT nome FROM NPC WHERE(NPC.idNPC = %s) """ % (
                idNPC)
            cursor.execute(querry)

            nome = cursor.fetchone()[0]

            querry = """SELECT moedas FROM INIMIGO WHERE(INIMIGO.idNPC = %s) """ % (
                idNPC)
            cursor.execute(querry)

            moedas = cursor.fetchone()[0]

            querry = """SELECT nome FROM ITEM WHERE(ITEM.idItem = %s) """ % (
                idItem)
            cursor.execute(querry)

            nomeItem = cursor.fetchone()[0]
            cursor.close()

            return Inimigo(idInstInim, idNPC, nome, idArea, idItem, nomeItem, moedas, pontosVida, multiplicador), True

    def search_store(connection, id_area):
        cursor = connection.cursor()

        querry = """SELECT * FROM LOJA WHERE (LOJA.idArea = %s) """ % (
            id_area)
        cursor.execute(querry)

        rtn = cursor.fetchall()
        table = pd.DataFrame(rtn, columns=['Id', 'idArea', 'Descrição'])
        table = table.drop('idArea', axis=1)


        if rtn == None:
            cursor.close()
            return Loja(-1, -1,  ''), False
        else:
            return rtn, True
            
    def get_view_store(connection, nomeLoja):
        cursor = connection.cursor()

        querry = """SELECT idloja FROM LOJA WHERE (LOJA.descricao = '%s')""" % (nomeLoja)
        cursor.execute(querry)
        idLoja = cursor.fetchone()

        querry = """SELECT * FROM produtos_loja WHERE (idloja = %s) """ % (
            idLoja)
        cursor.execute(querry)            
    
        rtn = cursor.fetchall()
        table = pd.DataFrame(rtn, columns=['Id do Item', 'Nome', 'Descrição', 'Valor', 'id Loja'])
        table = table.set_index('Id do Item')
        table = table.drop('id Loja', axis=1)
        print(table)

        querry = """ SELECT COUNT(*) FROM produtos_loja WHERE (idLoja = %s) """ % (
            idLoja)
        cursor.execute(querry)

        n_items = cursor.fetchone()

        
        cursor.close()

        return n_items

    def ver_item_store(connection, idItem, nomeLoja):
        cursor = connection.cursor()

        querry = """SELECT idLoja FROM LOJA WHERE (LOJA.descricao = '%s')""" % (nomeLoja)
        cursor.execute(querry)
        idLoja = cursor.fetchone()[0]


        querry = """SELECT * FROM ITEM WHERE (ITEM.idLoja = %s) AND (ITEM.idItem = %s) """ % (
            idLoja, idItem)
        cursor.execute(querry)

        rtn = cursor.fetchall()

        if bool(rtn) == False:
            return False
        else:
            return True


    def gen_new_item_instance(connection, id_Item, Id_jogador):
        cursor = connection.cursor()

        querry = """INSERT INTO INSTANCIA_ITEM(idItem, idJogador) VALUES (%s, %s);""" % (
            id_Item, Id_jogador)
        cursor.execute(querry)
        connection.commit()
        cursor.close()
        
    def get_item_value(connection, id_item):
        cursor = connection.cursor()

        querry = """SELECT valor FROM ITEM WHERE (ITEM.idItem = %s) """ % (
            id_item)
        cursor.execute(querry)
        value = cursor.fetchone()[0]
        cursor.close()

        return value

    def get_spells(connection, id_Grimorio):
        cursor = connection.cursor()

        querry = """SELECT feitico FROM GRIMORIO WHERE (GRIMORIO.idGrimorio = %s) """ % (
            id_Grimorio)
        cursor.execute(querry)

        idfeitico = cursor.fetchone()

        querry = """SELECT * FROM FEITICO WHERE (FEITICO.idFeitico = %s) """ % (
            idfeitico)
        cursor.execute(querry)

        idfeitico, nome, efeito, ponto, quantidadeUso = cursor.fetchone()
        cursor.close()

        return Feitico(idfeitico, nome, efeito, int(ponto), quantidadeUso)

    def get_habi(connection, idNPC):
        cursor = connection.cursor()

        querry = """SELECT idHabilidade FROM INIMIGO WHERE (INIMIGO.idNPC = %s) """ % (
            idNPC)
        cursor.execute(querry)

        idHabilidade = cursor.fetchone()

        querry = """SELECT * FROM HABILIDADE WHERE (HABILIDADE.idHabilidade = %s) """ % (
            idHabilidade)
        cursor.execute(querry)

        idHabilidade, nomeHabilidade, dano, descricao = cursor.fetchone()
        cursor.close()

        return Habilidade(idHabilidade, nomeHabilidade, dano, descricao)

    def set_player_pv(connection, idJogador, PV):
        cursor = connection.cursor()

        querry = """UPDATE JOGADOR
                    SET pontosVida = '%s'
                    WHERE( JOGADOR.idJogador = '%s') 
                    """ % (PV, idJogador)

        cursor.execute(querry)
        connection.commit()

        querry = """SELECT * FROM JOGADOR
                    WHERE( JOGADOR.idJogador = '%s') 
                    """ % (idJogador)

        cursor.execute(querry)
        id_player, id_grimorio, nome, id_area, pontos_vida, id_casa, estado = cursor.fetchone()

        cursor.close()
        return Player(id_player, id_grimorio, nome, id_area, pontos_vida, id_casa, estado)

    def getSpeech(connection, area, momento):
        cursor = connection.cursor()

        querry = """SELECT texto FROM falas WHERE (idArea = '%s' AND momento = '%s')""" % (area ,momento)
        cursor.execute(querry)
        vazio = cursor.fetchone()
        if vazio == None :
            return None
        else:
            texto = vazio[0]

        querry = """SELECT idNPC FROM falas WHERE (idArea = '%s' AND momento = '%s')""" % (area ,momento)
        cursor.execute(querry)
        idnpc = cursor.fetchone()

        querry = """SELECT nome FROM NPC WHERE (idNPC = '%s')""" % (idnpc)
        cursor.execute(querry)
        nome = cursor.fetchone()[0]

        cursor.close()

        return nome + ': ' + texto

    def updateState(connection, idJogador, estado):
        cursor = connection.cursor()

        querry = """UPDATE JOGADOR SET estado = '%s' WHERE( JOGADOR.idJogador = '%s') """ % (estado, idJogador)
        cursor.execute(querry)
        connection.commit()

        cursor.close()
