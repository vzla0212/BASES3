alter system FLUSH BUFFER_CACHE;

select 0 as c_count, ((select count(*) from customer) -(select count(distinct(o_custkey))from orders)) as custdist from dual
union
(select  C_COUNT, count(*) as CUSTDIST 
from (select O_custkey, count(O_ORDERKEY) as C_COUNT 
      from ORDERS 
      group by O_CUSTKEY) C_ORDERS 
group by C_COUNT)
 order by CUSTDIST desc;
