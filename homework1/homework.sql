-- Student Table
DROP TABLE IF EXISTS student;
CREATE TABLE student (
    id INTEGER,
    columnname VARCHAR(100),
    datatype VARCHAR(100),
    allownulls VARCHAR(100)
);

INSERT INTO student (id, columnname, datatype, allownulls)
VALUES
    (1, 'id', 'Integer', ''),
    (2, 'FirstName', 'varchar(20)', ''),
    (3, 'LastName', 'varchar(30)', ''),
    (4, 'DateOfBirth', 'date', ''),
    (5, 'EnrolledDate', 'date', ''),
    (6, 'Gender', 'char(1)', ''),
    (7, 'NationalIDNumber', 'Integer', ''),
    (8, 'StudentCardNumber', 'Numeric', '');

SELECT * FROM student;

-- Teacher Table
CREATE TABLE teacher (
    id INTEGER,
    columnname VARCHAR(100),
    datatype VARCHAR(100),
    allownulls VARCHAR(100)
);

INSERT INTO teacher (id, columnname, datatype, allownulls)
VALUES
    (1, 'id', 'Integer', ''),
    (2, 'FirstName', 'varchar(20)', ''),
    (3, 'LastName', 'varchar(30)', ''),
    (4, 'DateOfBirth', 'date', ''),
    (5, 'AcademicRank', 'varchar(20)', ''),
    (6, 'HireDate', 'date', '');

SELECT * FROM teacher;

-- GradeDetails Table
CREATE TABLE gradeDetails (
    id INTEGER,
    columnname VARCHAR(100),
    datatype VARCHAR(100),
    allownulls VARCHAR(100)
);

INSERT INTO gradeDetails (id, columnname, datatype, allownulls)
VALUES
    (1, 'id', 'Integer', ''),
    (2, 'GradeID', 'Integer', ''),
    (3, 'AchievementTypeID', 'Integer', ''),
    (4, 'AchievementPoints', 'varchar(20)', ''),
    (5, 'AchievementMaxPoints', 'varchar(20)', ''),
    (6, 'AchievementDate', 'varchar(20)', '');

SELECT * FROM gradeDetails;

-- Course Table
CREATE TABLE course (
    id INTEGER,
    columnname VARCHAR(100),
    datatype VARCHAR(100),
    allownulls VARCHAR(100)
);

INSERT INTO course (id, columnname, datatype, allownulls)
VALUES
    (1, 'id', 'Integer', ''),
    (2, 'name', 'varchar(50)', ''),
    (3, 'credit', 'varchar(10)', ''),
    (4, 'academicYear', 'varchar(4)', ''),
    (5, 'semester', 'varchar(10)', '');

SELECT * FROM course;

-- Grade Table
CREATE TABLE grade (
    id INTEGER,
    columnname VARCHAR(100),
    datatype VARCHAR(100),
    allownulls VARCHAR(100)
);

INSERT INTO grade (id, columnname, datatype, allownulls)
VALUES
    (1, 'id', 'Integer', ''),
    (2, 'studentID', 'Integer', ''),
    (3, 'courseID', 'Integer', ''),
    (4, 'teacherID', 'Integer', ''),
    (5, 'grade', 'varchar(20)', ''),
    (6, 'comment', 'varchar(50)', '');

SELECT * FROM grade;

-- AchievementType Table
CREATE TABLE achievementType (
    id INTEGER,
    columnname VARCHAR(100),
    datatype VARCHAR(100),
    allownulls VARCHAR(100)
);

INSERT INTO achievementType (id, columnname, datatype, allownulls)
VALUES
    (1, 'id', 'Integer', ''),
    (2, 'name', 'varchar(50)', ''),
    (3, 'description', 'varchar(100)', ''),
    (4, 'participationName', 'varchar(20)', '');

SELECT * FROM achievementType;