-- Create a grouping sets query using the columns stationid, trucktype, total waste collected.
select
	f.stationid,
	t.trucktype,
	sum(f.wastecollected)
from facttrips as f
left join dimtruck as t
on f.truckid= t.truckid
group by 
	grouping sets(1,2);
	
-- Create a rollup query using the columns year, city, stationid, and total waste collected.
select
	f.stationid,
	d.year,
	s.city,
	sum(f.wastecollected)
from facttrips as f
left join dimstation as s
on f.stationid= s.stationid
left join dimdate as d
on f.dateid=d.dateid
group by 
	rollup(1,2,3);
	
-- Create a cube query using the columns year, city, stationid, and average waste collected
select
	f.stationid,
	d.year,
	s.city,
	avg(f.wastecollected)
from facttrips as f
left join dimstation as s
on f.stationid= s.stationid
left join dimdate as d
on f.dateid=d.dateid
group by 
	cube(1,2,3);
	
-- Create an MQT named max_waste_stats using the columns city, stationid, trucktype, and max waste collected.
CREATE MATERIALIZED VIEW max_waste_stats AS
SELECT
    s.city,
    f.stationid,
    t.truckType,
    MAX(f.wastecollected) AS MaxWasteCollected
FROM
    FactTrips  as f
JOIN
    DimStation s ON f.stationid = s.stationid
JOIN
    DimTruck as t ON f.Truckid = t.Truckid
GROUP BY
    1,2,3;

-- Optionally, add indexes or perform REFRESH MATERIALIZED VIEW to populate the data
-- CREATE INDEX idx_max_waste_stats ON max_waste_stats ("City", "Stationid", "TruckType");
-- REFRESH MATERIALIZED VIEW max_waste_stats;