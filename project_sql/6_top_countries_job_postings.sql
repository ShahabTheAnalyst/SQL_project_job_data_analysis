
/* Question: Which countries have the highest number of job posting of Data Analysts?
    - Split and trim the job location to get data on country.
    - Then group the count of the number of the job posting by country.
    - Why?
        The output will provide insight about about countries is which data analysts
        are in high demand.

*/

/*
SELECT
    Count(*),
    CASE
        WHEN LENGTH(TRIM(SPLIT_PART(job_location, ',', -1))) = 2 THEN 'US'
        WHEN TRIM(SPLIT_PART(job_location, ',', -1)) = 'Anywhere' THEN 'Remote'
        ELSE SPLIT_PART(job_location, ',', -1)
        END AS country
FROM 
    job_postings_fact
GROUP BY
    country
--ORDER BY
  --  COUNT(*) DESC
LIMIT 25;
*/


SELECT
    CASE
        WHEN LENGTH(TRIM(SPLIT_PART(country, ',', -1))) = 2 THEN 'US'
        WHEN TRIM(SPLIT_PART(country, ',', -1)) = 'Anywhere' THEN 'Remote'
        ELSE TRIM(SPLIT_PART(country, ',', -1))
        END AS location
    ,Count(*) AS job_postings
FROM 
    (SELECT
        job_location,
        job_title_short,
        TRIM(SPLIT_PART(job_location, '(', -1)) AS country
    FROM 
        job_postings_fact
)
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location
ORDER BY
    COUNT(*) DESC
LIMIT 10;

/* 
    The output list the top 10 countries which have the highest demand for data
    analysts.

    [
  {
    "location": "US",
    "job_postings": "69535"
  },
  {
    "location": "Remote",
    "job_postings": "13331"
  },
  {
    "location": "France",
    "job_postings": "13292"
  },
  {
    "location": "Germany",
    "job_postings": "6735"
  },
  {
    "location": "Singapore",
    "job_postings": "6578"
  },
  {
    "location": "India",
    "job_postings": "5047"
  },
  {
    "location": "Spain",
    "job_postings": "4788"
  },
  {
    "location": "Italy",
    "job_postings": "4402"
  },
  {
    "location": "Philippines",
    "job_postings": "4152"
  },
  {
    "location": "Netherlands",
    "job_postings": "3948"
  }
]
*/