import mysql.connector

def create_connection():
    connectionDB = mysql.connector.connect(
                    host='localhost',
                    user='root',
                    password='',
                    database='ebook'
                )

    return connectionDB