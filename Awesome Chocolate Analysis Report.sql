
-- Awesome Chocolate Analysis Report (SQL Project-1)

/*
Current dataset for this project contains records of Awesome Chocolate Company.
It includes four tables, Sales Table, Product Table, People Table and Geographycial Data.
Each Table have details variables for better understanding of Data.
*/

-- Q1) Overview of Dataset.


show tables;

-----------------------------------------------------------------------------------


-- Q1) Getting Sales table records for further analysis.

Select * from sales;

-----------------------------------------------------------------------------------


-- Q2) Getting Product table records for further analysis.

Select * from products;

-----------------------------------------------------------------------------------


-- Q3) Getting Peopel table records for further analysis.

Select * from people;

-----------------------------------------------------------------------------------


-- Q4) Getting Geography table records for further analysis.

Select * from geo;

-----------------------------------------------------------------------------------


-- Q5) Total Sales for further analysis.

Select sum(amount) from sales;

-----------------------------------------------------------------------------------


-- Q6) Print details of shipments (sales) where amounts are > 2,000 and boxes are <100?

Select saledate, amount, Customers, Boxes from sales
where amount > 2000 and boxes <100
order by boxes asc;

-----------------------------------------------------------------------------------


-- Q7) How many shipments (sales) each of the sales persons had in the month of January 2022?

select  s.SaleDate, p.Salesperson as Person,  s.Amount, s.Boxes, s.Customers  from sales as s
join people as p on p.SPID= s.SPID
where year(saledate) = 2022 and  month(SaleDate) = 1; 

-----------------------------------------------------------------------------------


-- Q8) Which product sells more boxes? Milk Bars or Eclairs?

select  p.product, sum(s.Boxes) as Boxes from sales as s
join products as p on p.PID = s.PID
where p.product in ('Milk Bars', 'Eclairs')
group by p.Product
order by Boxes desc;

-----------------------------------------------------------------------------------


-- Q9) Which product sold more boxes in the first 7 days of February 2022? Milk Bars or Eclairs?

select  p.product, sum(s.Boxes) as Boxes from sales as s
join products as p on p.PID = s.PID
where s.saledate between '2022-02-01' and '2022-02-07' and   p.Product in ('Milk Bars', 'Eclairs')
group by p.Product
order by boxes desc;

-----------------------------------------------------------------------------------


-- Q10) Which shipments had under 100 customers & under 100 boxes? Did any of them occur on Wednesday?

select * from sales

where 
weekday(saledate) = '2' and customers between 0 and 100 and boxes between 0 and 100
order by saledate asc;

-----------------------------------------------------------------------------------


-- Q11) What are the names of salespersons who had at least one shipment (sale) in the first 7 days of January 2022?

select p.Salesperson, s.saledate, s.Customers, s.Amount, s.boxes  from sales as s
join people as p on p.spid = s.spid
where SaleDate between '2022/01/01' and '2022/01/07' and s.customers = '1'
order by s.SaleDate asc; 

-----------------------------------------------------------------------------------


-- Q12) Which salespersons did not make any shipments in the first 7 days of January 2022?

select p.Salesperson, s.saledate, s.Customers, s.Amount, s.boxes  from sales as s
join people as p on p.spid = s.spid
where SaleDate between '2022/01/01' and '2022/01/07' and s.customers = '0'
order by s.SaleDate asc; 

-----------------------------------------------------------------------------------


-- Q13) How many times we shipped more than 1,000 boxes in each month ?

select date_format(saledate,'%Y-%M') as month, count(*) from sales
where boxes > 1000
group by month;

-----------------------------------------------------------------------------------


-- Q14) Did we ship at least one box of ‘After Nines’ to ‘New Zealand’ on all the months?

select s.SaleDate, g.Geo, p.Product, s.boxes   from sales as s
join products	as p on p.PID =	s.PID
join geo as g on g.GeoId = s.GeoId
where geo = 'New Zealand' and product = 'After Nines' 
order by boxes asc
;

-----------------------------------------------------------------------------------


-- Q15) India or Australia? Who buys more chocolate boxes on a monthly basis? 

select g.Geo, sum(s.boxes) as Total_Buying from sales as s 
join geo as g on g.GeoId = s.GeoId
where Geo in('Australia','India')
group by Geo
order by Total_Buying desc; 

-----------------------------------------------------------------------------------



