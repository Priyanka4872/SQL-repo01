SELECT * FROM sales; 
select Product_Category, round(avg(rating),2) as average_rating,
 round(avg(purchase_amount),2) as average_purchase_value
 from sales
 group by Product_Category 
 order by round(avg(purchase_amount),2);

select product_category,
country,
 sum(purchase_amount) 
from sales
group by country, Product_Category
order by sum(purchase_amount) desc;

SELECT STUD_ID,
STUD_NAME,
GPA,
ROW_NUMBER() OVER(ORDER BY GPA DESC) AS GPARANK
FROM STUDENT;

select Product_Category,
country,
row_number() over(partition by country order by sum(purchase_amount) desc) as sales_rank
from sales
group by country, product_category;


select product_category,
round(avg(purchase_amount),2) as average_purchase_value
from sales
group by Product_Category
order by average_purchase_value desc;


select product_category,country,
round(avg(rating),2) as average_rating,
round(avg(purchase_amount),2) as average_purchase_value
from sales
where purchase_amount>10000


group by product_category, country
order by average_purchase_value desc;

select * from sales 
where rating<2.0 and purchase_amount>10000
order by purchase_amount desc;

select * from sales 
order by purchase_amount desc limit 10;

select gender,
count(*) as total_orders
from sales
group by gender;

select country,product_category, Purchase_Amount,
row_number()over(partition by country order by purchase_amount desc) as rankk
from sales;

select country,product_category,total_amount,gender
from(
select country, Product_Category,gender,
 sum(purchase_amount) as total_amount,
 row_number() over(partition by country order by sum(purchase_amount) desc) as rankk
 from sales
 group by country,product_category,gender
 )as tablee
 where rankk=1;
 
 select country,product_category,purchase_amount,rating
from sales
order by purchase_amount desc
limit 5;

select country,
count(distinct name) as unique_customers,
sum(Purchase_Amount) as tota_spent
from sales
group by country;
