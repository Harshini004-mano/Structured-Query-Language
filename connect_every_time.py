import mysql.connector
from mysql.connector import Error

# Database credentials
DB_HOST = "localhost"
DB_PORT = 3306
DB_USER = "root"
DB_PASSWORD = "harshini@2004"
DB_NAME = "harshinidb"

def get_connection():
    try:
        conn = mysql.connector.connect(
            host=DB_HOST,
            port=DB_PORT,
            user=DB_USER,
            password=DB_PASSWORD,
            database=DB_NAME
        )
        if conn.is_connected():
            print("✅ Successfully connected to MySQL")
        return conn

    except Error as e:
        print("❌ Couldn't connect to MySQL. Please check credentials and server.")
        print("Error:", e)
        return None

# Example usage
conn = get_connection()

if conn:
    conn.close()
    print("🔒 Connection closed")
