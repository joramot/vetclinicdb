/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg REAL,
    PRIMARY KEY (id)
);

ALTER TABLE animals ADD species varchar(100);

CREATE TABLE owners (
    owner_id INT GENERATED ALWAYS AS IDENTITY,
    full_name varchar(100),
    age INT
);

ALTER TABLE owners
ADD CONSTRAINT pk_owners PRIMARY KEY (owner_id);

CREATE TABLE species (
    specie_ID INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    PRIMARY KEY (specie_ID)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals 
ADD specie_ID INT,
ADD CONSTRAINT fk_species
    FOREIGN KEY(specie_ID)
	REFERENCES species(specie_ID);

ALTER TABLE animals 
ADD owner_id INT,
ADD CONSTRAINT fk_owner
    FOREIGN KEY(owner_id)
	REFERENCES owners(owner_id);

