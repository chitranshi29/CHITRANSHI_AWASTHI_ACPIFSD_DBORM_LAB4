
drop table if exists supplier; /*drop the supplier table  if already exist*/
/*create the supplier table  */
CREATE TABLE supplier ( 
    SUPP_ID int,
    SUPP_NAME varchar(50) NOT NULL,
    SUPP_CITY varchar(50) NOT NULL,
    SUPP_PHONE varchar(50) NOT NULL,
    PRIMARY KEY (SUPP_ID)
);
select * from ecommerce_dbms.supplier; /* you can see schema for supplier table*/
drop table if exists customer; /*drop the customer table  if already exist*/
/*create the customer table  */
CREATE TABLE customer (
    CUS_ID int,
    CUS_NAME varchar(50) NOT NULL,
    CUS_PHONE varchar(50) NOT NULL,
    CUS_CITY	VARCHAR(30) NOT NULL,
    CUS_GENDER	CHAR,
    PRIMARY KEY (CUS_ID)
);
select * from ecommerce_dbms.customer; /* you can see schema for customer table*/
drop table if exists category; /*drop the category table  if already exist*/
/*create the category table  */
CREATE TABLE category (
CAT_ID int,
CAT_NAME VARCHAR(20) NOT NULL,
PRIMARY KEY (CAT_ID)
);
select * from ecommerce_dbms.category; /* you can see schema for category table*/
drop table if exists product; /*drop the product table  if already exist*/
/*create the category table  */
CREATE TABLE product (
PRO_ID int primary key,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
PRO_DESC VARCHAR(60),
cat_id int,
FOREIGN KEY (CAT_ID) REFERENCES category(CAT_ID)
);
select * from ecommerce_dbms.product;/* you can see schema for product table*/
drop table if exists supplier_pricing; /*drop the supplier_pricing table  if already exist*/
/*create the supplier_pricing table  */
CREATE TABLE supplier_pricing (
PRICING_ID int primary key,
pro_id int,
supp_id int,
FOREIGN KEY (pro_id) REFERENCES product(pro_ID),
FOREIGN KEY (supp_id) REFERENCES supplier(supp_id),
SUPP_PRICE	INT DEFAULT 0
);
select * from ecommerce_dbms.supplier_pricing;/* you can see schema for supplier_pricing table*/
drop table if exists `Order`; /*drop the Order table  if already exist*/
/*create the Order table  */
CREATE TABLE `Order`(ORD_ID INT primary key,
ORD_AMOUNT INT not null,
ORD_DATE DATE NOT NULL,
CUS_ID int,
PRICING_ID int,
FOREIGN KEY (CUS_ID) REFERENCES customer(CUS_ID),
FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing(PRICING_ID) );
select * from ecommerce_dbms.Order; /* you can see schema for Order table*/
drop table if exists rating; /*drop the rating table  if already exist*/
/*create the rating table  */
CREATE TABLE rating (
RAT_ID INT primary key,
ORD_ID INT,
FOREIGN KEY (ORD_ID) REFERENCES `order`(ORD_ID),
RAT_RATSTARS INT NOT NULL
);
select * from ecommerce_dbms.rating; /* you can see schema for rating table*/
