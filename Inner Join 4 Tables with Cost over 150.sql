##Inner Join Tables (Customers, Orders, Menus, MenuItems) on all customers with orders that cost more than  $150 (result should be Ascending Order)
SELECT CustomerDetails.CustomerID, CONCAT(CustomerDetails.FirstName, ' ',CustomerDetails.LastName) AS FullName, Orders.OrderID, Orders.TotalCost, Menus.MenuName, MenuItems.Courses, MenuItems.Starters FROM Orders
	Inner JOIN CustomerDetails ON Orders.CustomerID = CustomerDetails.CustomerID
    Inner JOIN Menus ON Orders.MenuID = Menus.MenuID
    Inner Join MenuItems ON Menus.MenuItemsID = MenuItems.MenuItemsID
    WHERE Orders.TotalCost > 150
    ORDER BY Orders.TotalCost ASC;
    