use gold_db
GO

CREATE OR ALTER PROC CreateServerlessSqlView_gold @viewname NVARCHAR(100)
AS
BEGIN

DECLARE @statement VARCHAR(max)
  SET @statement =N'CREATE OR ALTER VIEW '+@viewname+' AS
   SELECT *
   FROM
        OPENROWSET(
        BULK ''https://tharungen2.dfs.core.windows.net/gold/hfpms/'+@viewname+'/'',
        FORMAT = ''DELTA''
        ) as [result]
    '    
EXEC (@statement)
END 
GO