drop database if exists vj4;
create database vj4 character set utf8;
use vj4;


create table punac(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    majica varchar(46),
    jmbag char(11) not null,
    novcic decimal(18,7) not null,
    maraka decimal(12,6) not null ,
    ostavljen int not null
);


create table ostavljen(
    sifra int not null primary key auto_increment,
    modelnaocla varchar(46),
    introvertno boolean,
    kuna decimal(14,10)
);

create table snasa(
    sifra int not null primary key auto_increment,
    introvertno boolean,
    treciputa datetime,
    haljina varchar(44),
    zena int not null
);

create table becar(
    sifra int not null primary key auto_increment,
    novcica decimal(14,8),
    kratkamajica varchar(48) not null,
    bojaociju varchar(36) not null,
    snasa int not null
);



create table prijatelj(
    sifra int not null primary key auto_increment,
    eura decimal(16,9),
    prstena int not null,
    gustoca decimal(16,5),
    jmbag char(11) not null,
    suknja varchar(47) not null,
    becar int not null
);


create table zena(
    sifra int not null primary key auto_increment,
    suknja varchar(39)not null,
    lipa decimal(18,7),
    prstena int not null
);



create table zena_mladic(
    sifra int not null primary key auto_increment,
    zena int not null,
    mladic int not null
);


create table mladic(
    sifra int not null primary key auto_increment,
    kuna decimal(15,9),
    lipa decimal(18,5),
    nausnica int,
    stilfrizura int,
    vesta varchar(34) not null
);



alter table punac add foreign key(ostavljen) references ostavljen(sifra);
alter table prijatelj add foreign key(becar) references becar(sifra);
alter table becar add foreign key (snasa) references snasa(sifra);
alter table snasa add foreign key (zena) references zena(sifra);
alter table zena_mladic add foreign key(zena) references zena(sifra);
alter table zena_mladic add foreign key (mladic) references mladic(sifra);




#U tablici punac postavite svim zapisima kolonu majica na 
#vrijednost Osijek.

select*from punac;

update punac set majica='Osijek';

#U tablici prijatelj obrišite sve zapise čija je vrijednost kolone 
#prstena veće od 17.

select*from prijatelj;	
delete from prijatelj where prstena>17;


#Izlistajte haljina iz tablice snasa uz uvjet da vrijednost kolone 
#treciputa nepoznate

select*from snasa;
select haljina from snasa where treciputa is null;


#Prikažite nausnica iz tablice mladic, jmbag iz tablice prijatelj te 
#kratkamajica iz tablice becar uz uvjet da su vrijednosti kolone 
#treciputa iz tablice snasa poznate te da su vrijednosti kolone lipa iz 
#tablice zena različite od 29. Podatke posložite po kratkamajica iz 
#tablice becar silazno. 


select a.nausnica,f.jmbag,g.kratkamajica,d.treciputa,c.lipa,g.kratkamajica 
from mladic a
inner join zena_mladic b on a.sifra=b.mladic 
inner join zena c on c.sifra=b.zena 
inner join snasa d on c.sifra=d.zena 
inner join becar g on g.snasa=d.sifra 
inner join prijatelj f on f.becar=g.sifra 
where d.treciputa is not null and c.lipa!=29
order by g.kratkamajica desc;