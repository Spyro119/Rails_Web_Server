-- How many bid solicitations are made per month?
-- The number of unique requests (QuoteId) grouped by Month (Creation Date)
SELECT creation_date, SUM(quoteid) AS total_quote FROM factquotes GROUP BY creation_date ORDER BY creation_date
