/*
Question: What are the top skills based on salary?
- Look at th average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
    helps identify the most financially rewardingg skills to acquire or improve
*/

SELECT skd.skills, ROUND(AVG(jpf.salary_year_avg),0) AS avg_salary
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim skd ON sjd.skill_id = skd.skill_id
WHERE jpf.job_title_short = 'Data Analyst' AND
jpf.salary_year_avg IS NOT NULL
GROUP BY skd.skill_id, skd.skills
ORDER BY avg_salary DESC
limit 20;

/*
SVN is a massive outlier. At $400k average, it's more than double the next skill (Solidity at $179k). 
SVN is a legacy version control system, so this likely reflects extreme scarcity — very few analysts know it, making those who do extraordinarily valuable to the companies still running it. 
Take this number with a grain of salt; it's probably based on very few job postings.

ML and AI skills cluster in a consistent band. DataRobot, MXNet, Keras, PyTorch, Hugging Face, and TensorFlow all fall between $120k–$155k. 
Notably, Hugging Face ($124k) and TensorFlow ($121k) sit at the lower end of that cluster despite being the most mainstream tools — suggesting that rarity, not just relevance, drives salary.

DevOps and infrastructure tools pay surprisingly well for a "data analyst" role. 
GitLab, Terraform, Puppet, Ansible, and VMware ranging from $124k–$147k signals that companies are increasingly expecting data analysts to operate closer to the engineering stack. 
These aren't typical analyst skills.
*/