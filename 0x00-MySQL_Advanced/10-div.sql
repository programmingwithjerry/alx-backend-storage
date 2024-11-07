-- Task: Create a function SafeDiv that divides the first number by the second or returns 0 if the second number is 0.

DELIMITER $$

CREATE FUNCTION SafeDiv(a INT, b INT) 
RETURNS DECIMAL(20, 10)  -- Updated return type to DECIMAL for higher precision
DETERMINISTIC
BEGIN
    -- Check if the denominator is 0
    IF b = 0 THEN
        -- Return 0 if the second number is 0
        RETURN 0;
    ELSE
        -- Perform the division with casting to DECIMAL for precise result
        RETURN CAST(a AS DECIMAL(20, 10)) / CAST(b AS DECIMAL(20, 10));
    END IF;
END $$

DELIMITER ;
