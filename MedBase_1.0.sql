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

ALTER TABLE Medicos
MODIFY COLUMN codm INT AUTO_INCREMENT;

INSERT INTO medicos (nome, idade, especialidade, CPF, cidade, nroa)
VALUES
('João Silva', 45, 'Cardiologia', 12345678901, 'São Paulo', 12345),
('Maria Oliveira', 38, 'Ortopedia', 23456789012, 'Rio de Janeiro', 23456),
('Carlos Souza', 50, 'Neurologia', 34567890123, 'Belo Horizonte', 34567),
('Fernanda Pereira', 32, 'Dermatologia', 45678901234, 'Porto Alegre', 45678),
('Ricardo Lima', 41, 'Pediatria', 56789012345, 'Curitiba', 56789);

ALTER TABLE Pacientes
MODIFY COLUMN codp INT AUTO_INCREMENT;

ALTER TABLE Funcionarios
MODIFY COLUMN codf INT AUTO_INCREMENT;

INSERT INTO funcionarios (nome, cargo, salario, CPF, cidade)
VALUES
('Ana Costa', 'Secretária', 2500.00, 12345678901, 'São Paulo'),
('Ricardo Gomes', 'Enfermeiro', 4000.00, 23456789012, 'Rio de Janeiro'),
('Marcelo Oliveira', 'Médico', 12000.00, 34567890123, 'Belo Horizonte'),
('Fernanda Rocha', 'Recepcionista', 2000.00, 45678901234, 'Porto Alegre'),
('Roberto Lima', 'Atendendente', 3500.00, 56789012345, 'Curitiba'),
('Carla Pereira', 'Farmacêutica', 4500.00, 67890123456, 'Salvador'),
('João Souza', 'Faxineiro', 2500.00, 78901234567, 'Fortaleza'),
('Patrícia Alves', 'Contadora', 5500.00, 89012345678, 'Recife'),
('Lucas Martins', 'Fisioterapeuta', 4000.00, 90123456789, 'Natal'),
('Ricardo Rocha', 'Coordenador', 8000.00, 11223344556, 'Manaus');

CREATE TABLE Consultas (
    codm INT,
    codp INT,
    data DATE,
    hora TIME,
    PRIMARY KEY (codm, codp, data, hora),
    FOREIGN KEY (codm) REFERENCES Medicos(codm),
    FOREIGN KEY (codp) REFERENCES Pacientes(codp)
);

SELECT * FROM Consultas;

DROP INDEX codp  ON Pacientes;
DROP INDEX codm ON Medicos;


INSERT INTO Pacientes (codp, nome, idade, cidade, CPF, doenca) VALUES
(1, 'João Silva', 30, 'São Paulo', 98765432101, 'Hipertensão'),
(2, 'Maria Oliveira', 25, 'Rio de Janeiro', 87654321098, 'Acne'),
(3, 'Carlos Souza', 40, 'Belo Horizonte', 76543210987, 'Fratura no braço'),
(4, 'Ana Lima', 35, 'Salvador', 65432109876, 'Diabetes'),
(5, 'Paulo Santos', 50, 'Curitiba', 54321098765, 'Problema no joelho');

ALTER TABLE Pacientes
ADD COLUMN doencas VARCHAR(40);

CREATE INDEX idx_pacientes_doencas ON Pacientes(doencas);

DROP INDEX idx_medicos_cpf ON Medicos;

SELECT * FROM Medicos;

SHOW INDEX FROM Medicos;

INSERT INTO Pacientes (codp, nome, idade, cidade, CPF, doenca) VALUES
(6,'Cristian', 23, 'Palhoca', 93475846567, 'Cancer'),
(7, 'Antonio', 21, 'Biguacu', 79473498490, 'Febre Amarela');

UPDATE Consultas SET hora = ADDTIME(hora, '01:30:00') WHERE codm = 3 AND codp = 4;
DELETE FROM Funcionarios WHERE codf = 4;

INSERT INTO Consultas (codm, codp, data, hora) VALUES
(1, 1, '2025-03-10', '10:00:00'),
(2, 2, '2025-03-11', '11:30:00'),
(3, 3, '2025-03-12', '14:00:00'),
(1, 4, '2025-03-13', '09:00:00'),
(2, 5, '2025-03-14', '15:45:00'),
(4, 8, '2025-03-15', '20:00:00');

SET SQL_SAFE_UPDATES = 0;

DELETE FROM Consultas WHERE hora > '19:00:00';
DELETE FROM Pacientes WHERE doenca = 'Câncer' OR idade < 10;
DELETE FROM Medicos WHERE cidade IN ('Biguacu', 'Palhoca');























