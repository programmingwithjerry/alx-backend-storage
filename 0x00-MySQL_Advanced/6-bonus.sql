DELIMITER $$

-- Create the AddBonus stored procedure
CREATE PROCEDURE AddBonus(
    IN user_id INT,       -- Input: user ID (existing user)
    IN project_name VARCHAR(255), -- Input: project name (new or existing)
    IN score INT          -- Input: score value for the correction
)
BEGIN
    DECLARE project_id INT;

    -- Check if the project already exists
    SELECT id INTO project_id
    FROM projects
    WHERE name = project_name
    LIMIT 1;

    -- If the project does not exist, create a new project and get the new id
    IF project_id IS NULL THEN
        INSERT INTO projects (name) VALUES (project_name);
        SET project_id = LAST_INSERT_ID();
    END IF;

    -- Insert the correction for the student
    INSERT INTO corrections (user_id, project_id, score)
    VALUES (user_id, project_id, score);

END $$

DELIMITER ;
