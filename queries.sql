/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name FROM animals WHERE neutered=true AND escape_attempts<3;
SELECT date_of_birth FROM animals WHERE name IN('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg>10.5;
SELECT * FROM animals WHERE neutered= true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg>= 10.4 AND weight_kg <= 17.3;

/*Queries day 2 */
BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;


BEGIN;
UPDATE animals SET species= 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species= 'pokemon' WHERE species IS NULL OR species = '';
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;


BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
SELECT * FROM animals;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;


SELECT COUNT(*) FROM animals;
SELECT * FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) AS total_escapes FROM animals GROUP BY neutered ORDER BY total_escapes DESC LIMIT 1;
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) AS AVG_attempts FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;


/*Queries day 3 */

SELECT animals.name, owners.full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT animals.name, species.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT owners.full_name, animals.name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id ORDER BY owners.id, animals.name;
SELECT s.name AS species_name, COUNT(*) AS animal_count FROM animals a JOIN species s ON a.species_id = s.id GROUP BY s.name;
SELECT owners.full_name, animals.name, species.name FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';
SELECT owners.full_name, animals.name, animals.escape_attempts FROM animals JOIN owners ON animals.owner_id = owners.id WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';
SELECT owners.full_name, COUNT(animals.id) as num_animals FROM owners LEFT JOIN animals ON owners.id = animals.owner_id GROUP BY owners.id ORDER BY num_animals DESC LIMIT 1;


