SELECT Department.DeptName, COUNT(Employee.EmpID) AS TotalEmployees
FROM Department
LEFT JOIN Employee
ON Department.DeptID = Employee.DeptID
GROUP BY Department.DeptName;
