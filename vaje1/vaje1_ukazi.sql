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

-- titanic poizvedbe
select *
from passengers;

-- Izpis vseh potnikov starejših od 50 let.
SELECT *
FROM passengers
WHERE age>50;

-- Izpis moških, ki niso preživeli nesreče.
SELECT *
FROM passengers
WHERE sex = 'male' and survived = 0;

-- Izpis vseh potnikov, ki so se vkrcali v Southampton (S).
SELECT *
FROM passengers
WHERE embarked = 'S';
 
-- Iskanje potnikov, ki so plačali vozovnico med 20 in 50 enotami.
SELECT *
FROM passengers
WHERE fare BETWEEN 20 AND 50;

-- Izpis vseh žensk, ki so potovale v New York.
SELECT *
FROM passengers
WHERE sex ='female' AND homedest LIKE '%New York%';

-- Izpis potnikov, ki so potovali v Boston ali London.
SELECT *
FROM passengers
WHERE homedest LIKE '%Boston%' or homedest LIKE '%London%' ;

-- Izpis vseh potnikov, katerih ime vsebuje besedo 'Smith'.
SELECT *
FROM passengers
WHERE name LIKE '%Smith%';

-- Izpis vseh potnikov brez kabine (cabin je NULL).
SELECT *
FROM passengers
WHERE cabin = '';

-- Izpis žensk, ki so plačale vozovnico več kot 100 enot.
SELECT *
FROM passengers
WHERE sex = 'female' AND fare > 100;

-- Izpis moških, ki so bili stari manj kot 18 let.
SELECT *
FROM passengers
WHERE sex = 'male' AND age < 18;

-- Izpis vseh potnikov, ki so imeli številko telesa (body) med 1 in 100.
SELECT *
FROM passengers
WHERE body BETWEEN 	1 AND 100;

-- Izpis potnikov, katerih ime se začne z 'A'.
SELECT *
FROM passengers
WHERE name LIKE 'A%';

-- Izpis žensk, ki so bile na rešilnem čolnu (boat ni NULL).
SELECT *
FROM passengers
WHERE sex = 'female' AND boat != '';

-- Izpis potnikov, ki so potovali v več kot eni destinaciji (homedest vsebuje '/').
SELECT *
FROM passengers
WHERE homedest LIKE '%/%';

-- Izpis potnikov, ki so se vkrcali v Cherbourg (C) in plačali več kot 50 enot.
SELECT *
FROM passengers
WHERE embarked ='C' AND fare > 50;

-- Izpis vseh potnikov z imenom daljšim od 20 znakov.
SELECT *, CHAR_LENGTH(name) AS name_lng
FROM passengers
WHERE CHAR_LENGTH(name) > 20;

-- Izpis vseh preživelih, katerih starost ni bila zabeležena (age je NULL).
SELECT *
FROM passengers
WHERE age = 0 AND survived=1;

-- Izpis žensk ali moških, ki so potovali v Paris.
SELECT *
FROM passengers
WHERE homedest LIKE '%Paris%';

-- Izpis potnikov, katerih cena vozovnice se konča z '.00'.
SELECT *
FROM passengers
WHERE CAST(fare AS CHAR) LIKE '%.00';

-- Izpis vseh moških, ki so plačali vozovnico manj kot 10 enot in potovali v Southampton.
SELECT *
FROM passengers
WHERE sex = 'male' AND fare < 10 AND homedest LIKE '%Southampton%';

-- Izpis preživelih žensk, ki so potovale v New York in so bile stare med 18 in 40 let.
SELECT *
FROM passengers
WHERE sex = 'female' AND homedest LIKE '%New York%' AND age BETWEEN 18 and 40;

-- Izpis potnikov, ki niso preživeli, so se vkrcali v Southampton (S) ali Cherbourg (C), in so bili starejši od 30 let.
SELECT *
FROM passengers
WHERE (embarked = 'S' or embarked = 'C') AND age > 30 AND survived = 0;

-- Izpis vseh potnikov, ki so plačali manj kot 20 enot ali več kot 100 enot in niso imeli kabine.
SELECT *
FROM passengers
WHERE (fare <20 or fare >100) and cabin = '';

-- Izpis moških, ki so bili mlajši od 18 let ali starejši od 60 let, in niso imeli določene destinacije (homedest je NULL).
SELECT *
FROM passengers
WHERE sex = 'male' AND (age<18 or age>60) and homedest = '';

-- Izpis žensk, ki so potovale v Paris ali London, so bile stare med 25 in 50 let, in niso bile na rešilnem čolnu.
SELECT *
FROM passengers
WHERE sex = 'female' AND (homedest LIKE '%London%' OR homedest LIKE '%Paris%') AND age BETWEEN 25 AND 50 AND boat = '';

-- Izpis potnikov, katerih ime se začne z 'J' ali 'M', so plačali vozovnico med 30 in 70 enotami, in niso imeli številke telesa (body je NULL).
SELECT *
FROM passengers
WHERE (name LIKE 'J%' OR name LIKE 'M%') AND fare BETWEEN 30 AND 70 AND body = 0;

-- Izpis moških, ki so potovali v Southampton, so bili mlajši od 25 let, in so plačali več kot 50 enot za vozovnico.
SELECT *
FROM passengers
WHERE sex = 'male' AND homedest LIKE '%Southampton%' AND age < 25 and fare > 50; -- ne obstaja zato ne vrne ničesar

-- Izpis vseh potnikov, ki niso preživeli in so plačali vozovnico manj kot 10 enot ali pa so bili mlajši od 15 let.
SELECT *
FROM passengers
WHERE survived = 0 AND (fare < 10 OR age < 15);

-- Izpis žensk, ki so potovale v New York, so bile stare vsaj 30 let, in so preživele.
SELECT *
FROM passengers
WHERE sex = 'female'and homedest LIKE '%New York%' AND age>30 and survived = 1;