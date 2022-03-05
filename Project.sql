use master

go




create database HomestayBooking

go 

use HomestayBooking

go 

create table Customer( 
CustomerID int IDENTITY(1,1) primary key, 
[Name] nvarchar(30) not null,
Gender bit,
DOB date, 
Phone nvarchar(10) check (Phone not like '%[^0-9]%' and len(Phone)>=8 and len(Phone)<=10), 
Email nvarchar(MAX),
);

create table Account(
username nvarchar(50) primary key,
[password] nvarchar(50) not null,
[Type] bit,
CustomerID int references Customer(CustomerID), 
)

create table HomestayType(
TypeID int IDENTITY(1,1) primary key,
[Name] nvarchar(MAX),
Acreage int,
Rooms int,
Beds int,
Bathrooms int,
Capacity int,
Price float,
);

create table Homestay(
HomestayID int IDENTITY(1,1) primary key,
[Name] nvarchar(MAX),
[Address] nvarchar(MAX),
TypeID int references HomestayType(TypeID),
[Description] nvarchar(MAX),
[Image] nvarchar(MAX),
);

create table Booking(
BookingID int IDENTITY(1,1) primary key,
CustomerID int references Customer(CustomerID), 
HomestayID int references Homestay(HomestayID),
[Date] date,
DateFrom date,
DateTo date,
NumberOfPeople int,
TotalPrice float,
);
