/*
Check if sells are negative while the sells is already paied
*/

select *
from {{ ref('my_second_dbt_model') }}
where VA_SUM_CONT < 0