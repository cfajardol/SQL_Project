/*SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY location_category;*/

/*
I want to categorize the salaries from each job posting. To see if it fits in my desired
salary range
-Put salary into different buckets
-Define what's a high, standard, or low salary wiith our own conditions
-why? It is easy to determine which job postings are worth looking at based on salary.
Bucketing is a commong practice in data analysis when viewen categories.
-I only want to look at data analyst roles
-Order from highest to lowest


SELECT 
job_title_short,
salary_year_avg,
CASE
    WHEN salary_year_avg >= 80000 THEN 'High salary'
    WHEN salary_year_avg >= 60000 THEN 'Standard salary'
    WHEN salary_year_avg IS NOT NULL THEN 'Low salary'
    ELSE 'Not specifiied'
END AS Bucketing
FROM job_postings_fact
WHERE job_title_short LIKE '%Data Analyst%'
ORDER BY Bucketing DESC;
*/
