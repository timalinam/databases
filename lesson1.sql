/*
 Урок 1
 Задача 1
 Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль, который указывался при установке.
*/

C:\Program Files\MySQL\MySQL Server 8.0>TYPE my.ini
[client]
user=root
password = Tm1578*&
C:\Program Files\MySQL\MySQL Server 8.0>

/*
 Урок 1
 Задача 2
 Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.
*/

mysql>
mysql> create database example;
Query OK, 1 row affected (0.03 sec)
mysql>
mysql> use example
mysql> create table users (
    -> id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    -> name VARCHAR(20));
Query OK, 0 rows affected (0.24 sec)
mysql>

/*
 Урок 1
 Задача 3
 Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.
*/

C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump example > example.sql
C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql sample < example.sql