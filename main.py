from tkinter import *  
import random
import math
from turtle import color
from urllib.request import urlopen
from mysqlx import DatabaseError
from getDatabase import getDatabase
import mysql.connector
import json
from skill import news, weather, time,date
try: 
    db_connection = mysql.connector.connect(host='localhost',user='root',password="1234",database='chatbot')
except DatabaseError: 
    print("There infact is an error that has occured probably because the database server isn't turned on.")
def equation(x):
        y = (-1*(abs((x-1)/(math.e*(math.sqrt(1+pow(x-1,2)))))))+(math.e/10)
        return y
# def checkNonDatabaseLine(user_text):
#     with open('skill_intent.json','r') as f:
#         json_dic = json.load(f)
#     for i in json_dic:
#         if user_text.lower() == i:
#             if json_dic[i] == "news":
#                 str_news = news()
#                 return(str_news)
#             elif json_dic[i] == "weather":
#                 url = 'http://ipinfo.io/json'
#                 response = urlopen(url)
#                 data = json.load(response)
#                 weather_data = weather(data['city'])
#                 return(f"In {weather_data[2]} the current tempature is {weather_data[1]} with {weather_data[0]}")
#             elif json_dic[i] == "time":
#                 the_time = time()
#                 return the_time
#             elif json_dic[i] =="date":
#                 the_date = date()
#                 return the_date
def checkNonDatabaseLine(user_text):
    if "news" in user_text:
        str_news = news()
        return(str_news)
    elif "weather" in user_text:
        url = 'http://ipinfo.io/json'
        response = urlopen(url)
        data = json.load(response)
        weather_data = weather(data['city'])
        return(f"In {weather_data[2]} the current tempature is {weather_data[1]} with {weather_data[0]}")
    elif "time" in user_text:
        the_time = time()
        return the_time
    elif "date" in user_text:
        the_date = date()
        return(the_date)
win = Tk()
win.geometry('400x600')
win.title("Chatbot Training")
win.configure(bg='white')
win.resizable(width=False, height=False)
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
            json.dump(find_percent,f,indent=4)
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
            print("Please select the Start Conversation button to start the conversation")
    def yes(self):
        print(self.current_word)
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
           print("Please Send a Message to dictate the response")
    def giveWord(self,user_text):
        database = getDatabase(db_connection,self.intent)
        all_words = database.getAllWords()
        known = False

        if checkNonDatabaseLine(user_text.lower()):
            return(checkNonDatabaseLine(user_text.lower()))
        
        for i in all_words:
            if i == user_text.lower():
                
                known = True
                self.intent = f'chatbot_data.{all_words[i]}'
                GUI = ChatbotGUI()
                GUI.update_intent(f'chatbot_data.{all_words[i]}')
        print(f"Known: {known}")
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
        return(f'{random_word[0]}: {words_factor[random_word[0]]}')   
chatbotGUI = ChatbotGUI()
yes_button = Button(win, text="Yes", bd=5,width=100,height=2,fg='red',bg="#32de97", command=chatbotGUI.yes)
no_button = Button(win,text='No',bd=5,width=100,height=2, fg='blue',bg="#32de97",command=chatbotGUI.no)
no_button.pack(side='bottom')
yes_button.pack(side='bottom')
def send():
    msg = EntryBox.get("1.0",'end-1c').strip()
    EntryBox.delete("0.0",END)
    if msg != '':
        ChatLog.config(state=NORMAL)
        ChatLog.insert(END, "User: " + msg + '\n\n')
        ChatLog.config(foreground="black", font=("Times", 12 ))
        res = (chatbotGUI.giveWord(msg))
        ChatLog.insert(END, "Computer: " + res + '\n\n')
        ChatLog.pack(padx=10, pady=10)

        ChatLog.config(state=DISABLED)
        ChatLog.yview(END)
ChatLog = Text(win, bd=0, bg="white", height="8", width="50", font="Times")
ChatLog.config(state=DISABLED)
scrollbar = Scrollbar(win,command=ChatLog.yview)
ChatLog['yscrollcommand']=scrollbar.set
SendButton = Button(win,font=("vedanta",12,'bold'), text="Send", width="12", height=5,
                    bd=7, bg="#32de97", activebackground="#3c9d9b",fg='#ffffff',
                    command= send)
EntryBox = Text(win,bd=0, bg="white",width="29", height="5", font="Times",fg="black")
scrollbar.place(x=376,y=6, height=386)
ChatLog.place(x=6,y=6, height=386, width=370)
EntryBox.place(x=132, y=397, height=85, width=260)
SendButton.place(x=-7, y=397, height=85) 
win.mainloop()  