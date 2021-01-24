from flask import Flask, jsonify
from flask_cors import CORS
import pyodbc

app = Flask(__name__)
CORS(app)

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/users')
def users():
    sql = "select user_id, user_name from users"
    result = connect_db(sql)
    print(result)
    return jsonify(result)

def connect_db(sql):
    # Specifying the ODBC driver, server name, database, etc. directly
    cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=localhost;DATABASE=testdb;UID=me;PWD=pass')

    # Create a cursor from the connection
    cursor = cnxn.cursor()
    cursor.execute(sql)

    # results as a list
    columns = [column[0] for column in cursor.description]
    result = [dict(zip(columns, row)) for row in cursor.fetchall()]

    cnxn.commit()
    cnxn.close()

    return result

if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=False, port=5000)