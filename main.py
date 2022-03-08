from dataclasses import dataclass
from gc import get_referents
from locale import currency
from msilib.schema import Error
from tkinter import *   
import random
import math
from webbrowser import get 
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
        self.database = getDatabase(db_connection,'chatbot_data.greetings')
        self.words_id = self.database.getWordsID()
        self.words_factor = self.database.getWords()
        self.IDwords = self.database.getIDWords()
        self.find_percent = {}
        for i in self.words_factor:
            percent = (self.words_factor[i]/4)*100
            self.find_percent[i] = percent
    def no(self):
        try:
            x = self.words_factor[self.current_word]
            y = ((1-equation(x))*(x-.05))
            if y >= 2 or y <= 0:
                print(f'Stop: {self.IDwords[self.current_word]}, {x}')
                self.database.updateValue(self.IDwords[self.current_word],x)
                percent = (x/4)*100
                self.find_percent[self.current_word]=int(percent)
            else:
                self.words_factor[self.current_word] = y
                self.database.updateValue(self.IDwords[self.current_word],y)
                print(f'No: {self.current_word}, {self.words_factor[self.current_word]}')
                percent = (y/4)*100
                self.find_percent[self.current_word]=int(percent)
        except KeyError:
            print("No current word")
    def yes(self):
        try:
            x = self.words_factor[self.current_word]
            y = ((1+equation(x))*(x+.05))
            if y >= 2 or y <= 0:
                print(f'Stop: {x}')
                self.database.updateValue(self.IDwords[self.current_word],x)
                percent = (x/4)*100
                self.find_percent[self.current_word]=int(percent)
            else:
                self.words_factor[self.current_word] = y
                print(f'Yes: {self.current_word}, {self.words_factor[self.current_word]}')
                self.database.updateValue(self.IDwords[self.current_word],y)
                percent = (y/4)*100
                self.find_percent[self.current_word]=int(percent)
        except KeyError:
            print("No current word")
    def giveWord(self):
        my_percents = []
        my_words= []
        for i in self.find_percent:
            my_percents.append(self.find_percent[i])
            my_words.append(i)
        random_word = random.choices(my_words,weights=my_percents)
        print(f'Computer: {random_word[0]}: {self.words_factor[random_word[0]]}')
        self.current_word = random_word[0]
chatbotGUI = ChatbotGUI()
yes_button = Button(win, text="Yes", bd=5,width=100,height=2,fg='red', command=chatbotGUI.yes)
no_button = Button(win,text='No',bd=5,width=100,height=2, fg='blue',command=chatbotGUI.no)
again_button = Button(win, text="Give Word", bd=5,width=100,height=2, fg='green',command=chatbotGUI.giveWord)
yes_button.pack(side='top')
no_button.pack(side='top')
again_button.pack(side='top')
win.mainloop()  
my_databse = getDatabase(db_connection, 'SELECT * FROM chatbot_data.goodbye;')
print(my_databse.test())
#use /4 to find percentages
# print(math.log(100,10))