CREATE SCHEMA Sem3_hw3;
USE Sem3_hw3;

/* 1. Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname,
snum, comm. (к первой или второй таблице, используя SELECT)*/
SELECT city, sname, snum, comm
FROM salespeople;

/* 2. Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем
каждого заказчика в городе San Jose. (“заказчики”)*/
SELECT rating, cname
FROM customers
WHERE city = 'SanJose';

/* 3. Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без
каких бы то ни было повторений. (уникальные значения в “snum“ “Продавцы”)*/
SELECT DISTINCT snum
FROM orders;

/* 4. Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. 
Используется оператор "LIKE": (“заказчики”) https://dev.mysql.com/doc/refman/8.0/en/string comparison
functions.html)*/
SELECT cname 
FROM customers
WHERE cname Like 'G%';

/* 5. Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000.
(“Заказы”, “amt” сумма)*/
SELECT *
FROM orders
WHERE amt > 1000;

/* 6. Напишите запрос, который выбрал бы наименьшую сумму заказа.
(Из поля “amt” сумма в таблице “Заказы” выбрать наименьшее значение)*/
SELECT Min(amt) 
FROM orders;

/* 7. Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых
рейтинг больше 100 и они находятся не в Риме.*/
SELECT *
FROM customers
WHERE rating > 100
HAVING city != 'Rome';