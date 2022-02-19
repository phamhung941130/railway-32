--
USE testingsystem;
-- Question 2:
SELECT * FROM department
ORDER BY departmentID ASC;

-- Question 3:
SELECT d.departmentID FROM department d WHERE departmentName = 'sale';

-- Question 4:Lấy ra thông tin Account có fullname dài nhất:
SELECT * FROM `Account`;
SELECT *
FROM `ACCOUNT` a
WHERE length(FULLNAME) = (SELECT max(length(FULLNAME)) FROM `ACCOUNT`);

-- Question 5: Lấy ra thông tin Account có full name dài nhất và thuộc phòng ban có ID =3
WITH cte_dep3 AS(SELECT * FROM `account` WHERE DepartmentID =3)
SELECT * FROM cte_dep3
WHERE length(FULLNAME) = (SELECT max(length(FULLNAME)) FROM cte_dep3);

-- Question 6: Lấy ra tên gruop đã tham gia trước ngày 20/12/2019
SELECT * FROM `group`;
SELECT GroupName, CreateDate
FROM `group`
Where CreateDate < '2019-12-20';

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT * FROM answer;
SELECT a.QuestionID Câu_hỏi, COUNT(QuestionID) Câu_Trả_Lời
FROM answer a
GROUP BY Câu_hỏi
HAVING Câu_Trả_Lời >= 4;

-- Question8: Lấy ra các mã đề thi có thời gian thi >=60 phút và được tạo trước ngày 20/12/2019
SELECT `code`,CreateDate
FROM exam
WHERE Duration >= 60 AND CreateDate < '2020-12-20';
SELECT * FROM exam;
-- Question 9: Lấy ra 5 group đc tạo gần đây nhất 
SELECT * FROM `Group`;
SELECT * FROM `Group` ORDER BY CreateDate DESC LIMIT 5;
-- Question 10: Đếm số nhân viên thuộc department có ID = 2
SELECT COUNT(1)
FROM `account`
WHERE DepartmentID =2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT * FROM `account`;
SELECT *
FROM `account`
WHERE  FULLNAME LIKE 'a%g';

SELECT * FROM `account` a WHERE substring_index(a.Username," ",-1) LIKE 'd%o';

-- Question 12: Xóa tất cả exam được tạo trước ngày 20/12/2019
DELETE
FROM examquestion
WHERE ExamID IN (SELECT ExamID FROM exam WHERE CreateDate < '2019-12-20');
DELETE FROM exam WHERE CreateDate < '2019-12-20';

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE
FROM ExamQuestion
WHERE QuestionID IN (SELECT QuestionID FROM Question WHERE Content LIKE 'câu hỏi%');
DELETE FROM Answer
WHERE QuestionID IN (SELECT QuestionID FROM Question WHERE    Content LIKE 'câu hỏi%');
DELETE FROM Question WHERE Content LIKE 'câu hỏi%';

-- Question 14: Update thông tin của account có id =5 thành tên" NGuyễn Bá Lộc" và email thành loc.nguyenba@vti.com
UPDATE `account`
SET FULLNAME = 'Nguyễn Bá Lộc',EMAIL = 'loc.nguyenba@vti.com'
WHERE ACCOUNTID =5;
SELECT * FROM `account`;

-- Question 15: update account có id=5 sẽ thuộc group có id = 4
UPDATE groupaccount
SET GroupID =4
WHERE AccountID =5;
