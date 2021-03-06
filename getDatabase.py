import json
class getDatabase():
    def __init__(self,db_connection,intent) -> None:
        self.dbconnection = db_connection
        self.table = intent 
        self.my_database = db_connection.cursor()
    # gets the table from the database
    def getTable(self):
        self.my_database.execute(f'SELECT * FROM {self.table};')
        result = self.my_database.fetchall()
        rows = []
        for row in result:
            rows.append(row)
        return rows
    # I forgot 
    def getWords(self):
        self.my_database.execute(f'SELECT * FROM {self.table};')
        result = self.my_database.fetchall()
        words = {}
        for row in result:
            words[row[3]]= row[4]
        return(words)
    # gets a Id and repsonse of a response
    def getWordsID(self):
        self.my_database.execute(f'SELECT * FROM {self.table};')
        result = self.my_database.fetchall()
        word_id = {}
        for row in result:
            word_id[row[1]] = row[3]
        return word_id  
    # gets a response and the Id of a response
    def getIDWords(self):
        self.my_database.execute(f'SELECT * FROM {self.table};')
        result = self.my_database.fetchall()
        id_words = {}
        for row in result:
            id_words[row[3]] = row[1]
        return id_words
    # updates the factor to the database of a response
    def updateValue(self, id, factor):
        query = f"UPDATE {self.table} SET factor ='{str(factor)}' WHERE wordId ='{str(id)}'"
        self.my_database.execute(str(query))
        with self.dbconnection.cursor() as cursor:
            cursor.execute(query)
            self.dbconnection.commit()
    # returns all of the words from a json file 
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
        with open('All_words.json','w') as f:
            json.dump(all_words,f,indent=4)
        return all_words
