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
    cijena decimal(18,2),
    kolicina int,
    ura int not null,
    roba int not null

);


create table otpremnica(
    otp_id int not null primary key auto_increment,
    cijena decimal(18,2),
    kolicina int,
    ira int not null,
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

