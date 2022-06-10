
--Throughout the week write SQL queries to answer the questions below
-- \d+ tablename to see the column names --
  --psql -U postgres --enter the password-- 
--start the analysis: 
-- ******for the output click on the arrow sign******--

--1- Get the names and the quantities in stock for each product.
SELECT productname,  quantityPerUnit FROM products;


--2- Get a list of current products (Product ID and name).
SELECT productid, productname FROM products ORDER BY productid DESC LIMIT 5;

--3- Get a list of the most and least expensive products (name and unit price).

SELECT productname, MIN(unitprice) min_price, MAX(unitprice) max_price FROM products GROUP BY productname;

--4- Get products that cost less than $20.  

SELECT unitprice FROM products WHERE unitprice <20;

--6- using subquery:
SELECT productname, unitprice FROM products WHERE unitprice > (SELECT AVG(unitprice) FROM products);

--7- Find the ten most expensive products.
SELECT unitprice, productname FROM products ORDER BY unitprice DESC LIMIT 10;
    
--8- Get a list of discontinued products (Product ID and name).
SELECT productid, productname FROM products WHERE discontinued = 1;

--9- Count current and discontinued products.
SELECT COUNT(discontinued) FROM products GROUP BY discontinued;

--10- Find products with less units in stock than the quantity on order.
SELECT unitsinstock, unitsonorder FROM products WHERE unitsinstock < unitsonorder;

--11- Find the customer (order) who had the highest order amount (order_details for quantity)
      --first join orderid from oderds and then create a view than anwer the question
CREATE VIEW customer_order_details AS SELECT orders.orderid, orders.customerid, order_details.quantity FROM orders RIGHT JOIN order_details ON orders.orderid=order_details.orderid;
SELECT * FROM customer_order_details ORDER BY quantity DESC LIMIT 5;

--12- Get orders for a given employee and the according customer
SELECT COUNT(orderid) FROM orders WHERE employeeid=1 and customerid='ERNSH';

--13- Find the hiring age of each employee
--first alter the time into timestamp for birthday and hiredate:
ALTER TABLE employees ALTER birthdate TYPE TIMESTAMP USING ('2000-1-1'::date+ birthdate);
ALTER TABLE employees ALTER hiredate TYPE TIMESTAMP USING ('2022-1-1'::date+ hiredate);
--tow ways using age function:
SELECT firstname, lastname, age(CAST(employees.birthdate AS DATE), CAST(employees.hiredate AS DATE)) FROM employees;
--or
SELECT firstname, lastname, AGE(hiredate, birthdate) AS hirign_age FROM employees;

--14- Create views and/or named queries for some of these queries
-- was done already in question 11 
---End with questions---


--the right one for creating and entering data to the cloud:
--psql -f northwind.sql -U postgres -h db-costmary.ccvggwfe5agt.eu-central-1.rds.amazonaws.com -p 5432 -d northwind_dema
--psql -U postgres -h db-costmary.ccvggwfe5agt.eu-central-1.rds.amazonaws.com

--mintty pg_dump northwind_data > northwind.sql
--psql -U postgres -h db-costmary.ccvggwfe5agt.eu-central-1.rds.amazonaws.com