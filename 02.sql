SET @x = 10;
SELECT @y := 20;

SELECT @x + @y AS result;





CALL p_sex('446392198906041125');

DELIMITER //
CREATE PROCEDURE p_sex(IN p_idcard VARCHAR(18))
BEGIN
  DECLARE p_gender CHAR(1);
  
  SET p_gender = CAST(SUBSTRING(p_idcard, 17, 1) AS SIGNED);

  IF p_gender % 2 = 1 THEN
    SELECT '该用户为男性' AS result;
  ELSE
    SELECT '该用户为女性' AS result;
  END IF;
END;
//
DELIMITER ;



WITH RECURSIVE FactorialCTE AS (
  SELECT 1 AS n, 1 AS result
  UNION ALL
  SELECT n + 1, result * (n + 1)
  FROM FactorialCTE
  WHERE n < 10 
)

SELECT result
FROM FactorialCTE
WHERE n = 10; 

WITH RECURSIVE Alphabet AS (
  SELECT 'a' AS letter
  UNION ALL
  SELECT CHAR(ASCII(letter) + 1)
  FROM Alphabet
  WHERE letter < 'z'
)

SELECT letter FROM Alphabet;


SELECT SUM(number) AS SumOfMultiplesOf8
FROM (
  SELECT (n * 8) AS number
  FROM (
    SELECT row_number() OVER () AS n
    FROM information_schema.tables
    LIMIT 100
  ) AS numbers
) AS multiples
WHERE number <= 100;


SELECT DATEDIFF(NOW(), '2003-09-27') AS DaysSinceBirth;


SET @num := FLOOR(RAND() * (9999 - 1000 + 1) + 1000);

SELECT @num AS RandomNumber;

