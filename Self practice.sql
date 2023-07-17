Use retail_mart_management_datasets;

# 5.Write a query to add two new columns such as S_no and categories to the sales table.
ALTER TABLE sales ADD (s_no int, categories varchar(50));
SELECT* FROM sales;

/* 6.Write a query to change the column type of stock in the product table to varchar.*/
ALTER TABLE product MODIFY stock varchar(50);

/*7.	Write a query to change the table name from customer-to-customer details.*/
ALTER TABLE customer RENAME TO customer_details;


/* 8.	Write a query to drop the columns S_no and categories from the sales table.*/
ALTER TABLE sales drop column s_no;
ALTER TABLE sales drop column categories;
SELECT* FROM sales;



/* 9.	Write a query to display order id, customer id, order date, price, and quantity 
from the sales table.*/
SELECT order_no,c_id,order_date,price,qty FROM sales;

/* 10.	Write a query to display all the details in the product table if the 
category is stationary.*/
SELECT * FROM product
WHERE category='stationary';


/* 11.	Write a query to display a unique category from the product table.*/
SELECT DISTINCT category 
FROM product;

/* 12.	Write a query to display the sales details if quantity is greater than 2 
and price is lesser than 500 from the sales table.*/ 
SELECT* FROM SALES
# WHERE qty>2 AND price<500;    ## it will display only few values 
WHERE qty>2 OR price<500;       ## it will display all values


/* 13.	Write a query to display the customer’s name if the name ends with a.*/
SELECT* FROM customer_details
WHERE c_name LIKE '%a';
# WHERE c_name LIKE 'a%';
#WHERE c_name LIKE '%a%';
# %a, a%,a_%,_a%,a_a%,a__a%,%a%,


/* 14.	Write a query to display the product details in descending order of the price.*/
SELECT* FROM product
ORDER BY price desc;


/* 15.	Write a query to display the product code and category from similar 
categories that are greater than or equal to 2.*/
SELECT count(p_code),category
FROM product
GROUP BY category
having count(p_code)>=2;

/* 16.	Write a query to display the order number and the customer name to combine 
the results of the order and the customer tables including duplicate rows.*/
SELECT sales.order_no, customer_details.c_name
FROM sales
LEFT Join customer_details
   ON sales.c_id=customer_details.c_id
UNION ALL
SELECT sales.order_no, customer_details.c_name
FROM sales
RIGHT Join customer_details
   ON sales.c_id=customer_details.c_id;











