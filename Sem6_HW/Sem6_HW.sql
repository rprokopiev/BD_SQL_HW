CREATE DATABASE sem6_hw;
USE sem6_hw;

/*1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds*/

DELIMITER //
DROP FUNCTION IF EXISTS SecIntoDays//
CREATE FUNCTION SecIntoDays (entry INT)
RETURNS VARCHAR(100)
DETERMINISTIC 
BEGIN
  DECLARE result VARCHAR(100);
  DECLARE num INT DEFAULT 0;
	SET num = ((entry - (entry % 86400))/86400);
    SET result = CONCAT(num, ' day(-s), ');
    SET entry = entry - 86400 * num;
    SET num = ((entry - (entry % 3600))/3600);
    SET result = CONCAT(result, num, ' hour(-s), ');
    SET entry = entry - 3600 * num;
    SET num = ((entry - (entry % 60))/60);
    SET entry = entry - 60 * num;
    SET result = CONCAT(result, num, ' minute(-s), ', entry, ' second(-s).');
  RETURN result;
END//
SELECT SecIntoDays(123456)//

/*2. Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10*/

DROP FUNCTION IF EXISTS get_even_numb//
CREATE FUNCTION get_even_numb (ent INT)
RETURNS TEXT DETERMINISTIC
BEGIN
  DECLARE tmp text DEFAULT ', ';
  DECLARE i INT DEFAULT 2;
  IF (ent > 1) THEN
    WHILE i <= ent DO
      SET tmp = CONCAT(tmp, i, ', ');
      SET i = i + 2;
    END WHILE;
    SET tmp = trim(', ' FROM tmp);
    RETURN tmp;
  ELSE
    RETURN 'Нет чётных чисел';
  END IF;
END //

SELECT get_even_numb(10);
