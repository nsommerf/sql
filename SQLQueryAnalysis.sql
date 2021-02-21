--List the followoing details for each employee:  employee number, last name, first name, sex, salary
SELECT e."EmpNo", e."EmpLastName", e."EmpFirstName", e."EmpSex", s."Salary"
FROM public."Employee" e
JOIN public."Salaries" s
ON (s."EmpNo" = e."EmpNo")


-- List first name, last name, and hire date for eployees who were hired in `1986`
SELECT "EmpFirstName", "EmpLastName", "EmpHireDate"
FROM public."Employee" 
WHERE "EmpHireDate" >= '1/1/1986' AND "EmpHireDate" <= '12/31/1986'

-- List the manager of each department with the following information:  department number, dept name,
-- managers employee number, last name, first name
-- which manager is current - first or second?  There are two per each dept
SELECT d."DeptNo", d."DeptName", i."EmpNo", e."EmpLastName", e."EmpFirstName"
FROM public."Departments" d
JOIN public."DeptManager" i
ON (d."DeptNo" = i."DeptNo")
JOIN public."Employee" e
ON (i."EmpNo" = e."EmpNo")

-- List the department of each employees with the following information: employee number, last name first name, and department name
-- Some people have two different departments, which one is correct
SELECT e."EmpNo", e."EmpLastName", e."EmpFirstName", d."DeptName"
FROM public."Employee" e
JOIN public."DeptEmp" i
ON (i."EmpNo" = e."EmpNo")
JOIN public."Departments" d
ON (i."DeptNo" = d."DeptNo")


-- List first name, last name and sex for employees who's first name is "Hercules" and last names begin with "B"
SELECT "EmpFirstName", "EmpLastName", "EmpSex"
FROM public."Employee"
WHERE ("EmpFirstName" = 'Hercules' AND "EmpLastName" Like 'B%')

-- List all employees in the Sales dept, including their employee number, last name, first name and department name
SELECT e."EmpNo", e."EmpLastName", e."EmpFirstName", d."DeptName"
FROM public."Employee" e
JOIN public."DeptEmp" i
ON (i."EmpNo" = e."EmpNo")
JOIN public."Departments" d
ON (i."DeptNo" = d."DeptNo")
WHERE (d."DeptName" = 'Sales')

--List all employees in the sales and development departments, including their employee number, last name, first name and dept name
SELECT e."EmpNo", e."EmpLastName", e."EmpFirstName", d."DeptName"
FROM public."Employee" e
JOIN public."DeptEmp" i
ON (i."EmpNo" = e."EmpNo")
JOIN public."Departments" d
ON (i."DeptNo" = d."DeptNo")
WHERE (d."DeptName" = 'Sales' OR d."DeptName" = 'Development')

-- In decending order, list the frequency count of employee last names, i.e how manu employees share each last name
SELECT "EmpLastName", COUNT(DISTINCT "EmpLastName") AS "Last Name Count"
FROM public."Employee"
GROUP BY "EmpLastName"

