DROP TABLE IF EXISTS cars;
CREATE TABLE IF NOT EXISTS cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

DROP VIEW IF EXISTS cars_less_25k;
CREATE VIEW cars_less_25k AS
SELECT * FROM cars
WHERE cost < 25000;

SELECT * FROM cars_less_25k;

CREATE OR REPLACE VIEW cars_less_25k AS
SELECT * FROM cars
WHERE cost < 30000;

SELECT * FROM cars_less_25k;

CREATE OR REPLACE VIEW cars_audi_shkoda AS
SELECT * FROM Cars
WHERE name = "Audi" OR name = "Skoda";

SELECT * FROM cars_audi_shkoda;

SELECT train_id, station, station_time
SUBTIME(LEAD(station_time) OVER(PARTITION BY train_id ORDER BY train_id), station_time)
AS time_to_next_station
FROM Trains;