-- -------------------------
-- CUSTOMER TABLES
-- -------------------------

CREATE TABLE customer (
	customerID INT NOT NULL AUTO_INCREMENT,
	email VARCHAR(100),
	phone BIGINT,
	accidentFreeAtDaves BOOLEAN DEFAULT 1,
	alwaysWithin2kMiles BOOLEAN DEFAULT 1,
	customerName VARCHAR(100),
	dateJoined DATE,
	PRIMARY KEY (customerID),
	CONSTRAINT customer_email_phone_customerName_ck01 UNIQUE (email, phone, customerName)
);

CREATE TABLE corporation (
	customerID INT NOT NULL,
	PRIMARY KEY (customerID),
	FOREIGN KEY (customerID) REFERENCES customer(customerID)
);

CREATE TABLE addressType (
	addressType VARCHAR(100) NOT NULL,
	PRIMARY KEY (addressType)
);

CREATE TABLE address (
	customerID INT NOT NULL,
	city VARCHAR(100) NOT NULL,
	state VARCHAR(50) NOT NULL,
	zip INT NOT NULL,
	address VARCHAR(100) NOT NULL,
	addressType VARCHAR(100) NOT NULL,
	PRIMARY KEY (customerID, addressType),
	FOREIGN KEY (customerID) REFERENCES customer(customerID),
	FOREIGN KEY (addressType) REFERENCES addressType(addressType)
);

CREATE TABLE private (
	customerID INT NOT NULL,
	mailingAddress VARCHAR(100),
	city VARCHAR(100),
	state VARCHAR(50),
	zip INT,
	PRIMARY KEY (customerID),
	FOREIGN KEY (customerID) REFERENCES customer(customerID)
);

CREATE TABLE activeCustomer (
	customerID INT NOT NULL,
	PRIMARY KEY (customerID),
	FOREIGN KEY (customerID) REFERENCES customer(customerID)
);

CREATE TABLE premier (
	customerID INT NOT NULL,
	annualFee INT,
	monthlyInstallmentAmount INT,
	dateLastPaymentReceived DATE,
	dateMonthlyFeeLastUpdated DATE,
	premierServiceValue INT,
	PRIMARY KEY (customerID),
	FOREIGN KEY (customerID) REFERENCES activeCustomer(customerID)
);


-- May remove reference back to activeCustomer (referralID)
CREATE TABLE prospective (
	customerID INT NOT NULL,
	referralID INT NOT NULL,
	status BOOLEAN DEFAULT 1,
	PRIMARY KEY (customerID),
	FOREIGN KEY (customerID) REFERENCES customer(customerID),
	FOREIGN KEY (referralID) REFERENCES activeCustomer(customerID)
);

CREATE TABLE contactInstanceDate (
	customerID INT NOT NULL,
	contactInstanceDate DATE NOT NULL,
	PRIMARY KEY (customerID, contactInstanceDate),
	FOREIGN KEY (customerID) REFERENCES prospective(customerID)
);

CREATE TABLE premierReferral (
	customerID INT NOT NULL,
	referralID INT NOT NULL,
	date DATETIME,
	PRIMARY KEY (customerID, referralID),
	FOREIGN KEY (customerID) REFERENCES premier(customerID),
	FOREIGN KEY (referralID) REFERENCES prospective(customerID)
);

CREATE TABLE steady (
	customerID INT NOT NULL,
	lastEmailSent DATE,
	totalLoyaltyPoints INT,
	PRIMARY KEY (customerID),
	FOREIGN KEY (customerID) REFERENCES activeCustomer(customerID)
);

CREATE TABLE steadyReferral (
	customerID INT NOT NULL,
	referralID INT NOT NULL,
	date DATE NOT NULL,
	dateOilChangeReceived DATE,
	PRIMARY KEY (customerID, referralID),
	FOREIGN KEY (customerID) REFERENCES steady(customerID),
	FOREIGN key (referralID) REFERENCES prospective(customerID)
);

CREATE TABLE loyaltyPointsSpent (
	customerID INT NOT NULL,
	dateSpent DATE NOT NULL,
	numberLoyaltyPointsSpent INT,
	PRIMARY KEY (customerID, dateSpent),
	FOREIGN KEY (customerID) REFERENCES steady(customerID)
);

CREATE TABLE item (
	itemName VARCHAR(200) NOT NULL,
	itemDescrip TEXT,
	cost INT,
	timeRequired INT,
	PRIMARY KEY (itemName)
);

-- Relies on item table 
CREATE TABLE maintenanceItem (
	maintenanceItem VARCHAR(200) NOT NULL,
	customerID INT NOT NULL,
	dateSpent DATE NOT NULL,
	PRIMARY KEY (maintenanceItem, customerID, dateSpent),
	FOREIGN KEY (maintenanceItem) REFERENCES item(itemName),
	FOREIGN KEY (customerID, dateSpent) REFERENCES loyaltyPointsSpent(customerID, dateSpent)
);

-- -------------------------
-- END CUSTOMER TABLES
-- -------------------------


-- -------------------------
-- EMPLOYEE TABLES
-- -------------------------

CREATE TABLE jobTitle (
	jobTitle VARCHAR(100) NOT NULL,
	PRIMARY KEY (jobTitle)
);

CREATE TABLE employee (
	employeeID INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100),
	phone BIGINT,
	jobTitle VARCHAR(100),
	PRIMARY KEY (employeeID),
	FOREIGN KEY (jobTitle) REFERENCES jobTitle(jobTitle),
	CONSTRAINT employee_name_phone_ck01 UNIQUE (name, phone)
);

CREATE TABLE experiencedEmployee (
	employeeID INT NOT NULL,
	PRIMARY KEY (employeeID),
	FOREIGN KEY (employeeID) REFERENCES employee(employeeID)
);

CREATE TABLE employeeReview (
	revieweeID INT NOT NULL,
	reviewerID INT NOT NULL,
	date DATE NOT NULL,
	PRIMARY KEY (revieweeID, reviewerID, date),
	FOREIGN KEY (revieweeID) REFERENCES employee(employeeID),
	FOREIGN KEY (reviewerID) REFERENCES experiencedEmployee(employeeID)
);

CREATE TABLE expenses (
	employeeID INT NOT NULL,
	date DATETIME NOT NULL,
	cardNumber VARCHAR(20) NOT NULL,
	amount INT,
	description TEXT,
	PRIMARY KEY (date, cardNumber),
	FOREIGN KEY (employeeID) REFERENCES employee(employeeID),
	CONSTRAINT expenses_card_employee_ck01 UNIQUE (date, employeeID)
);

CREATE TABLE leaveType (
	leaveType VARCHAR(50) NOT NULL,
	PRIMARY KEY (leaveType)
);

CREATE TABLE daysOff (
	start DATE NOT NULL,
	end DATE NOT NULL,
	employeeID INT NOT NULL,
	reason TEXT,
	approved BOOLEAN DEFAULT 0,
	leaveType VARCHAR(50),
	PRIMARY KEY (start, employeeID),
	FOREIGN KEY (employeeID) REFERENCES employee(employeeID),
	FOREIGN KEY (leaveType) REFERENCES leaveType(leaveType),
	CONSTRAINT daysOff_end_employee_ck01 UNIQUE (end, employeeID)
);

CREATE TABLE mechanic (
	employeeID INT NOT NULL,
	PRIMARY KEY (employeeID),
	FOREIGN KEY (employeeID) REFERENCES employee(employeeID)
);

CREATE TABLE skills (
	name VARCHAR(50) NOT NULL,
	description TEXT,
	PRIMARY KEY (name)
);

CREATE TABLE mechanicSkills (
	employeeID INT NOT NULL,
	skillName VARCHAR(50) NOT NULL,
	PRIMARY KEY (employeeID, skillName),
	FOREIGN KEY (employeeID) REFERENCES mechanic(employeeID),
	FOREIGN KEY (skillName) REFERENCES skills(name)
);

CREATE TABLE mentoringRelationship (
	menteeID INT NOT NULL,
	start DATE NOT NULL,
	end DATE,
	mentorID INT NOT NULL,
	skillName VARCHAR(50) NOT NULL,
	PRIMARY KEY (menteeID, start, mentorID, skillName),
	FOREIGN KEY (menteeID) REFERENCES mechanic(employeeID),
	FOREIGN KEY (mentorID, skillName) REFERENCES mechanicSkills(employeeID, skillName)
);

CREATE TABLE internApprentice (
	employeeID INT NOT NULL,
	start DATE NOT NULL,
	end DATE,
	evaluationNotes TEXT,
	standing VARCHAR(50),
	PRIMARY KEY (employeeID),
	FOREIGN KEY (employeeID) REFERENCES employee(employeeID)
);

CREATE TABLE internApprenticeSkill (
	employeeID INT NOT NULL,
	skillName VARCHAR(50) NOT NULL,
	PRIMARY KEY (employeeID, skillName),
	FOREIGN KEY (employeeID) REFERENCES internApprentice(employeeID),
	FOREIGN KEY (skillName) REFERENCES skills(name)
);

CREATE TABLE serviceTechnician (
	employeeID INT NOT NULL,
	PRIMARY KEY (employeeID),
	FOREIGN KEY (employeeID) REFERENCES employee(employeeID)
);

-- -------------------------
-- END EMPLOYEE TABLES
-- -------------------------


-- -------------------------
-- VEHICLE TABLES
-- -------------------------

CREATE TABLE vehicle (
	make VARCHAR(40) NOT NULL,
	model VARCHAR(40) NOT NULL,
	year INT NOT NULL,
	PRIMARY KEY (make, model, year)
);

CREATE TABLE instanceOfCar (
	make VARCHAR(40) NOT NULL,
	model VARCHAR(40) NOT NULL,
	year INT NOT NULL,
	VIN VARCHAR(50) NOT NULL,
	updatedDate DATE,
	lastIntervalPerformed DATE,
	lastRecordedMilage INT,
	hasHadAccident BOOLEAN DEFAULT 0,
	projectedMilesPerYear INT,
	licensePlate VARCHAR(20),
	stateCode VARCHAR(20),
	PRIMARY KEY (VIN),
	FOREIGN KEY (make, model, year) REFERENCES vehicle(make, model, year)
);

CREATE TABLE customerCar (
	VIN VARCHAR(50) NOT NULL,
	customerID INT NOT NULL,
	PRIMARY KEY (VIN, customerID),
	FOREIGN KEY (VIN) REFERENCES instanceOfCar(VIN),
	FOREIGN KEY (customerID) REFERENCES customer(customerID)
);

CREATE TABLE scheduledMaintenance (
	customerID INT NOT NULL,
	VIN VARCHAR(50) NOT NULL,
	dateTime DATETIME NOT NULL,
	cost INT NOT NULL,
	timeRequired INT NOT NULL,
	PRIMARY KEY (customerID, VIN, dateTime),
	FOREIGN KEY (VIN, customerID) REFERENCES customerCar(VIN, customerID)
);

CREATE TABLE maintenanceVisitOrder (
	maintenanceID INT NOT NULL AUTO_INCREMENT,
	VIN VARCHAR(50) NOT NULL,
	dateTime DATETIME NOT NULL,
	customerID INT NOT NULL,
	serviceTechnicianID INT NOT NULL,
	PRIMARY KEY (maintenanceID),
	FOREIGN KEY (customerID, VIN, dateTime) REFERENCES scheduledMaintenance(customerID, VIN, dateTime),
	FOREIGN KEY (serviceTechnicianID) REFERENCES serviceTechnician(employeeID),
	CONSTRAINT maintenanceVisitOrder_lic_datetime_customer_ck01 UNIQUE(VIN, dateTime, customerID)
);

CREATE TABLE package (
	milage INT NOT NULL,
	make VARCHAR(40) NOT NULL,
	model VARCHAR(40) NOT NULL,
	year INT NOT NULL,
	cost INT,
	timeRequired INT,
	PRIMARY KEY (milage, make, model, year),
	FOREIGN KEY (make, model, year) REFERENCES vehicle(make, model, year)
);

CREATE TABLE scheduledIntervalMaintenance (
	customerID INT NOT NULL,
	VIN VARCHAR(50) NOT NULL,
	dateTime DATETIME NOT NULL,
	milage INT NOT NULL,
	make VARCHAR(40) NOT NULL,
	model VARCHAR(40) NOT NULL,
	year INT NOT NULL,
	PRIMARY KEY (customerID, VIN, dateTime, milage, make, model, year),
	FOREIGN KEY (customerID, VIN, dateTime) REFERENCES scheduledMaintenance(customerID, VIN, dateTime),
	FOREIGN KEY (milage, make, model, year) REFERENCES package(milage, make, model, year)
);

CREATE TABLE packageItem (
	itemName VARCHAR(200) NOT NULL,
	milage INT NOT NULL,
	make VARCHAR(40) NOT NULL,
	model VARCHAR(40) NOT NULL,
	year INT NOT NULL,
	PRIMARY KEY (itemName, milage, make, model, year),
	FOREIGN KEY (itemName) REFERENCES item(itemName),
	FOREIGN KEY (milage, make, model, year) REFERENCES package(milage, make, model, year)
);

CREATE TABLE packageItemRequired (
	itemName VARCHAR(200) NOT NULL,
	milage INT NOT NULL,
	make VARCHAR(40) NOT NULL,
	model VARCHAR(40) NOT NULL,
	year INT NOT NULL,
	maintenanceID INT NOT NULL,
	PRIMARY KEY (itemName, milage, make, model, year, maintenanceID),
	FOREIGN KEY (itemName, milage, make, model, year) REFERENCES packageItem(itemName, milage, make, model, year),
	FOREIGN KEY (maintenanceID) REFERENCES maintenanceVisitOrder(maintenanceID)
);

CREATE TABLE itemSkills (
	skillName VARCHAR(50) NOT NULL,
	itemName VARCHAR(200) NOT NULL,
	PRIMARY KEY (skillName, itemName),
	FOREIGN KEY (skillName) REFERENCES skills(name),
	FOREIGN KEY (itemName) REFERENCES item(itemName)
);

CREATE TABLE skillRequiredPackage (
	itemName VARCHAR(200) NOT NULL,
	milage INT NOT NULL,
	make VARCHAR(40) NOT NULL,
	model VARCHAR(40) NOT NULL,
	year INT NOT NULL,
	maintenanceID INT NOT NULL,
	skillName VARCHAR(50) NOT NULL,
	PRIMARY KEY (itemName, milage, make, model, year, maintenanceID, skillName),
	FOREIGN KEY (itemName, milage, make, model, year, maintenanceID) REFERENCES packageItemRequired(itemName, milage, make, model, year, maintenanceID),
	FOREIGN KEY (itemName, skillName) REFERENCES itemSkills(itemName, skillName)
);

CREATE TABLE assignedPackageSkillList (
	itemName VARCHAR(200) NOT NULL,
	milage INT NOT NULL,
	make VARCHAR(40) NOT NULL,
	model VARCHAR(40) NOT NULL,
	year INT NOT NULL,
	maintenanceID INT NOT NULL,
	skillName VARCHAR(50) NOT NULL,
	employeeID INT NOT NULL,
	PRIMARY KEY (itemName, milage, make, model, year, maintenanceID, skillName, employeeID),
	FOREIGN KEY (itemName, milage, make, model, year, maintenanceID, skillName) REFERENCES skillRequiredPackage(itemName, milage, make, model, year, maintenanceID, skillName),
	FOREIGN KEY (skillName, employeeID) REFERENCES mechanicSkills(skillName, employeeID)
);

CREATE TABLE itemRequired (
	itemName VARCHAR(200) NOT NULL,
	maintenanceID INT NOT NULL,
	PRIMARY KEY (itemName, maintenanceID),
	FOREIGN KEY (itemName) REFERENCES item(itemName),
	FOREIGN KEY (maintenanceID) REFERENCES maintenanceVisitOrder(maintenanceID)
);

CREATE TABLE itemSkillRequired (
	skillName VARCHAR(50) NOT NULL,
	itemName VARCHAR(200) NOT NULL,
	maintenanceID INT NOT NULL,
	PRIMARY KEY (skillName, itemName, maintenanceID),
	FOREIGN KEY (skillName, itemName) REFERENCES itemSkills(skillName, itemName),
	FOREIGN KEY (itemName, maintenanceID) REFERENCES itemRequired(itemName, maintenanceID)
);

CREATE TABLE assignedItemSkillList (
	skillName VARCHAR(50) NOT NULL,
	itemName VARCHAR(200) NOT NULL,
	maintenanceID INT NOT NULL,
	employeeID INT NOT NULL,
	PRIMARY KEY (skillName, itemName, maintenanceID, employeeID),
	FOREIGN KEY (skillName, itemName, maintenanceID) REFERENCES itemSkillRequired(skillName, itemName, maintenanceID),
	FOREIGN KEY (skillName, employeeID) REFERENCES mechanicSkills(skillName, employeeID)
);

CREATE TABLE competitor (
	competitorID INT NOT NULL AUTO_INCREMENT,
	companyName VARCHAR(100) NOT NULL,
	address VARCHAR(100),
	city VARCHAR(100),
	zip VARCHAR(20),
	state VARCHAR(50),
	PRIMARY KEY (competitorID),
	CONSTRAINT competitor_name_address_zip_ck01 UNIQUE(companyName, address, zip)
);

CREATE TABLE competitorService (
	competitorID INT NOT NULL,
	itemName VARCHAR(100) NOT NULL,
	cost INT,
	PRIMARY KEY (competitorID, itemName),
	FOREIGN KEY (competitorID) REFERENCES competitor(competitorID),
	FOREIGN KEY (itemName) REFERENCES item(itemName)
);









