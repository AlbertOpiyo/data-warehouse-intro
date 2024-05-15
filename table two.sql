create table DimStation(
	Stationid INT NOT NULL PRIMARY KEY,
	City VARCHAR
);

create table DimTruck(
	Truckid INT NOT NULL PRIMARY KEY,
	TruckType VARCHAR
);

create table DimDate(
	Dateid INT NOT NULL PRIMARY KEY,
	date DATE,
	Year INT,
	Quarter INT,
	QuarterName VARCHAR,
	Month INT,
	Monthname VARCHAR,
	Day INT,
	Weekday INT,
	WeekdayName VARCHAR
);

create table FactTrips(
	Tripdid INT NOT NULL PRIMARY KEY,
	Dateid INT NOT NULL REFERENCES DimDate (Dateid),
	Stationid INT NOT NULL REFERENCES DimStation (Stationid),
	Truckid INT NOT NULL REFERENCES DimTruck (Truckid),
	wastecollected NUMERIC
);