SELECT s.Sno, s.Sname, c.Cname, sc.Grade
FROM s, sc, c
WHERE s.Sno = sc.Sno
AND sc.Cno = c.Cno;

SELECT s.Sno, c.Cno, c.Cname, sc.Grade
FROM s
JOIN sc ON s.Sno = sc.Sno
JOIN c ON sc.Cno = c.Cno
WHERE sc.Grade >= 80 AND sc.Grade <= 90;

SELECT s.Sno, s.Sname, MAX(sc.Grade) AS MaxGrade
FROM s
LEFT JOIN sc ON s.Sno = sc.Sno
GROUP BY s.Sno, s.Sname;

SELECT s.Sno, s.Sname, COALESCE(SUM(sc.Grade), 0) AS TotalGrade
FROM s
LEFT JOIN sc ON s.Sno = sc.Sno
GROUP BY s.Sno, s.Sname;

SELECT s.Sno, COALESCE(sc.Grade, '') AS Grade, c.Cno, COALESCE(c.Cname, '') AS Cname
FROM c
RIGHT JOIN sc ON c.Cno = sc.Cno
LEFT JOIN s ON sc.Sno = s.Sno;

SELECT s.Sno, s.Sname
FROM s
JOIN sc ON s.Sno = sc.Sno
WHERE s.Sdept = '计算机' AND sc.Grade >= 80;

SELECT Sno, Sname, Sdept
FROM s
WHERE Sno IN (
  SELECT Sno
  FROM sc
  WHERE Cno = '001'
);

SELECT sc.Sno, sc.Grade
FROM sc
WHERE sc.Cno = '001'
AND sc.Grade < (SELECT AVG(Grade) FROM sc WHERE Cno = '001');

SELECT sc1.Sno, sc1.Grade
FROM sc sc1
WHERE sc1.Sno = '2022010101' 
AND sc1.Grade > (
    SELECT MAX(sc2.Grade)
    FROM sc sc2
    WHERE sc2.Sno = '2022010103'
);

SELECT s.Sno, s.Sname, s.Sbirth, s.Sdept
FROM s
JOIN sc ON s.Sno = sc.Sno
JOIN c ON sc.Cno = c.Cno
WHERE c.Cname = '数据库系统';

SELECT s.Sno, s.Sname, c.Cname, sc.Grade
FROM s
JOIN sc ON s.Sno = sc.Sno
JOIN c ON sc.Cno = c.Cno
WHERE s.Sdept = (SELECT Sdept FROM s WHERE Sname = '王毅');


SET @score := 0;

SELECT @score := sc.Grade
FROM s
JOIN sc ON s.Sno = sc.Sno
JOIN c ON sc.Cno = c.Cno
WHERE c.Cname = '数据库系统';

SELECT CONCAT('孙苗数据库系统的成绩为 ', @score) AS result;



SELECT Grade,
    CASE
        WHEN Grade >= 90 THEN '优秀'
        WHEN Grade >= 80 AND Grade < 90 THEN '良好'
        WHEN Grade >= 70 AND Grade < 80 THEN '中'
        WHEN Grade >= 60 AND Grade < 70 THEN '及格'
        ELSE '不及格'
    END AS ScoreStatus
FROM sc;



