-- Researcher table(s):
create table Researcher{
    
}



-- Sample table:




-- Photo table:
CREATE TABLE Photo (
   ID INT UNSIGNED AUTO_INCREMENT,
   Type varchar(64) NOT NULL,
   Image VARBINARY(max) NOT NULL UNIQUE,
   Date DATE NOT NULL,
   Time TIME,
   PRIMARY KEY (ID)
);



-- SamplePhoto table:

CREATE TABLE SamplePhoto (
    PhotoID INT UNSIGNED,
    SampleID INT UNSIGNED,
    PRIMARY KEY (PhotoID, SampleID),
    FOREIGN KEY (PhotoID) references Photo(ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (SampleID) references Sample(ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);



-- SampleChemData table:




-- Outcrop table:
CREATE TABLE Outcrop (
    ID INT UNSIGNED AUTO_INCREMENT,
    Name varchar(64) NOT NULL UNIQUE,
    Description VARCHAR(500) NOT NULL,
    Location Point NOT NULL,
    3Dmodel VARCHAR(100),
    OrthophotoID INT UNSIGNED,
    PRIMARY KEY (ID),
    FOREIGN KEY (OrthophotoID) REFERENCES Photo(ID) 
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);



-- StratLayer table: