# Little Lemon need you to create a procedure that displays the maximum ordered quantity in the Orders table. 

CREATE PROCEDURE GetMaxQuantity()
	SELECT MAX(Quantity) AS MaxQuantityInOrders
    FROM Orders;

CALL GetMaxQuantity();