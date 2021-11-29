

##### baza world
# odaberite sve zemlje iz Europe

# unesite mjesto Donji Miholjac

# Promjenite Donji Miholjac u Špičkovinu

# Obrišite mjesto Špičkovina

select*from country;

select*from country where continent='Europe';

select*from city;


insert into city(ID,Name,CountryCode,District,Population)values
(null,'Donji Miholjac','HRV','Osijek-Baranja',9491);

select*from city where name='Donji Miholjac';

# DEFAULT CHARSET=LATIN1 PROMIJENJEN U UTF8

update city set name='Špičkovina' where id=4080;


select*from city where name='Špičkovina';

