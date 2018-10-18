//Remove all nodes
MATCH (n)
DETACH DELETE n

//Create single node
CREATE (n:Person {Name : "Andres", ID : 1})
return n

//Create multiple nodes using unwind
UNWIND [ {
    Name : "Roberto",
    ID : 2
  },
  {
    Name : "Alejandro",
    ID : 3
  },
  {
    Name : "Nachito",
    ID : 4
  },
  {
    Name : "Allan",
    ID : 5
  },
  {
    Name : "Raul",
    ID : 6
  }]
AS map
CREATE (n:Person)
SET n = map
return n

//Create Classmate relationship
MATCH (n:Person {ID : 1})
MATCH (m:Person {ID : 2})
MERGE (n)-[:Classmate]- (m)

//Create Classmate relationship
MATCH (n:Person {ID : 1})
MATCH (m:Person {ID : 3})
MERGE (n)-[:Classmate]- (m)

//Create Classmate relationship
MATCH (n:Person {ID : 2})
MATCH (m:Person {ID : 3})
MERGE (n)-[:Classmate]- (m)

//Create ProfessorStudent relationship
MATCH (n:Person {ID : 6})
MATCH (m:Person {ID : 1})
MERGE (n)-[:ProfessorStudent]- (m)

//Create ProfessorStudent relationship
MATCH (n:Person {ID : 6})
MATCH (m:Person {ID : 3})
MERGE (n)-[:ProfessorStudent]- (m)

//Create ProfessorStudent relationship
MATCH (n:Person {ID : 6})
MATCH (m:Person {ID : 4})
MERGE (n)-[:ProfessorStudent]- (m)

//Get the students for professor
MATCH (p:Person {ID : 6})-[:ProfessorStudent]- (m)
RETURN m

//Get the classmates for student
MATCH (p:Person {ID : 1})-[:Classmate]- (m)
RETURN m