/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');

INSERT INTO animals (name,date_birth,escape_attempts,neutered,weight_kg) 
VALUES ('Agumon', '2020-02-03', 0, true, 10.23), 
('Gabumon', '2018-11-15', 2, true, 8.0), 
('Pikachu', '2021-01-7', 1, false, 15.04), 
('Devimon', '2017-05-12', 5, true, 11.0);

INSERT INTO animals (name,date_birth,escape_attempts,neutered,weight_kg) 
VALUES ('Charmander', '2020-02-08', 0, false, 11.00), 
('Plantmon', '2021-11-15', 2, true, 5.7), 
('Squirtle', '1993-04-02', 3, false, 12.13), 
('Angemon', '2005-06-12', 1, true, 45.0),
('Boarmon', '2005-06-07', 7, true, 20.4),
('Blossom', '1998-10-13', 3, true, 17.0),
('Ditto', '2022-05-14', 4, true, 22.0);

INSERT INTO owners (full_name,age) 
VALUES ('Sam Smith', 34), 
('Jennifer Orwell', 19), 
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name) 
VALUES ('Pokemon'),
('Digimon');

UPDATE animals SET specie_ID = 1 WHERE name LIKE '%mon';

UPDATE animals SET specie_ID = 2 WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id = 1 WHERE name LIKE 'Agumon';

UPDATE animals SET owner_id = 2 WHERE name LIKE 'Gabumon'OR name LIKE 'Pikachu';

UPDATE animals SET owner_id = 3 WHERE name LIKE 'Devimon' OR name LIKE 'Plantmon';

UPDATE animals SET owner_id = 4 WHERE name LIKE 'Charmander' OR name LIKE 'Squirtle' OR name LIKE 'Blossom';

UPDATE animals SET owner_id = 5 WHERE name LIKE 'Angemon' OR name LIKE 'Boarmon';

INSERT INTO vets (full_name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '200-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mende', 64,'1982-05-04'),
('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vet_ID, species_ID)
VALUES (1, 1),
(3, 2),
(3,1),
(4, 2);

INSERT INTO visits (id, vet_ID, date_visit)
VALUES (1, 1, '2020-05-24'),
(1, 3, '2020-07-22'),
(2, 4, '2021-02-02'),
(3, 2, '2020-01-05'),
(3, 2, '2020-05-08'),
(3, 2, '2020-05-14'),
(11, 3, '2021-05-04'),
(12, 4, '2021-02-24'),
(13, 2, '2019-12-21'),
(13, 1, '2020-08-10'),
(13, 2, '2021-07-07'),
(14, 3, '2019-09-29'),
(15, 4, '2020-10-03'),
(15, 4, '2020-11-04'),
(16, 2, '2019-01-24'),
(16, 2, '2019-05-15'),
(16, 2, '2020-02-27'),
(16, 2, '2020-08-03'),
(17, 3, '2020-05-24'),
(17, 1, '2021-01-11');
