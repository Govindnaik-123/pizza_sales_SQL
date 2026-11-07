select * from pizza_sales;

select round(sum(total_price),2) as total_revenue from pizza_sales;

select sum(total_price)/count(distinct order_id) as avg_order_value from pizza_sales;

select sum(quantity) as total_pizza_sold from pizza_sales;

select count(distinct order_id) as total_orders from pizza_sales;

select cast(cast(sum(quantity)as decimal(10,2))/
cast(count(distinct order_id)as decimal(10,2) )as decimal(10,2)) 
as Avg_pizza_per_Order from pizza_sales;

select DATEPART(week,order_date) as weekly_orders ,year(order_date) as Order_Year, count(distinct Order_id) as Total_orders 
from pizza_sales
group by DATEPART(week,order_date),year(order_date)
order by DATEPART(week,order_date),year(order_date);


select * from pizza_sales;

select pizza_category,sum(total_price)*100 /(select sum(total_price) from pizza_sales where month(order_date)=2)
as total_sales_percentage from pizza_sales
where month(order_date)=2
group  by pizza_category;

select pizza_size,round(sum(total_price)*100 /(select sum(total_price) from pizza_sales) ,2)
as total_sales_percentage from pizza_sales
group  by pizza_size
order by total_sales_percentage ;

select top 5 pizza_name , sum(total_price) as total_revenue from pizza_sales 
group by pizza_name
order by total_revenue desc;


select top 5 pizza_name , sum(Quantity) as total_Quantity from pizza_sales 
group by pizza_name
order by total_Quantity desc;


select top 5 pizza_name , count(distinct order_id) as total_orders from pizza_sales 
group by pizza_name
order by total_orders desc;
