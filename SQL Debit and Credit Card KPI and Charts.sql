USE abc;
SELECT * FROM abc.`debit and credit banking_data1`;
SHOW COLUMNS FROM `debit and credit banking_data1`;

# 1. Total Transactions
SELECT COUNT(*) AS Total_Transactions
FROM `debit and credit banking_data1`;

# 2. Total Credit Amount
SELECT SUM(Amount) AS Total_Credit
FROM `debit and credit banking_data1`
WHERE `Transaction Type` = 'Credit';

# 3. Total Debit Amount
SELECT SUM(Amount) AS Total_Debit
FROM `debit and credit banking_data1`
WHERE `Transaction Type` = 'Debit';

# 4. Net Transaction Amount
SELECT
SUM(CASE
    WHEN `Transaction Type`='Credit' THEN Amount
    WHEN `Transaction Type`='Debit' THEN -Amount
END) AS Net_Amount
FROM `debit and credit banking_data1`;

# 5. Total Customers
SELECT COUNT(DISTINCT `Customer ID`) AS Total_Customers
FROM `debit and credit banking_data1`;


# 6.Credit % and Debit %
SELECT
    ROUND(
        SUM(CASE WHEN `Transaction Type`='Credit' THEN Amount ELSE 0 END)
        *100/SUM(Amount),2
    ) AS Credit_Percentage,

    ROUND(
        SUM(CASE WHEN `Transaction Type`='Debit' THEN Amount ELSE 0 END)
        *100/SUM(Amount),2
    ) AS Debit_Percentage
FROM `debit and credit banking_data1`;


#  7. Account Activity Ratio
SELECT
    ROUND(
        COUNT(*) / COUNT(DISTINCT `Account Number`),
        2
    ) AS Avg_Transactions_Per_Account
FROM `debit and credit banking_data1`;


# 8. Total Transaction Amount by Branch
SELECT
    Branch,
    ROUND(SUM(Amount), 2) AS Total_Transaction_Amount
FROM `debit and credit banking_data1`
GROUP BY Branch
ORDER BY Total_Transaction_Amount DESC;

# 9.Month-wise Credit and Debit Amount
SELECT
    DATE_FORMAT(`Transaction Date`, '%Y-%m') AS Month,
    ROUND(SUM(CASE WHEN `Transaction Type`='Credit' THEN Amount ELSE 0 END), 2) AS Total_Credit,
    ROUND(SUM(CASE WHEN `Transaction Type`='Debit' THEN Amount ELSE 0 END), 2) AS Total_Debit
FROM `debit and credit banking_data1`
GROUP BY DATE_FORMAT(`Transaction Date`, '%Y-%m')
ORDER BY Month;


# CHARTS
# 1. Total Transaction Amount by Branch
SELECT
    Branch,
    ROUND(SUM(Amount),2) AS Total_Amount
FROM `debit and credit banking_data1`
GROUP BY Branch
ORDER BY Total_Amount DESC;

# 2. Credit vs Debit Amount
SELECT
    `Transaction Type`,
    ROUND(SUM(Amount),2) AS Total_Amount
FROM `debit and credit banking_data1`
GROUP BY `Transaction Type`;

# 3. Monthly Transaction Trend
SELECT
    DATE_FORMAT(`Transaction Date`,'%Y-%m') AS Month,
    ROUND(SUM(Amount),2) AS Total_Amount
FROM `debit and credit banking_data1`
GROUP BY DATE_FORMAT(`Transaction Date`,'%Y-%m')
ORDER BY Month;

# 4.Transaction Method Distribution
SELECT
    `Transaction Method`,
    COUNT(*) AS Total_Transactions
FROM `debit and credit banking_data1`
GROUP BY `Transaction Method`;

# 5.Top 10 Customers by Transaction Amount 
SELECT
    `Customer ID`,
    ROUND(SUM(Amount),2) AS Total_Amount
FROM `debit and credit banking_data1`
GROUP BY `Customer ID`
ORDER BY Total_Amount DESC
LIMIT 10;

# 6.Credit vs Debit Ratio by Branch
SELECT
    Branch,
    ROUND(
        SUM(CASE WHEN `Transaction Type` = 'Credit' THEN Amount ELSE 0 END) /
        NULLIF(SUM(CASE WHEN `Transaction Type` = 'Debit' THEN Amount ELSE 0 END), 0),
        2
    ) AS Credit_Debit_Ratio
FROM `debit and credit banking_data1`
GROUP BY Branch
ORDER BY Credit_Debit_Ratio DESC;

# 7.Account Activity Ratio by Branch
SELECT
    Branch,
    ROUND(
        COUNT(*) / COUNT(DISTINCT `Account Number`),
        2
    ) AS Avg_Transactions_Per_Account
FROM `debit and credit banking_data1`
GROUP BY Branch
ORDER BY Avg_Transactions_Per_Account DESC;