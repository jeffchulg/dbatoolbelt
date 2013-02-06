-- source = http://www.sqlservercentral.com/blogs/stratesql/2013/01/29/determining-filegroup-for-a-table/

-- Listing 1. Query to determine table filegroup by index
SELECT t.name AS table_name
,i.index_id
,i.name AS index_name
,ds.name AS filegroup_name
, p.rows    --FORMAT(p.rows, '#,###') AS rows
FROM sys.tables t
INNER JOIN sys.indexes i ON t.object_id=i.object_id
INNER JOIN sys.filegroups ds ON i.data_space_id=ds.data_space_id
INNER JOIN sys.partitions p ON i.object_id=p.object_id AND i.index_id=p.index_id
ORDER BY t.name, i.index_id
