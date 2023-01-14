import psycopg2
from database import create_connection

connection = create_connection()
cur = connection.cursor()

def create_tables():
    """ create tables in the PostgreSQL database """
    comandos = (
        """

        CREATE TABLE IF NOT EXISTS MAPA(
        idMapa            SERIAL PRIMARY KEY,
        descricao         CHAR(60) NOT NULL
        );

        """,

        """
        CREATE TABLE IF NOT EXISTS REGIAO(
        idRegiao          SERIAL PRIMARY KEY,
        idMapa            INT NOT NULL,
        descricao         INT NOT NULL,
        nome              CHAR(20) NOT NULL,
        FOREIGN KEY (idMapa) REFERENCES MAPA (idMapa)
        );

        """,
        """
        CREATE TABLE IF NOT EXISTS AREA(
        idArea        SERIAL PRIMARY KEY,
        idRegiao      INT NOT NULL,
        areaLeste     INT  REFERENCES AREA(idArea),
        areaOeste     INT  REFERENCES AREA(idArea),
        areaSul       INT  REFERENCES AREA(idArea),
        areaNorte     INT  REFERENCES AREA(idArea),
        FOREIGN KEY (idRegiao) REFERENCES REGIAO (idRegiao)
        );
        """,

        """
        CREATE TABLE IF NOT EXISTS FEITICO(
        idFeitico       SERIAL PRIMARY KEY,
        nome            CHAR(20) NOT NULL,
        efeito          CHAR(20) NOT NULL,
        ponto           NUMERIC(4,2) NOT NULL,
        quantidadeUso   NUMERIC(4,2) NOT NULL
        );
        """,
        """
        CREATE TABLE IF NOT EXISTS GRIMORIO(
        idGrimorio  SERIAL PRIMARY KEY,
        numSlots    INT  NOT NULL,
        feitico     INT  NOT NULL,
        FOREIGN KEY (feitico) REFERENCES FEITICO (idFeitico)
        );
        """,
        """
        CREATE TABLE IF NOT EXISTS ITEM(
        idItem           SERIAL PRIMARY KEY,
        nome             VARCHAR(30) NOT NULL,
        acao             VARCHAR(200) NOT NULL,
        valor            NUMERIC(4,2) NOT NULL,
        tipo             CHAR(20) NOT NULL,
        descricaoItem    VARCHAR(60) NOT NULL
        );
        """,
        """
        CREATE TABLE IF NOT EXISTS NPC(
        idNPC      SERIAL PRIMARY KEY,
        item       INT  NOT NULL,
        nome       CHAR(20) NOT NULL,
        FOREIGN KEY (item) REFERENCES ITEM (idItem)
        );
        """,
        """
        CREATE TABLE IF NOT EXISTS CASA(
        idCasa                       SERIAL PRIMARY KEY,
        nomeCasa                     CHAR(10) NOT NULL,
        petCasa                      CHAR(8) NOT NULL,
        professorResponsavel         INT  NOT NULL,
        FOREIGN KEY (professorResponsavel) REFERENCES NPC (idNPC)
        );
        """,

        """
        CREATE TABLE IF NOT EXISTS DISCIPLINA(
        idDisciplina         SERIAL PRIMARY KEY,
        NPC                  INT  NOT NULL,
        nomeDisciplina       CHAR(20) NOT NULL,
        feitico              INT  NOT NULL,
        FOREIGN KEY (NPC) REFERENCES NPC (idNPC),
        FOREIGN KEY (feitico) REFERENCES FEITICO (idFeitico)
        );
        """,
        """
        CREATE TABLE IF NOT EXISTS PROFESSOR(
        idNPC            INT  NOT NULL,
        casa             INT  NOT NULL,
        disciplina       INT  NOT NULL,
        FOREIGN KEY (idNPC) REFERENCES NPC (idNPC),
        FOREIGN KEY (casa) REFERENCES CASA (idCasa),
        FOREIGN KEY (disciplina) REFERENCES DISCIPLINA (idDisciplina)
        );
        """,
        """
        CREATE TABLE IF NOT EXISTS JOGADOR(
        idJogador  SERIAL PRIMARY KEY,
        idGrimorio INT  NOT NULL,
        nome       CHAR(20) NOT NULL,
        idArea     INT  NOT NULL,
        pontosVida INT  NOT NULL,
        idCasa     INT  NOT NULL,
        FOREIGN KEY (idGrimorio) REFERENCES GRIMORIO (idGrimorio),
        FOREIGN KEY (idArea) REFERENCES AREA (idArea),
        FOREIGN KEY (idCasa) REFERENCES CASA (idCasa)
        );
        """ ,
        """
        CREATE TABLE IF NOT EXISTS INSTANCIA_ITEM(
        idInstanciaItem      SERIAL PRIMARY KEY,
        idItem               INT  NOT NULL,
        FOREIGN KEY (idItem) REFERENCES ITEM (idItem)
        );
        """,
        """

        CREATE TABLE IF NOT EXISTS INVENTARIO(
        idJogador               INT NOT NULL,
        instanciaItem	         INT NULL,
        dinheiro                INT NULL,
        FOREIGN KEY (idJogador) REFERENCES JOGADOR (idJogador),
        FOREIGN KEY (instanciaItem) REFERENCES INSTANCIA_ITEM (idInstanciaItem)
        );
        """,

        """
        CREATE TABLE IF NOT EXISTS INSTANCIA_JOGADOR_DISCIPLINA(
        idJogador            INT NOT NULL,
        idDisciplina         INT NULL,
        FOREIGN KEY (idJogador) REFERENCES JOGADOR (idJogador),
        FOREIGN KEY (idDisciplina) REFERENCES DISCIPLINA (idDisciplina)
        );
        """,

        """
        CREATE TABLE IF NOT EXISTS HABILIDADE(
        idHabilidade     SERIAL PRIMARY KEY,
        nomeHabilidade   CHAR(30) NOT NULL,
        dano             INT NULL,
        descricao        CHAR(60) NOT NULL
        );
        """,
        """
        CREATE TABLE IF NOT EXISTS INIMIGO(
        idNPC            INT NOT NULL,
        idHabilidade     INT NULL,
        moedas           INT NOT NULL,
        FOREIGN KEY (idNPC) REFERENCES NPC (idNPC),
        FOREIGN KEY (idHabilidade) REFERENCES HABILIDADE (idHabilidade)
        );
        """,
        """
        CREATE TABLE IF NOT EXISTS INSTANCIA_INIMIGO(
        idNPC             INT NOT NULL,
        idArea            INT NOT NULL,
        idInstanciaItem   INT NULL,
        pontosVida        INT NOT NULL,
        multiplicador     INT NOT NULL,
        FOREIGN KEY (idNPC) REFERENCES NPC (idNPC),
        FOREIGN KEY (idArea) REFERENCES AREA (idArea),
        FOREIGN KEY (idInstanciaItem) REFERENCES INSTANCIA_ITEM (idInstanciaItem)
        );
        """,
        """
        CREATE TABLE IF NOT EXISTS FERRAMENTA(
        idItem          INT NOT NULL,
        forca           INT NULL,
        FOREIGN KEY (idItem) REFERENCES ITEM (idItem)
        );
        """,
        """
        CREATE TABLE IF NOT EXISTS POCAO(
        idItem            INT NOT NULL,
        ingrediente       CHAR(30) NOT NULL,
        FOREIGN KEY (idItem) REFERENCES ITEM (idItem)
        );
        """,
        """
        CREATE TABLE IF NOT EXISTS LOJA(
        idLoja            SERIAL PRIMARY KEY,
        idNPC             INT NOT NULL,
        idArea              INT NOT NULL,
        idInstanciaItem   INT NOT NULL,
        descricao         CHAR(60) NOT NULL,
        FOREIGN KEY (idNPC) REFERENCES NPC (idNPC),
        FOREIGN KEY (idArea) REFERENCES AREA (idArea),
        FOREIGN KEY (idInstanciaItem) REFERENCES INSTANCIA_ITEM (idInstanciaItem)
        );

        """)
    try:
        for comando in comandos:
            cur.execute(comando)

        connection.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        print("Tabelas criadas com sucesso")

if __name__ == '__main__':
    create_tables()
