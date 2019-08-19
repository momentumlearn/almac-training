# Normalization

When we create databases, we need to design them in a way that eliminates redundancy and the possibility of errors. To illustrate, let's use an example of some flat data. Imagine we have a spreadsheet of patients and their immunizations.

|       name       |        immunizations        |        immunization_dates        |  birthday  |  home_phone  |  work_phone  |    employer    |
| :--------------: | :-------------------------: | :------------------------------: | :--------: | :----------: | :----------: | :------------: |
|  Chase Fuentes   |  Influenza,TDAP,Influenza   | 2017-11-05,2017-11-05,2018-10-22 | 1982-07-15 | 919-555-1111 | 919-555-1112 | Solutions Inc  |
| Ariel Washington | Influenza,MMR,Meningococcal | 2018-10-30,2019-02-12,2019-02-12 | 1978-04-09 | 919-555-2111 | 919-555-2112 | JRT Consulting |
|     Sage Kim     |       TDAP,Influenza        |      2015-09-04,2018-06-01       | 1969-03-15 | 999-555-3111 | 919-555-1112 | Solutions Inc  |
|     Sage Kim     |          Influenza          |            2017-12-02            | 1994-07-20 | 999-555-4111 | 919-555-3112 |  PK Catering   |


There are some issues we can immediately see here. One is the lack of any enforcement that the number of immunizations and number of immunization dates is the same. We can start to fix this by _normalizing_ the data.

## First normal form (1NF)

The rules of first normal form are:

* Only one value per table cell
* Each record in the table is unique
* No repeating columns

First, let's get rid of the multiple values in each cell.

| name  | immunization1 | immunization_date1 | immunization2 | immunization_date2 | immunization3 | immunization_date3 | birthday | home_phone | work_phone | employer |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |
| :---: | :-----------: | :----------------: | :-----------: | :----------------: | :-----------: | :----------------: | :------: | :--------: | :--------: | :------: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: ||
|  Chase Fuentes   |   Influenza   |     2017-11-05     |     TDAP      |     2017-11-05     |   Influenza   |     2018-10-22     | 1982-07-15 | 919-555-1111 | 919-555-1112 | Solutions Inc  |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |
| Ariel Washington |   Influenza   |     2018-10-30     |      MMR      |     2019-02-12     | Meningococcal |     2019-02-12     | 1978-04-09 | 919-555-2111 | 919-555-2112 | JRT Consulting |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |
|     Sage Kim     |     TDAP      |     2015-09-04     |   Influenza   |     2018-06-01     |               |                    | 1969-03-15 | 999-555-3111 | 919-555-1112 | Solutions Inc  |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |
|     Sage Kim     |   Influenza   |     2017-12-02     |               |                    |               |                    | 1994-07-20 | 999-555-4111 | 919-555-3112 |  PK Catering   |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |

There's an obvious problem here: if a patient has more than three immunizations, we have to add more columns to the table. We need to break these into multiple tables in order to handle any number of immunizations.

**patients**

|       name       |  birthday  |  home_phone  |  work_phone  |    employer    |
| :--------------: | :--------: | :----------: | :----------: | :------------: |
|  Chase Fuentes   | 1982-07-15 | 919-555-1111 | 919-555-1112 | Solutions Inc  |
| Ariel Washington | 1978-04-09 | 919-555-2111 | 919-555-2112 | JRT Consulting |
|     Sage Kim     | 1969-03-15 | 999-555-3111 | 919-555-1112 | Solutions Inc  |
|     Sage Kim     | 1994-07-20 | 999-555-4111 | 919-555-3112 |  PK Catering   |

**immunizations**

|       name       |  birthday  | immunization  | immunization_date |
| :--------------: | :--------: | :-----------: | :---------------: |
|  Chase Fuentes   | 1982-07-15 |   Influenza   |    2017-11-05     |
|  Chase Fuentes   | 1982-07-15 |     TDAP      |    2017-11-05     |
|  Chase Fuentes   | 1982-07-15 |   Influenza   |    2018-10-22     |
| Ariel Washington | 1978-04-09 |   Influenza   |    2018-10-30     |
| Ariel Washington | 1978-04-09 |      MMR      |    2019-02-12     |
| Ariel Washington | 1978-04-09 | Meningococcal |    2019-02-12     |
|     Sage Kim     | 1969-03-15 |     TDAP      |    2015-09-04     |
|     Sage Kim     | 1969-03-15 |   Influenza   |    2018-06-01     |
|     Sage Kim     | 1994-07-20 |   Influenza   |    2017-12-02     |

By the same logic, we may want to break out the phone numbers from the patients and have a phone_numbers table.

**phone_numbers**

|       name       |  birthday  |    phone     | phone_type |
| :--------------: | :--------: | :----------: | :--------: |
|  Chase Fuentes   | 1982-07-15 | 919-555-1111 |    home    |
|  Chase Fuentes   | 1982-07-15 | 919-555-1112 |    work    |
| Ariel Washington | 1978-04-09 | 919-555-2111 |    home    |
| Ariel Washington | 1978-04-09 | 919-555-2112 |    work    |
|     Sage Kim     | 1969-03-15 | 999-555-3111 |    home    |
|     Sage Kim     | 1969-03-15 | 919-555-1112 |    work    |
|     Sage Kim     | 1994-07-20 | 999-555-4111 |    home    |
|     Sage Kim     | 1994-07-20 | 919-555-3112 |    work    |

This still presents a lot of issues. One of the biggest ones is that it takes two columns (name and birthday) to uniquely identify patients. In order to get a record of a specific immunization for a specific patient, we need four columns (name, birthday, immunization, immunization_date).

What we need is a unique value (or _key_) on each row.

## Second Normal Form (2NF) and Primary Keys

A _primary key_ is a unique, required value on each row of a table that allows us to identify that row. There are two kinds of primary keys: _natural primary keys_ and _artificial primary keys_. Natural primary keys are keys that are part of the row data. There are not many of these that are unique. Social Security numbers and email addresses are two examples. However, these can change, and so we recommend an artificial primary key. An artificial primary key is one generated from the database that has no relationship to the row data.

Right now, we have _composite keys_ -- multiple columns that can uniquely identify a row.

For a table to be in 2NF, it needs to be in 1NF and have a one-column primary key.

**patients**

|  id   |       name       |  birthday  |    employer    |
| :---: | :--------------: | :--------: | :------------: |
|   1   |  Chase Fuentes   | 1982-07-15 | Solutions Inc  |
|   2   | Ariel Washington | 1978-04-09 | JRT Consulting |
|   3   |     Sage Kim     | 1969-03-15 | Solutions Inc  |
|   4   |     Sage Kim     | 1994-07-20 |  PK Catering   |

**immunizations**

|  id   | patient_id | immunization  | immunization\_date |
| :---: | :--------: | :-----------: | :----------------: |
|   1   |     1      |   Influenza   |     2017-11-05     |
|   2   |     1      |     TDAP      |     2017-11-05     |
|   3   |     1      |   Influenza   |     2018-10-22     |
|   4   |     2      |   Influenza   |     2018-10-30     |
|   5   |     2      |      MMR      |     2019-02-12     |
|   6   |     2      | Meningococcal |     2019-02-12     |
|   7   |     3      |     TDAP      |     2015-09-04     |
|   8   |     3      |   Influenza   |     2018-06-01     |
|   9   |     4      |   Influenza   |     2017-12-02     |

**phone_numbers**

|  id   | patient_id |    phone     | phone_type |
| :---: | :--------: | :----------: | :--------: |
|   1   |     1      | 919-555-1111 |    home    |
|   2   |     1      | 919-555-1112 |    work    |
|   3   |     2      | 919-555-2111 |    home    |
|   4   |     2      | 919-555-2112 |    work    |
|   5   |     3      | 999-555-3111 |    home    |
|   6   |     3      | 919-555-1112 |    work    |
|   7   |     4      | 999-555-4111 |    home    |
|   8   |     4      | 919-555-3112 |    work    |

## Third Normal Form (3NF) and Transitive Dependencies

Imagine we have more patient data we haven't yet seen -- specifically, the patient's insurance and co-pay.

**patients**

|  id   |       name       |  birthday  |    employer    | insurance | copay |
| :---: | :--------------: | :--------: | :------------: | :-------: | :---: |
|   1   |  Chase Fuentes   | 1982-07-15 | Solutions Inc  |  MedNow   |  10   |
|   2   | Ariel Washington | 1978-04-09 | JRT Consulting | Blue Star |  15   |
|   3   |     Sage Kim     | 1969-03-15 | Solutions Inc  |  MedNow   |  10   |
|   4   |     Sage Kim     | 1994-07-20 |  PK Catering   |  Viable   |  20   |

If a patient changes insurance companies, their co-pay may change. This introduces what is known as a _transitive dependency_. A transitive dependency is when a column in a table depends on another column that is not the primary key. The usual solution is to break out the dependent columns into another table.

**patients**

|  id   |       name       |  birthday  |    employer    | insurance_id |
| :---: | :--------------: | :--------: | :------------: | :----------: |
|   1   |  Chase Fuentes   | 1982-07-15 | Solutions Inc  |      1       |
|   2   | Ariel Washington | 1978-04-09 | JRT Consulting |      2       |
|   3   |     Sage Kim     | 1969-03-15 | Solutions Inc  |      1       |
|   4   |     Sage Kim     | 1994-07-20 |  PK Catering   |      3       |

**insurances**

|  id   |   name    | copay |
| :---: | :-------: | :---: |
|   1   |  MedNow   |  10   |
|   2   | Blue Star |  15   |
|   3   |  Viable   |  20   |

And now our database is normalized. By doing this, we've eliminated errors and inconsistencies that can happen when data is inserted, updated, and removed, and made it easier to extend our tables.

## References

* [An introduction to database normalization](http://phlonx.com/resources/nf3/)
* [Guru99 on Database Normalization](https://www.guru99.com/database-normalization.html)
