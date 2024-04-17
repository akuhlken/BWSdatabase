-- Researcher table(s):




-- Sample table:
CREATE TABLE Sample (
    ID INT UNSIGNED PRIMARY KEY,
    OutcropID INT UNSIGNED NOT NULL,
    ResearcherID INT UNSIGNED NOT NULL,
    Type VARCHAR(16) NOT NULL,
    Depth INT NOT NULL,
    Description VARCHAR(500) NOT NULL,
    Color VARCHAR(10),
    Date DATETIME NOT NULL,
    CoarseFraction DECIMAL(5,4),
    FineFraction DECIMAL(5,4),
    LayerNumber INT UNSIGNED,
    FOREIGN KEY (OutcropID) REFERENCES Outcrop(ID),
    FOREIGN KEY (ResearcherID) REFERENCES Researcher(ID)
);

-- Photo table:




-- SamplePhoto table:




-- SampleChemData table:




-- Outcrop table:




-- StratLayer table:
CREATE TABLE StratLayer (
    OutcropID INT UNSIGNED,
    LayerNumber INT UNSIGNED,
    Description VARCHAR(100) NOT NULL,
    TopDepth INT NOT NULL,
    BottomDepth INT NOT NULL,
    PRIMARY KEY (OutcropID, LayerNumber),
    FOREIGN KEY (OutcropID) REFERENCES Outcrop(ID) 
);