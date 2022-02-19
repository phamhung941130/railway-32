
DROP DATABASE IF EXISTS Testingsystem ;
CREATE DATABASE TestingSystem;
USE TestingSystem;

-- Tạo Table Deparment
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
	DepartmentID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(30) NOT NULL UNIQUE KEY
);
-- Tạo Table Position
DROP TABLE IF EXISTS Position;
CREATE TABLE Position (
	PositionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE KEY
);
-- Tạo Account
DROP TABLE IF EXISTS Account;
CREATE TABLE `Account`(
	AccountID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email     VARCHAR(50) NOT NULL UNIQUE KEY,
    Username  VARCHAR(50) NOT NULL UNIQUE KEY,
    FullName  VARCHAR(50) NOT NULL,
	gender	  CHAR(10) NOT NULL,
    DepartmentID TINYINT UNSIGNED,
    PositionID TINYINT UNSIGNED,
    CreateDate DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Tạo bảng Group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group` (
	GroupID      TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName    VARCHAR(50) NOT NULL UNIQUE KEY,
    CreatorID    SMALLINT UNSIGNED,
    CreateDate   DATETIME DEFAULT NOW(),
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Tạo bảng GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE `GroupAccount`(
	GroupID   TINYINT UNSIGNED NOT NULL,
    AccountID SMALLINT UNSIGNED NOT NULL, 
    JoinDate  DATETIME DEFAULT NOW(),
    PRIMARY KEY (GroupID, AccountID),
    FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(AccountID) REFERENCES `Account`(AccountID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tạo bảng TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE `TypeQuestion`(
	TypeID   TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
);

-- Tạo bảng CategoryQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE `CategoryQuestion`(
	CategoryID   TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE KEY
);

-- Tạo bảng Question
DROP TABLE IF EXISTS Question;
CREATE TABLE `Question`(
	QuestionID   SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content      VARCHAR(100) NOT NULL UNIQUE KEY,
    CategoryID   TINYINT UNSIGNED NOT NULL,
    TypeID       TINYINT UNSIGNED NOT NULL,
    CreatorID    SMALLINT UNSIGNED NOT NULL,
    CreateDate   DATE,
    FOREIGN KEY(CategoryID) REFERENCES `CategoryQuestion`(CategoryID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(TypeID) REFERENCES `TypeQuestion`(TypeID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Tạo bảng Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE `Answer`(
	AnswerID   MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content      VARCHAR(100) NOT NULL UNIQUE KEY,
    QuestionID   SMALLINT UNSIGNED NOT NULL,
    isCorrect    Bit DEFAULT 1,
    FOREIGN KEY(QuestionID) REFERENCES `Question`(QuestionID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tạo bảng Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE `Exam`(
	ExamID      TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Code      CHAR(10) NOT NULL UNIQUE KEY,
    Title       VARCHAR(50) NOT NULL,
    CategoryID  TINYINT UNSIGNED NOT NULL,
	Duration    CHAR(20) NOT NULL,
    CreatorID   SMALLINT UNSIGNED NOT NULL,
    CreateDate  DATETIME DEFAULT NOW(),
    FOREIGN KEY(CategoryID) REFERENCES `CategoryQuestion`(CategoryID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Tạo bảng ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE `ExamQuestion`(
	ExamID       TINYINT UNSIGNED NOT NULL,
	QuestionID   SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(ExamID, QuestionID),
    FOREIGN KEY(ExamID) REFERENCES `Exam`(ExamID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(QuestionID) REFERENCES `Question`(QuestionID) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Insert dữ liệu 
-- Add data Department
INSERT INTO Department(DepartmentName) 
VALUES
						(N'Marketing'	),
						(N'Sale'		),
						(N'Bảo vệ'		),
						(N'Nhân sự'		),
						(N'Kỹ thuật'	),
						(N'Tài chính'	),
						(N'Phó giám đốc'),
						(N'Giám đốc'	),
						(N'Thư kí'		),
						(N'Bán hàng'	),
						(N'Waitting Room');
-- Add data position
INSERT INTO Position	(PositionName	) 
VALUES 					('Dev'			),
						('Test'			),
						('Scrum Master'	),
						('PM'			); 


-- Add data Account
INSERT INTO `Account`(Email								, Username			, FullName,		gender,	  DepartmentID	, PositionID, CreateDate)
VALUES 				('Email1@gmail.com'				, 'Username1'		,'Fullname1'	,	'f'		,    1			,   '1'		,'2020-03-05'),
					('Email2@gmail.com'				, 'User1name2'		,'Fullname2'	,	'f'		,    1			,   '2'		,'2020-03-05'),
                    ('Email3@gmail.com'				, 'Username3'		,'Fullname3'	,	'f'		,    1			,   '2'		,'2020-03-07'),
                    ('Email4@gmail.com'				, 'Username4'		,'Fullname4'	,	'f'		,    1			,   '4'		,'2020-03-08'),
                    ('Email5@gmail.com'				, 'Username5'		,'Fullname5'	,	'm'		,   '4'			,   '4'		,'2020-03-10'),
                    ('Email6@gmail.com'				, 'Username6'		,'Fullname6'	,	'm'		,   '6'			,   '3'		,'2020-04-05'),
                    ('Email7@gmail.com'				, 'Username7'		,'Fullname7'	,	'm'		,   '2'			,   '2'		, '2020-04-05'),
                    ('Email8@gmail.com'				, 'Username8'		,'Fullname8'	,	'm'		,   '8'			,   '1'		,'2020-04-07'),
                    ('Email9@gmail.com'				, 'Username9'		,'Fullname9'	,	'u'		,   '2'			,   '2'		,'2020-04-07'),
                    ('Email10@gmail.com'			, 'Username10'		,'Fullname10'	,	'u'		,   '10'		,   '1'		,'2020-04-09');

-- Add data Group
INSERT INTO `Group`	(  GroupName			, CreatorID		, CreateDate)
VALUES 				(N'Testing System'		,   5			,'2019-03-05'),
					(N'Development'			,   1			,'2020-03-07'),
                    (N'VTI Sale 01'			,   2			,'2020-03-09'),
                    (N'VTI Sale 02'			,   3			,'2020-03-10'),
                    (N'VTI Sale 03'			,   4			,'2020-03-28'),
                    (N'VTI Creator'			,   6			,'2020-04-06'),
                    (N'VTI Marketing 01'	,   7			,'2020-04-07'),
                    (N'Management'			,   8			,'2020-04-08'),
                    (N'Chat with love'		,   9			,'2020-04-09'),
                    (N'Vi Ti Ai'			,   10			,'2020-04-10');

-- Add data GroupAccount
INSERT INTO GroupAccount	(  GroupID	, AccountID	, JoinDate	 )
VALUES 						(	1		,    3		,'2019-03-05'),
							(	2		,    3		,'2020-03-07'),
							(	3		,    3		,'2020-03-09'),
							(	3		,    4		,'2020-03-10'),
							(	5		,    5		,'2020-03-28'),
							(	6		,    3		,'2020-04-06'),
							(	1		,    7		,'2020-04-07'),
							(	8		,    3		,'2020-04-08'),
							(	1		,    9		,'2020-04-09'),
							(	10		,    3		,'2020-04-10');


-- Add data TypeQuestion
INSERT INTO TypeQuestion	(TypeName			) 
VALUES 						('Essay'			), 
							('Multiple-Choice'	); 


-- Add data CategoryQuestion
INSERT INTO CategoryQuestion		(CategoryName	)
VALUES 								('Java'			),
									('ASP.NET'		),
									('ADO.NET'		),
									('SQL'			),
									('Postman'		),
									('Ruby'			),
									('Python'		),
									('C++'			),
									('C Sharp'		),
									('PHP'			);
													
-- Add data Question
INSERT INTO Question	(Content			, CategoryID, TypeID		, CreatorID	, CreateDate )
VALUES 					(N'Câu hỏi về Java'	,	1		,   '1'			,   '2'		,'2021-12-05'),
						(N'Câu Hỏi về PHP'	,	10		,   '2'			,   '2'		,'2021-12-01'),
						(N'Hỏi về C#'		,	9		,   '2'			,   '3'		,'2021-11-06'),
						(N'Hỏi về Ruby'		,	6		,   '1'			,   '4'		,'2021-11-02'),
						(N'Hỏi về Postman'	,	5		,   '1'			,   '5'		,'2021-10-04'),
						(N'Hỏi về ADO.NET'	,	3		,   '2'			,   '6'		,'2021-09-06'),
						(N'Hỏi về ASP.NET'	,	2		,   '1'			,   '7'		,'2020-01-06'),
						(N'Hỏi về C++'		,	8		,   '1'			,   '8'		,'2022-01-05'),
						(N'Hỏi về SQL'		,	4		,   '2'			,   '9'		,'2022-01-06'),
						(N'Hỏi về Python'	,	7		,   '1'			,   '10'	,'2022-01-04');

-- Add data Answers
INSERT INTO Answer	(  Content		, QuestionID	, isCorrect	)
VALUES 				(N'Trả lời 01'	,   1			,	0		),
					(N'Trả lời 02'	,   1			,	1		),
                    (N'Trả lời 03'	,   1			,	0		),
                    (N'Trả lời 04'	,   1			,	1		),
                    (N'Trả lời 05'	,   2			,	1		),
                    (N'Trả lời 06'	,   2			,	0		),
                    (N'Trả lời 07'	,   2			,	0		),
                    (N'Trả lời 08'	,   8			,	0		),
                    (N'Trả lời 09'	,   9			,	1		),
                    (N'Trả lời 10'	,   10			,	1		);
	
-- Add data Exam
INSERT INTO Exam	(Code			, Title					, CategoryID	, Duration	, CreatorID		, CreateDate )
VALUES 				('VTIQ001'		, N'Đề thi C#'			,	1			,	60		,   '5'			,'2019-04-05'),
					('VTIQ002'		, N'Đề thi PHP'			,	10			,	60		,   '2'			,'2019-04-05'),
                    ('VTIQ003'		, N'Đề thi C++'			,	9			,	120		,   '2'			,'2019-04-07'),
                    ('VTIQ004'		, N'Đề thi Java'		,	6			,	60		,   '3'			,'2020-04-08'),
                    ('VTIQ005'		, N'Đề thi Ruby'		,	5			,	120		,   '4'			,'2020-04-10'),
                    ('VTIQ006'		, N'Đề thi Postman'		,	3			,	60		,   '6'			,'2020-04-05'),
                    ('VTIQ007'		, N'Đề thi SQL'			,	2			,	60		,   '7'			,'2020-04-05'),
                    ('VTIQ008'		, N'Đề thi Python'		,	8			,	60		,   '8'			,'2020-04-07'),
                    ('VTIQ009'		, N'Đề thi ADO.NET'		,	4			,	90		,   '9'			,'2020-04-07'),
                    ('VTIQ010'		, N'Đề thi ASP.NET'		,	7			,	90		,   '10'		,'2020-04-08');
                    
                    
-- Add data ExamQuestion
INSERT INTO ExamQuestion(ExamID	, QuestionID	) 
VALUES 					(	1	,		5		),
						(	1	,		10		), 
						(	1	,		4		), 
						(	1	,		3		), 
						(	5	,		7		), 
						(	6	,		10		), 
						(	7	,		2		), 
						(	8	,		10		), 
						(	9	,		9		), 
						(	10	,		8		); 
-- Kết thúc insert dữ liệu
