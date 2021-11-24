-- Get the average duration of assistance requests for each cohort.

-- Select the cohort's name and the average assistance request time.
-- Order the results from shortest average to longest.

SELECT 
  c.name as cohort_name,
  AVG(ar.completed_at - ar.started_at) as avg_duration
FROM assistance_requests ar
JOIN students s ON s.id = ar.student_id
JOIN cohorts c ON c.id = s.cohort_id
GROUP BY c.name
ORDER BY avg_duration