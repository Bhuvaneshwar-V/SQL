CREATE DATABASE data_new;

USE data_new;

-- 1. Show all the rows & coluns in the table
SELECT * FROM test1;

-- 2. Show only the EmployeeName & JobTitle columns
SELECT EmployeeName, JobTitle FROM test1;

-- 3. Show the number of employees in the table
SELECT COUNT(*) FROM test1;

-- 4. Show the unique job titles in the table
SELECT DISTINCT(JobTitle) FROM test1;
-- count of unique jobs
SELECT COUNT(DISTINCT(JobTitle)) FROM test1;

-- Show the job title & overtime pay for all employees with overtime pay greater than 50000
SELECT JobTitle, OvertimePay FROM test1
WHERE OvertimePay > 50000;

-- Show the average base pay for all employees
SELECT AVG(BasePay) FROM test1;

-- Show the top 10 highest paid employees
SELECT EmployeeName, TotalPay FROM test1
ORDER BY TotalPay DESC
LIMIT 10;

-- Show the average of BasePay, OvertimePay & OtherPay for each employee
SELECT EmployeeName, (BasePay+OvertimePay+OtherPay)/3 AS average_pay FROM test1;

-- Show all employees who have the word "Manager" in their job title
SELECT EmployeeName, JobTitle FROM test1
WHERE JobTitle LIKE '%Manager%';

-- Show all employees with a job title not equal to "Manager"
SELECT  EmployeeName, JobTitle FROM test1
WHERE JobTitle != 'Manager';

-- Show all employees with a total pay between 50,000 & 75,000
SELECT EmployeeName, TotalPay FROM test1
WHERE TotalPay BETWEEN 50000 AND 75000;

-- Show all employees with a base pay less than 50,000 or a total pay greater than 1,00,000
SELECT EmployeeName, BasePay, TotalPay FROM test1
WHERE BasePay < 50000 OR TotalPay > 100000;

-- Show all employees with a total pay benefits value between 1,25,000 and 1,50,000 & a job title containing the word 'Director'
SELECT * FROM test1
WHERE TotalPayBenefits BETWEEN 125000 AND 150000 AND JobTitle LIKE '%Director%';

-- Show all employees ordered by their total pay benefits in descending order
SELECT * FROM test1
ORDER BY TotalPayBenefits DESC;

-- Show all job titles with an average base pay of atleast 1,00,000 & order them by the average base pay in descending order

SELECT JobTitle, AVG(BasePay) AS Avg_BasePay FROM test1
GROUP BY JobTitle
HAVING Avg_BasePay >= 100000
ORDER BY Avg_BasePay DESC;

-- Delete the notes column
ALTER TABLE test1
DROP COLUMN Notes;
SELECT * FROM test1;

-- SAFE UPDATE MODE
SET SQL_SAFE_UPDATES = 0;

-- Update the base pay of all employees with the job title containing "Manager" by increasing it by 10%
UPDATE test1
SET BasePay = BasePay * 1.1
WHERE JobTitle LIKE '%Manager%';

SELECT * FROM test1;

-- Delete all employees who have no OvertimePay
DELETE FROM test1
WHERE OvertimePay = 0;

SELECT * FROM test1;

