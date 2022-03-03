from dataclasses import dataclass
from locale import currency
from msilib.schema import Error
from tkinter import *   
import random
import math 
from mysqlx import DatabaseError
from getDatabase import getDatabase
import mysql.connector
try: 
    db_connection = mysql.connector.connect(host='localhost',user='root',password="1234",database='chatbot')
except DatabaseError: 
    print(DatabaseError)
def equation(x):
        y = (-1*(abs((x-1)/(math.e*(math.sqrt(1+pow(x-1,2)))))))+(math.e/10)
        return y
       
win = Tk()
win.geometry('400x170')
class ChatbotGUI():
    def __init__(self):
        self.current_word=None
        self.database = getDatabase(db_connection)
        self.words_id = self.database.getWordsID()
        self.words_factor = self.database.getWords()

    def no(self):
        try:
            x = self.words_factor[self.current_word]
            y = ((1-equation(x))*(x-.1))
            if y >= 2 or y <= 0:
                print(f'Stop: {self.current_word}, {x}')
            else:
                self.words_factor[self.current_word] = y
                print(f'No: {self.current_word}, {self.words_factor[self.current_word]}')
        except KeyError:
            print("No current word")
    def yes(self):
        try:
            x = self.words_factor[self.current_word]
            y = ((1+equation(x))*(x+.1))
            if y >= 2 or y <= 0:
                print(f'Stop: {x}')
            else:
                self.words_factor[self.current_word] = y
                print(f'Yes: {self.current_word}, {self.words_factor[self.current_word]}')
        except KeyError:
            print("No current word")
    def giveWord(self):
        random_num = random.randint(0,7)
        random_word = self.words_id[random_num]
        print(f'Computer: {random_word}: {self.words_factor[random_word]}')
        self.current_word = random_word
chatbotGUI = ChatbotGUI()
yes_button = Button(win, text="Yes", bd=5,width=100,height=2,fg='red', command=chatbotGUI.yes)
no_button = Button(win,text='No',bd=5,width=100,height=2, fg='blue',command=chatbotGUI.no)
again_button = Button(win, text="Give Word", bd=5,width=100,height=2, fg='green',command=chatbotGUI.giveWord)
yes_button.pack(side='top')
no_button.pack(side='top')
again_button.pack(side='top')
win.mainloop()  
#use /4 to find percentages
# print(math.log(100,10))
