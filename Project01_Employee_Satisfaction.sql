-- show full table
SELECT * FROM EmSat.em;

-- sort employees as their salary in each dept
SELECT dept AS Department, 
SUM(CASE WHEN salary = 'low' THEN 1 ELSE 0 END) AS 'low',
SUM(CASE WHEN salary = 'medium' THEN 1 ELSE 0 END) AS 'medium',
SUM(CASE WHEN salary = 'high' THEN 1 ELSE 0 END) AS 'high'
FROM EmSat.em
GROUP BY dept;

-- count number of employees, avg satisfaction level, monthly hours, and time spend in each department
SELECT DISTINCT dept AS Department, COUNT(*) AS Number_of_Employees, ROUND(AVG(satisfaction_level),2) AS Average_Satisfaction_Level,
ROUND(AVG(last_evaluation),2) AS LAST_Average_Satisfaction_Level,
ROUND(AVG(average_montly_hours), 2) AS Average_Monthly_Hours, ROUND(AVG(time_spend_company), 2) AS Average_Years_Spend
FROM EmSat.em
GROUP BY (dept)
ORDER BY Average_Satisfaction_Level ASC;

-- count employees of each type of salary
SELECT salary AS Salary, COUNT(*) AS Number_of_Employees, ROUND(AVG(satisfaction_level),2) AS Average_Satisfaction_Level, 
ROUND(AVG(last_evaluation),2) AS LAST_Average_Satisfaction_Level
FROM EmSat.em
GROUP BY(salary)
ORDER BY Salary ASC;

-- overal average satisfaction level of employees (present and last)
SELECT ROUND(AVG(satisfaction_level),2) AS Current_Avg_Satisfaction_Level, ROUND(AVG(last_evaluation),2) AS LAST_Avg_Satisfaction_Level FROM EmSat.em;

-- detect employees work longer years and their sat level
SELECT `Emp ID` AS Emp_ID, satisfaction_level AS Current_Avg_Level,last_evaluation AS LAST_Avg_Level, time_spend_company AS Avg_Time
FROM EmSat.em
WHERE time_spend_company >= 7
ORDER BY satisfaction_level;

-- detect employees work fewer years and their sat level
SELECT `Emp ID` AS Emp_ID, satisfaction_level AS Current_Avg_Level, last_evaluation AS LAST_Avg_Level, time_spend_company AS Avg_Time
FROM EmSat.em
WHERE time_spend_company <= 3
ORDER BY satisfaction_level;

-- employees, years working and their sat level to see the changes
SELECT `Emp ID` AS Emp_ID, satisfaction_level AS Current_Avg_Level,last_evaluation AS LAST_Avg_Level, time_spend_company AS Avg_Time
FROM EmSat.em
ORDER BY satisfaction_level;

-- sort employees as their groups of satisfation levels in each department
