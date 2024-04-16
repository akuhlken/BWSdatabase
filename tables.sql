-- Researcher table(s):




-- Sample table:




-- Photo table:




-- SamplePhoto table:




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