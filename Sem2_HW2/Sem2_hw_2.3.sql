USE sem2_hw2;

	/* ЗАДАНИЕ 2.3
    Создайте таблицу “orders ”, заполните ее значениями.
    Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status
	OPEN « Order is in open state »; 
    CLOSED « Order is closed » ; 
    CANCELLED « Order is cancelled »*/

CREATE TABLE orders
(
id INT PRIMARY KEY AUTO_INCREMENT,
employee_id VARCHAR(3),
amount DOUBLE,
order_status VARCHAR(9)
);

INSERT orders (employee_id, amount, order_status)
VALUES
('e03', '15.00', 'OPEN'),
('e01', '25.50', 'OPEN'),
('e05', '100.70', 'CLOSED'),
('e02', '22.18', 'OPEN'),
('e04', '9.50', 'CANCELLED');

SELECT * FROM orders;

SELECT id, employee_id, amount, order_status,
	IF(order_status = 'OPEN', 'Order is in open state',
		IF(order_status = 'CLOSED', 'Order is closed', 'Order is cancelled'))
			AS full_order_status
FROM orders;
