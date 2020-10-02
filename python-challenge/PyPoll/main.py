import os
import csv

csvpath = os.path.join('Resources','election_data.csv')

with open(csvpath) as csvfile:
    file = csv.reader(csvfile, delimiter = ',')
    header = next(file)
    candidates_list = []
    results = {}
    total_votes = 0


    for row in file:
        candidate = row[2]
        total_votes += 1

        candidates_list.append(candidate)
        
    for candidate in candidates_list:
        if candidate in results:
            results[candidate] += 1
        else:
            results[candidate] = 1

    print("Election Votes")
    print("-------------------------")
    print(f"Total Votes: {total_votes}")
    print("-------------------------")

    for candidate in results:
        print(f"{candidate}: {round(results[candidate]/total_votes*100, 3)}% ({results[candidate]})")
        
    print("-------------------------")

    max_votes = max(results, key=results.get)

    print(f"Winner: {max_votes}")

    file = open("Analysis/analysis.txt", "w")
    file.write("Election Votes" + "\n")
    file.write("-------------------------" + "\n")
    file.write(f"Total Votes: {total_votes}" + "\n")
    file.write("-------------------------" + "\n")
    file.close()
    




