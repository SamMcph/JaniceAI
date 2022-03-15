from tkinter import *   
import random
import math
from webbrowser import get
from mysqlx import DatabaseError
from getDatabase import getDatabase
import mysql.connector
import json
try: 
    db_connection = mysql.connector.connect(host='localhost',user='root',password="1234",database='chatbot')
except DatabaseError: 
    print(DatabaseError)
def equation(x):
        y = (-1*(abs((x-1)/(math.e*(math.sqrt(1+pow(x-1,2)))))))+(math.e/10)
        return y
win = Tk()
win.geometry('400x170')
win.title("Chatbot Training")
class ChatbotGUI():
    def __init__(self):
        self.current_word=None
        self.intent = 'chatbot_data.greetings'
        database = getDatabase(db_connection,self.intent)
        words_factor = database.getWords()
        find_percent = {}
        for i in words_factor:
            percent = (words_factor[i]/4)*100
            find_percent[i] = percent
        with open("percent.json",'w') as f:
            json.dump(find_percent,f)
    def update_intent(self,intent):
        database = getDatabase(db_connection,intent)
        words_factor = database.getWords()
        find_percent = {}
        for i in words_factor:
            percent = (words_factor[i]/4)*100
            find_percent[i] = percent 
        with open('percent.json','w') as f:
            json.dump(find_percent,f,indent=4)
    def no(self):
        try:
            database = getDatabase(db_connection,self.intent)
            print(self.intent)
            words_factor = database.getWords()
            IDwords = database.getIDWords()
            x = words_factor[self.current_word]
            y = ((1-equation(x))*(x-.05))
            if y >= 2 or y <= 0:
                print(f'New Value: {IDwords[self.current_word]}, {x}')
                database.updateValue(IDwords[self.current_word],x)
                percent = (x/4)*100
                with open('percent.json','r') as f:
                    json_dic = json.load(f)
                with open('percent.json','w') as f:
                    json_dic[self.current_word]=int(percent)
                    json.dump(json_dic,f,indent=4)
            else:
                words_factor[self.current_word] = y
                database.updateValue(IDwords[self.current_word],y)
                print(f'New Value: {self.current_word}, {words_factor[self.current_word]}')
                percent = (y/4)*100
                with open('percent.json','r') as f:
                    json_dic = json.load(f)
                with open('percent.json','w') as f:
                    json_dic[self.current_word]=int(percent)
                    json.dump(json_dic,f,indent=4)
        except KeyError:
            print("No current word")
    def yes(self):
        print(self.intent)
        database = getDatabase(db_connection,self.intent)
        words_factor = database.getWords()
        IDwords = database.getIDWords()
        try:
            x = words_factor[self.current_word]
            y = ((1+equation(x))*(x+.05))
            if y >= 2 or y <= 0:
                print(f'New Value: {x}')
                database.updateValue(IDwords[self.current_word],x)
                percent = (x/4)*100
                with open('percent.json','r') as f:
                    json_dic = json.load(f)
                with open('percent.json','w') as f:
                    json_dic[self.current_word]=int(percent)
                    json.dump(json_dic,f,indent=4)
            else:
                words_factor[self.current_word] = y
                print(f'New Value: {self.current_word}, {words_factor[self.current_word]}')
                database.updateValue(IDwords[self.current_word],y)
                percent = (y/4)*100
                with open('percent.json','r') as f:
                    json_dic = json.load(f)
                with open('percent.json','w') as f:
                    json_dic[self.current_word]=int(percent)
                    json.dump(json_dic,f,indent=4)
        except KeyError:
            print("No current word")
    def giveWord(self):
        database = getDatabase(db_connection,self.intent)
        print("Computer: Hello User")
        while True:
            user_text = input("User: ")
            all_words = database.getAllWords()
            for i in all_words:
                if i == user_text.lower():
                    self.intent = f'chatbot_data.{all_words[i]}'
                    GUI = ChatbotGUI()
                    GUI.update_intent(f'chatbot_data.{all_words[i]}')
                    break
            my_percents = []
            my_words= []
            the_database = getDatabase(db_connection,self.intent)
            words_factor = the_database.getWords()
            with open('percent.json', 'r') as openfile:
                find_percent = json.load(openfile)
            for i in find_percent:
                my_percents.append(find_percent[i])
                my_words.append(i)
                random_word = random.choices(my_words,weights=my_percents)
            print(f'Computer: {random_word[0]}: {words_factor[random_word[0]]}')
            self.current_word = random_word[0]
            
chatbotGUI = ChatbotGUI()
yes_button = Button(win, text="Yes", bd=5,width=100,height=2,fg='red', command=chatbotGUI.yes)
no_button = Button(win,text='No',bd=5,width=100,height=2, fg='blue',command=chatbotGUI.no)
again_button = Button(win, text="Start Conversation", bd=5,width=100,height=2, fg='green',command=chatbotGUI.giveWord)
yes_button.pack(side='top')
no_button.pack(side='top')
again_button.pack(side='top')
win.mainloop()  