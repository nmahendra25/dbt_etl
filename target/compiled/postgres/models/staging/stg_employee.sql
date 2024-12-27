with source_data as (
    select * from "DBT_DEMO"."STAGING"."employee"
)

SELECT 
    "EmployeeID",
    "FirstName",
    "LastName",
    CONCAT("FirstName",' ',"LastName") AS "EmployeeName",
    "Department",
    "Salary",
    "DateOfJoining",
    -- Calculate SalaryCategory
    CASE
        WHEN "Salary" < 60000 THEN 'Low'
        WHEN "Salary" BETWEEN 60000 AND 79999 THEN 'Medium'
        WHEN "Salary" >= 80000 THEN 'High'
    END AS SalaryCategory,
    -- Calculate YearsInCompany
    DATE_PART('year', AGE("DateOfJoining"::date)) AS YearsInCompany
FROM source_data