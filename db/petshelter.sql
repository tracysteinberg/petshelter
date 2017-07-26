DROP TABLE IF EXISTS matches;
DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS owners; 
-- DROP TABLE IF EXISTS pet_types;

-- CREATE TABLE pet_types
-- (
--   type_id SERIAL4 PRIMARY KEY,
--   pet_type VARCHAR(255),
--   pet_photo VARCHAR(255)
-- );

CREATE TABLE owners
(
  owner_id SERIAL4 PRIMARY KEY,
  owner_photo VARCHAR(255),
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  pet_type VARCHAR(255)
  -- type_id SERIAL4 REFERENCES types(id
);

CREATE TABLE pets
(
  pet_id SERIAL4 PRIMARY KEY,
  pet_name VARCHAR(255),
  pet_type VARCHAR(255),
  breed VARCHAR(255),
  sex VARCHAR(255),
  age INT2,
  adoptable VARCHAR(255),
  admission VARCHAR(255),
  pet_photo VARCHAR(255),
  owner_id SERIAL4 REFERENCES owners(owner_id)
);



CREATE TABLE matches
(
  -- type_id SERIAL4 PRIMARY KEY,
  -- pet_id SERIAL4 PRIMARY KEY,
  -- owner_id SERIAL4 PRIMARY KEY,
  pet_name VARCHAR(255),
  pet_photo VARCHAR(255),
  owner_first_name VARCHAR(255),
  owner_last_name VARCHAR(255),
  owner_photo VARCHAR(255),
  pet_and_owner_photo VARCHAR(255)

);
