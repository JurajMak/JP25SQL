drop database if exists vj3;
create database vj3 character set utf8;
use vj3;


create table svekar(
    sifra int not null primary key auto_increment,
    novcica decimal(18,8) not null,
    suknja varchar(44) not null,
    bojakose varchar(38),
    prstena int,
    narukvica int not null,
    cura int not null
);


create table cura(
    sifra int not null primary key auto_increment,
    dukserica varchar(49),
    maraka decimal(13,7),
    drugiputa datetime,
    majica varchar(49),
    novcica decimal(15,8),
    ogrlica int not null
);


create table snasa(
    sifra int not null primary key auto_increment,
    introvertno boolean,
    kuna decimal(15,6) not null,
    eura decimal(12,9) not null,
    treciputa datetime,
    ostavljena int not null
);


create table punica(
    sifra int not null primary key auto_increment,
    asocijalno boolean,
    kratkamajica varchar(44),
    kuna decimal(13,8),
    vesta varchar(32) not null,
    snasa int 
);


create table ostavljena(
    sifra int not null primary key auto_increment,
    kuna decimal(17,5),
    lipa decimal(15,6),
    majica varchar(36) not null,
    modelnaocala varchar(31) not null,
    prijatelj int 
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    kuna decimal(16,10),
    haljina varchar(37),
    lipa decimal(13,10),
    dukserica varchar(31),
    indiferentno boolean not null 
);


create table prijatelj_brat(
    sifra int not null primary key auto_increment,
    prijatelj int not null,
    brat int not null
);


create table brat(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    ogrlica int not null,
    ekstrovertno boolean not null
);


alter table svekar add foreign key(cura) references cura(sifra);
alter table snasa add foreign key (ostavljena) references ostavljena (sifra);
alter table punica add foreign key (snasa) references snasa(sifra);
alter table ostavljena add foreign key (prijatelj) references prijatelj(sifra);
alter table prijatelj_brat add foreign key(prijatelj) references prijatelj(sifra);
alter table prijatelj_brat add foreign key (brat) references brat(sifra);


#U tablici svekar postavite svim zapisima kolonu suknja na 
#vrijednost Osijek.
select*from svekar;
update svekar set suknja='Osijek';

#U tablici punica obrišite sve zapise čija je vrijednost kolone 
#kratkamajica jednako AB

delete from punica where kratkamajica='AB';
delete from punica where kratkamajica like '%AB%';

#Izlistajte majica iz tablice ostavljena uz uvjet da vrijednost kolone 
#lipa nije 9,10,20,30 ili 35.

select majica from ostavljena where lipa between 9 and 35;

#Prikažite ekstroventno iz tablice brat, vesta iz tablice punica te 
#kuna iz tablice snasa uz uvjet da su vrijednosti kolone lipa iz tablice 
#ostavljena različito od 91 te da su vrijednosti kolone haljina iz tablice 
#prijatelj sadrže niz znakova ba. Podatke posložite po kuna iz tablice 
#snasa silazno. 

select a.ekstrovertno,f.vesta,g.kuna,d.lipa,c.haljina
from brat a
inner join prijatelj_brat b on a.sifra=b.brat 
inner join prijatelj c on c.sifra=b.prijatelj 
inner join ostavljena d on d.prijatelj =c.sifra 
inner join snasa g on g.ostavljena=d.sifra 
inner join punica f on f.snasa=g.sifra
where d.lipa!=91 and c.haljina like '%ba%'
order by g.kuna desc;


# Prikažite kolone haljina i lipa iz tablice prijatelj čiji se primarni ključ 
#ne nalaze u tablici prijatelj_brat.

select haljina,lipa from prijatelj;