OPTIONS (SKIP=1)
LOAD DATA
INFILE books.tsv
BADFILE books.bad
INTO TABLE books REPLACE
FIELDS TERMINATED BY X'9'
(
  isbn, title, author, publisher, 
  year_published, 
  dewey_decimal, lcc_number, 
  subjects CHAR(4000)
)
