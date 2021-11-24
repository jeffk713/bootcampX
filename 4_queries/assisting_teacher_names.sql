-- Get the name of all teachers that performed an assistance request during a cohort.

-- Select the instructor's name and the cohort's name.
-- Don't repeat the instructor's name in the results list.
-- Order by the instructor's name.
-- This query needs to select data for a cohort with a specific name, use 'JUL02' for the cohort's name here.

SELECT DISTINCT t.name as instructor, c.name as cohort
FROM teachers t
JOIN assistance_requests ar ON t.id = ar.teacher_id
JOIN students s ON s.id = ar.student_id
JOIN cohorts c ON c.id = s.cohort_id
WHERE c.name = 'JUL02'
ORDER BY instructor

