CREATE TABLESPACE proyectots DATAFILE '/tablespace/demeter/demeter/proyectots01.dbf' SIZE 2048M  EXTENT MANAGEMENT LOCAL UNIFORM SIZE 128K;

CREATE TABLE REGION (
       R_REGIONKEY  NUMBER(6) NOT NULL, 
       R_NAME       CHAR(25) NOT NULL, 
       R_COMMENT    VARCHAR(152) NOT NULL,
       CONSTRAINT PK_REGION PRIMARY KEY (R_REGIONKEY))
       TABLESPACE proyectots;       

CREATE TABLE NATION (
       N_NATIONKEY  NUMBER(6) NOT NULL,
       N_NAME       CHAR(25) NOT NULL,
       N_REGIONKEY  NUMBER(6) NOT NULL,
       N_COMMENT    VARCHAR(152) NOT NULL,
       CONSTRAINT PK_NATION PRIMARY KEY (N_NATIONKEY),
       FOREIGN KEY (N_REGIONKEY) REFERENCES REGION)
       TABLESPACE proyectots;       

CREATE TABLE PART(
       P_PARTKEY  NUMBER(6) NOT NULL,
       P_NAME  VARCHAR(55) NOT NULL,
       P_MFGR  CHAR(25) NOT NULL,
       P_BRAND CHAR(10) NOT NULL,
       P_TYPE  VARCHAR(25) NOT NULL,
       P_SIZE  NUMBER(6)  NOT NULL,
       P_CONTAINER CHAR(10) NOT NULL,
       P_RETAILPRICE NUMBER(7,2) NOT NULL,
       P_COMMENT  VARCHAR(23),
       CONSTRAINT PK_PART PRIMARY KEY (P_PARTKEY))
       TABLESPACE proyecto;
CREATE INDEX partt on PART(P_SIZE,P_TYPE,P_PARTKEY)
    TABLESPACE Proyectots;


CREATE TABLE SUPPLIER(
       S_SUPPKEY   NUMBER(6) NOT NULL,
       S_NAME      CHAR(25) NOT NULL,
       S_ADDRESS   VARCHAR(40) NOT NULL,
       S_NATIONKEY NUMBER(6) NOT NULL,
       S_PHONE     CHAR(15)   NOT NULL,
       S_ACCTBAL   NUMBER(7,2)  NOT NULL,
       S_COMMENT   VARCHAR(101),
       CONSTRAINT PK_SUPPLIER PRIMARY KEY (S_SUPPKEY),
       FOREIGN KEY (S_NATIONKEY) REFERENCES NATION)
       TABLESPACE proyecto;
CREATE INDEX supp ON SUPPLIER(S_SUPPKEY,S_NATIONKEY)
    TABLESPACE Proyectots;       


CREATE TABLE PARTSUPPLIER (
       PS_PARTKEY   NUMBER(6) NOT NULL,
       PS_SUPPKEY   NUMBER(6) NOT NULL,
       PS_AVAILQTY  NUMBER(4) NOT NULL,
       PS_SUPPCOST  NUMBER(7,2)  NOT NULL,
       PS_COMMENT   VARCHAR(199),
       CONSTRAINT PK_PARTSUPPLIER PRIMARY KEY (PS_PARTKEY,PS_SUPPKEY),
       FOREIGN KEY (PS_PARTKEY) REFERENCES PART,
       FOREIGN KEY (PS_SUPPKEY) REFERENCES SUPPLIER)
       TABLESPACE proyectots;
CREATE INDEX partsupp ON PARTSUPPLIER(PS_PARTKEY,PS_SUPPKEY,PS_SUPPCOST)
    TABLESPACE Proyectots;

CREATE TABLE CUSTOMER (
       C_CUSTKEY    NUMBER(6) NOT NULL,
       C_NAME       VARCHAR(25) NOT NULL,
       C_ADDRESS    VARCHAR(40) NOT NULL,
       C_NATIONKEY  NUMBER(6) NOT NULL,
       C_PHONE      CHAR(15) NOT NULL,
       C_ACCTBAL    NUMBER(7,2)  NOT NULL,
       C_MKTSEGMENT CHAR(10),
       C_COMMENT    VARCHAR(117),
       CONSTRAINT PK_CUSTOMER PRIMARY KEY (C_CUSTKEY),
       FOREIGN KEY (C_NATIONKEY) REFERENCES NATION)
       TABLESPACE proyectots;

CREATE TABLE ORDERS (
       O_ORDERKEY      NUMBER(10) NOT NULL,
       O_CUSTKEY       NUMBER(6) NOT NULL,
       O_ORDERSTATUS   CHAR(1) NOT NULL,
       O_TOTALPRICE    NUMBER(12,2)  NOT NULL,
       O_ORDERDATE     DATE,
       O_ORDERPRIORITY CHAR(15) NOT NULL,
       O_CLERK         CHAR(15) NOT NULL,
       O_SHIPPRIORITY  NUMBER(4),
       O_COMMENT       VARCHAR(79),
       CONSTRAINT PK_ORDERS PRIMARY KEY (O_ORDERKEY),
       FOREIGN KEY (O_CUSTKEY) REFERENCES CUSTOMER)
       TABLESPACE proyectots;
CREATE INDEX ords on ORDERS (O_CUSTKEY, O_ORDERDATE, O_SHIPPRIORITY)
    TABLESPACE Proyectots;

CREATE TABLE LINEITEM (
       L_ORDERKEY    NUMBER(10) NOT NULL,
       L_PARTKEY     NUMBER(6) NOT NULL,
       L_SUPPKEY     NUMBER(6) NOT NULL,
       L_LINENUMBER  NUMBER(6) NOT NULL,
       L_QUANTITY    NUMBER(12,2)  NOT NULL,
       L_EXTENDEDPRICE NUMBER(12,2)  NOT NULL,
       L_DISCOUNT    NUMBER(12,2)  NOT NULL,
       L_TAX         NUMBER(12,2)  NOT NULL,
       L_RETURNFLAG  CHAR(1) NOT NULL,
       L_LINESTATUS  CHAR(1) NOT NULL,
       L_SHIPDATE    DATE,
       L_COMMITDATE  DATE,
       L_RECEIPTDATE DATE,
       L_SHIPINSTRUCT CHAR(25),
       L_SHIPMODE     CHAR(10),
       L_COMMENT      VARCHAR(44),
       CONSTRAINT PK_LINEITEM PRIMARY KEY (L_ORDERKEY, L_LINENUMBER),
       FOREIGN KEY (L_PARTKEY, L_SUPPKEY) REFERENCES PARTSUPPLIER)
       TABLESPACE proyectots;
       
CREATE INDEX lineitem ON lineitem(L_ORDERKEY,L_PARTKEY,L_SUPPKEY,L_SHIPDATE,)
    TABLESPACE Proyectots;
