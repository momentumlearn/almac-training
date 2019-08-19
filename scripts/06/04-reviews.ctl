LOAD DATA
INFILE reviews.csv
BADFILE reviews.bad
INTO TABLE reviews REPLACE
FIELDS TERMINATED BY ','
(
    id,
    reviewer_id,
    movie_id,
    score
)
