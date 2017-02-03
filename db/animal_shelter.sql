DROP TABLE owners CASCADE;
DROP TABLE pets CASCADE;
DROP TABLE pet_types CASCADE;

CREATE TABLE owners(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE pet_types(
  id SERIAL8 primary key,
  type VARCHAR(255) not null
);

CREATE TABLE pets(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  type_id INT8 references pet_types(id) ON DELETE CASCADE,
  admission_date DATE not null,
  adoptable BOOLEAN not null,
  owner_id INT8 references owners(id) ON DELETE CASCADE
);