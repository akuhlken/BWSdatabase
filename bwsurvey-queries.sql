USE bwsurvey;
DROP PROCEDURE IF EXISTS GetAllSamplesBetweenDepths;
DROP PROCEDURE IF EXISTS GetAllResearchersFromSite;
DROP PROCEDURE IF EXISTS GetGradYearOfResearcher;
DROP PROCEDURE IF EXISTS GetResearchersFromGradYear;
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
    SELECT DISTINCT Researcher.Name
    FROM Researcher
    INNER JOIN Sample ON Researcher.ID = Sample.ResearcherID
    INNER JOIN Outcrop ON Sample.OutcropID = Outcrop.ID
    WHERE Outcrop.ID = siteID;

-- What was the grad year of a researcher?

CREATE PROCEDURE GetGradYearOfResearcher(IN name VARCHAR(64))
    SELECT Researcher.Name, Researcher.GradYear
    FROM Researcher
    WHERE Researcher.Name = name;

-- What were all of the researchers that share the same grade year ?

CREATE PROCEDURE GetResearchersFromGradYear (IN year INT)
    SELECT Researcher.GradYear, Researcher.Name
    FROM Researcher
    WHERE Researcher.GradYear = year;

-- How much ____ chemical was in a basalt sample from a particular outcrop?

DELIMITER //

CREATE PROCEDURE GetAllChemicalsFromSample (IN chemicalName VARCHAR(20), IN outcropID VARCHAR(8))
BEGIN
    DECLARE outcropID_var VARCHAR(8);
    SET outcropID_var = outcropID;
    SET @sql = CONCAT('SELECT SampleChemData.', chemicalName, ' AS ', chemicalName, 
                      ' FROM SampleChemData
                        INNER JOIN Sample ON Sample.Name = SampleChemData.SampleID
                        INNER JOIN Outcrop on Outcrop.ID = Sample.OutcropID
                        WHERE Outcrop.ID = ''', outcropID_var, '''');
    PREPARE statement FROM @sql;
    EXECUTE statement;
    DEALLOCATE PREPARE statement;
END//

DELIMITER ;

-- What photo is associated to a certain sample?
CREATE PROCEDURE GetPhotosFromSample (IN sampleID INT UNSIGNED)
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
    WHERE Sample.OutcropID = outcropID AND Sample.layerNumber = layerNumber;

DELIMITER //
CREATE FUNCTION CountSamplesUnderDepth (depth DECIMAL(6,2))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE count_result INT;
    SELECT COUNT(*) INTO count_result
    FROM Sample 
    WHERE Sample.Depth < depth;
    RETURN count_result;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertPhotoThatHasASample (
    IN photoID INT UNSIGNED,
    IN type VARCHAR(64),
    IN date DATE,
    IN time TIME,
    IN imageLink VARCHAR(128),
    IN sampleID INT UNSIGNED
)
BEGIN
    INSERT INTO Photo (ID, Type, Date, Time, ImageLink)
    VALUES (photoID, type, date, time, imageLink);

    INSERT INTO SamplePhoto (sampleID, photoID)
    VALUES (sampleID, photoID);
END//
DELIMITER ;
-- Find all photos that aren't linked to a sample or outcrop