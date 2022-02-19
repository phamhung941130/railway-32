-- Tạo database 
DROP DATABASE IF EXISTS ThucTap;
CREATE DATABASE ThucTap;
USE ThucTap;

DROP TABLE IF EXISTS Country;
CREATE TABLE Country (
	Country_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(30) UNIQUE KEY
);

DROP TABLE IF EXISTS Location;
CREATE TABLE Location (
	location_id      TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    street_address    VARCHAR(30) NOT NULL UNIQUE KEY,
    postal_code    		CHAR(10),
    country_id   		TINYINT UNSIGNED,
    CONSTRAINT fk_Country FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
	employee_id     	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name    		VARCHAR(30) NOT NULL,
    email    			VARCHAR(30),
    location_id   		TINYINT UNSIGNED,
    CONSTRAINT fk_Location FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

INSERT INTO Country(country_name) 
VALUES
						(N'VN'	),
						(N'Japan'),
						(N'China'),
						(N'Gabong'),
						(N'Korea'),
						(N'ThaiLan'),
						(N'INDO'),
						(N'Cambodia'),
						(N'Lao'),
						(N'Singgapo'),
						(N'Malaysia');
                        
 INSERT INTO Location	(  street_address		, postal_code	, country_id)
VALUES 				(N'street_address 01'	,   'Java1'			,	1		),
					(N'street_address 02'	,   'Java2'			,	1		),
                    (N'street_addressi 03'	,   'Java3'			,	1		),
                    (N'street_address 04'	,   'Java4'			,	3		),
                    (N'street_address 05'	,   'Java5'			,	4		),
                    (N'street_address 06'	,   'Java6'			,	5		),
                    (N'street_address 07'	,   'Java7'			,	6		),
                    (N'street_address 08'	,   'Java8'			,	7		),
                    (N'street_address 09'	,   'Java9'			,	8		),
                    (N'Tstreet_address 10'	,   'Java10'		,	9		);   
                    
INSERT INTO Employee  (full_name	,email						,location_id)
VALUES 				('Fullname1'	,'Email1@gmail.com'			,    1	),	
					('Fullname2'	,'Email2@gmail.com'			,    1	),	
                    ('Fullname3'	,'Email3@gmail.com'			,    1	),	
                    ('Fullname4'	,'Email4@gmail.com'			,    1	),	
                    ('Fullname5'	,'Email5@gmail.com'			,    4	),	
                    ('Fullname6'	,'Email6@gmail.com'			,    6	),	
                    ('Fullname7'	,'Email7@gmail.com'			,    2	),	
                    ('Fullname8'	,'Email8@gmail.com'			,    8	),	
                    ('Fullname9'	,'Email9@gmail.com'			,    2	),	
                    ('Fullname10'	,'nn03@gmail.com'			,  	 10);	 

-- 1. Tạo table với các ràng buộc và kiểu dữ liệu Thêm ít nhất 3 bản ghi vào table

-- 2,a Lấy tất cả các nhân viên thuộc Việt nam
		SELECT e.full_name,e.email,c.country_name FROM Employee e
			JOIN Location  l ON e.location_id = l.location_id
			JOIN Country c ON l.country_id = c.country_id
        WHERE country_name = 'VN';

-- 2,b Lấy ra tên quốc gia của employee có email là "nn03@gmail.com"
        SELECT e.full_name,e.email,c.country_name FROM Employee e
			JOIN Location  l ON e.location_id = l.location_id
			JOIN Country c ON l.country_id = c.country_id
        WHERE email = 'nn03@gmail.com';

-- 2,c   Thống kê mỗi country, mỗi location có bao nhiêu employee đang làm việc.
		SELECT c.country_name,COUNT(e.employee_id) FROM Employee e
			JOIN Location  l ON e.location_id = l.location_id
		    RIGHT JOIN Country c ON l.country_id = c.country_id
            GROUP BY c.Country_id;
		SELECT l.street_address,COUNT(e.employee_id) FROM Employee e
			RIGHT JOIN Location  l ON e.location_id = l.location_id
            GROUP BY l.location_id;

-- 3. Tạo trigger cho table Employee chỉ cho phép insert mỗi quốc gia có tối đa 10 employee

		DROP TRIGGER IF EXISTS Trg_INSERTcountry;
		DELIMITER $$
		CREATE TRIGGER Trg_INSERTcountry
		BEFORE INSERT ON Employee
		FOR EACH ROW
BEGIN
			DECLARE varname VARCHAR(30);
			DECLARE varcountry TINYINT;
	SELECT c.country_name INTO varname FROM Employee e
			JOIN Location  l ON e.location_id = l.location_id
		    RIGHT JOIN Country c ON l.country_id = c.country_id
            WHERE e.location_id = NEW.location_id LIMIT 1;
    
    WITH cte_bt AS(
	SELECT c.country_name n,COUNT(e.employee_id) sl FROM Employee e
			JOIN Location  l ON e.location_id = l.location_id
		    RIGHT JOIN Country c ON l.country_id = c.country_id
            GROUP BY c.Country_id)
	SELECT sl INTO varcountry FROM cte_bt WHERE n = varname;
    IF varcountry >= 5 THEN
			SIGNAL SQLSTATE '12345'
			SET MESSAGE_TEXT = 'cant INSERT this country';
	END IF;
END $$
DELIMITER ;

	INSERT INTO Employee  (full_name	,email						,location_id)
	VALUES 				('Fullname12'	,'Email12@gmail.com'			,    5	);

-- 4. Hãy cấu hình table sao cho khi xóa 1 location nào đó thì tất cả employee ở location đó sẽ có location_id = null

ALTER TABLE Employee DROP FOREIGN KEY fk_Location;
ALTER TABLE Employee ADD CONSTRAINT fk_Location FOREIGN KEY (location_id) REFERENCES Location(location_id) ON DELETE SET NULL; 
		DELETE FROM location WHERE location_id = 1;
        SELECT * FROM Employee;
        
        
        
        
        
        
        
        
        
        
        
        