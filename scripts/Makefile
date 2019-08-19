.PHONY: all 02 05

all: 02 05

02:
	sqlplus library/library@localhost:1521/ORCL @02/books-schema.sql
	cd 02 && sqlldr library/library@localhost:1521/ORCL control=books.ctl

05:
	sqlplus library/library@localhost:1521/ORCL @05/01-create-subjects.sql
	sqlplus library/library@localhost:1521/ORCL @05/02-create-authors.sql
	sqlplus library/library@localhost:1521/ORCL @05/03-create-publishers.sql
	sqlplus library/library@localhost:1521/ORCL @05/04-create-patrons.sql
