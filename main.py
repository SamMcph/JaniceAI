from socketserver import UDPServer
from tkinter import *  
import random
import math
from turtle import color
from urllib.request import urlopen
from mysqlx import DatabaseError
from getDatabase import getDatabase
import mysql.connector
import json
import string
from skill import news,weather,time,date,wiki
try: 
    db_connection = mysql.connector.connect(host='localhost',user='root',password="1234",database='chatbot')
except DatabaseError: 
    print("There infact is an error that has occured probably because the database server isn't turned on.")
#the equation that is used to calculate the factor
def equation(x):
        y = (-1*(abs((x-1)/(math.e*(math.sqrt(1+pow(x-1,2)))))))+(math.e/10)
        return y
# used to check all message to see if they contain words that will trigger a skill
def checkNonDatabaseLine(user_text):
    if "news" in user_text:
        str_news = news()
        return(str_news)
    elif "weather" in user_text:
        url = 'http://ipinfo.io/json'
        response = urlopen(url)
        data = json.load(response)
        weather_data = weather(data['city'])
        return(f"In {weather_data[2]} the current tempature is {weather_data[1]} with {weather_data[0]} skies")
    elif "time" in user_text:
        the_time = time()
        return the_time
    elif "date" in user_text:
        the_date = date()
        return(the_date)
    elif 'tell me about' in user_text:
        the_wiki = wiki(user_text)
        return(the_wiki)
#class that dictakes which responeses are returned and the factor of the responses 
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
    #updates the intent of the response based on user input
    def update_intent(self,intent):
        database = getDatabase(db_connection,intent)
        words_factor = database.getWords()
        find_percent = {}
        for i in words_factor:
            percent = (words_factor[i]/4)*100
            find_percent[i] = percent 
        with open('percent.json','w') as f:
            json.dump(find_percent,f,indent=4)
    #will decrease the factor of a response
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
            print("Please Send a Message to dictate the response")
    # increases the factor of the response
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
    #returns a response based on the intent of the user input 
    def giveWord(self,user_text):
        database = getDatabase(db_connection,self.intent)
        all_words = database.getAllWords()
        known = False
        #removes punctuation from users text
        update_text = user_text.translate(str.maketrans('', '', string.punctuation))
        # if " ur " in update_text:
        update_text = update_text.replace(" u ", ' you ')
        update_text = update_text.replace(" ur "," your ")
        if checkNonDatabaseLine(update_text.lower()):
            return(checkNonDatabaseLine(update_text.lower()))
        
        for i in all_words:
            if i == update_text.lower():
                
                known = True
                self.intent = f'chatbot_data.{all_words[i]}'
                GUI = ChatbotGUI()
                GUI.update_intent(f'chatbot_data.{all_words[i]}')
        if not known:
            self.intent = "chatbot_data.nounder"
            GUI = ChatbotGUI()
            GUI.update_intent('chatbot_data.nounder')
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
mode = input("Would you like to launch in Traning Mode(1) or Devlopment Mode(2)") 
#GUI config
win = Tk()
win.geometry('500x600')
win.title("Chatbot Training")
win.configure(bg='white')
win.resizable(width=False, height=False)
chatbotGUI = ChatbotGUI()
if mode == "1":
    # creates the button that can dictate the factor of a response
    yes_button = Button(win,font=("vedanta",12,'bold'), text="Yes", bd=5,width=100,height=2,fg='red',bg="#32de97", command=chatbotGUI.yes)
    no_button = Button(win,font=("vedanta",12,'bold'),text='No',bd=5,width=100,height=2, fg='blue',bg="#32de97",command=chatbotGUI.no)
    no_button.pack(side='bottom')
    yes_button.pack(side='bottom')
else:
    win.geometry("500x480")
def send():
    #creates the chat log 
    msg = EntryBox.get("1.0",'end-1c').strip()
    EntryBox.delete("0.0",END)
    if msg != '':
        ChatLog.config(state=NORMAL)
        ChatLog.insert(END, "User: " + msg + '\n')
        ChatLog.config(foreground="#442265", font=("Verdana", 11 ))
        res = (chatbotGUI.giveWord(msg))
        ChatLog.insert(END, "Computer: " + res + '\n\n')
        ChatLog.pack(padx=10, pady=10)

        ChatLog.config(state=DISABLED)
        ChatLog.yview(END)
# adds parts to the GUI
ChatLog = Text(win, bd=0, bg="white", height="20", width="50", font="Times")
ChatLog.config(state=DISABLED)
scrollbar = Scrollbar(win, command=ChatLog.yview)
ChatLog['yscrollcommand'] = scrollbar.set
SendButton = Button(win,font=("vedanta",12,'bold'), text="Send", width="12", height=5,
                    bd=7, bg="#32de97", activebackground="#3c9d9b",fg='#ffffff',
                    command=send)
EntryBox = Text(win,bd=0, bg="white",width="29", height="5", font="Times",fg="black",borderwidth=4, relief="groove")
scrollbar.place(x=487,y=6, height=386)
ChatLog.place(x=0,y=3, height=386, width=360)
if mode == "1":
    EntryBox.place(x=132, y=397, height=87, width=368)
else:
    EntryBox.place(x=132, y=397, height=84, width=368)
SendButton.place(x=-7, y=397, height=85) 
win.mainloop()      