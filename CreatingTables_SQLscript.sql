CREATE TABLE CustomerDetails(
	CustomerID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    ContactNo VARCHAR(45),
    Email VARCHAR(255),
    PRIMARY KEY (CustomerID)
);

CREATE TABLE Bookings(
	BookingID INT,
    BookingDate DATE,
    TableNo INT,
    CustomerID INT,
    PRIMARY KEY (BookingID),
    FOREIGN KEY (CustomerID) REFERENCES CustomerDetails(CustomerID)
);

CREATE TABLE MenuItems(
	MenuItemsID INT,
    Starters VARCHAR(45),
    Courses VARCHAR(45),
    Drinks VARCHAR(45),
    Deserts VARCHAR(45),
    PRIMARY KEY (MenuItemsID)
);

CREATE TABLE Menus(
	MenuID INT,
    MenuName VARCHAR(255),
    Cuisine VARCHAR(45),
    MenuItemsID INT,
    PRIMARY KEY (MenuID),
    FOREIGN KEY (MenuItemsID) REFERENCES MenuItems(MenuItemsID)
);

CREATE TABLE Orders(
	OrderID INT,
	OrderDate DATE,
    Quantity INT,
    TotalCost DECIMAL(19,4),
    MenuID INT,
    CustomerID INT, 
    PRIMARY KEY (OrderID),
    FOREIGN KEY (MenuID) REFERENCES Menus(MenuID),
    FOREIGN KEY (CustomerID) REFERENCES CustomerDetails(CustomerID)
);

CREATE TABLE OrderDeliveryStatus(
	DeliveryID INT,
    DeliveryDate DATE,
    DeliveryStatus VARCHAR(255),
    OrderID INT,
    PRIMARY KEY (DeliveryID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);



    


    
    