drop database if exists vj5;
create database vj5 character set utf8;
use vj5;


create table mladic(
    sifra int not null primary key auto_increment,
    kratkamajica varchar(48) not null,
    haljina varchar(30) not null,
    asocijalno boolean,
    zarucnik int
);

create table zarucnik(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    lipa decimal(12,8),
    indiferentno boolean not null
);


create table svekar(
    sifra int not null primary key auto_increment,
    bojakose varchar(33),
    majica varchar(31),
    carape varchar(31)not null,
    haljina varchar(43),
    narukvica int,
    eura decimal(14,5) not null
);


create table svekar_cura(
    sifra int not null primary key auto_increment,
    svekar int not null,
    cura int not null
);



create table cura(
    sifra int not null primary key auto_increment,
    carape varchar(41) not null,
    maraka decimal(17,10) not null,
    asocijalno boolean,
    vesta varchar(47) not null
);


create table punac(
    sifra int not null primary key auto_increment,
    dukserica varchar(33),
    prviputa datetime not null,
    majica varchar(36),
    svekar int not null
);


create table punica(
    sifra int not null primary key auto_increment,
    hlace varchar(43) not null,
    nausnica int not null,
    ogrlica int,
    vesta varchar(49),
    modelnaocala varchar(41) not null,
    treciputa datetime not null,
    punac int not null
);



create table ostavljena(
    sifra int not null primary key auto_increment,
    majica varchar(33),
    ogrlica int not null,
    carape varchar(44),
    stilfrizura varchar(42),
    punica int not null
);

alter table mladic add foreign key (zarucnik) references zarucnik(sifra);
alter table ostavljena add foreign key (punica) references punica(sifra);
alter table punica add foreign key(punac) references punac(sifra);
alter table punac add foreign key(svekar) references svekar(sifra);
alter table svekar_cura add foreign key(svekar) references svekar(sifra);
alter table svekar_cura add foreign key (cura) references cura(sifra);




 #U tablici mladic postavite svim zapisima kolonu haljina na 
#vrijednost Osijek.

update mladic set haljina='Osijek';

#U tablici ostavljena obrišite sve zapise čija je vrijednost kolone 
#ogrlica jednako 17.

delete from ostavljena where ogrlica like 17;
delete from ostavljena where ogrlica=17;

#Izlistajte majica iz tablice punac uz uvjet da vrijednost kolone 
#prviputa nepoznate.

select majica from punac where prviputa is null;


#Prikažite asocijalno iz tablice cura, stilfrizura iz tablice ostavljena te 
#nausnica iz tablice punica uz uvjet da su vrijednosti kolone prviputa iz 
#tablice punac poznate te da su vrijednosti kolone majica iz tablice 
#svekar sadrže niz znakova ba. Podatke posložite po nausnica iz tablice 
#punica silazno. 



select a.asocijalno,f.stilfrizura,e.nausnica,d.prviputa,c.majica 
from cura a
inner join svekar_cura b on a.sifra=b.cura 
inner join svekar c on c.sifra=b.svekar 
inner join punac d on d.svekar=c.sifra 
inner join punica e on e.punac=d.sifra 
inner join ostavljena f on f.punica=e.sifra
where d.prviputa is not null and c.majica like '%ba%'
order by e.nausnica desc;


