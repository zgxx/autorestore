echo off
echo 确定海翔历史数据结存已经做完，按空格键继续
echo .                                         .

pause >nul

echo 再度确定，按空格键继续
pause >nul


echo 开始收缩当前数据库
osql -S 127.0.0.1 -d master -U sa -P Hx789789 -i D:\TempFolderZGX\New_ShrinkDatabase.sql


rd /s /q "D:\TempFolderZGX"
start D:\成都海翔软件有限公司\海翔药业版\HdAutoTran.exe
exit