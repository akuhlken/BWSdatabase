USE bwsurvey;
DROP PROCEDURE IF EXISTS GetAllSamplesBetweenDepths;
DROP PROCEDURE IF EXISTS GetAllResearchersFromSite;
DROP PROCEDURE IF EXISTS GetResearchersYear;
DROP PROCEDURE IF EXISTS GetAllChemicalsFromSample;
DROP PROCEDURE IF EXISTS GetPhotosFromSample;
DROP PROCEDURE IF EXISTS GetSampleFromStratLayer;
DROP PROCEDURE IF EXISTS InsertPhotoThatHasASample;
DROP FUNCTION IF EXISTS CountSamplesUnderDepth;

-- Where can I find samples between ___ and ___ depth in the studied sites?
CREATE PROCEDURE GetAllSamplesBetweenDepths (IN low Decimal(6,2), IN high Decimal(6,2))
    SELECT *
    FROM Sample
    WHERE Depth > low AND Depth < high;

-- Who collected data at sites in ____?
CREATE PROCEDURE GetAllResearchersFromSite (IN siteID VARCHAR(8))
    SELECT Researcher.Name
    FROM Researcher
    INNER JOIN Sample ON Researcher.ID = Sample.ResearcherID
    INNER JOIN Outcrop ON Sample.OutcropID = Outcrop.ID
    WHERE Outcrop.ID = siteID;

-- What year(s) was ___ person doing research?

CREATE PROCEDURE GetResearchersYear (IN name VARCHAR(64))
    SELECT Researcher.Name, Researcher.Year
    FROM Researcher
    WHERE Researcher.Name = name;

-- How much ____ chemical was in a basalt sample from a particular outcrop?

CREATE PROCEDURE GetAllChemicalsFromSample (IN chemicalName VARCHAR(20), IN outcropID VARCHAR(8))
    SELECT SampleChemData.chemicalName
    FROM SampleChemData
    INNER JOIN Sample ON Sample.ID = SampleChemData.SampleID
    INNER JOIN Outcrop on Outcrop.ID = Sample.OutcropID
    WHERE Outcrop.ID = outcropID;

-- What photo is associated to a certain sample?
CREATE PROCEDURE GetPhotosFromSample (IN sampleID INT)
    SELECT Photo.ImageLink
    FROM Photo
    INNER JOIN SamplePhoto ON SamplePhoto.PhotoID = Photo.ID
    INNER JOIN Sample on Sample.ID = SamplePhoto.SampleID
    WHERE Sample.ID = sampleID;

-- Sample from strat layer
CREATE PROCEDURE GetSampleFromStratLayer (IN outcropID VARCHAR(8), IN layerNumber INT UNSIGNED)
    SELECT Sample.*
    FROM Sample
    INNER JOIN StratLayer ON StratLayer.OutcropID = Sample.OutcropID AND StratLayer.LayerNumber = Sample.LayerNumber
    WHERE Sample.OutcropID = outcropID AND Sample.layerNumber;

-- Where can I find samples between ___ and ___ depth in the studied sites?
CREATE FUNCTION CountSamplesUnderDepth (IN depth Decimal(6,2))
    SELECT Count(*)
    FROM Sample
    WHERE Depth < depth;

-- Insert photo thats associated with a sample
CREATE PROCEDURE InsertPhotoThatHasASample (IN photoID INT UNSIGNED, IN type VARCHAR(64), IN date DATE, IN time TIME, IN imageLink VARCHAR(128), IN sampleID INT UNSIGNED)
   BEGIN
        INSERT INTO Photo (ID, Type, Date, Time, ImageLink)
        VALUES (id, type, date, time, imageLink);

        INSERT INTO SamplePhoto (sampleID, photoID)
        VALUES (sampleID, photoID);
    END;

-- Find all photos that aren't linked to a sample or outcrop