
--���ǰ����HdAccount��ָ���ĺ������ݿ⵽[D:\����ҩҵ��\Backup\]
DECLARE @HDdbnames VARCHAR(50)
DECLARE CURSOR_HDNAMES CURSOR 
	FOR 
	SELECT accountdb FROM master..HdAccount WHERE accountdb = 'qwer'
OPEN CURSOR_HDNAMES
	FETCH NEXT FROM CURSOR_HDNAMES INTO @HDdbnames
	WHILE @@FETCH_STATUS = 0
BEGIN
	DECLARE @filename varchar(500)
	SET @filename='D:\�ɶ�����������޹�˾\����ҩҵ��\Backup\'+@HDdbnames+'_'+'2018nj'+'.bak'  --���ñ����ļ���·�����ļ���
	print @filename
	backup database @HDdbnames to disk=@filename with NOINIT,NOUNLOAD,NAME='backup',NOSKIP,STATS=10,NOFORMAT--, compression --sql2000��֧��ѹ������
FETCH NEXT FROM CURSOR_HDNAMES INTO @HDdbnames
END
CLOSE CURSOR_HDNAMES
DEALLOCATE CURSOR_HDNAMES