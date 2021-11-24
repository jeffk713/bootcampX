-- Perform the same query as before, but include the number of assistances as well.

SELECT t.name as instructor, c.name as cohort, COUNT(ar.*) as num_assistances
FROM teachers t
JOIN assistance_requests ar ON t.id = ar.teacher_id
JOIN students s ON s.id = ar.student_id
JOIN cohorts c ON c.id = s.cohort_id
WHERE c.name = 'JUL02'
GROUP BY t.name, c.name
ORDER BY instructor