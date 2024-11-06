DELIMITER $$

-- Trigger to reset valid_email when the email is changed
CREATE TRIGGER reset_valid_email_after_email_change
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    -- Check if the email has changed
    IF OLD.email <> NEW.email THEN
        -- Reset the valid_email field to a default value (0 in this case) when the email has changed
        SET NEW.valid_email = 0;  -- You can change this to NULL or any default value as needed
    END IF;
END $$

DELIMITER ;
