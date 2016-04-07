// Describe your query
// at the start
// in comments.


MATCH (b:Constituency)
WITH MAX(b.Running) as r
match(c:Constituency)
where c.Running = r
Return c