/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id INTEGER,
  name VARCHAR(255),
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL(10,2)
);

/* Add a new column to the database */
ALTER TABLE animals ADD COLUMN species VARCHAR(250);

/* ADD new tables */

CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(255),
  age INT
);

CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) 
);

ALTER TABLE animals ALTER COLUMN id SET NOT NULL;
ALTER TABLE animals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id);

/* ADD new tables. Activities Day 4 */

CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age INTEGER,
  date_of_graduation DATE
);


CREATE TABLE specializations (
    id SERIAL PRIMARY KEY,
    vet_id INT  REFERENCES vets (id),
    species_id INT  REFERENCES species (id)
);


CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    animal_id INT REFERENCES animals(id),
    vet_id INT REFERENCES vets(id),
    visit_date DATE
);







