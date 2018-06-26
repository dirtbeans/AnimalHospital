use master

DROP DATABASE IF EXISTS AnimalHospital

DROP TABLE IF EXISTS pet_type
DROP TABLE IF EXISTS pet

CREATE DATABASE AnimalHospital

CREATE TABLE pet 
(
	pet_id int identity not null,
	name  varchar(45) not null,
	age int not null,
	pet_type_id int not null,

	constraint pk_pet primary key (pet_id)
);

CREATE TABLE pet_type
(
	pet_type_id int identity not null,
	pet_type varchar(45) not null,	
	constraint pk_pet_type primary key (pet_type_id)
);

CREATE TABLE invoice 
(
	invoice_no int identity not null,
	pet_id int not null,
	address_id int not null,
	tax_rate decimal not null,
	visit_date decimal not null,
	hospital_name  varchar(100) not null,
	hospital_location  varchar(100) not null,


	constraint pk_invoice primary key (invoice_no)
);

CREATE TABLE owner
(
	owner_id int identity not null,
	address_id int not null,
	first_name  varchar(100) not null,
	last_name  varchar(100) not null,

	constraint pk_owner primary key (owner_id)
);

CREATE TABLE address
(	
	address_id int identity not null,
	owner_id int not null,
	zip int not null,
	state  varchar(45) not null,
	street  varchar(100) not null,
	city  varchar(45) not null,

	constraint pk_address primary key (address_id)
);

CREATE TABLE procedure_type
(
	procedure_id int identity not null,
	name  varchar(45) not null,
	code int not null,
	cost int not null,

	constraint pk_procedure_type primary key (procedure_id)
);


CREATE TABLE pet_procedure
(
	procedure_id int not null,
	pet_id int not null,

	constraint pk_pet_procedure primary key (procedure_id, pet_id)
);


CREATE TABLE relationship
(
	pet_id int not null,
	owner_id int not null,

	constraint pk_relationshp primary key (owner_id, pet_id)
);


