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

# Base Keys

MA = Base.classes.measurement
ST = Base.classes.station


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
def precipitation():
    session = Session(engine)
    sel = [MA.date, MA.prcp]
    result = session.query(*sel).all()
    session.close()

    precipitation = []
    for date, prcp in result:
        prcp_dict = {}
        prcp_dict["Date"] = date
        prcp_dict["Precipitation"] = prcp
        precipitation.append(prcp_dict)

    return jsonify(precipitation)


# @app.route("/api/v1.0/stations")




# @app.route("/api/v1.0/tobs")



# @app.route("/api/v1.0/<start> and /api/v1.0/<start>/<end>")


if __name__ == "__main__":
    app.run(debug=True)