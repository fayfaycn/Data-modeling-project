Create database if not exists globe_s;

-- Table: Customers
CREATE TABLE globe_s.Customers (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CustomerName VARCHAR(100),
    ContactDetails VARCHAR(255),
    Segment VARCHAR(50)
);

-- Table: Addresses
CREATE TABLE globe_s.Addresses (
    AddressID INT AUTO_INCREMENT PRIMARY KEY,
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100),
    PostalCode VARCHAR(20)
);

-- Table: Products
CREATE TABLE globe_s.Products (
    ProductID VARCHAR(20) PRIMARY KEY,
    ProductName VARCHAR(255),
    Category VARCHAR(50),
    SubCategory VARCHAR(50),
    ProductPrice DECIMAL(10, 2)
);

-- Table: Orders
CREATE TABLE globe_s.Orders (
    OrderID VARCHAR(20) PRIMARY KEY,
    OrderDate DATE,
    ShipDate DATE,
    ShipMode VARCHAR(50),
    CustomerID VARCHAR(10),
    AddressID INT,
    TotalCost DECIMAL(10, 2),
    Discount DECIMAL(5, 2),
    ShippingCost DECIMAL(10, 2),
    OrderPriority VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (AddressID) REFERENCES Addresses(AddressID)
);

-- Table: OrderDetails
CREATE TABLE globe_s.OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID VARCHAR(20),
    ProductID VARCHAR(20),
    Quantity INT,
    Sales DECIMAL(10, 2),
    Profit DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);