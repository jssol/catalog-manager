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

CREATE TABLE genre (
    id  INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    PRIMARY KEY(id)
  );

CREATE TABLE IF NOT EXISTS game (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  archived BOOL,
  multiplayer BOOL,
  last_played_at, DATE 
  author_id INT,
  label_id INT,
  genre_id INT,
  FOREIGN KEY (label_id) REFERENCES label (id),
  FOREIGN KEY (author_id) REFERENCES author (id),
  FOREIGN KEY(genre_id) REFERENCES genre (id)
);


/* Create Book class table */
CREATE TABLE IF NOT EXISTS book (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  archived bool,
  publisher TEXT,
  cover_state TEXT,
  author_id INT,
  label_id INT,
  genre_id INT,
  FOREIGN KEY (label_id) REFERENCES label (id),
  FOREIGN KEY (author_id) REFERENCES author (id),
  FOREIGN KEY(genre_id) REFERENCES genre (id)
);

CREATE TABLE music_album (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    name VARCHAR(100),
    on_spotify BOOLEAN,
    label_id INT,
    author_id INT,
    genre_id INT,
    FOREIGN KEY (label_id) REFERENCES label (id),
    FOREIGN KEY (author_id) REFERENCES author (id),
    FOREIGN KEY(genre_id) REFERENCES genre (id)
);


