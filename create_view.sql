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

