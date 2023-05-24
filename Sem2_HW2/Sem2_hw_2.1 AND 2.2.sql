CREATE SCHEMA sem2_hw2;
USE sem2_hw2;

	/* ЗАДАНИЕ 2.1
    Используя операторы языка SQL, создайте таблицу “
	sales ”. Заполните её данными.*/
CREATE TABLE sales
(
id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
count_product INT
);

INSERT sales (order_date, count_product)
VALUES
('2022-01-01', '156'),
('2022-01-02', '180'),
('2022-01-03', '21'),
('2022-01-04', '124'),
('2022-01-05', '341');

SELECT * FROM sales;

	/* ЗАДАНИЕ 2.2
    2. Для данных таблицы “sales ” укажите тип заказа в зависимости от кол ва :
		меньше 100		- Маленький заказ
		от 100 до 300 	- Средний заказ
		больше 300 		- Большой заказ*/

SELECT id, count_product,
	CASE
	WHEN count_product < 100 THEN 'Маленький заказ'
	WHEN count_product > 100 AND count_product < 200 THEN 'Средний заказ'
	ELSE 'Большой заказ'
	END AS 'Тип заказа'
FROM sales;
