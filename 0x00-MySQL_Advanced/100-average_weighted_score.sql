-- Task: Create a stored procedure ComputeAverageWeightedScoreForUser
-- This procedure computes and updates the average weighted score for a single user based on their project scores and weights.

DELIMITER $$

-- Drop procedure if it already exists to avoid duplication errors
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser; $$

-- Define the ComputeAverageWeightedScoreForUser procedure with an input parameter user_id
CREATE PROCEDURE ComputeAverageWeightedScoreForUser (IN `user_id` INT)
BEGIN
    -- Update the average_score column in the users table for the specified user_id
    UPDATE users
    SET average_score = (
        -- Calculate the weighted average score using scores and project weights
        SELECT SUM(corrections.score * projects.weight) / SUM(projects.weight)
        FROM corrections
        INNER JOIN projects ON projects.id = corrections.project_id
        WHERE corrections.user_id = user_id
    )
    WHERE users.id = user_id;
END $$

DELIMITER ;
