CREATE TABLE IF NOT EXISTS student (
	id INTEGER,
	FirstName VARCHAR(30),
	LastName VARCHAR(30),
	DateOfBirth date,
	EnrolledDate date,
	Gender VARCHAR (10),
	NationalIDNumber INTEGER,
	StudentCardNumber VARCHAR(100)
);

INSERT INTO student (id, FirstName, LastName, DateOfBirth, EnrolledDate, Gender, NationalIDNumber, StudentCardNumber)
VALUES (1, 'Goran', 'Jovanov', '2006-01-01','2025-09-09','Male','1000','1' );

SELECT * FROM student;

CREATE TABLE IF NOT EXISTS teacher (
	id INTEGER,
	FirstName VARCHAR(30),
	LastName VARCHAR(30),
	DateOfBirth date,
	AcademicRank VARCHAR,
	HireDate date
);

INSERT INTO teacher (id, FirstName, LastName, DateOfBirth, AcademicRank, HireDate)
VALUES (2,'Toni','Avel','2000-02-02', 'A', '2001-01-03');

SELECT * FROM teacher;

CREATE TABLE IF NOT EXISTS gradeDetails (
	id INTEGER,
	GradeID INTEGER,
	AchievementTypeID INTEGER,
	AchievementPoints VARCHAR(50),
	AchievementMaxPoints VARCHAR(100),
	AchievementDate date
);


INSERT INTO gradeDetails (id, GradeID, AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate) 
VALUES (3, 5, 6, '45', '50', '2002-08-08');

SELECT * FROM gradeDetails;

CREATE TABLE IF NOT EXISTS course (
	id INTEGER,
	name VARCHAR(40),
	credit VARCHAR(60),
	academicYear date,
	semester VARCHAR
);

INSERT INTO course (id, name, credit, academicYear , semester)
VALUES(4, 'Ani', '505', '1999-09-09', 'Front-end');

SELECT * FROM course;

CREATE TABLE IF NOT EXISTS grade (
	id INTEGER,
	StudentID INTEGER,
	CourseID INTEGER,
	TeacherID INTEGER,
	Grade VARCHAR,
	Comment VARCHAR,
	CreatedDate date
);

INSERT INTO grade (id, StudentID, CourseID, TeacherID, Grade, Comment, CreatedDate)
VALUES (5, 6, 7, 8, 'B', 'Dont have', '2002-02-02');

SELECT * FROM grade;

CREATE TABLE IF NOT EXISTS achievementType (
	id INTEGER,
	name VARCHAR(100),
	description VARCHAR(100),
	participationRate VARCHAR(50)
);

INSERT INTO achievementType(id, name, description, participationRate )
VALUES(6,'Iva', 'Best one', 'A+');

SELECT * FROM achievementType;