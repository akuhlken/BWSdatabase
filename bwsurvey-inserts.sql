-- Bedrock weatering survey database project
-- Contriubuters: Andrew Kuhlken, Coden Stark, Luca Viarengo

-- researcher, sample, photo, samplephoto, samplechemdata, outcrop, stratlayer

INSERT INTO Researcher (Name)
VALUES ("Lyman Persico"),
       ("Nick Bader");

INSERT INTO Researcher (Name, GradYear, FirstAdvisor, SecondAdvisor)
VALUES ("Coden Stark", 2024, 1, 2),
       ("Harsh Chopra", 2024, 2, 1),
       ("Cameryn Greenough", 2024, 2, 1),
       ("Megan Driggers", 2023, 2, 1);


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



INSERT INTO Outcrop (Name, Description, Location)
VALUES ("SGQ1", "Exposed cliffs of columnar Umatilla basalt along entrance road to Spring Gulch, east of the SG sites. Above the cliff is a field with about a meter of loess, modern soil, and grass. It's a southeast facing hill slope where the cliff wall is unstable/separating from base and there's spheroidally rounded talus beneath. The base of the outcrop has been flattened by people for quarrying purposes.", Point(-118.898303, 46.005325));

INSERT INTO Outcrop (Name, Description, Location, 3Dmodel)
VALUES ("SG6", "Small tributary of Spring Gulch on North Side of Spring Gulch on a south-facing slope. 1st order drainage. Hillslope continuously mantled in thin colluvium with sparse exposures of bedrock. Colluvium ranges in thickness from 30 cm to 80 cm from bottom of site to top. The site is approximately 10 meters from bottom of drainage. Backslope of hillslope; slope shape is linear. Frenchman Springs overlain by Umatilla basalt.", Point(-118.913026, 46.0077), "https://cloud.pix4d.com/dataset/1540228/model?shareToken=b20c98de-6000-41c2-a213-67660ebdbd9c"),
    ("KID1", "Along the Kennewick Main Channel (irrigation canal) in the roadcut (channelcut?). On a northwest facing slope with Pomona, Ice Harbor, and Elephant Mountain basalts. The hillslope below the outcrop is covered in sagebrush and talus slopes of Ice Harbor (?) basalt. In the outcrop, the overlying basalt is likely Ice Harbor, the lower basalt is likely Elephant Mountain, and a soil is present between them.", Point(-119.274435, 46.181069), "https://cloud.pix4d.com/dataset/1555260/model?shareToken=0ed39edc-7a57-420a-a2cb-5b8f9b1d6683"),
    ("MFQ1", "An active quarry south of Milton Freewater, OR. Mapped as a contact between the Umatilla and Frenchman Springs basalts. There's significant modern soil development on top of the Umatilla flow. The site itself is at the north end of the quarry and is found on the west facing slope. The basalt is not very weathered and is largely competent. Beneath the site is a significant slope of talus and other fine sediment.", Point(-118.395846, 45.869212), "https://cloud.pix4d.com/dataset/1544866/model?shareToken=16a8214e-9b75-4b3c-865c-b9372968aa1e"),
    ("GIC1", "Downriver from the Ice Harbor Dam on the east side of the Snake River. Northwest facing hill slope. Solid columnar basalt with significant weathering at surface exposed as a cliff-face. The contact between flows is right above the base of the cliff, although there is a clay-rich layer below the presumed contact that may represent another contact within Ice Harbor flows. The first identified contact appears platy above, with columnar cooked/lithified aggregates below.", Point(-118.913513, 46.241402), "https://cloud.pix4d.com/dataset/1547504/model?shareToken=c8dc2387-3eea-4b96-9c68-524039fb1bb4"),
    ("GIC2", "Downriver from the Ice Harbor Dam, but closer to the dam than GIC1. On the east side of the Snake River. NNW facing hillslope. Outcrop was elevated, at top of slope covered with talus and vegetation. Contact from GIC1 is exposed at about 2 meters above standing point on slope, contact with ash is at about 1.5 meters.", Point(-118.913181, 46.24155), "https://cloud.pix4d.com/dataset/1548806/model?shareToken=5b9ff26c-40f3-4911-9998-0dca47e64161"),
    ("WC1", "Road cut making a WNW hillslope along Webber Canyon road. Modern soil and vegetation above, then overlying basalt (crumbly + unstable fractured), then paleosol with clasts. Basalt below, likely Pomona, is buried in colluvium and angular talus (especially after basalt falls from layer above) with clayey mud below forming a slope towards the road.", Point(-119.457662, 46.185472), "https://cloud.pix4d.com/dataset/1552894/model?shareToken=f3cbe09b-4a2a-4af9-aeae-add5f30da3cd"),
    ("WC2", "Slightly further north than WC1 but along the same roadcut facing WNW. To the left of the site was thick layers of modern carbonate between the modern soil and basalt below. Modern soil with grass and sagebrush is above the outcrop, then crumbly basalt mixed with a finer sediment matrix and roots. Below basalt is a gley colored wavy layer like the smaller area at top of columnar structure layer in WC1. It has clasts and appears to be part of a flame structure maybe. Under the blue is a columnar ped(?) layer before going into Pomona basalt float with finer soil as the matrix. The lowest layer is solid Pomona basalt, and underneath is just talus and finer sediment that slopes down to the road.", Point(-119.457419, 46.185941), "https://cloud.pix4d.com/dataset/1552901/model?shareToken=21005617-a4c3-4d99-9f6b-9184e10156c3"),
    ("WC3", "Opposite hillslope from WC1 and WC2 on the ESE facing hillslope. Slope is mostly covered with colluvium and grass with some exposed Elephant Mountain and Pomona basalts. Site was a contact between EM and Pomona, with both found exposed at the surface of the slope nearby. Apparant soil development between the two flows when colluvium was cleared away.", Point(-119.458592, 46.185901), "https://cloud.pix4d.com/dataset/1554158/model?shareToken=1a9c4780-0dc4-4362-8593-24d196fcfbdd"),
    ("IHD1", "On northwest facing slope on a cliff to the northeast of the Ice Harbor dam and the Indian Monument. Along the Snake River, the outcrop is NE of the Goose Island Cliff (GIC) sites. The cliff itself can be access via a roadgrade that decends from the Indian Monument parking area and consists of cliffs of columnar and more rubbly basalt (the top cliff with a radial structure on southern end that's interpreted to be a lava tube), colluvium, loess, and vegetation. The outcrop is immediately below the top set of columnar basal and is a long vertical trench that reaches down to the basalt below.", Point(-118.8755, 46.246063), "https://cloud.pix4d.com/dataset/1560657/model?shareToken=52b4ff24-1dac-45fe-acc6-7fbe1ae3f63d"),
    ("TC1", "Southeast facing hillslope. Contact between Grande Ronde basalt flows (N2 and R2) with a modern soil developed on top. While the contact itself is part of a basalt cliff, the outcrop is part of a larger hillslope. Upslope of the outcrop are basalt columns sticking out of the grass (at least 10m above). The outcrop is at the base of a drainage from the slope above, and the upper surface of the upper basalt tilts downward to the left (toward the drainage). There's a very thin modern soil directly above the upper basalt with lots of grass. Below the top flow is red rubbly vesicular basalt facies. The lower basalt is very vesicular and fractured.", Point(-118.046308, 45.982907), "https://cloud.pix4d.com/dataset/1564700/model?shareToken=9e7d8756-e91d-4b26-92d1-f214257211c2"),
    ("TC2", "An outcrop showing the development of a modern soil on top of the Grande Ronde basalts. It's at a bend on the road with another road diverting off just below. The outcrop is on a west facing hillslope/roadcut with shurbs and grass in a variably thick soil above basalt. The soil had lots of roots and is above spheroidally weathered basalt clasts. Buried in the talus and fine grained weathered basalt is more basalt that is crumbly and more priable(?) than what it's below. The outcrop is about 2 meters above the road surface and is near the top of the sloped surface.", Point(-118.016742, 45.942744), "https://cloud.pix4d.com/dataset/1564758/model?shareToken=a9b84936-4717-463f-a41b-b25e68224b1e"),
    ("BM1", "Basalt cliffs exposed in a roadcut along the road to Jubilee Lake. Down the road from the outlook/pull out where Dylan worked on BM2. It's a south facing hillslope with a contact between the upper Lookingglass Basalt (rubbly and columnar) and the lower Grande Ronde N2 (vesicular and fractured). Between the two basalt flows is a very red layer with core stones and paleosoil. Above the upper Lookingglass basalt is a shallow slope with grass and shrubs. Below the outcrop is a talus pile with basalt clasts of various sizes. The Frenchman Springs basalt is also visible on the same hillslope, exposed near the top of the slope to the right of the outcrop.", Point(-118.046241, 45.775223), "https://cloud.pix4d.com/dataset/1566671/model?shareToken=5a4804b0-423e-4da5-9b06-7f88eb21dfdb"),
    ("WEH1", "On old paved road off of Oregon HW 204, the Weston-Elgin Highway. The contact between Grande Ronde N2 (lower) and Lookingglass (upper) is exposed in a roadcut along the highway, but is closer to road level (about 2 meters up) around the corner in the outcrop. Between the two basalt layers is a very red layer with vesicular basalt and red clay-y to more solid material. The Lookingglass is unburied and visible all along the roadcut, but the contact and lower N2 basalt was mostly buried. Below the outcrop is a mix of fine grained sediment and basalt talus. It's a southeast facing hillslope.", Point(-118.119597, 45.787658), "https://cloud.pix4d.com/dataset/1568965/model?shareToken=bab13421-5184-4829-9484-b88aa678391f");


LOAD DATA LOCAL INFILE "C:\Users\coden\Downloads\Outcrop(Sheet1).csv" 
INTO TABLE Outcrop
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS ('Name', 'Description', 'Location', '3Dmodel', 'Orthophoto');


INSERT INTO StratLayer (OutcropID, LayerNumber, Description, TopDepth, BottomDepth)
VALUES ;
