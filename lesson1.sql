/*
 ���� 1
 ������ 1
 ���������� ���� MySQL. �������� � �������� ���������� ���� .my.cnf, ����� � ��� ����� � ������, ������� ���������� ��� ���������.
*/

C:\Program Files\MySQL\MySQL Server 8.0>TYPE my.ini
[client]
user=root
password = Tm1578*&
C:\Program Files\MySQL\MySQL Server 8.0>

/*
 ���� 1
 ������ 2
 �������� ���� ������ example, ���������� � ��� ������� users, ��������� �� ���� ��������, ��������� id � ���������� name.
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
 ���� 1
 ������ 3
 �������� ���� ���� ������ example �� ����������� �������, ���������� ���������� ����� � ����� ���� ������ sample.
*/

C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump example > example.sql
C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql sample < example.sql