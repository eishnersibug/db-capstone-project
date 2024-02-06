DROP PROCEDURE IF EXISTS CheckBooking; 
DELIMITER //
CREATE PROCEDURE CheckBooking
(
	IN bDate DATE,
    IN nTable INT
)
BEGIN
	SELECT CONCAT("Table", TableNo, "is already booked")
    WHERE EXISTS (
		SELECT * FROM bookings 
        WHERE BookingDate = bDate AND TableNo = nTable
        );
END //
DELIMITER ;

call CheckBooking('2022-11-12', 3);