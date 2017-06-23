CREATE TABLE expenses (
  id serial PRIMARY KEY,
  amount numeric(13,2) NOT NULL CHECK (amount >= 0.01),
  memo VARCHAR(255) NOT NULL,
  created_on date NOT NULL
);
