from cgitb import reset
from logging.handlers import MemoryHandler
import re
from unittest import result


class getDatabase():
    def __init__(self,db_connection) -> None:
        self.table = 'SELECT * FROM chatbot_data.greetings;'
        self.my_database = db_connection.cursor()
    def getTable(self):
        self.my_database.execute(self.table)
        result = self.my_database.fetchall()
        rows = []
        for row in result:
            rows.append(row)
        return rows
    def getWords(self):
        self.my_database.execute(self.table)
        result = self.my_database.fetchall()
        words = {}
        for row in result:
            words[row[3]]= row[4]
        return(words)
    def getWordsID(self):
        self.my_database.execute(self.table)
        result = self.my_database.fetchall()
        word_id = {}
        for row in result:
            word_id[row[1]] = row[3]
        return word_id  