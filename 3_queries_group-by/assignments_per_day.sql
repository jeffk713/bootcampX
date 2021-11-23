SELECT a.day, COUNT(b.id)
FROM assignments AS a
JOIN assignments AS b ON a.id= b.id
GROUP BY a.day
ORDER BY a.day

-- SELECT day, count(*) as total_assignments 
-- FROM assignments
-- GROUP BY day
-- ORDER BY day;