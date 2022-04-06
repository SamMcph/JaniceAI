from urllib.request import urlopen
import requests
from bs4 import BeautifulSoup
import json
def news():
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
def weather(city):
    headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'}
    city= (f'{city}+weather')
    res = requests.get(f'https://www.google.com/search?q={city}&oq={city}&aqs=chrome.0.35i39l2j0l4j46j69i60.6128j1j7&sourceid=chrome&ie=UTF-8',headers=headers)
    soup = BeautifulSoup(res.text,'html.parser')   
    location = soup.select('#wob_loc')[0].getText().strip()  
    # time = soup.select('#wob_dts')[0].getText().strip()       
    info = soup.select('#wob_dc')[0].getText().strip() 
    weather = soup.select('#wob_tm')[0].getText().strip()
    return([info,weather+"°F",location])
url = 'http://ipinfo.io/json'
response = urlopen(url)
data = json.load(response)
IP=data['ip']
org=data['org']
city = data['city']
country=data['country']
region=data['region']

weather_data = weather(data['city'])
print(f"In {weather_data[2]} the current tempature is {weather_data[1]} with {weather_data[0]}")
print(news())