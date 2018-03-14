----总部年结时   不能选择   清除GSP单据
 
------年结后清除往来单位中的期初金额
update qwer..clients set artotal=0,artotal_ini=0,aptotal=0,aptotal_ini=0,pre_artotal=0,pre_artotal_ini=0,pre_aptotal=0,pre_aptotal_ini=0
update qwer..accountbalance set cur_total=0,ini_total=0
update qwer..account set ini_total=0,cur_total=0 where ini_total<>0 or cur_total<>0

delete qwer..gsp_inbill		--清除采购等收货验收记录
delete qwer..gspreport where  billtype in (6068,6174,6184)  
--分别删除一般养护，重点养护和近效期养护， 计算机操作数据失误更改申请表

--收缩数据库
DBCC SHRINKDATABASE(qwer)