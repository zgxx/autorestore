@ECHO OFF

setlocal disabledelayedexpansion
echo ����CTRL+H�滻xztxztΪ�����������������ݿ�������ִ�б��ű�
echo ���ո������
pause >nul

set "old=qwer"
set "new=xztxzt"
(for /f "delims=" %%k in ('dir /a /b *.sql') do (
  for /f "delims=" %%a in ('findstr /n .* %%k') do (
  set var=%%a
  setlocal enabledelayedexpansion
  if "!var:*:=!"=="" (echo;) else (
    set var=!var:*:=!
    echo;!var:%old%=%new%!
  )
  endlocal
))>"New_%%k"
)

ECHO ���ƽű�����ʽ��
copy /y *.sql D:\TempFolderZGX\

del /f /s /q New_*.sql

del /f /s /q D:\�ɶ�����������޹�˾\����ҩҵ��\Backup\xztxzt_2018nj.bak

echo �����ض����ݿ�
osql -S 127.0.0.1 -d master -U sa -P Hx789789 -i D:\TempFolderZGX\New_AutoBak_nj.sql

echo ��ԭ�ոձ��ݵ����ݵ�xztxzt_2018nj���Ͳ���hdaccount
osql -S 127.0.0.1 -d master -U sa -P Hx789789 -i D:\TempFolderZGX\New_RecoverData.sql

ECHO �ͷ�ѹ��������ѹģʽ,e�������ļ��У�x ��������·����ѹ��-o+���ǣ�-o-����
D:\TempFolderZGX\WinRAR.exe x -o- �����.rar D:\�ɶ�����������޹�˾\

ECHO ���ոյı��ݴ�ѹ������ɾ��
:: ��ʼ����winrarѹ�����ݼ�С90%���,-tn10m����ѹ��10�����ڵ�����,-r �������ļ��У�-m1����ģʽ��-m5��ѹģʽ��-dfѹ����ɾ��
D:\TempFolderZGX\WinRAR.exe a -agYYYY-MM-DD_HHMMSS -m1 -df -x*.txt -xAuto*.* -x*.rar -x*.log -x*.bat -x*.jpg -tn10m -ilog -ep1  D:\�ɶ�����������޹�˾\����ҩҵ��\Backup\�������ǰbackup.rar D:\�ɶ�����������޹�˾\����ҩҵ��\Backup\

::rd /s /q "D:\TempFolderZGX"

::start D:\TempFolderZGX

echo -----------------------------------------------
echo -----------------------------------------------
echo -----------------------------------------------
echo ���û�д�������ȥ�����ù���Ա��½��ʷ���ݽ��
echo -----------------------------------------------
echo -----------------------------------------------
pause >nul