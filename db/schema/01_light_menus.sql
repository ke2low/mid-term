DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS foodtypes CASCADE;
DROP TABLE IF EXISTS lightmenus CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS order_menu CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255),
  email VARCHAR(255),
  phone INTEGER
);

CREATE TABLE foodtypes (
  id SERIAL PRIMARY KEY NOT NULL,
  name TEXT,
  description TEXT
);

CREATE TABLE lightmenus (
  id SERIAL PRIMARY KEY NOT NULL,
  name TEXT,
  description TEXT,
  price DECIMAL,
  URL_thumnail TEXT,
  URL_full TEXT,
  cook_time DECIMAL,
  foodtype_id INTEGER REFERENCES foodtypes(id) ON DELETE CASCADE
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY NOT NULL,
  place_time TIMESTAMP
);

CREATE TABLE order_menu (
  id SERIAL PRIMARY KEY NOT NULL,
  order_id INTEGER REFERENCES orders(id) ON DELETE CASCADE,
  menu_id INTEGER REFERENCES lightmenus(id) ON DELETE CASCADE,
  quantity INTEGER
);
