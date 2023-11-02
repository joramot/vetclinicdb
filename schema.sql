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