

// This query creates nodes representing all constituencies and available seats in Ireland. Loaded in from a .CSV File

LOAD CSV FROM 'file:///Users/scott/Desktop/Constituencies.csv' AS line
CREATE (a:Constituency {Name: line[0],Seats: line[1]})

// This query creates nodes representing all Candidates followed by there details, Loaded in from a .CSV File
LOAD CSV FROM 'file:///Users/scott/Desktop/Candidates.csv' AS line
CREATE (a:Candidates { Name: line[0], Age: line[1], Party: line[2]
, Constituency: line[3] , CurrentTD: line[4] , Gender: line[6] 
, PhoneNo: line[5]})


//Set up the relationships between Candidates and constituencies by the Properity: Constituency
MATCH (a:Candidates),(b:Constituency)
WHERE a.Constituency =~ b.Name
CREATE (a)-[:RAN_IN]->(b)

