DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;

-- Create the ComputeAverageScoreForUser stored procedure
CREATE PROCEDURE ComputeAverageScoreForUser(IN `user_id` INT)
BEGIN
    -- Update the average_score for the given user_id
    UPDATE users
    SET average_score = (
        SELECT COALESCE(AVG(score), 0)  -- If no scores, set to 0
        FROM corrections
        WHERE corrections.user_id = user_id
    )
    WHERE id = user_id;
END $$

DELIMITER ;
