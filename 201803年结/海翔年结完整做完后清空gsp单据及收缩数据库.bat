echo off
echo ȷ��������ʷ���ݽ���Ѿ����꣬���ո������
echo .                                         .

pause >nul

echo �ٶ�ȷ�������ո������
pause >nul


echo ��ʼ������ǰ���ݿ�
osql -S 127.0.0.1 -d master -U sa -P Hx789789 -i D:\TempFolderZGX\New_ShrinkDatabase.sql


rd /s /q "D:\TempFolderZGX"
start D:\�ɶ�����������޹�˾\����ҩҵ��\HdAutoTran.exe
exit