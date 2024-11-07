-- Task: Create a stored procedure ComputeAverageWeightedScoreForUser
-- that computes and stores the average weighted score for a student (user)

DELIMITER $$

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser; $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
    -- Declare variables to store the weighted sum and total weight
    DECLARE weighted_sum DECIMAL(10,2) DEFAULT 0;
    DECLARE total_weight DECIMAL(10,2) DEFAULT 0;

    -- Calculate the weighted sum and total weight for the user
    SELECT SUM(c.score * p.weight) INTO weighted_sum
    FROM corrections c
    JOIN projects p ON c.project_id = p.id
    WHERE c.user_id = user_id;

    SELECT SUM(p.weight) INTO total_weight
    FROM corrections c
    JOIN projects p ON c.project_id = p.id
    WHERE c.user_id = user_id;

    -- Debug: Check the calculated weighted_sum and total_weight
    SELECT weighted_sum, total_weight;  -- This will help you debug the results

    -- Calculate and update the user's average weighted score
    IF total_weight > 0 THEN
        UPDATE users
        SET average_weighted_score = weighted_sum / total_weight
        WHERE id = user_id;
    ELSE
        -- If no projects are assigned or weights are zero, set average weighted score to 0
        UPDATE users
        SET average_weighted_score = 0
        WHERE id = user_id;
    END IF;
END $$

DELIMITER ;
