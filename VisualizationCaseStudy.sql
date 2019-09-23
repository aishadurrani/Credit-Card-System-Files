# QUERY 1

# Find the top 20 zip codes(hint: branch_zip) by total transaction value

# Old SQL Version
SELECT BRANCH_ZIP, SUM(TRANSACTION_VALUE)
FROM CDW_SAPP_BRANCH branch
JOIN CDW_SAPP_CREDITCARD card ON card.BRANCH_CODE = branch.BRANCH_CODE
GROUP BY BRANCH_ZIP
ORDER BY  SUM(TRANSACTION_VALUE) DESC
LIMIT 20;



# New Hive Version 
SELECT branch.BRANCH_ZIP, SUM(card.TRANSACTION_VALUE) as total
FROM CDW_SAPP_D_BRANCH branch
JOIN CDW_SAPP_F_CREDITCARD card ON branch.BRANCH_CODE = card.BRANCH_CODE
GROUP BY branch.branch_zip
ORDER BY total DESC
LIMIT 20;




# QUERY 2

# Find total transaction value for each transaction type by Quarter in 2018
# Hint: Find quarter from 'credit card' table using month
# or use 'time' table if you already added transaction_id column there..



# Old SQL Version 
SELECT SUM(TRANSACTION_VALUE), TRANSACTION_TYPE, QUARTER(concat(year, '-', month, '-', day)) AS QUARTER
FROM CDW_SAPP_CREDITCARD
WHERE YEAR = 2018
GROUP BY QUARTER, TRANSACTION_TYPE;




# New Hive Version
SELECT TRANSACTION_TYPE, QUARTER, SUM(TRANSACTION_VALUE) AS TOTAL
FROM CDW_SAPP_F_CREDITCARD C
JOIN 
(SELECT DISTINCT * 
 FROM CDW_SAPP_D_TIME)
T ON T.TIMEID = C.TIMEID
WHERE YEAR = 2018
GROUP BY QUARTER, TRANSACTION_TYPE; 