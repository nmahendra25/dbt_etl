
  
    

  create  table "DBT_DEMO"."STAGING"."stg_test__dbt_tmp"
  
  
    as
  
  (
    with source_data as (

    select * from "DBT_DEMO"."STAGING"."test1"

)

SELECT 
  id,
  name,
  age,
  (metadata::json->'address'->>'city') AS city,
  (metadata::json->'address'->>'zip') AS zip,
  pref.value AS preference,
  CONCAT(id,'_',pref.value) as unique_key
FROM 
  source_data,
  LATERAL json_array_elements_text(metadata::json->'preferences') AS pref(value)
  );
  