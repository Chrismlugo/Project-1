DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;


CREATE TABLE artists(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
  -- album_id INT REFERENCES albums(id) ON DELETE CASCADE
);


CREATE TABLE albums(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  quantity INT,
  artist_id INT REFERENCES artists(id) ON DELETE CASCADE
);
