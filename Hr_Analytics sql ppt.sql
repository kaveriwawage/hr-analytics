-- HR Analytics
-- 1.Average Attrition rate for all Departments
SELECT Department, CONCAT(ROUND((COUNT(Attrition) / (SELECT COUNT(Attrition) FROM HR_1) * 100), 2), "%") AS Avg_Attrition_Rate
FROM HR_1
WHERE Attrition = 'Yes'
GROUP BY Department;
-- 2.Average Hourly rate of Male Research Scientist
SELECT DISTINCT JobRole, ROUND(AVG(HourlyRate), 2) AS Avg_Hourly_Rate
FROM HR_1
WHERE Attrition = 'Yes' AND Gender = 'Male'
GROUP BY JobRole;
-- 3.Attrition Rate Vs Monthly Income Stats
SELECT COUNT(h1.Attrition) AS Attrition_Count, ROUND(AVG(h2.MonthlyIncome), 2) AS Avg_MonthlyIncome
FROM hr_1 AS h1
INNER JOIN hr_2 AS h2 ON h1.EmployeeNumber = h2.Employee_ID
WHERE h1.Attrition = 'Yes';
-- 4.Average Working Years for each Department
SELECT DISTINCT h1.JobRole, ROUND(AVG(h2.TotalWorkingYears), 2) AS Avg_Working_Years
FROM hr_1 AS h1
INNER JOIN hr_2 AS h2 ON h1.EmployeeNumber = h2.Employee_ID
GROUP BY h1.JobRole;
-- 5.Job Role vs Worklife Balance
SELECT DISTINCT h1.JobRole, SUM(h2.WorkLifeBalance) AS WorkLifeBalance
FROM hr_1 AS h1
INNER JOIN hr_2 AS h2 ON h1.EmployeeNumber = h2.Employee_ID
GROUP BY h1.JobRole;
-- 6.Attrition rate vs year since last promotion relation
SELECT h2.YearsSinceLastPromotion, CONCAT(ROUND((COUNT(h1.Attrition) / (SELECT COUNT(Attrition) FROM hr_1 WHERE Attrition = 'Yes')) * 100, 2), '%') AS Attrition_Rate
FROM hr_1 AS h1
INNER JOIN hr_2 AS h2 ON h1.EmployeeNumber = h2.Employee_ID
WHERE Attrition = 'Yes'
GROUP BY h2.YearsSinceLastPromotion
ORDER BY h2.YearsSinceLastPromotion ASC;


