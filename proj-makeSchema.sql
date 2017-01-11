--
--  Create a small demo realty database
--

set eco onsoiik ./error.txt

set termout on
set feedback on
prompt Building sample realty database. Please wait ...
set termout off
--set feedback off

drop table Branch 		 cascade constraint;
drop table Client   	 cascade constraint;
drop table Owner    	 cascade constraint;
drop table Renter   	 cascade constraint;
drop table Buyer    	 cascade constraint;
drop table Property 	 cascade constraint;
drop table Advertisement cascade constraint;
drop table Staff      	 cascade constraint;
drop table Sale      	 cascade constraint;


create table Branch (
	city VARCHAR(255) PRIMARY KEY
);

insert into Department values ('City1');

create table Client (
	clientid VARCHAR(255) PRIMARY KEY,
	name VARCHAR(255),
	phone_number INTEGER
);

create table Owner (
	ownerid VARCHAR(255) PRIMARY KEY,
	commission_deduction INTEGER,
	FOREIGN KEY(ownerid) REFERENCES Client(clientid)
);

create table Repairs(
	ownerid VARCHAR(255),
	repairid INTEGER PRIMARY KEY,
	repair VARCHAR(255),
	FOREIGN KEY(ownerid) REFERENCES Owner(ownerid)
);

create table monthly_transactions (
	ownerid VARCHAR(255),
	transactionid INTEGER PRIMARY KEY,
	transaction VARCHAR(255),
	FOREIGN KEY(ownerid) REFERENCES Owner(ownerid)
);

insert into Client values ("c001", "name3", 1112223333);
insert into Owner values ("o001", 1000);
insert into Repairs values("rep001", 1, 'leaky faucet');
insert into monthly_transactions values("c001", 1, 'paid');

create table Renter (
	renterid VARCHAR(255) PRIMARY KEY,
	rental_agreement VARCHAR(255),
	payment_record VARCHAR(255),
	FOREIGN KEY(renterid) REFERENCES Client(clientid)

);

insert into Client values ("c002", "name2", 3334445555);
insert into Renter values ("r001", 'i agree', 'payment record');

create table Buyer (
	buyerid VARCHAR(255) PRIMARY KEY,
	price_limit INTEGER,
	location VARCHAR(255),
	FOREIGN KEY(buyerid) REFERENCES Client(clientid)
);

insert into Client values ('c003', 'name3', 5556667777);
insert into Buyer values ('b001', 100000, 'location1');

create table Staff (
	staffid INTEGER PRIMARY KEY,
	name VARCHAR(255),
	phone_number INTEGER,
	salary INTEGER

);

insert into Staff values ('a001', 'agent1', 1111111111, 30000);
insert into Staff values ('a002', 'agent2', 2222222222, 40000);
insert into Staff values ('a003', 'agent3', 3333333333, 50000);
insert into Staff values ('a004', 'agent4', 4444444444, 60000);
insert into Staff values ('a005', 'agent5', 5555555555, 70000);
insert into Staff values ('a006', 'agent6', 6666666666, 80000);
insert into Staff values ('a007', 'agent7', 7777777777, 70000);
insert into Staff values ('a008', 'agent8', 8888888888, 60000);
insert into Staff values ('a009', 'agent9', 9999999999, 50000);
insert into Staff values ('a010', 'agent10', 1011011010, 40000);


create table Property (
	propid INTEGER PRIMARY KEY,
	address VARCHAR(255),
	realtorid VARCHAR(255),
	price INTEGER,
	availability VARCHAR(255),
	date_listed DATE,
	property_type VARCHAR(255),
	FOREIGN KEY(realtorid) REFERENCES Staff(staffid)
);

create table Property_Characteristics (
	propid INTEGER,
	sq_footage INTEGER,
	num_beds INTEGER,
	num_baths FLOAT,
	FOREIGN KEY(propid) REFERENCES Property(propid)
);

insert into Property values (001, '123 address1 st', 'a001', 850, 'isAvail', '16-Oct-2016', 'apt');
insert into Property_Characteristics(001, 1000, 2, 1.0);

insert into Property values (002, '123 address2 st', 'a002', 50000, 'isNotAvail', '20-Aug-2007', 'house');
insert into Property_Characteristics(002, 3000, 3, 2.0);

insert into Property values (003, '123 address3 st', 'a003', 450, 'isAvail', '18-Dec-2015', 'apt');
insert into Property_Characteristics(003, 500, 1, 1.0);

insert into Property values (004, '123 address4 st', 'a004', 70000, 'isAvail', '01-Nov-2016', 'house');
insert into Property_Characteristics(004, 3200, 4, 2.0);

insert into Property values (005, '123 address5 st', 'a005', 600, 'isAvail', '06-Sept-2016', 'apt');
insert into Property_Characteristics(005, 620, 2, 1.0);

insert into Property values (006, '123 address6 st', 'a006', 900, 'isAvail', '26-Jul-2016', 'apt');
insert into Property_Characteristics(006, 700, 2, 2.0);

insert into Property values (007, '123 address7 st', 'a007', 65000, 'isAvail', '03-May-2016', 'house');
insert into Property_Characteristics(007, 2700, 3, 2.0);

insert into Property values (008, '123 address8 st', 'a008', 1200, 'isAvail', '06-Jun-2016', 'apt');
insert into Property_Characteristics(008, 975, 3, 2.0);

insert into Property values (009, '123 address9 st', 'a009', 1400, 'isAvail', '17-Sept-2016', 'apt');
insert into Property_Characteristics(009, 760, 2, 1.0);

insert into Property values (010, '123 address10 st', 'a010', 100000, 'isAvail', '15-Aug-2016', 'house');
insert into Property_Characteristics(010, 3500, 4, 2.5);

insert into Property values (011, '123 address11 st', 'a001', 30000, 'isAvail', '06-Sept-2016', 'house');
insert into Property_Characteristics(011, 1500, 2, 1);

insert into Property values (012, '123 address12 st', 'a002', 600, 'isAvail', '06-Sept-2016', 'apt');
insert into Property_Characteristics(012, 620, 2, 1);

insert into Property values (013, '123 address13 st', 'a003', 600, 'isAvail', '06-Sept-2016', 'apt');
insert into Property_Characteristics(013, 620, 2, 1);

insert into Property values (014, '123 address14 st', 'a004', 600, 'isAvail', '06-Sept-2016', 'apt');
insert into Property_Characteristics(014, 620, 2, 1);

insert into Property values (015, '123 address15 st', 'a005', 600, 'isAvail', '06-Sept-2016', 'apt');
insert into Property_Characteristics(015, 620, 2, 1);


create table Advertisement (
	adid INTEGER PRIMARY KEY,
	FOREIGN KEY(adid) REFERENCES Property(propid)
);

create table Medium (
	adid INTEGER,
	ad_type VARCHAR(255);
	FOREIGN KEY(adid) REFERENCES Advertisement(adid)
);

create table Cost (
	adid INTEGER,
	cost INTEGER,
	FOREIGN KEY(adid) REFERENCES Advertisement(adid)
);
create table Date (
	adid INTEGER,
	date DATE,
	FOREIGN KEY(adid) REFERENCES Advertisement(adid)
);

insert into Advertisement values(001);
insert into Medium values(001, 'mag');
insert into Cost values(001, 5000);
insert into Date values(001, '02-Nov-2016');

create table Sales (
	saleid INTEGER PRIMARY KEY,
	asking_price INTEGER,
	sale_price INTEGER,
	date_sold DATE,
	clientid VARCHAR(255),
	realtorid VARCHAR(255),
	FOREIGN KEY(clientid) REFERENCES Client(clientid),
	FOREIGN KEY(realtorid) REFERENCES Staff(staffid)
);

insert into Sales values(001, 50000, 45000, '25-Aug-2016', 'c001', 'a001');

