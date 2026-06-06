/*
Question: What are the most in-demand skills for Data Analysts?
- Identify the top 5 in-demand skills for a Data Analyst
- Focus on all job postings
- Why? Retrieves the top 5 skills wiith the highest demand in the job market,
    providing insights into the most valuable skills for job seekers.
*/

SELECT skd.skills, COUNT(*) AS total_jobs
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim skd ON sjd.skill_id = skd.skill_id
WHERE jpf.job_title_short = 'Data Analyst'
GROUP BY skd.skill_id, skd.skills
ORDER BY total_jobs DESC
LIMIT 5;