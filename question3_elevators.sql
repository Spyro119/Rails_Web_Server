-- How many elevators per customer do we have?
-- The number of elevators (ElevatorId) contained in the buildings belonging to each customer
SELECT customerid, buildingid, SUM(serialnumber) AS total_elevator FROM factelevator GROUP BY buildingid, customerid ORDER BY customerid
