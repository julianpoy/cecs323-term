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
	PRIMARY KEY (customerID),
	CONSTRAINT customer_email_phone_customerName_ck01 UNIQUE (email, phone, customerName)
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
-- END CUSTOMER TABLES
-- -------------------------


-- -------------------------
-- EMPLOYEE TABLES
-- -------------------------

CREATE TABLE jobTitle (
	jobTitle VARCHAR(20) NOT NULL,
	PRIMARY KEY (jobTitle)
)

CREATE TABLE employee (
	employeeID INT NOT NULL AUTO_INCREMENT,
	name,
	phone,
	jobTitle,
	PRIMARY KEY (employeeID),
	FOREIGN KEY (jobTitle) REFERENCES jobTitle(jobTitle)
)

CREATE TABLE experiencedEmployee (
	employeeID INT NOT NULL,
	PRIMARY KEY (employeeID),
	FOREIGN KEY (employeeID) REFERENCES employee(employeeID)
)

CREATE TABLE employeeReview (
	revieweeID INT NOT NULL,
	reviewerID INT NOT NULL,
	date DATE NOT NULL,
	PRIMARY KEY (revieweeID, reviewerID, date),
	FOREIGN KEY (revieweeID) REFERENCES employee(employeeID),
	FOREIGN KEY (reviewerID) REFERENCES experiencedEmployee(employeeID)
)

CREATE TABLE expenses (
	employeeID INT NOT NULL,
	date DATETIME NOT NULL,
	cardNumber VARCHAR(20) NOT NULL,
	amount INT,
	description,
	PRIMARY KEY (date, cardNumber),
	FOREIGN KEY (employeeID) REFERENCES employee(employeeID),
	CONSTRAINT expenses_card_employee_ck01 UNIQUE (date, employeeID)
)

CREATE TABLE leaveType (
	leaveType VARCHAR(20) NOT NULL,
	PRIMARY KEY (leaveType)
)

CREATE TABLE daysOff (
	start DATE NOT NULL,
	end DATE NOT NULL,
	employeeID INT NOT NULL,
	reason,
	approved BOOLEAN DEFAULT 0,
	leaveType,
	PRIMARY KEY (start, employeeID),
	FOREIGN KEY (employeeID) REFERENCES employee(employeeID),
	FOREIGN KEY (leaveType) REFERENCES leaveType(leaveType),
	CONSTRAINT daysOff_end_employee_ck01 UNIQUE (end, employeeID)
)

CREATE TABLE mechanic (
	employeeID INT NOT NULL,
	PRIMARY KEY (employeeID),
	FOREIGN KEY (employeeID) REFERENCES employee(employeeID)
)

CREATE TABLE skills (
	name VARCHAR(20) NOT NULL,
	description,
	PRIMARY KEY (name)
)

CREATE TABLE mechanicSkills (
	employeeID INT NOT NULL,
	skillName VARCHAR(20) NOT NULL,
	PRIMARY KEY (employeeID, skillName),
	FOREIGN KEY (employeeID) REFERENCES mechanic(employeeID),
	FOREIGN KEY (skillName) REFERENCES skills(name)
)

CREATE TABLE mentoringRelationship (
	menteeID INT NOT NULL,
	start DATE NOT NULL,
	end DATE,
	mentorID INT NOT NULL,
	skillName VARCHAR(20) NOT NULL,
	PRIMARY KEY (menteeID, start, mentorID, skillName),
	FOREIGN KEY (menteeID) REFERENCES mechanic(employeeID),
	FOREIGN KEY (mentorID, skillName) REFERENCES mechanicSkills(employeeID, skillName)
)


-- -------------------------
-- END EMPLOYEE TABLES
-- -------------------------

