-- Select the teacher's name, student's name, assignment's name, and the duration of each assistance request.
-- Subtract completed_at by started_at to find the duration.
-- Order by the duration of the request.

SELECT t.name as teacher_name, s.name as student_name, a.name as assignment, (ar.completed_at - ar.started_at) as duration
FROM assistance_requests ar
JOIN students s ON ar.student_id = s.id
JOIN teachers t ON t.id = ar.teacher_id
JOIN assignments a ON a.id = ar.assignment_id
ORDER BY duration