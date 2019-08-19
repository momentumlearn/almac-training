# Databases, tables, rows, and columns

## Terminology

* _schema_: a logical storage area for data collected into tables
* _tablespaces_: a physical storage area on disk for data
* _table_: a named collection of records, all with the same structure defined
  by columns.
* _row_: a record in a table that represents all the data that takes to
  describe the entity stored in the table.
* _column_: a field in a table that all records will have. Columns have a name
  and a type.
* _primary key_: a unique id that identifies a single row in a table. This
  will usually be an auto-incrementing number called `id`, although that is
  not a requirement of the database.
* _SQL_: Structured Query Language. A _declarative_ programming language for
  defining databases and extracting and manipulating information from them.
  
## Setting up Oracle

To set up a new user and schema, you'll need to run several commands as an administrator. For all the below examples, `user` is whatever username you want.

1. `CREATE USER user IDENTIFIED BY password;`
2. `GRANT CONNECT, RESOURCE, DBA TO user;`
3. `GRANT UNLIMITED TABLESPACE TO user;`

**Important note:** This grants the user complete privileges on the database. Your DBA will likely grant you a limited set of privileges.

## Resources

* [Oracle blog article on managing users](https://blogs.oracle.com/sql/how-to-create-users-grant-them-privileges-and-remove-them-in-oracle-database)

