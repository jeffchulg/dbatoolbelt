-- http://michaeljswart.com/2011/12/cxpacket-whats-that-and-whats-next/
-- TOP 20 parallel queries (by CPU)

SELECT TOP ( 20 ) [Total CPU] = total_worker_time
	, [Total Elapsed Time] = total_elapsed_time
	, [Execution Count] = execution_count
	, [Average CPU in microseconds] = cast ( total_worker_time / ( execution_count + 0.0 ) as money )
	, [DB Name] = DB_NAME ( ST . dbid )
	, [Object Name] = OBJECT_NAME ( ST . objectid , ST . dbid )
	, [Query Text] = ( SELECT [processing-instruction(q)] = CASE
		WHEN [sql_handle] IS NULL THEN ' '
		ELSE ( SUBSTRING ( ST . TEXT ,( QS . statement_start_offset + 2 ) / 2 ,
		( CASE WHEN QS . statement_end_offset = - 1 THEN LEN ( CONVERT ( NVARCHAR ( MAX ), ST . text )) * 2
		ELSE QS . statement_end_offset
		END - QS . statement_start_offset ) / 2 ))
		END
		FOR XML PATH ( '' ), type )
	, [Query Plan] = qp.query_plan
FROM sys.dm_exec_query_stats QS
	CROSS APPLY sys.dm_exec_sql_text ( [sql_handle] ) ST
	CROSS APPLY sys.dm_exec_query_plan ( [plan_handle] ) QP
WHERE total_elapsed_time < total_worker_time
AND ( ( total_worker_time - total_elapsed_time ) / execution_count ) * 1.0 > 1000 -- average difference is more than a millisecond
ORDER BY total_worker_time DESC