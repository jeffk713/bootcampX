SELECT COUNT(a.*), s.name
FROM assistance_requests a
JOIN students s ON a.student_id = s.id
WHERE s.name = 'Elliot Dickinson'
GROUP BY s.name
