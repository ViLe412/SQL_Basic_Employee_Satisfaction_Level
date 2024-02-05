-- show full table
SELECT * FROM EmSat.em;

-- Q1: sort employees as their salary in each dept
SELECT dept AS Department, 
SUM(CASE WHEN salary = 'low' THEN 1 ELSE 0 END) AS 'low',
SUM(CASE WHEN salary = 'medium' THEN 1 ELSE 0 END) AS 'medium',
SUM(CASE WHEN salary = 'high' THEN 1 ELSE 0 END) AS 'high'
FROM EmSat.em
GROUP BY dept;

-- Q2: count number of employees, avg satisfaction level, monthly hours, and time spend in each department
SELECT DISTINCT dept AS Department, COUNT(*) AS Number_of_Employees, ROUND(AVG(satisfaction_level),2) AS Average_Satisfaction_Level,
ROUND(AVG(last_evaluation),2) AS LAST_Average_Satisfaction_Level,
ROUND(AVG(average_montly_hours), 2) AS Average_Monthly_Hours, ROUND(AVG(time_spend_company), 2) AS Average_Years_Spend
FROM EmSat.em
GROUP BY (dept)
ORDER BY Average_Satisfaction_Level ASC;

-- Q3: count number of employees, avg satisfaction level, monthly hours, and time spend in each salary types
SELECT salary AS Salary, COUNT(*) AS Number_of_Employees, ROUND(AVG(satisfaction_level),2) AS Average_Satisfaction_Level, 
ROUND(AVG(last_evaluation),2) AS LAST_Average_Satisfaction_Level
FROM EmSat.em
GROUP BY(salary)
ORDER BY Salary ASC;

-- Q4: overal average satisfaction level of employees (present and last)
SELECT ROUND(AVG(satisfaction_level),2) AS Current_Avg_Satisfaction_Level, ROUND(AVG(last_evaluation),2) AS LAST_Avg_Satisfaction_Level FROM EmSat.em;

-- Q7: detect employees work longer years and their sat level
SELECT `Emp ID` AS Emp_ID, satisfaction_level AS Current_Avg_Level,last_evaluation AS LAST_Avg_Level, time_spend_company AS Avg_Time
FROM EmSat.em
WHERE time_spend_company >= 7
ORDER BY satisfaction_level;

-- Q8: Total number of employess:
SELECT count(`Emp ID`)
from EmSat.em;

-- Q9: Total number of departments:
select count(DISTINCT(dept))
from EmSat.em;

-- Q10: sort employees as their groups of satisfation levels in each department
select dept as Department, ROUND(AVG(satisfaction_level),4) as Average_Satisfaction
FROM EmSat.em
GROUP BY dept;

-- Q11: Average satisfaction level group by years at company:
SELECT time_spend_company AS Years_With_Company, ROUND(AVG(satisfaction_level),4) AS Average_Satisfaction
FROM EmSat.em
GROUP BY time_spend_company
ORDER BY time_spend_company;

-- Q12: Average satisfaction level:
SELECT ROUND(AVG(satisfaction_level),4)
FROM EmSat.em;

-- Q13: Average satisfaction level group by number of projects:
SELECT number_project AS Number_Projects, ROUND(AVG(satisfaction_level),4) AS Average_Satisfaction
FROM EmSat.em
GROUP BY number_project
ORDER BY number_project;

-- Q14: Average satisfaction level group by monthly hours:
SELECT average_montly_hours AS Monthly_Hours, ROUND(AVG(satisfaction_level),4) AS Average_Satisfaction
FROM EmSat.em
GROUP BY average_montly_hours
ORDER BY average_montly_hours;
