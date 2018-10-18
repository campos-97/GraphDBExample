// Create People
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///Person.csv" AS row
CREATE (:Person {Name: row.Name, PersonId: row.idPerson});

//Create index to ensure quick lookup when creating relations
CREATE INDEX ON :Person(Name);
CREATE INDEX ON :Person(PersonId);

//As the indexes are created after the nodes are inserted,
// their population happens asynchronously,
// so we use schema await (a shell command) to block until they are populated.
schema await 

// Creating classmates relations
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///Relationship.csv" AS row
MATCH (personA:Person {PersonId: row.fk_idPersonA})
MATCH (personB:Person {PersonId: row.fk_idPersonB})
WHERE toString(row.TypeOfRelationship) = 'Classmates'
MERGE (personA)-[:Classmates]->(personB);

// Creating ProfessorStudent relations
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///Relationship.csv" AS row
MATCH (personA:Person {PersonId: row.fk_idPersonA})
MATCH (personB:Person {PersonId: row.fk_idPersonB})
WHERE toString(row.TypeOfRelationship) = 'ProfessorStudent'
MERGE (personA)-[:ProfessorStudent]->(personB);