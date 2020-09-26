import os
import csv



def num_Months(file):
    count = 0

    for row in file:
        count += 1
    
    return count

def profit_loss(file):
    total = 0

    for row in file:
        amount = int(row[1])
        total += amount

    return total


# Open and read .csv files

csvpath = os.path.join('..','Resources','budget_data.csv')

with open(csvpath) as csvfile:
    budget_data = csv.reader(csvfile, delimiter = ',')

    header = next(budget_data)

    print("Financial Analysis")
    print("----------------------------")

    print(f"Total Months: {num_Months(budget_data)}")
    csvfile.seek(0)
    print(f"Total: ${profit_loss(budget_data)}")


    # for row in budget_data:
    #     print(row)
 

    



