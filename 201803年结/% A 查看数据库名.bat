@echo off
::ECHO ��鱾���Ƿ�Ϊ������
:YES
tasklist |findstr /i "HdSvr.exe"
if %errorlevel%==0 (goto 1) else (goto 2)

:1
for /l %%i in (1,1,3) do echo.
::�رմ��乤��
taskkill /f /im  HdAutoTran.exe

echo �ؽ��ļ���D:\TempFolderZGX
rd /s /q "D:\TempFolderZGX"
md D:\TempFolderZGX

echo �ؽ��ļ���AutoUpDir
rd /s /q "D:\�ɶ�����������޹�˾\����ҩҵ��\AutoUpDir"
md "D:\�ɶ�����������޹�˾\����ҩҵ��\AutoUpDir"

rd /s /q "D:\�ɶ�����������޹�˾\����ҩҵ��\SQL"
rd /s /q "D:\�ɶ�����������޹�˾\����ҩҵ��\PreUpdate"
md "D:\�ɶ�����������޹�˾\����ҩҵ��\PreUpdate"

ECHO ���ƽű�����ʽ��
copy /y *.sql D:\TempFolderZGX\
copy /y WinRAR.exe D:\TempFolderZGX\
copy /y *.rar D:\TempFolderZGX\

ECHO ��ѹģʽ,e�������ļ��У�-o+���ǣ�-o-����
D:\TempFolderZGX\WinRAR.exe e -o+ D:\TempFolderZGX\2018nj.rar D:\TempFolderZGX\

ECHO ���ýű������������ݿ�����
::-U ���ݿ��½����-P ���룬�������޸�
osql -S 127.0.0.1 -d Master -U sa -P Hx789789 -i D:\TempFolderZGX\AutoEXC_name.sql

::start D:\TempFolderZGX

@echo ------------���Ҳ����ݿ���----------- >>D:\�ɶ�����������޹�˾\�������ݿ���.txt

start D:\�ɶ�����������޹�˾\�������ݿ���.txt

Exit

:2
for /l %%i in (1,1,3) do echo.
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo                   �������Ƿ�����
echo                 ��Ҫ�ڷ�����������
echo                 ָ���м��ܹ��ĵ���
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
pause
goto YES

