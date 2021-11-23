

# odaberite sve autore za koje ne znamo datum rođenja

# Unesite sebe kao autora

# odaberite autore koji su rođeni na Vaš datum rođenja
# uključujući i godinu

# odaberite autore koji se zovu kao Vi

# odaberite sve izdavače koji su 
# društva s ograničenom odgovornošću


select*from autor;

insert into autor(sifra,ime,prezime,datumrodenja)values
(4,'Juraj','Mak','1990-12-24')

select*from autor where datumrodenja='1990-12-24';
select*from autor where ime='Juraj';

select*from izdavac;
select*from izdavac where naziv like '%d.o.o%';