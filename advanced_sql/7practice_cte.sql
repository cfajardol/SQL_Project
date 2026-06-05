WITH top5_skills AS (
    SELECT skd.skills, COUNT(sjd.skill_id) AS total_jobs
    FROM skills_dim skd
    LEFT JOIN skills_job_dim sjd ON skd.skill_id = sjd.skill_id
    GROUP BY skd.skills
    ORDER BY total_jobs DESC
    LIMIT 5
)

SELECT *
FROM top5_skills;

-- Claude: Era una subquery, no un CTE
-- SELECT skd.skills, sub.total_jobs
-- FROM skills_dim skd
-- INNER JOIN (
--     -- Esta es la subquery que pide el enunciado
--     SELECT skill_id, COUNT(*) AS total_jobs
--     FROM skills_job_dim
--     GROUP BY skill_id
--     ORDER BY total_jobs DESC
--     LIMIT 5
-- ) AS sub ON skd.skill_id = sub.skill_id
-- ORDER BY sub.total_jobs DESC;

SELECT cd.name, cjc.total_jobs_posted,
CASE
    WHEN cjc.total_jobs_posted < 10 THEN 'Small'
    WHEN cjc.total_jobs_posted BETWEEN 10 AND 50 THEN 'Medium'
    WHEN cjc.total_jobs_posted > 50 THEN 'Large'
    ELSE 'Unknown'
END AS company_size
FROM company_dim cd
INNER JOIN (
    SELECT jpf.company_id, COUNT(*) AS total_jobs_posted
    FROM job_postings_fact jpf
    GROUP BY jpf.company_id
) AS cjc ON cd.company_id = cjc.company_id
ORDER BY cjc.total_jobs_posted DESC;