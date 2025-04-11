
-- Creating the database: bookStoreDB and its related 15 tables

CREATE DATABASE bookStoreDB;
USE bookstoredb;

CREATE TABLE country(
    countryID INT PRIMARY KEY,
    countryName VARCHAR(100)
);

CREATE TABLE address_status(
    address_statusID INT AUTO_INCREMENT PRIMARY KEY,
    statusName VARCHAR(100) NOT NULL
);

CREATE TABLE publisher(
    publisherID INT PRIMARY KEY,
    publisherName VARCHAR(100)
);

CREATE TABLE author(
    authorID INT PRIMARY KEY,
    authorName VARCHAR(100)
);

CREATE TABLE book_language(
    languageID INT PRIMARY KEY,
    languageName VARCHAR(100)
);

CREATE TABLE shipping_method(
    shipping_methodID INT AUTO_INCREMENT PRIMARY KEY,
    methodName VARCHAR(50),
    cost DECIMAL(10, 3)
);

CREATE TABLE order_status(
    order_statusID INT AUTO_INCREMENT PRIMARY KEY,
    statusName VARCHAR(100)
);

CREATE TABLE customer(
    customerID INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(20),
    lastName VARCHAR(20),
    email VARCHAR(50)
);

CREATE TABLE address(
    addressID INT AUTO_INCREMENT PRIMARY KEY,
    countryID INT,
    street VARCHAR(100),
    city VARCHAR(100),
    FOREIGN KEY (countryID) REFERENCES country(countryID)
);

CREATE TABLE book(
    bookID INT AUTO_INCREMENT PRIMARY KEY,
    publisherID INT,
    languageID INT,
    title VARCHAR(100),
    isbn VARCHAR(100),
    publishYear YEAR,
    price DECIMAL(10,2),
    FOREIGN KEY (publisherID) REFERENCES publisher(publisherID),
    FOREIGN KEY (languageID) REFERENCES book_language(languageID)
);

CREATE TABLE customer_address(
    customerID INT,
    addressID INT,
    address_statusID INT,
    PRIMARY KEY (customerID, addressID),
    FOREIGN KEY (customerID) REFERENCES customer(customerID),
    FOREIGN KEY (addressID) REFERENCES address(addressID),
    FOREIGN KEY (address_statusID) REFERENCES address_status(address_statusID)
);

CREATE TABLE book_author(
    bookID INT,
    authorID INT,
    PRIMARY KEY (bookID, authorID),
    FOREIGN KEY (bookID) REFERENCES book(bookID),
    FOREIGN KEY (authorID) REFERENCES author(authorID)
);

CREATE TABLE cust_order(
    orderID INT AUTO_INCREMENT PRIMARY KEY,
    customerID INT,
    shipping_methodID INT,
    order_statusID INT,
    orderDate DATE,
    FOREIGN KEY (customerID) REFERENCES customer(customerID),
    FOREIGN KEY (shipping_methodID) REFERENCES shipping_method(shipping_methodID),
    FOREIGN KEY (order_statusID) REFERENCES order_status(order_statusID)
);

CREATE TABLE order_line(
    order_lineID INT AUTO_INCREMENT PRIMARY KEY,
    orderID INT,
    bookID INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (orderID) REFERENCES cust_order(orderID),
    FOREIGN KEY (bookID) REFERENCES book(bookID)
);

CREATE TABLE order_history(
    historyID INT AUTO_INCREMENT PRIMARY KEY,
    orderID INT,
    order_statusID INT,
    changeDate DATE,
    FOREIGN KEY (orderID) REFERENCES cust_order(orderID),
    FOREIGN KEY (order_statusID) REFERENCES order_status(order_statusID)
);