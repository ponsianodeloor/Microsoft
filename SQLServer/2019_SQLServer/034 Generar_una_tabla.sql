CREATE TABLE users(
	id INT PRIMARY KEY IDENTITY(1,1),
	user_nombres VARCHAR (100),
	user_apellidos VARCHAR(100),
	user_sexo VARCHAR(20),
	user_fecha_registro DATE
);