
restore database qwer_2018nj
from disk = 'D:\成都海翔软件有限公司\海翔药业版\Backup\qwer_2018nj.bak' WITH REPLACE,		
move 'HdProject_Med_Data' to 'D:\成都海翔软件有限公司\海翔药业版\Data\qwer_2018nj.mdf',	--需要还原的目标
move 'HdProject_Med_Log' to 'D:\成都海翔软件有限公司\海翔药业版\Data\qwer_2018nj_log.ldf'