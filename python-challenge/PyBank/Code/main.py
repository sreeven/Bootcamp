import os
import csv
















# Open and read .csv files

csvpath = os.path.join('..','Resources','budget_data.csv')

with open(csvpath) as csvfile:
    budget_data = csv.reader(csvfile, delimiter = ',')

    header = next(budget_data)
