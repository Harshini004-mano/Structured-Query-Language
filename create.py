def create_student(): 
    name = input("Enter student name: ").strip() 
    age_text = input("Enter age (number): ").strip() 
    if not name or not age_text.isdigit(): 
        print("Please provide a name and a number for age.") 
        return 
    age = int(age_text) 
 
    conn = get_connection () 
 
    if not conn: return 
    cur = conn.cursor() 
    cur.execute("INSERT INTO students (name, age) VALUES (%s, %s)",(name, age)) 
    conn.commit() 
    print("Student added!") 
    cur.close() 
    conn.close() 