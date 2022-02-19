-- -- Exercise 1: ***********
Use testingsystem;
-- Question1: Viết lệnh lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT * FROM `account`;
SELECT a.AccountID, a.Email, a.Username, a.FULLNAME, d.DepartmentName, a.PositionID, a.CreateDate  FROM `account` a
INNER JOIN Department d ON d.DepartmentID = a.DepartmentID;

-- Question 2: Viết lệnh lấy ra thông tin các account được tạo sau ngày '2010-12-20'
SELECT a.AccountID, a.Email, a.Username, a.FULLNAME, d.DepartmentName, p.PositionName, a.CreateDate  FROM `account` a
INNER JOIN Department d ON d.DepartmentID = a.DepartmentID
INNER JOIN Position p ON p.PositionID = a.PositionID
WHERE CreateDate > '2020-03-05 00:00:00';

-- Question 3: Viết lệnh lấy ra tất cả các developer
SELECT p.PositionName, a.AccountID, a.Email, a.Username, a.FULLNAME, d.DepartmentName, a.CreateDate  FROM `account` a
INNER JOIN Department d ON d.DepartmentID = a.DepartmentID
INNER JOIN Position p ON p.PositionID = a.PositionID
WHERE p.PositionName = 'Dev';

-- Question 4: Viết lệnh lấy ra danh sách các phòng ban có > 3 nhân viên
SELECT COUNT(*)SL, d.DepartmentName FROM `account` a
INNER JOIN Department d ON d.DepartmentID = a.DepartmentID
GROUP BY DepartmentName
HAVING SL >2;
SELECT * FROM `account`;
-- Question 5: Viết lệnh để lấy ra danh sách các câu hỏi sử dụng trong đề thi nhiều nhất
SELECT * FROM Question;
SELECT * FROM Examquestion;
SELECT COUNT(1) Số_lần_SD FROM examquestion eq GROUP BY eq.QuestionID;
SELECT Max(Số_Lần_SD) FROM (SELECT COUNT(1) Số_lần_SD FROM examquestion eq GROUP BY eq.QuestionID) as temp;
SELECT q.Content, COUNT(1) FROM examquestion eq
INNER JOIN Question q ON q.QuestionID = eq.QuestionID
GROUP BY eq.QuestionID
HAVING Count(1) = (SELECT Max(Số_Lần_SD) FROM (SELECT COUNT(1) Số_lần_SD FROM examquestion eq GROUP BY eq.QuestionID) as temp);
-- Question 6: Thống kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT * FROM Question;
SELECT * FROM CategoryQuestion;
SELECT COUNT(q.categoryID) Số_Lần_SD FROM Question q
RIGHT JOIN CategoryQuestion c ON c.CategoryID = q.CategoryID
GROUP BY c.CategoryID;

-- Question 7: Thống kê mỗi Question đc sử dụng trong trong bao nhiêu Exam
SELECT q.Content, COUNT(eq.QuestionID) SL FROM examquestion eq
RIGHT JOIN Question q ON q.QuestionID = eq.QuestionID
GROUP BY q.QuestionID;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
WITH cte_SL as(SELECT COUNT(*) SL FROM answer a GROUP BY QuestionID)
SELECT COUNT(*) Số_câu,q.Content FROM answer a
INNER JOIN Question q ON q.QuestionID = a.QuestionID
GROUP BY a.QuestionID
HAVING Số_câu = (SELECT MAX(SL) FROM cte_SL);

-- Question 9: Thống kê số lượng account trong mỗi group
SELECT g.GroupName, COUNT(ga.GroupID) SL FROM GroupAccount ga
RIGHT JOIN `Group` g ON g.GroupID = ga.GroupID
GROUP BY g.GroupID;

-- Question 10: Tìm chức vụ có ít người nhất
SELECT COUNT(*) SL FROM `account` a GROUP BY a.positionID;
SELECT MIN(SL) FROM (SELECT COUNT(*) SL FROM `account` a GROUP BY a.positionID) as temp;
SELECT p.positionName,Count(*) FROM `account` a
INNER JOIN position p ON p.positionID = a.positionID 
GROUP BY a.positionID
HAVING COUNT(*) = (SELECT MIN(SL) FROM (SELECT COUNT(*) SL FROM `account` a GROUP BY a.positionID) as temp);
SELECT * FROM `account`;
SELECT p.positionName,a.positionID FROM `account` a
INNER JOIN position p ON p.positionID = a.positionID;

-- Question 11:	Thống kê mỗi phòng ban có bao nhiêu dev,test,scrum master,PM
SELECT d.DepartmentID,d.DepartmentName,p.PositionName,COUNT(a.PositionID) FROM `account` a
INNER JOIN Department d ON d.DepartmentID = a.DepartmentID
INNER JOIN Position p ON p.PositionID = a.PositionID
GROUP BY d.DepartmentID,p.PositionID;
SELECT * FROM `account`;
SELECT * FROM Position;

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì:
SELECT * FROM Answer;
SELECT q.QuestionID,q.Content,t.TypeName,a.FUllNAME,s.content FROM Question q
INNER JOIN `account` a ON a.AccountID = q.CreatorID
INNER JOIN TypeQuestion t ON t.TypeID = q.TypeID
INNER JOIN Categoryquestion CQ ON Q.CategoryID = CQ.CategoryID
INNER JOIN Answer s ON s.QuestionID = q.QuestionID;
SELECT * FROM Question;

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT t.TypeName,COUNT(q.TypeID) FROM Question q
INNER JOIN TypeQuestion t ON t.TypeID = q.TypeID
GROUP BY q.TypeID;

-- Question 14: Lấy ra group không có account nào
SELECT * FROM `Group` g
LEFT JOIN GroupAccount ga ON ga.GroupID = g.GroupID
WHERE ga.groupID is null;
SELECT * FROM GroupAccount ga
RIGHT JOIN `Group` g ON g.GroupID = ga.GroupID
WHERE ga.GroupID IS NULL;

-- Question 15: Lấy ra question không có answer nào
SELECT * FROM answer a
RIGHT JOIN Question q ON q.QuestionID = a.QuestionID
WHERE a.QuestionID IS NULL;

-- -- Exercise 2: Union
-- Question 17: a) Lấy các account thuộc nhóm thứ 1
-- 				b) Lấy các account thuộc nhóm thứ 2
-- 				c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT * FROM Groupaccount;
SELECT * FROM Groupaccount ga INNER JOIN `account` a ON a.accountID = ga.accountID
WHERE GroupID = 1
UNION
SELECT * FROM Groupaccount ga INNER JOIN `account` a ON a.accountID = ga.accountID
 WHERE GroupID = 3;
