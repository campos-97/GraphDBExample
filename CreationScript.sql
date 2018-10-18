USE neo4jDB; -- Selects the database

IF OBJECT_ID('dbo.Relationship', 'U') IS NOT NULL DROP TABLE dbo.Relationship; -- Drop Relationship table in case it already exists
IF OBJECT_ID('dbo.Person', 'U') IS NOT NULL DROP TABLE dbo.Person; -- Drop Person table in case it already exists

CREATE TABLE Person(
	idPerson INT IDENTITY(1,1) PRIMARY KEY NOT NULL, -- IDENTITY(1,1) for autoincrement of primary key
	"Name" VARCHAR(15) NOT NULL -- Double quote because name is a key word
);

CREATE TABLE Relationship(
	fk_idPersonA INT FOREIGN KEY REFERENCES Person(idPerson) NOT NULL,
	fk_idPersonB INT FOREIGN KEY REFERENCES Person(idPerson) NOT NULL,
	TypeOfRelationship VARCHAR(25) NOT NULL
);


-- DB dummy data
INSERT INTO Person ("Name")	-- id : 1
VALUES ('Andres');

INSERT INTO Person ("Name")	-- id : 2
VALUES ('Roberto');

INSERT INTO Person ("Name")	-- id : 3
VALUES ('Alejandro');

INSERT INTO Person ("Name")	-- id : 4
VALUES ('Nachito');

INSERT INTO Person ("Name")	-- id : 5
VALUES ('Allan');

INSERT INTO Person ("Name")	-- id : 6
VALUES ('Raul');


INSERT INTO Relationship(fk_idPersonA,fk_idPersonB,TypeOfRelationship)
VALUES (1,2, 'Compañeros');
INSERT INTO Relationship(fk_idPersonA,fk_idPersonB,TypeOfRelationship)
VALUES (1,3, 'Compañeros');
INSERT INTO Relationship(fk_idPersonA,fk_idPersonB,TypeOfRelationship)
VALUES (1,4, 'Compañeros');
INSERT INTO Relationship(fk_idPersonA,fk_idPersonB,TypeOfRelationship)
VALUES (1,5, 'Compañeros');
INSERT INTO Relationship(fk_idPersonA,fk_idPersonB,TypeOfRelationship)
VALUES (2,3, 'Compañeros');
INSERT INTO Relationship(fk_idPersonA,fk_idPersonB,TypeOfRelationship)
VALUES (2,4, 'Compañeros');
INSERT INTO Relationship(fk_idPersonA,fk_idPersonB,TypeOfRelationship)
VALUES (2,5, 'Compañeros');
INSERT INTO Relationship(fk_idPersonA,fk_idPersonB,TypeOfRelationship)
VALUES (3,4, 'Compañeros');
INSERT INTO Relationship(fk_idPersonA,fk_idPersonB,TypeOfRelationship)
VALUES (3,5, 'Compañeros');
INSERT INTO Relationship(fk_idPersonA,fk_idPersonB,TypeOfRelationship)
VALUES (6,1, 'Profesor-Alumno');
INSERT INTO Relationship(fk_idPersonA,fk_idPersonB,TypeOfRelationship)
VALUES (6,2, 'Profesor-Alumno');
INSERT INTO Relationship(fk_idPersonA,fk_idPersonB,TypeOfRelationship)
VALUES (6,3, 'Profesor-Alumno');
INSERT INTO Relationship(fk_idPersonA,fk_idPersonB,TypeOfRelationship)
VALUES (6,4, 'Profesor-Alumno');
INSERT INTO Relationship(fk_idPersonA,fk_idPersonB,TypeOfRelationship)
VALUES (6,5, 'Profesor-Alumno');

SELECT * FROM Person;