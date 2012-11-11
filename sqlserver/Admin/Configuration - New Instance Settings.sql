EXEC sys.sp_configure N'show advanced options',1
GO

-- help keep our plan cache clean
EXEC sys.sp_configure N'optimize for ad hoc workloads',1
GO
-- compression is a free win
EXEC sys.sp_configure N'backup compression default', N'1'
GO

-- the default for parallel plans is a little low
EXEC sys.sp_configure N'cost threshold for parallelism', N'10'
GO
-- make a decision on this with your numa nodes and workload
--EXEC sys.sp_configure N'max degree of parallelism', N'4'
--GO
RECONFIGURE WITH OVERRIDE
GO

EXEC sys.sp_configure N'show advanced options',0
RECONFIGURE
GO
