@echo off
::ECHO 检查本机是否为服务器
:YES
tasklist |findstr /i "HdSvr.exe"
if %errorlevel%==0 (goto 1) else (goto 2)

:1
for /l %%i in (1,1,3) do echo.
::关闭传输工具
taskkill /f /im  HdAutoTran.exe

echo 重建文件夹D:\TempFolderZGX
rd /s /q "D:\TempFolderZGX"
md D:\TempFolderZGX

echo 重建文件夹AutoUpDir
rd /s /q "D:\成都海翔软件有限公司\海翔药业版\AutoUpDir"
md "D:\成都海翔软件有限公司\海翔药业版\AutoUpDir"

rd /s /q "D:\成都海翔软件有限公司\海翔药业版\SQL"
rd /s /q "D:\成都海翔软件有限公司\海翔药业版\PreUpdate"
md "D:\成都海翔软件有限公司\海翔药业版\PreUpdate"

ECHO 复制脚本和样式库
copy /y *.sql D:\TempFolderZGX\
copy /y WinRAR.exe D:\TempFolderZGX\
copy /y *.rar D:\TempFolderZGX\

ECHO 解压模式,e不包含文件夹，-o+覆盖，-o-跳过
D:\TempFolderZGX\WinRAR.exe e -o+ D:\TempFolderZGX\2018nj.rar D:\TempFolderZGX\

ECHO 调用脚本导出海翔数据库名称
::-U 数据库登陆名，-P 密码，在下面修改
osql -S 127.0.0.1 -d Master -U sa -P Hx789789 -i D:\TempFolderZGX\AutoEXC_name.sql

::start D:\TempFolderZGX

@echo ------------看右侧数据库名----------- >>D:\成都海翔软件有限公司\海翔数据库名.txt

start D:\成都海翔软件有限公司\海翔数据库名.txt

Exit

:2
for /l %%i in (1,1,3) do echo.
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo                   本机不是服务器
echo                 需要在服务器上运行
echo                 指插有加密狗的电脑
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
pause
goto YES

