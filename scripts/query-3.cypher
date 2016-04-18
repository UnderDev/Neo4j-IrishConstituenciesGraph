//The Following Query looks for the Constituency with the highest number of candidates running in
//that Constituency and saves it in total. Once the total is found it finds the Constituency with that total.

```Cypher
	MATCH (b:Constituency)
	WITH MAX(b.Running) as total
	match(c:Constituency)
	where c.Running = total
	Return c
```