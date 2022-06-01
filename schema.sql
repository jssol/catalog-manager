/* Create Label class table */
CREATE TABLE IF NOT EXISTS label (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	title TEXT,
	color TEXT
);

/* Create Book class table */
CREATE TABLE IF NOT EXISTS book (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  archived bool,
  publisher TEXT,
  cover_state TEXT,
  label_id INT NOT NULL,
  FOREIGN KEY (label_id) REFERENCES label (id)
);
