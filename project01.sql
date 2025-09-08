--- TASK 01

CREATE DATABASE pupils;

\c pupils;

--CREATE DATABASE

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(64),
    age INT,
    student_group VARCHAR(20)
);

--CREATE TABLE


CREATE TABLE grades (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id),
    subject VARCHAR(128),
    grade INT
);

-- CREATE TABLE


--- TASK 02


INSERT INTO students (name, age, student_group)VALUES 
('Laylo', 18, 'A'),
('Komron', 18, 'B'),
('Nilufar', 17, 'A'),
('Sohib', 16, 'A'),
('Malika', 18, 'B'),
('Ozoda', 16, 'B');

--- INSERT 0 6

INSERT INTO grades (student_id, subject, grade) VALUES
(1, 'Matematika' , 5),
(1, 'Ingliz tili', 4),
(2, 'Matematika', 4),
(2, 'Ingliz tili', 4),
(3, 'Matematika', 5),
(3, 'Ingliz tili', 4),
(4, 'Matematika', 5),
(4, 'Ingliz tili', 3),
(5, 'Matematika', 5),
(5, 'Ingliz tili', 3);

--- INSERT 0 10

--- TASK 03

SELECT name , student_group FROM students ;

name   | student_group
---------+---------------
 Laylo   | A
 Komron  | B
 Nilufar | A
 Sohib   | A
 Malika  | B
 Ozoda   | B
(6 rows)

--- TASK 04

SELECT students.name, grades.subject, grades.grade
FROM students
JOIN grades ON students.id = grades.student_id;

  name   |   subject   | grade
---------+-------------+-------
 Laylo   | Matematika  |     5
 Laylo   | Ingliz tili |     4
 Komron  | Matematika  |     4
 Komron  | Ingliz tili |     4
 Nilufar | Matematika  |     5
 Nilufar | Ingliz tili |     4
 Sohib   | Matematika  |     5
 Sohib   | Ingliz tili |     3
 Malika  | Matematika  |     5
 Malika  | Ingliz tili |     3


--- TASK 05

SELECT * FROM students
WHERE age > 20;

 id | name | age | student_group
----+------+-----+---------------
(0 rows)

--- Barcha talabalar 20 yoshdan kichkina!


--- TASK 06

SELECT s.name, ROUND(AVG(g.grade)) AS ortacha_baho
FROM students s
JOIN grades g ON s.id = g.student_id
GROUP BY s.name;

  name   | ortacha_baho
---------+--------------
 Komron  |            4
 Nilufar |            5
 Sohib   |            4
 Laylo   |            5
 Malika  |            4
(5 rows)

--- TASK 07

SELECT student_group, COUNT(*) AS member_group
FROM students
GROUP BY student_group;

 student_group | member_group
---------------+--------------
 B             |            3
 A             |            3
(2 rows)

--- TASK 08

SELECT students.name, grades.subject, grades.grade
FROM students
JOIN grades ON students.id = grades.student_id
ORDER BY grades.grade DESC
LIMIT 5;

  name   |   subject   | grade
---------+-------------+-------
 Nilufar | Matematika  |     5
 Laylo   | Matematika  |     5
 Sohib   | Matematika  |     5
 Malika  | Matematika  |     5

--- TASK 09

SElECT * FROM students WHERE name LIKE 'A%';

 id | name | age | student_group
----+------+-----+---------------
(0 rows)

--- A harfi bilan boshlanadigan talaba topilmadi!

--- TASK 10

DELETE FROM students WHERE (student_group = 'B');