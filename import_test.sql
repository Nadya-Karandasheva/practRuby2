-- Creation of a test base...

CREATE DATABASE SienceResearch;

CREATE TABLE Sector (
  coordinates VARCHAR(32) NOT NULL,
  light_intensity INT NOT NULL,
  foreign_objects VARCHAR(255) NOT NULL,
  star_objects INT NOT NULL,
  undefined_objects INT NOT NULL,
  specified_objects INT NOT NULL,
  notes TEXT,
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

INSERT INTO Sector (coordinates, light_intensity, foreign_objects, star_objects, undefined_objects, specified_objects, notes) VALUES
('123.133', 4000, 'qwertyu', '5030', '1234', '98', null ),
('7665.1232', 7000, 'zxcvbn', '4010', '647', '92', null );

CREATE TABLE Objects (
  type VARCHAR(128) NOT NULL,
  accuracy INT NOT NULL,
  quantity INT NOT NULL,
  time TIME NOT NULL,
  date TIMESTAMP NOT NULL,
  notes VARCHAR(255),
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

CREATE TABLE NaturalObjects (
  type VARCHAR(128) NOT NULL,
  galaxy VARCHAR(255) NOT NULL,
  accuracy INT NOT NULL,
  light_flux INT NOT NULL,
  conjugate_objects TEXT,
  notes TEXT,
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

CREATE TABLE Locations (
  earth_position VARCHAR(32) NOT NULL,
  sun_position VARCHAR(32) NOT NULL,
  moon_position VARCHAR(32) NOT NULL,
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

INSERT INTO Locations (earth_position, sun_position, moon_position) VALUES
('343.434','50.30', '12.34' ),
('7665.1232', '45.53', '40.10');

CREATE TABLE Researches (
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  sector_id INT,
  object_id INT, 
  natural_object_id INT,
  location_id INT,
  FOREIGN KEY sector_id REFERENCES Sector(id),
  FOREIGN KEY object_id REFERENCES Objects(id),
  FOREIGN KEY natural_object_id REFERENCES NaturalObjects(id),
  FOREIGN KEY location_id REFERENCES Locations(id)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

INSERT INTO Researches (first_name, last_name, sector_id, object_id, natural_object_id, location_id) VALUES
('Ivan','Ivanov', 1,null,null,1 ),
('Ivan','Ivanov', 2,null,null,2 ),
