
--年结前备份HdAccount中指定的海翔数据库到[D:\海翔药业版\Backup\]
DECLARE @HDdbnames VARCHAR(50)
DECLARE CURSOR_HDNAMES CURSOR 
	FOR 
	SELECT accountdb FROM master..HdAccount WHERE accountdb = 'qwer'
OPEN CURSOR_HDNAMES
	FETCH NEXT FROM CURSOR_HDNAMES INTO @HDdbnames
	WHILE @@FETCH_STATUS = 0
BEGIN
	DECLARE @filename varchar(500)
	SET @filename='D:\成都海翔软件有限公司\海翔药业版\Backup\'+@HDdbnames+'_'+'2018nj'+'.bak'  --设置备份文件的路径和文件名
	print @filename
	backup database @HDdbnames to disk=@filename with NOINIT,NOUNLOAD,NAME='backup',NOSKIP,STATS=10,NOFORMAT--, compression --sql2000不支持压缩备份
FETCH NEXT FROM CURSOR_HDNAMES INTO @HDdbnames
END
CLOSE CURSOR_HDNAMES
DEALLOCATE CURSOR_HDNAMES