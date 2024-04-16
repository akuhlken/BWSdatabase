-- Researcher table(s):




-- Sample table:




-- Photo table:




-- SamplePhoto table:




-- SampleChemData table:




-- Outcrop table:




-- StratLayer table:
CREATE TABLE StratLayer (
    OutcropID INT UNSIGNED,
    LayerNumber INT UNSIGNED,
    Description varchar(100) NOT NULL,
    TopDepth INT NOT NULL,
    BottomDepth INT NOT NULL,
    PRIMARY KEY (OutcropID, LayerNumber),
    FOREIGN KEY (OutcropID) REFERENCES Outcrop(ID), 
);