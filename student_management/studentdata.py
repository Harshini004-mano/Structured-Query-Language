import mysql.connector
from mysql.connector import Error

# Database credentials
DB_HOST = "localhost"
DB_PORT = 3306
DB_USER = "root"
DB_PASSWORD = "harshini@2004"
DB_NAME = "harshinidb"

def get_connection():
    """Establish connection to MySQL"""
    try:
        conn = mysql.connector.connect(
            host=DB_HOST,
            port=DB_PORT,
            user=DB_USER,
            password=DB_PASSWORD,
            database=DB_NAME
        )
        print("Connected to MySQL")
        return conn
    except mysql.connector.Error as e:
        print(" Couldn't connect to MySQL.")
        print("Error:", e)
        return None


def create_dress():
    """Insert a new record into the dress table"""
    name = input("Enter name: ").strip()
    age_text = input("Enter age (number): ").strip()

    if not name or not age_text.isdigit():
        print(" Please provide a valid name and a numeric age.")
        return

    age = int(age_text)
    conn = get_connection()
    if not conn:
        return

    cur = conn.cursor()
    cur.execute("INSERT INTO dress (name, age) VALUES (%s, %s)", (name, age))
    conn.commit()
    print("New dress record added successfully!")
    cur.close()
    conn.close()


def read_dress():
    """Display all records"""
    conn = get_connection()
    if not conn:
        return

    cur = conn.cursor()
    cur.execute("SELECT id, name, age FROM dress ORDER BY id")
    rows = cur.fetchall()

    if not rows:
        print("No records found.")
    else:
        print("\n--- Dress Table ---")
        for row in rows:
            print(f"ID: {row[0]} | Name: {row[1]} | Age: {row[2]}")

    cur.close()
    conn.close()


def update_dress():
    """Update a record by ID"""
    id_text = input("Enter the ID to update: ").strip()
    if not id_text.isdigit():
        print(" Please enter a valid ID.")
        return

    new_name = input("Enter new name: ").strip()
    new_age_text = input("Enter new age (number): ").strip()

    if not new_name or not new_age_text.isdigit():
        print(" Invalid input. Try again.")
        return

    new_age = int(new_age_text)
    conn = get_connection()
    if not conn:
        return

    cur = conn.cursor()
    cur.execute("UPDATE dress SET name=%s, age=%s WHERE id=%s", (new_name, new_age, id_text))
    conn.commit()

    if cur.rowcount == 0:
        print(" No record found with that ID.")
    else:
        print(" Record updated successfully!")

    cur.close()
    conn.close()


def delete_dress():
    """Delete a record by ID"""
    id_text = input("Enter the ID to delete: ").strip()
    if not id_text.isdigit():
        print("Invalid ID.")
        return

    conn = get_connection()
    if not conn:
        return

    cur = conn.cursor()
    cur.execute("DELETE FROM dress WHERE id=%s", (id_text,))
    conn.commit()

    if cur.rowcount == 0:
        print(" No record found with that ID.")
    else:
        print(" Record deleted successfully!")

    cur.close()
    conn.close()


def main():
    print("\n Python MySQL CRUD Demo for 'dress' Table \n")

    while True:
        print("\nChoose an option:")
        print("1) Add Record")
        print("2) Show Records")
        print("3) Update Record")
        print("4) Delete Record")
        print("5) Exit")

        choice = input("Your choice (1-5): ").strip()

        if choice == "1":
            create_dress()
        elif choice == "2":
            read_dress()
        elif choice == "3":
            update_dress()
        elif choice == "4":
            delete_dress()
        elif choice == "5":
            print(" Goodbye!")
            break
        else:
            print(" Please choose 1–5 only.")


if __name__ == "__main__":
    main()
