select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    EmployeeID as unique_field,
    count(*) as n_records

from "DBT_DEMO"."STAGING"."stg_employee"
where EmployeeID is not null
group by EmployeeID
having count(*) > 1



      
    ) dbt_internal_test