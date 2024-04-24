

COPY company_dim
FROM 'E:\Data Analysis\Portfolio\SQL\job_data_analysis\Data\company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM 'E:\Data Analysis\Portfolio\SQL\job_data_analysis\Data\skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM 'E:\Data Analysis\Portfolio\SQL\job_data_analysis\Data\job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM 'E:\Data Analysis\Portfolio\SQL\job_data_analysis\Data\skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');