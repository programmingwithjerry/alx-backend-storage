-- Script to create the 'users' table if it doesn't already exist

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,                   -- Auto-incrementing primary key (PostgreSQL)
    email VARCHAR(255) NOT NULL UNIQUE,      -- Email, never null and unique
    name VARCHAR(255),                       -- Name, up to 255 characters
    country ENUM('US', 'CO', 'TN') NOT NULL DEFAULT 'US'  -- Enumeration with a default value
);

-- Compatibility Notes:
-- - For PostgreSQL, `SERIAL` auto-increments the `id` field.
-- - In MySQL, `ENUM` is supported as shown.
-- - SQLite does not have native `ENUM` support; use a `CHECK` constraint instead:
--   country TEXT CHECK(country IN ('US', 'CO', 'TN')) NOT NULL DEFAULT 'US';
