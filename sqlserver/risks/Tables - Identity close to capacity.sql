-- source http://dbpedias.com/blogs/michelle-ufford/identity-columns-are-you-nearing-the-limits/
/* Define how close we are to the value limit
   before we start throwing up the red flag.
   The higher the value, the closer to the limit. */
DECLARE @threshold DECIMAL(3,2) = .85;
 
/* Create a temp table */
CREATE TABLE #identityStatus
(
      database_name     VARCHAR(128)
    , table_name        VARCHAR(128)
    , column_name       VARCHAR(128)
    , data_type         VARCHAR(128)
    , last_value        BIGINT
    , max_value         BIGINT
);
 
/* Use an undocumented command to run a SQL statement
   in each database on a server */
EXECUTE sp_msforeachdb '
    Use ?;
    Insert Into #identityStatus
    Select ''?'' As [database_name]
        , Object_Name(id.object_id, DB_ID(''?'')) As [table_name]
        , id.name As [column_name]
        , t.name As [data_type]
        , Cast(id.last_value As bigint) As [last_value]
        , Case 
            When t.name = ''tinyint''   Then 255 
            When t.name = ''smallint''  Then 32767 
            When t.name = ''int''       Then 2147483647 
            When t.name = ''bigint''    Then 9223372036854775807
          End As [max_value]
    From sys.identity_columns As id
    Join sys.types As t
        On id.system_type_id = t.system_type_id
    Where id.last_value Is Not Null';
 
/* Retrieve our results and format it all prettily */
SELECT database_name
    , table_name
    , column_name
    , data_type
    , last_value
    , CASE 
        WHEN last_value < 0 THEN 100
        ELSE (1 - CAST(last_value AS FLOAT(4)) / max_value) * 100 
      END AS [percentLeft]
    , CASE 
        WHEN CAST(last_value AS FLOAT(4)) / max_value >= @threshold
            THEN 'warning: approaching max limit'
        ELSE 'okay'
        END AS [id_status]
FROM #identityStatus
ORDER BY percentLeft;
 
/* Clean up after ourselves */
DROP TABLE #identityStatus;
