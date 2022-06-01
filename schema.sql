
CREATE TABLE IF NOT EXISTS author (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL
);

/* Create Label class table */
CREATE TABLE IF NOT EXISTS label (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	title TEXT,
	color TEXT
);

CREATE TABLE IF NOT EXISTS game (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  archived BOOL,
  multiplayer BOOL,
  last_played_at, DATE 
  author_id INT,
  label_id INT NOT NULL,
  FOREIGN KEY (label_id) REFERENCES label (id),
  FOREIGN KEY (author_id) REFERENCES author (id)
);


/* Create Book class table */
CREATE TABLE IF NOT EXISTS book (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  archived bool,
  publisher TEXT,
  cover_state TEXT,
  author_id INT,
  label_id INT NOT NULL,
  FOREIGN KEY (label_id) REFERENCES label (id),
  FOREIGN KEY (author_id) REFERENCES author (id)
);

