create database Bank_Marketing;
use Bank_Marketing;

-- Total Customers
select count(*) as total_customer
from bank_marketing.bank_cleaned;

-- Total Subscribers
select count(*) 
from bank_marketing.bank_cleaned
where deposit ='yes';

-- subscription rate
select round(
count(case when deposit ="yes" then 1 end)*100/count(*),2) as subscription_rate 
from bank_marketing.bank_cleaned;

-- Average balance
select round(avg(balance),2)
from bank_marketing.bank_cleaned;

-- customer Analysis

-- subscription by age group
select age_group,count(*) as total_customer,
sum( deposit='yes') as subscribers
from bank_marketing.bank_cleaned
group by age_group;

-- subscription by job
select job, count(*) as total_customer,
sum( deposit='yes') as subscribers
from bank_marketing.bank_cleaned
group by job
order by subscribers desc;

-- education analysis
select education, count(*) as total_customer,
sum( deposit='yes') as subscribers
from bank_marketing.bank_cleaned
group by education
order by subscribers desc;

-- marital status 
select marital,count(*) as total_customer,
sum( deposit='yes') as subscribers
from bank_marketing.bank_cleaned
group by marital
order by subscribers desc;

-- Housing Loan Analysis
select housing, count(*) as total_customer,
sum( deposit='yes') as subscribers
from bank_marketing.bank_cleaned
group by housing
order by subscribers desc;

-- personal loan
select loan, count(*) as total_customer,
sum( deposit='yes') as subscribers
from bank_marketing.bank_cleaned
group by loan
order by subscribers desc;

-- Campaign Analysis
 -- contact Method
 select contact, count(*) as total_customer,
sum( deposit='yes') as subscribers
from bank_marketing.bank_cleaned
group by contact
order by subscribers desc;

-- Month-wise Performance
select month, count(*) as total_customer,
sum( deposit='yes') as subscribers
from bank_marketing.bank_cleaned
group by month
order by subscribers desc;

-- Previous Campaign Outcome
select poutcome, count(*) as total_customer,
sum( deposit='yes') as subscribers
from bank_marketing.bank_cleaned
group by poutcome
order by subscribers desc;

-- Average call duration
select deposit,round(avg(duration),2)
from  bank_marketing.bank_cleaned
group by deposit;

-- Avg balance subscription
select deposit,round(avg(balance),2)
from  bank_marketing.bank_cleaned
group by deposit;
 
-- Top 5 Months by Average Call Duration
select month, round(avg(duration),2) as avg_duration
from bank_marketing.bank_cleaned
group by month
order by avg_duration
limit 5;

-- Top 5 Jobs with Highest Subscription Rate

select job, count(*) as total_customers,
sum(case when deposit ="yes" then 1 else 0 end) as subscribers,
round(sum(case when deposit ="yes" then 1 else 0 end)*100/count(*),2) as subscription_rate
from bank_marketing.bank_cleaned
group by job
order by subscription_rate desc
limit 5;

-- Best performing month
select month, count(*) as total_customers,
sum(case when deposit ="yes" then 1 else 0 end) as subscribers,
round(sum(case when deposit ="yes" then 1 else 0 end)*100/count(*),2) as conversion_rate
from bank_marketing.bank_cleaned
group by month
order by conversion_rate desc
limit 5;

-- Jobs with Highest Average Balance
select job, round(avg(balance),2) as avg_balance
from bank_marketing.bank_cleaned
group by job
order by avg_balance desc
limit 5;

-- Customers Without Any Loans Who Subscribed
select count(*) as customer_without_loans
from bank_marketing.bank_cleaned
where housing ="no" and loan ="no" and deposit="yes";

-- Top Customer Segment
select job,age_group, education,count(*) as subscribers
from bank_marketing.bank_cleaned
where deposit ="yes"
group by job,age_group, education
order by subscribers desc
limit 10;

