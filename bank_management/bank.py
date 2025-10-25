import mysql.connector
from mysql.connector import Error

# Database credentials
DB_HOST = "localhost"
DB_PORT = 3306
DB_USER = "root"
DB_PASSWORD = "harshini@2004"  
DB_NAME = "bank_db"       

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
        print(" Connected to MySQL")
        return conn
    except mysql.connector.Error as e:
        print(" Couldn't connect to MySQL.")
        print("Error:", e)
        return None


def create_account():
    """Insert a new record into the bank_accounts table"""
    holder_name = input("Enter account holder name: ").strip()
    account_type = input("Enter account type (Savings/Current): ").strip()
    balance_text = input("Enter initial balance: ").strip()

    if not holder_name or not balance_text.replace('.', '', 1).isdigit():
        print("⚠️ Please provide a valid name and numeric balance.")
        return

    balance = float(balance_text)
    conn = get_connection()
    if not conn:
        return

    cur = conn.cursor()
    cur.execute(
        "INSERT INTO bank_accounts (holder_name, account_type, balance) VALUES (%s, %s, %s)",
        (holder_name, account_type, balance)
    )
    conn.commit()
    print("✅ New bank account created successfully!")
    cur.close()
    conn.close()


def read_accounts():
    """Display all bank account records"""
    conn = get_connection()
    if not conn:
        return

    cur = conn.cursor()
    cur.execute("SELECT id, holder_name, account_type, balance FROM bank_accounts ORDER BY id")
    rows = cur.fetchall()

    if not rows:
        print("No accounts found.")
    else:
        print("\n--- Bank Accounts ---")
        for row in rows:
            print(f"ID: {row[0]} | Name: {row[1]} | Type: {row[2]} | Balance: ₹{row[3]:,.2f}")

    cur.close()
    conn.close()


def update_account():
    """Update an existing bank account"""
    id_text = input("Enter the account ID to update: ").strip()
    if not id_text.isdigit():
        print("Please enter a valid ID.")
        return

    new_name = input("Enter new holder name: ").strip()
    new_type = input("Enter new account type: ").strip()
    new_balance_text = input("Enter new balance: ").strip()

    if not new_name or not new_balance_text.replace('.', '', 1).isdigit():
        print(" Invalid input. Try again.")
        return

    new_balance = float(new_balance_text)
    conn = get_connection()
    if not conn:
        return

    cur = conn.cursor()
    cur.execute(
        "UPDATE bank_accounts SET holder_name=%s, account_type=%s, balance=%s WHERE id=%s",
        (new_name, new_type, new_balance, id_text)
    )
    conn.commit()

    if cur.rowcount == 0:
        print("⚠️ No account found with that ID.")
    else:
        print("✅ Account updated successfully!")

    cur.close()
    conn.close()


def delete_account():
    """Delete an account by ID"""
    id_text = input("Enter the account ID to delete: ").strip()
    if not id_text.isdigit():
        print("⚠️ Invalid ID.")
        return

    conn = get_connection()
    if not conn:
        return

    cur = conn.cursor()
    cur.execute("DELETE FROM bank_accounts WHERE id=%s", (id_text,))
    conn.commit()

    if cur.rowcount == 0:
        print("⚠️ No account found with that ID.")
    else:
        print("✅ Account deleted successfully!")

    cur.close()
    conn.close()


def main():
    print("\n Python MySQL CRUD Demo — Bank Account Management \n")

    while True:
        print("\nChoose an option:")
        print("1) Create Account")
        print("2) Show All Accounts")
        print("3) Update Account")
        print("4) Delete Account")
        print("5) Exit")

        choice = input("Your choice (1-5): ").strip()

        if choice == "1":
            create_account()
        elif choice == "2":
            read_accounts()
        elif choice == "3":
            update_account()
        elif choice == "4":
            delete_account()
        elif choice == "5":
            print("Goodbye!")
            break
        else:
            print(" Please choose 1–5 only.")


if __name__ == "__main__":
    main()
