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

CREATE TABLE item (
	itemName VARCHAR(200) NOT NULL,
	itemDescrip TEXT,
	cost INT,
	timeRequired INT,
	PRIMARY KEY (itemName)
)

-- Relies on item table 
CREATE TABLE maintenanceItem (
	maintenanceItem VARCHAR(200) NOT NULL,
	customerID INT NOT NULL,
	dateSpent DATE NOT NULL,
	PRIMARY KEY (maintenanceItem, customerID, dateSpent),
	FOREIGN KEY (maintenanceItem) REFERENCES item(itemName),
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
	FOREIGN KEY (jobTitle) REFERENCES jobTitle(jobTitle),
	CONSTRAINT employee_name_phone_ck01 UNIQUE (name, phone)
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

CREATE TABLE internApprentice (
	employeeID INT NOT NULL,
	employmentDuration,
	evaluationNotes TEXT,
	standing,
	PRIMARY KEY (employeeID),
	FOREIGN KEY (employeeID) REFERENCES employee(employeeID)
)

CREATE TABLE internApprenticeSkill (
	employeeID INT NOT NULL,
	skillName VARCHAR(20) NOT NULL,
	PRIMARY KEY (employeeID, skillName),
	FOREIGN KEY (employeeID) REFERENCES internApprentice(employeeID),
	FOREIGN KEY (skillName) REFERENCES skills(name)
)

CREATE TABLE serviceTechnician (
	employeeID INT NOT NULL,
	PRIMARY KEY (employeeID),
	FOREIGN KEY (employeeID) REFERENCES employee(employeeID)
)

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
)

CREATE TABLE instanceOfCar (
	make VARCHAR(40) NOT NULL,
	model VARCHAR(40) NOT NULL,
	year INT NOT NULL,
	licensePlate VARCHAR(20) NOT NULL,
	updatedDate DATE DEFAULT GETDATE(),
	lastIntervalPerformed DATE,
	lastRecordedMilage INT,
	hasHadAccident BOOLEAN DEFAULT 0,
	projectedMilesPerYear INT,
	PRIMARY KEY (licensePlate),
	FOREIGN KEY (make, model, year) REFERENCES vehicle(make, model, year)
)

CREATE TABLE customerCar (
	licensePlate VARCHAR(20) NOT NULL,
	customerID INT NOT NULL,
	PRIMARY KEY (licensePlate, customerID),
	FOREIGN KEY (licensePlate) REFERENCES instanceOfCar(licensePlate),
	FOREIGN KEY (customerID) REFERENCES customer(customerID)
)

CREATE TABLE scheduledMaintenance (
	customerID INT NOT NULL,
	licensePlate VARCHAR(20) NOT NULL,
	dateTime DATETIME NOT NULL,
	cost INT NOT NULL,
	timeRequired INT NOT NULL,
	PRIMARY KEY (customerID, licensePlate, dateTime),
	FOREIGN KEY (customerID, licensePlate) REFERENCES customerCar(licensePlate, customerID)
)

CREATE TABLE maintenanceVisitOrder (
	maintenanceID INT NOT NULL AUTO_INCREMENT,
	licensePlate VARCHAR(20) NOT NULL,
	dateTime DATETIME NOT NULL,
	customerID INT NOT NULL,
	serviceTechnicianID INT NOT NULL,
	PRIMARY KEY (maintenanceID),
	FOREIGN KEY (licensePlate, dateTime, customerID) REFERENCES scheduledMaintenance(licensePlate, dateTime, customerID),
	FOREIGN KEY (serviceTechnicianID) REFERENCES serviceTechnician(employeeID),
	CONSTRAINT maintenanceVisitOrder_lic_datetime_customer_ck01 UNIQUE(licensePlate, dateTime, customerID)
)

CREATE TABLE package (
	milage INT NOT NULL,
	make VARCHAR(40) NOT NULL,
	model VARCHAR(40) NOT NULL,
	year INT NOT NULL,
	cost INT,
	timeRequired INT,
	PRIMARY KEY (milage, make, model, year),
	FOREIGN KEY (make, model, year) REFERENCES vehicle(make, model, year)
)

CREATE TABLE scheduledIntervalMaintenance (
	customerID INT NOT NULL,
	licensePlate VARCHAR(20) NOT NULL,
	dateTime DATETIME NOT NULL,
	milage INT NOT NULL,
	make VARCHAR(40) NOT NULL,
	model VARCHAR(40) NOT NULL,
	year INT NOT NULL,
	PRIMARY KEY (customerID, licensePlate, dateTime, milage, make, model, year),
	FOREIGN KEY (customerID, licensePlate, dateTime) REFERENCES scheduledMaintenance(customerID, licensePlate, dateTime),
	FOREIGN KEY (milage, make, model, year) REFERENCES package(milage, make, model, year)
)

CREATE TABLE packageItem (
	itemName VARCHAR(200) NOT NULL,
	milage INT NOT NULL,
	make VARCHAR(40) NOT NULL,
	model VARCHAR(40) NOT NULL,
	year INT NOT NULL,
	PRIMARY KEY (itemName, milage, make, model, year),
	FOREIGN KEY (itemName) REFERENCES item(itemName),
	FOREIGN KEY (milage, make, model, year) REFERENCES package(milage, make, model, year)
)

CREATE TABLE packageItemRequired (
	itemName VARCHAR(200) NOT NULL,
	milage INT NOT NULL,
	make VARCHAR(40) NOT NULL,
	model VARCHAR(40) NOT NULL,
	year INT NOT NULL,
	maintenanceID INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (itemName, milage, make, model, year, maintenanceID),
	FOREIGN KEY (itemName, milage, make, model, year) REFERENCES packageItem(itemName, milage, make, model, year),
	FOREIGN KEY (maintenanceID) REFERENCES (maintenanceID)
)













