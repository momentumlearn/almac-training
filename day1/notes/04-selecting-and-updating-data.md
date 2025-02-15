## Selecting, updating, and deleting data

### The `SELECT` command

The `SELECT` command is used to retrieve data from a table. In its simplest form, it looks like this:

```sql
SELECT * FROM students;
```

This command will select all columns and all rows from the `students` table.

The columns can be filtered like so:

```sql
SELECT id, name, email FROM students;
```

### Filtering rows with `WHERE`

The `SELECT` command can have a clause starting with `WHERE` to specify conditions used to filter the rows returned. To get only students who have graduated, for example, you can write:

```sql
SELECT * FROM students WHERE graduated = 1;
```

Besides equality, there are the usual operators, like `>`, `>=`, `<`, and `<=`. There are also the operators `IS NULL` and `IS NOT NULL`, which you use instead of the equality operator to see if a field is null or not. Some examples:

```sql
-- Find all the students with no email
SELECT name
  FROM students
 WHERE email IS NULL;

-- Find students with $1000 or more in financial aid
SELECT *
  FROM students
 WHERE financial_aid >= 1000.00;
```

Conditions can be combined with `AND` and `OR` and parentheses can be used to ensure precedence.

```sql
-- Find students that have graduated but have no resumé
SELECT name
  FROM students
 WHERE graduated = 1
   AND resume IS NULL;

-- Find students that have graduated or are in the most recent cohorts
SELECT name, cohort
  FROM students
 WHERE graduated = 1
    OR cohort >= 10;
```

### Sorting with `ORDER BY`

The `ORDER BY` clause is used to sort the returned rows from `SELECT`. It takes one or more columns as arguments, optionally suffixed with `DESC` to specify descending order.

```sql
-- Students from least financial aid to most
  SELECT name
       , financial_aid
    FROM students
ORDER BY financial_aid;

-- Students from most financial aid to least
  SELECT name
       , financial_aid
    FROM students
ORDER BY financial_aid DESC;

-- Get rid of the nulls
  SELECT name
       , financial_aid
    FROM students
   WHERE financial_aid IS NOT NULL
ORDER BY financial_aid DESC;
```

### `FETCH FIRST` and `OFFSET`

The `FETCH FIRST` clause can be used to limit the number of rows that are returned from a `SELECT`. The `OFFSET` clause is used to skip a number of rows.

```sql
-- Get the top 5 students receiving financial aid
  SELECT name
       , financial_aid
    FROM students
   WHERE financial_aid IS NOT NULL
ORDER BY financial_aid DESC
   FETCH FIRST 5 ROWS ONLY;

-- Get the students 6-10
  SELECT name
       , financial_aid
    FROM students
   WHERE financial_aid IS NOT NULL
ORDER BY financial_aid DESC   
  OFFSET 5
  FETCH NEXT 5 ROWS ONLY;   
```

### Updating data with `UPDATE`

The `UPDATE` command updates data in a table. By default, all rows are updated, which is usually not what you want. To prevent this, use a `WHERE` clause to limit the rows affected.

```sql
-- Graduate cohort 11.
UPDATE students
   SET graduated = 1
 WHERE cohort = 11;
```

### Deleting data with `DELETE`

Like `UPDATE`, `DELETE` affects all rows. Use a `WHERE` clause to limit the rows affected.

```sql
-- Delete all students without an email.
DELETE FROM students
      WHERE email IS NULL;
```

### References

* [`SELECT` - Oracle DB Reference](https://docs.oracle.com/cd/B19306_01/server.102/b14200/statements_10002.htm#i2065646)
* [`UPDATE` - Oracle DB Reference](https://docs.oracle.com/cd/B19306_01/server.102/b14200/statements_10007.htm#i2067715)
* [`DELETE` - Oracle DB Reference](https://docs.oracle.com/cd/B19306_01/server.102/b14200/statements_8005.htm#i2117787)
