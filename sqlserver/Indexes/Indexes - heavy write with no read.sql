--Most used indexes
DECLARE @Now datetime
SET @Now = getdatE()

SELECT top 50 o.name objectname, 
       x.name indexname,
       user_seeks, 
       user_scans,
       user_lookups, 
       user_updates,
	@Now as Snapshot_Date
from sys.dm_db_index_usage_stats us
join sys.sysdatabases d on us.database_id = d.dbid
join sys.sysindexes x on us.object_id = x.id and us.index_id = x.indid
join sys.sysobjects o on us.object_id = o.id
where d.name = DB_NAME() 
	and o.type = 'u'
	--AND user_updates > ((user_seeks+user_scans+user_lookups)*4)
	AND (user_seeks+user_scans+user_lookups) = 0
	AND x.name like 'IX_%'
order by user_updates desc