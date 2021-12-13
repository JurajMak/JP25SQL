drop database if exists vj1;
create database vj1 character set=utf8;
use vj1;

create table sestra(
    sifra int not null primary key auto_increment,
    introvertno boolean,
    haljina varchar(31),
    maraka decimal(16,6) not null,
    hlace varchar (46) not null,
    narukvica int not null
);

create table zena(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    hlace varchar(46),
    kratkamajica varchar(31) not null,
    jmbag char(11) not null,
    bojaociju varchar(39) not null,
    haljina varchar(44),
    sestra int not null
);

create table punac(
    sifra int not null primary key auto_increment,
    ogrlica int,
    gustoca decimal(14,9),
    hlace varchar(41) not null
);

create table cura(
    sifra int not null primary key auto_increment,
    novcic decimal(16,5) not null,
    gustoca decimal(18,6) not null,
    lipa decimal (13,10),
    ogrlica int not null,
    bojakose varchar(38),
    suknja varchar(36),
    punac int
);


create table muskarac(
    sifra int not null primary key auto_increment,
    bojaociju varchar(50) not null,
    hlace varchar(30),
    modelnaocala varchar(43),
    maraka decimal(14,5) not null,
    zena int not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    suknja varchar(50) not null,
    kuna decimal(16,8) not null,
    drugipita datetime,
    asocijalno boolean,
    introvertno boolean not null,
    dukserica varchar(48) not null,
    muskarac int
);



create table sestra_svekar(
    sifra int not null primary key auto_increment,
    sestra int not null,
    svekar int not null
);


create table svekar(
    sifra int not null primary key auto_increment,
    bojaociju varchar(40) not null,
    prstena int,
    dukserica varchar(41),
    lipa decimal(13,8),
    eura decimal(12,7),
    majica varchar(35)
);


alter table cura add foreign key(punac) references punac(sifra);
alter table sestra_svekar add foreign key(sestra) references sestra(sifra);
alter table sestra_svekar add foreign key(svekar) references svekar(sifra);
alter table zena add foreign key(sestra) references sestra(sifra);
alter table muskarac add foreign key(zena) references zena(sifra);
alter table mladic add foreign key(muskarac) references muskarac(sifra);


#U tablici cura postavite svim zapisima kolonu gustoca na vrijednost 
#15,77. 


select*from cura;
update cura set gustoca=15.77;


#U tablici mladic obrišite sve zapise čija je vrijednost kolone kuna 
#veće od 15,78.


select*from mladic;
delete from mladic where kuna>15.78;

#Izlistajte kratkamajica iz tablice zena uz uvjet da vrijednost kolone 
#hlace sadrže slova ana.

select*from zena;
select kratkamajica from zena where hlace like '%ana%';

#Prikažite dukserica iz tablice svekar, asocijalno iz tablice mladic te 
#hlace iz tablice muskarac uz uvjet da su vrijednosti kolone hlace iz 
#tablice zena počinju slovom a te da su vrijednosti kolone haljina iz 
#tablice sestra sadrže niz znakova ba. Podatke posložite po hlace iz 
#tablice muskarac silazno. 


select a.dukserica,f.asocijalno,e.hlace,d.hlace,c.haljina
from svekar a 
inner join sestra_svekar b on a.sifra=b.svekar 
inner join sestra c on c.sifra=b.sestra 
inner join zena d on d.sestra=c.sifra 
inner join muskarac e on e.zena=d.sifra 
inner join mladic f on f.muskarac=e.sifra
where d.hlace like 'a%' and c.haljina like '%ba%'
order by e.hlace desc;