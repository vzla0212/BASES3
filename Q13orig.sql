alter system FLUSH BUFFER_CACHE;

select /*+ index(orders,O_CUST_ODATE_SHIPPRIOR)*/ C_COUNT, count(*) as CUSTDIST
from (select /*+ index(orders,O_CUST_ODATE_SHIPPRIOR)*/ C_CUSTKEY, count(O_ORDERKEY) as C_COUNT
from CUSTOMER left outer join ORDERS on
C_CUSTKEY=O_CUSTKEY
group by C_CUSTKEY)
C_ORDERS
group by
C_COUNT
order by
CUSTDIST desc, C_COUNT desc;
