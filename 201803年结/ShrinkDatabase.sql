----�ܲ����ʱ   ����ѡ��   ���GSP����
 
------�������������λ�е��ڳ����
update qwer..clients set artotal=0,artotal_ini=0,aptotal=0,aptotal_ini=0,pre_artotal=0,pre_artotal_ini=0,pre_aptotal=0,pre_aptotal_ini=0
update qwer..accountbalance set cur_total=0,ini_total=0
update qwer..account set ini_total=0,cur_total=0 where ini_total<>0 or cur_total<>0

delete qwer..gsp_inbill		--����ɹ����ջ����ռ�¼
delete qwer..gspreport where  billtype in (6068,6174,6184)  
--�ֱ�ɾ��һ���������ص������ͽ�Ч�������� �������������ʧ����������

--�������ݿ�
DBCC SHRINKDATABASE(qwer)