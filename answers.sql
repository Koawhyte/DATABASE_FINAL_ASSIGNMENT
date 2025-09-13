-- create Database 
CREATE DATABASE LibraryArchiveDB;

-- use database
USE LibraryArchiveDB;

-- create table for authors
CREATE TABLE Authors(
AuthorID INT AUTO_INCREMENT,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
BirthDate Date,
PRIMARY KEY(AuthorID)
); 

-- create table for publishers
CREATE TABLE Publishers(
PublisherID INT AUTO_INCREMENT,
PublisherName VARCHAR(100) NOT NULL,
Address VARCHAR(200),
PRIMARY KEY(PublisherID)  
);

-- create table for books
CREATE TABLE Books(
BookID INT AUTO_INCREMENT,
Title VARCHAR(200) NOT NULL,
AuthorID INT,
PublisherID INT,
PublicationDate DATE,
ISBN VARCHAR(20) UNIQUE,
PRIMARY KEY(BookID),
FOREIGN KEY(AUTHORID) REFERENCES Authors(AuthorID),
FOREIGN KEY(PublisherID) REFERENCES Publishers(PublisherID) 
);

-- create table for book copies
CREATE TABLE BookCopies(
CopyID INT AUTO_INCREMENT,
BookID INT,
CopyNumber INT,
PRIMARY KEY(CopyID),
FOREIGN KEY(BookID) REFERENCES Books(BookID)
);

-- create table for borrowers
CREATE TABLE Borrowers(
BorrowerID INT AUTO_INCREMENT,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
EMAIL VARCHAR(100) NOT NULL UNIQUE,
PRIMARY KEY(BorrowerID)
);

-- create table loans
CREATE TABLE Loans(
LoanID INT AUTO_INCREMENT,
CopyID INT,
BorrowerID INT,
LoanDate DATE,
DueDate DATE,
ReturnDate DATE,
PRIMARY KEY(LoanID),
FOREIGN KEY(CopyID) REFERENCES BookCopies(copyID),
FOREIGN KEY(BorrowerID) REFERENCES Borrowers(BorrowerID)
);

-- create table for fines
CREATE TABLE Fines(
FineID INT AUTO_INCREMENT,
LoanID INT,
FineAmount DECIMAL(10,2),
PRIMARY KEY(FineID),
FOREIGN KEY(LoanID) REFERENCES Loans(LoanID)
);
 
