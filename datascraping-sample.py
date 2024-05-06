#  Bedrock weatering survey database project
#  Contributers: Andrew Kuhlken, Coden Stark, Luca Viarengo

#  Python file that takes the data from the sample csv file and produces 
#  a valid SQL insert statement. An edited version of the general
#  datascraping file to account for different data types and the different
#  values to be inserted.


import csv

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
            if not column:
                column = "NULL"
            else:
                try:
                    float(column)
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