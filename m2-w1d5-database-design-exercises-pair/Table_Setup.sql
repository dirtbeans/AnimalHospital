--Step 1
--Create all the tables first, without constraints, by adding in appropriate columns. ONLY make note of Primary Key.
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
	pet_genus  varchar(45) not null,
	
	constraint pk_pet_type primary key (pet_type_id)
);

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




