CREATE DATABASE Academy

CREATE TABLE Departments
(
    Id int IDENTITY PRIMARY KEY,
    Name NVARCHAR(20) NOT NULL CHECK(LEN(Name) >= 2)
)

CREATE TABLE Employees
(
    Id int IDENTITY CONSTRAINT PK_Id PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL CHECK(LEN(FullName) > 3),
    Salary money CHECK(Salary>0),
    Email NVARCHAR(100) UNIQUE NOT NULL,
    DepartmentId int NOT NULL FOREIGN KEY REFERENCES Departments(Id)
)

CREATE DATABASE MaxiAz

CREATE TABLE Brands
(
    Id int IDENTITY PRIMARY KEY,
    Name NVARCHAR(20) NOT NULL
)

CREATE TABLE Notebooks
(
    Id int IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Price money,
    BrandId int FOREIGN KEY REFERENCES Brands(Id)
)

CREATE TABLE Phones
(
    Id int IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Price money,
    BrandId int FOREIGN KEY REFERENCES Brands(Id)
)

INSERT INTO Brands
VALUES
('Apple'),
('Samsung'),
('Xiaomi')

INSERT INTO Notebooks
VALUES
('Macbook Pro',3999.99,1),
('Samsung Galaxy Book', 2499.99,2 ),
('Mi Notebook Pro', 1799.99,3)

INSERT INTO Phones
VALUES
('Iphone 14 Pro',4099,1),
('Samsung Galaxy Z Flip',3199.99,2),
('Xiaomi Redmi Note 8',1200,3),
('Iphone 12 Pro',1399.99,1)

SELECT (Notebooks.Name+' '+Brands.Name) as BrandName ,Notebooks.Price FROM NoteBooks 
JOIN Brands 
on Notebooks.BrandId=Brands.Id

SELECT (Phones.Name+' '+Brands.Name) as BrandName ,Phones.Price FROM Phones 
JOIN Brands 
ON Phones.BrandId=Brands.Id

SELECT * FROM Notebooks WHERE (Notebooks.Price BETWEEN 2000 AND 5000) OR Notebooks.Price>5000

SELECT * FROM Phones WHERE  (Phones.Price BETWEEN 1000 AND 1500) OR Phones.Price>1500

SELECT Name,Phones.BrandId FROM Phones UNION SELECT Name,Notebooks.BrandId FROM Notebooks

SELECT Name,Phones.BrandId,Phones.Price,Phones.id 
FROM Phones 
UNION 
SELECT Name,Notebooks.BrandId,Notebooks.Price,Notebooks.id 
FROM Notebooks