import csv

# change to the location of the file to scrape
filename = r"C:\Users\coden\OneDrive - Whitman College\Senior\Spring 2024\databases\cleanedXRF2023 (1).csv"

# change to where you want the data to go
savelocation = r"C:\Users\coden\OneDrive - Whitman College\Senior\Spring 2024\results.txt"

insertStatement = "INSERT INTO SampleChemData (TestNum, SampleID, LabID, Date, SiO2, TiO2, Al2O3, FeO, MnO, MgO, CaO, Na2O, K2O, P2O5, Sum, LOI, SiO2n, TiO2n, Al2O3n, FeOn, MnOn, MgOn, CaOn, Na2On, K2On, P2O5n, Ni, Cr, Sc, V, Ba, Rb, Sr, Zr, Y, Nb, Ga, Cu, Zn, Pb, La, Ce, Th, Nd, U, SumTr, PrctTr, MinPlusTr, MajPlusTrOx, w_LOI, IfFerric, NiO, Cr2O3, Sc2O3, V2O3, BaO, Rb2O, SrO, ZrO2, Y2O3, Nb2O5, Ga2O3, CuO, ZnO, PbO, La2O3, CeO2, ThO2, Nd2O3, U2O3, SumTrOx, PrctTrOx)\nVALUES"
startStatement = insertStatement

with open(filename, 'r') as csvfile:
    datareader = csv.reader(csvfile)
    for row in datareader:
        insertValues = "("
        for column in row:
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