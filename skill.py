from datetime import datetime
from inspect import Traceback
from urllib.request import urlopen
import requests
from bs4 import BeautifulSoup
import json
import datetime 
import wikipedia
# Function to grab news
def news():
    try:
        main_url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=96f6d9f249d3430fb7d26eba8d7cc541'
        open_page = requests.get(main_url).json()
        article = open_page['articles']
        results = []
        return_statment = ""
        for i in article:
            results.append(i['title'])
        for i in range (10):
            return_statment = return_statment+(f'{i + 1}: {results[i]}\n')
        return return_statment
    except:
        return "can't connect to the internet right now please try again later"

# Function to grab weather
def weather(city):
    try:
        headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'}
        city= (f'{city}+weather')
        res = requests.get(f'https://www.google.com/search?q={city}&oq={city}&aqs=chrome.0.35i39l2j0l4j46j69i60.6128j1j7&sourceid=chrome&ie=UTF-8',headers=headers)
        soup = BeautifulSoup(res.text,'html.parser')   
        location = soup.select('#wob_loc')[0].getText().strip()  
        # time = soup.select('#wob_dts')[0].getText().strip()       
        info = soup.select('#wob_dc')[0].getText().strip() 
        weather = soup.select('#wob_tm')[0].getText().strip()
        return([info,weather+"°F",location])
    except:
        return("can't connect to the internet right now please try again later")
#time
def time():
    time = datetime.datetime.now().strftime("%I:%M %p")
    return f"It is currently {time}"
#date
def date():
    day_of_month = datetime.datetime.now().strftime("%d")
    if day_of_month == "1":
        date = datetime.datetime.now().strftime("Today is %A %B %dst %Y")
    elif day_of_month =="2":
        date = datetime.datetime.now().strftime("Today is %A %B %dnd %Y")
    elif day_of_month =="3":
        date = datetime.datetime.now().strftime("Today is %A %B %drd %Y")
    else:
        date = datetime.datetime.now().strftime("Today is %A %B %dth %Y")
    return date
    
def wiki(user_data):
    user_data = user_data.replace("tell me about", "")      
    result = wikipedia.summary(user_data, sentences=4)
    return(result)