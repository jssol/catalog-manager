CREATE TABLE IF NOT EXISTS author (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS game (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  archived BOOL,
  multiplayer BOOL,
  last_played_at, DATE 
  author_id INT,
  FOREIGN KEY (author_id) REFERENCES author (id)
);