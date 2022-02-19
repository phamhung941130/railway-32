DROP DATABASE IF EXISTS QL_DoAn;
CREATE DATABASE QL_DoAn;
USE QL_DoAn;

-- Tạo Table Deparment
DROP TABLE IF EXISTS GiangVien;
CREATE TABLE GiangVien (
	Id_GV TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Ten_GV VARCHAR(30) NOT NULL,
    Tuoi	TINYINT UNSIGNED,
    HocVi	CHAR(10) NOT NULL
);

DROP TABLE IF EXISTS SinhVien;
CREATE TABLE SinhVien (
	Id_SV SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Ten_SV VARCHAR(30) ,
    NamSinh	DATE,
    QueQuan	VARCHAR(30)
);

DROP TABLE IF EXISTS DeTai;
CREATE TABLE DeTai (
	Id_DeTai SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Ten_DeTai VARCHAR(50)
);

DROP TABLE IF EXISTS HuongDan;
CREATE TABLE HuongDan (
	Id 			SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Id_SV 		SMALLINT UNSIGNED,
    Id_DeTai	SMALLINT UNSIGNED,
    Id_GV		TINYINT UNSIGNED ,
    Diem 		TINYINT UNSIGNED,
	CONSTRAINT sv FOREIGN KEY(Id_SV) REFERENCES SinhVien(Id_SV) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT dt FOREIGN KEY(Id_DeTai) REFERENCES DeTai(Id_DeTai) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT gv FOREIGN KEY(Id_GV) REFERENCES GiangVien(Id_GV) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO GiangVien	(  Ten_GV	, Tuoi	, HocVi	 )
VALUES 					(	'GV1'	,    55	,'GS'),
						(	'GV1'	,    50	,'TS'),
						(	'GV1'	,    55	,'PSG'),
						(	'GV1'	,    35	,'THS'),
						(	'GV1'	,    37	,'THS'),
						(	'GV1'	,    50	,'GS'),
						(	'GV1'	,    49	,'GS'),
						(	'GV1'	,    52	,'GS'),
						(	'GV1'	,    45	,'TS'),
						(	'GV1'	,    43	,'TS');
                        
INSERT INTO SinhVien	(  Ten_SV	, 	NamSinh	, 		QueQuan	 )
VALUES 					(	'SV1'	, 	'1995-04-05'	,'Namdinh'),
						(	'SV2'	, 	'1996-06-05'	,'Namdinh'),
						(	'SV3'	,    '1995-07-05'	,'Namdinh'),
						(	'SV4'	,    '1995-08-05'	,'Namdinh'),
						(	'SV5'	,    '1996-09-05'	,'HN'),
						(	'SV6'	,    '1996-10-05'	,'HN'),
						(	'SV7'	,    '1996-11-05'	,'HN'),
						(	'SV8'	,    '1996-12-05'	,'HN'),
						(	'SV9'	,    '1995-01-05'	,'HN'),
						(	'SV10'	,    '1995-02-05'	,'HN');
                        
INSERT INTO DeTai(Ten_DeTai) 
VALUES
						(N'DeTai1'	),
						(N'DeTai2'	),
						(N'DeTai3'	),
						(N'DeTai4'	),
						(N'DeTai5'	),
						(N'DeTai6'	),
						(N'DeTai7'	),
						(N'DeTai8'	),
						(N'DeTai9'	),
						(N'DeTai10'	),
						(N'DeTai11'	),
                        (	NULL	);
                       
INSERT INTO HuongDan	(  ID_SV	, ID_DeTai	, ID_GV,	Diem)
VALUES 					(	1	,    1,				1,		10),
						(	2	,    1	,			1,		10),
						(	3	,    1	,			1,		10),
						(	10	,    2	,			1,		10),
						(	4	,    2	,			2,		9),
						(	6	,    2	,			2,		9),
						(	7	,    2	,			2,		9),
						(	6	,    3	,			3,		8),
						(	NULL,    4	,			3,		8),
						(	8	,    3	,			4,		10),
                        (	9	,    NULL	,		1,		10),
                        (	NULL,    5	,			1,		10);

-- Lấy ra tất cả sinh viên chưa có đề tài hướng dẫn:
				SELECT * FROM SinhVien s
				LEFT JOIN HuongDan h ON h.ID_SV = s.ID_SV
				WHERE h.ID_SV is null;
-- Lấy ra số sv làm 'detai6'
			SELECT COUNT(1) FROM HuongDan h
			JOIN SinhVien s ON h.ID_SV = s.ID_SV
			JOIN DeTai d	ON d.ID_DeTai = h.ID_DeTai
			WHERE Ten_DeTai = 'DeTai3';

-- 3. Tạo view có tên là "SinhVienInfo" lấy các thông tin về học sinh bao gồm:mã số, họ tên và tên đề tài
				-- (Nếu sinh viên chưa có đề tài thì column tên đề tài sẽ in ra "Chưa có")
DROP VIEW IF EXISTS SinhVienInfo;
CREATE OR REPLACE VIEW SinhVienInfo AS
SELECT sv.Id_SV,sv.Ten_SV,CASE
		WHEN hd.ID_DeTai IS NULL THEN 'Chưa có'
        ELSE Ten_DeTai END AS tendetai
		 FROM SinhVien sv
         LEFT JOIN HuongDan hd ON hd.Id_SV = sv.Id_SV
         LEFT JOIN DeTai d 	ON d.Id_DeTai = hd.Id_DeTai;
SELECT * FROM SinhVienInfo;
-- 4. Tạo trigger cho table SinhVien khi insert sinh viên có năm sinh <= 1950
	-- thì hiện ra thông báo "Moi ban kiem tra lai nam sinh"
DROP TRIGGER IF EXISTS Trg_CheckInsertSinhVien;
DELIMITER $$
CREATE TRIGGER Trg_CheckInsertSinhVien
	 BEFORE INSERT ON SinhVien
	 FOR EACH ROW
 BEGIN
	IF year(NEW.NamSinh) <= 1950 THEN
	SIGNAL SQLSTATE '12345'
	SET MESSAGE_TEXT = 'Cant create this SinhVien';
END IF;
 END$$
DELIMITER ;
INSERT INTO SinhVien	(  Ten_SV	, 	NamSinh	, 		QueQuan	 )
VALUES 					(	'SV12'	, 	'1951-04-05'	,'Namdinh');

-- 5. Hãy cấu hình table sao cho khi xóa 1 sinh viên nào đó thì sẽ tất cả thông
		-- tin trong table HuongDan liên quan tới sinh viên đó sẽ bị xóa đi
ALTER TABLE HuongDan DROP FOREIGN KEY sv;
ALTER TABLE HuongDan ADD CONSTRAINT sv FOREIGN KEY (Id_SV) REFERENCES SinhVien(Id_SV) ON DELETE SET NULL;
DELETE FROM SinhVien WHERE Ten_SV = 'SV3';
SELECT * FROM HuongDan;
SELECT * FROM SinhVien;

-- 6. Viết 1 Procedure để khi nhập vào tên của sinh viên thì sẽ thực hiện xóa toàn bộ thông tin liên quan của sinh viên trên hệ thống:
		DROP PROCEDURE IF EXISTS sp_Q6;
		DELIMITER $$
		CREATE PROCEDURE sp_Q6(IN inTen_SV VARCHAR(20))
BEGIN
		DECLARE var_id TINYINT;
		SELECT Id_SV INTO var_id FROM SinhVien WHERE Ten_SV = inTen_SV;
		DELETE FROM HuongDan WHERE Id_SV = var_id;
		DELETE FROM SinhVien WHERE Ten_SV = inTen_SV;
END $$
DELIMITER ;
CALL sp_Q6('SV7');





















