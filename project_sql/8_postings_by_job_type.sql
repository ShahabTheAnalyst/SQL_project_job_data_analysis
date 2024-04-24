/*
Question: What is the breakdown of job postings by job type?
- Clean and transform the job_type column.
- Get an overview
- Focuses on remote data analyst jobs with specified salaries.

- Why?
  To enable a job seeker to get an overview of the job types.
*/


-- Looking at the distinct job types.
SELECT
    DISTINCT(job_schedule_type)
FROM
    job_postings_fact;

-- Developing and idea and preparing for the final query.
SELECT
    --job_schedule_type,
    SPLIT_PART(job_schedule_type, ' ', 1) AS job_type,
    COUNT(*)
FROM
    job_postings_fact
GROUP BY
    job_type;


-- For all data roles.

SELECT
        CASE
        WHEN SPLIT_PART(SPLIT_PART(job_schedule_type, ' ', 1), ',', 1) = 'Kontraktor' THEN 'Contractor'
        ELSE SPLIT_PART(SPLIT_PART(job_schedule_type, ' ', 1), ',', 1)
        END AS job_type,
    COUNT(*) AS job_postings
FROM
    job_postings_fact
WHERE
    SPLIT_PART(SPLIT_PART(job_schedule_type, ' ', 1), ',', 1) IN ('Contractor', 'Full-time', 'Internship', 'Part-time', 'Temp')
GROUP BY
    job_type
ORDER BY
    job_postings DESC;


-- For remote data analyst with specified salary

SELECT
        CASE
        WHEN SPLIT_PART(SPLIT_PART(job_schedule_type, ' ', 1), ',', 1) = 'Kontraktor' THEN 'Contractor'
        ELSE SPLIT_PART(SPLIT_PART(job_schedule_type, ' ', 1), ',', 1)
        END AS job_type,
    COUNT(*) AS job_postings
FROM
    job_postings_fact
WHERE
    SPLIT_PART(SPLIT_PART(job_schedule_type, ' ', 1), ',', 1) IN ('Contractor', 'Full-time', 'Internship', 'Part-time', 'Temp') AND 
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
GROUP BY
    job_type
ORDER BY
    job_postings DESC;

/*
    The output shows that for remote data analyst with specified salary the full time jobs 
    listing are the highest followed by contractor and
    part-time respectively.
[
  {
    "job_type": "Full-time",
    "job_postings": "582"
  },
  {
    "job_type": "Contractor",
    "job_postings": "19"
  },
  {
    "job_type": "Part-time",
    "job_postings": "2"
  }
]

*/