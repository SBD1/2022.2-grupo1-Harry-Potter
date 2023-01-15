import psycopg2
from area import Area


class DataBase():

    def create_connection():
        connect = psycopg2.connect(
            host="localhost",
            database="HARRY_POTTER",
            user="postgres",
            password="SUASENHA")
        return connect

    def create_new_character(connection, nome, casa):
        cursor = connection.cursor()

        querry = "INSERT INTO JOGADOR (idGrimorio, nome, idArea, pontosVida, idCasa) VALUES ( 1 , '%s', 4, 20, %s)" % (
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
        id_player = cursor.fetchone()
        if(id_player == None):
            id_player = -1
        else:
            id_player = id_player[0]

        cursor.close()
        return id_player

    def get_area(connection, id):
        cursor = connection.cursor()

        query = """SELECT * FROM AREA WHERE (AREA.idArea = %s) """ % (id)

        cursor.execute(query)
        idArea, idRegiao, areaLeste, areaOeste, areaSul, areaNorte = cursor.fetchone()

        return Area(idArea, idRegiao, areaLeste, areaOeste, areaSul, areaNorte)
