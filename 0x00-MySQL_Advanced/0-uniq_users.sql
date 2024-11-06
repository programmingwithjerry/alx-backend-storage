-- Script to create the 'users' table if it doesn't already exist

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,                 -- Auto-incrementing primary key
    email VARCHAR(255) NOT NULL UNIQUE,    -- Email, never null and unique
    name VARCHAR(255)                      -- Name, up to 255 characters
);

-- Notes:
-- - 'SERIAL' is used to auto-increment the 'id' field in most SQL
-- - dialects (e.g., PostgreSQL).
-- - For MySQL, use 'INT AUTO_INCREMENT PRIMARY KEY' for the 'id' column.
-- - The 'IF NOT EXISTS' clause prevents errors if the table already exists.
