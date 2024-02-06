DROP PROCEDURE IF EXISTS UpdateBooking;

DELIMITER //
CREATE PROCEDURE UpdateBooking(
	IN bookingid INT,
    IN bookingdate DATE
)
BEGIN
UPDATE Bookings SET  BookingID = bookingid , BookingDate = bookingdate WHERE BookingID = bookingid;
END //

DELIMITER ;

Call UpdateBooking(9, "2022-12-17");
	
