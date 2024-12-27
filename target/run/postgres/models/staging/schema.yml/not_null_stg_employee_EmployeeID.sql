select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select EmployeeID
from "DBT_DEMO"."STAGING"."stg_employee"
where EmployeeID is null



      
    ) dbt_internal_test