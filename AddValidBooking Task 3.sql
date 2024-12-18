DELIMITER $$

CREATE PROCEDURE AddValidBooking (
    IN BookingDate DATE,
    IN TableNumber INT
)
BEGIN
    -- Start the transaction
    START TRANSACTION;
    
    -- Check if a booking already exists
    IF NOT EXISTS (
        SELECT * 
        FROM booking 
        WHERE `date` = BookingDate AND table_number = TableNumber
    ) THEN
        -- Insert the booking if it does not exist
        INSERT INTO booking (`date`, table_number)
        VALUES (BookingDate, TableNumber);
        
        -- Commit the transaction
        COMMIT;
    ELSE
        -- Rollback if booking already exists
        ROLLBACK;
    END IF;
END $$

DELIMITER ;

    
    

