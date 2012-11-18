SELECT publisher_db, source_object
, COUNT(*)
FROM distribution.dbo.MSarticles 
GROUP BY publisher_db, source_object HAVING COUNT(*)>1;


SELECT * FROM dbo.MSarticles