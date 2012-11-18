SELECT
 est.text AS batchtext,
 SUBSTRING(est.text, (eqs.statement_start_offset/2)+1, 
 (CASE eqs.statement_end_offset WHEN -1 
 THEN DATALENGTH(est.text) 
 ELSE eqs.statement_end_offset END - 
 ((eqs.statement_start_offset/2) + 1))) AS querytext,
 eqs.creation_time, eqs.last_execution_time, eqs.execution_count, 
 eqs.total_worker_time, eqs.last_worker_time, 
 eqs.min_worker_time, eqs.max_worker_time, 
 eqs.total_physical_reads, eqs.last_physical_reads, 
 eqs.min_physical_reads, eqs.max_physical_reads, 
 eqs.total_elapsed_time, eqs.last_elapsed_time, 
 eqs.min_elapsed_time, eqs.max_elapsed_time, 
 eqs.total_logical_writes, eqs.last_logical_writes, 
 eqs.min_logical_writes, eqs.max_logical_writes,
 eqs.query_plan_hash 
FROM
 sys.dm_exec_query_stats AS eqs
 CROSS APPLY sys.dm_exec_sql_text(eqs.sql_handle) AS est
ORDER BY eqs.total_physical_reads DESC


-- Top Cached SPs By Total Logical Writes (SQL 2008 and 2008 R2)
-- This represents write I/O pressure
SELECT  p.name AS [SP Name] ,
        qs.total_logical_writes AS [TotalLogicalWrites] ,
        qs.total_logical_reads AS [TotalLogicalReads] ,
        qs.execution_count , qs.cached_time
FROM    sys.procedures AS p
        INNER JOIN sys.dm_exec_procedure_stats AS qs
                       ON p.[object_id] = qs.[object_id]
WHERE   qs.database_id = DB_ID()
        AND qs.total_logical_writes > 0
ORDER BY qs.total_logical_writes DESC ;
 
-- Top Cached SPs By Total Physical Reads (SQL 2008 and 2008 R2)
-- This represents read I/O pressure
SELECT  p.name AS [SP Name] ,
       qs.total_physical_reads AS [TotalPhysicalReads] ,
       qs.total_logical_reads AS [TotalLogicalReads] ,
       qs.total_physical_reads/qs.execution_count AS [AvgPhysicalReads] ,
       qs.execution_count , qs.cached_time
FROM   sys.procedures AS p
       INNER JOIN sys.dm_exec_procedure_stats AS qs
                       ON p.[object_id] = qs.[object_id]
WHERE  qs.database_id = DB_ID()
       AND qs.total_physical_reads > 0
ORDER BY qs.total_physical_reads DESC, qs.total_logical_reads DESC ;

 
-- Top Cached SPs By Total Logical Reads (SQL 2008 and 2008 R2)
-- This represents read memory pressure
SELECT  p.name AS [SP Name] ,
        qs.total_logical_reads AS [TotalLogicalReads] ,
        qs.total_logical_writes AS [TotalLogicalWrites] ,
        qs.execution_count , qs.cached_time
FROM    sys.procedures AS p
        INNER JOIN sys.dm_exec_procedure_stats AS qs
                       ON p.[object_id] = qs.[object_id]
WHERE   qs.database_id = DB_ID()
        AND qs.total_logical_reads > 0
ORDER BY qs.total_logical_reads DESC ;