/*
Find the count of the number of remote job postings per skill
-Display the top 5 skills by their demand in remote jobs
-Include skill ID, name, and count of postings requiring the skill
*/

SELECT skd.skill_id ,skd.skills, COUNT(*) AS total_jobs
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim skd ON sjd.skill_id = skd.skill_id
WHERE jpf.job_work_from_home = TRUE AND 
jpf.job_title_short = 'Data Analyst'
GROUP BY skd.skill_id, skd.skills
ORDER BY total_jobs DESC
LIMIT 5;
