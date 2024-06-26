-- Bedrock weatering survey database project
-- Contributers: Andrew Kuhlken, Coden Stark, Luca Viarengo
-- This SQL file creates the tables structure, entities, and relationships
USE bwsurvey;
DROP TABLE IF EXISTS Researcher;
DROP TABLE IF EXISTS Sample;
DROP TABLE IF EXISTS SamplePhoto;
DROP TABLE IF EXISTS SampleChemData;
DROP TABLE IF EXISTS Outcrop;
DROP TABLE IF EXISTS Photo;
DROP TABLE IF EXISTS StratLayer;

-- Researcher table:
CREATE TABLE Researcher (
    ID INT UNSIGNED,
    Name VARCHAR(64) NOT NULL,
    GradYear YEAR,
    FirstAdvisor INT UNSIGNED,
    SecondAdvisor INT UNSIGNED,
    PRIMARY KEY (ID),
    FOREIGN KEY (FirstAdvisor) references Researcher(ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (SecondAdvisor) references Researcher(ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Sample table:
CREATE TABLE Sample (
    ID INT UNSIGNED PRIMARY KEY,
    Name VARCHAR(20),
    OutcropID VARCHAR(8) NOT NULL,
    ResearcherID INT UNSIGNED NOT NULL,
    Type VARCHAR(16) NOT NULL,
    Depth Decimal(6,2) NOT NULL,
    Description VARCHAR(500) NOT NULL,
    Color VARCHAR(25),
    Date DATE NOT NULL,
    CoarseFraction INT,
    FineFraction INT,
    LayerNumber INT UNSIGNED,
    FOREIGN KEY (OutcropID) REFERENCES Outcrop(ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (ResearcherID) REFERENCES Researcher(ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Photo table:
CREATE TABLE Photo (
    ID INT UNSIGNED,
    Type VARCHAR(64) NOT NULL CHECK (Type IN ('outcrop', 'thin section', 'field', 'lab')),
    Date DATE,
    Time TIME,
    ImageLink VARCHAR(128) NOT NULL,
    PRIMARY KEY (ID)
);


-- SamplePhoto table:
CREATE TABLE SamplePhoto (
    SampleID INT UNSIGNED,
    PhotoID INT UNSIGNED,
    PRIMARY KEY (PhotoID, SampleID),
    FOREIGN KEY (PhotoID) references Photo(ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (SampleID) references Sample(ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);


-- SampleChemData table:
CREATE TABLE SampleChemData (
    TestNum INT UNSIGNED,
    SampleID VARCHAR(12) NOT NULL,
    LabID VARCHAR(20) NOT NULL,
    Date DATE NOT NULL,
    SiO2 FLOAT NOT NULL,
    TiO2 FLOAT NOT NULL,
    Al2O3 FLOAT NOT NULL,
    FeO FLOAT NOT NULL,
    MnO FLOAT NOT NULL,
    MgO FLOAT NOT NULL, 
    CaO FLOAT NOT NULL,
    Na2O FLOAT NOT NULL,
    K2O FLOAT NOT NULL,
    P2O5 FLOAT NOT NULL,
    Sum FLOAT NOT NULL,
    LOI FLOAT NOT NULL,
    SiO2n FLOAT NOT NULL,
    TiO2n FLOAT NOT NULL,
    Al2O3n FLOAT NOT NULL, 
    FeOn FLOAT NOT NULL,
    MnOn FLOAT NOT NULL,
    MgOn FLOAT NOT NULL, 
    CaOn FLOAT NOT NULL,
    Na2On FLOAT NOT NULL,
    K2On FLOAT NOT NULL,
    P2O5n FLOAT NOT NULL,
    Ni INT NOT NULL,
    Cr INT NOT NULL,
    Sc INT NOT NULL,
    V INT NOT NULL, 
    Ba INT NOT NULL, 
    Rb INT NOT NULL, 
    Sr INT NOT NULL, 
    Zr INT NOT NULL,
    Y INT NOT NULL,
    Nb INT NOT NULL,
    Ga INT NOT NULL,
    Cu INT NOT NULL,
    Zn INT NOT NULL,
    Pb INT NOT NULL,
    La INT NOT NULL,
    Ce INT NOT NULL,
    Th INT NOT NULL,
    Nd INT NOT NULL,
    U INT NOT NULL,
    SumTr INT NOT NULL,
    PrctTr FLOAT NOT NULL,
    MinPlusTr FLOAT NOT NULL,
    MajPlusTrOx FLOAT NOT NULL,
    w_LOI FLOAT NOT NULL,
    IfFerric FLOAT NOT NULL,
    NiO FLOAT NOT NULL,
    Cr2O3 FLOAT NOT NULL,
    Sc2O3 FLOAT NOT NULL,
    V2O3 FLOAT NOT NULL,
    BaO FLOAT NOT NULL,
    Rb2O FLOAT NOT NULL,
    SrO FLOAT NOT NULL,
    ZrO2 FLOAT NOT NULL,
    Y2O3 FLOAT NOT NULL,
    Nb2O5 FLOAT NOT NULL,
    Ga2O3 FLOAT NOT NULL,
    CuO FLOAT NOT NULL,
    ZnO FLOAT NOT NULL,
    PbO FLOAT NOT NULL,
    La2O3 FLOAT NOT NULL,
    CeO2 FLOAT NOT NULL,
    ThO2 FLOAT NOT NULL,
    Nd2O3 FLOAT NOT NULL,
    U2O3 FLOAT NOT NULL,
    SumTrOx FLOAT NOT NULL,
    PrctTrOx FLOAT NOT NULL,
    PRIMARY KEY(SampleID,TestNum)
);



-- Outcrop table:
CREATE TABLE Outcrop (
    ID VARCHAR(8),
    Description VARCHAR(500) NOT NULL,
    Location POINT NOT NULL,
    3Dmodel VARCHAR(100),
    OrthophotoID INT UNSIGNED,
    PRIMARY KEY (ID),
    FOREIGN KEY (OrthophotoID) REFERENCES Photo(ID) 
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);


-- StratLayer table:
CREATE TABLE StratLayer (
    OutcropID VARCHAR(8),
    LayerNumber INT UNSIGNED,
    Description TEXT NOT NULL,
    TopDepth INT NOT NULL,
    BottomDepth INT NOT NULL,
    PRIMARY KEY (OutcropID, LayerNumber),
    FOREIGN KEY (OutcropID) REFERENCES Outcrop(ID) 
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
