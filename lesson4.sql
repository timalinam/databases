DROP DATABASE IF EXISTS ooo;
CREATE DATABASE ooo;
USE ooo;

CREATE TABLE users (
	id SERIAL PRIMARY KEY, 
    name VARCHAR(50),
    created_at varchar(50),
    updated_at varchar(50),
    birthday DATETIME
);

INSERT INTO users VALUES ('1','Zander','','','1993-03-20 12:00:00'),
('2','Jena','','','1992-03-22 12:00:00'),
('3','Addie','','','1991-03-22 12:00:00'),
('4','Jody','','','1990-03-21 12:00:00');

/*
 Задание 1
 Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
 */
update users set created_at = now(), updated_at = now();

/*
 Задание 2
 Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR 
 и в них долгое время помещались значения в формате "20.10.2017 8:10". 
 Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
 */

update users set created_at = '10.10.2019 7:30', updated_at = '10.10.2019 7:30';

update users set created_at = STR_TO_DATE(created_at, '%c.%e.%Y %H:%i'), updated_at = STR_TO_DATE(updated_at, '%c.%e.%Y %H:%i');
ALTER TABLE users MODIFY COLUMN created_at datetime;
ALTER TABLE users MODIFY COLUMN updated_at datetime;

/*
 Задание 3
 В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, 
 если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, 
 чтобы они выводились в порядке увеличения значения value. 
 Однако, нулевые запасы должны выводиться в конце, после всех записей.
 */


CREATE TABLE storehouses_products (
	id SERIAL PRIMARY KEY, 
    name VARCHAR(50),
    numb varchar(50)
);

INSERT INTO storehouses_products VALUES ('1','Zander','3'),
('2','Jena','3'),
('3','Addie','2'),
('4','Jody','1'),
('5','Jen','0'),
('6','flfl','1'),
('7','poi','0');

SELECT * FROM storehouses_products ORDER BY case WHEN numb=0 THEN '99999999' END, numb;

/*
 Задание 1
 Подсчитайте средний возраст пользователей в таблице users
 */
ALTER TABLE users ADD age varchar(30);

update users set age =
  (
    (YEAR(CURRENT_DATE) - YEAR(birthday)) -                             
    (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(birthday, '%m%d')) 
  ) ;
 
select avg(age) from users;

/*
 Задание 2
 Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
 Следует учесть, что необходимы дни недели текущего года, а не года рождения.
 */
select 
COUNT(*) as count,
DAYNAME(CONCAT(CONCAT(YEAR(NOW()),'-'), SUBSTRING(birthday, 6,5))) as weekday, 
birthday from users group by weekday;