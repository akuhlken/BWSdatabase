--Where can I find samples between ___ and ___ depth in the studied sites?
CREATE PROCEDURE GetAllSamplesBetweenDepths (low Decimal(6,2), high Decimal(6,2))
    SELECT *
    FROM Sample
    WHERE Depth > low AND Depth < high;

--Who collected data at sites in ____?
CREATE PROCEDURE GetAllResearchersFromSite (siteID VARCHAR(8))
    SELECT Researcher.Name
    FROM Researcher
    INNER JOIN Sample ON Researcher.ID = Sample.ResearcherID
    INNER JOIN Outcrop ON Sample.OutcropID = Outcrop.ID
    WHERE Outcrop.ID = siteID;

--What year(s) was ___ person doing research?

CREATE PROCEDURE GetResearchersYear (name VARCHAR(64))
    SELECT Researcher.Name, Researcher.Year
    FROM Researcher
    WHERE Researcher.Name = name;

--What is the relative age of ___ and ___ outcrops?
--What samples from each outcrop come from the Ice Harbor basalt flow?
--How much ____ chemical was in a basalt sample from a particular outcrop?

CREATE PROCEDURE GetChemicalFromSample (IN chemicalName VARCHAR(20), IN outcropName)
    SELECT Researcher.Name, Researcher.Year
    FROM Researcher
    WHERE Researcher.Name = name;