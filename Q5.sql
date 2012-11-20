alter system FLUSH BUFFER_CACHE;

select N_NAME, sum(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) as REVENUE from CUSTOMER, ORDERS, LINEITEM, SUPPLIER, NATION, REGION where c_custkey = o_custkey and l_orderkey = o_orderkey and l_suppkey = s_suppkey and c_nationkey = s_nationkey and s_nationkey = n_nationkey and n_regionkey = r_regionkey and r_name = '&region' and o_orderdate >= '&date' and o_orderdate < add_months(TO_DATE('&&date'),12) group by n_name order by revenue desc;
