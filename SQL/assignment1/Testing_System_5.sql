-- CREATE OR REPLACE View ... AS
-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE OR REPLACE VIEW Q1 AS 
SELECT a.AccountID,a.Email,a.Username,a.FullName,d.DepartmentName,p.PositionName,a.CreateDate FROM `account` a
INNER JOIN Department d ON d.DepartmentID = a.DepartmentID
INNER JOIN Position p ON p.PositionID = a.PositionID
WHERE DepartmentName = 'sale';
SELECT * FROM Q1;
-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
SELECT * FROM Q2;
CREATE OR REPLACE VIEW Q2 AS
WITH cte_SL as(
SELECT AccountID, COUNT(*) SL FROM GroupAccount ga GROUP BY AccountID)
SELECT a.AccountID,a.Email,a.Username,a.FullName, COUNT(*) So_lan FROM GroupAccount ga
INNER JOIN `Account` a ON a.AccountID = ga.AccountID
GROUP BY ga.AccountID
HAVING So_lan = (SELECT MAX(SL) FROM cte_SL);
SELECT * FROM ACC_nhieu_Group_nhat;
-- Question3: Tạo view chứa những câu hỏi có content quá dài và xóa nó đi
SELECT * FROM Question;
CREATE OR REPLACE VIEW Q3 AS
SELECT * FROM Question WHERE length(Content) > 19;
SELECT * FROM Q3;
-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
SELECT COUNT(*) SL FROM `Account` a GROUP BY DepartmentID;
CREATE OR REPLACE VIEW Q4 AS
WITH cte_SL AS (SELECT MAX(SL) FROM (SELECT COUNT(1) SL FROM `Account` a GROUP BY a.DepartmentID
) as temp)
SELECT d.DepartmentName,COUNT(*) Nhieunvnhat FROM `Account` a
INNER JOIN Department d ON d.DepartmentID = a.DepartmentID
GROUP BY a.DepartmentID
HAVING Nhieunvnhat =(SELECT * FROM cte_SL);
SELECT * FROM Q4;

-- Question 5: Tạo View có chứa tất cả các câu hỏi do user họ Nguyễn tạo
SELECT * FROM Question;
SELECT * FROM `Account`;
CREATE OR REPLACE VIEW Q5 AS
SELECT a.AccountID,a.Username,a.FullName,q.QuestionID,q.Content FROM Question q
INNER JOIN `Account` a ON a.AccountID = q.CreatorID
WHERE Username LIKE 'User1%';
SELECT * FROM Q5;