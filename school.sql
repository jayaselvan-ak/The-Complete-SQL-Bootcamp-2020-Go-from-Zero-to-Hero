--select
--students
SELECT * FROM students LIMIT 10;
--teachers
SELECT * FROM teachers LIMIT 10;
--insert
INSERT INTO students (first_name, last_name, phone, graduation_year, homeroom_number)
	VALUES('Mark', 'Watney' , '777-555-1234', '2035', 5);
INSERT INTO teachers (first_name, last_name, phone, email, homeroom_number, department)
	VALUES('Jonas', 'Salk' , '777-555-4321', 'jsalk@school.org', 5, 'Biology');
--alter
--students
ALTER TABLE students
	ALTER COLUMN homeroom_number TYPE SMALLINT
	USING homeroom_number::INTEGER;
ALTER TABLE students
	ALTER COLUMN graduation_year TYPE VARCHAR(4);
ALTER TABLE students
	ALTER COLUMN email DROP NOT NULL;
--teachers
ALTER TABLE teachers
	ALTER COLUMN homeroom_number TYPE SMALLINT
	USING homeroom_number::INTEGER;
ALTER TABLE teachers
	ALTER COLUMN email DROP NOT NULL;
--create
CREATE TABLE students (
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	homeroom_number VARCHAR(15),
	phone VARCHAR(15) UNIQUE NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	graduation_year DATE
);
CREATE TABLE teachers (
	teacher_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	homeroom_number VARCHAR(15),
	department VARCHAR(50) NOT NULL,
	phone VARCHAR(15) UNIQUE NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL
);