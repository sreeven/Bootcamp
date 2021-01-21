# import dependencies 
from splinter import Browser
from bs4 import BeautifulSoup as bs
from webdriver_manager.chrome import ChromeDriverManager
import pandas as pd

# scrape all
def scrape_all():
    executable_path = {'executable_path': ChromeDriverManager().install()}
    browser = Browser('chrome', **executable_path, headless=False)

    title, paragraph = mars_news(browser)

    data = {
        "title": title,
        "paragraph": paragraph,
        "image": featured_image(browser),
        "facts": fact_table(),
        "hemispheres":scrape_hemispheres(browser)
    }

    browser.quit()
    return data


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

# FEATURED IMAGE -----------
def featured_image():
    url = "https://www.jpl.nasa.gov/spaceimages/?search=&category=Mars"
    browser.visit(url)

    button = browser.find_by_id('full_image')
    button.click()

    button = browser.links.find_by_partial_text('more info')
    button.click()

    html = browser.html
    soup = bs(html, 'html.parser')

    img = soup.find('img', class_ = 'main_image').get('src')
    img_url = f'https://www.jpl.nasa.gov{img}'

    return img_url

# FACT TABLE
def fact_table():
    url = "https://space-facts.com/mars/"
    browser.visit(url)

    table = pd.read_html(url)[0]
    table.columns = {
        "Description",
        "Mars"
    }

    table.set_index("Description", inplace=True)

    return table

    # table.to_html('mars_table.html')

def scrape_hemispheres():

    url = "https://astrogeology.usgs.gov/search/results?q=hemisphere+enhanced&k1=target&v1=Mars"
    browser.visit(url)

    html = browser.html
    soup = bs(html)

    blocks = soup.find_all("div",class_= "description")


    base_url = "https://astrogeology.usgs.gov"

    hemispheres = []
    h_urls = []

    for block in blocks:
        title = (block.find("h3")).text
        title = title.replace(" Enhanced","")
        hemispheres.append(title)
        
        link = block.find('a', class_='itemLink')['href']
        h_urls.append(f"{base_url}{link}")

    h_img_urls = []
    for link in h_urls:
        browser.visit(link)
        html = browser.html
        soup = bs(html)
        
        blocks = soup.find_all('div', class_='downloads')
        url = blocks[0].find_all('a')[0]['href']
        h_img_urls.append(url)

    mars_hemispheres = []
    for x in range(4):
        item = {
            "title": hemispheres[x],
            "img_url": h_img_urls[x]
        }
        mars_hemispheres.append(item)
    return mars_hemispheres

if __name__ == "__main__":
    print(scrape_all)