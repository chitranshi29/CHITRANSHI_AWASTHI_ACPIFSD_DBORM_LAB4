/*3)Display the total number of customers based on gender who have placed orders of 
worth at least Rs.3000.*/ 
SELECT COUNT(CUS_GENDER) AS TOTAL_NUMBER_OF_CUSTOMER,CUS_GENDER FROM 
(SELECT DISTINCT O.CUS_ID,C.CUS_GENDER FROM CUSTOMER C
INNER JOIN `ORDER` O ON C.CUS_ID=O.CUS_ID
WHERE (O.ORD_AMOUNT) >= 3000) SUB
 GROUP BY CUS_GENDER;
