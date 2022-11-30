/*9)to display supplier id, name, rating and Type_of_Service. 
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