
select*from mjesto;

# 69 mjesta

select*from mjesto where naziv='Osijek';

select*from mjesto where zupanija=14;

select * from mjesto where postanskibroj>=31000 and postanskibroj<=31999;



# 69 mjesta sa ac

select*from mjesto where naziv like '%ac';

# 101 mjesto koje sadrzi znakove ac, prepoznaje Č kao C

select*from mjesto where naziv like '%ac%';

insert into mjesto(postanskibroj,zupanija,naziv) values
(31001,14,'Programovci');