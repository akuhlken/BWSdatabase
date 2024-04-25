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

--How much ____ chemical was in a basalt sample from a particular outcrop?

CREATE PROCEDURE GetAllChemicalsFromSample (IN chemicalName VARCHAR(20), IN outcropID VARCAHR(8))
    SELECT SampleChemData.chemicalName
    FROM SampleChemData
    INNER JOIN Sample ON Sample.ID = SampleChemData.SampleID
    INNER JOIN Outcrop on Outcrop.ID = Sample.OutcropID
    WHERE Outcrop.ID = outcropID;

-- What photo is associated to a certain sample?
CREATE PROCEDURE GetPhotosFromSample (IN sampleID VARCHAR(20))
    SELECT Photo.ImageLink
    FROM Photo
    INNER JOIN SamplePhoto ON SamplePhoto.ID = Photo.ID
    INNER JOIN Sample on Outcrop.ID = Sample.OutcropID
    WHERE Outcrop.ID = outcropID;
-- Sample from stat layer