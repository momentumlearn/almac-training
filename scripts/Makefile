ORCL_USER ?= training
ORCL_PASS ?= training
ORCL_HOST ?= localhost:1521
ORCL_DB ?= ORCL

.PHONY: all 02 05 06

all: 02 05 06

02:
	sqlplus $(ORCL_USER)/$(ORCL_PASS)@$(ORCL_HOST)/$(ORCL_DB) @02/books-schema.sql
	cd 02 && sqlldr $(ORCL_USER)/$(ORCL_PASS)@$(ORCL_HOST)/$(ORCL_DB) control=books.ctl

05:
	sqlplus $(ORCL_USER)/$(ORCL_PASS)@$(ORCL_HOST)/$(ORCL_DB) @05/01-create-subjects.sql
	sqlplus $(ORCL_USER)/$(ORCL_PASS)@$(ORCL_HOST)/$(ORCL_DB) @05/02-create-authors.sql
	sqlplus $(ORCL_USER)/$(ORCL_PASS)@$(ORCL_HOST)/$(ORCL_DB) @05/03-create-publishers.sql
	sqlplus $(ORCL_USER)/$(ORCL_PASS)@$(ORCL_HOST)/$(ORCL_DB) @05/04-create-patrons.sql
	sqlplus $(ORCL_USER)/$(ORCL_PASS)@$(ORCL_HOST)/$(ORCL_DB) @05/05-create-collections.sql

06:
	sqlplus $(ORCL_USER)/$(ORCL_PASS)@$(ORCL_HOST)/$(ORCL_DB) @06/01-movies-schema.sql
	sqlplus $(ORCL_USER)/$(ORCL_PASS)@$(ORCL_HOST)/$(ORCL_DB) @06/02-movies-data.sql
	cd 06 && sqlldr $(ORCL_USER)/$(ORCL_PASS)@$(ORCL_HOST)/$(ORCL_DB) control=03-reviewers.ctl
	cd 06 && sqlldr $(ORCL_USER)/$(ORCL_PASS)@$(ORCL_HOST)/$(ORCL_DB) control=04-reviews.ctl rows=1000
