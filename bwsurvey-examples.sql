-- Bedrock weatering survey database project
-- Contriubuters: Andrew Kuhlken, Coden Stark, Luca Viarengo

-- the purpose of each query is explained in the 'bwsurvey-queries.sql'.

USE bwsurvey;

CALL GetAllSamplesBetweenDepths(2.5, 100.5);

CALL GetAllResearchersFromSite("SG6");

CALL GetGradYearOfResearcher("Coden Stark");

CALL GetResearchersFromGradYear(2024);

CALL GetAllChemicalsFromSample("Na2O", "KID1");

CALL GetPhotosFromSample(1);

CALL GetSampleFromStratLayer("SG6", 3);

SELECT CountSamplesUnderDepth(0.0);

CALL InsertPhotoThatHasASample(1000, "lab", "2023-06-23", NULL, "https://drive.google.com/file/d/183ZDIBgYxGDDCrR8kQSZXEY4WBz82086/view?usp=drivesdk", 21);