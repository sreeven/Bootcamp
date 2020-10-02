import os
import csv

csvpath = os.path.join('Resources','budget_data.csv')

with open(csvpath) as csvfile:
    file = csv.reader(csvfile, delimiter = ',')
    header = next(file)
    sum = 0
    profit_loss = []
    change = []
    total = 0
    change_total = 0
    max = 0
    max_date = ""
    min = 0
    min_index = ""

    for row in file:
        amount = int(row[1])
        profit_loss.append(int(amount))

        if amount > max:
            max = amount
            max_date = row[0]
        
        if amount < min:
            min = amount
            min_date = row[0]


    for value in profit_loss:
        sum += value

    for value in profit_loss:
        total += value

    months = len(profit_loss)

    for index in range(1, len(profit_loss)):
        change.append(profit_loss[index] - profit_loss[index-1])
    
    for value in change:
        change_total += value

    average_change = round(change_total / len(change),2)


    print("Financial Analysis")
    print("----------------------------")
    print(f"Total Months: {months}")
    print(f"Total: ${total}")
    print(f"Average Change: {average_change}")
    print(f"Greatest Increase in Profits: {max_date} ({max})")
    print(f"Greatest Decrease in Profits: {min_date} ({min})")


file = open("Analysis/analysis.txt", 'w')

file.write("Financial Analysis" + "\n")
file.write("----------------------------" + "\n")
file.write(f"Total Months: {months}" + "\n")
file.write(f"Total: ${total}" + "\n")
file.write(f"Average Change: {average_change}" + "\n")
file.write(f"Greatest Increase in Profits: {max_date} ({max})" + "\n")
file.write(f"Greatest Decrease in Profits: {min_date} ({min})" + "\n")

file.close()
    




