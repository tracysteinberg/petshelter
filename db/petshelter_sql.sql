DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS types;
DROP TABLE IF EXISTS matches;


CREATE TABLE pets
(
  pet_id SERIAL4 PRIMARY KEY,
  pet_photo VARCHAR(255),
  pet_name VARCHAR(255),
  pet_type VARCHAR(255),
  breed VARCHAR(255),S
  sex VARCHAR(255),
  age INT2,
  size VARCHAR(255),
  adoptable BOOLEAN
  type_id SERIAL4 REFERENCES type(id)
);

CREATE TABLE owners
(
  id SERIAL4 PRIMARY KEY,
  owners_photo VARCHAR(255),
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  pet_type VARCHAR(255),
  type_id SERIAL4 REFERENCES type(id)
);


CREATE TABLE types
(
  type_id SERIAL4 PRIMARY KEY,
  pet_type VARCHAR(255),
  pet_photo VARCHAR(255)
);

CREATE TABLE matches
(
  type_id SERIAL4 PRIMARY KEY,
  pet_id SERIAL4 PRIMARY KEY,
  owner_id SERIAL4 PRIMARY KEY,
  pet_name VARCHAR(255),
  pet_photo VARCHAR(255),
  owner_first_name VARCHAR(255),
  owner_last_name VARCHAR(255),
  owner_photo VARCHAR(255)

);
