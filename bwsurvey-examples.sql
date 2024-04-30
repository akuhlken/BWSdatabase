USE bwsurvey;
CALL GetAllSamplesBetweenDepths(2.5, 100.5);
CALL GetAllResearchersFromSite("SG6");
CALL GetGradYearOfResearcher("Coden Stark");
CALL GetResearchersFromGradYear(2024);
CALL GetAllChemicalsFromSample("Na2O", "KID1");
CALL GetPhotosFromSample(1);
CALL GetSampleFromStratLayer("SG6", 3);
SELECT CountSamplesUnderDepth(0.0);