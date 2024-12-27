
      insert into "DBT_DEMO"."STAGING"."stg_dbtdata" ("id", "name", "amount", "updated_at")
    (
        select "id", "name", "amount", "updated_at"
        from "stg_dbtdata__dbt_tmp183635974920"
    )


  