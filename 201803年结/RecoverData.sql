
restore database qwer_2018nj
from disk = 'D:\�ɶ�����������޹�˾\����ҩҵ��\Backup\qwer_2018nj.bak' WITH REPLACE,		
move 'HdProject_Med_Data' to 'D:\�ɶ�����������޹�˾\����ҩҵ��\Data\qwer_2018nj.mdf',	--��Ҫ��ԭ��Ŀ��
move 'HdProject_Med_Log' to 'D:\�ɶ�����������޹�˾\����ҩҵ��\Data\qwer_2018nj_log.ldf'