CREATE TABLE employee (
    emp_id       INT PRIMARY KEY,
    emp_name     VARCHAR(50),
    department   VARCHAR(50),
    salary       NUMERIC(10,2),
    joining_date DATE
);


INSERT INTO employee (emp_id, emp_name, department, salary, joining_date) VALUES
(101, 'Arjun Malhotra',  'Data Science', 60000, '2022-01-10'),
(102, 'Pooja Nair',     'Recruitment',  28000, '2021-03-15'),
(103, 'Siddharth Iyer', 'Backend Dev',  42000, '2020-06-20'),
(104, 'Meera Kulkarni', 'Accounts',     65000, '2019-09-05'),
(105, 'Rohan Das',      'HR Operations',24000, '2023-02-12'),
(106, 'Kavya Menon',    'Auditing',     36000, '2020-11-25'),
(107, 'Nitin Agarwal',  'Business Dev', 48000, '2021-07-30'),
(108, 'Ishita Roy',     'Marketing',    26000, '2022-12-01'),
(109, 'Aditya Kulkarni','Cloud Engg',   52000, '2022-04-18');


SELECT * FROM employee;

SELECT department,AVG(salary) AS avg_salary
FROM employee
GROUP BY department;


SELECT department,AVG(salary) AS avg_salary
FROM employee
WHERE salary > 20000
GROUP BY department;

SELECT department,AVG(salary) AS avg_salary
FROM employee
WHERE salary > 20000
GROUP BY department
HAVING AVG(salary) > 30000;

SELECT department,AVG(salary) AS avg_salary
FROM employee
WHERE salary > 20000
GROUP BY department
HAVING AVG(salary) > 30000
ORDER BY avg_salary DESC;
