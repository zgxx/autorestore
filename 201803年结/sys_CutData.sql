
/****** Object:  StoredProcedure [dbo].[sys_CutData]    Script Date: 03/16/2018 11:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=============================================
--�ض���ʽ���ݣ���ǰ�������sys_CreateHisData
--=============================================
ALTER PROCEDURE [dbo].[sys_CutData]
( 
	@dSale		datetime,
	@dOther		datetime,
	@dCut		datetime
)
AS  
SET NOCOUNT ON
----------------------------------------------------------------ɾ������BillIdx
delete from billidx 
where billtype in (32,33,34,35,40)
and billdate<@dSale
----------------------------------------------------------------ɾ������BillIdx
delete from billidx 
where billtype not in (32,33,34,35,40)
and billdate<@dOther
----------------------------------------------------------------ɾ����ϸ
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
delete from Gsp_InBill where refbillid not in (select billid from billidx) --hcr���gsp���̵���
delete from b_AdPriceHistory where adDate<@dOther
delete from PrintHis where PrintDate<@dOther
delete from YdBuyDetail where pcstate=1
----------------------------------------------------------------ɾ��his���������
delete from his_DaySale where billdate<@dCut
delete from his_DirSale where billdate<@dCut
delete from his_EmpSale where billdate<@dCut
delete from his_SupplySale where billdate<@dCut
delete from his_ClientSale where billdate<@dCut
RETURN  0

