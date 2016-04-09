// This query creates nodes representing all constituencies and available seats in Ireland. Loaded in from a .CSV File
//For the below query to work, the file path below must be changed to where ever you have the file located. E.g   
// 'file:///Users/scott/Desktop/Constituencies.csv' the location of the file is on my Desktop.

	LOAD CSV FROM 'file:///Users/scott/Desktop/Constituencies.csv' AS line
	CREATE (a:Constituency {Name: line[0],Seats: line[1]})
