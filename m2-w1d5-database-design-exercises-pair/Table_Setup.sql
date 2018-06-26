--Step 1
--Create all the tables first, without constraints, by adding in appropriate columns. ONLY make note of Primary Key.

--How will visit date be generated?
--perhaps we can use info from...
--https://stackoverflow.com/questions/3921730/storing-date-as-number-and-convert-number-back-in-to-date-equivalent

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
	pet_genus  varchar(45) not null,
	
	constraint pk_pet_type primary key (pet_type_id)
);

CREATE TABLE pet_type
(
	pet_type_id int identity not null,
	pet_type varchar(45) not null,	
	pet_genus  varchar(45) not null,
	
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

--procedure appears to be a keyword so I choose something else
CREATE TABLE procedure_type
(
	procedure_id int identity not null,
	name  varchar(45) not null,
	code int not null,
	cost int not null,

	constraint pk_procedure_type primary key (procedure_id)
);

--how do we create table with two primary keys - each one from another table? We are pulling them in from elsewere so I am thinking it is not possible to specify an identity constraint here.  Need to look up how to specify two primary keys as I am guessing for the last two tables with this situation.  At present, table has been created without noting wither as a primary
CREATE TABLE pet_procedure
(
	procedure_id int not null,
	pet_id int not null,


	constraint pk_pet_procedure primary key (procedure_id, pet_id)
);

--how do we create tables with two primary keys - each from another table? At present, table has been created without noting wither as a primary
CREATE TABLE relationship
(
	pet_id int not null,
	owner_id int not null,

	constraint pk_relationshp primary key (owner_id, pet_id)
);

--Noted below are the two tables that were already been created
USE [AnimalHospital]
GO
CREATE TABLE [dbo].[pet_type](
	[pet_type_id] [int] IDENTITY(1,1) NOT NULL,
	[pet_genus] [varchar](45) NOT NULL,
 CONSTRAINT [pk_pet_type] PRIMARY KEY CLUSTERED 

CREATE TABLE [dbo].[pet](
	[pet_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[age] [int] NOT NULL,
	[pet_type_id] [int] NOT NULL,
 CONSTRAINT [pk_pet] PRIMARY KEY CLUSTERED 

--Step 2
--Once all column categories exist within data tables, adjust them by adding in other constraints like pet type and foreign keys.  Not sure if this means via update script option? 

--Step 3 
-- Only after all tables are set-up with the desired associations / constraints (aka are capable of functioning as a whole since they are designed to work as an interconnected system) should you try to test them via entry of test data. If data is entered prior to steps 1 & 2, since the tables are all linked to one another,  it will lead to issues during the process leading up to step 3.

--Example below for entry of test data. 
DROP DATABASE IF EXISTS AnimalHospital
DROP TABLE IF EXISTS pet_type



CREATE TABLE pet

USE [AnimalHospital] GO

SET IDENTITY_INSERT pet ON
GO

INSERT INTO [dbo].[pet]
           ([name]
           ,[age]
           ,[pet_type_id])

     VALUES
           ('Flash'
           ,1
           ,pet_type_id, int,>)
		   -- above is not known until assoc. table is made 
SET IDENTITY_INSERT pet OFF




