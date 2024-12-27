

-- Source data to process
WITH source_data AS (
    SELECT * 
    FROM "DBT_DEMO"."STAGING"."dbt_data"
)

-- Main query for incremental load
SELECT id,name,amount,updated_at
FROM source_data

-- Add a filter for incremental runs

WHERE updated_at > (SELECT MAX(updated_at) FROM "DBT_DEMO"."STAGING"."stg_dbtdata")
