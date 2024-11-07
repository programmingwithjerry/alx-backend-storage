-- Task: Create a view need_meeting that lists all students with score under 80 and no last meeting or more than 1 month ago

CREATE VIEW need_meeting AS
SELECT s.name
FROM students s
WHERE s.score < 80
  AND (s.last_meeting IS NULL OR s.last_meeting < NOW() - INTERVAL 1 MONTH);
