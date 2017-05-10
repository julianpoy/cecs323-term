USE `cecs323-term`;

INSERT INTO customer(customerID, email, phone, customerName, dateJoined) VALUES 
(1,'mindcontrol.maniac@marvel.com',9999998888,'Jessica Jones', '2006-11-03'),
(2,'not.blind@marvel.com',9999997777,'Matthew Murdock','2004-05-11'),
(3,'horrible.acting@marvel.com',9999996666,'Danny Rand','2010-12-10'),
(4,'falcon.punch@marvel.com',9999995555,'Luke Cage', '1993-11-06'),
(5,'captamerica.sucks@marvel.com',9999994444,'Tony Stark', '2013-05-07'),
(6,'MURICAAAA@marvel.com',9999993333,'Steve Rogers', '1999-03-13'),
(7,'mini.ironman@marvel.com',9999992222,'c O Grady', '2001-08-19'),
(8,'i.need.my.own.movie@marvel.com',9999991111,'Natasha Romanoff', '2007-09-15'),
(9,'mindcontrol.master@marvel.com',9999990000,'Wanda Maximoff', '1998-08-23'),
(10,'remake.my.movie.again@marvel.com',9991110000,'Peter Parker', '1997-10-30'),
(11,'my.arms.break@marvel.com',7779990000,'Daisy Johnson', '2005-01-01'),
(12,'iseedeadpeople@marvel.com',9999990000,'Phill Coulson', '2002-07-07'),
(13,'ihavebrotherissues@marvel.com',9999990000,'Grant Ward', '2005-04-15');

INSERT INTO jobTitle (jobTitle) VALUES
('Mechanic'),
('Service Technician'),
('Intern'),
('Apprentice');

INSERT INTO employee(name, phone, jobTitle, employeeID) VALUES 
('Bruce Wayne', 6088811111, 'Service Technician'),
('Clark Kent', 6467771111, 'Mechanic'),
('Selina Kyle', 6086662222, 'Intern'),
('Jason Todd', 6085553333, 'Intern'),
('James Gordon', 6084443333, 'Mechanic'),
('Harvey Dent', 6083334444, 'Mechanic'),
('Barry Allen', 6082225555, 'Service Technician'),
('Hal Jordan', 6081116666, 'Mechanic'),
('Oliver Queen', 6080007777, 'Intern');

INSERT INTO employee (name, phone, jobTitle, employeeID)
values ('Julian Poyourow',3102597616,'Mechanic'),
('Sam Wang',7143697988,'Service Technician'),
('Wesley Huang',5628266596,'Service Technician'),
('Jesse Blacklock',5627081326,'Intern');

DELETE FROM employee;

INSERT INTO employee(name, phone, jobTitle, employeeID) VALUES 
('Bruce Wayne', 6088811111, 'Service Technician',1),
('Clark Kent', 6467771111, 'Mechanic',2),
('Selina Kyle', 6086662222, 'Intern',3),
('Jason Todd', 6085553333, 'Intern',4),
('James Gordon', 6084443333, 'Mechanic',5),
('Harvey Dent', 6083334444, 'Mechanic',6),
('Barry Allen', 6082225555, 'Service Technician',7),
('Hal Jordan', 6081116666, 'Mechanic',8),
('Oliver Queen', 6080007777, 'Intern',9),
('Julian Poyourow',3102597616,'Mechanic',10),
('Sam Wang',7143697988,'Service Technician',11),
('Wesley Huang',5628266596,'Service Technician',12),
('Jesse Blacklock',5627081326,'Intern',13);

INSERT INTO skills (name, description) Values
('Replace Tire','Put a new tire where an old one was.'),
('Change Oil','Put new oil in the car.');

INSERT INTO activeCustomer (customerID) Values
(1),
(2);

INSERT INTO premier (customerID, annualFee, monthlyInstallmentAmount, dateLastPaymentReceived, dateMonthlyFeeLastUpdated,
premierServiceValue) Values
(1, 2300, 175, '2017-05-09', '2016-05-09', 1325);

INSERT INTO prospective (customerID, referralID, status) Values
(3, 1, false);

INSERT INTO contactInstanceDate (customerID, contactInstanceDate) Values
(3, '1999-05-06');

INSERT INTO contactInstanceDate (customerID, contactInstanceDate) Values
(3, '2017-01-01'),
(3, '2017-05-08');

INSERT INTO mechanic(employeeID) VALUES
(10);

INSERT INTO mechanicSkills (employeeID, skillName) Values
(10, 'Replace Tire'),
(10, 'Change Oil');

INSERT INTO mechanic(employeeID) VALUES
(13);

INSERT INTO mentoringRelationship(menteeID, start,end, mentorID, skillname) VALUES
(13, '2017-05-05','2017-05-09',10,'Change Oil');

UPDATE employee
SET JobTitle = 'Mechanic'
WHERE employeeID = 13;

--we need a trigger that only peple listed as mechanics can be put in the mechanic table etc.

INSERT INTO steady(customerID, lastEmailsent, totalLoyaltyPoints) VALUES
(2, '2017-05-06', 3);

INSERT INTO vehicle (make, model, year)VALUES
('Mazda','rx-7', 1984);

INSERT INTO vehicle (make, model, year)VALUES
('Toyota','Corolla', 1991);

INSERT INTO instanceOfCar (make, model, year, VIN, updatedDate, lastIntervalPerformed, lastRecordedMilage, 
hasHadAccident, projectedMilesPerYear, licensePlate, stateCode)
values ('Toyota','Corolla',1991,'1C4NJPBB5FD110411','2017-05-09','2017-05-01',10000,false,100,'2ROG754','CA'),
('Mazda','rx-7',1984,'1FUPAXYB0LP379726','2017-05-09','2017-05-01',3900,false,50,'4VFZ267','CA');

INSERT INTO prospective (customerID, referralID, status) Values
(4, 2, true);

INSERT INTO contactInstanceDate (customerID, contactInstanceDate) Values
(4, '2000-03-01');

INSERT INTO serviceTechnician(employeeID)VALUES
(1);

INSERT INTO customer(customerID, email, phone, customerName, dateJoined) VALUES 
(14,'militarydivision@waynecorp.com',9999998888,'Wayne Corp', '2006-11-03');

INSERT INTO customerCar(VIN,customerID) VALUES 
('1FUPAXYB0LP379726',10);

INSERT INTO scheduledMaintenance(VIN,customerID,dateTime, cost,timeRequired) VALUES 
('1FUPAXYB0LP379726',10, '2016-08-06', 45000, 2),
('1FUPAXYB0LP379726',10, '2016-05-13', 4500, 1),
('1FUPAXYB0LP379726',10, '2016-01-23', 10000, 3),
('1FUPAXYB0LP379726',10, '2010-04-23', 10000, 3);

INSERT INTO customerCar(VIN,customerID) VALUES 
('1C4NJPBB5FD110411',4);

INSERT INTO skills (name, description) Values
('Replace Windshield','Replace an old windshield with a new one.'),
('Unscrew Screw','Unscrew a screw.');

INSERT INTO mechanic (employeeID) Values
(8);

INSERT INTO mechanicSkills (employeeID, skillName) Values
(8, 'Replace Windshield'),
(8, 'Unscrew Screw'),
(10, 'Unscrew Screw'),
(8, 'Replace Tire'),
(13, 'Change Oil');

INSERT INTO mechanicSkills (employeeID, skillName) Values
(8, 'Change Oil');

INSERT INTO item (itemName, itemDescrip, cost, timeRequired)VALUES
('Replace Front Window','Sometimes a car just needs a fresh window.',30000,1),
('Replace All Tires','You cannot drive a car without tires.', 60000, 3),
('Replace Flux Screw','The Flux Screw will need replacing on occasion.', 500, 10); 

INSERT INTO item (itemName, itemDescrip, cost, timeRequired)VALUES
('Seal Refreshment','Rotary Motors are ver strange. Replace them seals!',150000,12);

INSERT INTO package (milage, make, model, year, cost, timeRequired)VALUES
(10000, 'Mazda', 'rx-7', 1984, 210000, 15);    

INSERT INTO packageItem (itemName, milage, make, model, year)VALUES
('Seal Refreshment', 10000, 'Mazda', 'rx-7', 1984);

INSERT INTO packageItem (itemName, milage, make, model, year)VALUES
('Replace All Tires', 10000, 'Mazda', 'rx-7', 1984);
