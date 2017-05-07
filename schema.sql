-- -------------------------
-- CUSTOMER TABLES
-- -------------------------

CREATE TABLE customer (
	customerID INT NOT NULL AUTO_INCREMENT,
	email VARCHAR(20),
	phone VARCHAR(20),
	accidentFreeAtDaves BOOLEAN DEFAULT 1,
	alwaysWithin2kMiles BOOLEAN DEFAULT 1,
	customerName VARCHAR(20),
	PRIMARY KEY (customerID)
);

CREATE TABLE corporation (
	customerID INT NOT NULL,
	PRIMARY KEY (customerID),
	FOREIGN KEY (customerID) REFERENCES customer(customerID)
)

CREATE TABLE address (
	customerID INT NOT NULL,
	city VARCHAR(20) NOT NULL,
	state VARCHAR(20) NOT NULL,
	zip VARCHAR(20) NOT NULL,
	address VARCHAR(20) NOT NULL,
	addressType VARCHAR(20) NOT NULL,
	PRIMARY KEY (customerID, addressType),
	FOREIGN KEY (customerID) REFERENCES customer(customerID),
	FOREIGN KEY (addressType) REFERENCES addressType(addressType)
)

CREATE TABLE addressType (
	addressType VARCHAR(20) NOT NULL,
	PRIMARY KEY (addressType)
)

CREATE TABLE private (
	customerID INT NOT NULL,
	mailingAddress,
	city,
	state,
	zip,
	PRIMARY KEY (customerID),
	FOREIGN KEY (customerID) REFERENCES customer(customerID)
)

CREATE TABLE activeCustomer (
	customerID INT NOT NULL,
	PRIMARY KEY (customerID),
	FOREIGN KEY (customerID) REFERENCES customer(customerID)
)

CREATE TABLE premier (
	customerID INT NOT NULL,
	annualFee,
	monthlyInstallmentAmount,
	dateLastPaymentReceived,
	dateMonthlyFeeLastUpdated,
	premierServiceValue,
	PRIMARY KEY (customerID),
	FOREIGN KEY (customerID) REFERENCES activeCustomer(customerID)
)


-- May remove reference back to activeCustomer (referralID)
CREATE TABLE prospective (
	customerID INT NOT NULL,
	referralID INT NOT NULL,
	status,
	PRIMARY KEY (customerID),
	FOREIGN KEY (customerID) REFERENCES customer(customerID),
	FOREIGN KEY (referralID) REFERENCES activeCustomer(customerID)
)

CREATE TABLE contactInstanceDate (
	customerID INT NOT NULL,
	contactInstanceDate DATE NOT NULL,
	PRIMARY KEY (customerID, contactInstanceDate),
	FOREIGN KEY (customerID) REFERENCES prospective(customerID)
)

CREATE TABLE premierReferral (
	customerID INT NOT NULL,
	referralID INT NOT NULL,
	date DATETIME,
	PRIMARY KEY (customerID, referralID),
	FOREIGN KEY (customerID) REFERENCES premier(customerID),
	FOREIGN KEY (referralID) REFERENCES prospective(customerID)
)

CREATE TABLE steady (
	customerID INT NOT NULL,
	lastEmailSent,
	totalLoyaltyPoints,
	PRIMARY KEY (customerID),
	FOREIGN KEY (customerID) REFERENCES activeCustomer(customerID)
)

CREATE TABLE steadyReferral (
	customerID INT NOT NULL,
	referralID INT NOT NULL,
	date DATE NOT NULL,
	dateOilChangeReceived DATE,
	PRIMARY KEY (customerID, referralID),
	FOREIGN KEY (customerID) REFERENCES steady(customerID),
	FOREIGN key (referralID) REFERENCES prospective(customerID)
)

CREATE TABLE loyaltyPointsSpent (
	customerID INT NOT NULL,
	dateSpent DATE NOT NULL,
	numberLoyaltyPointsSpent INT,
	PRIMARY KEY (customerID, dateSpent),
	FOREIGN KEY (customerID) REFERENCES steady(customerID)
)

-- maintenanceItem field unclear type or reference
CREATE TABLE maintenanceItem (
	maintenanceItem,
	customerID INT NOT NULL,
	dateSpent DATE NOT NULL,
	PRIMARY KEY (maintenanceItem, customerID, dateSpent),
	FOREIGN KEY (customerID, dateSpent) REFERENCES loyaltyPointsSpent(customerID, dateSpent)
)

-- -------------------------
-- CUSTOMER TABLES
-- -------------------------

