--����mdf��Ŀ¼
DECLARE @TES INT
SELECT @TES = 1 from master..HdAccount WHERE accountdb LIKE '%2018nj%'	--���ж��Ƿ��Ѿ��д����ݿ�
IF @TES = 1 BEGIN 
		SELECT '�Ѿ�������accountnameΪ2018�������ݿ⣬�����ظ�ִ��'
  RETURN   --��������������˳�ִ��SQL
END

	--�����α�����qwer_2018nj��������
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

	--DROP DATABASE qwer_2018nj 	--DROP��ԭ����qwer_2018nj���ݿ� 

	DECLARE @cmd1 varchar (512)		--����mdf
	SET @Cmd1=('master.dbo.xp_cmdshell '+'''xcopy D:\TempFolderZGX\'+'qwer_2018nj.mdf'+' D:\�ɶ�����������޹�˾\����ҩҵ��\Data\'+''+' /y/s'+'''')
	EXEC (@Cmd1)

	DECLARE  @cmd2 varchar (512)		--����log
	SET @Cmd2=('master.dbo.xp_cmdshell '+'''xcopy D:\TempFolderZGX\'+'qwer_2018nj_log.LDF'+' D:\�ɶ�����������޹�˾\����ҩҵ��\Data\'+''+' /y/s'+'''')
	EXEC (@Cmd2)

	EXEC sp_attach_db @dbname = 'qwer_2018nj',    --�ٸ�����qwer_2018nj
	@filename1 = 'D:\�ɶ�����������޹�˾\����ҩҵ��\Data\qwer_2018nj.mdf', 
	@filename2 = 'D:\�ɶ�����������޹�˾\����ҩҵ��\Data\qwer_2018nj_Log.ldf'

	INSERT INTO master..HdAccount (accountname,accountdb,tag) VALUES('20180315���_qwer','qwer_2018nj',10)