DELIMITER $$

-- Trigger to reset valid_email when the email is changed
CREATE TRIGGER reset_valid_email_after_email_change
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    -- Check if the email has changed
    IF OLD.email <> NEW.email THEN
        -- Reset the valid_email field when the email has changed
        SET NEW.valid_email = NULL;
    END IF;
END $$

DELIMITER ;
