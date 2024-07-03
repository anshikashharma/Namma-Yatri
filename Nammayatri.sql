use namma_yatri;
show tables;
select * from assembly;
Select * from duration;
select * from payment;
select* from trip_details;
select * from trips;

-- TOTAL TRIPS
select count( distinct tripid) from trip_details;

-- CHECHING FOR DUPLICATE VALUES
select tripid , count(tripid) as CNT
from trip_details
group by tripid
having count(tripid)>1;

-- TOTAL DRIVERS
select count(distinct driverid)as total_drivers from trips;

-- TOTAL EARNINGS   
select sum(fare) as total_earnings from trips;

-- TOTAL COMPLETED TRIPS 
select count(tripid) from trip_details
where end_ride=1;

-- TOTAL SEARCHES 
select* from trip_details;
select count(searches) from trip_details 
where searches=1;
-- TOTAL SEARCHES WHICH GOT ESTIMATE
select count(searches_got_estimate) as search_estimated from trip_details
where searches_got_estimate=1;

-- TOTAL SEARCHES FOR QUOTES
select count(searches_for_quotes) as searches from trip_details
where searches_for_quotes=1;

-- TOTALSEARCHES WHICH GOT QUOTES
select sum(searches_got_quotes) as got_qoutes from trip_details;

-- TOTAL DRIVER CANCELLED
select count(*) - sum(driver_not_cancelled) from trip_details;

-- TOTAL OPT ENETERED
select sum(otp_entered) from trip_details;

-- TOTAL END RIDES
select sum(end_ride) from trip_details;

-- AVERAGE DISTANCE PER TRIP
select avg(distance) from trips;

-- AVERAGE FARE PER TRIP
select round(avg(fare)) from trips;

-- DISTANCE TRAVELLED
select sum(distance) from trips;

-- MOST USED PAYMENT MODE
select * from trips;
select * from payment;

select payment.method 
from payment 
inner join 
(
select faremethod, count(*) as total 
from trips
group by faremethod
order by total desc 
limit 1
) as most_used
on payment.id= most_used.faremethod;

-- HIGHEST MADE THROUGH WHICH INSTRUMENT
Select a.method 
FROM payment a 
INNER JOIN (
SELECT * 
FROM trips 
ORDER BY fare DESC 
LIMIT 1
) b 
ON a.id = b.faremethod;

Select a.method 
FROM payment a 
INNER JOIN 
(
Select faremethod, SUM(fare) AS total_fare 
FROM trips 
GROUP BY faremethod 
ORDER BY total_fare DESC 
LIMIT 1
) b 
ON a.id = b.faremethod;

 

