//The Following Query first matches all the nodes that have a relationship called "RAN_IN", 
//then finds the Candidates that are Female and were elected. The With clause then counts all the 
//results from the where clause and creates a collection of all the Constituency.
//The collection is then ordered in decending order and limited to 1 result shown.
//The next MATCH clause then finds all the candidates that have there Constituency in the result gathered above.
//The return statment then returns the Constituency with the highest number of Elected Female candidates and the candidates themselves. 

```Cypher
	MATCH (a:Candidates)-[r:RAN_IN]->(b:Constituency)
	where a.Gender ="Female" and a.CurrentTD="Yes"
	WITH a, COUNT(a) as total, collect(b) as coll
	ORDER BY numCan DESC 
	LIMIT 1
	unwind total as z
	MATCH (c:Candidates)
	where c.Constituency = z.Name and c.Gender = "Female"
	return z,c
```