# Experiment: Design of a Parameterized Stored Procedure for Employee Count by Gender (CData, Toddle)

---

## Aim
To design and implement a stored procedure that accepts **gender as an input parameter** and returns the **total number of employees** based on the given gender.

---

## Software Requirements

### Database Management System
- PostgreSQL  

### Client Tool
- pgAdmin  

---

## Objective
To write and execute a **PL/pgSQL stored procedure** that dynamically accepts gender as an argument and computes the employee count.

---

## Problem Statement
Organizations require flexible reporting systems to analyze workforce distribution based on gender for:
- Compliance  
- HR analytics  
- Decision-making  

---

## Theory
A **stored procedure** is a precompiled set of SQL statements stored in the database.  
- **IN parameter** → accepts input  
- **OUT parameter** → returns output  
- **INOUT parameter** → accepts input and returns modified output  
- Improves performance and reusability  

---

## Table Creation

```sql
CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    gender VARCHAR(10),
    salary NUMERIC(10,2)
);
```

## Inserting Sample Data
```sql
INSERT INTO employees (emp_name, gender, salary) VALUES
('Amit', 'Male', 30000),
('Riya', 'Female', 35000),
('John', 'Male', 28000),
('Sneha', 'Female', 40000);
```
## Stored Procedure
```sql
CREATE OR REPLACE PROCEDURE get_Employee_Count_BY_Gender(IN P_GEN VARCHAR(20), OUT COUNT_EMP INT, INOUT STATUS VARCHAR)
AS
	$$
		BEGIN

			SELECT COUNT(*) INTO COUNT_EMP FROM EMPLOYEES WHERE GENDER=P_GEN;
			STATUS:='SUCCESS';
        END;
	 $$ LANGUAGE PLPGSQL
```
## Execution Block
```sql
		DO
		$$
		DECLARE
			GEN VARCHAR(20):='Male';
			COUNT_BY_GEN INT;
			STATUS VARCHAR(20):='Fail';
		BEGIN

			CALL  get_Employee_Count_BY_Gender(GEN,COUNT_BY_GEN,STATUS);

			RAISE NOTICE 'GENDER IS % YOUR COUNT IS %  AND STATUS IS %',GEN,COUNT_BY_GEN,STATUS;
			
		END;

    $$
```
##Output


## Steps Performed
- Created the `employees` table  
- Inserted sample employee records  
- Designed stored procedure with IN, OUT, INOUT parameters  
- Compiled the procedure  
- Executed procedure using DO block  
- Displayed result using RAISE NOTICE  

---

## Result
The stored procedure successfully accepts gender as input and returns the correct employee count dynamically.

---

## Learning Outcome
After completing this experiment, the learner is able to:

- Understand stored procedure structure  
- Implement IN, OUT, INOUT parameters  
- Pass dynamic input values  
- Use aggregate functions like COUNT  
- Develop reusable database logic  


## Screenshots
<img width="1492" height="886" alt="Screenshot 2026-04-03 094754" src="https://github.com/user-attachments/assets/9e9d9e20-f88d-4c21-b71e-dca801069eda" />
<img width="1486" height="890" alt="Screenshot 2026-04-03 094742" src="https://github.com/user-attachments/assets/da328020-cde1-44e4-90b7-882498dd2daa" />
















