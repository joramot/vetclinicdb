/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';

/* Write queries for the following quests: */

/*Find all animals whose name ends in "mon". */
SELECT * FROM animals WHERE name LIKE '%mon';

/* List the name of all animals born between 2016 and 2019. */
SELECT name FROM animals WHERE date_birth BETWEEN '2016-01-01' AND '2019-12-31';

/* List the name of all animals that are neutered and have less than 3 escape attempts. */
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

/* List the date of birth of all animals named either "Agumon" or "Pikachu". */
SELECT date_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

/* List name and escape attempts of animals that weigh more than 10.5kg */
SELECT name, escape_attempts FROM animals WHERE weight_kg < 10.5;

/* Find all animals that are neutered. */
SELECT * FROM animals WHERE neutered = true;

/* Find all animals not named Gabumon. */
SELECT * FROM animals WHERE NOT name = 'Gabumon';

/* Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg) */
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';

ROLLBACK;

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

COMMIT;

BEGIN;
DELETE FROM animals;

ROLLBACK;

COMMIT;


BEGIN;
SAVEPOINT SP1;
DELETE FROM animals WHERE date_birth > '2022-01-01';
UPDATE animals SET weight_kg = weight_kg*-1;

ROLLBACK TO SP1;
END;

BEGIN
UPDATE animals SET weight_kg = weight_kg*-1;
END;

COMMIT;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*)
FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg)
FROM animals;

SELECT neutered, MAX(escape_attempts)
FROM animals GROUP BY neutered;

SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) AS avg_escape_attempts
FROM animals
WHERE date_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;
