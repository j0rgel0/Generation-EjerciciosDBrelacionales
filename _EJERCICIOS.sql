-- Write a Query that allows you to count all the students that are enrolled in a given module. 
-- Hint: You need to count all the students enrolled in all the courses of the module.

-- ---- EXTRA: Module: DB-MySQL---- --
SELECT COUNT(students.idStudent)
FROM students 
INNER JOIN courses_has_students
ON Students.idStudent = courses_has_students.students_id_student
INNER JOIN courses
ON courses_has_students.course_code = courses.`code`
WHERE courses.module_code = 'DB-MYSQL';

-- ---- EXTRA: Module: JAVA---- --
SELECT COUNT(students.idStudent)
FROM students 
INNER JOIN courses_has_students
ON Students.idStudent = courses_has_students.students_id_student
INNER JOIN courses
ON courses_has_students.course_code = courses.`code`
WHERE courses.module_code = 'JAVA';

-- ---- EXTRA: Module: JS---- --
SELECT COUNT(students.idStudent)
FROM students 
INNER JOIN courses_has_students
ON Students.idStudent = courses_has_students.students_id_student
INNER JOIN courses
ON courses_has_students.course_code = courses.`code`
WHERE courses.module_code = 'JS';

-- ---- EXTRA: Showing everything ---- --
SELECT students.idStudent, courses.`name`, courses.module_code
FROM students 
INNER JOIN courses_has_students
ON Students.idStudent = courses_has_students.students_id_student
INNER JOIN courses
ON courses_has_students.course_code = courses.`code`;

-- 2.4 Write a SQL query that allows you to find all the students in a given country.
SELECT students.*, Countries.`name` country 
FROM students 
INNER JOIN countries 
ON students.nationality = Countries.idCountries
WHERE countries.`Name` = 'Montenegro';

-- 2.3 Write a SQL query that allows you to find all the Countries which name starts with 'Ca'.
SELECT students.*, Countries.`name` country 
FROM students 
INNER JOIN countries 
ON students.nationality = Countries.idCountries
WHERE countries.`Name` LIKE 'CA%';

-- 2.2 Count all the students that are enrolled in the course 'JAVA-1'.
SELECT COUNT(courses.`name`) AS 'Inscritos en JAVA-1'
FROM students 
INNER JOIN courses_has_students
ON Students.idStudent = courses_has_students.students_id_student
INNER JOIN courses
ON courses_has_students.course_code = courses.`code`
WHERE courses.code = 'JAVA-1';

-- 2.1 Calculate the SUM of the credits of all the courses that have the word 'JAVA' in the name.
SELECT SUM(credits) AS 'Suma de credits'
FROM courses
WHERE courses.`Name` LIKE '%JAVA%';

SELECT `name`, credits 
FROM courses
WHERE courses.`Name` LIKE '%JAVA%';

-- 1.5 Now that you have the two queries, use an INNER JOIN to combine the results of the queries 
-- (this is called nested queries, and will allow you to combine SQL queries to order the data the way you like).
SELECT students.idStudent, students.`name`, students.`last_name`, students.`email`, 
Countries.`name` country, courses_has_students.course_code, courses.`name` 
FROM students 
INNER JOIN Countries 
ON students.nationality = Countries.idCountries
INNER JOIN courses_has_students
ON Students.idStudent = courses_has_students.students_id_student
INNER JOIN courses
ON courses_has_students.course_code = courses.`code`;

-- 1.4 Write a SQL query to join the CourseHasStudent table with the Courses table to get 
-- the name of the course information with the student ID of students enrolled in the course.
SELECT courses_has_students.students_id_student, courses_has_students.course_code, courses.`name`
FROM courses_has_students
INNER JOIN courses
ON courses_has_students.course_code = courses.`code`;

-- 1.3 Write an additional SQL statment to JOIN the Students table with the CourseHasStudent table 
-- to get the code of the courses that each students is enrolled in.
SELECT students.*, courses_has_students.course_code 
FROM students 
INNER JOIN courses_has_students
ON Students.idStudent = courses_has_students.students_id_student;

-- 1.2 Modify the previous SQL statment so it joins the Students 
-- table with the IDTypes table to know each students' type of ID.
SELECT students.*, idtypes.`name`, Countries.`name` country 
FROM students 
INNER JOIN Countries 
ON students.nationality = Countries.idCountries
INNER JOIN idtypes 
ON Students.IdType_id = idtypes.id_idTypes;
