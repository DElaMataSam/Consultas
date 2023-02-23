USE Ejemplo9;

SELECT * FROM EMPLEADO;

SELECT * FROM DEPARTAMENTO;

SELECT count(nDIEmp) FROM EMPLEADO;
 
#2
INSERT INTO departamento(codDepto, nombreDpto, ciudad, codDirector) VALUES('4400','B2B','MEDELLÍN','31.840.269'), ('4500','FINANCIERO','BOGOTA','11.111.11'), ('4600','CONTABLE','MEDELLÍN','888.888');
INSERT INTO empleado(nDIEmp, nomEmp, sexEmp, fecNac, fecIncoporacion, salEmp, comisionE, cargoE, jefeID, codDepto) VALUES('1.130.222','John Cobra', 'M','1985-01-20','2000-11-01','50000','40000','Asesor','22.222.222','2000'), 
('5.140.252','Jason Statham', 'M','1988-01-20','2000-01-01','600000','50000','Asesor','31.178.144','4400'), ('3.330.852','Jason Derullo', 'M','1999-01-20','2020-04-01','950000','500000','Asesor','31.178.144','4400'), ('9.140.252','Scarlet Johanson', 'F','1983-08-23','2012-11-01','400000','0','Asesor','31.178.144','4400'),
('5.160.252','Amy Winehouse', 'F','1984-03-10','1998-03-01','900000','0','Tesorero','16.759.060','4500'), ('8.140.252','Kaley Cuoco', 'F','1980-01-30','2001-11-01','60000','100000','Tesorero','16.759.060','4500'),('5.149.452','Marlon Brando', 'M','1988-01-20','1997-11-01','700000','70000','Tesorero','16.759.060','4500'),
('9.330.552','Brad Pitt', 'M','1983-05-22','2000-02-03','800000','500','Contable','333.333.333','4600'), ('8.880.282','Kevin Hart', 'M','1989-01-20','2000-11-12','9000000','500000','Contable','333.333.333','4600'), ('4.444.452','Margot Robbie', 'F','1970-01-20','1990-11-01','900000','10000','Contable','333.333.333','4600'), 
('0.190.652','Mariah Carey', 'F','1970-01-20','1990-11-01','60000','7000','Informatico','22.222.222','4300'), ('5.999.252','Ana Frank', 'F','1960-01-20','1980-11-01','6000','50000','Informatico','22.222.222','4300'), ('4.555.952','Chris Evans', 'M','1990-01-20','2021-11-01','60000','500','Informatico','22.222.222','4300'),
('3.070.754','Christopher Nolan', 'M','1973-01-20','1993-11-01','100000','500000','Secretario','31.178.144','4200'), ('5.595.292','Chris Pratt', 'M','1984-01-20','1998-11-01','7000','100000','Secretario','31.178.144','4200'), ('9.140.252','Marco Aldani', 'M','1982-01-20','2020-11-01','5000','800000','Secretario','31.178.144','4200'); 

#3
SELECT * FROM empleado;
#4 
DESCRIBE departamento;
#5 
SELECT * FROM empleado WHERE cargoE = 'Secretario'OR cargoE = 'Secretaria';
#6 
SELECT nomEmp, salEmp FROM empleado;
#7 
SELECT * FROM Empleado WHERE codDepto='Ventas' ORDER BY nomEmp; 
#8 
SELECT nombreDpto FROM departamento ORDER BY nombreDpto, ciudad; 
#9 
SELECT nombreDpto, cargoE FROM empleado ORDER BY cargoE and salEmp; 
#10 
SELECT nombreDpto, SUM(ALL salEmp) FROM departamento, empleado GROUP BY nombreDpto;
#11 
SELECT salEmp, comisionE FROM empleado WHERE codDepto='2000' ORDER BY comisionE;
#12 
SELECT DISTINCT comisionE FROM EMPLEADO ORDER BY comisionE DESC; 
#13 
SELECT DISTINCT salEmp FROM EMPLEADO ORDER BY salEmp ASC; 
#14
SELECT NOMEMP, (salEmp+5000+comisionE) as TOTAL FROM EMPLEADO WHERE codDepto = '3000' ORDER BY NomEmp; 
#15
SELECT NOMEMP FROM EMPLEADO WHERE comisionE > salEmp; 
#16 
SELECT NOMEMP FROM EMPLEADO WHERE comisionE <=(salEmp*0.3);
#17 
SELECT NOMEMP FROM EMPLEADO WHERE comisionE <=(salEmp*0.4);

#18 
SELECT salEmp, comisionE, (salEmp + comisionE), nDIEmp FROM EMPLEADO WHERE comisionE > 10000 ORDER BY nDIEmp;
#19
SELECT nomEmp FROM Empleado WHERE salEmp > 50000 and jefeID = '31.840.269';
#20
SELECT nombreDpto FROM Departamento WHERE nombreDpto != 'VENTAS' AND nombreDpto != 'INVESTIGACIÒN' AND nombreDpto != 'MANTENIMIENTO' ORDER BY ciudad;
#21 
SELECT nomEmp FROM EMPLEADO WHERE nomEmp LIKE 'M%' OR salEmp>'40000' OR(comisionE!=0 AND codDepto='2%');
#22
SELECT nomEmp, salEmp, comisionE FROM empleado WHERE salEmp BETWEEN (0.5*comisionE) AND comisionE;
#23
SELECT MAX(salEmp) FROM empleado;
#24
SELECT SUM(ALL comisionE), count(nDIEmp) FROM EMPLEADO WHERE comisionE !=0; 
#25
SELECT MAX(ALL salEmp)as Maximo, MIN(ALL salEmp) as Minimo,(MAX(ALL salEmp)-MIN(ALL salEmp)) as DIFERENCIA FROM EMPLEADO; 
#26
SELECT (SELECT nombreDpto FROM departamento WHERE empleado.codDepto = departamento.codDepto) AS Depart, (SELECT count(nDIEmp) FROM empleado WHERE sexEmp ='M') as Hombre, (SELECT count(nDIEmp) 
FROM empleado WHERE sexEmp ='F') as Mujer FROM empleado GROUP BY Depart;
#27
SELECT AVG(ALL salEmp), (SELECT nombreDpto FROM departamento WHERE empleado.codDepto = departamento.codDepto) AS DEPART FROM EMPLEADO GROUP BY DEPART;
#28 
SELECT (SELECT nombreDpto FROM departamento WHERE empleado.codDepto = departamento.codDepto) AS Depart, count(cargoE), AVG(salEmp) FROM empleado GROUP BY Depart;
#29 
SELECT SUM(ALL salEmp), (SELECT nombreDpto FROM departamento WHERE empleado.codDepto = departamento.codDepto) AS DEPART FROM EMPLEADO GROUP BY DEPART;
#30
CREATE VIEW SUMA_ALTA AS SELECT SUM(DISTINCT salEmp) FROM Empleado;  

SELECT salEmp FROM Empleado;

SELECT * FROM Departamento WHERE nombreDpto = 'VENTAS';

