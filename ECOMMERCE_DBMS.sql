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
drop table if exists customer;
CREATE TABLE customer (
    CUS_ID int,
    CUS_NAME varchar(50) NOT NULL,
    CUS_PHONE varchar(50) NOT NULL,
    CUS_CITY	VARCHAR(30) NOT NULL,
    CUS_GENDER	CHAR,
    PRIMARY KEY (CUS_ID)
);
select * from ecommerce_dbms.customer;
drop table if exists category;
CREATE TABLE category (
CAT_ID int,
CAT_NAME VARCHAR(20) NOT NULL,
PRIMARY KEY (CAT_ID)
);
select * from ecommerce_dbms.category;
drop table if exists product;
CREATE TABLE product (
PRO_ID int primary key,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
PRO_DESC VARCHAR(60),
cat_id int,
FOREIGN KEY (CAT_ID) REFERENCES category(CAT_ID)
);
select * from ecommerce_dbms.product;
drop table if exists supplier_pricing;
CREATE TABLE supplier_pricing (
PRICING_ID int primary key,
pro_id int,
supp_id int,
FOREIGN KEY (pro_id) REFERENCES product(pro_ID),
FOREIGN KEY (supp_id) REFERENCES supplier(supp_id),
SUPP_PRICE	INT DEFAULT 0
);
select * from ecommerce_dbms.supplier_pricing;
drop table if exists `Order`;
CREATE TABLE `Order`(ORD_ID INT primary key,
ORD_AMOUNT INT not null,
ORD_DATE DATE NOT NULL,
CUS_ID int,
PRICING_ID int,
FOREIGN KEY (CUS_ID) REFERENCES customer(CUS_ID),
FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing(PRICING_ID) );
select * from ecommerce_dbms.Order;
drop table if exists rating;
CREATE TABLE rating (
RAT_ID INT primary key,
ORD_ID INT,
FOREIGN KEY (ORD_ID) REFERENCES `order`(ORD_ID),
RAT_RATSTARS INT NOT NULL
);
select * from ecommerce_dbms.rating;
insert into Supplier values(1,'Rajesh Retails','Delhi',1234567890);
insert into Supplier values(2,'Appario Ltd','Mumbai',2589631470);
insert into Supplier values(3,'Knome products','Banglore',9785462315);
insert into Supplier values(4,'Bansal Retails','Kochi',	8975463285);
insert into Supplier values(5,'Mittal Ltd.','Lucknow',7898456532);
select * from ecommerce_dbms.Supplier;
insert into Customer  values(1,'AAKASH',9999999999,'DELHI','M');
insert into Customer  values(2,'AMAN',9785463215,'NOIDA','M');
insert into Customer  values(3,'NEHA',9999999999,'MUMBAI','F');
insert into Customer  values(4,'MEGHA',9994562399,'KOLKATA','F');
insert into Customer  values(5,'PULKIT',7895999999,'LUCKNOW','M');
/*INSERT NEW ROWS IN CUSTOMER WE CAN UPDATE FOREIGN KEY CONSTRAINTS IN ORDER TABLE */
/*insert into Customer  values(6,'AMIR',9998999999,'KANPUR','M');
insert into Customer  values(7,'AMITA',7896999999,'HAMIRPUR','F');
insert into Customer  values(8,'PUNIT',7895999999,'PATNA','M');
insert into Customer  values(9,'ANKITA',7895999999,'JAIPUR','F');
insert into Customer  values(10,'PARVESH',7895999999,'NANITAL','M');
insert into Customer  values(11,'PIYUSH',7895999999,'AGRA','M');
insert into Customer  values(12,'PARAM',7895999999,'NASIK','M');
insert into Customer  values(13,'SITA',7895999999,'INDORE','F');
insert into Customer  values(14,'ROHAN',7895999999,'NAGPUR','M');
insert into Customer  values(15,'MEERA',7895999999,'NOIDA','F');
insert into Customer  values(16,'SURESH',7895999999,'PALAMPUR','M');*/
select * from ecommerce_dbms.Customer;
insert into Category values(1,'BOOKS');
insert into Category values(2,'GAMES');
insert into Category values(3,'GROCERIES');
insert into Category values(4,'ELECTRONICS');
insert into Category values(5,'CLOTHES');
select * from ecommerce_dbms.Category;
Insert into Product  values(1,'GTA V','Windows 7 and above with i5 processor and 8GB RAM',2);
insert into Product values(2,'TSHIRT','SIZE-L with Black, Blue and White variations',5);
insert into Product values(3,'ROG LAPTOP','Windows 10 with 15inch screen, i7 processor 1TB SSD',4);
insert into Product values(4,'OATS','Highly Nutritious from Nestle',3);
insert into Product values(5,'HARRY POTTER','Best Collection of all time by J.K Rowling',1);
insert into Product values(6,'MILK','1L Toned MIlk',3);
insert into Product values(7,'Boat Earphones','1.5Meter long Dolby Atmos',4);
insert into Product values(8,'Jeans','Stretchable Denim Jeans with various sizes and color',5);
insert into Product values(9,'Project IGI','compatible with windows 7 and above',2);
insert into Product values(10,'Hoodie','Black GUCCI for 13 yrs and above',5);		
insert into Product values(11,'Rich Dad Poor Dad','Written by RObert Kiyosaki',1);	
insert into Product values(12,'Train Your Brain','By Shireen Stephen',1);	
select * from ecommerce_dbms.Product;
INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);
select * from ecommerce_dbms.Supplier_pricing;
/* ADD COLUMN VALUES WHICH IS NOT GIVEN IN DOCUMENT*/
Insert into `ORDER` values(101,1500,'2021-10-06',2,1);
insert into `ORDER`  values(102,1000,'2021-10-12',3,5);
insert into `ORDER` values(103,30000,'2021-09-16',5,2);
insert into `ORDER`  values(104,1500,'2021-10-05',1,1);
insert into `ORDER`  values(105,3000,'2021-08-16',4,3);
insert into `ORDER`  values(106,1450,'2021-08-18',1,9);
insert into `ORDER`  values(107,789,'2021-09-01',3,7);
insert into `ORDER`  values(108,780,'2021-09-07',5,6);
insert into `ORDER`  values(109,3000,'2021-00-10',5,3);
insert into `ORDER`  values(110,2500,'2021-09-10',2,4);
insert into `ORDER`  values(111,1000,'2021-09-15',4,5);
insert into `ORDER`  values(112,789,'2021-09-16',4,7);
insert into `ORDER`  values(113,31000,'2021-09-16',1,8);
insert into `ORDER`  values(114,1000,'2021-09-16',3,5);
insert into `ORDER`  values(115,3000,'2021-09-16',5,3);
insert into `ORDER`  values(116,99,'2021-09-17',2,14);
select * from ecommerce_dbms.`ORDER`;
insert into Rating values(1,101,4);
insert into Rating values(2,102,3);
insert into Rating values(3,103,1);
insert into Rating values(4,104,2);
insert into Rating values(5,105,4);
insert into Rating values(6,106,3);
insert into Rating values(7,107,4);
insert into Rating values(8,108,4);
insert into Rating values(9,109,3);
insert into Rating values(10,110,5);
insert into Rating values(11,111,3);
insert into Rating values(12,112,4);
insert into Rating values(13,113,2);
insert into Rating values(14,114,1);
insert into Rating values(15,115,1);
insert into Rating values(16,116,0);

/*3)Display the total number of customers based on gender who have placed orders of 
worth at least Rs.3000.*/ 
SELECT COUNT(CUS_GENDER) AS TOTAL_NUMBER_OF_CUSTOMER,CUS_GENDER FROM 
(SELECT DISTINCT O.CUS_ID,C.CUS_GENDER FROM CUSTOMER C
INNER JOIN `ORDER` O ON C.CUS_ID=O.CUS_ID
WHERE (O.ORD_AMOUNT) >= 3000) SUB
 GROUP BY CUS_GENDER;

/*4)	Display all the orders along with product name ordered by a customer having Customer_Id=2*/
SELECT ORD_ID ,ORD_AMOUNT,	ORD_DATE, o.CUS_ID,	o.PRICING_ID ,PRO_NAME FROM CUSTOMER C 
INNER JOIN `ORDER` O ON C.CUS_ID= O.CUS_ID 
INNER JOIN SUPPLIER_PRICING S ON O.PRICING_ID=S.PRICING_ID
INNER JOIN PRODUCT AS P ON S.PRO_ID=P.PRO_ID
WHERE C.CUS_ID=2;

/*5)	Display the Supplier details who can supply more than one product. */
SELECT S.SUPP_ID,S.SUPP_NAME,S.SUPP_CITY,S.SUPP_PHONE FROM SUPPLIER S INNER JOIN
(SELECT DISTINCT COUNT(PRO_ID),SUPP_ID FROM Supplier_pricing GROUP BY SUPP_ID HAVING COUNT(PRO_ID)>1 )
 AS M ON S.SUPP_ID=M.SUPP_ID;
  
/*8)	Display customer name and gender whose names start or end with character 'A'.*/
select cus_name , cus_gender from customer where cus_name like 'A%' or cus_name like '%A';

/*7)	Display the Id and Name of the Product ordered after “2021-10-05”. */

SELECT p.PRO_ID , PRO_NAME FROM CUSTOMER C 
INNER JOIN `ORDER` O ON C.CUS_ID= O.CUS_ID 
INNER JOIN SUPPLIER_PRICING S ON O.PRICING_ID=S.PRICING_ID
INNER JOIN PRODUCT AS P ON S.PRO_ID=P.PRO_ID
WHERE O.ORD_DATE>'2021-10-05';

/*6)	Find the least expensive product from each category 
and print the table with category id, name, product name and price of the product */

SELECT CAT_ID, CAT_NAME, PRO_ID, PRO_NAME FROM
(select DISTINCT CAT_ID, MIN(SUPP), PRO_NAME, CAT_NAME, PRO_ID from
(select p.cat_id ,sp.pro_id, min(sp.supp_price) as SUPP, p.pro_name, ct.cat_name
from supplier_pricing sp
left join product p on sp.pro_id = p.pro_id
left join category ct on p.cat_id = ct.cat_id
group by p.pro_name
ORDER BY CT.CAT_NAME, SUPP) as table1
GROUP BY CAT_ID) AS TABLE2;

/*to display supplier id, name, rating and Type_of_Service. 
For Type_of_Service, If rating =5, print “Excellent Service”,
If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.*/
DELIMITER //
CREATE PROCEDURE avg_rating_type_of_service()
BEGIN
    SELECT S1.SUPP_ID, S1.SUPP_NAME,avg(RAT_RATSTARS) as avg_rating,
       CASE WHEN RAT_RATSTARS=5 THEN 'Excellent Service'
            WHEN RAT_RATSTARS>4 THEN 'Good Service'
            WHEN RAT_RATSTARS>2 THEN 'Average Service' 
            ELSE 'Poor Service'
END AS Type_of_Service
FROM Rating R
INNER JOIN `ORDER` AS O ON R.ORD_ID=O.ORD_ID
INNER JOIN Supplier_pricing AS S ON O.PRICING_ID=S.PRICING_ID
INNER JOIN Supplier AS S1 ON S1.SUPP_ID=S.SUPP_ID
group by s.SUPP_ID;
END //
DELIMITER ;
CALL avg_rating_type_of_service();