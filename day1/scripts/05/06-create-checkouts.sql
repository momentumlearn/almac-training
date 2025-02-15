CREATE TABLE checkouts (
  id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
  book_id NUMBER NOT NULL REFERENCES books(id),
  patron_id NUMBER NOT NULL REFERENCES patrons(id),
  checked_out_at TIMESTAMP NOT NULL,
  checked_in_at TIMESTAMP
)
