
CREATE DATABASE MyGuitarShop;


USE MyGuitarShop;

-- create the tables for the database
CREATE TABLE Categories (
  CategoryID        INT            PRIMARY KEY  ,
  CategoryName      VARCHAR(255)   NOT NULL      UNIQUE
);

CREATE TABLE Products  (
  ProductID         INT            PRIMARY KEY   ,
  CategoryID        INT            , 
  foreign key(CategoryID) REFERENCES Categories(CategoryID),
  ProductCode       VARCHAR(10)    NOT NULL      UNIQUE,
  ProductName       VARCHAR(255)   NOT NULL,
  Description       TEXT           NOT NULL,
  ListPrice         double          NOT NULL,
  DiscountPercent   double          NOT NULL      DEFAULT 0.00,
  DateAdded         DATETIME                     DEFAULT NULL

);

CREATE TABLE Customers (
  CustomerID           INT            PRIMARY KEY   ,
  EmailAddress         VARCHAR(255)   NOT NULL      UNIQUE,
  Password             VARCHAR(60)    NOT NULL,
  FirstName            VARCHAR(60)    NOT NULL,
  LastName             VARCHAR(60)    NOT NULL,
  ShippingAddressID    INT                          DEFAULT NULL,
  BillingAddressID     INT                          DEFAULT NULL
);

CREATE TABLE Addresses (
  AddressID          INT            PRIMARY KEY   ,
  CustomerID         INT          ,
  foreign key(CustomerID) REFERENCES Customers(CustomerID),
  Line1              VARCHAR(60)    NOT NULL,
  Line2              VARCHAR(60)                  DEFAULT NULL,
  City               VARCHAR(40)    NOT NULL,
  State              VARCHAR(2)     NOT NULL,
  ZipCode            VARCHAR(10)    NOT NULL,
  Phone              VARCHAR(12)    NOT NULL,
  Disabled           INT            NOT NULL      DEFAULT 0
);

CREATE TABLE Orders (
  OrderID           INT            PRIMARY KEY  ,
  CustomerID        INT          ,
    foreign key(CustomerID) REFERENCES Customers(CustomerID),
  OrderDate         DATETIME       NOT NULL,
  ShipAmount        double          NOT NULL,
  TaxAmount         double          NOT NULL,
  ShipDate          DATETIME                    DEFAULT NULL,
  ShipAddressID     INT            NOT NULL,
  CardType          VARCHAR(50)    NOT NULL,
  CardNumber        CHAR(16)       NOT NULL,
  CardExpires       CHAR(7)        NOT NULL,
  BillingAddressID  INT            NOT NULL    
);

CREATE TABLE OrderItems (
  ItemID             INT            ,
  OrderID            INT            REFERENCES Orders (OrderID),
  foreign key(OrderID) REFERENCES Orders(OrderID),
  
  ProductID          INT            REFERENCES Products (ProductID),
    foreign key(ProductID) REFERENCES Products(ProductID),
  ItemPrice          double  NOT NULL,
  DiscountAmount     double  NOT NULL,
  Quantity           INT            NOT NULL,
  constraint OrderItems_pk Primary key (OrderId, ProductID)    
);

CREATE TABLE Administrators (
  AdminID           INT            PRIMARY KEY,
  EmailAddress      VARCHAR(255)   NOT NULL,
  Password          VARCHAR(255)   NOT NULL,
  FirstName         VARCHAR(255)   NOT NULL,
  LastName          VARCHAR(255)   NOT NULL
);


INSERT INTO Categories (CategoryID, CategoryName) VALUES
(11111, 'Guitars'),
(22222, 'Basses'),
(33333, 'Drums'), 
(44444, 'Keyboards');


