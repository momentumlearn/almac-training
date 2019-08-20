# Indexes

Indexes are used to speed up querying data from the database. They operate in a similar fashion to an index in a book -- imagine a list of unique values from one or more columns, each with a set of row ids that match those values. Database indexes are more complex than this, but this mental model can help you understand them.

Indexes are automatically added when you make a column unique or when you create a foreign key.

To create more indexes, use the `CREATE INDEX` command. An example:

```sql
CREATE INDEX idx_movies_title ON movies (title);
```

Indexes can be created on multiple columns as well:

```sql
CREATE INDEX idx_movies_budget_revenue ON movies (budget_in_millions, revenue_in_millions);
```

Functions can be used when creating indexes. The `LOWER()` function is commonly used when you want to run case-insensitive searches on a column:

```sql
CREATE INDEX idx_movies_lower_title ON movies (LOWER(title));
```

Note: while indexes can speed up reading, you do not want to overuse them. Not only do they take up disk space, but they also slow down writing into the database.

## Index types

The default type of index created by Oracle is a _b-tree index_. This index works by putting each value into a tree structure, and searching the tree using a binary search. You do not have to do anything special to make a b-tree index.

Another index type is the _bitmap index_. This index is useful if a column contains only a very limited amount of distinct values. It works by making a table-like structure, with the row id as a column and each distinct value as a boolean column.

An example of a set of articles with a status of 'draft' or 'published':

| rowid | draft | published |
| :---: | :---: | :-------: |
| post1 |   0   |     1     |
| post2 |   1   |     0     |
| post3 |   0   |     1     |
| post4 |   0   |     1     |

You can see the boolean values as 0s and 1s in this table.

To create a bitmap index, add the `BITMAP` keyword to the `CREATE INDEX` statement:

```sql
CREATE BITMAP INDEX idx_books_collection ON books (collection_id);
```

## What should I index?

If you use a column (or a calculation) in a `WHERE` query often, you want to index it. If you join on a column, you want to index that.

## Nullable columns

Oracle will not index a nullable column by default. To index it, add a constant to the index.

```sql
CREATE INDEX idx_movies_studio ON movies (studio_id, '1');
```

## References

- Determine indexes for library tables and movie tables.

## References

* [`CREATE INDEX` from the Oracle documentation](https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/CREATE-INDEX.html#GUID-1F89BBC0-825F-4215-AF71-7588E31D8BFE)
* [Oracle SQL Indexes - The Definitive Guide](https://www.databasestar.com/oracle-sql-indexes/)
