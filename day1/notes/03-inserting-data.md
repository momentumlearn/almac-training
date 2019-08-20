## Inserting data

### The `INSERT INTO` command

The `INSERT INTO` command adds rows to an existing database table. Some examples:

```sql
INSERT INTO students (name, email, graduated, cohort) VALUES ('Charlie', 'charlie@example.org', 1, 1);
INSERT INTO students (name, email, cohort) VALUES ('Harper', 'harper@example.org', 12);
INSERT INTO students (name, cohort, financial_aid) VALUES ('Kelly', 12, 1000);
```

The `INSERT INTO` command takes a table name, a set of columns, the keyword `VALUES`, and a set of values to insert into the specified set of columns.

### Other ways to insert data

If you have bulk data in a text or CSV file, you can add it using the [SQL*Loader tool](https://docs.oracle.com/cd/B19306_01/server.102/b14215/ldr_concepts.htm) that comes with Oracle. You can also insert data from most programming languages.

### References

* [`INSERT` syntax](https://docs.oracle.com/cd/B19306_01/server.102/b14200/statements_9014.htm#i2163698)
