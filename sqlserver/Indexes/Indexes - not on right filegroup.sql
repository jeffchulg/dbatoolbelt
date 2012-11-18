-- which indexes are not on the indexes filegroup
SELECT o.[name], o.[type], i.[name], i.[index_id], f.[name]
FROM sys.indexes i
INNER JOIN sys.filegroups f
ON i.data_space_id = f.data_space_id
INNER JOIN sys.all_objects o
ON i.[object_id] = o.[object_id]
WHERE i.data_space_id = f.data_space_id
	AND o.type = 'U' -- User Created Tables
	AND i.name NOT LIKE 'pk_%'
	AND f.Name <> 'INDEXES'
GO


-- Which indexes are on the indexes filegroup
/* Get Details of Object on different filegroup
Finding Objects on Specific Filegroup*/
SELECT o.[name], o.[type], i.[name], i.[index_id], f.[name]
FROM sys.indexes i
INNER JOIN sys.filegroups f
ON i.data_space_id = f.data_space_id
INNER JOIN sys.all_objects o
ON i.[object_id] = o.[object_id]
WHERE i.data_space_id = f.data_space_id
AND i.data_space_id = 5 -- Filegroup
GO 