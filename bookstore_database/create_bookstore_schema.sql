CREATE DATABASE `BookstoreDB`;
USE `BookstoreDB`;

-- Books Table
CREATE TABLE `Books` (
   `ISBN` VARCHAR(20) PRIMARY KEY,
   `Title` VARCHAR(255) NOT NULL,
   `Price` DECIMAL(10,2) NOT NULL
);

-- Authors Table
CREATE TABLE `Authors` (
   `AuthorID` INT PRIMARY KEY AUTO_INCREMENT,
   `Name` VARCHAR(255) NOT NULL
);

-- BookAuthors Table
CREATE TABLE `BookAuthors` (
   `ISBN` VARCHAR(20),
   `AuthorID` INT,
   PRIMARY KEY (`ISBN`, `AuthorID`),
   FOREIGN KEY (`ISBN`) REFERENCES `Books`(`ISBN`),
   FOREIGN KEY (`AuthorID`) REFERENCES `Authors`(`AuthorID`)
);

-- Customers Table
CREATE TABLE `Customers` (
   `CustomerID` INT PRIMARY KEY AUTO_INCREMENT,
   `Name` VARCHAR(255) NOT NULL,
   `Email` VARCHAR(255) NOT NULL
);

-- Orders Table
CREATE TABLE `Orders` (
   `OrderID` INT PRIMARY KEY AUTO_INCREMENT,
   `CustomerID` INT,
   `OrderDate` DATE NOT NULL,
   FOREIGN KEY (`CustomerID`) REFERENCES `Customers`(`CustomerID`)
);

-- OrderDetails Table
CREATE TABLE `OrderDetails` (
   `OrderID` INT,
   `ISBN` VARCHAR(20),
   `Quantity` INT NOT NULL,
   PRIMARY KEY (`OrderID`, `ISBN`),
   FOREIGN KEY (`OrderID`) REFERENCES `Orders`(`OrderID`),
   FOREIGN KEY (`ISBN`) REFERENCES `Books`(`ISBN`)
);
