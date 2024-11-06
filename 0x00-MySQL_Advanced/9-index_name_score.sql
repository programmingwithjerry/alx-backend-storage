-- Create the index idx_name_first_score on the first letter of name and the score column
CREATE INDEX idx_name_first_score
ON names (name(1), score);
