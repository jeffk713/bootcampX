-- Get the cohort with the longest average duration of assistance requests.

-- The same requirements as the previous query, but only return the single row with the longest average.

SELECT 
  c.name as cohort_name,
  AVG(ar.completed_at - ar.started_at) as avg_duration
FROM assistance_requests ar
JOIN students s ON s.id = ar.student_id
JOIN cohorts c ON c.id = s.cohort_id
GROUP BY c.name
ORDER BY avg_duration DESC
LIMIT 1
