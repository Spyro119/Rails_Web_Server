-- How many contact requests are made per month?
-- The number of unique requests (ContactId) grouped by Month (Creation Date)
SELECT creation_date, SUM(contactid) AS total_contact FROM factcontact GROUP BY creation_date ORDER BY creation_date