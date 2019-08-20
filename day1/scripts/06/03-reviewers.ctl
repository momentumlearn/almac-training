LOAD DATA
INFILE reviewers.csv
BADFILE reviewers.bad
INTO TABLE reviewers REPLACE
FIELDS TERMINATED BY ','
(
    id,
    username,
    birthdate DATE 'YYYY-MM-DD',
    country_id,
    credits  
)
