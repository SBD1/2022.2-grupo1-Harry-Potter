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

        querry = "INSERT INTO JOGADOR (idGrimorio, nome, idArea, pontosVida, idCasa) VALUES ( 1 , '%s', 1, 20, %s)" % (
            nome, casa)

        cursor.execute(querry)

        connection.commit()
        cursor.close()

    def find_character(connection, name):

        cursor = connection.cursor()

        querry = """SELECT idJogador FROM JOGADOR
                    WHERE( JOGADOR.nome = '%s') 
                    """ % (name)

        cursor.execute(querry)
        rtn = cursor.fetchone()
        if(rtn == None):
            cursor.close()
            return Player(-1, -1, -1, -1, -1, -1)
        else:
            querry = """SELECT * FROM JOGADOR
                    WHERE( JOGADOR.nome = '%s') 
                    """ % (name)
            cursor.execute(querry)
            id_player, id_grimorio, nome, id_area, pontos_vida, id_casa = cursor.fetchone()

            cursor.close()
            return Player(id_player, id_grimorio, nome, id_area, pontos_vida, id_casa)

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
        id_player, id_grimorio, nome, id_area, pontos_vida, id_casa = cursor.fetchone()

        cursor.close()
        return Player(id_player, id_grimorio, nome, id_area, pontos_vida, id_casa)

    def get_area(connection, id_area):
        cursor = connection.cursor()

        querry = """SELECT * FROM AREA WHERE (AREA.idArea = %s) """ % (id_area)
        cursor.execute(querry)
        idArea, idRegiao, nome, areaLeste, areaOeste, areaSul, areaNorte = cursor.fetchone()
        cursor.close()
        return Area(idArea, idRegiao, nome, areaLeste, areaOeste, areaSul, areaNorte)
