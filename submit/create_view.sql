CREATE VIEW Customer_v AS
SELECT customerName,
    dateJoined,
    premier.customerID IS NOT NULL AS isPremier,
    steady.customerID IS NOT NULL AS isSteady,
    prospective.customerID IS NOT NULL AS isProspective
    FROM customer
    LEFT JOIN premier USING (customerID)
    LEFT JOIN steady USING (customerID)
    LEFT JOIN prospective USING (customerID);

CREATE VIEW Customer_addresses_v AS
SELECT customerName,
    dateJoined,
    corporation.customerID IS NOT NULL AS isCorporate,
    private.address AS privateAddress,
    private.city AS privateCity,
    private.state AS privateState,
    private.zip AS privateZip,
    address.address AS corporateAddress,
    address.city AS corporateCity,
    address.state AS corporateState,
    address.zip AS corporateZip
    FROM customer
    LEFT JOIN corporation USING (customerID)
    LEFT JOIN address USING (customerID)
    LEFT JOIN private USING (customerID);

CREATE VIEW Mechanic_mentor_v AS
SELECT employee.name AS mentor, c.name AS mentee, mechanicSkills.skillName FROM mechanic
    INNER JOIN employee USING (employeeID)
    INNER JOIN mechanicSkills USING (employeeID)
    INNER JOIN mentoringRelationship ON mentorID = mechanicSkills.employeeID AND mentoringRelationship.skillName = mechanicSkills.skillName
    INNER JOIN mechanic b ON b.employeeID = mentoringRelationship.menteeID
    INNER JOIN employee c ON b.employeeID = c.employeeID;

CREATE VIEW Premier_profits_v AS
SELECT customerName, premierServiceValue FROM customer
    INNER JOIN premier USING (customerID);

CREATE VIEW Prospective_resurrection_v AS
SELECT customerName, contactInstanceDate FROM customer
    INNER JOIN prospective USING (customerID)
    INNER JOIN contactInstanceDate USING (customerID)
    WHERE customerName NOT IN (
    SELECT customerName FROM customer
        INNER JOIN prospective USING (customerID)
        INNER JOIN contactInstanceDate USING (customerID)
        WHERE DATEDIFF(CURDATE(), contactInstanceDate) < 365
    );