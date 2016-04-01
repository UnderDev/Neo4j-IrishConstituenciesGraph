// This query creates nodes representing all constituencies and available seats in Ireland. Loaded in from a .CSV File


LOAD CSV FROM 'file:///Users/scott/Desktop/constituencies.csv' AS line
CREATE (a:Constituency {Name: line[0],Seats: line[1]})
