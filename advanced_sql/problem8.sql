WITH q1_jobs AS (
SELECT *
FROM january_jobs
UNION ALL
SELECT *
FROM february_jobs
UNION ALL
SELECT *
FROM march_jobs
)

SELECT q1_jobs.job_title_short,
q1_jobs.job_location,
q1_jobs.job_via,
q1_jobs.job_posted_date::date,
q1_jobs.salary_year_avg
FROM q1_jobs
WHERE q1_jobs.salary_year_avg > 70000 AND
q1_jobs.job_title_short = 'Data Analyst'
ORDER BY q1_jobs.salary_year_avg DESC;
