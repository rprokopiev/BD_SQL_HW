CREATE SCHEMA Sem3_hw3;
USE Sem3_hw3;

-- ==================== ТАБЛИЦА 1: ПРОДАВЦЫ (SALESPEOPLE) ================
CREATE TABLE salespeople (
	snum INT UNIQUE NOT NULL,
    sname VARCHAR(30),
    city VARCHAR(30),
    comm DECIMAL(2, 2)
);

INSERT salespeople(
	snum, sname, city, comm)
VALUES
	(1001, 'Peel', 'London', 0.12),
    (1002, 'Serres', 'San Jose', 0.13),
    (1004, 'Motika', 'London', 0.11),
    (1007, 'Rifkin', 'Barcelona', 0.15),
    (1003, 'Axelrod', 'New York', 0.10);

SELECT * FROM salespeople;

-- ================== ТАБЛИЦА 2: ЗАКАЗЧИКИ (CUSTOMERS) ===============
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
	cnum INT UNIQUE,
    cname VARCHAR(30),
    city VARCHAR(30),
    rating INT,
    snum INT,
    FOREIGN KEY (snum)
    REFERENCES salespeople(snum)
);

INSERT customers(
	cnum, cname, city, rating, snum)
VALUES
	(2001, 'Hoffman', 'London', 100, 1001),
    (2002, 'Giovanni', 'Rome', 200, 1003),
    (2003, 'Liu', 'SanJose', 200, 1002),
    (2004, 'Grass', 'Berlin', 300, 1002),
    (2006, 'Clemens', 'London', 100, 1001),
    (2008, 'Cisneros', 'SanJose', 300, 1007),
    (2007, 'Pereire', 'Rome', 100, 1004);

SELECT * FROM customers;

-- ================== ТАБЛИЦА 3: ЗАКАЗЫ (ORDERS) ==================

CREATE TABLE orders(
	onum INT UNIQUE,
    amt DECIMAL(6, 2) NOT NULL,
    odate DATE NOT NULL,
    cnum INT,
    snum INT,
    FOREIGN KEY (cnum) REFERENCES customers(cnum),
    FOREIGN KEY (snum) REFERENCES salespeople(snum)
);

DESCRIBE orders;

INSERT orders(
	onum, amt, odate, cnum, snum)
VALUES
	(3001, 18.69, '1990-03-01', 2008, 1007),
	(3003, 767.19, '1990-03-01', 2001, 1001),
	(3002, 1900.10, '1990-03-01', 2007, 1004),
	(3005, 5160.45, '1990-03-01', 2003, 1002),
	(3006, 1098.16, '1990-03-01', 2008, 1007),
	(3009, 1713.23, '1990-04-10', 2002, 1003),
	(3007, 75.75, '1990-04-10', 2004, 1002),
	(3008, 4723.00, '1990-05-10', 2006, 1001),
	(3010, 1309.95, '1990-06-10', 2004, 1002),
	(3011, 9891.88, '1990-06-10', 2006, 1001);

SELECT * FROM orders;

