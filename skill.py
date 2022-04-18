from datetime import datetime
from inspect import Traceback
from urllib.request import urlopen
import requests
from bs4 import BeautifulSoup
import json
import datetime 

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
    headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'}
    city= (f'{city}+weather')
    res = requests.get(f'https://www.google.com/search?q={city}&oq={city}&aqs=chrome.0.35i39l2j0l4j46j69i60.6128j1j7&sourceid=chrome&ie=UTF-8',headers=headers)
    soup = BeautifulSoup(res.text,'html.parser')   
    try:
        location = soup.select('#wob_loc')[0].getText().strip()  
        # time = soup.select('#wob_dts')[0].getText().strip()       
        info = soup.select('#wob_dc')[0].getText().strip() 
        weather = soup.select('#wob_tm')[0].getText().strip()
        return([info,weather+"°F",location])
    except IndexError:
        return("I can't get your location right now")
#time
def time():
    time = datetime.datetime.now().strftime("%I:%M %p")
    return time
def date():
    date = datetime.datetime.now().strftime("%A %d/%m/%Y")
    return date
