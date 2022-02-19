-- tạo databse:

DROP DATABASE IF EXISTS Facebook_DB;
CREATE DATABASE Facebook_DB;
USE Facebook_DB;

-- tạo table:

DROP TABLE IF EXISTS `National`;
CREATE TABLE `National`(
	National_id 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    National_Name		VARCHAR(50) NOT NULL UNIQUE KEY,
    Language_Main		VARCHAR(50) NOT NULL		
);

DROP TABLE IF EXISTS Office;
CREATE TABLE Office(
	Office_id 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Street_Address		VARCHAR(50) NOT NULL UNIQUE KEY,
    National_id			TINYINT UNSIGNED,
    CONSTRAINT fk_Office FOREIGN KEY (National_id) REFERENCES `National`(National_id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS Staff;
CREATE TABLE Staff(
	Staff_id 		SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    First_Name		VARCHAR(50) NOT NULL,
    Last_Name		VARCHAR(50) NOT NULL,
    Email			VARCHAR(50) NOT NULL UNIQUE KEY,
    Office_id		TINYINT UNSIGNED,
    CONSTRAINT fk_Staff FOREIGN KEY (Office_id) REFERENCES Office(Office_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Insert dữ liệu:

INSERT INTO `National`(National_Name,	Language_Main)
VALUES				('Viet Nam'	,		'Vietnamese'),
					('Japan'	,		'japanese'	),
                    ('England'	,		'English'	),
                    ('Thailand'	,		'Thái' 		),
                    ('India'	,		'Hindi'		),
                    ('Singapore',		'English'	),
                    ('China'	,		'Chinaese'	),
                    ('Combodia'	,		'Khmer'		),
                    ('Cuba'		,		'Spainese'	),
                    ('France'	,		'Francese' 	),
                    ('America'	,		'English'	);
INSERT INTO Office	(Street_Address	  ,National_id	)
VALUES				('Street_Address1',		1		),
					('Street_Address2',		1		),
                    ('Street_Address3',		1		),
                    ('Street_Address4',		4		),
                    ('Street_Address5',		5		),
                    ('Street_Address6',		6		),
                    ('Street_Address7',		7		),
                    ('Street_Address8',		8		),
                    ('Street_Address9',		8		),
                    ('Street_Address10',	8		),
                    ('Street_Address11',	11		);
INSERT INTO Staff (First_Name,		Last_Name,			Email,			Office_id)
VALUES				('Dao'		,	'Nguyen Quang','daonq@vietel.com'	,	1	),
					('Trang'	,	'Nguyen Thi'  ,'trangnt@gmail.com'	,	2	),
					('Tho'		,	'Nguyen Van'  ,'thonv@gamil.com'	,	1	),
                    ('Lap'		,	'Pham Van'	  ,'lappv@gmail.com'	,	2	),
                    ('Tuan'		,	'Nguyen Anh'  ,'tuanna@gmail.com'	,	3	),
                    ('Hai'		,	'Tran Van'	  ,'haitv@gmail.com'	,	6	),
                    ('Hao'		,	'Nguyen Van'  ,'haotv@gmail.com'	,	8	),
                    ('Vinh'		,	'Nguyen Quang','vinhnq@gmail.com'	,	8	),
                    ('Lan'		,	'Tran Thi'	  ,'lantt@gmail.com'	,	9	),
                    ('Nga'		,	'Nguyen Thi'  ,'ngant@gmail.com'	,	10	),
                    ('Tu'		,	'Nguyen Thi'  ,'tunt@gmail.com'		,	Null);