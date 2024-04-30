# chmod +x runall.sh

mysql < bwsurvey-schema.sql
mysql < bwsurvey-data.sql
mysql < bwsurvey-queries.sql
mysql < bwsurvey-examples.sql
