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



@app.route("/api/v1.0/precipitation")



@app.route("/api/v1.0/stations")




@app.route("/api/v1.0/tobs")



@app.route("/api/v1.0/<start> and /api/v1.0/<start>/<end>")