import psycopg2

def create_connection():
    connect = psycopg2.connect(
        host="localhost",
        database="HARRY_POTTER",
        user="postgres",
        password="1234")
    return connect
