-- USE albums_db;

USE albums_db;

-- Explore th structure of the albums table

SELECT * 
FROM albums;

-- How many rows are in the albums table?;

SELECT id
FROM albums;

-- How many unique artist names are in the albums table?

SELECT
	DISTINCT artist
FROM albums;

-- What is the primary key for the albums table?

DESCRIBE albums;

-- What is the oldest release date for any album in the albums table? What is the most recent release date?

SELECT 
	MIN(release_date) as oldest_release_date,
	MAX(release_date) as most_recent_release_date
FROM albums;

-- The name of all albums by Pink Floyd

SELECT
	name
FROM albums
WHERE artist = 'Pink Floyd';

-- The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT
	release_date
FROM albums
WHERE name = 'Sgt. Pepper\'s Lonely Hearts Club Band';

-- The genre for the album Nevermmind

SELECT
	genre
FROM albums
WHERE name = 'Nevermind';

-- Which albums were released in the 1990s

SELECT
	name
FROM albums
WHERE release_date between 1990 and 1999;

-- Which albums had less than 20 million certified sales?

SELECT
	name
FROM albums
WHERE sales < 20;

-- All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?

SELECT
	name
FROM albums
WHERE genre = 'Rock';

-- Album genre Hard Rock
SELECT 
	name
FROM albums
WHERE genre = 'Hard Rock';

-- Album genre Progressive Rock
SELECT
	name
FROM albums
WHERE genre = 'Progressive Rock';

-- Answer 
SELECT
	name
FROM albums
WHERE genre like '%rock%';
	