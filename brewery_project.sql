SELECT * FROM project1.international_breweries;
sELECT distinct brands from project1.international_breweries;


-- 1. PROFIT ANALYSIS
-- 1.1 Within the space of the last three years, what was the profit worth of the breweries, inclusive of the anglophone and the francophone territories?
SELECT 
    SUM(profit) AS 'Total_Profit'
FROM
    international_breweries;

-- 1.2 Compare the total profit between these two territories in order for the territory manager, Mr. Stone made a strategic decision that will aid profit maximization in 2020.
SELECT 
    territories, SUM(profit) AS profit
FROM
    international_breweries
GROUP BY 1
ORDER BY 2 DESC;

-- 1.3 Country that generated the highest profit in 2019
SELECT 
    countries, SUM(profit) AS profit
FROM
    international_breweries
WHERE
    years = 2019
GROUP BY 1
ORDER BY 2 DESC;

-- 1.4 Help him find the year with the highest profit.
SELECT 
    years, SUM(profit) AS profit
FROM
    international_breweries
GROUP BY 1
ORDER BY 2 DESC;

-- 1.5 Which month in the three years was the least profit generated?
SELECT 
    months, years, SUM(profit) AS profit
FROM
    international_breweries
GROUP BY 2 , 1
ORDER BY 3 asc
LIMIT 1;

-- 1.6 What was the minimum profit in the month of December 2018?
SELECT 
    years, months, MIN(profit) AS least_profit
FROM
    international_breweries
WHERE
    years = 2018 AND months = 'December'
GROUP BY 1 , 2;

-- 1.7 Compare the profit in percentage for each of the month in 2019
SELECT 
    SUM(profit)
FROM
    international_breweries
WHERE
    years = 2019;
-- 30020250

SELECT 
    months,
    ROUND((SUM(profit) / 30020250) * 100, 2) AS profit_percent
FROM
    international_breweries
WHERE
    years = 2019
GROUP BY 1;

-- 1.8 Which particular brand generated the highest profit in Senegal?
SELECT 
    brands, SUM(profit) AS profit
FROM
    international_breweries
WHERE
    countries = 'senegal'
GROUP BY 1
ORDER BY 2 DESC;


-- BRAND ANALYSIS
-- 2.1 Within the last two years, the brand manager wants to know the top three brands consumed in the francophone countries
SELECT 
    brands, SUM(quantity) AS Qty_consumed
FROM
    international_breweries
WHERE
    years IN (2018 , 2019)
        AND territories = 'francophone'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;

-- 2.2 Find out the top two choice of consumer brands in Ghana
SELECT 
    brands, SUM(quantity) AS qtty_consumed
FROM
    international_breweries
WHERE
    countries = 'ghana'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 2;

-- 2.3 Find out the details of beers consumed in the past three years in the most oil rich country in West Africa.
-- trophy budweiser castle lite eagle lager hero
SELECT 
    brands, SUM(quantity) AS quantity, SUM(profit) AS profit
FROM
    international_breweries
WHERE
    brands IN ('trophy' , 'budweiser',
        'castle lite',
        'eagle lager',
        'hero')
        AND countries = 'Nigeria'
GROUP BY 1
ORDER BY 2 DESC;

-- 2.4 Favorites malt brand in Anglophone region between 2018 and 2019
SELECT 
    brands, SUM(quantity) AS consumption
FROM
    international_breweries
WHERE
    brands IN ('beta malt' , 'grand malt')
        AND territories = 'anglophone'
        AND years IN (2018 , 2019)
GROUP BY 1
ORDER BY 2 DESC;

-- 2.5 Which brands sold the highest in 2019 in Nigeria?
SELECT 
    brands, SUM(quantity) AS qtty_sold
FROM
    international_breweries
WHERE
    years = 2019 AND countries = 'Nigeria'
GROUP BY 1
ORDER BY 2 DESC;

-- 2.6 Favorites brand in South South region in Nigeria
SELECT 
    brands, SUM(quantity) AS qtty_consumed
FROM
    international_breweries
WHERE
    region = 'southsouth'
        AND countries = 'Nigeria'
GROUP BY 1
ORDER BY 2 DESC;

-- 2.7 Bear consumption in Nigeria
SELECT 
    brands, SUM(quantity) AS consumption
FROM
    international_breweries
WHERE
    brands IN ('trophy' , 'budweiser',
        'castle lite',
        'eagle lager',
        'hero')
        AND countries = 'Nigeria'
GROUP BY 1
ORDER BY 2 DESC;

-- 2.8 Level of consumption of Budweiser in the regions in Nigeria
SELECT 
    region, SUM(quantity) AS quantity
FROM
    international_breweries
WHERE
    brands = 'budweiser'
        AND countries = 'Nigeria'
GROUP BY 1
ORDER BY 2 DESC;

-- 2.9 Level of consumption of Budweiser in the regions in Nigeria in 2019 (Decision on Promo)
SELECT 
    region, SUM(quantity) AS quantity
FROM
    international_breweries
WHERE
    brands = 'budweiser'
        AND countries = 'Nigeria'
        AND years = 2019
GROUP BY 1
ORDER BY 2 DESC;


-- GEO-LOCATION ANALYSIS
-- 3.1 Country with the highest consumption of beer.
SELECT 
    countries, SUM(quantity) AS consumption
FROM
    international_breweries
WHERE
    brands NOT IN ('beta malt' , 'grand malt')
GROUP BY 1
ORDER BY 2 DESC;

-- 3.2 Highest sales personnel of Budweiser in Senegal
SELECT 
    sales_rep, countries AS country, SUM(quantity) AS qtty_sold
FROM
    international_breweries
WHERE
    brands = 'budweiser'
        AND countries = 'senegal'
GROUP BY 1 , 2
ORDER BY 3 DESC
LIMIT 1;

-- 3.3 Country with the highest profit of the fourth quarter in 2019
SELECT 
    countries, SUM(profit) AS profit
FROM
    international_breweries
WHERE
    years = 2019
        AND months IN ('october' , 'november', 'december')
GROUP BY 1
ORDER BY 2 DESC;