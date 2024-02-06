DROP PROCEDURE IF EXISTS AddValidBooking;
DELIMITER // 

CREATE PROCEDURE AddValidBooking(
	IN bDate DATE, 
    IN TableNum INT
    )
	BEGIN     
		DECLARE booking_count INT;
        
		START TRANSACTION;
        
/*I did INSERT IGNORE instead of INSERT because i would get error code code 1364: Booking ID does not have default value... Find solution to this */
        INSERT INTO Bookings(BookingDate, TableNo) VALUES (bDate, TableNum);
        
        SELECT  COUNT(*) INTO booking_count FROM Bookings WHERE BookingDate = bDate AND TableNo = TableNum;
        
        
			IF booking_count > 1 THEN 
				BEGIN
				Rollback;
                SELECT CONCAT('Table', TableNum, 'is already booked - booking cancelled') AS message; 
                END;
			ELSE 
				BEGIN
					COMMIT;
                    SELECT 'Booking Successful' AS message;	
				END;
                
			END IF;
    END//
    
DELIMITER ;

CALL AddValidBooking("2022-12-17",6);	