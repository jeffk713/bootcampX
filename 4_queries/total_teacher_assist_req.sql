SELECT COUNT(a.*), t.name
FROM assistance_requests a
JOIN teachers t ON t.id = a.teacher_id
WHERE t.name = 'Waylon Boehm'
GROUP BY t.name