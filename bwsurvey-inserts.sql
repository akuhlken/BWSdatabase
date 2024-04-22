-- Bedrock weatering survey database project
-- Contriubuters: Andrew Kuhlken, Coden Stark, Luca Viarengo

-- researcher, sample, photo, samplephoto, samplechemdata, outcrop, stratlayer

INSERT INTO Researcher (Name, GradYear, FirstAdvisor, SecondAdvisor)
VALUES ("Coden Stark", 2024, "Lyman Persico", "Nick Bader"),
       ("Harsh Chopra", 2024, "Nick Bader", "Lyman Persico");


LOAD DATA LOCAL INFILE 'C:/<PATH TO YOUR FILE>/_____.csv' 
INTO TABLE Sample
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS ('Sample ID', 'Date Collected', 'Sample Type', 'Layer', 'Corrected depth (cm)', 'Description', 'Color');

INSERT INTO Sample (ID, OutcropID, ResearcherID, Type, Depth, Description, Date)
VALUES ;


-- join table... don't need?
INSERT INTO SamplePhoto ()
VALUES ;


-- so hard to do...
INSERT INTO SampleChemData ()
VALUES ;


INSERT INTO Outcrop (Name, Description, Location, 3Dmodel)
VALUES ;


INSERT INTO StratLayer (OutcropID, LayerNumber, Description, TopDepth, BottomDepth)
VALUES ;