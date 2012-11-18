declare @id integer
declare @tbname nvarchar(100)
declare @indid integer
declare @indname nvarchar(100)
declare @fill integer
declare @group integer
declare @list nvarchar(4000)
declare @strsql nvarchar(4000)
DECLARE @ROWCNT INTEGER
DECLARE @DEBUG INTEGER

SET @ROWCNT=150000000
SET @DEBUG=1

declare curs1 cursor for
SELECT     TOP 100 PERCENT dbo.sysobjects.id,dbo.sysobjects.name,dbo.sysindexes.indid, dbo.sysindexes.name AS indname, dbo.sysindexes.OrigFillFactor, 
                      dbo.sysindexes.groupid
FROM         dbo.sysindexes INNER JOIN
                      dbo.sysobjects ON dbo.sysindexes.id = dbo.sysobjects.id
WHERE     (dbo.sysobjects.xtype = 'U') AND (dbo.sysindexes.indid BETWEEN 2 AND 254) and (sysindexes.status & 64) = 0 and (not(sysindexes.status & 0x800)=0x800)  and sysindexes.groupid=1 AND SYSINDEXES.ROWCNT<=@ROWCNT
ORDER BY dbo.sysobjects.name, dbo.sysindexes.indid

open curs1
fetch next from curs1 into @id,@tbname,@indid,@indname,@fill,@group
while @@fetch_status=0
begin

set @list=''
SELECT      @List = @List +  '['+ dbo.syscolumns.name+'],' 
FROM         dbo.sysindexes INNER JOIN
                      dbo.sysobjects ON dbo.sysindexes.id = dbo.sysobjects.id INNER JOIN
                      dbo.sysindexkeys ON dbo.sysindexes.id = dbo.sysindexkeys.id AND dbo.sysindexes.indid = dbo.sysindexkeys.indid INNER JOIN
                      dbo.syscolumns ON dbo.sysindexkeys.id = dbo.syscolumns.id AND dbo.sysindexkeys.colid = dbo.syscolumns.colid
WHERE     (dbo.sysobjects.xtype = 'U') AND (dbo.sysindexes.indid =@indid) AND (dbo.sysobjects.id = @id) and (sysindexes.status & 64) = 0 and (not(sysindexes.status & 0x800)=0x800)  and sysindexes.groupid=1 AND SYSINDEXES.ROWCNT<=@ROWCNT
ORDER BY dbo.sysobjects.name, dbo.sysindexes.indid, dbo.sysindexkeys.keyno
set  @list=left(@list,len(@list)-1)
	begin
		set @strsql='drop index ['+@tbname+'].['+@indname+']'
		print @strsql
		IF @DEBUG=0
		BEGIN
			EXEC sp_executesql @strsql
		END
		set @strsql='CREATE  INDEX ['+@indname+'] ON [dbo].['+@tbname+']('+@list+') WITH  FILLFACTOR = 90 ON [SECONDARY]'--+convert(nvarchar(5),@fill)+' ON [SECONDARY]'
		print @strsql
		IF @DEBUG=0
		BEGIN
			exec sp_executesql @strsql
		END
	end
fetch next from curs1 into @id,@tbname,@indid,@indname,@fill,@group
end
close curs1
deallocate curs1


