create database demo_s;

use demo_s;

select * from demo_s.Supermarket;

-- 1. Display the first 5 rows from the dataset.
select * from Supermarket limit 5;

-- 2. Display the last 5 rows from the dataset.
select * from Supermarket order by 'Invoice ID' desc limit 5;  


-- 3. Display random 5 rows from the dataset.
select * from Supermarket order by rand() desc limit 5;  

-- 4. Display count, min, max, avg, and std values for a column(gross income) in the dataset.
select count(`gross income`) as count, 
min(`gross income`) as minimum,
max(`gross income`) as maximum,
avg(`gross income`) as average,
std(`gross income`) as Standard_deviation
from Supermarket;  

-- 5. Find the number of missing values.
select count(*) as null_value from supermarket where branch is null;

-- 6. Count the number of occurrences of each city.
select city, count(city) as no_of_cities from supermarket group by city; 

-- 7. Find the most frequently used payment method.
select  payment, count(*) as Payment_count 
from supermarket 
group by payment 
order by count(*) desc;

-- 8. Does The Cost of Goods Sold Affect The Ratings That The Customers Provide?
select Rating, cogs from supermarket;

-- 9. Find the most profitable branch as per gross income. 
select branch, round(sum(`gross income`),2) as sum_gross_income from supermarket
group by branch order by sum_gross_income;


-- 10. Find the most used payment method city-wise.
select city,
sum(case when payment = "cash" then 1 else 0 end) as "cash",
sum(case when payment = "Ewallet" then 1 else 0 end) as "Ewallet",
sum(case when payment = "credit card" then 1 else 0 end) as "Credit_casrd"
from supermarket group by city;


-- 11. Find the product line purchased in the highest quantity.
select `Product line`, sum(quantity) as Total_quantity from supermarket
group by `Product line` order by Total_quantity desc;

-- 12. Find the time at which sales are highest. 
select hour(Time) as hour, sum(Total) as total from supermarket
group by hour order by total desc;

-- 13. Which gender spends more on average? 
select Gender, avg(`gross income`) from supermarket group by Gender;
