DELIMITER $$

-- Create the ComputeAverageScoreForUser stored procedure
CREATE PROCEDURE ComputeAverageScoreForUser(
    IN user_id INT  -- Input: user ID (existing user)
)
BEGIN
    DECLARE avg_score DECIMAL(10, 2);

    -- Compute the average score for the student
    SELECT AVG(score) INTO avg_score
    FROM corrections
    WHERE user_id = user_id;

    -- If there are no corrections for the user, set average_score to NULL or 0
    IF avg_score IS NULL THEN
        SET avg_score = 0;
    END IF;

    -- Store the computed average score back into the users table
    UPDATE users
    SET average_score = avg_score
    WHERE id = user_id;

END $$

DELIMITER ;
