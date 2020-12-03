--Example 1,2,3
USE AdventureWorks2014
GO
SELECT * FROM HumanResources.Employee

--Example 4
CREATE TABLE Contacts
(MailID varchar(20),
 Name text,
 TelephoneNumber int)

 --Example 5
 ALTER TABLE Contacts
ADD FaxNumber int

--Example 6
DROP TABLE Contacts

--Example 7
CREATE DATABASE AdventureWorks
GO
USE AdventureWorks
GO

CREATE TABLE Contacts
(MailID varchar(20),
 Name text,
 TelephoneNumber int)

--Example 8
USE AdventureWorks
SELECT * FROM Contacts
INSERT INTO Contacts
VALUES('john@abc.com','John',5432677,23213124)
INSERT INTO Contacts
VALUES('JOHN1@abc.com','JOHN',123456,877462637)

--Example 9
SELECT * FROM Contacts
UPDATE Contacts
SET TelephoneNumber = 5432679
WHERE Name LIKE 'John'

--Example 10
DELETE FROM Contacts
WHERE TelephoneNumber = 5432679

--Example 11
CREATE TABLE NewEmployees (EmployeeID smallint,FirstName char(10),
LastName char(10), Department varchar(50), HiredDate datetime, Salary
money );
INSERT INTO NewEmployees

VALUES(11,'Kevin','Blaine','Research','2006-07-31 00:00:00.000',54000);
WITH EmployeeTemp (EmployeeID,FirstName,LastName,Department,HiredDate, Salary)
AS
(
SELECT * FROM NewEmployees
)
INSERT INTO Employee
SELECT * FROM EmployeeTemp
DROP TABLE NewEmployees

--Example 12
GRANT SELECT
ON Employee
TO JOHN

--Example 13
REVOKE SELECT
ON Employee
FROM JOHN

--Example 14
DENY SELECT
ON Employee
TO JOHN

--Example 15
CREATE TABLE Employee (EmployeeID smallint,FirstName char(10),
LastName char(10), Department varchar(50), HiredDate datetime, Salary
money );
INSERT INTO Employee
VALUES(11,'Kevin','Blaine','Research','2006-07-31 00:00:00.000',54000);
SELECT * FROM Employee

--Example 16
USE AdventureWorks
GO
SELECT * FROM Employee
GO

--Example 17
DECLARE @PriceChangeDetails TABLE
(
 HotelNumber int,
 Price money,
 NewPrice money
)
UPDATE Hotels
SET Price = 3000
OUTPUT INSERTED.HotelNumber,DELETED.Price, INSERTED.Price
INTO @PriceChangeDetails
WHERE HotelNumber = 101
SELECT * FROM @PriceChangeDetails