
# odaberite sve autore za koje ne znamo datum rođenja

select*from autor where datumrodenja is null;


# Unesite sebe kao autora
select*from autor;
insert into autor(sifra,ime,prezime,datumrodenja)values
(4,'Juraj','Mak','1990-12-24')


# odaberite autore koji su rođeni na Vaš datum rođenja
# uključujući i godinu
select*from autor where datumrodenja='1990-12-24';


# odaberite autore koji se zovu kao Vi
select*from autor where ime='Juraj';

# odaberite sve izdavače koji su 
# društva s ograničenom odgovornošću
select*from izdavac;
select*from izdavac where naziv like '%d.o.o%';



# Baza Knjižnica
#izvucite sve nazive knjiga koje su izdali
#ne aktivni izdavači

# 178 naziva knjiga
select b.naslov,a.aktivan,a.naziv
from izdavac a inner join katalog b on a.sifra=b.izdavac
where a.aktivan=false;

# izvucite sve autore koji u svojim naslovima 
# knjiga nemaju slovo B

# 509 naslova bez slova B
select a.ime,a.prezime,b.naslov
from autor a inner join katalog b on a.sifra=b.autor
where b.naslov not like'%b%';


# izvucite sve aktivne izdavače koji su izdali knjige u Zagrebu

select a.aktivan,a.naziv,c.naziv
from izdavac a inner join katalog b on a.sifra=b.izdavac
inner join mjesto c on c.sifra=b.mjesto
where a.aktivan=true and c.naziv='Zagreb';