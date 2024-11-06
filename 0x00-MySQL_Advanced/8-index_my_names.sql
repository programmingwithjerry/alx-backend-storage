-- Create the index idx_name_first on the table names
CREATE INDEX idx_name_first
ON names (name, LEFT(name, 1));
