SELECT * FROM student;

-- Izpišite vse podatke o vseh študentih z imenom Marcel.
SELECT * 
FROM student
WHERE ime = 'Marcel';

-- Izpiši imena in vpisne številke vseh študentov, ki se pišejo Kolar.
SELECT ime, vpisna_st
FROM student
WHERE priimek ='Kolar';

-- Kako je ime študentu z vpisno številko 2417862?
SELECT ime
FROM student
WHERE vpisna_st = 2417862;

-- Katerega leta je rojen Emil Skok?
SELECT leto_rojstva
FROM student
WHERE ime='Emil' AND priimek='Skok';
 
-- Kakšna je vpisna številka Elvisa JavORnika?
SELECT vpisna_st
FROM student
WHERE ime ='Elvis' AND priimek ='Javornik';

-- Izpišite vse podatke o študentih, ki so rojeni po letu 1980.
SELECT *
FROM student
WHERE leto_rojstva>1980;

-- Izpišite vse podatke o študentkah z imenom Cvetka, ki so starejše od 50 let.
SELECT *
FROM student
WHERE ime='Cvetka' AND YEAR(CURDATE()) - leto_rojstva > 50;

-- Izpišite imena in priimke vseh študentov, ki so rojeni med 1970 in 1980.
SELECT ime, priimek
FROM student
WHERE leto_rojstva BETWEEN 1970 AND  1980;

-- Izpišite vse podatke o študentih, ki so rojeni v letih 1970, 1980, 1990 in 2000.
SELECT *
FROM student
WHERE leto_rojstva IN (1970,1980,1990,2000);

-- Izpišite vse podatke o študentih, ki niso rojeni v letih 1970, 1980, 1990 in 2000.
SELECT *
FROM student
WHERE leto_rojstva NOT IN (1970,1980,1990,2000);

-- Izpišite vse podatke o študentih, ki so rojeni ali 1998 ali 2000.
SELECT *
FROM student
WHERE leto_rojstva IN (1998,2000);

-- Ali obstaja študentka Tia Kolar rojena 1999?
SELECT *
FROM student
WHERE ime = 'Tia' AND priimek = 'Kolar' AND leto_rojstva='1999';