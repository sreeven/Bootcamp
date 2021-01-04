# import dependencies 
from splinter import Browser
from bs4 import BeautifulSoup as bs
from webdriver_manager.chrome import ChromeDriverManager
import pandas as pd

# path
def init_browser():
    executable_path = {'executable_path': ChromeDriverManager().install()}
    browser = Browser('chrome', **executable_path, headless=False)

# NEWS -----------
def scrape_news():
    url = "https://mars.nasa.gov/news/?page=0&per_page=40&order=publish_date+desc%2Ccreated_at+desc&search=&category=19%2C165%2C184%2C204&blank_scope=Latest"
    browser.visit(url)

    html = browser.html
    soup = bs(html, 'html.parser')

    article = soup.select_one('ul.item_list li.slide')
    title = article.find('div',class_='content_title').text
    body = article.find('div',class_='article_teaser_body').text

    return title, body

