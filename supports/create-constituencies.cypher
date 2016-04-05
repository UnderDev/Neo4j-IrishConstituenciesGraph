

// This query creates nodes representing all constituencies and available seats in Ireland. Loaded in from a .CSV File

LOAD CSV FROM 'file:///Users/scott/Desktop/DatabaseContents.csv' AS line
CREATE (a:Constituency {Name: line[10],Seats: line[11]})

LOAD CSV FROM 'file:///Users/scott/Desktop/DatabaseContents.csv' AS line
CREATE (a:Candidates { Name: line[0], Age: line[1], Party: line[2]
, Constituency: line[3] , CurrentTD: line[4] , Gender: line[6] 
, PhoneNo: line[5]}, AgainstWaterCharge: line[7])
