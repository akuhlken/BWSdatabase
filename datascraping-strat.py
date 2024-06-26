#  Bedrock weatering survey database project
#  Contributers: Andrew Kuhlken, Coden Stark, Luca Viarengo

#  Python file that takes the data from the StratLayer csv file and produces 
#  a valid SQL insert statement. An edited version of the general
#  datascraping file to account for different data types and the different
#  values to be inserted.

import csv

# change to the location of the file to scrape
filename = r"C:\Users\coden\OneDrive - Whitman College\Senior\Spring 2024\databases\2023 Strat Sections (1).csv"

# change to where you want the data to go
savelocation = r"C:\Users\coden\OneDrive - Whitman College\Senior\Spring 2024\results.txt"

insertStatement = "INSERT INTO StratLayer (OutcropID, LayerNumber, Description, TopDepth, BottomDepth)\nVALUES"
startStatement = insertStatement

with open(filename, 'r') as csvfile:
    datareader = csv.reader(csvfile)
    for row in datareader:
        insertValues = "("
        for column in row:
            try:
                int(column)
            except:
                column = f"\"{column}\""

            if insertValues == "(":
                insertValues = "".join([insertValues,column])
            else:
                insertValues = ",".join([insertValues,column])
        insertValues = insertValues + ")"

        if insertStatement == startStatement:
            insertStatement = " ".join([insertStatement,insertValues])
        else:
            insertStatement = ",\n".join([insertStatement,insertValues])
    insertStatement = insertStatement + ";"
    print(insertStatement)
        
with open(savelocation, "w") as save:
    save.write(insertStatement)