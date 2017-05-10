--Customers
INSERT INTO customer(customerID, email, phone, customerName, dateJoined) VALUES 
(1, 'mindcontrol.maniac@marvel.com',9999998888, 'Jessica Jones', '2006-11-03'),
(2, 'not.blind@marvel.com',9999997777, 'Matthew Murdock', '2004-05-11'),
(3, 'horrible.acting@marvel.com',9999996666, 'Danny Rand', '2010-12-10'),
(4, 'falcon.punch@marvel.com',9999995555, 'Luke Cage', '1993-11-06'),
(5, 'captamerica.sucks@marvel.com',9999994444, 'Tony Stark', '2013-05-07'),
(6, 'MURICAAAA@marvel.com',9999993333, 'Steve Rogers', '1999-03-13'),
(7, 'mini.ironman@marvel.com',9999992222, 'c O Grady', '2001-08-19'),
(8, 'i.need.my.own.movie@marvel.com',9999991111, 'Natasha Romanoff', '2007-09-15'),
(9, 'mindcontrol.master@marvel.com',9999990000, 'Wanda Maximoff', '1998-08-23'),
(10, 'remake.my.movie.again@marvel.com',9991110000, 'Peter Parker', '1997-10-30'),
(11, 'my.arms.break@marvel.com',7779990000, 'Daisy Johnson', '2005-01-01'),
(12, 'iseedeadpeople@marvel.com',9999990000, 'Phill Coulson', '2002-07-07'),
(13, 'ihavebrotherissues@marvel.com',9999990000, 'Grant Ward', '2005-04-15'),
(14, 'militarydivision@waynecorp.com',9999998888, 'Wayne Corp', '2006-11-03'),
(15, 'majorbully@marvel.com',9998820000, 'Flash Thompson', '1999-08-23'),
(16, 'loveinterest@marvel.com',9934110000, 'Mary Jane Parker', '2000-10-30'),
(17, 'hulkhater@marvel.com',7779990500, 'Thaddeus Ross', '2006-02-01'),
(18, 'powerofpride@marvel.com',9954990000, 'James Power', '2009-07-06'),
(19, 'personalprivacy@marvel.com',9993490000, 'Kitty Pryde', '2002-02-15'),
(20, 'greengoblin@waynecorp.com',9998502888, 'Norman Osborne', '2016-10-03');

INSERT INTO corporation(customerID) VALUES
(14);

INSERT INTO addressType(addressType) VALUES
('Vehicle Delivery'),
('Vehicle Pickup'),
('Mailing'),
('Billing');

INSERT INTO address(customerID, city, state, address, zip, addressType) VALUES
(14, 'Gotham', 'NY',  '1939 Kane St' , 10001, 'Vehicle Delivery'),
(14, 'Gotham', 'NY',  '1940 Kane St' , 10001, 'Vehicle Pickup'),
(14, 'Gotham', 'NY',  '1941 Kane St' , 10001, 'Mailing'),
(14, 'Gotham', 'NY',  '1942 Kane St' , 10001, 'Billing');


--Job titles insert
INSERT INTO jobTitle (jobTitle) VALUES
('Mechanic'),
('Service Technician'),
('Intern'),
('Apprentice');
--Employee Insert
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
('Sam Wang',7143697988, 'Service Technician',11),
('Wesley Huang',5628266596, 'Service Technician',12),
('Jesse Blacklock',5627081326, 'Mechanic',13),
('Julian Poyourow',3102597616, 'Mechanic',14);

--Skills Insert
INSERT INTO skills (name, description) Values
('Replace Tire', 'Put a new tire where an old one was.'),
('Change Oil', 'Put new oil in the car.'),
('Replace Windshield', 'Replace an old windshield with a new one.'),
('Unscrew Screw', 'Unscrew a screw.'),
('Tire Rotation', 'Rotate each tire on a vehicle to maintain longevity'),
('Alternator Replacement', 'Replace a broken or failing alternator'),
('Timing Belt Replacement', 'Replace an old or damage timing belt'),
('Battery Replacement', 'Replace an existing Battery');


--Insert into the active customer table via customerID
INSERT INTO activeCustomer (customerID) Values
(1),
(2),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15);

INSERT INTO premier (customerID, annualFee, monthlyInstallmentAmount, dateLastPaymentReceived, dateMonthlyFeeLastUpdated,
premierServiceValue) Values
(1, 230000, 19167, '2017-05-09', '2016-05-09', 13025),
(13, 123000, 10250, '2017-05-09', '2016-05-09', 14525),
(14, 231000, 19250, '2017-05-09', '2016-05-09', 132050),
(15, 130000, 10833, '2017-05-09', '2016-05-09', 122325);

INSERT INTO prospective (customerID, referralID, status) Values
(3, 1, false),
(16, 14, false),
(17, 15, true),
(18, 2, true),
(19, 6, true),
(20, 2, false),
(4, 2, true);

INSERT INTO contactInstanceDate (customerID, contactInstanceDate) Values
(3, '1999-05-06'),
(3, '2017-01-01'),
(3, '2017-05-08'),
(16, '2016-03-05'),
(16, '2016-09-22'),
(17, '2016-12-18'),
(18, '2017-02-24'),
(19, '2017-12-31'),
(20, '2015-07-27'),
(20, '2016-06-14'),
(20, '2017-05-23'),
(4, '2017-08-20'),
(4, '2000-03-01');

INSERT INTO mechanic(employeeID) VALUES
(2),
(5),
(6),
(13),
(14),
(8);

INSERT INTO mechanicSkills (employeeID, skillName) Values
(8, 'Replace Windshield'),
(8, 'Unscrew Screw'),
(8, 'Replace Tire'),
(8, 'Change Oil'),
(13, 'Replace Windshield'),
(14, 'Replace Tire'),
(14, 'Unscrew Screw'),
(14, 'Change Oil'),
(2, 'Change Oil'),
(2,'Battery Replacement'),
(2,'Unscrew Screw'),
(5,'Tire Rotation'),
(5,'Timing Belt Replacement'),
(6,'Change Oil'),
(6,'Alternator Replacement'),
(6,'Timing Belt Replacement');

INSERT INTO mentoringRelationship(menteeID, start,end, mentorID, skillname) VALUES
(8, '2002-01-01', '2002-01-02', 6 ,'Timing Belt Replacement'),
(13, '2002-01-01', '2002-01-02', 6 ,'Timing Belt Replacement'),
(5, '2012-05-01', '2002-06-02', 2 ,'Unscrew Screw'),
(8, '2004-06-01', '2005-07-02', 2 ,'Unscrew Screw'),
(14, '2010-08-01', '2011-01-02', 13 ,'Replace Windshield');

--we need a trigger that only people listed as mechanics can be put in the mechanic table etc.

INSERT INTO steady(customerID, lastEmailsent, totalLoyaltyPoints) VALUES
(2, '2017-05-06', 3),
(5, '2017-03-16', 10),
(6, '2017-02-06', 13),
(7, '2017-02-26', 7),
(8, '2017-10-06', 14),
(9, '2017-05-15', 15),
(10, '2017-08-14', 9),
(11, '2017-04-06', 11),
(12, '2017-02-10', 5);

INSERT INTO vehicle (make, model, year)VALUES
('Mazda', 'rx-7', 1984),
('Toyota', 'Corolla', 1991),
('Honda', 'Accord', 2000),
('Toyota', 'Camry',2000),
('Honda', 'Accord',2016),
('Honda', 'Civic',2000),
('Honda', 'Civic', 2002),
('Mercedes', 'C',2016),
('Lexus', 'IS-250',2010),
('Honda', 'RLX',2010),
('Tesla', 'Model S',2017),
('Saturn', 'Ion',2008),
('Nissan', 'Pathfinder',2017),
('Toyota', 'Tocoma',2010),
('Nissan', 'Ultima',2001),
('BMW', 'M3',2008),
('Nissan', 'Skyline',2007),
('Lexus', 'LFA',2012),
('Honda', 'CRV',2009),
('Acura', 'RX',2007),
('Ford', 'Focus',2005),
('Mitsubishi', 'Lancer',2008),
('Mitsubishi', 'Eclipse',2009),
('Ford', 'Explorer',2000),
('Dodge', 'Charger',2017),
('Scion', 'FRS',2017),
('Landrover', 'Rangerover',2017),
('Jeep', 'Wrangler',2008),
('Audi', 'Q7',2000),
('Audi', 'A8',2010),
('Jeep', 'Compass',2017),
('Dodge', 'Dart',1999),
('Ford', 'Falcon',1960),
('McClarin', 'P1',2017);


INSERT INTO instanceOfCar (make, model, year, VIN, updatedDate, lastIntervalPerformed, lastRecordedMilage, hasHadAccident, projectedMilesPerYear, licensePlate, stateCode) values
('Toyota',  	'Corolla',1991,  	'1C4NJPBB5FD110411',   '2017-05-09', '2017-05-09', 10000,  false,   100,	'2ROG754', 'CA'),--luke cage
('Mazda',   	'rx-7',1984,      	'1FUPAXYB0LP379726',  '2017-05-09', '2017-05-09',3900,   false,   50, 	'4VFZ267', 'CA'),--peter parker
('Honda',   	'Accord', 2000,   	'1P3ES62Y9SD280227',  '2017-03-01', '2017-05-09',128000, false,   24000,  '4LEE599', 'CA'),--norman osborne
('Mercedes',	'C',2016,     	'1GCHK39F5WE264932',    	'2016-12-03', '2017-05-09',40000,  false,   14000,  'XGONGIV2U', 'CA'),--kitty pryde
('Ford',    	'Falcon', 1960,    	'1FTDF14FXBLA34680', '2015-09-30', '2017-05-09',223143, true,	5000,   'PARSECT', 'TX'),--james power
('Dodge',   	'Charger', 2017,  	'1GD412CG5DF168265',  '2015-01-01', '2017-05-09',38919,  true,	2400,   '8WJA189', 'CA'),--thaddeus ross
('Ford',    	'Explorer', 2000,  	'1FMNU41L25EC33104', '2014-08-30', '2017-05-09',491785, false,   5000,   '54QPN349', 'CA'),--mary jane
('Lexus',   	'IS-250', 2010,   	'1FDJF37E7BRA85936',  '2017-03-28', '2017-05-09',204881, false,   9000,   '9PZN107', 'CA'),--flash thompson
('Audi',    	'Q7', 2000,        	'WBSNB93549CX48458', '2016-02-12', '2017-05-09',290145, false,   1200,   '5PUC817', 'CA'),--wayne corp
('Jeep',    	'Wrangler', 2008,  	'1N6AA0ED3CN307308', '2015-09-30', '2017-05-09',159382, true,	6000,   '7UBN113', 'CA'),--grant ward
('Honda',   	'CRV', 2009,      	'1GBJP32W8C3345917',  '2017-04-04', '2017-05-09',148392, false,   8000,   '9QPF199', 'CA'),--coulson
('Mitsubishi',  'Lancer',2008,   'WMWMR9C53ET314778',   	'2016-05-26', '2017-05-09',200389, false,   15000,  '5PFB978', 'CA'),--daisy j
('Mitsubishi',  'Eclipse',2009,  '1P3BM18AXGD259114',   	'2015-09-22', '2017-05-09',223819, false,   16000,  '9PBI274', 'CA'),--jessica j
('Jeep',    	'Compass',2017,    	'4T1BG22K0XU614236', '2017-11-03', '2017-05-09',46012,  false,   24000,  'Q911NVZ', 'CA'),--wanda
('Dodge',   	'Dart',1999,      	'1GBJP32W0C3327444',  '2017-01-01', '2017-05-09',271844, true,	3000,   'P947VNA', 'CA'),--natasha
('Toyota',  	'Corolla', 1991, 	'2C4GP54362R521549',   '2015-03-25', '2017-05-09',341212, true,	2000,   'U918NNV', 'CA'),--grady
('Tesla',   	'Model S',2017,   	'WD2BD643145647308',  '2014-11-29', '2017-05-09',12000,  false,   10000,  'P119JVA', 'CA'),--steve rogers
('Saturn',  	'Ion',2008,      	'1G1JF6SH1C4137396',   '2017-04-09', '2017-05-09',162438, false,   24000,  'N111UUQ', 'CA'),--stark
('Nissan',  	'Pathfinder',2017,   '1FMZU62E73ZB60203',   '2016-06-16', '2017-05-09',80000,  true,	60000,  'WORLSTAR', 'CA'),--stark
('BMW',     	'M3',2008,          	'1G1ZS58N18F141143','2015-07-29', '2017-05-09',201894, false,   8000,   'N399PAN', 'CA');--stark






INSERT INTO serviceTechnician(employeeID)VALUES
(1),(7),(11),(12),(13);
INSERT INTO customerCar(VIN,customerID) VALUES 
('1FUPAXYB0LP379726', 10),--peter parker
('1C4NJPBB5FD110411', 4),--luke cage
('1P3ES62Y9SD280227', 20),--norman osborne
('1GCHK39F5WE264932', 19),--kitty pryde
('1FTDF14FXBLA34680', 18),--james power
('1GD412CG5DF168265',17),--thaddeus ross
('1FMNU41L25EC33104',16),--mary jane
('1FDJF37E7BRA85936',15),--flash thompson
('WBSNB93549CX48458',14),--wayne corp
('1N6AA0ED3CN307308',13),--grant ward
('1GBJP32W8C3345917',12),--phill coulson
('WMWMR9C53ET314778',11),--daisy johnson
('1P3BM18AXGD259114',1),--jessica jones
('4T1BG22K0XU614236', 9),--wanda
('1GBJP32W0C3327444', 8),--natasha
('2C4GP54362R521549', 7),--Grady
('WD2BD643145647308', 6),--steve rogers
('1G1JF6SH1C4137396', 5),--stark
('1FMZU62E73ZB60203', 5),--stark
('1G1ZS58N18F141143', 5);--stark

INSERT INTO scheduledMaintenance(VIN,customerID,dateTime, cost,timeRequired) VALUES 
('1FUPAXYB0LP379726',10, '2016-08-06', 45000, 2), --peter paker
('1FUPAXYB0LP379726',10, '2016-05-13', 4500, 1),--peter paker
('1FUPAXYB0LP379726',10, '2016-01-23', 10000, 3),--peter paker
('1FUPAXYB0LP379726',10, '2010-04-23', 10000, 3),--peter paker
('1C4NJPBB5FD110411',4, '2015-09-11', 66000, 5),--luke cage
('1C4NJPBB5FD110411',4, '2016-03-21', 30000, 3),--luke cage
('1C4NJPBB5FD110411',4, '2016-09-25', 11000, 1),--luke cage
('1C4NJPBB5FD110411',4, '2017-12-22', 5500, 1),--luke cage
('1P3ES62Y9SD280227',20, '2015-04-14', 111100, 5),--norman osborne
('1P3ES62Y9SD280227',20, '2016-04-11', 311100, 12),--norman osborne
('1GCHK39F5WE264932',19, '2016-01-15', 655700, 7),--kitty pryde
('1FTDF14FXBLA34680',18, '2016-04-04', 291500, 4),--james power
('1FTDF14FXBLA34680',18, '2017-04-05', 116100, 4),--james power
('1FTDF14FXBLA34680',18, '2016-09-02', 895800, 4),--james power
('1GD412CG5DF168265',17, '2017-07-21', 250900, 2),--thaddeus ross
('1FMNU41L25EC33104',16, '2017-07-06', 887300, 8),--mary jane
('1FMNU41L25EC33104',16, '2017-09-04', 222100, 2),--mary jane
('1FDJF37E7BRA85936',15, '2017-03-21', 278300, 2),--flash thompson
('1FDJF37E7BRA85936',15, '2016-03-21', 278300, 2),--flash thompson
('WBSNB93549CX48458',14, '2016-04-01', 135400, 1),--wayne corp
('WBSNB93549CX48458',14, '2016-04-11', 25100, 1),--wayne corp
('WBSNB93549CX48458',14, '2016-10-19', 305900, 3),--wayne corp
('WBSNB93549CX48458',14, '2017-06-13', 218900, 2),--wayne corp
('WBSNB93549CX48458',14, '2016-01-19', 264800, 2),--wayne corp
('1N6AA0ED3CN307308',13, '2016-04-11', 471700, 4),--grant ward
('1GBJP32W8C3345917',12, '2016-08-25', 61700, 1),--phill coulson
('WMWMR9C53ET314778',11, '2017-06-26', 220400, 2),--daisy johnson
('1P3BM18AXGD259114',1, '2015-08-07', 424000, 4),--jessica jones
('1P3BM18AXGD259114',1, '2017-03-07', 424000, 4),--jessica jones
('1P3BM18AXGD259114',1, '2015-08-14', 67900, 1),--jessica jones
('1P3BM18AXGD259114',1, ' 2015-12-07', 240900, 2),--jessica jones
('4T1BG22K0XU614236',9, '2015-09-05', 512300, 5),--wanda
('1GBJP32W0C3327444',8, '2016-07-16', 307800, 3),--natasha
('1GBJP32W0C3327444',8, '2016-10-28', 212900, 2),--natasha
('1GBJP32W0C3327444',8, '2017-05-06', 161900, 1),--natasha
('2C4GP54362R521549',7, '2015-07-07', 274100, 2),--Grady
('WD2BD643145647308',6, '2015-11-27', 138300, 1),--steve rogers
('WD2BD643145647308',6, '2016-01-26', 224300, 2),--steve rogers
('1G1JF6SH1C4137396',5, '2016-06-28', 133100, 1),--stark
('1G1JF6SH1C4137396',5, '2016-11-29', 135300, 1),--stark
('1G1JF6SH1C4137396',5, '2015-07-17', 153100, 1),--stark
('1G1JF6SH1C4137396',5, '2016-05-26', 13410, 1),--stark
('1FMZU62E73ZB60203',5, '2016-07-27', 62000, 1),--stark
('1FMZU62E73ZB60203',5, '2016-11-22', 39600, 1),--stark
('1G1ZS58N18F141143',5, '2016-01-13', 298200, 2),--stark
('1G1ZS58N18F141143',5, '2016-03-01', 196300, 1),--stark
('1G1ZS58N18F141143',5, '2016-09-01', 169000, 2);--stark

INSERT INTO item (itemName, itemDescrip, cost, timeRequired)VALUES
('Replace Front Window', 'Sometimes a car just needs a fresh window.',30000,1),
('Replace All Tires', 'You cannot drive a car without tires.', 60000, 3),
('Replace Flux Screw', 'The Flux Screw will need replacing on occasion.', 500, 10),
('Seal Refreshment', 'Rotary Motors are very strange. Replace them seals!',150000,12),
('Oil Change', 'Replace and Drain Motor Oil', 2500, 1),
('Replace Break Pads', 'Replace Break Pads', 24000, 2),
('Transmission Check', 'Flush and Replace Transmission as needed', 3200, 1),
('Refill Blinker Fluid', 'Top off vital blinker fluid for certain drivers', 500, 9),
('Battery Inspection', 'Check health of battery and replace as needed', 9000, 1),
('Inspect and Replace Coolant', 'Replace Coolant as needed', 10000, 4),
('Change Break Fluid', 'Replace and Drain Break Fluid', 7500, 2),
('Replace Exhaust System', 'Replace Exhaust Components', 50000, 12),
('50k Base List', 'Oil Change, Replace Break Pads, Transmission Check, Battery Inspection, Change Break Fluid)', 12000, 12),
('100k Base List', 'Oil Change, Replace Break Pads, Transmission Check, Battery Inspection, Change Break Fluid, Replace All Tires)', 18000, 14),
('150k Base List', 'Oil Change, Replace Break Pads, Transmission Check, Battery Inspection, Change Break Fluid, Replace Flux Screw, Replace All Tires)', 24000, 14);


INSERT INTO package (make, model, year, cost, timeRequired, milage)VALUES
('Mazda', 'rx-7', 1984, 671500, 6, 50000),    
('Mazda', 'rx-7', 1984, 123300, 8, 100000),
('Mazda', 'rx-7', 1984, 709200, 7, 150000),
('Toyota', 'Corolla', 1991, 520500, 5, 50000),
('Toyota', 'Corolla', 1991, 476600, 4, 100000),
('Toyota', 'Corolla', 1991, 292900, 3, 150000),
('Honda', 'Accord', 2000, 303300, 3, 50000),
('Honda', 'Accord', 2000, 481400, 5, 100000),
('Honda', 'Accord', 2000, 412300, 4, 150000),
('Toyota', 'Camry',2000, 629200, 6, 50000),
('Toyota', 'Camry',2000, 304400, 3, 100000),
('Toyota', 'Camry',2000, 574200, 5, 150000),
('Honda', 'Accord',2016, 283200, 3, 50000),
('Honda', 'Accord',2016, 323300, 3, 100000),
('Honda', 'Accord',2016, 694200, 7, 150000),
('Honda', 'Civic',2000, 666800, 6, 50000),
('Honda', 'Civic',2000, 432300, 4, 100000),
('Honda', 'Civic',2000, 352800, 3, 150000),
('Honda', 'Civic',2002, 466800, 6, 50000),
('Honda', 'Civic',2002, 632300, 4, 100000),
('Honda', 'Civic',2002, 332800, 3, 150000),
('Mercedes', 'C',2016, 701800, 7, 50000),
('Mercedes', 'C',2016, 779800, 8, 100000),
('Mercedes', 'C',2016, 678300, 6, 150000),
('Lexus', 'IS-250',2010, 396300, 3, 50000),
('Lexus', 'IS-250',2010, 595200, 3, 100000),
('Lexus', 'IS-250',2010, 501200, 3, 150000),
('Honda', 'RLX',2010, 531100, 5, 50000),
('Honda', 'RLX',2010, 388700, 3, 100000),
('Honda', 'RLX',2010, 765900, 7, 150000),
('Tesla', 'Model S',2017, 671300, 6, 50000),
('Tesla', 'Model S',2017, 768900, 7, 100000),
('Tesla', 'Model S',2017, 603300, 6, 150000),
('Saturn', 'Ion',2008, 459500, 4, 50000),
('Saturn', 'Ion',2008, 673000, 6, 100000),
('Saturn', 'Ion',2008, 411800, 4, 150000),
('Nissan', 'Pathfinder',2017, 257600, 2, 50000),
('Nissan', 'Pathfinder',2017, 579800, 5, 100000),
('Nissan', 'Pathfinder',2017, 691400, 6, 150000),
('Toyota', 'Tocoma',2010, 711400, 7, 50000),
('Toyota', 'Tocoma',2010, 570200, 5, 100000),
('Toyota', 'Tocoma',2010, 474400, 4, 150000),
('Nissan', 'Ultima',2001, 290900, 3, 50000),
('Nissan', 'Ultima',2001, 490200, 4, 100000),
('Nissan', 'Ultima',2001, 610800, 6, 150000),
('BMW', 'M3',2008, 289600, 3, 50000),
('BMW', 'M3',2008, 626300, 6, 100000),
('BMW', 'M3',2008, 446500, 4, 150000),
('Nissan', 'Skyline',2007, 687300, 6, 50000),
('Nissan', 'Skyline',2007, 355500, 3, 100000),
('Nissan', 'Skyline',2007, 439000, 4, 150000),
('Lexus', 'LFA',2012, 603100, 6, 50000),
('Lexus', 'LFA',2012, 746500, 7, 100000),
('Lexus', 'LFA',2012, 489000, 4, 150000),
('Honda', 'CRV',2009, 358500, 3, 50000),
('Honda', 'CRV',2009, 472400, 4, 100000),
('Honda', 'CRV',2009, 256600, 2, 150000),
('Acura', 'RX',2007, 411100, 4, 50000),
('Acura', 'RX',2007, 416400, 4, 100000),
('Acura', 'RX',2007, 788100, 7, 150000),
('Ford', 'Focus',2005, 355200, 3, 50000),
('Ford', 'Focus',2005, 658300, 6, 100000),
('Ford', 'Focus',2005, 261900, 2, 150000),
('Mitsubishi', 'Lancer',2008, 428400, 4, 50000),
('Mitsubishi', 'Lancer',2008, 327100, 3, 100000),
('Mitsubishi', 'Lancer',2008, 545000, 5, 150000),
('Mitsubishi', 'Eclipse',2009, 339300, 3, 50000),
('Mitsubishi', 'Eclipse',2009, 706500, 7, 100000),
('Mitsubishi', 'Eclipse',2009, 678200, 6, 150000),
('Ford', 'Explorer',2000, 715700, 7, 50000),
('Ford', 'Explorer',2000, 259100, 2, 100000),
('Ford', 'Explorer',2000, 740400, 7, 150000),
('Dodge', 'Charger',2017, 351900, 3, 50000),
('Dodge', 'Charger',2017, 718000, 7, 100000),
('Dodge', 'Charger',2017, 393100, 4, 150000),
('Scion', 'FRS',2017, 535300, 5, 50000),
('Scion', 'FRS',2017, 437700, 4, 100000),
('Scion', 'FRS',2017, 501100, 5, 150000),
('Landrover', 'Rangerover',2017, 402400, 4, 50000),
('Landrover', 'Rangerover',2017, 525900, 5, 100000),
('Landrover', 'Rangerover',2017, 271000, 2, 150000),
('Jeep', 'Wrangler',2008, 698100, 6, 50000),
('Jeep', 'Wrangler',2008, 771700, 7, 100000),
('Jeep', 'Wrangler',2008, 261700, 2, 150000),
('Audi', 'Q7',2000, 394200, 4, 50000),
('Audi', 'Q7',2000, 482300, 4, 100000),
('Audi', 'Q7',2000, 318100, 3, 150000),
('Audi', 'A8',2010, 642300, 6, 50000),
('Audi', 'A8',2010, 322500, 3, 100000),
('Audi', 'A8',2010, 362900, 3, 150000),
('Jeep', 'Compass',2017, 586600, 5, 50000),
('Jeep', 'Compass',2017, 383700, 4, 100000),
('Jeep', 'Compass',2017, 696500, 7, 150000),
('Dodge', 'Dart',1999, 630700, 6, 50000),
('Dodge', 'Dart',1999, 403100, 4, 100000),
('Dodge', 'Dart',1999, 799600, 8, 150000),
('Ford', 'Falcon',1960, 717600, 7, 50000),
('Ford', 'Falcon',1960, 400400, 4, 100000),
('Ford', 'Falcon',1960, 268300, 2, 150000),
('McClarin', 'P1',2017, 543300, 5, 50000),
('McClarin', 'P1',2017, 755900, 7, 100000),
('McClarin', 'P1',2017, 725000, 7, 150000);   


INSERT INTO packageItem (make, model, year, milage, itemName)VALUES
('Mazda', 'rx-7', 1984, 50000, '50k Base List'),
('Mazda', 'rx-7', 1984, 100000, '100k Base List'),
('Mazda', 'rx-7', 1984, 150000, '150k Base List'),
('Toyota', 'Corolla', 1991, 50000, '50k Base List'),
('Toyota', 'Corolla', 1991, 100000, '100k Base List'),
('Toyota', 'Corolla', 1991, 150000, '150k Base List'),
('Honda', 'Accord', 2000, 50000, '50k Base List'),
('Honda', 'Accord', 2000, 100000, '100k Base List'),
('Honda', 'Accord', 2000, 150000, '150k Base List'),
('Toyota', 'Camry',2000, 50000, '50k Base List'),
('Toyota', 'Camry',2000, 100000, '100k Base List'),
('Toyota', 'Camry',2000, 150000, '150k Base List'),
('Honda', 'Accord',2016, 50000, '50k Base List'),
('Honda', 'Accord',2016, 100000, '100k Base List'),
('Honda', 'Accord',2016, 150000, '150k Base List'),
('Honda', 'Civic',2000, 50000, '50k Base List'),
('Honda', 'Civic',2000, 100000, '100k Base List'),
('Honda', 'Civic',2000, 150000, '150k Base List'),
('Honda', 'Civic', 2002, 50000, '50k Base List'),
('Honda', 'Civic', 2002, 100000, '100k Base List'),
('Honda', 'Civic', 2002, 150000, '150k Base List'),
('Mercedes', 'C',2016, 50000, '50k Base List'),
('Mercedes', 'C',2016, 100000, '100k Base List'),
('Mercedes', 'C',2016, 150000, '150k Base List'),
('Lexus', 'IS-250',2010, 50000, '50k Base List'),
('Lexus', 'IS-250',2010, 100000, '100k Base List'),
('Lexus', 'IS-250',2010, 150000, '150k Base List'),
('Honda', 'RLX',2010, 50000, '50k Base List'),
('Honda', 'RLX',2010, 100000, '100k Base List'),
('Honda', 'RLX',2010, 150000, '150k Base List'),
('Tesla', 'Model S',2017, 50000, '50k Base List'),
('Tesla', 'Model S',2017, 100000, '100k Base List'),
('Tesla', 'Model S',2017, 150000, '150k Base List'),
('Saturn', 'Ion',2008, 50000, '50k Base List'),
('Saturn', 'Ion',2008, 100000, '100k Base List'),
('Saturn', 'Ion',2008, 150000, '150k Base List'),
('Nissan', 'Pathfinder',2017, 50000, '50k Base List'),
('Nissan', 'Pathfinder',2017, 100000, '100k Base List'),
('Nissan', 'Pathfinder',2017, 150000, '150k Base List'),
('Toyota', 'Tocoma',2010, 50000, '50k Base List'),
('Toyota', 'Tocoma',2010, 100000, '100k Base List'),
('Toyota', 'Tocoma',2010, 150000, '150k Base List'),
('Nissan', 'Ultima',2001, 50000, '50k Base List'),
('Nissan', 'Ultima',2001, 100000, '100k Base List'),
('Nissan', 'Ultima',2001, 150000, '150k Base List'),
('BMW', 'M3',2008, 50000, '50k Base List'),
('BMW', 'M3',2008, 100000, '100k Base List'),
('BMW', 'M3',2008, 150000, '150k Base List'),
('Nissan', 'Skyline',2007, 50000, '50k Base List'),
('Nissan', 'Skyline',2007, 100000, '100k Base List'),
('Nissan', 'Skyline',2007, 150000, '150k Base List'),
('Lexus', 'LFA',2012, 50000, '50k Base List'),
('Lexus', 'LFA',2012, 100000, '100k Base List'),
('Lexus', 'LFA',2012, 150000, '150k Base List'),
('Honda', 'CRV',2009, 50000, '50k Base List'),
('Honda', 'CRV',2009, 100000, '100k Base List'),
('Honda', 'CRV',2009, 150000, '150k Base List'),
('Acura', 'RX',2007, 50000, '50k Base List'),
('Acura', 'RX',2007, 100000, '100k Base List'),
('Acura', 'RX',2007, 150000, '150k Base List'),
('Ford', 'Focus',2005, 50000, '50k Base List'),
('Ford', 'Focus',2005, 100000, '100k Base List'),
('Ford', 'Focus',2005, 150000, '150k Base List'),
('Mitsubishi', 'Lancer',2008, 50000, '50k Base List'),
('Mitsubishi', 'Lancer',2008, 100000, '100k Base List'),
('Mitsubishi', 'Lancer',2008, 150000, '150k Base List'),
('Mitsubishi', 'Eclipse',2009, 50000, '50k Base List'),
('Mitsubishi', 'Eclipse',2009, 100000, '100k Base List'),
('Mitsubishi', 'Eclipse',2009, 150000, '150k Base List'),
('Ford', 'Explorer',2000, 50000, '50k Base List'),
('Ford', 'Explorer',2000, 100000, '100k Base List'),
('Ford', 'Explorer',2000, 150000, '150k Base List'),
('Dodge', 'Charger',2017, 50000, '50k Base List'),
('Dodge', 'Charger',2017, 100000, '100k Base List'),
('Dodge', 'Charger',2017, 150000, '150k Base List'),
('Scion', 'FRS',2017, 50000, '50k Base List'),
('Scion', 'FRS',2017, 100000, '100k Base List'),
('Scion', 'FRS',2017, 150000, '150k Base List'),
('Landrover', 'Rangerover',2017, 50000, '50k Base List'),
('Landrover', 'Rangerover',2017, 100000, '100k Base List'),
('Landrover', 'Rangerover',2017, 150000, '150k Base List'),
('Jeep', 'Wrangler',2008, 50000, '50k Base List'),
('Jeep', 'Wrangler',2008, 100000, '100k Base List'),
('Jeep', 'Wrangler',2008, 150000, '150k Base List'),
('Audi', 'Q7',2000, 50000, '50k Base List'),
('Audi', 'Q7',2000, 100000, '100k Base List'),
('Audi', 'Q7',2000, 150000, '150k Base List'),
('Audi', 'A8',2010, 50000, '50k Base List'),
('Audi', 'A8',2010, 100000, '100k Base List'),
('Audi', 'A8',2010, 150000, '150k Base List'),
('Jeep', 'Compass',2017, 50000, '50k Base List'),
('Jeep', 'Compass',2017, 100000, '100k Base List'),
('Jeep', 'Compass',2017, 150000, '150k Base List'),
('Dodge', 'Dart',1999, 50000, '50k Base List'),
('Dodge', 'Dart',1999, 100000, '100k Base List'),
('Dodge', 'Dart',1999, 150000, '150k Base List'),
('Ford', 'Falcon',1960, 50000, '50k Base List'),
('Ford', 'Falcon',1960, 100000, '100k Base List'),
('Ford', 'Falcon',1960, 150000, '150k Base List'),
('McClarin', 'P1',2017, 50000, '50k Base List'),
('McClarin', 'P1',2017, 100000, '100k Base List'),
('McClarin', 'P1',2017, 150000, '150k Base List');

INSERT INTO loyaltyPointsSpent(customerID, dateSpent, numberLoyaltyPointsSpent) VALUES
(2, '2017-05-05', 2),
(2, '2017-05-04', 1),
(5, '2017-03-04', 10),
(6, '2017-03-17', 4),
(6, '2017-07-17', 3),
(8, '2017-10-14', 8),
(9, '2017-10-19', 12),
(10, '2017-01-27', 5),
(11, '2017-06-09', 11);

INSERT INTO scheduledIntervalMaintenance (VIN, customerID, dateTime, make, model, year, milage) VALUES 
('1FUPAXYB0LP379726',10, '2016-08-06', 'Mazda', 'rx-7',1984,50000),
('1FUPAXYB0LP379726',10, '2016-05-13', 'Mazda', 'rx-7',1984,100000),
('1FUPAXYB0LP379726',10, '2016-01-23', 'Mazda', 'rx-7',1984,150000),
('1C4NJPBB5FD110411',4, '2015-09-11', 'Toyota', 'Corolla',1991,50000),
('1C4NJPBB5FD110411',4, '2016-03-21', 'Toyota', 'Corolla',1991,100000),
('1P3ES62Y9SD280227',20, '2015-04-14', 'Honda', 'Accord',2000,50000),
('1GCHK39F5WE264932',19, '2016-01-15','Mercedes', 'C',2016,50000),
('1FTDF14FXBLA34680',18, '2016-04-04', 'Ford', 'Falcon',1960,50000),
('1FTDF14FXBLA34680',18, '2017-04-05', 'Ford', 'Falcon',1960,100000),
('1GD412CG5DF168265',17, '2017-07-21', 'Dodge', 'Charger',2017,50000), --thaddeus
('1FMNU41L25EC33104',16, '2017-07-06', 'Ford', 'Explorer',2000,50000),--mary jane
('WBSNB93549CX48458',14, '2016-04-01', 'Audi', 'Q7',2000,50000),--wayne
('WBSNB93549CX48458',14, '2016-04-11', 'Audi', 'Q7',2000,100000),
('WBSNB93549CX48458',14, '2016-10-19', 'Audi', 'Q7',2000,150000),
('1N6AA0ED3CN307308',13, '2016-04-11', 'Jeep', 'Wrangler',2008,50000), --ward
('1P3BM18AXGD259114',1, '2015-08-07', 'Mitsubishi', 'Eclipse',2009,50000), --jessica jones
('1P3BM18AXGD259114',1, '2015-08-14', 'Mitsubishi', 'Eclipse',2009,100000),
('1GBJP32W0C3327444',8, '2016-07-16', 'Dodge', 'Dart',1999,50000), --natasha
('1GBJP32W0C3327444',8, '2016-10-28', 'Dodge', 'Dart',1999,100000), 
('WD2BD643145647308',6, '2015-11-27', 'Tesla', 'Model S',2017,50000),--steve rodgers
('1G1JF6SH1C4137396',5, '2016-06-28', 'Saturn', 'Ion',2008,50000),--stark
('1FMZU62E73ZB60203',5, '2016-07-27', 'Nissan', 'Pathfinder',2017,50000),--stark
('1FMZU62E73ZB60203',5, '2016-11-22', 'Nissan', 'Pathfinder',2017,100000),--stark
('1G1ZS58N18F141143',5, '2016-01-13', 'BMW', 'M3',2008,50000),--stark
('1G1ZS58N18F141143',5, '2016-03-01', 'BMW', 'M3',2008,100000); --stark


INSERT INTO maintenanceVisitOrder (maintenanceID, VIN, dateTime, customerID, serviceTechnicianID) VALUES
(1, '1FUPAXYB0LP379726', '2016-08-06', 10, 1),
(2, '1FUPAXYB0LP379726', '2016-05-13', 10, 1),
(3, '1FUPAXYB0LP379726', '2016-01-23', 10, 1),
(4, '1FUPAXYB0LP379726', '2010-04-23', 10, 1),
(6, '1C4NJPBB5FD110411', '2015-09-11', 4, 1),
(7, '1C4NJPBB5FD110411', '2016-03-21', 4, 1),
(8, '1C4NJPBB5FD110411', '2016-09-25', 4, 1),
(9, '1C4NJPBB5FD110411', '2017-12-22', 4, 1),
(10, '1P3ES62Y9SD280227', '2015-04-14', 20, 1),
(11, '1P3ES62Y9SD280227', '2016-04-11', 20, 1),
(12, '1GCHK39F5WE264932', '2016-01-15', 19, 1),
(13, '1FTDF14FXBLA34680', '2016-04-04', 18, 1),
(14, '1FTDF14FXBLA34680', '2017-04-05', 18, 1),
(15, '1FTDF14FXBLA34680', '2016-09-02', 18, 1),
(16, '1GD412CG5DF168265', '2017-07-21', 17, 1),
(17, '1FMNU41L25EC33104', '2017-07-06', 16, 1),
(18, '1FMNU41L25EC33104', '2017-09-04', 16, 1),
(19, '1FDJF37E7BRA85936', '2016-03-21', 15, 1),
(20, 'WBSNB93549CX48458', '2016-04-01', 14, 1),
(21, 'WBSNB93549CX48458', '2016-04-11', 14, 1),
(22, 'WBSNB93549CX48458', '2016-10-19', 14, 1),
(23, 'WBSNB93549CX48458', '2017-06-13', 14, 1),
(24, 'WBSNB93549CX48458', '2016-01-19', 14, 1),
(25, '1N6AA0ED3CN307308', '2016-04-11', 13, 1),
(26, '1GBJP32W8C3345917', '2016-08-25', 12, 1),
(27, 'WMWMR9C53ET314778', '2017-06-26', 11, 1),
(28, '1P3BM18AXGD259114', '2015-08-07', 1, 1),
(29, '1P3BM18AXGD259114', '2015-08-14', 1, 1),
(30, '1P3BM18AXGD259114', '2015-12-07', 1, 1),
(31, '4T1BG22K0XU614236', '2015-09-05', 9, 1),
(32, '1GBJP32W0C3327444', '2016-07-16', 8, 1),
(33, '1GBJP32W0C3327444', '2016-10-28', 8, 1),
(34, '1GBJP32W0C3327444', '2017-05-06', 8, 1),
(35, '2C4GP54362R521549', '2015-07-07', 7, 1),
(36, 'WD2BD643145647308', '2015-11-27', 6, 1),
(37, 'WD2BD643145647308', '2016-01-26', 6, 1),
(38, '1G1JF6SH1C4137396', '2016-06-28', 5, 1),
(39, '1G1JF6SH1C4137396', '2016-11-29', 5, 1),
(40, '1G1JF6SH1C4137396', '2015-07-17', 5, 1),
(41, '1G1JF6SH1C4137396', '2016-05-26', 5, 1),
(42, '1FMZU62E73ZB60203', '2016-07-27', 5, 1),
(43, '1FMZU62E73ZB60203', '2016-11-22', 5, 1),
(44, '1G1ZS58N18F141143', '2016-03-01', 5, 1),
(45, '1G1ZS58N18F141143', '2016-09-01', 5, 1);

INSERT INTO packageItemRequired (itemName, make, model, year, milage, maintenanceID) VALUES
( '50k Base List', 'Mazda', 'rx-7', 1984, 50000, 1),
( '100k Base List', 'Mazda', 'rx-7', 1984, 100000, 2),
( '150k Base List', 'Mazda', 'rx-7', 1984, 150000, 3),
( '50k Base List', 'Toyota', 'Corolla', 1991, 50000, 6),
( '100k Base List', 'Toyota', 'Corolla', 1991, 100000, 7),
( '50k Base List', 'Honda', 'Accord', 2000, 50000, 10),
( '50k Base List', 'Mercedes', 'C', 2016, 50000, 12),
( '50k Base List', 'Ford', 'Falcon', 1960, 50000, 14),
( '100k Base List', 'Ford', 'Falcon', 1960, 100000, 15),
( '50k Base List', 'Dodge', 'Charger', 2017, 50000, 16),
( '50k Base List', 'Ford', 'Explorer', 2000, 50000, 17),
( '50k Base List', 'Audi', 'Q7', 2000, 50000, 20),
( '100k Base List', 'Audi', 'Q7', 2000, 100000, 21),
( '150k Base List', 'Audi', 'Q7', 2000, 150000, 22),
( '50k Base List', 'Jeep', 'Wrangler', 2008, 50000, 25),
( '50k Base List', 'Mitsubishi', 'Eclipse', 2009, 50000, 28),
( '100k Base List', 'Mitsubishi', 'Eclipse', 2009, 100000, 29),
( '50k Base List', 'Dodge', 'Dart', 1999, 50000, 32),
( '100k Base List', 'Dodge', 'Dart', 1999, 100000, 33),
( '50k Base List', 'Tesla', 'Model S', 2017, 50000, 36),
( '50k Base List', 'Saturn', 'Ion', 2008, 50000, 38),
( '50k Base List', 'Nissan', 'Pathfinder', 2017, 50000, 42),
( '100k Base List', 'Nissan', 'Pathfinder', 2017, 100000, 43),
( '50k Base List', 'BMW', 'M3', 2008, 50000, 44),
( '100k Base List', 'BMW', 'M3', 2008, 100000, 45);

INSERT INTO leaveType (leaveType) VALUES
('Sick'),
('Personal'),
('Maternity'),
('Religious Observance'),
('Vacation'),
('Jury Duty'),
('Military'),
('Victim'),
('Bereavement');

INSERT INTO experiencedEmployee(employeeID) VALUES
(11),
(14),
(5),
(1),
(12),
(2);

INSERT INTO steadyReferral (customerID, referralID, date, dateOilChangeReceived) VALUES
(2,3,'2010-05-20','2013-02-16'),
(2,4,'2013-02-16','2013-02-16'),
(2,18,'2000-01-10','2013-02-16'),
(6,19,'2001-09-14','2013-02-16');
--CustomerID is doing the referring. ReferralID is being referred
INSERT INTO premierReferral (customerID, referralID, date) VALUES
(14, 16, '2015-10-20'),
(15, 17, '2016-01-17');

INSERT INTO private (customerID, address, city, state, zip) VALUES
(1, '914 Telepathic Turn', 'New York', 'NY', 10001),
(2, '162 Lawson Lane', 'Hells Kitchen', 'NY', 10004),
(3, '189 Havel Street', 'New York', 'NY', 10001),
(4, '425 Hero Blvd', 'Harlem', 'NY', 10051),
(5, '100 Stark Tower', 'New York', 'NY', 10011),
(6, '100 Freedom Road', 'Greyville', 'WA', 200101),
(7, '200 Sidekick Street', 'New York', 'NY', 10011),
(8, '007 Spy Street', 'New York', 'NY', 10010),
(9, '915 Telepathic Turn', 'New York', 'NY', 10001),
(10, '20 Ingram St', 'Queens', 'NY', 11375),
(11, '3511 Coulson Lane', 'Columbia', 'WA', 20001),
(12, '4528 Tahitti Street', 'Morro Bay', 'CA', 93442),
(13, '6732 E Wardlow Rd', 'Long Beach', 'CA', 90808),
(15, '100 Bully Creek Road', 'Vale', 'OR', 97918),
(16, '24 Ingram St', 'Queens', 'NY', 11375),
(17, '2651 E Thompson St', 'Long Beach', 'CA', 90805),
(18, '1337 Power Place', 'New York', 'NY', 10012),
(19, '1487 Watcher Lane', 'New York', 'NY', 10001),
(20, '40 Ingram St', 'Queens', 'NY', 11375);

INSERT INTO employeeReview (revieweeID, reviewerID, date, evaluationNotes) VALUES
(13,14,'2010-05-20', 'Always looks tired.'),
(13,12,'2013-02-16', 'Calls in the middle of date night.'),
(11,14,'2000-01-10', 'Nice fellow.'),
(14,12,'2001-09-14', 'Hotshot programmer.'),
(12,14,'2001-09-14', 'Intrepid computer scientist.');

INSERT INTO competitor (competitorID, companyName, address, city, zip, state) VALUES
(1,'Sleazy Joes Automotive','1322 Heyou Ave.','Tabera','93244','CA'),
(2,'Generico Cars','2244 Bland St.','Greyville','90015','CA');

INSERT INTO competitorService (competitorID, itemName, cost) VALUES
(1, 'Inspect and Replace Coolant',3400),
(2, 'Refill Blinker Fluid',6575),
(1, 'Refill Blinker Fluid',5275),
(1, 'Replace Front Window', 20000),
(2, 'Replace Front Window', 45000),
(1, 'Oil Change', 2499),
(2, 'Oil Change', 2800),
(1, 'Battery Inspection', 100),
(2, 'Battery Inspection', 120000);

INSERT INTO daysOff(start, end, employeeID, reason, leaveType) VALUES
('2016-01-01', '2016-01-05', 12,'A bad case of exhausted.', 'Sick'),
('2016-01-01', '2016-01-05', 13,'He needs a break.', 'Vacation'),
('2016-01-01', '2016-01-05', 14,'Overworked.', 'Victim');

INSERT INTO itemRequired(itemName, maintenanceID)VALUES
('Replace Front Window',4),
('Replace Flux Screw',8),
('Seal Refreshment',9),
('Oil Change',11),
('Replace Break Pads',13),
('Transmission Check',18),
('Refill Blinker Fluid',19),
('Battery Inspection',23),
('Inspect and Replace Coolant',24),
('Change Break Fluid',26),
('Replace Exhaust System',27),
('Oil Change',30),
('Refill Blinker Fluid',31),
('Battery Inspection',34),
('Replace All Tires',35),
('Transmission Check',37),
('Inspect and Replace Coolant',39),
('Replace All Tires',40),
('Replace Front Window',41);





INSERT INTO itemSkills(itemName, skillName) VALUES
('Replace Front Window', 'Replace Windshield'),
('Replace All Tires', 'Unscrew Screw'),
('Replace All Tires', 'Replace Tire'),
('Replace Flux Screw', 'Unscrew Screw'),
('Seal Refreshment', 'Change Oil'),
('Oil Change', 'Unscrew Screw'),
('Oil Change', 'Change Oil'),
('Replace Break Pads', 'Replace Tire'),
('Transmission Check', 'Unscrew Screw'),
('Refill Blinker Fluid', 'Battery Replacement'),
('Battery Inspection', 'Battery Replacement'),
('Inspect and Replace Coolant', 'Unscrew Screw'),
('Change Break Fluid', 'Replace Tire'),
('Replace Exhaust System', 'Unscrew Screw'),
('50k Base List', 'Timing Belt Replacement'),
('50k Base List', 'Battery Replacement'),
('100k Base List', 'Timing Belt Replacement'),
('100k Base List', 'Battery Replacement'),
('150k Base List', 'Timing Belt Replacement'),
('150k Base List', 'Battery Replacement');

INSERT INTO skillRequiredPackage(itemName, make, model, year, milage, maintenanceID, skillName)VALUES
( '50k Base List', 'Mazda', 'rx-7', 1984, 50000, 1, 'Battery Replacement'),
( '50k Base List', 'Mazda', 'rx-7', 1984, 50000, 1, 'Timing Belt Replacement'),
( '100k Base List', 'Mazda', 'rx-7', 1984, 100000, 2, 'Timing Belt Replacement'),
( '100k Base List', 'Mazda', 'rx-7', 1984, 100000, 2, 'Battery Replacement'),
( '150k Base List', 'Mazda', 'rx-7', 1984, 150000, 3, 'Timing Belt Replacement'),
( '150k Base List', 'Mazda', 'rx-7', 1984, 150000, 3, 'Battery Replacement'),
( '50k Base List', 'Toyota', 'Corolla', 1991, 50000, 6, 'Battery Replacement'),
( '50k Base List', 'Toyota', 'Corolla', 1991, 50000, 6, 'Timing Belt Replacement'),
( '100k Base List', 'Toyota', 'Corolla', 1991, 100000, 7, 'Timing Belt Replacement'),
( '100k Base List', 'Toyota', 'Corolla', 1991, 100000, 7, 'Battery Replacement'),
( '50k Base List', 'Honda', 'Accord', 2000, 50000, 10, 'Timing Belt Replacement'),
( '50k Base List', 'Honda', 'Accord', 2000, 50000, 10, 'Battery Replacement'),
( '50k Base List', 'Mercedes', 'C', 2016, 50000, 12, 'Timing Belt Replacement'),
( '50k Base List', 'Mercedes', 'C', 2016, 50000, 12, 'Battery Replacement'),
( '50k Base List', 'Ford', 'Falcon', 1960, 50000, 14, 'Battery Replacement'),
( '50k Base List', 'Ford', 'Falcon', 1960, 50000, 14, 'Timing Belt Replacement'),
( '100k Base List', 'Ford', 'Falcon', 1960, 100000, 15, 'Battery Replacement'),
( '100k Base List', 'Ford', 'Falcon', 1960, 100000, 15, 'Timing Belt Replacement'),
( '50k Base List', 'Dodge', 'Charger', 2017, 50000, 16, 'Timing Belt Replacement'),
( '50k Base List', 'Dodge', 'Charger', 2017, 50000, 16, 'Battery Replacement'),
( '50k Base List', 'Ford', 'Explorer', 2000, 50000, 17, 'Battery Replacement'),
( '50k Base List', 'Ford', 'Explorer', 2000, 50000, 17, 'Timing Belt Replacement'),
( '50k Base List', 'Audi', 'Q7', 2000, 50000, 20, 'Timing Belt Replacement'),
( '50k Base List', 'Audi', 'Q7', 2000, 50000, 20, 'Battery Replacement'),
( '100k Base List', 'Audi', 'Q7', 2000, 100000, 21, 'Battery Replacement'),
( '150k Base List', 'Audi', 'Q7', 2000, 150000, 22, 'Timing Belt Replacement'),
( '50k Base List', 'Jeep', 'Wrangler', 2008, 50000, 25, 'Timing Belt Replacement'),
( '50k Base List', 'Mitsubishi', 'Eclipse', 2009, 50000, 28, 'Battery Replacement'),
( '100k Base List', 'Mitsubishi', 'Eclipse', 2009, 100000, 29,'Battery Replacement'),
( '100k Base List', 'Mitsubishi', 'Eclipse', 2009, 100000, 29, 'Timing Belt Replacement'),
( '50k Base List', 'Dodge', 'Dart', 1999, 50000, 32, 'Battery Replacement'),
( '50k Base List', 'Dodge', 'Dart', 1999, 50000, 32, 'Timing Belt Replacement'),
( '100k Base List', 'Dodge', 'Dart', 1999, 100000, 33, 'Battery Replacement'),
( '100k Base List', 'Dodge', 'Dart', 1999, 100000, 33, 'Timing Belt Replacement'),
( '50k Base List', 'Tesla', 'Model S', 2017, 50000, 36, 'Battery Replacement'),
( '50k Base List', 'Tesla', 'Model S', 2017, 50000, 36, 'Timing Belt Replacement'),
( '50k Base List', 'Saturn', 'Ion', 2008, 50000, 38, 'Battery Replacement'),
( '50k Base List', 'Saturn', 'Ion', 2008, 50000, 38, 'Timing Belt Replacement'),
( '50k Base List', 'Nissan', 'Pathfinder', 2017, 50000, 42, 'Battery Replacement'),
( '50k Base List', 'Nissan', 'Pathfinder', 2017, 50000, 42, 'Timing Belt Replacement'),
( '100k Base List', 'Nissan', 'Pathfinder', 2017, 100000, 43, 'Battery Replacement'),
( '100k Base List', 'Nissan', 'Pathfinder', 2017, 100000, 43, 'Timing Belt Replacement'),
( '50k Base List', 'BMW', 'M3', 2008, 50000, 44, 'Battery Replacement'),
( '50k Base List', 'BMW', 'M3', 2008, 50000, 44, 'Timing Belt Replacement'),
( '100k Base List', 'BMW', 'M3', 2008, 100000, 45, 'Battery Replacement'),
( '100k Base List', 'BMW', 'M3', 2008, 100000, 45, 'Timing Belt Replacement');



INSERT INTO itemSkillRequired(itemName, maintenanceID, skillName)VALUES
('Replace Front Window',4,'Replace Windshield'),
('Replace Flux Screw',8, 'Unscrew Screw'),
('Seal Refreshment',9,'Change Oil'),
('Oil Change',11,'Change Oil'),
('Replace Break Pads',13,'Replace Tire'),
('Transmission Check',18, 'Unscrew Screw'),
('Refill Blinker Fluid',19, 'Battery Replacement'),
('Battery Inspection',23, 'Battery Replacement'),
('Inspect and Replace Coolant',24,'Unscrew Screw'),
('Change Break Fluid',26,'Replace Tire'),
('Replace Exhaust System',27,'Unscrew Screw'),
('Oil Change',30,'Change Oil'),
('Refill Blinker Fluid',31, 'Battery Replacement'),
('Battery Inspection',34, 'Battery Replacement'),
('Replace All Tires',35, 'Unscrew Screw'),
('Transmission Check',37,'Unscrew Screw'),
('Inspect and Replace Coolant',39,'Unscrew Screw'),
('Replace All Tires',40,'Unscrew Screw'),
('Replace Front Window',41,'Replace Windshield');

INSERT INTO assignedPackageSkillList(itemName, make, model, year, milage, maintenanceID, skillName, employeeID)VALUES
( '50k Base List', 'Mazda', 'rx-7', 1984, 50000, 1, 'Battery Replacement',2),
( '50k Base List', 'Mazda', 'rx-7', 1984, 50000, 1, 'Timing Belt Replacement',5),
( '100k Base List', 'Mazda', 'rx-7', 1984, 100000, 2, 'Timing Belt Replacement',6),
( '100k Base List', 'Mazda', 'rx-7', 1984, 100000, 2, 'Battery Replacement',2),
( '150k Base List', 'Mazda', 'rx-7', 1984, 150000, 3, 'Timing Belt Replacement',5),
( '150k Base List', 'Mazda', 'rx-7', 1984, 150000, 3, 'Battery Replacement',2),
( '50k Base List', 'Toyota', 'Corolla', 1991, 50000, 6, 'Battery Replacement',2),
( '50k Base List', 'Toyota', 'Corolla', 1991, 50000, 6, 'Timing Belt Replacement',6),
( '100k Base List', 'Toyota', 'Corolla', 1991, 100000, 7, 'Timing Belt Replacement',5),
( '100k Base List', 'Toyota', 'Corolla', 1991, 100000, 7, 'Battery Replacement',2),
( '50k Base List', 'Honda', 'Accord', 2000, 50000, 10, 'Timing Belt Replacement',6),
( '50k Base List', 'Honda', 'Accord', 2000, 50000, 10, 'Battery Replacement',2),
( '50k Base List', 'Mercedes', 'C', 2016, 50000, 12, 'Timing Belt Replacement',5),
( '50k Base List', 'Mercedes', 'C', 2016, 50000, 12, 'Battery Replacement',2),
( '50k Base List', 'Ford', 'Falcon', 1960, 50000, 14, 'Battery Replacement',2),
( '50k Base List', 'Ford', 'Falcon', 1960, 50000, 14, 'Timing Belt Replacement',6),
( '100k Base List', 'Ford', 'Falcon', 1960, 100000, 15, 'Battery Replacement',2),
( '100k Base List', 'Ford', 'Falcon', 1960, 100000, 15, 'Timing Belt Replacement',5),
( '50k Base List', 'Dodge', 'Charger', 2017, 50000, 16, 'Timing Belt Replacement',6),
( '50k Base List', 'Dodge', 'Charger', 2017, 50000, 16, 'Battery Replacement',2),
( '50k Base List', 'Ford', 'Explorer', 2000, 50000, 17, 'Battery Replacement',2),
( '50k Base List', 'Ford', 'Explorer', 2000, 50000, 17, 'Timing Belt Replacement',5),
( '50k Base List', 'Audi', 'Q7', 2000, 50000, 20, 'Timing Belt Replacement',6),
( '50k Base List', 'Audi', 'Q7', 2000, 50000, 20, 'Battery Replacement',2),
( '100k Base List', 'Audi', 'Q7', 2000, 100000, 21, 'Battery Replacement',2),
( '150k Base List', 'Audi', 'Q7', 2000, 150000, 22, 'Timing Belt Replacement',5),
( '50k Base List', 'Jeep', 'Wrangler', 2008, 50000, 25, 'Timing Belt Replacement',6),
( '50k Base List', 'Mitsubishi', 'Eclipse', 2009, 50000, 28, 'Battery Replacement',2),
( '100k Base List', 'Mitsubishi', 'Eclipse', 2009, 100000, 29,'Battery Replacement',2),
( '100k Base List', 'Mitsubishi', 'Eclipse', 2009, 100000, 29, 'Timing Belt Replacement',5),
( '50k Base List', 'Dodge', 'Dart', 1999, 50000, 32, 'Battery Replacement',2),
( '50k Base List', 'Dodge', 'Dart', 1999, 50000, 32, 'Timing Belt Replacement',6),
( '100k Base List', 'Dodge', 'Dart', 1999, 100000, 33, 'Battery Replacement',2),
( '100k Base List', 'Dodge', 'Dart', 1999, 100000, 33, 'Timing Belt Replacement',5),
( '50k Base List', 'Tesla', 'Model S', 2017, 50000, 36, 'Battery Replacement',2),
( '50k Base List', 'Tesla', 'Model S', 2017, 50000, 36, 'Timing Belt Replacement',6),
( '50k Base List', 'Saturn', 'Ion', 2008, 50000, 38, 'Battery Replacement',2),
( '50k Base List', 'Saturn', 'Ion', 2008, 50000, 38, 'Timing Belt Replacement',6),
( '50k Base List', 'Nissan', 'Pathfinder', 2017, 50000, 42, 'Battery Replacement',2),
( '50k Base List', 'Nissan', 'Pathfinder', 2017, 50000, 42, 'Timing Belt Replacement',5),
( '100k Base List', 'Nissan', 'Pathfinder', 2017, 100000, 43, 'Battery Replacement',2),
( '100k Base List', 'Nissan', 'Pathfinder', 2017, 100000, 43, 'Timing Belt Replacement',6),
( '50k Base List', 'BMW', 'M3', 2008, 50000, 44, 'Battery Replacement',2),
( '50k Base List', 'BMW', 'M3', 2008, 50000, 44, 'Timing Belt Replacement',5),
( '100k Base List', 'BMW', 'M3', 2008, 100000, 45, 'Battery Replacement',2),
( '100k Base List', 'BMW', 'M3', 2008, 100000, 45, 'Timing Belt Replacement',6);

INSERT INTO assignedItemSkillList (itemName, maintenanceID, skillName, employeeID) VALUES
('Replace Front Window',4,'Replace Windshield',8),
('Replace Flux Screw',8, 'Unscrew Screw',8),
('Seal Refreshment',9,'Change Oil',8),
('Oil Change',11,'Change Oil',8),
('Replace Break Pads',13,'Replace Tire',8),
('Transmission Check',18, 'Unscrew Screw',8),
('Refill Blinker Fluid',19, 'Battery Replacement',2),
('Battery Inspection',23, 'Battery Replacement',2),
('Inspect and Replace Coolant',24,'Unscrew Screw',8),
('Change Break Fluid',26,'Replace Tire',14),
('Replace Exhaust System',27,'Unscrew Screw',14),
('Oil Change',30,'Change Oil',2),
('Refill Blinker Fluid',31, 'Battery Replacement',2),
('Battery Inspection',34, 'Battery Replacement',2),
('Replace All Tires',35, 'Unscrew Screw',14),
('Transmission Check',37,'Unscrew Screw',14),
('Inspect and Replace Coolant',39,'Unscrew Screw',2),
('Replace All Tires',40,'Unscrew Screw',14),
('Replace Front Window',41,'Replace Windshield',13);
