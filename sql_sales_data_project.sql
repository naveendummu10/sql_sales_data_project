create database sql_project;
create table sales_data
(
transactions_id int primary key,
	sale_date date,	
    sale_time time,	
    customer_id	int,
    gender	varchar(10),
    age	int,
    category varchar(15),	
    quantiy int,
	price_per_unit float,
	cogs float,	
    total_sale float
    );
select * from sales_data limit 10;
select count(*) from sales_data;
select * from sales_data where transactions_id is null;
select * from sales_data where sale_date is null;
select * from sales_data
where
transactions_id is null
or
sale_date is null
or
sale_time is null
or
gender is null
or
category is null
or
quantiy is null
or 
cogs is null
or 
total_sale is null;
delete from sales_data
where
transactions_id is null
or
sale_date is null
or
sale_time is null
or
gender is null
or
category is null
or
quantiy is null
or 
cogs is null
or 
total_sale is null;
SET SQL_SAFE_UPDATES = 0;
-- how many sales we have
select count(*) as total_sales from sales_data;
-- how many custmers 
select count(distinct(customer_id)) from sales_data;
select distinct category from sales_data;
select * from sales_data where sale_date='2022-11-05';
select * from sales_data where category='clothing' and quantiy>=4 and date_format(sale_date,'%y-%m')='22-11';
select category,sum(total_sale) as net_sale,count(*) as total_order from sales_data group by 1;
select avg(age) from sales_data where category='beauty';
select *  from sales_data where total_sale>1000;
select gender,category,count(transactions_id)  from sales_data group by 1,2;
select * from(select 
extract(year from sale_date)as year,
extract(month from sale_date) as month,
round(avg(total_sale))as avg_sale,
rank()over(partition by extract(year from sale_date)order by round(avg(total_sale)) desc)as ranks 
 from sales_data group by 1,2 order by 1,2) as t where ranks=2;
 select *  from sales_data order by total_sale desc limit 5;
 select customer_id,sum(total_sale)  from sales_data group by 1 order by 1,2 limit 5;
 select category,count(distinct(customer_id))  from sales_data group by 1;
 select*,
 case
 when extract(hour from sale_time)<12 then 'morning'
 when extract(hour from sale_time) between 12 and 17 then 'afternoon'
 else 'eveing'
 end as shift from sales_data;
 -- end of project