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
    age INT,
    PRIMARY KEY (owner_id)
);

CREATE TABLE species (
    specie_id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    PRIMARY KEY (specie_id)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals 
ADD specie_id INT,
ADD CONSTRAINT fk_species
    FOREIGN KEY(specie_id)
	REFERENCES species(specie_id);

ALTER TABLE animals 
ADD owner_id INT,
ADD CONSTRAINT fk_owner
    FOREIGN KEY(owner_id)
	REFERENCES owners(owner_id);


/* Project 4: add "join table" for visits. */

CREATE TABLE vets (
    vet_id INT GENERATED ALWAYS AS IDENTITY,
    full_name varchar(100),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY (vet_id)
);

CREATE TABLE specializations (
    specialization_id INT GENERATED ALWAYS AS IDENTITY,
    vet_id INT,
    species_id INT,
    PRIMARY KEY (specialization_id ),
    FOREIGN KEY (vet_id) REFERENCES vets(vet_id),
    FOREIGN KEY (species_id) REFERENCES species(specie_id)
);

CREATE TABLE visits (
    visit_id INT GENERATED ALWAYS AS IDENTITY,
    id INT,
    vet_id INT,
    date_visit DATE,
    PRIMARY KEY (visit_id),
    FOREIGN KEY (id) REFERENCES animals(id),
    FOREIGN KEY (vet_id) REFERENCES vets(vet_id)
);
