USE [TulaneDW]
GO
/****** Object:  StoredProcedure [dbo].[spdimCanvasAccountLoad]    Script Date: 9/25/2020 10:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spdimCanvasAccountLoad]
AS
--add this comment on 1/23/21
--edit on github 1/23/21
--edit another on github 1/23/21
WITH cteCanvasAccount AS (
	SELECT DISTINCT
	        CAST(account_dim.id as bigint) AS CanvasSurrogateId,
		CAST(account_dim.canvas_id as bigint) AS CanvasAccountID,
		account_dim.name AS CanvasAccountName,
		CAST(account_dim.depth as int) AS Accountdepth,
		account_dim.workflow_state AS AccountWorkflowState,
		account_dim.parent_account AS ParentAccountName,
		CAST(account_dim.parent_account_id as bigint) AS ParentAccountID,
		account_dim.grandparent_account AS GrandParentAccountName,
		CAST(account_dim.grandparent_account_id as bigint) AS GrandParentAccountID,
		account_dim.root_account AS RootAccountName,
		CAST(account_dim.root_account_id as bigint) AS RootAccountID,
		account_dim.subaccount1 AS SubAccount1Name,
		CAST(account_dim.subaccount1_id as bigint) AS SubAccount1ID,
		account_dim.subaccount2 AS SubAccount2Name,
		CAST(account_dim.subaccount2_id as bigint) AS SubAccount2ID,
		account_dim.subaccount3 AS SubAccount3Name,
		CAST(account_dim.subaccount3_id as bigint) AS SubAccount3ID,
		account_dim.sis_source_id AS SISSourceID,
	--	account_dim.IsCurrent,                                                                 
	    account_dim.SourceSystem 
	FROM TulaneStaging.Canvasdata.account_dim
	)
-- Natural Key Hash Value

SELECT 
     CanvasSurrogateId,
     CanvasAccountID,
	 CanvasAccountName,
	 Accountdepth,
	 AccountWorkflowState,
	 ParentAccountName,
	 ParentAccountID,
	 GrandParentAccountName,
	 GrandParentAccountID,
	 RootAccountName,
	 RootAccountID,
	 SubAccount1Name,
	 SubAccount1ID,
	 SubAccount2Name,
	 SubAccount2ID,
	 SubAccount3Name,
	 SubAccount3ID,
	 SISSourceID,                                                         
	 SourceSystem,
	CONVERT(VARCHAR(255),HASHBYTES('SHA2_512',
		ISNULL(UPPER(CAST(CanvasAccountID AS VARCHAR(255))),'DEFAULT') +
		ISNULL(UPPER(CAST(CanvasSurrogateId AS VARCHAR(255))),'DEFAULT' ) +	 
		ISNULL(UPPER(CAST(SourceSystem AS VARCHAR(255))),'DEFAULT' )
	),1) AS SourceHashValue
	
FROM cteCanvasAccount
