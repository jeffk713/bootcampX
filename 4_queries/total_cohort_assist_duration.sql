-- Get the total duration of all assistance requests for each cohort.

-- Select the cohort's name and the total duration the assistance requests.
-- Order by total_duration.
-- Look at the ERD to see how to join the tables.

SELECT c.name as cohort_name, SUM(ar.completed_at - ar.started_at) as total_duration
FROM assistance_requests ar
JOIN students s ON s.id = ar.student_id
JOIN cohorts c ON c.id = s.cohort_id
GROUP BY c.name
ORDER BY total_duration