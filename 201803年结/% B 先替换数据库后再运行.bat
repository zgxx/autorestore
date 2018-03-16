@ECHO OFF

setlocal disabledelayedexpansion
echo 先用CTRL+H替换xztxzt为本店修正堂帐套数据库名才能执行本脚本
echo 按空格键继续
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

ECHO 复制脚本和样式库
copy /y *.sql D:\TempFolderZGX\

del /f /s /q New_*.sql

del /f /s /q D:\成都海翔软件有限公司\海翔药业版\Backup\xztxzt_2018nj.bak

echo 备份特定数据库
osql -S 127.0.0.1 -d master -U sa -P Hx789789 -i D:\TempFolderZGX\New_AutoBak_nj.sql

echo 还原刚刚备份的数据到xztxzt_2018nj，和插入hdaccount
osql -S 127.0.0.1 -d master -U sa -P Hx789789 -i D:\TempFolderZGX\New_RecoverData.sql

ECHO 释放压缩包，解压模式,e不包含文件夹，x 包含绝对路径解压，-o+覆盖，-o-跳过
D:\TempFolderZGX\WinRAR.exe x -o- 软件包.rar D:\成都海翔软件有限公司\

ECHO 将刚刚的备份打压缩包并删除
:: 开始调用winrar压缩备份减小90%体积,-tn10m代表压缩10分钟内的数据,-r 包含子文件夹，-m1快速模式，-m5高压模式，-df压缩后删除
D:\TempFolderZGX\WinRAR.exe a -agYYYY-MM-DD_HHMMSS -m1 -df -x*.txt -xAuto*.* -x*.rar -x*.log -x*.bat -x*.jpg -tn10m -ilog -ep1  D:\成都海翔软件有限公司\海翔药业版\Backup\海翔年结前backup.rar D:\成都海翔软件有限公司\海翔药业版\Backup\

::rd /s /q "D:\TempFolderZGX"

::start D:\TempFolderZGX

echo -----------------------------------------------
echo -----------------------------------------------
echo -----------------------------------------------
echo 如果没有错误，现在去海翔用管理员登陆历史数据结存
echo -----------------------------------------------
echo -----------------------------------------------
pause >nul