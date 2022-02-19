USE Facebook_DB;
-- Ques3: Bạn hãy lấy dữ liệu của tất cả nhân viên đang làm việc tại Vietnam.
			SELECT * FROM `National` n
			JOIN office o ON o.National_id = n.National_id
			JOIN Staff s ON s.Office_id = o.Office_id
			WHERE National_Name = 'Viet Nam';

-- Ques4: Lấy ra ID, FullName, Email, National của mỗi nhân viên.
			SELECT Staff_id,concat(Last_Name,' ',First_Name) FullName,Email,National_Name FROM `National` n
			JOIN office o ON o.National_id = n.National_id
			JOIN Staff s ON s.Office_id = o.Office_id;

-- Ques5: Lấy ra tên nước mà nhân viên có Email: "daonq@vietel.com.vn" đang làm việc.
			SELECT National_Name FROM `National` n
			JOIN office o ON o.National_id = n.National_id
			JOIN Staff s ON s.Office_id = o.Office_id
			WHERE Email = 'daonq@vietel.com';

-- Ques6: Bạn hãy tìm xem trên hệ thống có quốc gia nào có thông tin trên hệ thống nhưng không có nhân viên nào đang làm việc.
			SELECT National_Name FROM `National` n
			JOIN office o ON o.National_id = n.National_id
			LEFT JOIN Staff s ON s.Office_id = o.Office_id
			WHERE s.Office_id is NULL;

-- Ques7: Thống kê xem trên thế giới có bao nhiêu quốc gia mà FB đang hoạt động sử dụng tiếng Anh làm ngôn ngữ chính.
			SELECT Language_Main,COUNT(Language_Main) FROM `National` n
			GROUP BY Language_Main HAVING Language_Main = 'English';
-- Ques8: Viết lệnh để lấy ra thông tin nhân viên có tên (First_Name) có 5 ký tự, bắt đầu bằng chữ T và kết thúc bằng chữ g.
			SELECT * FROM Staff
			WHERE length(First_Name) =5 AND First_Name LIKE 't%g';
-- Ques9: Bạn hãy tìm trên hệ thống xem có nhân viên nào đang làm việc nhưng do nhập khi 
-- nhập liệu bị lỗi mà nhân viên đó vẫn chưa cho thông tin về trụ sở làm việc(Office).
			SELECT * FROM Staff s
			LEFT JOIN Office o ON o.Office_ID = s.Office_ID
			WHERE o.Office_ID is NUll;
-- Ques10: Nhân viên có mã ID =9 hiện tại đã nghỉ việc, bạn hãy xóa thông tin của nhân viên này trên hệ thống.
			DELETE FROM Staff WHERE Staff_ID = 9;
-- Ques11: FB vì 1 lý do nào đó không còn muốn hoạt động tại Australia nữa, và Mark 
			-- Zuckerberg muốn bạn xóa tất cả các thông tin trên hệ thống liên quan đến quốc gia này. Hãy 
			-- tạo 1 Procedure có đầu vào là tên quốc gia cần xóa thông tin để làm việc này và gửi lại cho anh ấy
DELETE FROM `National` WHERE National_Name = 'China';
DROP PROCEDURE IF EXISTS sp_Q11;
DELIMITER $$
CREATE PROCEDURE sp_Q11(IN inNational_Name VARCHAR(30))
BEGIN
		DELETE FROM `National` WHERE National_Name = inNational_Name;
END$$
DELIMITER ;
CALL sp_Q11('China');
SELECT * FROM `National`;

-- Ques12: Mark muốn biết xem hiện tại đang có bao nhiêu nhân viên trên toàn thế giới đang
			-- làm việc cho anh ấy, hãy viết cho anh ấy 1 Function để a ấy có thể lấy dữ liệu này 1 cách nhanh chóng.
CREATE VIEW TongNV AS SELECT COUNT(Staff_id) FROM Staff;
SELECT * FROM TongNV;
-- Ques13
			DROP TRIGGER IF EXISTS Trg_CheckInsertStaff;
			DELIMITER $$
			CREATE TRIGGER Trg_CheckInsertStaff
	 BEFORE INSERT ON Staff
	 FOR EACH ROW
 BEGIN
		DECLARE var_National_id TINYINT;
        DECLARE var_count TINYINT;
        SELECT o.National_id INTO var_National_id FROM Office o WHERE o.Office_id = NEW.Office_id;
        
        SELECT COUNT(s.Office_id) INTO var_count FROM Staff s RIGHT JOIN Office o
	ON o.Office_id = s.Office_id GROUP BY o.National_id HAVING o.National_id = var_National_id;
		
		IF var_count >= 3 THEN
        SIGNAL SQLSTATE '12345'
			SET MESSAGE_TEXT = 'cant INSERT this staff';
	END IF;
 END$$
DELIMITER ;
INSERT INTO Staff (First_Name,		Last_Name,			Email,			Office_id)
VALUES				('Dao7'		,	'Nguyen Quang1','daonq13@vietel.com'	,	1	);
-- Ques 14:
DROP PROCEDURE IF EXISTS sp_Q11;
DELIMITER $$
CREATE PROCEDURE sp_Q11()
BEGIN
		WITH cte_maxoff AS (SELECT o.National_id,COUNT(s.Office_id) sl FROM Staff s RIGHT JOIN Office o
								ON o.Office_id = s.Office_id GROUP BY o.National_id)
		SELECT n.National_Name ,max(sl) FROM cte_maxoff m JOIN `National` n
        ON n.National_id = m.National_id;
END$$
DELIMITER ;
CAll sp_Q11();

-- Ques15: Bạn hãy viết 1 Function để khi nhập vào thông tin Email của nhân viên thì sẽ trả ra thông tin đầy đủ của nhân viên đó.
			SET GLOBAL log_bin_trust_function_creators = 1;
			DROP FUNCTION IF EXISTS emailinfor;
			DELIMITER $$ 
CREATE FUNCTION emailinfor (input_emal VARCHAR(30)) RETURNS VARCHAR(20)
            BEGIN
            DECLARE var_fullname VARCHAR(20);
            SELECT concat(First_Name,' ',Last_Name) INTO var_fullname FROM staff WHERE Email = input_emal;
            RETURN var_fullname;
            END$$;
DELIMITER ;
SELECT emailinfor('daonq@vietel.com');

-- Ques16: Bạn hãy viết 1 Trigger để khi thực hiện cập nhật thông tin về trụ sở làm việc của 
			-- nhân viên đó thì hệ thống sẽ tự động lưu lại trụ sở cũ của nhân viên vào 1 bảng khác có tên 
			-- Log_Office để Mark có thể xem lại khi cần thiết.
DROP TABLE IF EXISTS Log_Office;
CREATE TABLE Log_Office(
	id 		SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    First_Name		VARCHAR(50) NOT NULL,
    Last_Name		VARCHAR(50) NOT NULL,
    Email			VARCHAR(50) NOT NULL UNIQUE KEY,
    Office_id		TINYINT UNSIGNED
);
DROP TRIGGER IF EXISTS Trg_CheckUPDATEOffice;
DELIMITER $$
CREATE TRIGGER Trg_CheckUPDATEOffice
	 BEFORE DELETE ON Staff
	 FOR EACH ROW
 BEGIN
	INSERT INTO Log_Office (First_Name,		Last_Name,			Email,			Office_id)
VALUES						(OLD.First_Name	,OLD.Last_Name,OLD.Email	,	OLD.Office_id);
 END$$
DELIMITER ;
DELETE FROM Staff WHERE First_Name = 'Tu';
SELECT * FROM Log_Office;
-- Ques17: FB đang vướng vào 1 đạo luật hạn chế hoạt động, FB chỉ có thể hoạt động tối đa
			-- trên 100 quốc gia trên thế giới, hãy tạo Trigger để ngăn người nhập liệu nhập vào quốc gia
			-- thứ 101 (bạn có thể sử dụng số nước nhỏ hơn để Test VD 11 nước).
DROP TRIGGER IF EXISTS Trg_CheckINSERTNational;
DELIMITER $$
CREATE TRIGGER Trg_CheckINSERTNational
	 BEFORE INSERT ON `National`
	 FOR EACH ROW
 BEGIN
	DECLARE var_countnation TINYINT;
	SELECT COUNT(National_id) INTO var_countnation FROM `National`;
	IF var_countnation >= 12 THEN
			SIGNAL SQLSTATE '12345'
			SET MESSAGE_TEXT = 'cant INSERT this National';
	END IF;
 END$$
DELIMITER ;
INSERT INTO `National`(National_Name,	Language_Main)
VALUES				('hn'	,		'hnesse');
SELECT * FROM `National`;

-- Ques18: Thống kê mỗi xem mỗi nước(National) đang có bao nhiêu nhân viên đang làm việc.
        SELECT n.National_Name,COUNT(s.Office_id) FROM Staff s JOIN Office o
	ON o.Office_id = s.Office_id JOIN `National` n
    ON o.National_id = n.National_id
		GROUP BY o.National_id;

-- Ques24: Bạn hãy cấu hình lại các bảng và ràng buộc giữ liệu sao cho khi xóa 1 trụ sở làm
			-- việc (Office) thì tất cả dữ liệu liên quan đến trụ sở này sẽ chuyển về Null
ALTER TABLE Office DROP FOREIGN KEY fk_Office;
ALTER TABLE Office ADD CONSTRAINT fk_Office FOREIGN KEY (National_id) REFERENCES `National`(National_id) ON DELETE SET NULL;




