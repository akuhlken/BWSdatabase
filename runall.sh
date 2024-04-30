# chmod +x runall.sh

echo "creatiing tables"
mysql < bwsurvey-schema.sql

echo "inserting data"
mysql < bwsurvey-data.sql

echo "creating queries"
mysql < bwsurvey-queries.sql

echo "calling queries"
mysql < bwsurvey-examples.sql
