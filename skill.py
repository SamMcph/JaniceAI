from datetime import datetime
from urllib.request import urlopen
import requests
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
        return "Here are the top ten news stories right now: \n"+return_statment
    except:
        return "can't connect to the internet right now please try again later"

# Function to grab weather
def weather():
    try:
        API_key = "254ff56fd58c0280799acc6c9b423f5c"
        base_url = "http://api.openweathermap.org/data/2.5/weather?"
        url = 'http://ipinfo.io/json'
        response = urlopen(url)
        data = json.load(response)
        city= data['city']
        Final_url = base_url + "appid=" + API_key + "&q=" + city
        weather_data = requests.get(Final_url).json()
        temp = weather_data['main']['temp']
        F = int((temp-273.15)*1.8+32)
        description = weather_data['weather'][0]['description']
        return f"In {city}, {data['region']} the current tempature is {F}°F with {description} skies"
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
    user_data = user_data.replace("who is ", "")
    try:   
        result = wikipedia.summary(user_data, sentences=4)
        return(result)
    except:
        return "there is no wikipedia page with that name"

import psutil
def battery():
    battery = psutil.sensors_battery()
    plugged = battery.power_plugged
    percent = str(battery.percent)
    plugged = "Plugged In" if plugged else "Not Plugged In"
    return(percent+'% | '+plugged)


