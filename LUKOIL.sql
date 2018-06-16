create database LUKOIL

CREATE TABLE Dostavchici
(Nbulstat int PRIMARY KEY,
Ndogovor int NULL,
Ime nvarchar(50) NULL,
Adres nvarchar(50) NULL)

CREATE TABLE Gorivo
(Kod_gorivo int PRIMARY KEY,
Ime nvarchar(20) NULL)


CREATE TABLE Kl_benzinostancii
(Nklient int PRIMARY KEY,
Ime nvarchar(50) NULL,
Adres nvarchar(50)NULL,
Faks varchar(15) NULL,
Bulstat nvarchar(15) NULL,
MOL nvarchar(30) NULL)


CREATE TABLE Vid_gorivo
(Kod_vid_gorivo int PRIMARY KEY,
Ime_vid_gorivo nvarchar(20) NULL,
Cena money NULL,
Kod_gorivo int NULL,
CONSTRAINT FK_Gorivo_Vid_gorivo
FOREIGN KEY (Kod_gorivo)
REFERENCES Gorivo(Kod_gorivo))


CREATE TABLE Zaqvka
(Nzaqvka int PRIMARY KEY,
Nklient int NULL,
Kod_gorivo int NULL,
Data date NULL,
Zaqveno_kol int NULL,
Nbulstat int NULL,
CONSTRAINT FK_Dostavchici_Zaqvka
FOREIGN KEY (Nbulstat)
REFERENCES Dostavchici(Nbulstat),
CONSTRAINT FK_Gorivo_Zaqvka
FOREIGN KEY (Kod_gorivo)
REFERENCES Gorivo(Kod_gorivo))


CREATE TABLE Dostavchici_telefoni
(Nbulstat int,
Telefon varchar(20),
PRIMARY KEY (Nbulstat, Telefon))
ALTER TABLE Dostavchici_telefoni
ADD CONSTRAINT Nbulstat_FK
FOREIGN KEY (Nbulstat)
REFERENCES Dostavchici(Nbulstat)



CREATE TABLE Benzinostancii_telefoni
(Nklient int,
Telefon varchar(20),
PRIMARY KEY (Nklient,Telefon))
ALTER TABLE Benzinostancii_telefoni
ADD CONSTRAINT Nklient_FK
FOREIGN KEY (Nklient)
REFERENCES Kl_benzinostancii(Nklient)



CREATE TABLE Oferti
(Noferta int PRIMARY KEY,
Nbulstat int NULL,
Ndogovor int NULL,
Kod_Vid_gorivo nvarchar(20) NULL,
Cena money NULL,
CONSTRAINT FK_Dostavchici_Oferti
FOREIGN KEY (Nbulstat)
REFERENCES Dostavchici(Nbulstat))



CREATE TABLE Ejedneven_otchet
(Notchet int PRIMARY KEY,
Data date NULL,
Nklient int NULL,
Ime nvarchar(50) NULL,
Kod_vid_gorivo int NULL,
Kolichestvo int NULL,
Stoinost money NULL,
Nzaqvka int NULL,
CONSTRAINT FK_Kl_benzinostancii_Ejedneven_otchet
FOREIGN KEY (Nklient)
REFERENCES Kl_benzinostancii(Nklient),
CONSTRAINT FK_Zaqvka_Ejedneven_otchet
FOREIGN KEY (Nzaqvka)
REFERENCES Zaqvka(Nzaqvka))



CREATE TABLE Dostavki
(Nfaktura int PRIMARY KEY,
Nzaqvka int NULL,
Data date NULL,
Polucheno_kol int NULL,
Razlika int NULL,
Nbulstat int NULL,
Kod_gorivo int NULL,
Nklient int NULL,
Zaprihodeno int NULL,
Stoinost_dostavka money NULL,
CONSTRAINT FK_Dostavchici_Dostavki
FOREIGN KEY (Nbulstat)
REFERENCES Dostavchici(Nbulstat),
CONSTRAINT FK_Kl_benzinostancii_Dostavki
FOREIGN KEY (Nklient)
REFERENCES Kl_benzinostancii(Nklient))



CREATE TABLE Dogovori
(Ndogovor int primary key NOT NULL,
Ime_dostavchik nvarchar(50) NULL,
Ime_kl nvarchar(50) NULL,
Data date NULL,
Validnost date NULL,
Noferta int NULL)
ALTER TABLE Dogovori
ADD CONSTRAINT Oferti_FK
FOREIGN KEY (Noferta)
REFERENCES Oferti(Noferta)



Insert into Dostavchici(Nbulstat, Ndogovor,Ime, Adres)
Values (1020304050, 1, 'LUKOIL', 'gr. Burgas, ul. Industrialna 45')


Insert into Gorivo(Kod_gorivo, Ime)
Values (1, 'Benzin')
Insert into Gorivo(Kod_gorivo, Ime)
Values (2, 'Diesel')
Insert into Gorivo(Kod_gorivo, Ime)
Values (3, 'Propan-butan')



Insert into Kl_benzinostancii (Nklient, Ime, Adres, Faks, Bulstat, MOL )
Values (1, 'LUKOIL Trapezica', 'gr. Burgas, bul. Trapezica 13', 056123457, 1234567890, 'Petar Dimitrov')
Insert into Kl_benzinostancii (Nklient, Ime, Adres, Faks, Bulstat, MOL )
Values (2, 'LUKOIL Sozopol road', 'gr. Burgas, bul. Industrialen 8', 056123459, 1234567891, 'Valentin Trifonov')
Insert into Kl_benzinostancii (Nklient, Ime, Adres, Faks, Bulstat, MOL )
Values (3, 'LUKOIL Sunny Beach road', 'gr. Burgas, kv. Izgrev', 056123451, 1234567892, 'Maria Kostadinova')



Insert into Vid_gorivo(Kod_vid_gorivo, Ime_vid_gorivo,Cena, Kod_gorivo)
Values (11, 'ECTO Plus95',2.30, 1)
Insert into Vid_gorivo(Kod_vid_gorivo, Ime_vid_gorivo,Cena, Kod_gorivo)
Values (12, 'ECTO Sport98',2.35, 1)
Insert into Vid_gorivo(Kod_vid_gorivo, Ime_vid_gorivo,Cena, Kod_gorivo)
Values (21, 'ECTO Disel', 2.32, 2)
Insert into Vid_gorivo(Kod_vid_gorivo, Ime_vid_gorivo,Cena, Kod_gorivo)
Values (30, 'Propan-butan',0.93, 3)



INSERT INTO Zaqvka(Nzaqvka, Nklient, Kod_gorivo, Data, Zaqveno_kol, Nbulstat) 
VALUES (1, 1, 1, '2015-03-31', 5000, 1020304050)
Insert into Zaqvka(Nzaqvka, Nklient, Kod_gorivo, Data, Zaqveno_kol, Nbulstat) 
Values (2, 2, 1, '2015-03-31', 5000, 1020304050)
Insert into Zaqvka(Nzaqvka, Nklient, Kod_gorivo, Data, Zaqveno_kol, Nbulstat) 
Values (3, 3, 1, '2015-03-31', 5000, 1020304050)
Insert into Zaqvka(Nzaqvka, Nklient, Kod_gorivo, Data, Zaqveno_kol, Nbulstat) 
Values (4, 1, 2, '2015-04-30', 5000, 1020304050)
Insert into Zaqvka(Nzaqvka, Nklient, Kod_gorivo, Data, Zaqveno_kol, Nbulstat) 
Values (5, 2, 3, '2015-04-30', 5000, 1020304050)
Insert into Zaqvka(Nzaqvka, Nklient, Kod_gorivo, Data, Zaqveno_kol, Nbulstat) 
Values (6, 3, 2, '2015-04-30', 5000, 1020304050)



Insert into Dostavchici_telefoni(Nbulstat, Telefon)
Values ('1020304050', '+(359)2876543')
Insert into Dostavchici_telefoni(Nbulstat, Telefon)
Values ('1020304050', '+(359)888525252')

 

Insert into Benzinostancii_telefoni(Nklient, Telefon)
Values (1, '+(359)52123456')
Insert into Benzinostancii_telefoni(Nklient, Telefon)
Values (1, '+(359)888969696')
Insert into Benzinostancii_telefoni(Nklient, Telefon)
Values (2, '+(359)52123457')
Insert into Benzinostancii_telefoni(Nklient, Telefon)
Values (2, '+(359)888747474')
Insert into Benzinostancii_telefoni(Nklient, Telefon)
Values (3, '+(359)52123458')
Insert into Benzinostancii_telefoni(Nklient, Telefon)
Values (3, '+(359)888232323')



Insert into Oferti(Noferta, Nbulstat, Ndogovor, Kod_vid_gorivo, Cena)
Values (1, 1020304050, 1, 11, 2.1)
Insert into Oferti(Noferta, Nbulstat, Ndogovor, Kod_vid_gorivo, Cena)
Values (2, 1020304050, 1, 12, 2.2)
Insert into Oferti(Noferta, Nbulstat, Ndogovor, Kod_vid_gorivo, Cena)
Values (4, 1020304050, 1, 21, 2.25)
Insert into Oferti(Noferta, Nbulstat, Ndogovor, Kod_vid_gorivo, Cena)
Values (6, 1020304050, 1, 30, 0.85)


Insert into Ejedneven_otchet(Notchet, Data, Nklient, Ime, Kod_vid_gorivo, Kolichestvo, Stoinost, Nzaqvka)
Values (1, '2015-02-01', 1, 'LUKOIL Trapezica', 11, 500, 1500, 1)
Insert into Ejedneven_otchet(Notchet, Data, Nklient, Ime, Kod_vid_gorivo, Kolichestvo, Stoinost, Nzaqvka)
Values (2, '2015-02-01', 1, 'LUKOIL Trapezica', 12, 200, 600,2)
Insert into Ejedneven_otchet(Notchet, Data, Nklient, Ime, Kod_vid_gorivo, Kolichestvo, Stoinost, Nzaqvka)
Values (4, '2015-03-21', 1, 'LUKOIL Trapezica', 21, 100, 300,4)
Insert into Ejedneven_otchet(Notchet, Data, Nklient, Ime, Kod_vid_gorivo, Kolichestvo, Stoinost, Nzaqvka)
Values (6, '2015-03-21', 1, 'LUKOIL Trapezica', 30, 500, 1500,6)




Insert into Dostavki(Nfaktura,Nzaqvka, Data, Polucheno_kol, Razlika, Nbulstat, Kod_gorivo, Nklient, Zaprihodeno, Stoinost_dostavka)
Values(1111111111,1,'2015-02-01', 5000, 200, 1020304050, 1, 1, 4800, 15400)
Insert into Dostavki(Nfaktura,Nzaqvka, Data, Polucheno_kol, Razlika, Nbulstat, Kod_gorivo, Nklient, Zaprihodeno, Stoinost_dostavka)
Values(1111111112,2,'2015-02-01', 4500, 100, 1020304050, 1, 2, 4400, 14600)
Insert into Dostavki(Nfaktura,Nzaqvka, Data, Polucheno_kol, Razlika, Nbulstat, Kod_gorivo, Nklient, Zaprihodeno, Stoinost_dostavka)
Values(1111111113,3,'2015-02-01', 3500, 300, 1020304050, 1, 3, 3200, 9600)
Insert into Dostavki (Nfaktura,Nzaqvka, Data, Polucheno_kol, Razlika, Nbulstat, Kod_gorivo, Nklient, Zaprihodeno, Stoinost_dostavka)
Values(1111111114,4,'2015-03-21', 5500, 500, 1020304050, 2, 1, 5000, 15000)
Insert into Dostavki(Nfaktura,Nzaqvka, Data, Polucheno_kol, Razlika, Nbulstat, Kod_gorivo, Nklient, Zaprihodeno, Stoinost_dostavka)
Values(1111111115,5,'2015-03-21', 4700, 200, 1020304050, 2, 2, 4500, 9500)
Insert into Dostavki(Nfaktura,Nzaqvka, Data, Polucheno_kol, Razlika, Nbulstat, Kod_gorivo, Nklient, Zaprihodeno, Stoinost_dostavka)
Values(1111111116,6,'2015-03-21', 3900, 100, 1020304050, 2, 3, 3800, 11400)
Insert into Dostavki(Nfaktura,Nzaqvka, Data, Polucheno_kol, Razlika, Nbulstat, Kod_gorivo, Nklient, Zaprihodeno, Stoinost_dostavka)
Values(1111111117,7,'2015-04-20', 4500, 100, 1020304050, 3, 1, 4400, 14600)
Insert into Dostavki(Nfaktura,Nzaqvka, Data, Polucheno_kol, Razlika, Nbulstat, Kod_gorivo, Nklient, Zaprihodeno, Stoinost_dostavka)
Values(1111111118,8,'2015-04-20', 3500, 200, 1020304050, 3, 2, 3300, 9900)
Insert into Dostavki(Nfaktura,Nzaqvka, Data, Polucheno_kol, Razlika, Nbulstat, Kod_gorivo, Nklient, Zaprihodeno, Stoinost_dostavka)
Values(1111111119,9,'2015-04-20', 6000, 400, 1020304050, 3, 3, 5600, 16800)
Insert into Dostavki(Nfaktura,Nzaqvka, Data, Polucheno_kol, Razlika, Nbulstat, Kod_gorivo, Nklient, Zaprihodeno, Stoinost_dostavka)
Values(1111111120,10,'2015-05-18', 4000, 200, 1020304050, 1, 1, 3800, 11400)
Insert into Dostavki(Nfaktura,Nzaqvka, Data, Polucheno_kol, Razlika, Nbulstat, Kod_gorivo, Nklient, Zaprihodeno, Stoinost_dostavka)
Values(1111111121,11,'2015-05-18', 5200, 200, 1020304050, 1, 2, 5000, 15000)
Insert into Dostavki(Nfaktura,Nzaqvka, Data, Polucheno_kol, Razlika, Nbulstat, Kod_gorivo, Nklient, Zaprihodeno, Stoinost_dostavka)
Values(1111111122,12,'2015-05-18', 4700, 400, 1020304050, 1, 3, 4300, 12900)
Insert into Dostavki(Nfaktura,Nzaqvka, Data, Polucheno_kol, Razlika, Nbulstat, Kod_gorivo, Nklient, Zaprihodeno, Stoinost_dostavka)
Values(1111111123,13,'2015-06-23', 3800, 100, 1020304050, 2, 1, 3700, 10100)
Insert into Dostavki(Nfaktura,Nzaqvka, Data, Polucheno_kol, Razlika, Nbulstat, Kod_gorivo, Nklient, Zaprihodeno, Stoinost_dostavka)
Values(1111111124,14,'2015-06-23', 4500, 100, 1020304050, 2, 2, 4400, 14600)
Insert into Dostavki(Nfaktura,Nzaqvka, Data, Polucheno_kol, Razlika, Nbulstat, Kod_gorivo, Nklient, Zaprihodeno, Stoinost_dostavka)
Values(1111111125,15,'2015-06-23', 3600, 100, 1020304050, 2, 3, 3500, 10500)
Insert into Dostavki(Nfaktura,Nzaqvka, Data, Polucheno_kol, Razlika, Nbulstat, Kod_gorivo, Nklient, Zaprihodeno, Stoinost_dostavka)
Values(1111111126,16,'2015-07-19', 3900, 100, 1020304050, 3, 1, 3800, 11400)
Insert into Dostavki(Nfaktura,Nzaqvka, Data, Polucheno_kol, Razlika, Nbulstat, Kod_gorivo, Nklient, Zaprihodeno, Stoinost_dostavka)
Values(1111111127,17,'2015-07-19', 4500, 100, 1020304050, 3, 2, 4400, 14600)
Insert into Dostavki(Nfaktura,Nzaqvka, Data, Polucheno_kol, Razlika, Nbulstat, Kod_gorivo, Nklient, Zaprihodeno, Stoinost_dostavka)
Values(1111111128,18,'2015-07-19', 5500, 500, 1020304050, 3, 3, 5000, 1500)



INSERT INTO Dogovori(Ndogovor, Ime_dostavchik, Ime_kl, Data, Validnost, Noferta)
VALUES (1, 'LUKOIL', 'LUKOIL Trapezica', '2015-01-03', '2015-07-20',1)
INSERT INTO Dogovori(Ndogovor, Ime_dostavchik, Ime_kl, Data, Validnost, Noferta)
VALUES (2, 'LUKOIL', 'LUKOIL Sozopol road', '2015-01-03', '2016-07-20',1)
INSERT INTO Dogovori(Ndogovor, Ime_dostavchik, Ime_kl, Data, Validnost, Noferta)
VALUES (3, 'LUKOIL', 'LUKOIL Sunny Beach road', '2015-01-01', '2015-07-20',1)

/*Queries*/

Select  db_name() As'Database' 



Select Top 3 Cena, Kod_vid_gorivo, Ime_vid_gorivo
From Vid_gorivo
Where Cena > (Select AVG(Cena) From Vid_gorivo)
Order by Cena desc


Select Ime, Nklient 
From Kl_benzinostancii
Where Bulstat = 1234567890

Select * From Oferti
Where Cena < 2.50


Select * From Dostavki
Where Data >= '2015-06-23'
Order by Data desc



Select Ime +' '+Adres As Informaciq_dostavchik
From Dostavchici


Select Ime, Adres
From Kl_benzinostancii
Where Ime like '%So%'



Select Kod_vid_gorivo, Ime_vid_gorivo
From Vid_gorivo
Where Ime_vid_gorivo In ('ECTO Disel','Propan-butan')



Select Nfaktura, Polucheno_kol, Zaprihodeno, Razlika
From Dostavki
 Where Razlika >=300 And Razlika <= 500
 Order by Razlika ASC



 Select Top 3 Nfaktura, Data, Polucheno_kol
 From Dostavki
 Where Kod_gorivo Like 3
 Order by Polucheno_kol Desc

 

 Select * From Zaqvka
 Where MONTH(Data) = 4 
And YEAR(Data) = 2015



Select Kod_gorivo, count(Kod_gorivo) As [Broi Poruchki]
From Dostavki
Where Month(Data) = '02'
Group by Kod_gorivo
Order by [Broi Poruchki]


Select Data, Kod_vid_gorivo, min(Kolichestvo) As Min_kol,
max(Kolichestvo) As Max_kol
From Ejedneven_otchet
Where Kod_vid_gorivo In (11,12,30)
Group by Data, Kod_vid_gorivo
Order by Data


Select Kod_gorivo, Nfaktura, SUM(Polucheno_kol) As Total
From Dostavki
Where Kod_gorivo = '2'
Group by Kod_gorivo, Nfaktura
Order by Nfaktura Desc




Select Distinct d.Polucheno_kol, d.Kod_gorivo, z.Zaqveno_kol, d.Data
From Dostavki d
Join Zaqvka z
On d.Nbulstat = z.Nbulstat
Where d.Kod_gorivo = '1' and d.Data = '2015-02-01'
Group by d.Polucheno_kol, d.Kod_gorivo, z.Zaqveno_kol, d.Data
Order by z.Zaqveno_kol Asc




Select Count(d.Nfaktura) As Total, bt.Telefon, Sum(o.Cena * d.Polucheno_kol) As [stoinost na dostavka]
From Dostavki d
Join Benzinostancii_telefoni bt
On d.Nklient = bt.Nklient
Join Oferti o
On d.Nbulstat = o.Nbulstat
Where bt.Telefon Like '%457'
Group by d.Nfaktura, bt.Telefon




Select Kl. * , Z.Nzaqvka
From Kl_benzinostancii Kl
Left Join Zaqvka Z
On KL.Nklient = Z.Nklient
Where KL.Nklient IS NOT NULL
Order by Z.Nzaqvka Asc



Select Distinct Bt.Telefon, D.Nklient
From (Kl_benzinostancii Kb
Inner Join Benzinostancii_telefoni Bt
On Kb.Nklient = Bt.Nklient)
Inner Join Dostavki D
On D.Nklient = Kb.Nklient
Where D.Data = '2015-07-19'

