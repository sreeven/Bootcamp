from flask import Flask, render_template, redirect, url_for
from flask_pymongo import PyMongo
import scrape

app = Flask(__name__)

mongo = PyMongo(app, uri="mongodb://localhost:27017/mars_app")

@app.route("/")
def index():
    mars = mongo.db.mars.find_one()
    return render_template("index.html", mars = mars)

@app.route("/scrape")
def scrape():
    mars = mongo.db.mars
    mars_data = scrape.scrape_all()
    mars.update({}, mars_data, upsert=True)
    return "Scraping Complete!"

if __name__ == "main":
    app.run()