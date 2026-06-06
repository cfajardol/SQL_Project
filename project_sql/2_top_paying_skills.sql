/*
Question: What skills are required for the top-paying Data Analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from the first query
- Add the specific skiills required for these roles
- Why? It provides a detailed look at wich skills high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
SELECT jpf.job_id, jpf.job_title_short, jpf.job_title, cd.name AS company_name ,jpf.salary_year_avg
FROM job_postings_fact jpf
LEFT JOIN company_dim cd ON jpf.company_id = cd.company_id
WHERE jpf.salary_year_avg IS NOT NULL AND
jpf.job_title_short = 'Data Analyst' AND
jpf.job_location = 'Anywhere'
ORDER BY jpf.salary_year_avg DESC
LIMIT 10
)


SELECT tpj.*, sd.skills
FROM top_paying_jobs tpj
INNER JOIN skills_job_dim sjd ON tpj.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
ORDER BY tpj.salary_year_avg DESC;

/*
SQL and Python dominate without question. SQL appears in 100% of roles (8/8), and Python in 7 out of 8. 
They are the only truly universal skills. If you had to prioritize just two, these are it.
*/