Create Table MyDimDate(
	date_id INT NOT NULL PRIMARY KEY,
	date Date,
	year INT,
	quarter VARCHAR(2),
	Month INT,
	monthname VARCHAR(20),
	day INT,
	weekday VARCHAR(20)
);

Create Table myDimWaste(
	waste_id INT NOT NULL PRIMARY KEY,
	waste_type VARCHAR(20)
);

create Table myDimZone(
	zone_id INT NOT NULL PRIMARY KEY,
	zone_name VARCHAR(20),
	city VARCHAR(40)
);

Create Table myFactTrips(
	trip_id INT NOT NULL PRIMARY KEY,
	trip_number INT NOT NULL,
	waste_id INT NOT NULL REFERENCES MyDimWaste (waste_id),
	zone_id INT NOT NULL REFERENCES MyDimZone (zone_id),
	date_id INT NOT NULL REFERENCES MyDimDate (date_id),
	waste_in_tons NUMERIC(5,2)
);