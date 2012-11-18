declare @PageSize float 
select @PageSize=v.low/1024.0 from master.dbo.spt_values v where v.number = 1 and v.type = 'E'

SELECT tbl.name TableName, i.name IndexName, 
    ISNULL(@PageSize * SUM(a.used_pages - CASE WHEN a.type <> 1 THEN a.used_pages 
                                                        WHEN p.index_id < 2 THEN a.data_pages ELSE 0 END),0.0)/1024/1024 AS IndexSpaceUsed_MB 
FROM sys.indexes as i INNER JOIN sys.partitions as p ON p.object_id = i.object_id and p.index_id = i.index_id
    INNER JOIN sys.allocation_units as a ON a.container_id = p.partition_id
    INNER JOIN sys.tables AS tbl ON i.object_id = tbl.object_id
GROUP BY tbl.name,  i.name   
ORDER BY 3 DESC
