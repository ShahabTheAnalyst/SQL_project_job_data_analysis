/*
Question: What are the top 10 best-paying companies for remote data analyst jobs?
- Identify the higest paid remote data analyst jobs.
- Identify the average salary by company name.
- Why? It will give the job seekers an idear about the average salary offered by different
    companies/firms.
*/


WITH top_paying_jobs AS (
    SELECT	
        job_id,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
)

SELECT 
    company_name,
    ROUND(avg(salary_year_avg), 0) AS avg_salary
    --skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY 
  company_name
ORDER BY
    avg_salary DESC
LIMIT 10;



/* The result shows the averge salary offered by the top 10 companies.

[
  {
    "company_name": "AT&T",
    "avg_salary": "255830"
  },
  {
    "company_name": "Pinterest Job Advertisements",
    "avg_salary": "232423"
  },
  {
    "company_name": "Uclahealthcareers",
    "avg_salary": "217000"
  },
  {
    "company_name": "SmartAsset",
    "avg_salary": "195500"
  },
  {
    "company_name": "Inclusively",
    "avg_salary": "189309"
  },
  {
    "company_name": "Motional",
    "avg_salary": "189000"
  },
  {
    "company_name": "A-Line Staffing Solutions",
    "avg_salary": "170000"
  },
  {
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "avg_salary": "170000"
  },
  {
    "company_name": "Plexus Resource Solutions",
    "avg_salary": "165000"
  },
  {
    "company_name": "CEDARS-SINAI",
    "avg_salary": "163500"
  }
]*/