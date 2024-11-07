-- Task: Create a function SafeDiv that divides the first number by the second or returns 0 if the second number is 0.

DELIMITER $$

CREATE FUNCTION SafeDiv(a INT, b INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    -- Check if the denominator is 0
    IF b = 0 THEN
        -- Return 0 if the second number is 0
        RETURN 0;
    ELSE
        -- Perform the division and return the result
        RETURN a / b;
    END IF;
END $$

DELIMITER ;
