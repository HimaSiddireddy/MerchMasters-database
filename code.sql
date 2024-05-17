# MerchMasters Database Design
This repository contains the comprehensive SQL code for designing and implementing the database for MerchMasters, a sports merchandise brand.

- **Comprehensive Database Design**: Detailed ER and Relationship Diagrams.
- **Extensive Table Creation**: Tables for SUPPLIERS, EMPLOYEES, SHIPPERS, STORES, CATEGORY, MEMBERSHIP, PAYMENT, CUSTOMERS, PRODUCTS, ORDERS, ORDERDETAILS, and INVENTORY.
- **Robust SQL Implementation**: Primary and foreign keys, data insertion, and management.
- **Realistic Data Entry**: Sample data to simulate a functioning sports merchandise business.


create database merchmasters;
use merchmasters;

CREATE TABLE SUPPLIERS
(
  Supplier_ID INT NOT NULL,
  Supplier_Name CHAR(50) NOT NULL,
  Supplier_Phone NUMERIC(50) NOT NULL,
  Supplier_Email VARCHAR(50) NOT NULL,
  Supplier_Address CHAR(50) NOT NULL,
  Supplier_Zip NUMERIC(50) NOT NULL,
  Supplier_City CHAR(50) NOT NULL,
  Contact_Name CHAR(50) NOT NULL,
  PRIMARY KEY (Supplier_ID)
);

CREATE TABLE EMPLOYEES
(
  Emp_ID INT NOT NULL,
  Emp_FName CHAR(50) NOT NULL,
  Emp_LName CHAR(50) NOT NULL,
  Emp_Email VARCHAR(50) NOT NULL,
  Emp_Address CHAR(50) NOT NULL,
  Emp_Title CHAR(30) NOT NULL,
  Emp_Phone NUMERIC(10) NOT NULL,
  Emp_HireDate DATE NOT NULL,
  Emp_Status CHAR(10) NOT NULL,
  Emp_EndDate INT NULL,
  PRIMARY KEY (Emp_ID)
);

CREATE TABLE SHIPPERS
(
  Company_ID INT NOT NULL,
  Company_Name CHAR(50) NOT NULL,
  Company_Phone NUMERIC(10) NOT NULL,
  Comapny_Email VARCHAR(50) NOT NULL,
  Comapny_Address CHAR(50) NOT NULL,
  PRIMARY KEY (Company_ID)
);

CREATE TABLE STORES
(
  Store_ID INT NOT NULL,
  Store_Address CHAR(50) NOT NULL,
  Store_City CHAR(50) NOT NULL,
  Store_Zip NUMERIC(10) NOT NULL,
  PRIMARY KEY (Store_ID)
);

CREATE TABLE CATEGORY
(
  Category_ID INT NOT NULL,
  Category_Name CHAR(50) NOT NULL,
  PRIMARY KEY (Category_ID)
);

CREATE TABLE MEMBERSHIP
(
  Mem_ID INT NOT NULL,
  Mem_Benefits VARCHAR(50) NOT NULL,
  PRIMARY KEY (Mem_ID)
);

CREATE TABLE PAYMENT
(
  TransactionID INT NOT NULL,
  Transaction_Date DATE NOT NULL,
  Payment_Status CHAR(50) NOT NULL,
  PRIMARY KEY (TransactionID)
);

CREATE TABLE Card
(
  TransactionID INT NOT NULL,
  PRIMARY KEY (TransactionID),
  FOREIGN KEY (TransactionID) REFERENCES PAYMENT(TransactionID)
);

CREATE TABLE Cash
(
  TransactionID INT NOT NULL,
  PRIMARY KEY (TransactionID),
  FOREIGN KEY (TransactionID) REFERENCES PAYMENT(TransactionID)
);

CREATE TABLE Cheque
(
  TransactionID INT NOT NULL,
  PRIMARY KEY (TransactionID),
  FOREIGN KEY (TransactionID) REFERENCES PAYMENT(TransactionID)
);

CREATE TABLE Classic
(
  Mem_ID INT NOT NULL,
  PRIMARY KEY (Mem_ID),
  FOREIGN KEY (Mem_ID) REFERENCES MEMBERSHIP(Mem_ID)
);

CREATE TABLE Gold
(
  Mem_ID INT NOT NULL,
  PRIMARY KEY (Mem_ID),
  FOREIGN KEY (Mem_ID) REFERENCES MEMBERSHIP(Mem_ID)
);

CREATE TABLE Diamond
(
  Mem_ID INT NOT NULL,
  PRIMARY KEY (Mem_ID),
  FOREIGN KEY (Mem_ID) REFERENCES MEMBERSHIP(Mem_ID)
);

CREATE TABLE Shaphire
(
  Mem_ID INT NOT NULL,
  PRIMARY KEY (Mem_ID),
  FOREIGN KEY (Mem_ID) REFERENCES MEMBERSHIP(Mem_ID)
);

CREATE TABLE Relationship
(
  Store_ID INT NOT NULL,
  Emp_ID INT NOT NULL,
  PRIMARY KEY (Store_ID, Emp_ID),
  FOREIGN KEY (Store_ID) REFERENCES STORES(Store_ID),
  FOREIGN KEY (Emp_ID) REFERENCES EMPLOYEES(Emp_ID)
);

CREATE TABLE CUSTOMERS
(
  Cust_ID INT NOT NULL,
  Cust_FName CHAR(50) NOT NULL,
  Cust_LName CHAR(50) NOT NULL,
  Cust_PhoneNo NUMERIC(10) NOT NULL,
  Cust_Email VARCHAR(50) NOT NULL,
  Cust_Address CHAR(50) NOT NULL,
  Cust_Zip NUMERIC(10) NOT NULL,
  Cust_City CHAR(50) NOT NULL,
  Cust_BillingAddress CHAR(50) NOT NULL,
  Mem_ID INT NOT NULL,
  TransactionID INT NOT NULL,
  PRIMARY KEY (Cust_ID),
  FOREIGN KEY (Mem_ID) REFERENCES MEMBERSHIP(Mem_ID),
  FOREIGN KEY (TransactionID) REFERENCES PAYMENT(TransactionID)
);

CREATE TABLE PRODUCTS
(
  Prod_ID INT NOT NULL,
  Prod_Name CHAR(50) NOT NULL,
  Prod_Status CHAR(30) NOT NULL,
  Reorder_Level NUMERIC(3) NOT NULL,
  Units_in_Stock NUMERIC(5) NOT NULL,
  Units_on_Order NUMERIC(5) NOT NULL,
  Unit_Price NUMERIC(10) NOT NULL,
  Category_ID INT NOT NULL,
  Supplier_ID INT NOT NULL,
  PRIMARY KEY (Prod_ID),
  FOREIGN KEY (Category_ID) REFERENCES CATEGORY(Category_ID),
  FOREIGN KEY (Supplier_ID) REFERENCES SUPPLIERS(Supplier_ID)
);

CREATE TABLE ORDERS
(
  Order_ID INT NOT NULL,
  Order_Date DATE NOT NULL,
  Est_date DATE NOT NULL,
  Shipped_Date DATE NOT NULL,
  Ship_Address CHAR(50) NOT NULL,
  Ship_Zip NUMERIC(10) NOT NULL,
  Reciever_Name CHAR(50) NOT NULL,
  Ship_Country CHAR(50) NOT NULL,
  Ship_City CHAR(50) NOT NULL,
  Instore CHAR(3) NOT NULL,
  Cust_ID INT NOT NULL,
  Company_ID INT NOT NULL,
  PRIMARY KEY (Order_ID),
  FOREIGN KEY (Cust_ID) REFERENCES CUSTOMERS(Cust_ID),
  FOREIGN KEY (Company_ID) REFERENCES SHIPPERS(Company_ID)
);

CREATE TABLE ORDERDETAILS
(
  OD_ID INT NOT NULL,
  Unit_Price NUMERIC(10) NOT NULL,
  Qty NUMERIC(10) NOT NULL,
  Discount VARCHAR(50) NOT NULL,
  Order_ID INT NOT NULL,
  Prod_ID INT NOT NULL,
  PRIMARY KEY (OD_ID),
  FOREIGN KEY (Order_ID) REFERENCES ORDERS(Order_ID),
  FOREIGN KEY (Prod_ID) REFERENCES PRODUCTS(Prod_ID),
  UNIQUE (Order_ID, Prod_ID)
);

CREATE TABLE INVENTORY
(
  Qty_Sent NUMERIC(10) NOT NULL,
  Date_Sent DATE NOT NULL,
  Store_ID INT NOT NULL,
  Prod_ID INT NOT NULL,
  PRIMARY KEY (Store_ID, Prod_ID),
  FOREIGN KEY (Store_ID) REFERENCES STORES(Store_ID),
  FOREIGN KEY (Prod_ID) REFERENCES PRODUCTS(Prod_ID)
);


-- DATA ENTRY

-- MEMBERSHIP
INSERT INTO MEMBERSHIP VALUES (1, '0% Classic');
INSERT INTO MEMBERSHIP VALUES (2, '5% Sapphire');
INSERT INTO MEMBERSHIP VALUES (3, '1% Gold');
INSERT INTO MEMBERSHIP VALUES (4, '3% Diamond');
INSERT INTO MEMBERSHIP VALUES (5, '2% Platinum');

-- CATEGORY
INSERT INTO CATEGORY VALUES (1, 'Apparel');
INSERT INTO CATEGORY VALUES (2, 'Equipment');
INSERT INTO CATEGORY VALUES (3, 'Accessories');
INSERT INTO CATEGORY VALUES (4, 'Footwear');
INSERT INTO CATEGORY VALUES (5, 'Nutrition');

-- SUPPLIERS
INSERT INTO SUPPLIERS VALUES (1, 'SportsGoodies', '1234567890', 'contact@sportsgoodies.com', '123 Main St', '12345', 'New York', 'John Doe');
INSERT INTO SUPPLIERS VALUES (2, 'FitEquipCo', '2345678901', 'sales@fitequipco.com', '456 Park Ave', '23456', 'Los Angeles', 'Jane Smith');
INSERT INTO SUPPLIERS VALUES (3, 'WearFitBrand', '3456789012', 'info@wearfitbrand.com', '789 Broad St', '34567', 'Chicago', 'Mike Johnson');
INSERT INTO SUPPLIERS VALUES (4, 'GymSharkX', '4567890123', 'support@gymsharkx.com', '101 First St', '45678', 'Houston', 'Anna Bell');
INSERT INTO SUPPLIERS VALUES (5, 'ProteinWorld', '5678901234', 'hello@proteinworld.com', '202 Second St', '56789', 'Phoenix', 'Chris Adams');

-- EMPLOYEES
INSERT INTO EMPLOYEES VALUES (1, 'John', 'Doe', 'john.doe@example.com', '111 Grand Ave', 'Manager', '1234567890', '2023-01-10', 'Active', NULL);
INSERT INTO EMPLOYEES VALUES (2, 'Jane', 'Smith', 'jane.smith@example.com', '222 Broad St', 'Sales', '2234567890', '2023-01-15', 'Active', NULL);
INSERT INTO EMPLOYEES VALUES (3, 'Mike', 'Brown', 'mike.brown@example.com', '333 Maple Rd', 'Clerk', '3234567890', '2023-02-01', 'Active', NULL);
INSERT INTO EMPLOYEES VALUES (4, 'Emily', 'Clark', 'emily.clark@example.com', '444 Oak Ln', 'Supervisor', '4234567890', '2023-02-20', 'Active', NULL);
INSERT INTO EMPLOYEES VALUES (5, 'William', 'Taylor', 'william.taylor@example.com', '555 Pine St', 'Janitor', '5234567890', '2023-03-01', 'Active', NULL);

-- SHIPPERS
INSERT INTO SHIPPERS VALUES (1, 'FastShip', '1000000000', 'contact@fastship.com', '500 Shipping Ln');
INSERT INTO SHIPPERS VALUES (2, 'QuickDeliver', '2000000000', 'sales@quickdeliver.com', '600 Delivery Blvd');
INSERT INTO SHIPPERS VALUES (3, 'ExpressCouriers', '3000000000', 'info@expresscouriers.com', '700 Express Way');
INSERT INTO SHIPPERS VALUES (4, 'GlobeTrotters', '4000000000', 'support@globetrotters.com', '800 Global Cir');
INSERT INTO SHIPPERS VALUES (5, 'ParcelPals', '5000000000', 'hello@parcelpals.com', '900 Parcel Pl');

-- STORES
INSERT INTO STORES VALUES (1, '123 Retail St', 'ShopCity', '10000');
INSERT INTO STORES VALUES (2, '456 Commerce Ave', 'MarketTown', '20000');
INSERT INTO STORES VALUES (3, '789 Trade Way', 'Saleville', '30000');
INSERT INTO STORES VALUES (4, '101 Buy Blvd', 'DealCity', '40000');
INSERT INTO STORES VALUES (5, '202 Sell St', 'BargainTown', '50000');

-- PAYMENT
INSERT INTO PAYMENT VALUES (1, '2024-04-01', 'Completed');
INSERT INTO PAYMENT VALUES (2, '2024-04-02', 'Completed');
INSERT INTO PAYMENT VALUES (3, '2024-04-03', 'Completed');
INSERT INTO PAYMENT VALUES (4, '2024-04-04', 'Completed');
INSERT INTO PAYMENT VALUES (5, '2024-04-05', 'Completed');

-- Cash
INSERT INTO Cash VALUES (1);
INSERT INTO Cash VALUES (2);


-- Card
INSERT INTO Card VALUES (3);
INSERT INTO Card VALUES (4);

-- Cheque 
INSERT INTO Cheque VALUES (5);

-- CUSTOMERS
INSERT INTO CUSTOMERS VALUES (1, 'Alice', 'Wonder', '1234567890', 'alice@example.com', '123 Main St', '12345', 'Townsville', '123 Billing St', 1, 1);
INSERT INTO CUSTOMERS VALUES (2, 'Bob', 'Builder', '2345678901', 'bob@example.com', '234 Park Ave', '23456', 'Buildville', '234 Billing Ave', 2, 2);
INSERT INTO CUSTOMERS VALUES (3, 'Charlie', 'Chocolate', '3456789012', 'charlie@example.com', '345 Broad St', '34567', 'Chocotown', '345 Billing Rd', 3, 3);
INSERT INTO CUSTOMERS VALUES (4, 'Diana', 'Dream', '4567890123', 'diana@example.com', '456 Oak Ln', '45678', 'Dreamville', '456 Billing Ln', 4, 4);
INSERT INTO CUSTOMERS VALUES (5, 'Ethan', 'Explorer', '5678901234', 'ethan@example.com', '567 Pine St', '56789', 'Adventure City', '567 Billing Pl', 5, 5);

-- ORDERS
INSERT INTO ORDERS VALUES (1, '2024-04-01', '2024-04-05', '2024-04-03', '123 Delivery St', '10000', 'Alice Wonder', 'CountryA', 'Townsville', 'Yes', 1, 1);
INSERT INTO ORDERS VALUES (2, '2024-04-02', '2024-04-07', '2024-04-04', '234 Delivery Ave', '20000', 'Bob Builder', 'CountryB', 'Buildville', 'No', 2, 2);
INSERT INTO ORDERS VALUES (3, '2024-04-03', '2024-04-09', '2024-04-06', '345 Delivery Rd', '30000', 'Charlie Chocolate', 'CountryC', 'Chocotown', 'Yes', 3, 3);
INSERT INTO ORDERS VALUES (4, '2024-04-04', '2024-04-10', '2024-04-07', '456 Delivery Ln', '40000', 'Diana Dream', 'CountryD', 'Dreamville', 'No', 4, 4);
INSERT INTO ORDERS VALUES (5, '2024-04-05', '2024-04-11', '2024-04-08', '567 Delivery Blvd', '50000', 'Evan Essence', 'CountryE', 'Essenceville', 'Yes', 5, 5);

-- PRODUCTS
INSERT INTO PRODUCTS VALUES (1, 'Running Shoes', 'Available', 10, 50, 5, 99.99, 4, 1);
INSERT INTO PRODUCTS VALUES (2, 'Yoga Mat', 'Available', 15, 30, 10, 19.99, 2, 2);
INSERT INTO PRODUCTS VALUES (3, 'Dumbbells', 'Available', 5, 40, 20, 29.99, 2, 3);
INSERT INTO PRODUCTS VALUES (4, 'Basketball', 'Available', 20, 100, 30, 14.99, 3, 4);
INSERT INTO PRODUCTS VALUES (5, 'Tennis Racket', 'Available', 10, 25, 15, 89.99, 3, 5);

-- ORDERDETAILS
INSERT INTO ORDERDETAILS VALUES (1, 99.99, 1, '0%', 1, 1);
INSERT INTO ORDERDETAILS VALUES (2, 19.99, 2, '1%', 2, 2);
INSERT INTO ORDERDETAILS VALUES (3, 29.99, 1, '2%', 3, 3);
INSERT INTO ORDERDETAILS VALUES (4, 14.99, 3, '3%', 4, 4);
INSERT INTO ORDERDETAILS VALUES (5, 89.99, 1, '5%', 5, 5);

-- INVENTORY
INSERT INTO INVENTORY VALUES (5, '2024-03-01', 1, 1);
INSERT INTO INVENTORY VALUES (10, '2024-03-02', 2, 2);
INSERT INTO INVENTORY VALUES (15, '2024-03-03', 3, 3);
INSERT INTO INVENTORY VALUES (20, '2024-03-04', 4, 4);
INSERT INTO INVENTORY VALUES (25, '2024-03-05', 5, 5);
