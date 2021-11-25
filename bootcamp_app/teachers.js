const pg = require('pg');

const config = {
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx',
  port: 5432,
};

const client = new pg.Client(config);

client.connect(() => {
  console.log('connected to database');
});

const cohortName = process.argv[2];

const queryString = `
SELECT DISTINCT t.name as instructor, c.name as cohort
FROM teachers t
JOIN assistance_requests ar ON t.id = ar.teacher_id
JOIN students s ON s.id = ar.student_id
JOIN cohorts c ON c.id = s.cohort_id
WHERE c.name = '${cohortName}'
ORDER BY instructor`;

client.query(queryString).then(res => {
  res.rows.forEach(row => {
    console.log(`${row.cohort}: ${row.instructor}`);
  });
  client.end();
});
