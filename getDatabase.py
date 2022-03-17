class getDatabase():
    def __init__(self,db_connection,intent) -> None:
        self.dbconnection = db_connection
        self.table = intent 
        self.my_database = db_connection.cursor()
    def getTable(self):
        self.my_database.execute(f'SELECT * FROM {self.table};')
        result = self.my_database.fetchall()
        rows = []
        for row in result:
            rows.append(row)
        return rows
    def getWords(self):
        self.my_database.execute(f'SELECT * FROM {self.table};')
        result = self.my_database.fetchall()
        words = {}
        for row in result:
            words[row[3]]= row[4]
        return(words)
    def getWordsID(self):
        self.my_database.execute(f'SELECT * FROM {self.table};')
        result = self.my_database.fetchall()
        word_id = {}
        for row in result:
            word_id[row[1]] = row[3]
        return word_id  
    def getIDWords(self):
        self.my_database.execute(f'SELECT * FROM {self.table};')
        result = self.my_database.fetchall()
        id_words = {}
        for row in result:
            id_words[row[3]] = row[1]
        return id_words
    def updateValue(self, id, factor):
        query = f"UPDATE {self.table} SET factor ='{str(factor)}' WHERE wordId ='{str(id)}'"
        self.my_database.execute(str(query))
        with self.dbconnection.cursor() as cursor:
            cursor.execute(query)
            self.dbconnection.commit()
    def getAllWords(self):
        self.my_database.execute("SHOW FULL TABLES FROM chatbot_data;")
        result = self.my_database.fetchall()
        all_words = {}
        for i in result:
            self.my_database.execute(f'SELECT * FROM chatbot_data.{i[0]}')
            result = self.my_database.fetchall()
            for j in result:
                all_words[j[3]]= j[2]
                try:
                    all_words[j[5]] = j[2]
                except IndexError:
                    pass
        return all_words
