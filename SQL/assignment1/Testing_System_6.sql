-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó

DROP PROCEDURE IF EXISTS sp_Q1;
DELIMITER $$
CREATE PROCEDURE sp_Q1(IN indepartmentName VARCHAR(50))
BEGIN
	SELECT * FROM `account` a
	JOIN department d ON d.departmentID = a.departmentID
	WHERE d.departmentName = indepartmentName;
END $$
DELIMITER ;
Call sp_Q1('Sale');

-- Question 2: Tạo store để in ra số lượng account trong mỗi group

DROP PROCEDURE IF EXISTS sp_Q2;
DELIMITER $$
CREATE PROCEDURE sp_Q2(IN inGroupID TINYINT)
BEGIN
	SELECT g.GroupName,COUNT(g.GroupID) FROM `Groupaccount` ga
	RIGHT JOIN `Group` G ON g.GroupID = ga.GroupID
	WHERE g.GroupID = inGroupID;
END $$
DELIMITER ;
CALL sp_Q2(3);

-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại
DROP PROCEDURE IF EXISTS sp_Q3;
DELIMITER $$
CREATE PROCEDURE sp_Q3(IN intypename VARCHAR(20))
BEGIN
	SELECT * FROM Question q
	JOIN TypeQuestion tq ON tq.TypeID = q.TypeID
	WHERE TypeName = intypename AND month(CreateDate) = month(now()) AND year(CreateDate) = year(now());
END $$
DELIMITER ;
CALL sp_Q3('Essay');

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất

DROP PROCEDURE IF EXISTS sp_q4;
DELIMITER %%
CREATE PROCEDURE sp_q4(OUT outq4 TINYINT)
BEGIN
	WITH cte_q4 as(SELECT MAX(SL) FROM (SELECT COUNT(*) SL FROM Question q GROUP BY q.TypeID) as temp)
	SELECT tq.TypeID INTO outq4 FROM Question q
	JOIN TypeQuestion tq ON tq.TypeID = q.TypeID
	GROUP BY q.TypeID
	HAVING COUNT(q.TypeID) = (SELECT * FROM cte_q4);
END %%
DELIMITER ;
SET @q4 =0;
CALL sp_q4(@q4);
SELECT @q4;
-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
SELECT * FROM typequestion WHERE TypeID = @q4;

-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên 
-- 				chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa 
-- 				chuỗi của người dùng nhập vào
SELECT * FROM `account`;
SELECT * FROM `Group`;
DROP PROCEDURE IF EXISTS sp_q6;
DELIMITER $$
CREATE PROCEDURE sp_q6(IN var VARCHAR(30))
BEGIN
	SELECT a.Username FROM `account` a
	WHERE a.Username LIKE CONCAT("%",var,"%")
	UNION
	SELECT g.GroupName FROM `Group` g
	WHERE g.GroupName LIKE CONCAT("%",var,"%");
END $$
DELIMITER ;
CALL sp_Q6('s');

-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và trong store sẽ tự động gán:
-- 				username sẽ giống email nhưng bỏ phần @..mail đi
-- 				positionID: sẽ có default là developer
-- 				departmentID: sẽ được cho vào 1 phòng chờ
-- 				Sau đó in ra kết quả tạo thành công
DROP PROCEDURE IF EXISTS sp_insertAccount;
DELIMITER $$
CREATE PROCEDURE sp_insertAccount(IN var_fullname VARCHAR(50), IN var_email VARCHAR(50))
BEGIN
	-- Tìm ra Username từ Email
    DECLARE var_Username VARCHAR(50);
	DECLARE var_CreateDate DATETIME DEFAULT now();
    SELECT substring_index(var_email,'@',1) INTO var_Username;  -- Tạo ra được Username
	INSERT INTO `account`(Email,				Username,				FullName,		DepartmentID,		PositionID,		CreateDate)
	VALUES				 (var_email,	    	var_Username,		   var_fullname,		1,			    	1,		  	var_CreateDate)	;
END$$
DELIMITER ;

CALL sp_insertAccount("Pham Trang", "TrangPNQ@gmail.com");
SELECT * FROM `ccount`;

-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
-- 				để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất

DROP PROCEDURE IF EXISTS sp_contentlengthmax;
DELIMITER $$
CREATE PROCEDURE sp_contentlengthmax(IN inTypeName VARCHAR(30))
BEGIN
	SELECT q.Content,MAX(length(q.Content)) FROM Question q JOIN TypeQuestion tq
    ON tq.TypeID = q.TypeID WHERE tq.TypeName = inTypeName;
    END$$
DELIMITER ;
CALL sp_contentlengthmax('essay');

-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID

DROP PROCEDURE IF EXISTS sp_delexam;
DELIMITER $$
CREATE PROCEDURE sp_delexam(IN inexamID VARCHAR(30))
BEGIN
DELETE FROM Exam e WHERE e.examID = inexamID;
    END$$
DELIMITER ;
CALL sp_delexam(8);

-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử dụng store ở câu 9 để xóa)
-- 				Sau đó in số lượng record đã remove từ các table liên quan trong khi removing

DROP PROCEDURE IF EXISTS SP_DeleteExamBefore3Year;
DELIMITER $$
CREATE PROCEDURE SP_DeleteExamBefore3Year(IN invaryear TINYINT)
BEGIN
	DECLARE var_counteq TINYINT UNSIGNED;
	DECLARE var_counte TINYINT UNSIGNED;
	DECLARE var_Print VARCHAR(50);
	
    WITH cte_slremove AS(
		SELECT ExamID FROM Exam WHERE year(now()) - year(CreateDate) >(invaryear-1))
	SELECT count(1) INTO var_counteq FROM examquestion eq JOIN cte_slremove cte ON cte.ExamID = eq.ExamID;
	
    SELECT count(1) INTO var_counte FROM Exam WHERE year(now()) - year(CreateDate) >(invaryear-1);
	
    DELETE FROM exam WHERE year(now())-year(CreateDate)>(invaryear-1);
	
    SELECT CONCAT("DELETE ",var_counte," IN Exam AND ", var_counteq," IN ExamQuestion") as result; -- INTO var_print;
	-- SIGNAL SQLSTATE '12345' 
	-- SET MESSAGE_TEXT = var_print;
END$$
DELIMITER ;
CALL SP_DeleteExamBefore3Year(3);
SELECT * FROM exam;
SELECT * FROM examquestion;
-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng
			-- nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được
			-- chuyển về phòng ban default là phòng ban chờ việc
DROP PROCEDURE IF EXISTS SP_DeleteDEP;
DELIMITER $$
CREATE PROCEDURE SP_DeleteDEP(IN indepartmentName VARCHAR(30))
BEGIN
	DECLARE var_depID TINYINT UNSIGNED;
	SELECT departmentID INTO var_depID FROM department WHERE departmentName = indepartmentName;
	UPDATE `account` SET departmentID = 3 WHERE departmentID = var_depID;
	DELETE FROM department WHERE departmentName = indepartmentName;
END$$
DELIMITER ;
CALL SP_DeleteDEP('Sale');

SELECT * FROM Department;
SELECT * FROM `account`;

-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay

DROP PROCEDURE IF EXISTS sp_CountQuesInMonth;
DELIMITER $$
CREATE PROCEDURE sp_CountQuesInMonth()
BEGIN
WITH CTE_12Months AS (
	SELECT 1 AS MONTH
	 UNION SELECT 2 AS MONTH
	 UNION SELECT 3 AS MONTH
	 UNION SELECT 4 AS MONTH
	 UNION SELECT 5 AS MONTH
	 UNION SELECT 6 AS MONTH
	 UNION SELECT 7 AS MONTH
	 UNION SELECT 8 AS MONTH
	 UNION SELECT 9 AS MONTH
	 UNION SELECT 10 AS MONTH
	 UNION SELECT 11 AS MONTH
	 UNION SELECT 12 AS MONTH
)
SELECT M.MONTH, count(month(Q.CreateDate)) AS SL FROM CTE_12Months M
			LEFT JOIN (SELECT * FROM question Q1 WHERE year(Q1.CreateDate) = year(now()) ) Q 
			ON M.MONTH = month(Q.CreateDate) 
			GROUP BY M.MONTH;
END$$
DELIMITER ;
Call sp_CountQuesInMonth();

-- Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6 tháng gần đây nhất
-- 				(Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong tháng")

DROP PROCEDURE IF EXISTS sp_6Month;
DELIMITER $$
CREATE PROCEDURE sp_6Month()
BEGIN
	WITH cte_6month AS(
    SELECT date_sub(now(),interval 5 month) AS monthnear
		UNION SELECT date_sub(now(),interval 4 month)
		UNION SELECT date_sub(now(),interval 3 month)
		UNION SELECT date_sub(now(),interval 2 month)
		UNION SELECT date_sub(now(),interval 1 month)
		UNION SELECT now())
    SELECT t.monthnear, CASE
		WHEN COUNT(questionID) = 0 THEN 'không có câu hỏi nào trong tháng'
		ELSE COUNT(questionID) END AS SL_Ques_month
    FROM cte_6month t LEFT JOIN
    (SELECT * FROM question where CreateDate >= DATE_SUB(NOW(), 
INTERVAL 6 MONTH) AND CreateDate <= now()) AS Sub_Question
		ON month(CreateDate) = month(t.monthnear) GROUP BY t.monthnear;
END$$
DELIMITER ;
-- Run: 
CALL sp_6Month;
