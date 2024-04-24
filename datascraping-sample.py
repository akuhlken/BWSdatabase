import csv
import os

# change to the location of the file to scrape
filename = r"C:\Users\coden\OneDrive - Whitman College\Senior\Spring 2024\databases\Samples2023 (3).csv"

# change to where you want the data to go
savelocation = r"C:\Users\coden\OneDrive - Whitman College\Senior\Spring 2024\results.txt"

insertStatement = "INSERT INTO Sample (ID, OutcropID, ResearcherID, Type, Depth, Description, Date, CoarseFraction, FineFraction, LayerNumber)\nVALUES"
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