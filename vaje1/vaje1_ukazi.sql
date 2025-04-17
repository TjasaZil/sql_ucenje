Select * from student;

-- Izpišite vse podatke o vseh študentih z imenom Marcel.
Select * 
from student
where ime = 'Marcel';

-- Izpiši imena in vpisne številke vseh študentov, ki se pišejo Kolar.
Select ime, vpisna_st
from student
where priimek ='Kolar';

-- Kako je ime študentu z vpisno številko 2417862?
select ime
from student
where vpisna_st = 2417862;

-- Katerega leta je rojen Emil Skok?
select leto_rojstva
from student
where ime='Emil' and priimek='Skok';
 
-- Kakšna je vpisna številka Elvisa Javornika?
select vpisna_st
from student
where ime ='Elvis' and priimek ='Javornik';

-- Izpišite vse podatke o študentih, ki so rojeni po letu 1980.
select *
from student
where leto_rojstva>1980;

-- Izpišite vse podatke o študentkah z imenom Cvetka, ki so starejše od 50 let.
select *
from student
where ime='Cvetka' and 2025-leto_rojstva > 50;

-- Izpišite imena in priimke vseh študentov, ki so rojeni med 1970 in 1980.
select ime, priimek
from student
where leto_rojstva > 1970 and leto_rojstva < 1980;

-- Izpišite vse podatke o študentih, ki so rojeni v letih 1970, 1980, 1990 in 2000.
select *
from student
where leto_rojstva=1970 or leto_rojstva=1980 or leto_rojstva=1990 or leto_rojstva=2000;

-- Izpišite vse podatke o študentih, ki niso rojeni v letih 1970, 1980, 1990 in 2000.
select *
from student
where not (leto_rojstva=1970 or leto_rojstva=1980 or leto_rojstva=1990 or leto_rojstva=2000);

-- Izpišite vse podatke o študentih, ki so rojeni ali 1998 ali 2000.
select *
from student
where leto_rojstva = 1998 or leto_rojstva = 2000;

-- Ali obstaja študentka Tia Kolar rojena 1999?
select *
from student
where ime = 'Tia' and priimek = 'Kolar'and leto_rojstva='1999';