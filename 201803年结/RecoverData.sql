DECLARE @TES INT
SELECT @TES = 1 from master..HdAccount WHERE accountdb LIKE '%2018nj%'	--���ж��Ƿ��Ѿ��д����ݿ�
IF @TES = 1 BEGIN 
		SELECT '�Ѿ������˰���2018nj�����ݿ����������ظ�ִ��'
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

restore database qwer_2018nj
from disk = 'D:\�ɶ�����������޹�˾\����ҩҵ��\Backup\qwer_2018nj.bak' WITH REPLACE,		
move 'HdProject_Med_Data' to 'D:\�ɶ�����������޹�˾\����ҩҵ��\Data\qwer_2018nj.mdf',	--��Ҫ��ԭ��Ŀ��
move 'HdProject_Med_Log' to 'D:\�ɶ�����������޹�˾\����ҩҵ��\Data\qwer_2018nj_log.ldf'


INSERT INTO master..HdAccount (accountname,accountdb,tag) VALUES('20180315���_qwer','qwer_2018nj',10)