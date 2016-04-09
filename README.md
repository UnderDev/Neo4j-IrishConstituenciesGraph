# Irish Constituencies Neo4j Database
###### Scott Coyne, G00316578

## Introduction
The following project is a neo4j Graph Database containing data about the 2016 Irish election.
It contains all the candidates with their details that ran in the election and all the constituencies/seats available.

The objective was to first create the database with all the information and Queries it using cypher Queries to get interesting information about the election.

## Database
The database was created using a .CSV file which I altered and added data to.
There are three files added to the project, one with Constituencies another with Candidates and the last one Party's.
To Run the queries below that create the database, you will need to change the path in the query to where ever you have the Associated file, 
from the queries listed below, i have loacted my 3 files(Candidates,Constituency,Party) on the desktop. A copy of these file are located in the the folder
called Supports.

Once the .CSV files were created, they were then read in using the queries below.

```Cypher
	LOAD CSV FROM 'file:///Users/scott/Desktop/Candidates.csv' AS line
	CREATE (a: Candidates {Name: line [0], Age: line [1], Party: line [2]
	, Constituency: line [3], CurrentTD: line [4], Gender: line [6] 
	, PhoneNo: line [5]})
```

```Cypher
	LOAD CSV FROM 'file:///Users/scott/Desktop/Constituencies.csv' AS line
	CREATE (a: Constituency {Name: line [0], Seats: line [1]})
```

```Cypher
	LOAD CSV FROM 'file:///Users/scott/Desktop/Party.csv' AS line
	CREATE (a: Party {Name: line [0]})
```

The queries above read in the .csv file listed line by line separating the data by commas into three nodes,Candidates, Constituencies and Party with the 
proprities listed above after the Create Statment.

###Relationships
Once all the Constituency,Candidates and Party nodes were set up, i created a relationship between Constituency/Candidates called "RAN_IN" and 
another relationship between Candidates/Party called "IS_A_MEMBER_OF".

The Relationships are created with the following Queries below;

RAN_IN Relationship
```Cypher
	MATCH (a:Candidates),(b:Constituency)
	WHERE a.Constituency =~ b.Name
	CREATE (a)-[:RAN_IN] -> (b)
```

IS_A_MEMBER_OF Relationship
```Cypher
	MATCH (a:Candidates),(b:Party)
	WHERE a.Party =~ b.Name
	CREATE (a)-[:IS_A_MEMBER_OF]->(b)
```


###Other Queries used during set up were

1. This query gets the total number of candidates running in each constituency and creates a propriety called Running with the Total as the value.

```Cypher
	MATCH (a:Candidates)-[r:RAN_IN]->(b:Constituency)
	Where a.Constituency = b.Name 
	WITH b, count (*) as total
	SET b.Running = total
	Return b

```


## Queries
The 3 queries I’ve picked for this project are:

1. Party With The Youngest Age Group
	This query Counts all the candidates under the age of 30 in each party and returns the Party with the highest amount of "Young Guns" in it.
	
2. Constituency With the Most amount of elected Females.
	This query searches through all the candidates for females that were elected and returns the Constituency with the highest amount. 
	
3. Constituency With the most amount of Candidates Running.
	This query counts the amount of candidates running in each constituency and returns the constituency with the highest amount.


#### Party With The Youngest Age Group

This query retrieves the Party with the highest amount of candidates under the age of 30.
```cypher
	MATCH (a: Candidates)
		WHERE a.Age < "30"
	Match (b:Party)
		where b.Name = a.Party
		WITH b, COUNT(b) as total, collect(a) as coll
		ORDER BY total DESC 
		LIMIT 1
		Unwind coll as z
	RETURN b,z
```


#### Constituency With the Most amount of elected Females.
This query retrieves the Constituency with the most amount of elected Female Candidates.

```cypher
	MATCH (a: Candidates)-[r:RAN_IN]->(b:Constituency)
		where a.Gender ="Female" and a.CurrentTD="Yes"
	WITH a, COUNT(a) as total, collect(b) as coll
		ORDER BY total DESC 
		LIMIT 1
		unwind coll as z
	MATCH (c:Candidates)
		where c.Constituency = z.Name and c.Gender = "Female"
	return z,c
```


#### Constituency With the most amount of Candidates Running.
This query retreives the Constituency with the most amount of Candidates running in the election.

```cypher
	MATCH (b:Constituency)
		WITH MAX(b.Running) as r
	match(c:Constituency)
		where c.Running = r
	Return c
```

#### Running the queries.
To set up the database and run all the queries, start from the top and copy and past them into neo4j. 




## References
1. [Neo4J website](http://neo4j.com/), the website of the Neo4j database.
2. http://www.thejournal.ie/election-2016/party/ Used to get Ages and info for each candidate.
3. https://github.com/storyful/irish-elections/tree/master/db/data Used to get Names/Constituencies and initial set up of .csv file.
4. http://neo4j.com/docs/stable/query-load-csv.html Used to find out how to load data from a csv file into neo4j.
5. http://semanticommunity.info/@api/deki/files/25765/Neo4j_CheatSheet_v3.pdf, Cypher Cheat Sheet
