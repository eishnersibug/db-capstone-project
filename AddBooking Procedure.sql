DROP PROCEDURE IF EXISTS AddBooking;
DELIMITER // 
CREATE PROCEDURE AddBooking
(
	IN bookingid INT,
    IN customerid INT, 
    IN bDate DATE,
    IN tableNum INT
)
BEGIN 
	INSERT INTO Bookings(BookingID, CustomerID, TableNo, BookingDate) VALUES (bookingid, customerid, tableNum, bDate);
END//

DELIMITER ;

Call AddBooking(9 , 3 , 4 , "2022-12-30");
