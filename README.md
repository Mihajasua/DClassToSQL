# DClassToSQL

How to use the classes:
- create a "DC model"
  `dcmodel := LeaBuildDC new createClassPerson.`
- create a database model from the "DC model"
  `dbmodel := LeaDCtoModelePhysique new classToTable:  dcmodel.`
- generate the SQL code to create tables in the SGBD
  `LeaSQLGenerator new generateTable: dbmodel.`

Or all together:
```st
LeaSQLGenerator new
	generateTable: (LeaDCtoModelePhysique new 
		classToTable: (LeaBuildDC new 
			createClassPerson)).
```
