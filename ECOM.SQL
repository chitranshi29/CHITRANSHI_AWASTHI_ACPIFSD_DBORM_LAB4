Drop database if exists ecommerce_dbms;
create database ecommerce_dbms;
use ecommerce_dbms;
drop table if exists supplier;
CREATE TABLE supplier (
    SUPP_ID int,
    SUPP_NAME varchar(50) NOT NULL,
    SUPP_CITY varchar(50) NOT NULL,
    SUPP_PHONE varchar(50) NOT NULL,
    PRIMARY KEY (SUPP_ID)
);
select * from ecommerce_dbms.supplier;
