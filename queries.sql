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
