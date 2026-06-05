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

SELECT q1_jobs.job_id, q1_jobs.job_title_short, skd.skills, skd.type
FROM q1_jobs
LEFT JOIN skills_job_dim sjd ON q1_jobs.job_id = sjd.job_id
LEFT JOIN skills_dim skd ON sjd.skill_id = skd.skill_id
WHERE q1_jobs.salary_year_avg > 70000;
