import psycopg2
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

    def get_area(connection, id_area):
        cursor = connection.cursor()

        querry = """SELECT * FROM AREA WHERE (AREA.idArea = %s) """ % (id_area)
        cursor.execute(querry)
        idArea, idRegiao, nome, areaLeste, areaOeste, areaSul, areaNorte = cursor.fetchone()
        cursor.close()
        return Area(idArea, idRegiao, nome, areaLeste, areaOeste, areaSul, areaNorte)

    def search_enemy(connection, id_area):
        cursor = connection.cursor()

        querry = """SELECT * FROM INSTANCIA_INIMIGO WHERE (INSTANCIA_INIMIGO.idArea = %s) """ % (
            id_area)
        cursor.execute(querry)

        rtn = cursor.fetchone()

        if rtn == None:
            cursor.close()
            return Inimigo(-1, -1, '', -1, -1, -1, -1, -1, -1), False

        else:
            idInstInim, idNPC, idArea, idInstanciaItem, pontosVida, multiplicador = rtn

            querry = """SELECT nome FROM NPC WHERE(NPC.idNPC = %s) """ % (
                idNPC)
            cursor.execute(querry)

            nome = cursor.fetchone()[0]

            querry = """SELECT moedas FROM INIMIGO WHERE(INIMIGO.idNPC = %s) """ % (
                idNPC)
            cursor.execute(querry)

            moedas = cursor.fetchone()[0]

            querry = """SELECT IdItem FROM INSTANCIA_ITEM WHERE(INSTANCIA_ITEM.idInstanciaItem = %s) """ % (
                idInstanciaItem)
            cursor.execute(querry)

            idItem = cursor.fetchone()[0]

            querry = """SELECT nome FROM ITEM WHERE(ITEM.idItem = %s) """ % (
                idItem)
            cursor.execute(querry)

            nomeItem = cursor.fetchone()[0]
            cursor.close()

            return Inimigo(idInstInim, idNPC, nome, idArea, idInstanciaItem, nomeItem, moedas, pontosVida, multiplicador), True

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