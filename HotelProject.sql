
WITH hotels AS (
SELECT * FROM dbo.['2018$']
union
SELECT * FROM dbo.['2019$']
union
SELECT * FROM dbo.['2020$'])

SELECT * FROM hotels
LEFT JOIN dbo.market_segment$ 
ON hotels.market_segment = market_segment$.market_segment
LEFT JOIN dbo.meal_cost$
ON hotels.meal = meal_cost$.meal
