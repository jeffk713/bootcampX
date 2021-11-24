-- List each assignment with the total number of assistance requests with it.

-- Select the assignment's id, day, chapter, name and the total assistances.
-- Order by total assistances in order of most to least.

SELECT 
  a.id as assignment_id,
  a.day,
  a.chapter,
  a.name,
  COUNT(ar.*) as total_assistances
FROM assistance_requests ar
JOIN assignments a ON a.id = ar.assignment_id
GROUP BY 
  a.id, 
  a.day,
  a.chapter,
  a.name
ORDER BY total_assistances DESC