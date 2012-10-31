/*
	SQL Server isn't the best at respecting your history retention
	configs inside the agent. This script will 'demand' that respect.
*/

--purge everything older than 20 days
DECLARE @oldjobdate DATETIME = DATEADD(d,-20, GETDATE()) 
EXEC msdb.dbo.sp_purge_jobhistory @oldest_date= @oldjobdate