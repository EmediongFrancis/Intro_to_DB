import mysql.connector
from mysql.connector import Error

try:
    # Connect to MySQL server (adjust user/password/host as needed)
    connection = mysql.connector.connect(
        host='localhost',
        user='root',  # Change if needed
        password=''   # Change if needed
    )
    if connection.is_connected():
        cursor = connection.cursor()
        try:
            cursor.execute(f"CREATE DATABASE IF NOT EXISTS alx_book_store")
            print(f"Database '{DB_NAME}' created successfully!")
        except Error as e:
            print(f"Error creating database: {e}")
        finally:
            cursor.close()
    else:
        print("Failed to connect to MySQL server.")
except Error as e:
    print(f"Error connecting to MySQL: {e}")
finally:
    if 'connection' in locals() and connection.is_connected():
        connection.close()
