CREATE TABLE expenses (
  id serial PRIMARY KEY,
  amount numeric(13,2) NOT NULL,
  memo VARCHAR(255) NOT NULL,
  created_on date NOT NULL
);

ALTER TABLE expenses ADD CHECK (amount >= 0.01);