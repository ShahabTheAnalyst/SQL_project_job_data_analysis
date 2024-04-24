
/*
Question: What are the top job portal in term of number of job listings?
- Extract the name of the job portal/board from the job_via column.
- Identify the top 5 portals/boards.
- Why? 
    To assist job seekers in job hunt for data roles.
*/


-- For all data roles.
SELECT
    TRIM(SPLIT_PART(TRIM(SPLIT_PART(job_via, ' ', -1)), '.', 1)) as job_board,
    COUNT(*) as job_postings
FROM 
    job_postings_fact
GROUP BY
    job_board
ORDER BY
    job_postings DESC
LIMIT 5;

-- For data analyst roles offering salary.
SELECT
    TRIM(SPLIT_PART(TRIM(SPLIT_PART(job_via, ' ', -1)), '.', 1)) as job_board,
    count(*) AS job_postings
FROM 
    job_postings_fact
WHERE
        job_title_short = 'Data Analyst' AND 
        salary_year_avg IS NOT NULL
GROUP BY
    job_board
ORDER BY
    job_postings DESC
LIMIT 5;


-- -- For remote data analyst roles offering salary.
SELECT
    TRIM(SPLIT_PART(TRIM(SPLIT_PART(job_via, ' ', -1)), '.', 1)) as job_board,
    count(*) AS job_postings
FROM 
    job_postings_fact
WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL
GROUP BY
    job_board
ORDER BY
    job_postings DESC
LIMIT 5;