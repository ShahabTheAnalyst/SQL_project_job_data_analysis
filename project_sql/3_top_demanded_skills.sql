/*
Question: What are the top 5 in-demand skills for remote data analysts jobs?
- Inner JOIN the tables on their respective primary and foreign keys.
- Identify the top 5 in-demand skills for a data analyst.
- Focus on on data analyst and romote jobs.
- Why? To get insights into the most valuable skills for remote data analyst jobs.
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;

/*
The list is topped by SQL, followed by Excel and Python, which shows that strong skills in data 
processing, manipulation, etc are in high demand. 
At no 4 and 5 on the list are Tableau and Power BI which points to high demand for expertise in
data analysis and data visualization/storytelling.

[
  {
    "skills": "sql",
    "demand_count": "7291"
  },
  {
    "skills": "excel",
    "demand_count": "4611"
  },
  {
    "skills": "python",
    "demand_count": "4330"
  },
  {
    "skills": "tableau",
    "demand_count": "3745"
  },
  {
    "skills": "power bi",
    "demand_count": "2609"
  }
]
*/