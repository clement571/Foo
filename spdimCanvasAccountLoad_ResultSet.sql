EXECUTE dbo.spdimCanvasAccountLoad
WITH RESULT SETS ((
        CanvasSurrogateId bigint NOT NULL,
	CanvasAccountID bigint NULL,
	CanvasAccountName varchar(100) NULL,
	Accountdepth bigint NULL,
	AccountWorkflowState varchar(50) NULL,
	ParentAccountName varchar(50) NULL,
	ParentAccountID bigint NULL,
	GrandParentAccountName varchar(50) NULL,
	GrandParentAccountID bigint NULL,
	RootAccountName varchar(50) NULL,
	RootAccountID bigint NULL,
	SubAccount1Name varchar(50) NULL,
	SubAccount1ID bigint NULL,
	SubAccount2Name varchar(100) NULL,
	SubAccount2ID bigint NULL,
	SubAccount3Name varchar(50) NULL,
	SubAccount3ID bigint NULL,
	SISSourceID varchar(50) NULL,
	SourceSystem varchar(50) NULL,
	SourceHashValue VARCHAR(255) NULL
));
