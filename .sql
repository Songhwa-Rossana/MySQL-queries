-- CREATE TABLE tb_student(
-- 	stu_num char(10) PRIMARY KEY,
-- 	stu_name varchar(19) NOT NULL,
-- 	sex varchar(10)	DEFAULT 'male' CHECK (sex IN ('male', 'female')),
-- 	birthday datetime,
-- 	dorm int
-- );
-- 
-- 
-- 
-- ALTER TABLE tb_student
-- MODIFY dorm varchar(10);
-- desc tb_student;
-- 

RENAME TABLE tb_stu TO tb_student;

ALTER TABLE tb_student
DROP COLUMN contacts;

desc tb_student;
