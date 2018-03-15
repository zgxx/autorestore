DECLARE @TES INT
SELECT @TES = 1 from master..HdAccount WHERE accountdb LIKE '%2018nj%'	--先判断是否已经有此数据库
IF @TES = 1 BEGIN 
		SELECT '已经存在了包含2018nj的数据库名，请勿重复执行'
  RETURN   --如果条件不存在退出执行SQL
END

--利用游标清理qwer_2018nj已有连接
	DECLARE @dbname varchar(50)  
	set @dbname='qwer_2018nj' 
	declare @sql varchar(50)
	declare cs_result cursor local for select 'kill '+cast(spid as varchar(50)) from master..sysprocesses where db_name(dbid)=@dbname 
	open cs_result
	fetch next from cs_result into @sql
	while @@fetch_status=0
	begin
		execute(@sql)
		fetch next from cs_result into @sql
	end
	close cs_result
	deallocate cs_result

--DROP DATABASE qwer_2018nj 	--DROP掉原来的qwer_2018nj数据库 

restore database qwer_2018nj
from disk = 'D:\成都海翔软件有限公司\海翔药业版\Backup\qwer_2018nj.bak' WITH REPLACE,		
move 'HdProject_Med_Data' to 'D:\成都海翔软件有限公司\海翔药业版\Data\qwer_2018nj.mdf',	--需要还原的目标
move 'HdProject_Med_Log' to 'D:\成都海翔软件有限公司\海翔药业版\Data\qwer_2018nj_log.ldf'


INSERT INTO master..HdAccount (accountname,accountdb,tag) VALUES('20180315年结_qwer','qwer_2018nj',10)