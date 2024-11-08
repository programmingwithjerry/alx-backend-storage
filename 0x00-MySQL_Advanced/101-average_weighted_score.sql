-- Task: Create a stored procedure ComputeAverageWeightedScoreForUsers
-- that computes and stores the average weighted score for all students (users)
-- This procedure will calculate a weighted score for each user based on the scores in `corrections`
-- and the weights in `projects`, and update the `average_weighted_score` column in `users`

DELIMITER $$

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers; $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    -- Declare variables to hold each user's ID, weighted sum, and total weight
    DECLARE done INT DEFAULT FALSE;
    DECLARE current_user_id INT;
    DECLARE weighted_sum DECIMAL(10,2);
    DECLARE total_weight DECIMAL(10,2);

    -- Declare a cursor to loop through each user
    DECLARE user_cursor CURSOR FOR 
        SELECT id FROM users;

    -- Declare a handler to set `done` to TRUE when the cursor has no more rows
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Open the cursor for user IDs
    OPEN user_cursor;

    -- Loop through each user
    user_loop: LOOP
        -- Fetch the next user ID into `current_user_id`
        FETCH user_cursor INTO current_user_id;
        IF done THEN
            LEAVE user_loop;
        END IF;

        -- Calculate the weighted sum and total weight for the current user
        SELECT 
            SUM(c.score * p.weight) INTO weighted_sum
        FROM 
            corrections c
            JOIN projects p ON c.project_id = p.id
        WHERE 
            c.user_id = current_user_id;

        SELECT 
            SUM(p.weight) INTO total_weight
        FROM 
            corrections c
            JOIN projects p ON c.project_id = p.id
        WHERE 
            c.user_id = current_user_id;

        -- Update the average weighted score for the current user
        IF total_weight > 0 THEN
            UPDATE users
            SET average_weighted_score = weighted_sum / total_weight
            WHERE id = current_user_id;
        ELSE
            -- Set average weighted score to 0 if there are no projects or weights
            UPDATE users
            SET average_weighted_score = 0
            WHERE id = current_user_id;
        END IF;

    END LOOP;

    -- Close the cursor after the loop is complete
    CLOSE user_cursor;
END $$

DELIMITER ;
