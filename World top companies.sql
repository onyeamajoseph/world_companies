SELECT * FROM largest_companies.companies_ranked_by_pe_ratio;

WITH duplicates AS (
  SELECT Ranks,
         ROW_NUMBER() OVER (PARTITION BY namess, symbol, pe_ratio_ttm, price_gbp, country ORDER BY Ranks) AS rn
  FROM companies_ranked_by_pe_ratio
)
DELETE FROM companies_ranked_by_pe_ratio
WHERE Ranks IN (
  SELECT Ranks FROM duplicates WHERE rn > 1
);

select * from companies_ranked_by_pe_ratio;

select * from companies_ranked_by_pe_ratio
order by Ranks asc;

WITH duplicates AS (
  SELECT Ranks,
         ROW_NUMBER() OVER (PARTITION BY namess, symbol, pe_ratio_ttm, price_gbp, country ORDER BY Ranks) AS rn
  FROM companies_ranked_by_pe_ratio
)
DELETE FROM companies_ranked_by_pe_ratio
WHERE Ranks IN (
  SELECT Ranks FROM duplicates WHERE rn > 1
);

CREATE TABLE companies_ranked_by_revenue (
    Ranks INT,
    namess VARCHAR(255),
    symbol VARCHAR(50),
    revenue_ttm FLOAT,
    price_gbp FLOAT,
    country VARCHAR(100)
);

select * from companies_ranked_by_revenue;

select * from companies_ranked_by_revenue;
select * from companies_ranked_by_pe_ratio;
select * from companies_ranked_by_market_cap;
select * from companies_ranked_by_earnings;
select * from companies_ranked_by_dividend_yield;

-- Companies with both highest revenue and profit -----

SELECT r.namess, r.revenue_ttm, p.earnings_ttm
FROM companies_ranked_by_revenue r
JOIN companies_ranked_by_earnings p ON r.namess = p.namess
ORDER BY r.revenue_ttm DESC,  p.earnings_ttm DESC
LIMIT 10;

-- Profit-to-revenue ratio for top companies by revenue --

SELECT r.namess, r.revenue_ttm, p.earnings_ttm, 
       (p.earnings_ttm /r.revenue_ttm ) AS Profit_Margin
FROM companies_ranked_by_revenue r
JOIN companies_ranked_by_earnings p ON r.namess = p.namess
ORDER BY r.revenue_ttm DESC
LIMIT 10;

-- Companies where profit > 20% of revenue -----
SELECT r.namess, r.revenue_ttm, p.earnings_ttm
FROM companies_ranked_by_revenue r
JOIN companies_ranked_by_earnings p ON r.namess = p.namess
WHERE p.earnings_ttm / r.revenue_ttm > 0.2;

-- How many companies in top 5 by revenue are also in top 5 by profit --
WITH TopRevenue AS (
    SELECT namess FROM companies_ranked_by_revenue ORDER BY revenue_ttm DESC LIMIT 100
),
TopProfit AS (
    SELECT namess FROM companies_ranked_by_earnings ORDER BY earnings_ttm DESC LIMIT 100
)
SELECT COUNT(*) AS Common_Companies
FROM TopRevenue r
JOIN TopProfit p ON r.namess = p.namess;

-- Compare avg revenue for companies above/below $10B profit--
SELECT 
  CASE WHEN p.earnings_ttm >= 10000000000 THEN 'Above 10B' ELSE 'Below 10B' END AS Profit_Category,
  AVG(r.revenue_ttm) AS Avg_Revenue
FROM companies_ranked_by_earnings p
JOIN companies_ranked_by_revenue r ON p.namess = r.namess
GROUP BY Profit_Category;

-- Highest market cap per revenue ratio----
SELECT m.namess, m.marketcap, r.revenue_ttm, 
       (m.marketcap / r.revenue_ttm) AS Cap_to_Revenue
FROM companies_ranked_by_market_cap m
JOIN companies_ranked_by_revenue r ON m.namess = r.namess
ORDER BY Cap_to_Revenue DESC
LIMIT 10;

-- Market cap > $200B, revenue < $50B-----
select m.namess, m.marketcap, r.revenue_ttm
from companies_ranked_by_market_cap m
join companies_ranked_by_revenue r on m.namess = r.namess
where marketcap > 200000000000 and revenue_ttm < 50000000000; 

-- Industry with highest avg cap/revenue ratio--------
SELECT m.namess, 
       AVG(m.marketcap / r.revenue_ttm) AS Avg_Cap_to_Rev
FROM companies_ranked_by_market_cap m
JOIN companies_ranked_by_revenue r ON m.namess = r.namess
GROUP BY m.namess
ORDER BY Avg_Cap_to_Rev DESC;


-- Top 50 companies by market cap  with lowest profit
WITH TopCap AS (
  SELECT namess FROM companies_ranked_by_market_cap ORDER BY marketcap DESC LIMIT 50
)
SELECT p.namess, p.earnings_ttm
FROM TopCap c
JOIN companies_ranked_by_earnings p ON c.namess = p.namess
ORDER BY p.earnings_ttm ASC;


-- Country with most companies in top 100 market cap---
SELECT country, COUNT(*) AS Count
FROM (
    SELECT namess, country FROM companies_ranked_by_market_cap ORDER BY marketcap DESC LIMIT 100
) t
GROUP BY country
ORDER BY Count DESC;

-- Among companies in the top 100 by dividend yield, which also generate more than $50B in revenue?--
WITH TopDividend AS (
  SELECT namess AS namess, dividend_yield_ttm
  FROM companies_ranked_by_dividend_yield
  ORDER BY dividend_yield_ttm DESC
  LIMIT 100
)
SELECT td.namess, r.revenue_ttm, td.dividend_yield_ttm
FROM TopDividend td
JOIN companies_ranked_by_revenue r ON td.namess = r.namess
WHERE r.revenue_ttm > 50000000000;

-- What is the average dividend yield for companies with revenue above $75B? ----
SELECT AVG(d.dividend_yield_ttm) AS avg_dividend_yield
FROM companies_ranked_by_revenue r
JOIN companies_ranked_by_dividend_yield d ON r.namess = d.namess
WHERE r.revenue_ttm > 75;

-- Identify companies in both the top 50 by revenue and top 50 by dividend yield----
WITH TopRevenue AS (
  SELECT namess AS namess
  FROM companies_ranked_by_revenue
  ORDER BY revenue_ttm DESC
  LIMIT 50
),
TopDividend AS (
  SELECT namess AS namess
  FROM companies_ranked_by_dividend_yield
  ORDER BY dividend_yield_ttm DESC
  LIMIT 50
)
SELECT tr.namess
FROM TopRevenue tr
JOIN TopDividend td ON tr.namess = td.namess;

-- Which companies pay high dividends (>5%) but generate less than $10B in revenue?---
SELECT d.namess AS namess, d.dividend_yield_ttm, r.revenue_ttm
FROM companies_ranked_by_dividend_yield d
JOIN companies_ranked_by_revenue r ON d.namess = r.namess
WHERE d.dividend_yield_ttm > 0.05 AND r.revenue_ttm < 10000000000;
