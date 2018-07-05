--ADD PERSON
CREATE PROCEDURE AddPerson
    @Id         NVARCHAR(36),
    @Name       NVARCHAR(50),
    @Surname    NVARCHAR(50),
    @Email1     NVARCHAR(50),
    @Email2     NVARCHAR(50) = null,
    @Email3     NVARCHAR(50) = null,
    @Telephone  NVARCHAR(50),
    @Password   NVARCHAR(50),
    @Admin      BIT,
    @CityId     INT
AS
    INSERT INTO dbo.Person(Id, [Name], Surname, Telephone, [Password], [Admin], CityId)
    VALUES (@Id, @Name, @Surname, @Telephone, @Password, @Admin, @CityId)
	
    IF (@Email1 IS NOT NULL) BEGIN
        INSERT INTO dbo.Email(Email, PersonID)
        VALUES (@Email1, @Id)
    END
    IF (@Email2 IS NOT NULL) BEGIN
        INSERT INTO dbo.Email(Email, PersonID)
        VALUES (@Email2, @Id)
    END
    IF (@Email3 IS NOT NULL) BEGIN
        INSERT INTO dbo.Email(Email, PersonID)
        VALUES (@Email3, @Id)
    END
GO

--DELETE PERSON
CREATE PROCEDURE DeletePerson
    @Id         NVARCHAR(36)
AS
    DELETE FROM dbo.Email
	WHERE PersonID = @ID
	
	DELETE FROM dbo.Person
	WHERE Id = @ID
GO

--GET PERSON
CREATE PROCEDURE GetPerson
    @Id         NVARCHAR(36)
AS
    SELECT *
	FROM dbo.Person
	WHERE Id = @Id
GO

--GET PERSONS
CREATE PROCEDURE GetPersons
AS
    SELECT *
	FROM dbo.Person
GO

--GET EMAILS
CREATE PROCEDURE GetEmails
	@Id         NVARCHAR(36)
AS
    SELECT *
	FROM dbo.Email
	WHERE PersonID = @Id
GO

--UPDATE PERSON
CREATE PROCEDURE UpdatePerson
    @Id         NVARCHAR(36),
    @Name       NVARCHAR(50),
    @Surname    NVARCHAR(50),
    @Email1     NVARCHAR(50),
    @Email2     NVARCHAR(50) = null,
    @Email3     NVARCHAR(50) = null,
    @Telephone  NVARCHAR(50),
    @Password   NVARCHAR(50),
    @Admin      BIT,
    @CityId     INT
AS
    UPDATE dbo.Person
	SET 
		Id 		    = @Id,
		[Name] 		= @Name,
		Surname 	= @Surname,
		Telephone 	= @Telephone,
		[Password] 	= @Password,
        [Admin]		= @Admin,
		CityId 	= CityId
	WHERE Id = @Id
	
	DELETE FROM dbo.Email
	WHERE PersonId = @Id
	
	IF (@Email1 IS NOT NULL) BEGIN
        INSERT INTO dbo.Email(Email, PersonID)
        VALUES (@Email1, @Id)
    END
    IF (@Email2 IS NOT NULL) BEGIN
        INSERT INTO dbo.Email(Email, PersonID)
        VALUES (@Email2, @Id)
    END
    IF (@Email3 IS NOT NULL) BEGIN
        INSERT INTO dbo.Email(Email, PersonID)
        VALUES (@Email3, @Id)
    END
GO