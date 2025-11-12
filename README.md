
# 🍕 Pizza Sales SQL Analytics Project

## 🧾 Project Overview
The **Pizza Sales SQL Analytics Project** focuses on exploring business insights from pizza sales data using **MySQL**.  
It analyzes key performance metrics, identifies top-performing pizzas, and reveals sales patterns by category, size, and time period.  
The dataset used is `pizza_sales.csv`, imported into **MySQL Workbench** for analysis and visualization.

---

## 🧰 Tools & Technologies
- 🗄️ **MySQL Workbench** – for query execution and data exploration  
- 📊 **Excel / Power BI** – optional for visualizing insights  
- 🧮 **SQL** – to calculate KPIs and analyze trends  
- 💾 **pizza_sales.csv** – dataset used for analysis  

---

## 🎯 Business Objectives
- Track **total revenue**, **total orders**, and **average order value (AOV)**  
- Understand **sales trends by day and month**  
- Compare **pizza category and size performance**  
- Identify **top 5 and bottom 5 pizzas** by revenue and quantity sold  

---

## 📈 Key Performance Indicators (KPIs)
| KPI | SQL Query |
|------|------------|
| 💰 **Total Revenue** | `SELECT ROUND(SUM(total_price),2) AS Total_Revenue FROM pizza_sales;` |
| 🧾 **Total Orders** | `SELECT COUNT(DISTINCT(order_id)) AS Total_Orders FROM pizza_sales;` |
| 📦 **Total Pizzas Sold** | `SELECT SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales;` |
| 💹 **Average Order Value (AOV)** | `SELECT ROUND(SUM(total_price)/COUNT(DISTINCT(order_id)),2) AS Avg_Order FROM pizza_sales;` |
| 🍕 **Average Pizzas per Order** | `SELECT SUM(quantity)/COUNT(DISTINCT(order_id)) AS Avg_Pizzas_Per_Order FROM pizza_sales;` |

---

## 📊 Sales Performance Analysis

### 🗓️ **Daily & Monthly Trends**
```sql
-- Daily Orders Trend
SELECT DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS Order_Week,
       COUNT(DISTINCT(order_id)) AS Total_Orders
FROM pizza_sales
WHERE STR_TO_DATE(order_date, '%d-%m-%Y') IS NOT NULL
GROUP BY Order_Week
ORDER BY Total_Orders DESC;

-- Monthly Orders Trend
SELECT MONTHNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS Month_Name,
       COUNT(DISTINCT(order_id)) AS Total_Orders
FROM pizza_sales
GROUP BY Month_Name
ORDER BY Total_Orders DESC;

## 🍕 Sales Distribution by Category & Size
-- Sales by Pizza Category
SELECT pizza_category,
       ROUND(SUM(total_price), 2) AS Total_Revenue,
       ROUND((SUM(total_price)/(SELECT SUM(total_price) FROM pizza_sales))*100, 2) AS Percentage_Contribution
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Revenue DESC;

-- Sales by Pizza Size
SELECT pizza_size,
       ROUND(SUM(total_price), 2) AS Total_Revenue,
       ROUND((SUM(total_price)/(SELECT SUM(total_price) FROM pizza_sales))*100, 2) AS Percentage_Contribution
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

