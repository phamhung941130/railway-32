-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java.Hướng dẫn: sử dụng UNION
SELECT e.Employee_Number,e.Employee_Name,es.Skill_Code FROM Employee_Table e
JOIN Employee_Skill_Table es ON es.Employee_Number = e.Employee_Number
WHERE Skill_Code = 'Java';
-- Question 4:Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT d.Department_Name,COUNT(e.Department_Number) FROM Employee_Table e
JOIN Department d ON d.Department_Number = e.Department_Number
GROUP BY e.Department_Number 
HAVING COUNT(e.Department_Number) >3;
SELECT * FROM Employee_Table;
-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.
SELECT Employee_Name,Department_Name FROM Employee_Table e
JOIN Department d ON d.Department_Number = e.Department_Number
GROUP BY d.Department_Name,e.Employee_Name ORDER BY d.Department_Name DESC;
-- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.Hướng dẫn: sử dụng DISTINCT
SELECT DISTINCT Employee_Name FROM Employee_Skill_Table;
SELECT e.Employee_Number,DISTINCT e.Employee_Name,es.Skill_Code FROM Employee_Table e
JOIN Employee_Skill_Table es ON es.Employee_Number = e.Employee_Number;


