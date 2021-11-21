select * from partner;
# 1-4
insert into partner(part_id,naziv,oib,adresa)values
(null,'Bojanka d.o.o.','29483746572','Ul.grada Vukovara 15,Zagreb'),
(null,'Moler Marko j.d.o.o.','47596827341','Ul.J.J.Strossmayera 15,Osijek'),
(null,'Uredski Materijali d.o.o.','92847564612','Vinkovačka 56,Osijek'),
(null,'Smetlar d.o.o.','29485768192','Ružina 99,Osijek');

select * from ura;

insert into ura(ura_id,broj_računa,naziv_robe,količina,cijena,iznos,iznos_pdv,datum_izda,datum_dosp,partner) values
(null,'0421','Kistovi','10',10.00,100.00,125.00,'2021-05-10','2021-05-25',1),
(null,'432','Boje','5',29.99,149.95,187.43,'2021-04-10','2021-04-25',1),
(null,'2345/21','Papir za printer pak','1',37.49,37.49,49.99,'2021-06-24','2021-07-08',3),
(null,'57','Olovke','10',10.00,100.00,125.00,'2021-06-24','2021-07-08',3),
(null,'1234/21','Odvoz smeća','1',45.00,45.00,59.99,'2021-08-08','2021-08-15',4);

update ura set mjerna_jed='kom';

select * from roba;

insert into roba(roba_id,naziv,količina,mjerna_jed,cijena)
values(null,'Boja','15',' litra',29.99),
(null,'Kistovi','250',' kom',10.00),
(null,'Razrjeđivač','56',' kom',49.99),
(null,'Zaštitna folija','100',' kom',9.99),
(null,'Lak','254',' litra',59.99);


select * from primka;

insert into primka(ura_id,roba)values
(1,1),
(2,3),
(3,3),
(4,2);




select * from ira;

insert into ira(ira_id,vrsta_računa,naziv_robe,količina,cijena,iznos,iznos_pdv,datum_izda,datum_dosp,partner) values
(null,'R1','Boje','5 kom',100.00,500.00,625.00,'2021-10-11','2021-10-31',1),
(null,'R1','Boje','10 kom',100.00,1000.00,1250.00,'2021-10-11','2021-10-31',2),
(null,'R1','Kistovi','60 kom',20.00,1200.00,1500.00,'2021-09-01','2021-09-20',1),
(null,'R1','Lak','20 kom',50.00,1000.00,1250.00,'2021-05-11','2021-05-31',2),
(null,'R1','Zaštitna folija','45 kom',10.00,450.00,562.50,'2021-03-11','2021-03-31',2),
(null,'R1','Boje','5 kom',100.00,500.00,625.00,'2021-10-11','2021-10-31',1),
(null,'R1','Kistovi','60 kom',20.00,1200.00,1500.00,'2021-09-01','2021-09-20',1);

select * from otpremnica;

insert into otpremnica(otp_id,ira,roba) values
(null,1,1),
(null,2,2),
(null,3,1),
(null,4,2),
(null,5,2),
(null,6,1),
(null,7,1);

