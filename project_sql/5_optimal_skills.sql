/*
Question: What are the optimal skills to learn (it's in high demand and a high-paying skill)?
- Identify skills in high demand associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries)
    offering strategic insights for career development in Data Analysis
*/

SELECT skd.skill_id, skd.skills,
COUNT(jpf.job_id) AS total_jobs,
ROUND(AVG(jpf.salary_year_avg),0) AS avg_salary
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim skd ON sjd.skill_id = skd.skill_id
WHERE jpf.job_title_short = 'Data Analyst' AND
jpf.salary_year_avg IS NOT NULL AND
jpf.job_work_from_home = TRUE
GROUP BY skd.skill_id, skd.skills
HAVING COUNT(sjd.job_id) > 10
ORDER BY avg_salary DESC, total_jobs DESC
LIMIT 25;








/*
CTE version:

WITH skills_demand AS (
    SELECT skd.skill_id,skd.skills, COUNT(sjd.job_id) AS total_jobs
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim skd ON sjd.skill_id = skd.skill_id
WHERE jpf.job_title_short = 'Data Analyst' AND
jpf.salary_year_avg IS NOT NULL AND
jpf.job_work_from_home = TRUE
GROUP BY skd.skill_id, skd.skills
), average_salary AS (
    SELECT skd.skill_id,skd.skills, ROUND(AVG(jpf.salary_year_avg),0) AS avg_salary
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim skd ON sjd.skill_id = skd.skill_id
WHERE jpf.job_title_short = 'Data Analyst' AND
jpf.salary_year_avg IS NOT NULL AND
jpf.job_work_from_home = TRUE
GROUP BY skd.skill_id, skd.skills
)

SELECT skills_demand.skill_id, skills_demand.skills, total_jobs, avg_salary
FROM skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE total_jobs > 10
ORDER BY avg_salary DESC, total_jobs DESC
LIMIT 25;

*/
