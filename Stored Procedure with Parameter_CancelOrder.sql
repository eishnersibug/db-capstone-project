DROP PROCEDURE IF EXISTS CancelOrder; 

DELIMITER //
CREATE PROCEDURE CancelOrder 
(
	IN id int
)
BEGIN
	DELETE FROM Orders 
    WHERE OrderID = id;
END //
DELIMITER ;

call CancelOrder(5)

