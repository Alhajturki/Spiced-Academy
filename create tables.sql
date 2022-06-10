 
 -- Importing the northwind data into PostgreSQL database--

 -- \d+ tablename to see the column names --
 
 psql -U postgres --enter the password-- 
-- Create a databsent --
CREATE DATABASE northwind_data;
\c northwind_data;
-- Create a table for categories -- 
CREATE TABLE categories(
    categoryID FLOAT,
    categoryName VARCHAR(255),
    description VARCHAR(255),
    picture TEXT
);
-- import with \COPY and file path --
\COPY categories(categoryID, categoryName, description, picture) FROM 'C:\Users\Lenovo\costmary-function-student-code\week5\northwind_data\categories.csv' DELIMITER ',' CSV HEADER;

-- make a second table for csv file for customers --
-- customerID companyName	contactName	contactTitle	address	city	region	postalCode	country	phone	fax--
CREATE TABLE customers(
    customerID VARCHAR(255),
    companyName TEXT,
    contactName VARCHAR(255),
    contactTitle VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    region VARCHAR(255),
    postalCode VARCHAR(255),
    country VARCHAR(255),
    phone TEXT,
    fax TEXT
);

\COPY customers(customerID, companyName, contactName, contactTitle, address, city, region, postalCode, country, phone, fax) FROM 'C:\Users\Lenovo\costmary-function-student-code\week5\northwind_data\customers.csv' DELIMITER ',' CSV HEADER;

-- make a third table for csv file for employee_territories --
-- employeeID	territoryID--

CREATE TABLE employee_territories(
    employeeID FLOAT,
    territoryID FLOAT
);

\COPY employee_territories(employeeID, territoryID) FROM 'C:\Users\Lenovo\costmary-function-student-code\week5\northwind_data\employee_territories.csv' DELIMITER ',' CSV HEADER;

-- make a fourth  table for csv file for employees --
-- employeeID	lastName	firstName	title	titleOfCourtesy	birthDate	
--hireDate	address	city	region	postalCode	country	homePhone	extension	
--photo	notes	reportsTo	photoPath --

CREATE TABLE employees(
    employeeID INT,
    lastName VARCHAR(255),
    firstName VARCHAR(255),
    title VARCHAR(255),
    titleOfCourtesy VARCHAR(255),
    birthDate time,
    hireDate time,
    address VARCHAR(255),
    city VARCHAR(255),
    region VARCHAR(255),
    postalCode VARCHAR(255),
    country varchar(255),
    homePhone TEXT,
    extension INT,
    photo TEXT,
    notes TEXT,
    reportsTo INT,
    photoPath TEXT
);

\COPY employees(employeeID,lastName,firstName,title,titleOfCourtesy,birthDate,hireDate,address,city,region,postalCode,country,homePhone,extension, photo,notes,reportsTo,photoPath) FROM 'C:\Users\Lenovo\costmary-function-student-code\week5\northwind_data\employees.csv' DELIMITER ',' CSV HEADER NULL
 AS 'NULL';

-- create fifth table for csv file order_details --
-- (orderID,productID,unitPrice,quantity,discount) --
CREATE TABLE order_details(
    orderID INT,
    productID INT,
    unitPrice FLOAT,
    quantity INT,
    discount FLOAT
);
\COPY order_details(orderID,productID,unitPrice,quantity,discount) FROM 'C:\Users\Lenovo\costmary-function-student-code\week5\northwind_data\order_details.csv' DELIMITER ',' CSV HEADER NULL AS 'NULL';

-- create sexth table for csv file orders --
-- (orderID,customerID,employeeID,orderDate,requiredDate,shippedDate,shipVia,freight,shipName,shipAddress,shipCity,shipRegion,shipPostalCode,shipCountry) --
CREATE TABLE orders(
    orderID INT,
    customerID VARCHAR(255),
    employeeID INT,
    orderDate time,
    requiredDate time,
    shippedDate time,
    shipVia INT,
    freight FLOAT,
    shipName VARCHAR(255),
    shipAddress VARCHAR(255),
    shipCity VARCHAR(255),
    shipRegion VARCHAR(255),
    shipPostalCode TEXT,
    shipCountry VARCHAR(255)
);
\COPY orders(orderID,customerID,employeeID,orderDate,requiredDate,shippedDate,shipVia,freight,shipName,shipAddress,shipCity,shipRegion,shipPostalCode,shipCountry) FROM 'C:\Users\Lenovo\costmary-function-student-code\week5\northwind_data\orders.csv' DELIMITER ',' CSV HEADER NULL AS 'NULL';

-- create sexth table for csv file products --
-- (productID,productName,supplierID,categoryID,quantityPerUnit,unitPrice,unitsInStock,unitsOnOrder,reorderLevel,discontinued)

CREATE TABLE products(
    productID INT,
    productName VARCHAR(255),
    supplierID INT,
    categoryID INT,
    quantityPerUnit TEXT,
    unitPrice FLOAT,
    unitsInStock INT,
    unitsOnOrder INT,
    reorderLevel INT,
    discontinued INT
);
\COPY products(productID,productName,supplierID,categoryID,quantityPerUnit,unitPrice,unitsInStock,unitsOnOrder,reorderLevel,discontinued) FROM 'C:\Users\Lenovo\costmary-function-student-code\week5\northwind_data\products.csv' DELIMITER ',' CSV HEADER NULL AS 'NULL';

-- create a table for csv file regions--
--(regionID,regionDescription)--

CREATE TABLE regions(
    regionID INT,
    regionDescription VARCHAR(255));

\COPY regions(regionID,regionDescription) FROM 'C:\Users\Lenovo\costmary-function-student-code\week5\northwind_data\regions.csv' DELIMITER ',' CSV HEADER NULL AS 'NULL';

-- create table  for csv file shippers--
--(shipperID,companyName,phone)--
CREATE TABLE shippers(
    shipperID INT,
    companyName VARCHAR(255),
    phone TEXT
);
\COPY shippers(shipperID,companyName,phone) FROM 'C:\Users\Lenovo\costmary-function-student-code\week5\northwind_data\shippers.csv' DELIMITER ',' CSV HEADER NULL AS 'NULL';

-- create table  for csv file suppliers--
--(supplierID,companyName,contactName,contactTitle,address,city,region,postalCode,country,phone,fax,homePage)--

CREATE TABLE suppliers(
    supplierID INT,
    companyName VARCHAR(255),
    contactName VARCHAR(255),
    contactTitle VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    region VARCHAR(255),
    postalCode VARCHAR(255),
    country VARCHAR(255),
    phone TEXT,
    fax TEXT,
    homePage TEXT
);
\COPY suppliers(supplierID,companyName,contactName,contactTitle,address,city,region,postalCode,country,phone,fax,homePage) FROM 'C:\Users\Lenovo\costmary-function-student-code\week5\northwind_data\suppliers.csv' DELIMITER ',' CSV HEADER NULL AS 'NULL';

-- create table for csv file territories -- 
--(territoryID,territoryDescription,regionID)

CREATE TABLE territories(
    territoryID INT,
    territoryDescription VARCHAR(255),
    regionID INT
);

\COPY territories(territoryID,territoryDescription,regionID) FROM 'C:\Users\Lenovo\costmary-function-student-code\week5\northwind_data\territories.csv' DELIMITER ',' CSV HEADER NULL AS 'NULL';

---- End ---

















