

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

