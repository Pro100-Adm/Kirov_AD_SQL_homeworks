CREATE DATABASE IF NOT EXISTS Kirov_AD_homework_25_06_2023;
USE Kirov_AD_homework_25_06_2023;
DROP TABLE IF EXISTS staff;
CREATE TABLE staff
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(45),
    lastname VARCHAR(45),
    post VARCHAR(45),
    seniority INT,
    salary DECIMAL(8,2),
    age INT
);
 INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
 ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
 ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
 ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
 ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
 ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
 ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
 ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
 ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
 ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
 ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
 
SELECT * FROM staff ORDER BY salary DESC;
SELECT * FROM staff ORDER BY salary;

SELECT * FROM staff ORDER BY salary DESC LIMIT 5; 

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT post AS "Должность", SUM(salary) AS "Суммарная зарплата"
FROM staff GROUP BY post;

SELECT post AS "Должность", COUNT(id) AS "Кол-во сотрудников"
FROM staff
WHERE post = "Рабочий" AND age BETWEEN 24 AND 49;

SELECT COUNT(*) AS "Кол-во должностей"
FROM (SELECT DISTINCT post FROM staff) as temp;

SELECT post AS "Должность", AVG(age) AS "Средний возраст сотрудников"
FROM staff
GROUP BY post
HAVING AVG(age)<=30;

SELECT firstname AS "Имя", lastname AS "Фамилия",
salary AS "Зарплата", post AS "Должность"
FROM staff
GROUP BY post
ORDER BY salary;
