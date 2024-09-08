create table bd_userdata(
Username varchar(155) not null,
Email varchar(155) not null,
Number varchar(100) not null,
Password varchar(155) not null
)

drop table bd_userdata
select * from tasks

CREATE TABLE bd_Donor (
    DonorID INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-incrementing ID for each donor
	Donor_Email varchar(100) not null,
    Name NVARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender NVARCHAR(10) NOT NULL,
    BloodType NVARCHAR(10) NOT NULL,
    MedicalHistory NVARCHAR(100) NOT NULL,
    State NVARCHAR(50) NOT NULL,
    City NVARCHAR(50) NOT NULL,
    Pincode NVARCHAR(10) NOT NULL,
    Address NVARCHAR(255) NOT NULL,
    MobileNumber NVARCHAR(15) NOT NULL,
    EmergencyContact NVARCHAR(15) NOT NULL
);

select * from bd_Donor