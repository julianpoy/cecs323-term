-- 1
SELECT customerName,
    email,
    phone,
    premier.customerID IS NOT NULL AS isPremier,
    steady.customerID IS NOT NULL AS isSteady,
    prospective.customerID IS NOT NULL AS isProspective
    FROM customer
    LEFT JOIN premier USING (customerID)
    LEFT JOIN steady USING (customerID)
    LEFT JOIN prospective USING (customerID);

-- 2
SELECT customerName, cost FROM scheduledMaintenance
    INNER JOIN customer USING(customerID)

-- 3
SELECT customerName, SUM(cost) FROM scheduledMaintenance
    INNER JOIN customer USING (customerID)
    WHERE DATEDIFF(CURDATE(), dateTime) < 730
    GROUP BY customerName;

-- 4
SELECT name, COUNT(skillName) AS skillCount FROM mechanicSkills
    INNER JOIN employee USING (employeeID)
    GROUP BY name
    HAVING COUNT(skillName) >= 3;

-- 5 -- BROKEDED - HARD
SELECT * FROM mechanicSkills
    WHERE employeeID IN
        (SELECT employeeID FROM mechanicSkills
            GROUP BY employeeID
            HAVING COUNT(SKILLNAME) >= 3)
    INNER JOIN (
        SELECT * FROM mechanicSkills
            WHERE employeeID IN
                (SELECT employeeID FROM mechanicSkills
                    GROUP BY employeeID
                    HAVING COUNT(SKILLNAME) >= 3)
    ) B
    

-- 6
SELECT cost AS packageCost, itemName, milage, make, model, year FROM package
    LEFT JOIN packageItem USING (milage, make, model, year);

-- 7 DIDNT DO


-- 8
SELECT customerName, totalLoyaltyPoints - spent AS loyaltyPointsRemaining FROM steady
    INNER JOIN customer USING (customerID)
    INNER JOIN (
        SELECT customerID, SUM(numberLoyaltyPointsSpent) AS spent FROM loyaltyPointsSpent
        GROUP BY customerID
    ) a ON a.customerID = customer.customerID
    ORDER BY loyaltyPointsRemaining DESC;

-- 9
SELECT customerName, income, premierServiceValue, income - premierServiceValue AS netProfit FROM customer
    INNER JOIN premier USING (customerID)
    INNER JOIN (
        SELECT customerID, SUM(cost) AS income FROM scheduledMaintenance
            WHERE DATEDIFF(CURDATE(), dateTime) < 365
            GROUP BY customerID
    ) a ON premier.customerID = a.customerID
    ORDER BY netProfit DESC;

-- 10
SELECT customerName, netProfit FROM customer
    INNER JOIN steady USING (customerID)
    INNER JOIN (
        SELECT customerID, SUM(cost) AS netProfit FROM scheduledMaintenance
            WHERE DATEDIFF(CURDATE(), dateTime) < 365
            GROUP BY customerID
    ) a ON steady.customerID = a.customerID
    ORDER BY netProfit DESC;

-- 11
SELECT customerName, income FROM customer
    INNER JOIN premier USING (customerID)
    INNER JOIN (
        SELECT customerID, SUM(cost) AS income FROM scheduledMaintenance
            WHERE DATEDIFF(CURDATE(), dateTime) < 365
            GROUP BY customerID
    ) a ON premier.customerID = a.customerID
    ORDER BY income DESC;

-- 12
SELECT * FROM instanceOfCar
    INNER JOIN (
        SELECT VIN, COUNT(*) AS maintenanceCount FROM scheduledMaintenance
            WHERE DATEDIFF(CURDATE(), dateTime) < 1095 
            GROUP BY VIN
            ORDER BY maintenanceCount DESC
            LIMIT 5) a ON instanceOfCar.VIN = a.VIN;

-- 13
SELECT * FROM mentoringRelationship
    INNER JOIN employee a ON a.employeeID = mentorID
    INNER JOIN employee b ON b.employeeID = menteeID
    WHERE mentorID IN (SELECT mentorID FROM mentoringRelationship
        GROUP BY mentorID
        HAVING count(skillName) = (SELECT MAX(skillCount) FROM (
            SELECT mentorID, count(skillName) AS skillCount FROM mentoringRelationship
                GROUP BY mentorID) a))

-- 14
SELECT skillName, count(employeeID) AS employeeCount FROM mechanicSkills
    GROUP BY skillName
    ORDER BY employeeCount ASC
    LIMIT 3;

-- 15
SELECT * FROM employee
    INNER JOIN serviceTechnician USING (employeeID)
    INNER JOIN mechanic USING (employeeID)

-- 16
-- #1 CHECK OUR PRICES COMPARED TO THE COMPETITOR. FIND OUR LARGEST PRICE DIFFERENCES (IN A BAD WAY)
SELECT itemName, competitorService.cost AS theirCost, item.cost AS ourCost, competitorService.cost - item.cost AS difference FROM competitorService
    INNER JOIN item USING (itemName)
    INNER JOIN competitor USING (competitorID)
    ORDER BY difference ASC

-- #2
SELECT * FROM competitorService
    INNER JOIN item USING (itemName)
    INNER JOIN competitor USING (competitorID)
    WHERE itemName LIKE '%Front Window%'

-- #3
SELECT * FROM customer
    INNER JOIN private USING (customerID)
    INNER JOIN competitor ON competitor.state = private.state


