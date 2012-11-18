SELECT TOP 10
 [Plan usage] = cp.usecounts
,[Individual Query] = SUBSTRING (qt.text,qs.statement_start_offset/2, 
         (CASE WHEN qs.statement_end_offset = -1 
            THEN LEN(CONVERT(NVARCHAR(MAX), 
qt.text)) * 2 ELSE qs.statement_end_offset END - 
qs.statement_start_offset)/2)
,[Parent Query] = qt.text
,DatabaseName = DB_NAME(qt.dbid)
,cp.cacheobjtype
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS qt
INNER JOIN sys.dm_exec_cached_plans as cp on qs.plan_handle=cp.plan_handle
WHERE cp.plan_handle=qs.plan_handle
ORDER BY [Plan usage] ASC;
