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

-- 5
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
