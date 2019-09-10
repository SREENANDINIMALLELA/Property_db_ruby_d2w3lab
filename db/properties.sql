DROP TABLE properties;
CREATE TABLE properties(
  id SERIAL8 PRIMARY KEY,
  number_of_bedrooms INT2,
  value INT8,
  year_build INT8,
  build VARCHAR(255),
  address VARCHAR(255)
);
