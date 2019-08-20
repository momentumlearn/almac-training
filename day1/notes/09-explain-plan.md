# Seeing a statement's execution plan

Each SQL query that runs in Oracle generates an internal plan of how to execute that query. To get access to that query so you can analyze it for performance, run `EXPLAIN PLAN FOR` before your query.

```sql
EXPLAIN PLAN FOR 
	SELECT movies.title FROM movies 
	INNER JOIN studios ON studios.id = movies.studio_id 
	WHERE studios.name = 'Ruby Mountain Pictures';
```

To see the execution plan, run the following:

```sql
SELECT PLAN_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());
```

Output:

```
PLAN_TABLE_OUTPUT                                                             |
------------------------------------------------------------------------------|
Plan hash value: 1903649382                                                   |
                                                                              |
------------------------------------------------------------------------------|
| Id  | Operation          | Name    | Rows  | Bytes | Cost (%CPU)| Time     ||
------------------------------------------------------------------------------|
|   0 | SELECT STATEMENT   |         |    59 | 12213 |     8   (0)| 00:00:01 ||
|*  1 |  HASH JOIN         |         |    59 | 12213 |     8   (0)| 00:00:01 ||
|*  2 |   TABLE ACCESS FULL| STUDIOS |     1 |    65 |     3   (0)| 00:00:01 ||
|   3 |   TABLE ACCESS FULL| MOVIES  |  1000 |   138K|     5   (0)| 00:00:01 ||
------------------------------------------------------------------------------|
                                                                              |
Predicate Information (identified by operation id):                           |
---------------------------------------------------                           |
                                                                              |
   1 - access("STUDIOS"."ID"="MOVIES"."STUDIO_ID")                            |
   2 - filter("STUDIOS"."NAME"='Ruby Mountain Pictures')                      |
                                                                              |
Note                                                                          |
-----                                                                         |
   - dynamic statistics used: dynamic sampling (level=2)                      |
```

## References

- [Explaining and displaying execution plans](https://docs.oracle.com/en/database/oracle/oracle-database/19/tgsql/generating-and-displaying-execution-plans.html#GUID-60E30B1C-342B-4D71-B154-C26623D6A3B1)
- [`EXPLAIN PLAN`](https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/EXPLAIN-PLAN.html#GUID-FD540872-4ED3-4936-96A2-362539931BA0)
- [Viewing an execution plan in SQL Developer](https://www.databasestar.com/sql-developer-execution-plan/)
