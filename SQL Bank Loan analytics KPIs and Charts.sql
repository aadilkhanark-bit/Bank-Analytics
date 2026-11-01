use bank_analytics;
show tables;
select*from bank_data;
#KPIs
# TOTAL CUSTOMERS
select count(*) as Total_Customers from bank_data;

# TOTAL LOAN AMMOUNT
select sum(`Loan Amount`) as Total_Loan_Amount from bank_data;

# AVERAGE LOAN AMOUNT
select avg(`Loan Amount`) as Average_loan_Amount from bank_data;

# MAXIMUM LOAN AMOUNT
select max(`Loan Amount`) as maximum_Loan_Amount from bank_data;

# MINIMUM LOAN AMOUNT
select min(`Loan Amount`) as minimum_Loan_Amount from bank_data;

# TOTAL FUNDED AMOUNT
select sum(`Funded Amount`) as Total_Funded_Amount from bank_data;

# AVERAGE INTEREST RATE
select avg(`Int Rate`) as Average_Interest_Rate from bank_data;

# TOTAL PAYMENT 
select sum(`Total Payment`) as Total_Payment from bank_data;

# TOTAL FEES
select sum(`Total Fees`) as Total_fees from bank_data;

# AVERAGE CUSTOMER AGE
 select avg(`Age _T`) as Average_Age from bank_data;
 
 # TOTAL PRINCIPAL RECEIVED
 select sum(`Total Rec Prncp`) As Total_Principal_Received From Bank_data;
 
 # TOTAL INTEREST RECEIVED
 select sum(`Total Rrec int`) as Total_Interest_Received from bank_data;
 
 #Charts
 # STATE-WISE LOAN AMOUNT
 select `State Name`, sum(`Loan Amount`) as Total_Loan from bank_data
 Group by `State Name`
 Order by Total_Loan desc;
 
 # LOAN STATUS-WISE LOAN AMOUNT
 select `Loan Status`, sum(`Loan Amount`) as Total_Loan from bank_data
 group by `Loan Status`;
 
 # GRADE-WISE LOAN AMOUNT
 select Grade, sum(`Loan Amount`) as Total_Loan from bank_data
 group by Grade;
 
 # PURPOSE CATEGORY-WISE LOAN AMOUNT
 select `Purpose Category`, sum(`Loan Amount`) as Total_Loan from bank_data
 group by `Purpose Category`;

# VERIFICATION STATUS-WISE CUSTOMERS
select `Verification Status`, count(*) as Total_Customers from bank_data 
group by `Verification Status`;

# RELEGION-WISE CUSTOMERS
select Religion, count(*) as Total_Customers from bank_data
group by Religion;

# REGION-WISE LOAN AMOUNT
select `Region Name`, sum(`Loan Amount`) as Total_Loan from bank_data
group by `Region Name`;

# TERM-WISE LOAN AMOUNT
select Term, sum(`Loan Amount`) as Total_Loan from bank_data
group by Term;

#  TOP 10 HIGHEST LOAN AMOUNTS
select `BH Name`, `Loan Amount` from bank_data 
order by `Loan Amount` desc Limit 10;

# TOP 10 STATES BY LOAN AMOUNT
select `State Name`, sum(`Loan Amount`) as Total_Loan from bank_data
group by `State Name`
order by Total_Loan desc Limit 10;