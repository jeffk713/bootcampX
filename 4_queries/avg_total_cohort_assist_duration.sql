-- Calculate the average total duration of assistance requests for each cohort.

-- Use the previous query as a sub query to determine the duration per cohort.
-- Return a single row average_total_duration



SELECT AVG(total_duration) as avg_total_duration
FROM cohorts
JOIN (SELECT c.name as cohort_name, SUM(ar.completed_at - ar.started_at) as total_duration
  FROM assistance_requests ar
  JOIN students s ON s.id = ar.student_id
  JOIN cohorts c ON c.id = s.cohort_id
  GROUP BY c.name
  ORDER BY total_duration) as total_duration
ON cohorts.name = total_duration.cohort_name