-- Calculate the average time it takes to start an assistance request.

-- Return just a single column here.

SELECT AVG(ar.started_at - ar.created_at) as avg_wait_duration
FROM assistance_requests ar