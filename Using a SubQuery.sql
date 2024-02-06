#Little Lemon need you to find all menu items for which more than 2 orders have been placed.
SELECT MenuName FROM Menus	
	WHERE MenuID = ANY
    (SELECT OrderID FROM Orders WHERE Quantity > 2);