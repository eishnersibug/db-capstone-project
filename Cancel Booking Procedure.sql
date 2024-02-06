DROP PROCEDURE IF EXISTS CancelBooking;

DELIMITER //
CREATE PROCEDURE CancelBooking(IN 	bookingid INT)
BEGIN
	DELETE FROM Bookings WHERE BookingID = bookingid;
END //

DELIMITER ;
 
Call CancelBooking(9);