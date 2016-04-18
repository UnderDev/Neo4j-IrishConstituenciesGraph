// The following Query First finds all candidates under the age of 30. Then finds all the parties thoes candidates are a member of.
// Once all the parties are found. It counts all the Party Nodes and creates a collection of Candidate nodes.
// It is then ordered in DESC and limited to 1 as we only want the top result

	MATCH (a: Candidates)
		WHERE a.Age < "30"
	Match (b:Party)
		where b.Name = a.Party
		WITH b, COUNT(b) as total, collect(a) as coll
		ORDER BY total DESC 
		LIMIT 1
		Unwind coll as z
	RETURN b,z