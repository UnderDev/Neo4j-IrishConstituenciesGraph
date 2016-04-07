//The Following Query looks for the Constituency with the highest number of candidates running in
//that Constituency.


	MATCH (b:Constituency)
	WITH MAX(b.Running) as r
	match(c:Constituency)
	where c.Running = r
	Return c