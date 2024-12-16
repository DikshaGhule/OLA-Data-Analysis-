create database ola;
use ola;
select * from bookings;
-- 1. Retrieve all successful bookings:--
create view Successful_Bookings as
select * from bookings
where booking_status ="success";

select * from Successful_Bookings;

-- 2. Find the average ride distance for each vehicle type:
CREATE VIEW ride_distance_for_each_vehicle AS
select Vehicle_Type,avg(Ride_Distance)
as avg_distance from bookings
group by Vehicle_Type;

select * from ride_distance_for_each_vehicle;

-- 3. Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customers as
select count(*) from bookings
where booking_status="Canceled by Customer";

select * from cancelled_rides_by_customer;

--  4. List the top 5 customers who booked the highest number of rides:
create view  top_5_customers as
select Customer_ID,count(Booking_ID) as total_rides
from bookings
group by Customer_ID
order by total_rides desc limit 5;

select * from top_5_customers;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Rides_cancelled_by_drivers as
select count(*) from bookings
where Canceled_Rides_by_Driver="Personal & Car related issue";

select * from Rides_cancelled_by_drivers;

 -- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
 create view Driver_Ratings as
 select min(Driver_Ratings) as min_rating,
 max(Driver_Ratings) as max_rating
 from bookings
 where Vehicle_Type='Prime Sedan';
 
 select * from Driver_Ratings;
 
 -- 7. Retrieve all rides where payment was made using UPI:
  create view payment_UPI as
  select * from bookings
  where Payment_Method='UPI';

 select * from payment_UPI;
 
 --  8. Find the average customer rating per vehicle type:
 create view vehicle_type as
 select Vehicle_Type, avg(Customer_Rating)
 from bookings
 group by Vehicle_Type;
 
 select * from vehicle_type;

 -- 9. Calculate the total booking value of rides completed successfully:
create view total_successful_value as
select sum(Booking_Value)
from bookings
where Booking_Status="Success";

select * from total_successful_value;

-- 10. List all incomplete rides along with the reason
create view Incomplete_Rides_Reasonss as
select Booking_ID,Incomplete_Rides_Reason
from bookings
where Incomplete_Rides_Reason='Null';

select * from Incomplete_Rides_Reasonss;
select * from bookings;