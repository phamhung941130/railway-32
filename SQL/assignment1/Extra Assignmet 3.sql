USE Assignment;
-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, nhóm chúng thành các tháng sinh khác nhau
SELECT * FROM Trainee;
SELECT * FROM Trainee t WHERE ET_IQ >=12 AND ET_Gmath>=12 AND ET_English>=20 ORDER BY Birth_Date DESC;
-- Question 5: Viết lệnh để lấy ra thông tin thực tập sinh có tên bắt đầu bằng chữ N và kết thúc bằng chữ C
SELECT * FROM Trainee WHERE FUll_Name LIKE 'U%0';
SELECT * FROM Trainee WHERE FUll_Name LIKE '%1_';
SELECT * FROM Trainee WHERE length(FUll_Name) = 10 AND FUll_Name LIKE '%0';
SELECT DISTINCT FUll_Name FROM Trainee;
SELECT FUll_Name FROM Trainee ORDER BY FUll_Name ASC;

-- Q10 
SELECT * FROM Trainee WHERE length(FUll_Name) = (SELECT MAX(length(FUll_Name)) FROM Trainee);

-- Q11:: Viết lệnh để lấy ra ID, Fullname và Ngày sinh thực tập sinh có tên dài nhất
SELECT T.TraineeID, T.FUll_Name,Birth_Date FROM Trainee T WHERE length(FUll_Name) = (SELECT MAX(length(FUll_Name)) FROM Trainee);

-- Question 12: Viết lệnh để lấy ra Tên, và điểm IQ, Gmath, English thực tập sinh có tên dài nhất
SELECT T.FUll_Name,ET_IQ,ET_Gmath,ET_English FROM Trainee T WHERE length(FUll_Name) = (SELECT MAX(length(FUll_Name)) FROM Trainee);

-- Question 13 Lấy ra 5 thực tập sinh có tuổi nhỏ nhất
SELECT * FROM Trainee ORDER BY Birth_Date ASC LIMIT 5;

-- Question 14: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là những người thỏa mãn số điểm như sau:
 -- ET_IQ + ET_Gmath>=20
 -- ET_IQ>=8
 -- ET_Gmath>=8
 -- ET_English>=18
 SELECT * FROM Trainee WHERE ET_IQ + ET_Gmath >=20 AND ET_IQ >=8 and ET_English >=18;
 SELECT * FROM Trainee;
 
 -- Question 15: Xóa thực tập sinh có TraineeID = 5
DELETE FROM Trainee WHERE TraineeID = 5;
-- Question 16: Xóa thực tập sinh có tổng điểm ET_IQ, ET_Gmath <=15
DELETE FROM Trainee WHERE ET_IQ + ET_Gmath <= 15;
-- Question 17: Xóa thực tập sinh quá 30 tuổi.
DELETE FROM trainee
WHERE Birth_Date < '1991-01-01';
-- Question 18: Thực tập sinh có TraineeID = 3 được chuyển sang lớp " VTI003". Hãy cập nhật thông tin vào database.
UPDATE trainee t SET Training_Class = 'VTI003' WHERE TraineeID =3;
SELECT * FROM Trainee;
-- Question 19: Do sự nhầm lẫn khi nhập liệu nên thông tin của học sinh số 10 đang bị sai, hãy cập nhật lại tên thành "LeVanA", điểm ET_IQ = 10, điểm ET_Gmath =15, điểm ET_English = 30.
UPDATE Trainee t SET FUll_Name = 'LeVanA',ET_IQ = 10,ET_Gmath = 15,ET_English = 30
WHERE TraineeID = 10;

-- Question 20 : Điểm xem trong lớp VTI001 có bao nhiêu thực tập sinh.
SELECT COUNT(*) FROM Trainee WHERE Training_Class = 'VTI001';

-- Question 22: Đếm tổng số thực tập sinh trong lớp VTI001 và VTI003 có bao nhiêu thực tập sinh.
SELECT Training_Class,COUNT(*) FROM Trainee GROUP BY Training_Class HAVING Training_Class ='VTI001' OR Training_Class ='VTI003';
-- Question 23: Lấy ra số lượng các thực tập sinh theo giới tính: Male, Female, Unknown.
SELECT Gender,COUNT(Gender) FROM Trainee GROUP BY Gender;
-- Question 24: Lấy ra lớp có lớn hơn 5 thực tập viên
SELECT Training_Class,COUNT(*) FROM Trainee GROUP BY Training_Class HAVING COUNT(*) >5;
-- Question 26: Lấy ra trường có ít hơn 4 thực tập viên tham gia khóa học
SELECT Training_Class,COUNT(*) FROM Trainee GROUP BY Training_Class HAVING COUNT(*) <4;
-- Question 27: Bước 1: Lấy ra danh sách thông tin ID, Fullname, lớp thực tập viên có lớp 'VTI001'
-- 				Bước 2: Lấy ra danh sách thông tin ID, Fullname, lớp thực tập viên có lớp 'VTI002'
-- 				Bước 3: Sử dụng UNION để nối 2 kết quả ở bước 1 và 2
SELECT TraineeID,FUll_Name,Training_Class FROM Trainee WHERE Training_Class ='VTI001'
UNION
SELECT TraineeID,FUll_Name,Training_Class FROM Trainee WHERE Training_Class ='VTI003';
