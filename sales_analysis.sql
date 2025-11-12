CREATE DATABASE pizza_sales_db;
USE pizza_sales_db;
select * from pizza_sales;
select count(*) from pizza_sales;

-- KIP's
select round(sum(total_price),2) as Total_revenue from pizza_sales;
select round(sum(total_price)/count(distinct(order_id)),2) as Avg_order from pizza_sales;
select sum(quantity) as Total_Pizza_sold from pizza_sales;
select count(distinct(order_id)) as Total_orders from pizza_sales;
select sum(quantity)/count(distinct(order_id)) as Avg_Pizzas_per_order from pizza_sales;

select * from pizza_sales;
--- requirements
--- daily trend for Total Orders
SELECT DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS Order_Week, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
WHERE STR_TO_DATE(order_date, '%d-%m-%Y') IS NOT NULL
GROUP BY Order_Week
ORDER BY Total_Orders DESC;

---- monthly trend for Total Orders
select monthname(str_to_date(order_date, '%d-%m-%Y')) as Month_Name , count(distinct(order_id)) as Total_Orders from pizza_sales
group by Month_Name
order by Total_Orders desc; 

--- precentage of sales by pizza category
select pizza_category, round(sum(total_price), 2) as Total_Revenue,round( (sum(total_price) / (select sum(total_price) from pizza_sales) *100 ), 2)as ptc from pizza_sales
group by pizza_category;


--- precentage of sales by pizza size
select pizza_size, round(sum(total_price)) as Total_Revenue,round( (sum(total_price) / (select sum(total_price) from pizza_sales) *100 ), 2)as ptc from pizza_sales
group by pizza_size
order by pizza_size;

---- Total Pizaas sold By Pizaa category 
select pizza_category, count(distinct(pizza_id)) as Total_Revenue from pizza_sales
group by pizza_category
order by Total_Revenue desc;

--- Top 5 Best Sellers by Total pizza sold as per Revenue
select pizza_name , sum(total_price) as Total from pizza_sales
group by pizza_name
order by Total desc
limit 5;

---- Top 5 Best Sellers by Total pizza sold as per Quantity
SELECT pizza_name, SUM(quantity) AS total_pizzas_sold FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_pizzas_sold DESC
LIMIT 5;

--- Bottom 5 Best Sellers by Total pizza sold as per Revenue
select pizza_name , round(sum(total_price),2) as Total from pizza_sales
group by pizza_name
order by Total asc
limit 5;

---- Bottom 5 Best Sellers by Total pizza sold as per Quantity
SELECT pizza_name, SUM(quantity) AS total_pizzas_sold FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_pizzas_sold asc
LIMIT 5;

--- Top 5 Pizzas by Total Orders
select* from pizza_sales;
select pizza_name, count(distinct(order_id)) as Total_Oreder from pizza_sales
group by pizza_name
order by Total_Oreder desc
limit 5;

--- Bottom 5 Pizzas by Total Orders
select pizza_name, count(distinct(order_id)) as Total_Oreder from pizza_sales
group by pizza_name
order by Total_Oreder asc
limit 5;






