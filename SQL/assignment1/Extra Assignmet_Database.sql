-- Tạo DATABASE Assignment:
DROP DATABASE IF EXISTS Assignment;
CREATE DATABASE Assignment;
USE Assignment;

-- Tạo TABLE Trainee:
DROP DATABASE IF EXISTS Trainee;
CREATE TABLE Trainee(
	TraineeID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    FUll_Name			VARCHAR(30) NOT NULL,
    Birth_Date			DATE NOT NULL,
    Gender				ENUM('male','female','unknown') NOT NULL,
    ET_IQ				TINYINT UNSIGNED NOT NULL,
    ET_Gmath			TINYINT UNSIGNED NOT NULL,
    ET_English			TINYINT UNSIGNED NOT NULL,
    Training_Class		CHAR(10),
    Evaluation_Note		VARCHAR(100),
    VTI_Account			VARCHAR(30) NOT NULL UNIQUE KEY
);
-- Tạo TABLE Description:
DROP DATABASE IF EXISTS Exercise2;
CREATE TABLE Exercise2(
	Exercise2ID			MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Name`				VARCHAR(30) NOT NULL,
    `Code`				CHAR(5) NOT NULL UNIQUE, 
    ModifiedDate		DATETIME DEFAULT NOW()
);

-- Tạo TABLE Description:
DROP DATABASE IF EXISTS Exercise3;
CREATE TABLE Exercise3(
	Exercise3ID			MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Name`				VARCHAR(30) NOT NULL,
   BirthDate			DATE NOT NULL,
    Gender				BIT,
    IsDeletedFlag		BIT DEFAULT 0
);

-- INSERT dữ liệu bảng Trainee
INSERT INTO Trainee(  FUll_Name,	Birth_Date,    Gender,	  ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Note, VTI_Account)
VALUES				('Username1',	'2001-01-01',   'female',  '5',		'20',	'20',		'VTI001',		'1',		'1@Gmail.com'	),
					('Username2',	'2001-02-02',   'male',		'1',	'2'	,	'30',		'VTI001',		'2',		'2@Gmail.com'	),
                    ('Username3',	'2001-03-03',   'female',  '10',	'7'	,	'40',		'VTI001',		'3',		'3@Gmail.com'	),
                    ('Username4',	'2001-04-04',   'male',    '15',	'8'	,	'50',		'Class2',		'4',		'4@Gmail.com'	),
                    ('Username5',	'2001-05-05',   'female',  '20',	'10',	'45',		'VTI003',		'5',		'5@Gmail.com'	),
                    ('Username6',	'2001-06-06',   'male',    '0',		'05',	'35',		'Class3',		'6',		'6@Gmail.com'	),
                    ('Username7',	'2001-07-07',   'female',  '16',	'10',	'25',		'Class4',		'7',		'7@Gmail.com'	),
                    ('Username8',	'2001-08-08',   'male',    '17',	'07',	'15',		'VTI003',		'8',		'8@Gmail.com'	),
                    ('Username9',	'2001-09-09',   'female',  '11',	'07',	'5'	,		'Class2',		'9',		'9@Gmail.com'	),
                    ('Username10',	'2001-01-01',   'unknown', '7',		'09',	'1'	,		'VTI003',		'10',		'10@Gmail.com'	);
 -- SELECT * FROM Trainee;

-- INSERT dữ liệu bảng Exercise2 
INSERT INTO Exercise2(  	`Name`	,   `Code`	)
VALUES				 (	'Username1',   12345	),
					 (	'Username2',	12346	),
                     (	'Username3',	12347	),
                     (	'Username4',	12348	),
                     (	'Username5',	12349	),
                     (	'Username6',	12354	),
                     (	'Username7',	12332	),
                     (	'Username8',	12341	),
                     (	'Username9',	12351	),
                     (	'Username10',	12361	);
-- SELECT * FROM Exercise2;

-- INSERT dữ liệu bảng Exercise3
INSERT INTO Exercise3(  `Name`	,  BirthDate	,	Gender,	IsDeletedFlag	)
VALUES				 ('Username1',	'2001-01-01',   	1,  	0			),
					 ('Username2',	'2001-02-02',   	NULL,		0			),
                     ('Username3',	'2001-03-03',  		1,  	0			),
                     ('Username4',	'2001-04-04',  		0,   	NULL		),
                     ('Username5',	'2001-05-05',  	 	1,  	0			),
                     ('Username6',	'2001-06-06',   	NULL,  	NULL		),
                     ('Username7',	'2001-07-07',   	1,  	0			),
                     ('Username8',	'2001-08-08',   	0,  	0			),
                     ('Username9',	'2001-09-09',   	1,		0			),
                     ('Username10',	'2001-01-01',  		NULL,	NULL		);
-- ea4
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	Department_Number 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Department_Name		VARCHAR(50) NOT NULL UNIQUE KEY
);
DROP TABLE IF EXISTS Employee_Table;
CREATE TABLE Employee_Table(
Employee_Number	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Employee_Name	VARCHAR(50) NOT NULL UNIQUE KEY,
Department_Number	TINYINT UNSIGNED NOT NULL,
FOREIGN KEY(Department_Number)REFERENCES Department(Department_Number)
);
DROP TABLE IF EXISTS Employee_Skill_Table;
CREATE TABLE Employee_Skill_Table(
Skill_Code	CHAR(10) NOT NULL,
Employee_Number	TINYINT UNSIGNED NOT NULL,
DateRegistered	DATETIME DEFAULT NOW(),
PRIMARY KEY(Employee_Number,Skill_Code),
FOREIGN KEY(Employee_Number) REFERENCES Employee_Table(Employee_Number)
);
INSERT INTO Department	(Department_Name) 
VALUES					(N'Marketing'	),
						(N'Sale'		),
						(N'Bảo vệ'		),
						(N'Nhân sự'		),
						(N'Kỹ thuật'	),
						(N'Tài chính'	),
						(N'Phó giám đốc'),
						(N'Giám đốc'	),
						(N'Thư kí'		),
						(N'Bán hàng'	);
INSERT INTO Employee_Table(Employee_Name,Department_Number)   
VALUES				(N'Testing System'		,   5	),
					(N'Development'			,   1	),
                    (N'VTI Sale 01'			,   2	),
                    (N'VTI Sale 02'			,   3	),
                    (N'VTI Sale 03'			,   4	),
                    (N'VTI Creator'			,   6	),
                    (N'VTI Marketing 01'	,   7	),
                    (N'Management'			,   8	),
                    (N'Chat with love'		,   9	),
                    (N'Vi Ti Ai'			,   10	);
INSERT INTO Employee_Skill_Table(Skill_Code,Employee_Number,DateRegistered)
VALUES				('Java'			,	1			,	'2019-04-05'),
					('Java'			, 	10			,   '2019-04-05'),
                    ('Sql'			, 	9			,	'2019-04-07'),
                    ('Sql'			, 	6			,	'2020-04-08'),
                    ('Sql'			, 	5			,	'2020-04-10'),
                    ('react'		, 	3			,	'2020-04-05'),
                    ('react'		, 	2			,	'2020-04-05'),
                    ('react'		, 	8			,	'2020-04-07'),
                    ('react'		, 	4			,	'2020-04-07'),
                    ('react'		, 	7			,	'2020-04-08');

