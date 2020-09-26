import os
import csv


def numMonths(file):
    count = 0

    for row in file:
        count +=1
    
    return count














# Open and read .csv files

csvpath = os.path.join('..','Resources','budget_data.csv')

with open(csvpath) as csvfile:
    budget_data = csv.reader(csvfile, delimiter = ',')

    header = next(budget_data)

    print("Financial Analysis")
    print("----------------------------")

    print(f"Total Months: {numMonths(budget_data)}")
    

