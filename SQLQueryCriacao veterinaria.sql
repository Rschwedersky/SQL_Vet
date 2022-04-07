CREATE TABLE Cliente 
( 
 idCliente INT IDENTITY(1,1) PRIMARY KEY NOT NULL,  
 nome VARCHAR(255) NOT NULL,  
 endereco VARCHAR(255) NOT NULL,  
 bairro VARCHAR(255) NOT NULL, 
 cep VARCHAR(255) NOT NULL,  
 cidade VARCHAR(255) NOT NULL,  
 estado VARCHAR(255) NOT NULL,  
 telefone VARCHAR(255),  
); 

CREATE TABLE Animal 
( 
 idAnimal INT IDENTITY(1,1) PRIMARY KEY NOT NULL,  
 idCliente INT,  
 nome VARCHAR(255) NOT NULL,  
 idade INT NOT NULL,  
 sexo VARCHAR(255) NOT NULL,  
); 

CREATE TABLE Especie 
( 
 idAnimal INT,  
 idEspecie INT IDENTITY(1,1) PRIMARY KEY NOT NULL,  
 descricao VARCHAR(255),  
); 

CREATE TABLE Veterinario 
( 
 idVeterinario INT IDENTITY(1,1) PRIMARY KEY NOT NULL,  
 nome VARCHAR(255) NOT NULL,  
 endereco VARCHAR(255) NOT NULL,  
 telefone VARCHAR(255) NOT NULL,  
); 

CREATE TABLE Tratamento 
( 
 idTratamento INT IDENTITY(1,1) PRIMARY KEY NOT NULL,  
 idAnimal INT,  
 dataInicial DATETIME NOT NULL,  
 dataFinal DATETIME NOT NULL,  
); 

CREATE TABLE Consulta 
( 
 idVeterinario INT,  
 idConsulta INT IDENTITY(1,1) PRIMARY KEY NOT NULL,  
 dataConsulta DATE NOT NULL,  
 historico VARCHAR(255),  
 idTratamento INT,  
); 

CREATE TABLE Exame 
( 
 idConsulta INT,  
 idExame INT IDENTITY(1,1) PRIMARY KEY NOT NULL,  
 descricao VARCHAR(255) NOT NULL,  
); 

ALTER TABLE Animal ADD FOREIGN KEY(idCliente) REFERENCES Cliente (idCliente)
ALTER TABLE Especie ADD FOREIGN KEY(idAnimal) REFERENCES Animal (idAnimal)
ALTER TABLE Tratamento ADD FOREIGN KEY(idAnimal) REFERENCES Animal (idAnimal)
ALTER TABLE Consulta ADD FOREIGN KEY(idVeterinario) REFERENCES Veterinario (idVeterinario)
ALTER TABLE Consulta ADD FOREIGN KEY(idTratamento) REFERENCES Tratamento (idTratamento)
ALTER TABLE Exame ADD FOREIGN KEY(idConsulta) REFERENCES Consulta (idConsulta)

use Veterinaria
insert into Animal values (1,'tigre', 12, 'M');
insert into Animal values (1,'pato', 2, 'M');
insert into Animal values (1,'elefante', 12, 'M');
insert into Animal values (1,'alpaca', 12, 'M');


use Veterinaria
insert into Cliente values('rodrigo', 'rua1', 'bairro2',12123,'floripa', 'SC','12315321');
insert into Cliente values('diego', 'rua2', 'bairro4',13242123,'floripa', 'SC','12332352');
insert into Cliente values('tyty', 'rua6', 'bairro2',12123,'floripa', 'SC','123423421');
insert into Cliente values('fafa', 'rua8', 'bairro5',12123,'floripa', 'SC','1237561');


use Veterinaria
insert into Especie values (5,'manso');
insert into Especie values (5,'gordo');
insert into Especie values (7,'feroz');
insert into Especie values (8,'magro');

use Veterinaria
insert into Tratamento values (5,getdate(),(getdate()+32));
insert into Tratamento values (5,getdate(),(getdate()+22));
insert into Tratamento values (5,getdate(),(getdate()+54));
insert into Tratamento values (5,getdate(),(getdate()+66));

use Veterinaria
insert into Veterinario values('rodrigo', 'rua1', '12315321');
insert into Veterinario values('diego', 'rua2','12332352');
insert into Veterinario values('tyty', 'rua6','123423421');
insert into Veterinario values('fafa', 'rua8','1237561');

use Veterinaria
insert into Consulta values(3, getdate(), 'rebeldia',1);
insert into Consulta values(4, getdate(), 'otimo',2);
insert into Consulta values(3, getdate(), 'rebeldia',1);
insert into Consulta values(2, getdate(), 'cansado',3);
insert into Consulta values(1, getdate(), 'febril',4);

use Veterinaria
insert into Exame values(2, 'castigo');
insert into Exame values(3, 'ainda melhor');
insert into Exame values(4, 'castigo');
insert into Exame values(5, 'cafe');


Select
	 *
From Veterinario Vet
INNER JOIN Consulta CN ON CN.idConsulta = Vet.idVeterinario
INNER JOIN Exame Ex ON Ex.idExame = CN.idConsulta
WHERE Vet.nome LIKE '%a%';

Select
	 *
From Veterinario Vet
left JOIN Consulta CN ON CN.idConsulta = Vet.idVeterinario
left JOIN Exame Ex ON Ex.idExame = CN.idConsulta

select
	 COUNT(idAnimal) as 'Total animais'
From Animal


Select
	 Min(Tratamento.datainicial)
	 ,Animal.nome
	 
From Tratamento
inner JOIN animal ON Animal.idAnimal = Tratamento.idAnimal
GROUP BY Animal.nome

Select
	 *
From animal An
INNER JOIN Cliente CL ON CL.idCliente = An.idCliente
INNER JOIN Especie Ex ON Ex.idEspecie = An.idAnimal
INNER JOIN Tratamento TR ON TR.idTratamento = Ex.idAnimal


Select
	 *
From Veterinario Vet
full outer JOIN Consulta CN ON CN.idConsulta = Vet.idVeterinario
full outer JOIN Exame Ex ON Ex.idExame = CN.idConsulta
WHERE Vet.nome LIKE '%a%';

Select
	 *
From animal An
RIGHT JOIN Cliente CL ON CL.idCliente = An.idCliente
RIGHT JOIN Especie Ex ON Ex.idEspecie = An.idAnimal
RIGHT JOIN Tratamento TR ON TR.idTratamento = Ex.idAnimal