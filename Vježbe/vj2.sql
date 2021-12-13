drop database if exists vj2;
create database vj2 character set utf8;
use vj2;

create table svekar(
    sifra int not null primary key auto_increment,
    stilfrizura varchar(48),
    ogrlica int not null,
    asocijalno boolean not null
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(37),
    treciputa datetime not null,
    ekstroventno boolean not null,
    prviputa datetime,
    svekar int not null
);

create table zarucnica(
    sifra int not null primary key auto_increment,
    narukvica int,
    bojakose varchar(37) not null,
    novcica decimal(15,9),
    lipa decimal(15,8) not null,
    indiferentno boolean not null
);

create table decko(
    sifra int not null primary key auto_increment,
    indiferentno boolean,
    vesta varchar(34),
    asocijalno boolean not null
);

create table decko_zarucnica(
    sifra int not null primary key auto_increment,
    decko int not null,
    zarucnica int not null
   
);


create table cura(
    sifra int not null primary key auto_increment,
    haljina varchar(33) not null,
    drugiputa datetime not null,
    suknja varchar(38),
    narukvica int,
    introvertno boolean,
    majica varchar(40) not null,
    decko int
   
);



create table neprijatelj(
    sifra int not null primary key auto_increment,
    majica varchar(32),
    haljina varchar(43) not null,
    lipa decimal(16,8),
    modelnaocala varchar(49) not null,
    kuna decimal(12,6) not null,
    jmbag char(11),
    cura int 
);

create table brat(
    sifra int not null primary key auto_increment,
    suknja varchar(47),
    ogrlica int not null,
    asocijalno boolean not null,
    neprijatelj int not null
);


alter table prijatelj add foreign key(svekar) references svekar (sifra);
alter table decko_zarucnica add foreign key(zarucnica) references zarucnica(sifra);
alter table decko_zarucnica add foreign key(decko) references decko(sifra);
alter table cura add foreign key(decko) references decko(sifra);
alter table neprijatelj add foreign key(cura) references cura(sifra);
alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);




select*from svekar;
describe svekar;
insert into svekar(stilfrizura,ogrlica,asocijalno)values
('kratka',1551,true),
('duga',121,true),
('celav',111,true),
('duga',121,true),
('kratka',114,false);


select*from prijatelj;
describe prijatelj;
insert into prijatelj(modelnaocala,treciputa,ekstroventno,prviputa,svekar)values
('biciklisticke','2021-11-11',false,'2021-10-10',1),
('sportske','2021-11-11',true,'2021-10-10',2),
('biciklisticke','2021-11-11',true,'2021-10-10',3),
('krkanske','2021-11-11',false,'2021-10-10',4),
('biciklisticke','2021-11-11',true,'2021-10-10',5);


select*from zarucnica;
describe zarucnica;
insert into zarucnica(narukvica,bojakose,novcica,lipa,indiferentno)values
(22,'zelena',174.44,32.44,false),
(4,'plava',124.44,2.44,false),
(122,'roza',64.44,312.44,true),
(2,'zelena',34.44,152.44,false),
(1,'crna',14.14,12.474,true),
(15,'smeđa',12.44,172.44,false);


select*from decko;
describe decko;
insert into decko(indiferentno,vesta,asocijalno)values
(true,'plava',false),
(false,'balon',false),
(true,'plava',false),
(true,'zaba',true),
(true,'smeđa',true),
(true,'obao',false),
(false,'crna',true);

select*from cura;
describe cura;
insert into cura(haljina,drugiputa,suknja,narukvica,introvertno,majica,decko)values
('kratka','2021-11-11','dopicnjak',212,true,'kratka',1),
('duga','2021-11-11','zelena',122,true,'duga',2),
('kratka','2021-11-11','kratka',125,true,'kratka',3),
('duga','2021-11-11','zelena',125,true,'kratka',4),
('kratka','2021-11-11','zelena',152,true,'kratka',5),
('crna','2021-11-11','duga',122,true,'zelena',6),
('kratka','2021-11-11','zelena',312,true,'kratka',7);


select*from neprijatelj;
describe neprijatelj;
insert into neprijatelj(majica,haljina,lipa,modelnaocala,kuna,jmbag,cura)values
('kratka','duga',13.21,'crne',23.33,'12312312332',1),
('kratka','duga',13.21,'tamne',03.33,'12312312342',2),
('duga','kratka',13.21,'seljoberske',23.33,'12312312322',2),
('duksa','duga',13.21,'armani',13.33,'12312312632',3),
('kratka','duga',13.21,'tamne',33531.33,'12312352332',4),
('kratka','kratka',13.21,'zute',3336.33,'12314312332',5),
('duga','duga',13.21,'police',345.33,'12312512332',6),
('duga','kratka',13.21,'tamne',32.13,'12312412332',7);

select*from brat;
describe brat;

insert into brat(suknja,ogrlica,asocijalno,neprijatelj)values
('kratka',120,true,1),
('kratka',1,false,5),
('kratka',142,true,2),
('kratka',162,false,3),
('kratka',122,true,4),
('kratka',2,false,5),
('kratka',12,true,6),
('duga',112,true,7),
('duga',22,false,8);

insert into decko_zarucnica(decko,zarucnica)values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6);



select g.haljina,a.novcica,f.neprijatelj,g.haljina,d.drugiputa,c.vesta
from zarucnica a
inner join decko_zarucnica b on a.sifra=b.zarucnica 
inner join decko c on c.sifra=b.decko
inner join cura d on d.decko=c.sifra 
inner join neprijatelj g on g.cura=d.sifra 
inner join brat f on f.neprijatelj=g.sifra
where d.drugiputa is not null and c.vesta like '%ba%'
order by g.haljina desc;
