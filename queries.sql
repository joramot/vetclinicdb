/*Queries that provide answers to the questions from all projects.*/

/* Project 1: create animals table. */

/* Write queries for the following quests: */

/*Find all animals whose name ends in "mon". */
SELECT * FROM animals WHERE name LIKE '%mon';

/* List the name of all animals born between 2016 and 2019. */
SELECT name, date_birth FROM animals WHERE date_birth BETWEEN '2016-01-01' AND '2019-12-31';

/* List the name of all animals that are neutered and have less than 3 escape attempts. */
SELECT name, neutered, escape_attempts FROM animals WHERE neutered = true AND escape_attempts < 3;

/* List the date of birth of all animals named either "Agumon" or "Pikachu". */
SELECT name,date_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

/* List name and escape attempts of animals that weigh more than 10.5kg */
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

/* Find all animals that are neutered. */
SELECT * FROM animals WHERE neutered = true;

/* Find all animals not named Gabumon. */
SELECT * FROM animals WHERE NOT name = 'Gabumon';

/* Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg) */
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

/* Project 2: query and update animals table */

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals;

COMMIT;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

COMMIT;
SELECT * FROM animals;

DELETE FROM animals WHERE date_birth > '2022-01-01';
BEGIN;
SAVEPOINT SP1;
SELECT * FROM animals;
UPDATE animals SET weight_kg = weight_kg*-1;
SELECT * FROM animals;
ROLLBACK TO SP1;
SELECT * FROM animals;
UPDATE animals SET weight_kg = weight_kg*-1 WHERE weight_kg < 0;

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

/* Project 3: query multiple tables.*/

SELECT name
FROM animals
INNER JOIN owners ON animals.owner_id = owners.owner_id
WHERE full_name = 'Melody Pond';

SELECT animals.name, animals.specie_id, species.name
FROM animals
INNER JOIN species ON animals.specie_id = species.specie_id
WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name
FROM owners
LEFT JOIN animals ON owners.owner_id = animals.owner_id;

SELECT species.name AS specie, COUNT(animals.specie_id) AS Animals_Count
FROM animals
INNER JOIN species ON animals.specie_id = species.specie_id
GROUP BY species.name;

SELECT owners.full_name, animals.name
FROM owners
INNER JOIN animals ON owners.owner_id = animals.owner_id
INNER JOIN species ON animals.specie_id = species.specie_id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT owners.full_name, animals.name
FROM owners
INNER JOIN animals ON owners.owner_id = animals.owner_id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name AS Owner_Name, COUNT(animals.owner_id) AS Animals_Count
FROM owners
LEFT JOIN animals ON owners.owner_id = animals.owner_id
GROUP BY owners.full_name
ORDER BY Animals_Count DESC
LIMIT 1;

/* Project 4: add "join table" for visits. */

SELECT a.name AS animal
FROM visits v
INNER JOIN vets vet ON v.vet_id = vet.vet_id
INNER JOIN animals a ON v.id = a.id
WHERE vet.full_name = 'William Tatcher'
ORDER BY v.date_visit DESC
LIMIT 1;

SELECT COUNT(DISTINCT v.id) AS quantity_animals
FROM visits v
INNER JOIN vets vet ON v.vet_id = vet.vet_id
WHERE vet.full_name = 'Stephanie Mendez';

SELECT vets.full_name, COALESCE(string_agg(species.name, ', '), 'no specialties') AS specialties
FROM vets
LEFT JOIN specializations ON vets.vet_id = specializations.vet_ID
LEFT JOIN species ON specializations.species_id = species.specie_ID
GROUP BY vets.full_name, vets.vet_id;

SELECT DISTINCT animals.name AS animal
FROM visits
INNER JOIN vets ON visits.vet_id = vets.vet_id
INNER JOIN animals ON visits.id = animals.id
WHERE vets.full_name = 'Stephanie Mendez'
    AND visits.date_visit >= '2020-04-01'
    AND visits.date_visit <= '2020-08-30';

SELECT animals.name AS animal, COUNT(*) AS visits_Count
FROM visits
INNER JOIN animals ON visits.id = animals.id
GROUP BY animals.name
ORDER BY visits_Count DESC
LIMIT 1;

SELECT animals.name AS animal, MIN(visits.date_visit) AS first_visit_date
FROM visits
INNER JOIN vets ON visits.vet_id = vets.vet_id
INNER JOIN animals ON visits.id = animals.id
WHERE vets.full_name = 'Maisy Smith'
GROUP BY animals.name
ORDER BY first_visit_date
LIMIT 1;

SELECT animals.name AS animal, vets.full_name AS vet, visits.date_visit AS visit_date
FROM visits
INNER JOIN vets ON visits.vet_id = vets.vet_id
INNER JOIN animals ON visits.id = animals.id
ORDER BY visits.date_visit DESC
LIMIT 1;

SELECT COUNT(*) AS number_visits_without_specialty
FROM visits
INNER JOIN vets ON visits.vet_id = vets.vet_id
INNER JOIN specializations ON vets.vet_id = specializations.vet_id
INNER JOIN animals ON visits.id = animals.id
WHERE specializations.species_id <> animals.specie_id;

SELECT species.name AS recommended_specialty
FROM (
    SELECT
        vet_id,
        animals.specie_id,
        COUNT(*) AS quantity_animals
    FROM visits
    JOIN animals ON visits.id = animals.id
    WHERE vet_id = 2
    GROUP BY vet_id, animals.specie_id
    ORDER BY quantity_animals DESC
    LIMIT 1
) AS max_especie
JOIN species ON max_especie.specie_id = species.specie_id;
