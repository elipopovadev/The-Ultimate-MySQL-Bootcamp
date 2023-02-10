USE office_db;
SELECT * FROM employees;

-- 1. OVER()
SELECT emp_no,
       department,
       salary,
       AVG(salary) OVER() AS company_avg_salary_on_each_row
FROM employees;


-- 2. Over(PARTITION BY ...) 
SELECT emp_no,
       department,
       salary,
       AVG(salary) OVER(PARTITION BY department) AS department_avg_salary_on_each_row_for_every_dpt
FROM employees;


SELECT emp_no,
       department,
       salary,
       AVG(salary) OVER(PARTITION BY department) AS department_avg_salary_on_each_row_for_every_dpt,
       MIN(salary) OVER(PARTITION BY department) AS department_min_salary_on_each_row_for_every_dpt
FROM employees
ORDER BY department_avg_salary_on_each_row_for_every_dpt DESC;


SELECT emp_no, 
       department, 
       salary, 
       SUM(salary) OVER(PARTITION BY department) AS department_payroll,
       SUM(salary) OVER() AS company_total_payroll
FROM employees;


-- 3. Over(PARTITION BY ... ORDER BY ...) AS 'rolling...'
SELECT emp_no,
       department,
       salary,
       SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS rolling_dept_salary
FROM employees;


SELECT emp_no, 
	   department, 
	   salary, 
	   SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS rolling_dept_salary,
	   SUM(salary) OVER(PARTITION BY department) AS total_dept_salary
FROM employees;


-- 4. ROW_NUMBER(), RANK(), DENSE_RANK()
SELECT emp_no, 
	   department, 
	   salary,
	   ROW_NUMBER() OVER(ORDER BY salary) AS overall_row_number,
	   RANK() OVER(ORDER BY salary) AS overall_rank,
	   DENSE_RANK() OVER(ORDER BY salary) AS overall_dense_rank
FROM employees;


SELECT emp_no, 
	   department, 
	   salary,
	   ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary) AS department_row_number,
	   RANK() OVER(PARTITION BY department ORDER BY salary) AS department_rank,
	   DENSE_RANK() OVER(PARTITION BY department ORDER BY salary) AS department_dense_rank
FROM employees;	  
	   

-- 5. NTILE() --> if you want to see the quartiles
SELECT emp_no, 
	   department, 
	   salary,
       NTILE(4) OVER(ORDER BY salary) AS quartiles
FROM employees;


-- 6. LEAD() & LAG() -- if you want to see rows differences
SELECT emp_no, 
	   department, 
	   salary,
       LEAD(salary) OVER(ORDER BY salary) AS next_values,
       LAG(salary) OVER(ORDER BY salary) AS prev_values
FROM employees;

SELECT emp_no, 
	   department, 
	   salary,
       salary - LEAD(salary) OVER(ORDER BY salary) AS lead_diff,
       salary - LAG(salary) OVER(ORDER BY salary) AS lag_diff
FROM employees;

