//Remove all nodes
MATCH (n)
DETACH DELETE n

//Remove Labels from node example
CREATE(m:Movie:Cinema:Film:Picture{title:"The Matrix"})
MATCH(m:Movie)
WHERE m.title = "The Matrix"
RETURN m
//It would have 4 labels: Movie, Cinema, Film, and Picture
//To remove the Picture label from all movies:
MATCH(m:Movie)
REMOVE m:Picture
RETURN m
//To remove the Picture label from only that one movie:
MATCH(m:Movie)
WHERE m.title = "The Matrix"
REMOVE m:Picture
RETURN m

//Get all nodes
MATCH (n)
RETURN n

//Delete a relation
Match (n:Person {ID : 6})-[rel:Classmate]- ()
DELETE rel