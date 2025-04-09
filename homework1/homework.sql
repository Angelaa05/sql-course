-- Student Table
DROP TABLE IF EXISTS student;
CREATE TABLE student (
    column_name VARCHAR(100),
    data_type VARCHAR(100),
    allow_nulls VARCHAR(100)
);

INSERT INTO student (column_name, Data_Type, Allow_Nulls)
VALUES
    ('ID', 'Integer', ''),
    ('FirstName', 'varchar(20)', ''),
    ('LastName', 'varchar(30)', ''),
    ('DateOfBirth', 'date', ''),
    ('EnrolledDate', 'date', ''),
    ('Gender', 'char(1)', ''),
    ('NationalIDNumber', 'Integer', ''),
    ('StudentCardNumber', 'Numeric', '');

SELECT * FROM student;

-- Teacher Table
DROP TABLE IF EXISTS teacher;
CREATE TABLE teacher (
    column_name VARCHAR(100),
    data_type VARCHAR(100),
    allow_nulls VARCHAR(100)
);

INSERT INTO teacher (column_name , data_type, allow_nulls)
VALUES
    ('id', 'Integer', ''),
    ('FirstName', 'varchar(20)', ''),
    ('LastName', 'varchar(30)', ''),
    ('DateOfBirth', 'date', ''),
    ('AcademicRank', 'varchar(20)', ''),
    ('HireDate', 'date', '');

SELECT * FROM teacher;

-- GradeDetails Table
DROP TABLE IF EXISTS gradeDetails;
CREATE TABLE gradeDetails (
    column_name VARCHAR(100),
    data_type VARCHAR(100),
    allow_nulls VARCHAR(100)
);

INSERT INTO gradeDetails (column_name, data_type, allow_nulls)
VALUES
    ('ID', 'Integer', ''),
    ('GradeID', 'Integer', ''),
    ('AchievementTypeID', 'Integer', ''),
    ('AchievementPoints', 'varchar(20)', ''),
    ('AchievementMaxPoints', 'varchar(20)', ''),
    ('AchievementDate', 'varchar(20)', '');

SELECT * FROM gradeDetails;

-- Course Table
DROP TABLE IF EXISTS course;
CREATE TABLE course (
    column_name VARCHAR(100),
    data_type VARCHAR(100),
    allow_nulls VARCHAR(100)
);

INSERT INTO course (column_name, data_type, allow_nulls)
VALUES
    ('ID', 'Integer', ''),
    ('Name', 'varchar(50)', ''),
    ('Credit', 'varchar(10)', ''),
    ('AcademicYear', 'varchar(4)', ''),
    ('Semester', 'varchar(10)', '');

SELECT * FROM course;

-- Grade Table
DROP TABLE IF EXISTS grade;
CREATE TABLE grade (
    column_name VARCHAR(100),
    data_type VARCHAR(100),
    allow_nulls VARCHAR(100)
);

INSERT INTO grade (column_name, data_type, allow_nulls)
VALUES
    ('ID', 'Integer', ''),
    ('StudentID', 'Integer', ''),
    ('CourseID', 'Integer', ''),
    ('TeacherID', 'Integer', ''),
    ('Grade', 'varchar(20)', ''),
    ('Comment', 'varchar(50)', '');

SELECT * FROM grade;

-- AchievementType Table
DROP TABLE IF EXISTS AchievementType;
CREATE TABLE AchievementType(
    column_name VARCHAR(100),
    data_type VARCHAR(100),
    allow_nulls VARCHAR(100)
);

INSERT INTO AchievementType (column_name, data_type, allow_nulls)
VALUES
    ('ID', 'Integer', ''),
    ('Name', 'varchar(50)', ''),
    ('Description', 'varchar(100)', ''),
    ('ParticipationName', 'varchar(20)', '');

SELECT * FROM AchievementType;
