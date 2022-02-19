-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước

DROP TRIGGER IF EXISTS Trg_CheckInsertGroup;
DELIMITER $$
CREATE TRIGGER Trg_CheckInsertGroup
	 BEFORE INSERT ON `Group`
	 FOR EACH ROW
 BEGIN
	DECLARE v_CreateDate DATETIME;
	SET v_CreateDate = DATE_SUB(NOW(), interval 1 year);
	IF (NEW.CreateDate < v_CreateDate) THEN
	SIGNAL SQLSTATE '12345'
	SET MESSAGE_TEXT = 'Cant create this group';
END IF;
 END$$
DELIMITER ;
INSERT INTO `testingsystem`.`group` (`GroupName`, `CreatorID`, `CreateDate`) 
VALUES ('2', '1', '2018-04-
10 00:00:00');

-- Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào
			-- department "Sale" nữa, khi thêm thì hiện ra thông báo "Department "Sale" cannot add more user"
			-- Bước 1: Viết Trigger khi Insert dữ liệu vào bảng 
			-- Bước 2: Viết câu lênh Insert để Test dữ liệu
DROP TRIGGER IF EXISTS Trg_CheckInsertDep;
DELIMITER $$
CREATE TRIGGER Trg_CheckInsertDep
	 BEFORE INSERT ON `account`
	 FOR EACH ROW
 BEGIN
	DECLARE var_DepID TINYINT;
    SELECT DepartmentID INTO var_DepID FROM Department WHERE DepartmentName = 'sale';
    IF NEW.DepartmentID = var_DepID THEN
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'Department "Sale" cannot add more user';
END IF;
 END$$
DELIMITER ;
INSERT INTO `account`(Email,				Username,			FullName,			DepartmentID, 		PositionID, 		CreateDate) 
VALUES				  ('daonq_abc@gmail.com',		'daonq_abc',		'NguyenDao',		2,					1,				'2020-03-05 00:00:00');	

-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user
			-- Khai báo biến var_CountGroupID để lấy số lượng account trong group cần Insert
			-- Sử dụng NEW.GroupID để lấy giá trị GroupID cần Insert
DROP TRIGGER IF EXISTS Trg_CheckInsertGRP;
DELIMITER $$
CREATE TRIGGER Trg_CheckInsertGRP
	 BEFORE INSERT ON `Groupaccount`
	 FOR EACH ROW
 BEGIN
	DECLARE var_CountGroupID TINYINT;
	SELECT COUNT(*) INTO var_CountGroupID FROM `Groupaccount` WHERE GroupID = NEW.GroupID;
    IF var_CountGroupID >= 6 THEN
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'Group cannot add more user';
END IF;
 END$$
DELIMITER ;
INSERT INTO GroupAccount	(  GroupID	, AccountID	, JoinDate	 )
VALUES 						(	1		,    6		,'2019-03-05');
SELECT * FROM `Groupaccount`;

-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question

DROP TRIGGER IF EXISTS Trg_CheckInsertEQ;
DELIMITER $$
CREATE TRIGGER Trg_CheckInsertEQ
	 BEFORE INSERT ON examquestion
	 FOR EACH ROW
 BEGIN
	DECLARE var_CountQuestionID TINYINT;
	SELECT COUNT(*) INTO var_CountQuestionID FROM examquestion WHERE examID = NEW.examID;
    IF var_CountQuestionID > 5 THEN
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'exam cannot add more question';
END IF;
 END$$
DELIMITER ;
SELECT * FROM examquestion;
SELECT * FROM Question;
INSERT INTO ExamQuestion(ExamID	, QuestionID	) 
VALUES 					(	1	,		1		);
-- Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là
			-- admin@gmail.com (đây là tài khoản admin, không cho phép user xóa),
			-- còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông tin liên quan tới user đó
DROP TRIGGER IF EXISTS Trg_CheckDeLadmin;
DELIMITER $$
CREATE TRIGGER Trg_CheckDeLadmin
 BEFORE DELETE ON `account`
 FOR EACH ROW
 BEGIN
	DECLARE var_email VARCHAR(30);
    SET var_email = 'Email1@gmail.com';
    IF OLD.Email = var_email THEN
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'cannot DELETE admin';
END IF;
 END$$
DELIMITER ;
DELETE FROM `account` WHERE accountID = 1;

-- Question 6: Không sử dụng cấu hình default cho field DepartmentID của table
			-- Account, hãy tạo trigger cho phép người dùng khi tạo account không điền
			-- vào departmentID thì sẽ được phân vào phòng ban "waiting Department"
DROP TRIGGER IF EXISTS Trg_CheckInsertACC;
DELIMITER $$
CREATE TRIGGER Trg_CheckInsertACC
	 BEFORE INSERT ON `account`
	 FOR EACH ROW
 BEGIN
	DECLARE var_waittingroom TINYINT;
	SELECT DepartmentID INTO var_waittingroom FROM Department WHERE DepartmentName = 'Waitting Room';
		IF (NEW.DepartmentID IS NULL) THEN
			SET NEW.DepartmentID = var_waittingroom;
END IF;
 END$$
DELIMITER ;
INSERT INTO `Account`(Email								, Username			, FullName				, DepartmentID	, PositionID, CreateDate)
VALUES 				('daonq1@gmail.com'				, 		'dao1'	,			'daonq1'			,   NULL 		,   '1'		,'2020-03-05');
SELECT * FROM `account`;

-- Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi question, trong đó có tối đa 2 đáp án đúng.

DROP TRIGGER IF EXISTS Trg_CheckInsertACC;
DELIMITER $$
CREATE TRIGGER Trg_CheckInsertACC
 BEFORE INSERT ON Answer
 FOR EACH ROW
 BEGIN
	DECLARE var_slanswers TINYINT;
    DECLARE var_true TINYINT;
    SELECT COUNT(1) INTO var_slanswers FROM Answer WHERE QuestionID = NEW.QuestionID;
    
    SELECT COUNT(1) INTO var_true FROM Answer WHERE QuestionID = NEW.QuestionID AND isCorrect = 1;  
		IF (var_slanswers >= 4) OR (var_true >= 2) THEN
			SIGNAL SQLSTATE '12345'
			SET MESSAGE_TEXT = 'cannot DELETE admin';
END IF;
 END$$
DELIMITER ;
INSERT INTO Answer	(  Content		, QuestionID	, isCorrect	)
VALUES 				(N'Trả lời 12'	,   2			,	1		);
SELECT * FROM answer;

-- Question 8: Viết trigger sửa lại dữ liệu cho đúng:
				-- Nếu người dùng nhập vào gender của account là nam, nữ, chưa xác định
				-- Thì sẽ đổi lại thành M, F, U cho giống với cấu hình ở database
DROP TRIGGER IF EXISTS Trg_GenderFromInput;
DELIMITER $$
CREATE TRIGGER Trg_GenderFromInput
	BEFORE INSERT ON `Account`
	FOR EACH ROW
BEGIN
		 IF NEW.Gender = 'Nam' THEN
			SET NEW.Gender = 'M';
		ELSEIF NEW.Gender = 'Nu' THEN
			SET NEW.Gender = 'F';
		ELSEIF NEW.Gender = 'Chưa xác định' THEN
			SET NEW.Gender = 'U';
		END IF ;
END $$
DELIMITER ;
INSERT INTO `Account`(Email								, Username			, FullName,		gender,	  DepartmentID	, PositionID, CreateDate)
VALUES 				('Hung@gmail.com'				, 'hung'		,'hung1'	,	'nam'		,    1			,   '1'		,'2020-03-05');

-- Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày
				-- Sử dụng hàm DATE_SUB để lấy thời gian trước đó N ngày, sau đó so sánh 2 mốc thời gian
				-- Trong quá trình Demo, nếu báo 'Cant Delete This Exam!! Là đã thành công, còn trong TH 
				-- báo k thể xóa do liên quan đến khóa ngoại thì là đã Pass qua điều kiện.
DROP TRIGGER IF EXISTS Trg_checkdelexam;
DELIMITER $$
CREATE TRIGGER Trg_checkdelexam
	BEFORE DELETE ON exam
	FOR EACH ROW
BEGIN
	DECLARE var_2day DATETIME;
	SELECT CreateDate INTO var_2day FROM exam WHERE CreateDate >= date_sub(now(),interval 2 day);
		IF OLD.CreateDate >= var_2day THEN 
					SIGNAL SQLSTATE '12345'
				SET MESSAGE_TEXT = 'cant DELETE this exam';
		END IF ;
END $$
DELIMITER ;
SELECT * FROM Exam;
DELETE FROM exam WHERE examID = 10;

-- Question 10: Viết trigger chỉ cho phép người dùng chỉ được update, delete các
				-- question khi question đó chưa nằm trong exam nào
				-- Trong bài này sẽ sử dụng 1 biến v_CountQuesByID FROM để đếm số lượng của Ques này
				-- đã sử dụng trong 1 bài thi, mặc định SET v_CountQuesByID = -1;
DROP TRIGGER IF EXISTS Trg_checkdelexam;
DELIMITER $$
CREATE TRIGGER Trg_checkdelexam
	BEFORE UPDATE ON Question
	FOR EACH ROW
BEGIN
	DECLARE var_sl TINYINT;
	SELECT COUNT(eq.QuestionID) INTO var_sl FROM examquestion eq WHERE eq.QuestionID = New.QuestionID;
	IF var_sl >0 THEN 
				SIGNAL SQLSTATE '12345'
			SET MESSAGE_TEXT = 'cant DELETE this exam';
	END IF ;
END $$
DELIMITER ;
UPDATE Question SET CategoryID = 6 WHERE QuestionID = 10;
SELECT * FROM examquestion;

-- Question 12: Lấy ra thông tin exam trong đó: Duration <= 30 thì sẽ đổi thành giá trị "Short time"
				-- 30 < Duration <= 60 thì sẽ đổi thành giá trị "Medium time" Duration > 60 thì sẽ đổi thành giá trị "Long time"
DROP TRIGGER IF EXISTS Trg_checkdelexam;
DELIMITER $$
CREATE TRIGGER Trg_checkdelexam
	BEFORE INSERT ON Exam
	FOR EACH ROW
BEGIN
	IF 30 < NEW.Duration <60 THEN SET NEW.Duration = 'Mediumtime';
	ELSEIF NEW.Duration <= 30 THEN SET NEW.Duration = 'Shorttime';
	ELSEIF NEW.Duration > 60 THEN SET NEW.Duration = 'Longtime';
	 END IF ;
END $$
DELIMITER ;
SELECT * FROM exam;
SELECT e.ExamID, e.Code, e.Title , CASE 
	WHEN Duration <= 30 THEN 'Short time'
	WHEN Duration <= 60 THEN 'Medium time'
	ELSE 'Longtime'
	END AS Duration, e.CreateDate, e.Duration
FROM exam e;
INSERT INTO Exam	(Code			, Title					, CategoryID	, Duration	, CreatorID		, CreateDate )
VALUES 				('VTIQ012'		, N'Đề thi C#'			,	2			,	70		,   '5'			,'2019-04-05');
SELECT * FROM Exam;

-- Question 13: Thống kê số account trong mỗi group và in ra thêm 1 column nữa có tên
				-- là the_number_user_amount và mang giá trị được quy định như sau:
				-- Nếu số lượng user trong group =< 5 thì sẽ có giá trị là few
				-- Nếu số lượng user trong group <= 20 và > 5 thì sẽ có giá trị là normal
				-- Nếu số lượng user trong group > 20 thì sẽ có giá trị là higher
SELECT g.GroupName,ga.GroupID,CASE 
				WHEN COUNT(ga.GroupID)  <= 1 THEN 'few'
                WHEN COUNT(ga.GroupID) <= 20 THEN 'normal'
                ELSE 'higher' END AS SL_user
FROM GroupAccount ga JOIN `Group` g ON g.GroupID = ga.GroupID
GROUP BY ga.GroupID;

-- Question 14: Thống kê số mỗi phòng ban có bao nhiêu user, nếu phòng ban nào không có user thì sẽ thay đổi giá trị 0 thành "Không có User"
				SELECT d.DepartmentName,CASE
			When	COUNT(a.DepartmentID)	= 0 THEN 'Không có User' 
			ELSE	COUNT(a.DepartmentID)
			END AS SL_user
		 FROM `Account` a RIGHT JOIN Department d ON d.DepartmentID = a.DepartmentID
		 GROUP BY a.DepartmentID;
         
-- Function
			-- Y.C: daonq@viettel.com.vn  ==> user: daonq
					-- tuannt@gmail.com  ==> user: tuannt
					--  Viết ra function để trả về User cho Email trên      
SET GLOBAL log_bin_trust_function_creators = 1;
DROP FUNCTION IF EXISTS emaltousername
DELIMITER $$ 
CREATE FUNCTION emaltousername (input_emal VARCHAR(50)) RETURNS VARCHAR(50)
            BEGIN
                DECLARE output_username VARCHAR(50);
                SELECT substring_index(input_emal, '@', 1) INTO output_username;
                RETURN output_username;
            END$$
DELIMITER ;
SELECT emaltousername('tuannt@gmail.com');
























