# Import Dependencies

import numpy as np
import datetime as dt

import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func

# Set Base

engine = create_engine("sqlite:///Resources/hawaii.sqlite")
Base = automap_base()
Base.prepare(engine, reflect=True)

# Flask

from flask import Flask, jsonify

app = Flask(__name__)

# Routes

@app.route("/")
def home():
    return (
        f"Available Routes:<br/>"
        f"Precipitation: /api/v1.0/precipitation<br/>"
        f"Stations: /api/v1.0/stations<br/>"
        f"Temperature for last year: /api/v1.0/tobs<br/>"
        f"Temperature stats for start-end dates: /api/v1.0/<start> and /api/v1.0/<start>/<end><br/>"

    )


@app.route("/api/v1.0/precipitation")



@app.route("/api/v1.0/stations")




@app.route("/api/v1.0/tobs")



@app.route("/api/v1.0/<start> and /api/v1.0/<start>/<end>")