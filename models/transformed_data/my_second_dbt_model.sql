
-- Use the `ref` function to select from other models
{{ config(schema='transformed_data') }}
select CNTC.ID_PERS, 
       CNTC.LB_NOM,
       SUM(CONT.VA_CONT) AS VA_SUM_CONT
from {{ ref('raw_contact') }} AS CNTC inner join {{ ref('raw_contract') }} AS CONT
on CNTC.ID_PERS = CONT.ID_PERS
where CNTC.ID_PERS is not null and CONT.ID_CONT is not null
GROUP BY CNTC.ID_PERS,CNTC.LB_NOM