USE CDW_SAPP_D_BRANCH;


#1
SELECT card.*
FROM cdw_sapp_creditcard card
JOIN cdw_sapp_customer customer ON customer.CREDIT_CARD_NO = card.CREDIT_CARD_NO
WHERE customer.cust_zip = 22801/*?*/ AND card.month = 1  AND card.year = 2018
ORDER BY card.day desc; 



#2
SELECT SUM(transaction_value), COUNT(*)
FROM CDW_SAPP_CREDITCARD 
WHERE TRANSACTION_TYPE = 'education' 
GROUP BY TRANSACTION_TYPE;



#3
SELECT SUM(TRANSACTION_VALUE), COUNT(*)
FROM CDW_SAPP_CREDITCARD card
JOIN CDW_SAPP_BRANCH branch ON card.BRANCH_CODE = branch.BRANCH_CODE 
WHERE BRANCH_STATE = "IL";



#4

SELECT * 
FROM cdw_sapp_customer 
WHERE SSN = 123456100 
AND CREDIT_CARD_NO = 4210653310061055;



#5

UPDATE cdw_sapp_customer
SET CUST_STATE = 'MS'
WHERE SSN = 123456100 
AND CREDIT_CARD_NO = 4210653310061055;

Select * from cdw_sapp_customer where ssn = 123456100 and credit_card_no = 4210653310061055;


#6

SELECT SUM(TRANSACTION_VALUE)
FROM CDW_SAPP_CREDITCARD
WHERE MONTH = 6
AND YEAR = 2018
AND CUST_SSN = 123456100
AND CREDIT_CARD_NO = 4210653310061055;


#7

SELECT *
FROM  cdw_sapp_creditcard
WHERE str_to_date(CONCAT(month,'/', day, '/', year), '%m/%d/%Y')
BETWEEN str_to_date('06/01/2018', '%m/%d/%Y') AND str_to_date('10/01/2018', '%m/%d/%Y')
AND CUST_SSN =  123456100
AND CREDIT_CARD_NO = 4210653310061055
ORDER BY YEAR desc, MONTH desc, DAY desc;