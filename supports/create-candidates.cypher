// This query creates nodes representing all Candidates followed by there details, Loaded in from a .CSV File
//For the below query to work, the file path below must be changed to where ever you have the file located. E.g   
// 'file:///Users/scott/Desktop/Candidates.csv' the location of the file is on my Desktop.

	LOAD CSV FROM 'file:///Users/scott/Desktop/Candidates.csv' AS line
	CREATE (a:Candidates { Name: line[0], Age: line[1], Party: line[2]
	, Constituency: line[3] , CurrentTD: line[4] , Gender: line[6] 
	, PhoneNo: line[5]})