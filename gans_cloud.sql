/***************************
Setting up the environment
***************************/
-- Drop the database if it already exists
DROP DATABASE IF EXISTS gans_cloud;

-- Create the database
CREATE DATABASE gans_cloud;

-- Use the database
USE gans_cloud;


/***************************
Creating the first table
***************************/

-- Create the 'city' table

CREATE TABLE IF NOT EXISTS cities_info (
    City_id INT AUTO_INCREMENT, -- Automatically generated ID for each city
    City VARCHAR(255) NOT NULL, -- Name of the city
    Country VARCHAR(255) NOT NULL, -- Name of the country
    Latitude FLOAT, -- Latitude of city
    Longitude FLOAT, -- Longitude of city
    PRIMARY KEY (City_id) -- Primary key to uniquely identify each city
);

/* SQL is not dynamic. therefore we need to specify datatype*/
/* An auto-increment attribute automatically generates a unique number
(typically used for a primary key) for each new record inserted into a table. */

/* A primary key is a unique identifier for each record in a database table,
ensuring that no two rows have the same value in this column. */

/* VARCHAR(255) data type can store strings of up to 255 characters, 
but strings can also be shorter than that. 
VARCHAR stands for "variable character"*/

/* NOT NULL constraint is used to specify that a column must not be NULL. 
This means that when you insert a new row into a table or update an existing row, 
you must provide a value for the column. */

/***************************
Creating the second table
***************************/

-- Create the 'population' table
CREATE TABLE IF NOT EXISTS cities_population (
    Population_id INT AUTO_INCREMENT, -- Automatically generated ID for each city
    Population INT NOT NULL, -- Population of the city
    Population_retrieved_date DATETIME NOT NULL, -- Population retrive date
    City_id INT, -- ID of the city
    PRIMARY KEY (Population_id), -- Primary key to uniquely identify each population with city
    FOREIGN KEY (City_id) REFERENCES cities_info(City_id) -- Foreign key to connect each population to its city
);

/* INT is a numeric data type that stores signed integers. 
This means that INT values can represent both positive and negative whole numbers. */

/* A foreign key is a constraint that links a column in one table to a primary key in another table. */

-- Create the 'weather' table
CREATE TABLE IF NOT EXISTS cities_weather (
    Weather_id INT AUTO_INCREMENT, -- Automatically generated ID for each city
    City_id INT NOT NULL, -- ID of the city
    Forecast_utc_time DATETIME NOT NULL, -- Weather forecast retrieve date, ISO, UTC
    City_time DATETIME NOT NULL, -- Weather forecast retrieve date according city timezone
    Part_of_day VARCHAR(10) NOT NULL, -- Part of the day (n-night, d-day)
    Weather_condition VARCHAR(100) NOT NULL, -- weather_condition within the group
    Cloudiness_percent FLOAT NOT NULL, -- cloudiness in percentage
	Temp_deg FLOAT NOT NULL, -- actual feels like temperature in degree celcius
    Wind_speed_M_per_sec FLOAT NOT NULL, -- wind speed in meter/sec
    Rain_probability_percent FLOAT NOT NULL, -- pop-Probability_of_Perception values between 0 & 1. Indicated probabiltiy of rain
    
    PRIMARY KEY (Weather_id), -- Primary key to uniquely identify each population with city
    FOREIGN KEY (City_id) REFERENCES cities_info(City_id) -- Foreign key to connect each population to its city
);

-- Create the 'cities_airport' table
/*CREATE TABLE IF NOT EXISTS cities_airport (

    icao VARCHAR(10), -- Airport unique code
    City_id INT, -- ID of the city
	PRIMARY KEY (icao), -- Primary key to uniquely identify each airport
    -- PRIMARY KEY (City_id),
    FOREIGN KEY (City_id) REFERENCES cities_info(City_id) -- Foreign key to connect each airport to its city
);*/

-- Create the 'airport' table
CREATE TABLE IF NOT EXISTS airports (

    icao VARCHAR(10), -- Airport unique code
    Airport_name VARCHAR(100) NOT NULL, -- Airport name
    City_id INT NOT NULL, -- ID of the city
    PRIMARY KEY (icao), -- Primary key to uniquely identify each airport
    FOREIGN KEY (City_id) REFERENCES cities_info(City_id) -- Foreign key to connect each airport to its city
);

-- Create the 'flight' table
CREATE TABLE IF NOT EXISTS flights (
    Flight_id INT AUTO_INCREMENT,
    Arrival_airport_icao VARCHAR(10), -- Airport unique code
    Arrival_airport_name VARCHAR(100), -- Arrival Airport name 
    Departure_airport_icao VARCHAR(10), -- Daparture Airport unique code
    Flight_number VARCHAR(50),
    Arrival_time DATETIME,
    Data_retrieved_time DATETIME,
    City_id INT, -- ID of the city
    PRIMARY KEY (Flight_id), -- Primary key to uniquely identify each airport
    FOREIGN KEY (Arrival_airport_icao) REFERENCES airports(icao) -- Foreign key to connect each arrival airport to its airport in table
    -- FOREIGN KEY (City_id) REFERENCES airports(City_id)
);


SELECT * 
FROM cities_info;

SELECT *
FROM cities_population;

SELECT *
FROM airports;

SELECT *
FROM cities_weather;

SELECT *
FROM flights;

