CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    gender VARCHAR(10),
    salary NUMERIC(10,2)
);

INSERT INTO employees (emp_name, gender, salary) VALUES
('Amit', 'Male', 30000),
('Riya', 'Female', 35000),
('John', 'Male', 28000),
('Sneha', 'Female', 40000)

--count numbe of employees based on Gender

SELECT * FROM EMPLOYEES;

CREATE OR REPLACE PROCEDURE get_Employee_Count_BY_Gender(IN P_GEN VARCHAR(20), OUT COUNT_EMP INT, INOUT STATUS VARCHAR)
AS
	$$
		BEGIN

			SELECT COUNT(*) INTO COUNT_EMP FROM EMPLOYEES WHERE GENDER=P_GEN;
			STATUS:='SUCCESS';
        END;
	 $$ LANGUAGE PLPGSQL


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

