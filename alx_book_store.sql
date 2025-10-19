DROP DATABASE IF EXISTS alx_book_store;
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;


-- TABLE: AUTHORS
DROP TABLE IF EXISTS Authors;
CREATE TABLE Authors (
author_id INT NOT NULL AUTO_INCREMENT,
author_name VARCHAR(215) NOT NULL,
PRIMARY KEY (author_id)
);


-- TABLE: BOOKS
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
book_id INT NOT NULL AUTO_INCREMENT,
title VARCHAR(130) NOT NULL,
author_id INT NOT NULL,
price DOUBLE NOT NULL DEFAULT 0,
publication_date DATE DEFAULT NULL,
PRIMARY KEY (book_id),
FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);


-- TABLE: CUSTOMERS
DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (
customer_id INT NOT NULL AUTO_INCREMENT,
customer_name VARCHAR(215) NOT NULL,
email VARCHAR(215) NOT NULL,
address TEXT,
PRIMARY KEY (customer_id)
);


-- TABLE: ORDERS
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
order_id INT NOT NULL AUTO_INCREMENT,
customer_id INT NOT NULL,
order_date DATE NOT NULL,
PRIMARY KEY (order_id),
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


-- TABLE: ORDER_DETAILS
DROP TABLE IF EXISTS Order_Details;
CREATE TABLE Order_Details (
orderdetailid INT NOT NULL AUTO_INCREMENT,
order_id INT NOT NULL,
book_id INT NOT NULL,
quantity DOUBLE NOT NULL DEFAULT 1,
PRIMARY KEY (orderdetailid),
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (book_id) REFERENCES Books(book_id)
);