
// This query creates nodes representing all Parties runnig in the election in Ireland. Loaded in from a .CSV File caled Party.csv.
//For the below query to work, the file path below must be changed to where ever you have the file located. E.g   
// 'file:///Users/scott/Desktop/Party.csv' the location of the file is on my Desktop.

	LOAD CSV FROM 'file:///Users/scott/Desktop/Party.csv' AS line
	CREATE (a: Party {Name: line [0]})