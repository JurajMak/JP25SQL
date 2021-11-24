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
    ura_id int,
    cijena decimal(18,2),
    roba int not null,
    primary key (ura_id),
    foreign key (ura_id) references ura(ura_id)
);


create table otpremnica(
    otp_id int not null primary key auto_increment,
    cijena decimal(18,2),
    ira int not null,
    roba int not null
);

create table partner(
    part_id int not null primary key auto_increment,
    adresa varchar(50),
    oib char(11),
    naziv varchar(50)
);

alter table ira add foreign key (partner) references partner(part_id);
alter table ura add foreign key (partner) references partner(part_id);
alter table otpremnica add foreign key(ira) references ira(ira_id);
alter table primka add foreign key(roba) references roba(roba_id);
alter table otpremnica add foreign key(roba) references roba(roba_id);


