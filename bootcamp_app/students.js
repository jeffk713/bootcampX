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
const limitValue = process.argv[3];

client
  .query(
    `SELECT s.id, s.name as student_name, c.name as cohort_name FROM students s JOIN cohorts c ON c.id = s.cohort_id WHERE c.name LIKE '%${cohortName}%' LIMIT ${limitValue};`
  )
  .then(res => {
    res.rows.forEach(user => {
      console.log(
        `${user.student_name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`
      );
    });
    client.end();
  });
