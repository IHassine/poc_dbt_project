/*
Check if sells are negative while the sells is already paied
*/

select *
from {{ ref('my_second_dbt_model') }}
where id < 0