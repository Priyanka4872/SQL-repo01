USE JJBA;

DROP TABLE IF EXISTS EMPLOYEE;

CREATE TABLE EMPLOYEE (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    employee_salary DECIMAL(10,2),
    employee_department VARCHAR(30)
);
INSERT INTO EMPLOYEE (employee_id, employee_name, employee_salary, employee_department) VALUES
(1, 'Alice Smith', 85000.00, 'IT'),
(2, 'Bob Jones', 95000.00, 'IT'),
(3, 'Charlie Brown', 60000.00, 'Sales'),
(4, 'David Miller', 62000.00, 'Sales'),
(5, 'Eva Green', 75000.00, 'HR'),
(6, 'Frank White', 85000.00, 'IT'),
(7, 'Grace Baker', 55000.00, 'Sales'),
(8, 'Henry Clark', 90000.00, 'IT'),
(9, 'Ivy Davis', 72000.00, 'HR'),
(10, 'Jack Wilson', 62000.00, 'Sales');
select * from employee;

SELECT employee_id,
employee_name,
employee_salary,  
employee_department ,
case
when (avg(employee_salary) OVER(partition by employee_department) > employee_salary)
then 
avg(employee_salary) OVER(partition by employee_department)-employee_salary 
else 
avg(employee_salary) OVER(partition by employee_department)+employee_salary 
end as total
FROM employee;

SELECT employee_id ,
employee_name,
employee_salary,
dense_Rank() OVER(ORDER BY employee_salary DESC) AS salary_rank
FROM employee;

