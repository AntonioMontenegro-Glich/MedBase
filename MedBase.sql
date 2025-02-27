create database medbase;
use medbase;

CREATE TABLE Ambulatorios (
    nroa int primary key NOT NULL,
    andar numeric(3),
    capacidade smallint
);

CREATE TABLE Medicos (
	codm int primary key ,
    andar numeric(3),
    nome varchar(40) NOT NULL,
    idade smallint NOT NULL,
    especialidade char(20),
    cpf numeric(11) unique,
    cidade varchar(30),
    nroa int
);

CREATE TABLE Pacientes (
    codp int primary key ,
    nome varchar(40) NOT NULL,
    idade smallint NOT NULL,
    cidade char(30),
    cpf numeric(11) unique,
    doenca varchar(40) NOT NULL
    
);

CREATE TABLE Funcionarios (
    codf int primary key ,
    nome varchar(40) NOT NULL,
    idade smallint,
    cpf numeric(11) unique,
    cidade varchar(30),
    salario numeric(10),
    cargo varchar(20)
);

CREATE TABLE Consultas (
	FOREIGN KEY (codm) REFERENCES Medicos(codm),
    FOREIGN KEY (codc) REFERENCES Pacientes(codp),
    data date,
    hora time
);

ALTER TABLE Funcionarios
ADD COLUMN nroa int;

CREATE UNIQUE INDEX codm ON Medicos(cpf);
CREATE UNIQUE INDEX codp ON Pacientes(doenca);
