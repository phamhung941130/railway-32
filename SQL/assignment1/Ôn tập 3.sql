DROP DATABASE IF EXISTS VTI;
CREATE DATABASE VTI;
USE VTI;

DROP TABLE IF EXISTS Trainee;
CREATE TABLE Trainee(
	Trainee_ID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(30) NOT NULl,
    Last_Name VARCHAR(30) NOT NULL,
    Age			TINYINT UNSIGNED,
    Gender		ENUM('Male','Female','Unknown')
);
DROP TABLE IF EXISTS `Subject`;
CREATE TABLE `Subject`(
	Subject_ID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Subject_Name VARCHAR(30) NOT NULl
);
DROP TABLE IF EXISTS Trainee_Subject;
CREATE TABLE Trainee_Subject(
	Trainee_ID TINYINT UNSIGNED NOT NULL,
    Subject_ID TINYINT UNSIGNED NOT NULl,
    Mark			TINYINT UNSIGNED,
    Exam_Day		DATETIME DEFAULT NOW(),
    PRIMARY KEY(Trainee_ID,Subject_ID),
    CONSTRAINT FK_Trainee FOREIGN KEY (Trainee_ID) REFERENCES Trainee(Trainee_ID),
    CONSTRAINT FK_Subject FOREIGN KEY (Subject_ID) REFERENCES `Subject`(Subject_ID)
);
INSERT INTO Trainee(  First_Name,		Last_Name,		Age,  		Gender)
VALUES				('Username1',	'Last_Name1',		20,   	'female'),
					('Username2',	'Last_Name2',		20,		'male'),
                    ('Username3',	'Last_Name3',		20,   'female'),
                    ('Username4',	'Last_Name4',		20,   'male'),
                    ('Username5',	'Last_Name5',		20,   'female'),
                    ('Username6',	'Last_Name6',		20,   'male'),
                    ('Username7',	'Last_Name7',		20,   'female'),
                    ('Username8',	'Last_Name8',		20,   'male'),
                    ('Username9',	'Last_Name9',		20,   'female'),
                    ('Username10',	'Last_Name10',		20,   'unknown');
INSERT INTO `Subject`				(Subject_Name	)
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
INSERT INTO Trainee_Subject(  Trainee_ID,		Subject_ID,		Mark,  	Exam_Day)
VALUES						(		1,				1,			5,   	'2022-01-09'),
							(		1,				2,			10,   	'2022-01-09'),
							(		1,				3,			15,   	'2022-01-09'),
							(		1,				4,			20,   	'2022-01-09'),
							(		2,				1,			20,   	'2022-01-09'),
							(		2,				2,			15,   	'2022-01-09'),
							(		2,				3,			15,   	'2022-01-09'),
							(		3,				5,			10,   	'2022-01-09'),
							(		3,				6,			10,   	'2022-01-09'),
							(		3,				7,			25,   	'2022-01-09');
-- 2,a
SELECT s.Subject_Name FROM `Subject` s LEFT JOIN Trainee_Subject ts
										ON  ts.Subject_ID = s.Subject_ID
										WHERE ts.Subject_ID IS NULL;
-- 2,b
SELECT s.Subject_Name,COUNT(*) FROM Trainee_Subject ts
JOIN `Subject` s ON ts.Subject_ID = s.Subject_ID
GROUP BY ts.Subject_ID
HAVING COUNT(*) >= 2;
-- 3.
DROP VIEW IF EXISTS TraineeInfo;
CREATE VIEW TraineeInfo AS(
SELECT * FROM Trainee t JOIN Trainee_Subject ts 
)
-- 4. Không sử dụng On Update Cascade & On Delete Cascade 
			-- a) Tạo trigger cho table Subject có tên là SubjectUpdateID:Khi thay đổi data của cột ID của table Subject, thì giá trị tương ứng với cột Subject_ID của table trainee_subject cũng thay đổi theo. 

DROP TRIGGER IF EXISTS Trg_checkdelexam;
DELIMITER $$
CREATE TRIGGER Trg_checkdelexam
	AFTER UPDATE ON `Subject`
	FOR EACH ROW
BEGIN
	UPDATE trainee_subject SET Subject_ID = NEW.Subject_ID
    WHERE Subject_ID = OLD.Subject_ID;
END $$
DELIMITER ;
UPDATE `Subject` SET Subject_ID = 12
WHERE Subject_ID =2;
SELECT * FROM `Subject`;
SELECT * FROM trainee_subject;
ALTER TABLE trainee_subject DROP FOREIGN KEY FK_Subject;
ALTER TABLE trainee_subject ADD CONSTRAINT FK_Subject FOREIGN KEY(Subject_ID) REFERENCES `Subject`(Subject_ID);

		-- b) Tạo trigger cho table trainee có tên là StudentDeleteID:
				-- Khi xóa data của cột ID của table trainee, thì giá trị tương ứng với cột SubjectID của table trainee_subject cũng bị xóa theo. 
DROP TRIGGER IF EXISTS Trg_checkdeltrainee;
DELIMITER $$
CREATE TRIGGER Trg_checkdeltrainee
	BEFORE DELETE ON Trainee
	FOR EACH ROW
BEGIN
	DELETE FROM trainee_subject ts WHERE ts.Trainee_ID = OLD.Trainee_ID;
END $$
DELIMITER ;
DELETE FROM Trainee t WHERE t.Trainee_ID = 1;

-- 5. Viết 1 Store Procedure có đầu vào parameter trainee_name sẽ xóa tất cả các
		-- thông tin liên quan tới học sinh có cùng tên như parameter
		-- Trong trường hợp nhập vào name = "*" thì procedure sẽ xóa tất cả các học sinh
DROP PROCEDURE IF EXISTS Trg_checkdelHS;
DELIMITER $$
CREATE PROCEDURE Trg_checkdelHS(IN intrainee_name VARCHAR(30))
BEGIN
	IF intrainee_name = '*' THEN
		DELETE FROM Trainee_Subject;
        DELETE FROM Trainee;
	ELSE
		DELETE FROM Trainee_Subject ts WHERE ts.Trainee_ID IN (SELECT t.Trainee_ID FROM Trainee t WHERE (concat(First_Name,' ',Last_Name) LIKE concat('%',intrainee_name,'%')));
	END IF;        
END $$
DELIMITER ;
CALL Trg_checkdelHS('*');
SELECT * FROM Trainee;
SELECT * FROM Trainee_Subject;










