CREATE DATABASE IF NOT EXISTS phone_db;
USE phone_db;
DROP TABLE IF EXISTS phone;
CREATE TABLE phone
(
id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(50) NOT NULL,
manufacturer VARCHAR(50),
product_count INT(10),
price INT(15)
);

INSERT INTO phone(product_name, manufacturer, product_count, price)
VALUES
	("Galaxy S22", "Samsung", 15, 89999),
    ("iPhone 14 Pro Max", "Apple", 10, 119999),
    ("Galaxy A8", "Samsung", 1, 5999),
    ("iPhone 14", "Apple", 13, 74999),
    ("P60 Pro", "Huawei", 25, 79999),
    ("Nova 10", "Huawei", 4, 34999),
    ("13 Lite", "Xiaomi", 4, 35990),
    ("12T Pro", "Xiaomi", 8, "59999");
    
SELECT product_name, manufacturer, price FROM phone WHERE product_count > 2;
SELECT product_name FROM phone WHERE manufacturer = "Samsung";
SELECT * FROM phone WHERE price * product_count > 100000 AND price * product_count < 145000;
SELECT * FROM phone WHERE product_name LIKE "%iPhone%";
SELECT * FROM phone WHERE product_name LIKE "%Galaxy%";
SELECT * FROM phone WHERE product_name RLIKE "[0-9]";
SELECT * FROM phone WHERE product_name RLIKE "[8]";
