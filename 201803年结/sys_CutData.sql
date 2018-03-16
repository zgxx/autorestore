
/****** Object:  StoredProcedure [dbo].[sys_CutData]    Script Date: 03/16/2018 11:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=============================================
--截断正式数据，此前必须调用sys_CreateHisData
--=============================================
ALTER PROCEDURE [dbo].[sys_CutData]
( 
	@dSale		datetime,
	@dOther		datetime,
	@dCut		datetime
)
AS  
SET NOCOUNT ON
----------------------------------------------------------------删除销售BillIdx
delete from billidx 
where billtype in (32,33,34,35,40)
and billdate<@dSale
----------------------------------------------------------------删除其他BillIdx
delete from billidx 
where billtype not in (32,33,34,35,40)
and billdate<@dOther
----------------------------------------------------------------删除明细
delete from b_productdetail where billid not in (select billid from billidx)
delete from b_finance where billid not in (select billid from billidx)
delete from b_settledetail where billid not in (select billid from billidx)
delete from b_AdPrice where billid not in (select billid from billidx)
delete from s_iostoredetail where billid not in (select billid from billidx)
delete from accountDetail where billid not in (select billid from billidx)
delete from b_RefDetail where billid not in (select billid from billidx)
delete from b_Psettle where billid not in (select billid from billidx)
delete from VIPDetail where billid not in (select billid from billidx) and BillID>0
delete from TmpRetail where billid not in (select billid from billidx)
delete from Gsp_InBill where refbillid not in (select billid from billidx) --hcr清除gsp流程单据
delete from b_AdPriceHistory where adDate<@dOther
delete from PrintHis where PrintDate<@dOther
delete from YdBuyDetail where pcstate=1
----------------------------------------------------------------删除his表相关数据
delete from his_DaySale where billdate<@dCut
delete from his_DirSale where billdate<@dCut
delete from his_EmpSale where billdate<@dCut
delete from his_SupplySale where billdate<@dCut
delete from his_ClientSale where billdate<@dCut
RETURN  0

