DROP TABLE owners CASCADE;
DROP TABLE pets CASCADE;

CREATE TABLE owners(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE pets(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  type VARCHAR(255) not null,
  admission_date DATE not null,
  adoptable BOOLEAN not null,
  owner INT8 references owners(id) ON DELETE CASCADE
);