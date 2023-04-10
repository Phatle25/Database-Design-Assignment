CREATE DATABASE spotify_db;

USE spotify_db;

CREATE TABLE Artist (
  artist_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL
);

CREATE TABLE Genre (
  genre_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE Song (
  song_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  duration TIME NOT NULL,
  explicit BOOL NOT NULL,
  cloud_link VARCHAR(255) NOT NULL,
  artist_id INT NOT NULL,
  genre_id INT NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
  FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)
);

CREATE TABLE User (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL UNIQUE,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  account_type ENUM('free', 'standard', 'premium') NOT NULL DEFAULT 'free',
  is_admin BOOL NOT NULL DEFAULT false
);

CREATE TABLE Playlist (
  playlist_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Song_Playlist (
  song_id INT NOT NULL,
  playlist_id INT NOT NULL,
  song_order INT NOT NULL,
  PRIMARY KEY (song_id, playlist_id),
  FOREIGN KEY (song_id) REFERENCES Song(song_id),
  FOREIGN KEY (playlist_id) REFERENCES Playlist(playlist_id)
);
