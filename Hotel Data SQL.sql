-- Using all Data together by creating a temp table

WITH All_Hotel AS (
SELECT *
FROM Data18
UNION
SELECT *
FROM Data19
UNION
SELECT *
FROM Data20
)
SELECT *
FROM All_Hotel

-- Revenue per Year per Hotel

WITH All_Hotel AS (
SELECT *
FROM Data18
UNION
SELECT *
FROM Data19
UNION
SELECT *
FROM Data20
)
SELECT arrival_date_year, hotel, ROUND(SUM((stays_in_week_nights+stays_in_weekend_nights)*ADR), 2) AS Revenue
FROM All_Hotel
GROUP BY arrival_date_year, hotel


-- All Tables Together

WITH All_Hotel AS (
SELECT *
FROM Data18
UNION
SELECT *
FROM Data19
UNION
SELECT *
FROM Data20
)
SELECT *
FROM All_Hotel
LEFT JOIN market_segment$
ON market_segment$.market_segment = All_Hotel.market_segment
LEFT JOIN meal_cost$
ON meal_cost$.meal = All_Hotel.meal


