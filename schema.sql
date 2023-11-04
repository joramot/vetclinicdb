/* Database schema to keep the structure of entire database. */


/* Project 1: create animals table. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg REAL,
    PRIMARY KEY (id)
);

/* Project 2: query and update animals table */

ALTER TABLE animals ADD species varchar(100);


/* Project 3: query multiple tables.*/

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


/* Project 4: add "join table" for visits. */

CREATE TABLE vets (
    vet_ID INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    age INT,
    date_birth DATE,
    PRIMARY KEY (vet_ID)
);

CREATE TABLE specializations (
    specialization_ID INT GENERATED ALWAYS AS IDENTITY,
    vet_ID INT,
    species_ID INT,
    PRIMARY KEY (specialization_ID ),
    FOREIGN KEY (vet_ID) REFERENCES vets(vet_ID),
    FOREIGN KEY (species_ID) REFERENCES species(specie_ID)
);

CREATE TABLE visits (
    visit_ID INT GENERATED ALWAYS AS IDENTITY,
    id INT,
    vet_ID INT,
    date_visit DATE,
    PRIMARY KEY (visit_ID),
    FOREIGN KEY (id) REFERENCES animals(id),
    FOREIGN KEY (vet_ID) REFERENCES vets(vet_ID)
);
