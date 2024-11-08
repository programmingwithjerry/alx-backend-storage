-- Task: Create a stored procedure ComputeAverageWeightedScoreForUsers
-- This procedure computes and updates the average weighted score for all users based on their project scores and weights.

DELIMITER $$

-- Drop procedure if it already exists to avoid duplication errors
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers; $$

-- Define the ComputeAverageWeightedScoreForUsers procedure without input parameters
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    -- Update average_score for each user in the users table
    UPDATE users
    SET average_score = (
        -- Calculate the weighted average score for each user using scores and project weights
        SELECT SUM(corrections.score * projects.weight) / SUM(projects.weight)
        FROM corrections
        INNER JOIN projects ON projects.id = corrections.project_id
        WHERE corrections.user_id = users.id
    );
END $$

DELIMITER ;
