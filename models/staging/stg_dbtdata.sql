{{
    config(
        materialized='incremental'
    )
}}

-- Source data to process
WITH source_data AS (
    SELECT * 
    FROM {{ source('postgres', 'dbt_data') }}
)

-- Main query for incremental load
SELECT id,name,amount,updated_at
FROM source_data

-- Add a filter for incremental runs
{% if is_incremental() %}
WHERE updated_at > (SELECT MAX(updated_at) FROM {{ this }})
{% endif %}
