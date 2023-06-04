CREATE SCHEMA sem4_hw4;
USE sem4_hw4;

DROP TABLE IF EXISTS auto;
CREATE TABLE  AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM)
VALUES
(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221'),
(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334'),
(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334'),
(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332'),
(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336'),
(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444'),
(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null),
(111117,'BMW', 'СИНИЙ', date'2005-01-01', null),
(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);

SELECT * FROM auto;

/* 1. Вывести на экран, сколько машин каждого цвета для машин марок BMW и LADA */
SELECT mark, color, count(1) AS 'Qty'
FROM auto
	WHERE mark = 'BMW'
		GROUP BY color
UNION ALL

SELECT mark, color, count(1) AS 'Qty'
FROM auto
	WHERE mark = 'LADA'
		GROUP BY color;

/*2. Вывести на экран марку авто(количество) и количество авто не этой марки.
100 машин, их них 20 BMW и 80 машин другой марки , AUDI 30 и 70 машин другой
марки, LADA 15, 85 авто другой марки*/

# I - не JOIN способ
SELECT 
	mark, 
    COUNT(1) AS MarkQty,
    ((SELECT count(1) FROM auto) - count(1)) AS RestQty
FROM auto
	GROUP BY mark;

# II - JOIN способ

SELECT mark, COUNT(1) AS MarkQty, q2.RestQty
FROM auto 
JOIN (SELECT 
		mark, ((SELECT count(1) FROM auto) - count(1)) AS RestQty
	  FROM auto
		GROUP BY mark) AS q2
	USING(mark)
    GROUP BY mark;

/*3. Напишите запрос, который вернет строки из таблицы test_a , id которых нет в
таблице test_b , НЕ используя ключевого слова*/

DROP TABLE IF EXISTS test_a;
CREATE TABLE test_a(
	id INT, 
    test VARCHAR(10)
);

DROP TABLE IF EXISTS test_b;
CREATE TABLE test_b(
	id INT
);

INSERT INTO test_a (id, test)
VALUES
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');

INSERT INTO test_b (id)
VALUES
(10),
(30),
(50);

SELECT a.id, a.test
FROM test_a AS a
LEFT JOIN 
	test_b AS b
USING(id)
WHERE b.id IS NULL;
