# loop through all rows in a csv file

# parse each row

# sort relevant information into the correct insert order and write SQL insert statement
# put insert statement into a doc.




# input must not have column names

import csv
import os

# change to the location of the file to scrape
filename = r'C:\Users\coden\Downloads\Outcrop(Sheet1).csv'

# change to where you want the data to go
savelocation = r"C:\Users\coden\OneDrive - Whitman College\Senior\Spring 2024\results.txt"

insertStatement = "INSERT INTO Outcrop (Name, Description, Location, 3Dmodel)\nVALUES"
startStatement = insertStatement

with open(filename, 'r') as csvfile:
    datareader = csv.reader(csvfile)
    for row in datareader:
        if not "['Name', 'Description', 'Location', '3Dmodel', 'OrthophotoID']" in row:
            insertValues = "("
            for column in row:
                if column.startswith("(-"):
                    column = f"Point{column}"
                else:
                    column = f"\"{column}\""

                if insertValues == "(":
                    insertValues = "".join([insertValues,column])
                else:
                    insertValues = ",".join([insertValues,column])
            insertValues = insertValues + ")"

            if insertStatement == startStatement:
                insertStatement = " ".join([insertStatement,insertValues])
            insertStatement = ",\n".join([insertStatement,insertValues])
    insertStatement = insertStatement + ";"
    #print(insertStatement)
        
with open(savelocation, "w") as save:
    save.write(insertStatement)