INSERT INTO dbo.Person (Id, Name, Surname, Telephone, Password, Admin, CityId)
VALUES ('d687a385-5e93-452b-8831-92fa022eaba1', 'Main', 'Admin', '+0123456789', 1, '123', 2)

INSERT INTO dbo.Email (Email, PersonID)
VALUES 	('admin@mail.com', 'd687a385-5e93-452b-8831-92fa022eaba1'),
		('admin@email.com', 'd687a385-5e93-452b-8831-92fa022eaba1'),
		('admin@admin.com', 'd687a385-5e93-452b-8831-92fa022eaba1')