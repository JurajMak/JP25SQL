drop database if exists proj;
create database proj character set utf8;
use proj;


create table roba(
    roba_id int not null primary key auto_increment,
    naziv varchar(50),
    kolicina int,
    mjerna_jed varchar(50),
    cijena decimal(18,2)
    
    
);

create table ura(
    ura_id int not null primary key auto_increment,
    broj_racuna varchar(50),
    iznos decimal(18,2),
    datum_izda date,
    datum_dosp date,
    partner int not null

);

create table ira(
    ira_id int not null primary key auto_increment,
    broj_racuna varchar(50),
    iznos decimal(18,2),
    datum_izda date,
    datum_dosp date,
    partner int not null
);


create table primka(
    primka_id int not null primary key auto_increment,
    ura int not null,
    cijena decimal(18,2),
    kolicina int,
    roba int not null

);


create table otpremnica(
    otp_id int not null primary key auto_increment,
    ira int not null,
    cijena decimal(18,2),
    kolicina int,
    roba int not null
);

create table partner(
    part_id int not null primary key auto_increment,
    naziv varchar(50),
    adresa varchar(50),
    oib char(11)
);

alter table ira add foreign key (partner) references partner(part_id);
alter table ura add foreign key (partner) references partner(part_id);
alter table otpremnica add foreign key(ira) references ira(ira_id);
alter table primka add foreign key(roba) references roba(roba_id);
alter table otpremnica add foreign key(roba) references roba(roba_id);
alter table primka add foreign key(ura) references ura(ura_id);

select*from partner;

describe partner;
# 1-9
insert into partner(part_id,naziv,adresa,oib)values
(null,'Ibanez d.o.o.','Vukovarska ulica 153,Osijek','12312312312'),
(null,'Jackson d.o.o.','Ilica 58, Zagreb','32132132132'),
(null,'ESP d.o.o.','Ul. Kneza Trpimira 99, Osijek','01230123012'),
(null,'LTD d.o.o.','Drniška ulica 27, Split','12301230023'),
(null,'Fender d.o.o.','Ružina ulica 27, Osijek','12301230044'),
(null,'Ernie Ball d.o.o.','Sljemenska ulica 99, Osijek','09876543211'),
(null,'Music Shop j.d.o.o.','Kolodvorska ulica 27, Osijek','02080786543'),
(null,'Music Shop Glazba j.d.o.o.','Trg Ante Starčevića 13,Osijek','11133322245'),
(null,'Glazbala d.o.o.','Ul. Hrvatskih kraljeva 88, Vinkovci','65432198722');


select*from roba;
#1-14
insert into roba(roba_id,naziv,kolicina,mjerna_jed,cijena)values
(null,'JACKSON PRO SOLOIST SL2Q',15,'kom',9000.00),
(null,'JACKSON SLX DX ',20,'kom',6000.00),
(null,'JACKSON JS22Q SC',15,'kom',3250.00),
(null,'IBANEZ JEMJR-WH',20,'kom',4000.00),
(null,'IBANEZ RG350DXZ-WH',38,'kom',3850.00),
(null,'LTD EC-1000FM TEF',23,'kom',8750.00),
(null,'LTD EC-1000 VB',33,'kom',7800.00),
(null,'FENDER TELECASTER MN 3TS',44,'kom',5890.00),
(null,'FENDER STRATOCASTER MN',24,'kom',5850.00),
(null,'ERNIE BALL EL.GITARA SLINKY 10-46 ŽICE',150,'kom',55.00),
(null,'ERNIE BALL GITARA 7-STRING 10-56 ŽICE',150,'kom',60.00),
(null,'ERNIE BALL EL.GITARA HYBRID 09-46 ŽICE',150,'kom',65.00),
(null,'ESP ARROW',20,'kom',21000.00),
(null,'ESP ECLIPSE CUSTOM',14,'kom',35000.00);


select a.naziv,b.iznos,c.kolicina,d.mjerna_jed ,d.naziv,d.cijena 
from partner a 
inner join ura b on a.part_id=b.partner 
inner join primka c on c.ura=b.ura_id 
inner join roba d on d.roba_id=c.roba; 

select*from ura;

insert into ura(ura_id,broj_racuna,iznos,datum_izda,datum_dosp,partner)values
(null,'094/01/21',30000.00,'2021-01-11','2021-01-21',1),
(null,'083/01/21',35000.00,'2021-02-15','2021-02-25',2),
(null,'243/01/21',123000.00,'2021-04-11','2021-04-21',3),
(null,'188/03/21',34000.00,'2021-06-15','2021-06-25',2),
(null,'233/01/21',55000.00,'2021-06-11','2021-06-21',1),
(null,'597/01/21',33000.00,'2021-08-15','2021-08-25',4),
(null,'322/02/21',64000.00,'2021-09-11','2021-09-21',3),
(null,'876/14/21',45000.00,'2021-09-15','2021-09-25',4),
(null,'234/01/21',1250.00,'2021-06-11','2021-06-21',6),
(null,'2343/01/21',22000.00,'2021-09-11','2021-09-21',5),
(null,'277/01/21',3250.00,'2021-12-10','2021-12-20',6);


select*from primka;

insert into primka(primka_id,ura,cijena,kolicina,roba)values
(null,1,30000.00,10,4),
(null,2,35000.00,6,1),
(null,3,123000.00,10,13),
(null,4,34000.00,10,2),
(null,5,55000.00,20,5),
(null,6,33000.00,8,6),
(null,7,64000.00,5,14),
(null,8,45000.00,10,7),
(null,9,1250.00,100,10),
(null,10,22000.00,10,8),
(null,11,3250.00,100,12);

select*from ira;
# 1-9
insert into ira(ira_id,broj_racuna,iznos,datum_izda,datum_dosp,partner)values
(null,'01/01/21',50000.00,'2021-01-11','2021-01-21',7),
(null,'02/01/21',30000.00,'2021-01-09','2021-01-19',8),
(null,'03/01/21',40000.00,'2021-02-13','2021-02-23',9),
(null,'01/01/21',70000.00,'2021-01-11','2021-01-21',8),
(null,'02/01/21',60000.00,'2021-01-09','2021-01-19',7),
(null,'03/01/21',120000.00,'2021-02-13','2021-02-23',7),
(null,'01/01/21',45000.00,'2021-01-11','2021-01-21',9),
(null,'02/01/21',130000.00,'2021-01-09','2021-01-19',8),
(null,'03/01/21',1500.00,'2021-02-13','2021-02-23',9);

select*from otpremnica;

insert into otpremnica(otp_id,ira,cijena,kolicina,roba)values
(null,1,50000.00,7,1),
(null,2,30000.00,6,8),
(null,3,40000.00,2,13),
(null,4,70000.00,2,14),
(null,5,60000.00,8,6),
(null,6,120000.00,4,13),
(null,7,45000.00,7,8),
(null,8,130000.00,9,3),
(null,9,1500.00,25,10);

select a.naziv,b.cijena,b.kolicina,a.cijena,a.mjerna_jed,d.naziv,c.iznos 
from roba a 
inner join otpremnica b on a.roba_id=b.roba 
inner join ira c on c.ira_id=b.ira 
inner join partner d on d.part_id=c.partner;