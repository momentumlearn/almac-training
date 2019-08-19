.PHONY: all 02 05

all: 02 05

02:
	sqlplus training/training@localhost:1521/ORCL @02/books-schema.sql
	cd 02 && sqlldr training/training@localhost:1521/ORCL control=books.ctl

05:
	sqlplus training/training@localhost:1521/ORCL @05/01-create-subjects.sql
	sqlplus training/training@localhost:1521/ORCL @05/02-create-authors.sql
	sqlplus training/training@localhost:1521/ORCL @05/03-create-publishers.sql
	sqlplus training/training@localhost:1521/ORCL @05/04-create-patrons.sql

06:
	sqlplus training/training@localhost:1521/ORCL @06/01-movies-schema.sql
	sqlplus training/training@localhost:1521/ORCL @06/01-movies-data.sql
	cd 06 && sqlldr training/training@localhost:1521/ORCL control=03-reviewers.ctl
	cd 06 && sqlldr training/training@localhost:1521/ORCL control=04-reviews.ctl rows=1000
