GO
USE RwaWebFormsDb
GO

CREATE TABLE Person
(
    Id          NVARCHAR(36),
    [Name]      NVARCHAR(50),
    Surname     NVARCHAR(50),
    Telephone   NVARCHAR(50),
    [Password]  NVARCHAR(50),
    [Admin]     BIT,
    CityId      INT,
    CONSTRAINT PK_IDPerson PRIMARY KEY (Id)
)
GO

CREATE TABLE Email
(
    IDEmail     INT IDENTITY,
    Email       NVARCHAR(50),
    PersonID    NVARCHAR(36),
    CONSTRAINT PK_IDEmail PRIMARY KEY (IDEmail),
    CONSTRAINT FK_PersonID FOREIGN KEY (PersonID) REFERENCES Person(Id)
)
GO