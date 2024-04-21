-- Bedrock weatering survey database project
-- Contriubuters: Andrew Kuhlken, Coden Stark, Luca Viarengo

-- researcher, sample, photo, samplephoto, samplechemdata, outcrop, stratlayer

INSERT INTO Researcher (Name, GradYear, FirstAdvisor, SecondAdvisor)
VALUES ("Coden Stark", 2024, "Lyman Persico", "Nick Bader"),
       ("Harsh Chopra", 2024, "Nick Bader", "Lyman Persico");


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