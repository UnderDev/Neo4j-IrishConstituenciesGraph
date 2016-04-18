
//Set up the relationships between Candidates and constituencies by the Properity: Constituency

	MATCH (a:Candidates),(b:Constituency)
	WHERE a.Constituency =~ b.Name
	CREATE (a)-[:RAN_IN]->(b)

	
//Set up the relationships between Candidates and Party by the Properity: Party

	MATCH (a:Candidates),(b:Party)
	WHERE a.Party =~ b.Name
	CREATE (a)-[:IS_A_MEMBER_OF]->(b)
	RETURN a,b;
