# Irish Constituencies Neo4j Database
###### Scott Coyne, G00316578

## Introduction
The following project is a neo4j Graph Database containing data about the 2016 Irish election.
It contains all the candidates with there details that ran in the election and all the constituencies/seats available.

The objective was to first create the database with all the information and Querie it using cypher Queries to get interesting information about the election.

## Database
Explain how you created your database, and how information is represented in it.
The database was created using a .CSV file which i altered and added data to once gathered from reliable sources.

There were two files added to the project, one with Constituencies and the other with Candidates.

Once the .CSV files were created, they were then read in using the queries below.

```Cypher
	LOAD CSV FROM 'file:///Users/scott/Desktop/Candidates.csv' AS line
	CREATE (a:Candidates { Name: line[0], Age: line[1], Party: line[2]
	, Constituency: line[3] , CurrentTD: line[4] , Gender: line[6] 
	, PhoneNo: line[5]})
```

```Cypher
	LOAD CSV FROM 'file:///Users/scott/Desktop/Constituencies.csv' AS line
	CREATE (a:Constituency {Name: line[0],Seats: line[1]})
```

The queries above read in the .csv file listed line by line seperating the data by commas into two nodes, one called Candidates and the other Constituencies with the 
proprities listed above.

Once all the Constituency and Candidates nodes were set up, i created a relationship between them called "RAN_IN" 
to display what candidate ran in what Constituency with the Cypher Querie Below.

```Cypher
	MATCH (a:Candidates),(b:Constituency)
	WHERE a.Constituency =~ b.Name
	CREATE (a)-[:RAN_IN]->(b)
```



## Queries
The 3 queries iv picked for this project are:
1. Party With The Youngest Age Group
	This Querie Counts all the candidates under the age of 30 in each party and returns the Party with the highest amount of "Young Guns" in it.
	
2. Constituency With the Most amount of elected Females.
	This query searches through all the candidates for females that were elected and returns the Constituency with the highest amount. 
	
3. Constituency With the most amount of Candidates Running.
	This query counts the amount of candidates running in each constituency and returns the constituency with the highest amount.


#### Party With The Youngest Age Group
This query retrives the Party with the youngest number of running candidates.
```cypher

```

#### Constituency With the Most amount of elected Females.
This query retrives the Constituency with the most amount of elected Female Candidates.
```cypher

```

#### Constituency With the most amount of Candidates Running.
This query retreives the Constituency with the most amount of Candidates running in the election.
```cypher

```

## References
1. [Neo4J website](http://neo4j.com/), the website of the Neo4j database.
2. http://www.thejournal.ie/election-2016/party/ Used to get Ages and info for each candidate.
3. https://github.com/storyful/irish-elections/tree/master/db/data Used to get Names/Constituencies and initial set up of .csv file.
4. http://neo4j.com/docs/stable/query-load-csv.html Used to find out how to load data from a csv file into neo4j.