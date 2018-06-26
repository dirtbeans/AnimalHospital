

--DROP DATABASE IF EXISTS Animal_Hospital

DROP TABLE IF EXISTS pet_type
DROP TABLE IF EXISTS owner
--Assumptions
--all one hospital location
--owner has one primary address
--invoice is based on all accumulated costs for a specific day
--CREATE DATABASE AnimalHospital 



CREATE TABLE pet_type
(
	pet_type_id int identity not null,
	pet_type varchar(45) not null,	

	constraint pk_pet_type primary key (pet_type_id)
);





CREATE TABLE address
(	
	address_id int identity not null,
	zip int not null,
	state  varchar(45) not null,
	street  varchar(100) not null,
	city  varchar(45) not null,

	constraint pk_address primary key (address_id)
);

CREATE TABLE pet 
(
	pet_id int identity not null,
	name  varchar(45) not null,
	age int not null,
	pet_type_id int not null,
	address_id int not null

	constraint pk_pet primary key (pet_id),
	constraint fk_address_id foreign key (address_id) references address (address_id),
	constraint fk_pet_type_id foreign key (pet_type_id) references pet_type (pet_type_id)
);
--drop above table 

CREATE TABLE owner
(
	owner_id int identity not null,
	address_id int not null,
	first_name  varchar(100) not null,
	last_name  varchar(100) not null,

	constraint pk_owner primary key (owner_id),
	constraint fk_address_id2 foreign key (address_id) references address(address_id)
);


CREATE TABLE procedure_type
(
	procedure_id int identity not null,
	name  varchar(45) not null,
	code int not null,
	cost int not null,
	pet_type_id int not null

	constraint pk_procedure_type primary key (procedure_id),
	constraint fk_pet_type_id2 foreign key (pet_type_id) references pet_type (pet_type_id)
);
CREATE TABLE visit 
(
	visit_id int not null,
	visit_date date not null,
	procedure_id int not null,
	pet_id int not null,
	owner_id int  not null,

	constraint pk_visit primary key (visit_id),
	constraint fk_procedure_id foreign key (procedure_id) references procedure_type (procedure_id),
	constraint fk_pet_id foreign key (pet_id) references pet (pet_id),
	constraint fk_owner_id foreign key (owner_id) references owner (owner_id)
);
--drop table above
CREATE TABLE invoice 
(
	invoice_no int identity not null,
	tax_rate decimal not null,
	visit_id int not null,
	hospital_name  varchar(100) not null,
	hospital_location  varchar(100) not null,
	address_id int not null,
	pet_id int not null,

	constraint pk_invoice primary key (invoice_no),
	constraint fk_visit_id foreign key (visit_id) references visit (visit_id)

);
CREATE TABLE relationship
(
	pet_id int not null,
	owner_id int not null,

	primary key (pet_id, owner_id),
	constraint fk_owner_id2 foreign key (owner_id) references owner (owner_id),
	constraint fk_pet_id2 foreign key (pet_id) references pet (pet_id)
);

--drop table b/c changes categories




--ALTER TABLE city
--ADD FOREIGN KEY(country_id)
--REFERENCES country(country_id);

--USE [AnimalHospital]
--GO
--ALTER TABLE pet_type
--DROP CONSTRAINT chk_pet_type 



SET IDENTITY_INSERT address ON
GO
INSERT INTO [dbo].[address]
           ([zip]
           ,[state]
           ,[street]
           ,[city])
     VALUES
           (43231
           ,'Ohio' 
		   ,'123 street' 
           ,'Cbus')
SET IDENTITY_INSERT invoice OFF

USE [AnimalHospital]
GO

INSERT INTO [dbo].[pet_type]
           ([pet_type])
     VALUES
           ('Dog')
USE [AnimalHospital]
GO
INSERT INTO [dbo].[pet_type]
           ([pet_type])
     VALUES
           ('Cat')
INSERT INTO [dbo].[pet_type]
           ([pet_type])
     VALUES
           ('Bird')

USE [AnimalHospital]
GO
SET IDENTITY_INSERT pet ON
INSERT INTO [dbo].[pet]
           ([pet_id]
		   ,[name]
           ,[age]
           ,[pet_type_id]
           ,[address_id])
     VALUES
           (3, 'Fluffy', 3, 3, 1)
SET IDENTITY_INSERT pet OFF





