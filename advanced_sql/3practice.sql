/*
SELECT
j.job_schedule_type,
    AVG(j.salary_year_avg) as avg_salary_year_avg,
    AVG(j.salary_hour_avg) as avg_salary_hour_avg
FROM job_postings_fact j
WHERE
    j.job_posted_date::date > '2023-06-01'
GROUP by j.job_schedule_type
LIMIT 100;
*/;

SELECT 
EXTRACT(MONTH FROM j.job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS posted_month,
COUNT(*)
FROM job_postings_fact j
WHERE
    j.job_posted_date::date >= '2023-01-01'
    AND j.job_posted_date < '2024-01-01'
GROUP BY posted_month
ORDER BY posted_month;
