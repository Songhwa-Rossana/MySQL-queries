
SELECT s.Sno, s.Sname, c.Cname, sc.Grade
FROM s, sc, c
WHERE s.Sno = sc.Sno
  AND sc.Cno = c.Cno;
	
	SELECT s.Sno, c.Cno, c.Cname, sc.Grade
FROM s
JOIN sc ON s.Sno = sc.Sno
JOIN c ON sc.Cno = c.Cno
WHERE sc.Grade >= 80 AND sc.Grade <= 90;
