-- PASSENGERS DODATNE NALOGE

-- Izračunaj povprečno starost vseh potnikov.
SELECT AVG(age) AS avg_age
FROM passengers;

-- Izračunaj skupno število potnikov.
SELECT COUNT(*) AS stevilo_potnikov
 FROM passengers;
 
-- Izračunaj povprečno ceno vozovnice za potnike, ki so potovali v 2. razredu.
SELECT pclass, AVG(fare) AS avg_fare
FROM passengers
GROUP BY pclass
HAVING pclass='2';

-- Izračunaj skupni prihodek iz vozovnic potnikov, ki so potovali iz pristanišča 'S'.
SELECT embarked, SUM(fare) AS vsota
FROM passengers
GROUP BY embarked
HAVING embarked = 'S';

-- Izračunaj povprečno starost preživelih potnikov.
SELECT survived, AVG(age) AS avg_age
FROM passengers
GROUP BY survived
HAVING survived = 1;

-- Preštej, koliko potnikov je bilo žensk.
SELECT sex, COUNT(*) AS stevilo_zensk
FROM passengers
GROUP BY sex
HAVING sex = 'female'; 

-- Preštej, koliko potnikov je bilo mlajših od 18 let.
SELECT COUNT(*) AS stevilo_mladoletnih
FROM passengers
WHERE age < 18;

-- Izračunaj povprečno ceno vozovnice za moške potnike, ki niso preživeli.
SELECT survived, sex, AVG(fare) AS avg_ticket
FROM passengers
GROUP BY sex, survived
HAVING sex = 'male' AND survived = 0;

-- Izračunaj skupno število potnikov, ki so potovali v 3. razredu in niso imeli kabine.
SELECT pclass, cabin, COUNT(*) AS stevilo_potnikov
FROM passengers
GROUP BY pclass, cabin
HAVING pclass = 3 AND cabin = '';

-- Izračunaj skupno število preživelih potnikov, ki so potovali iz pristanišča 'Q'.
SELECT COUNT(*) AS stevilo_prezivelih_potnikov
FROM passengers
WHERE survived = 1 AND embarked = 'Q';

-- Izračunaj povprečno ceno vozovnice za preživele potnike, ki so potovali v 1. razredu.
SELECT AVG(fare) AS avg_fare
FROM passengers
WHERE survived = 1 AND pclass = 1;

-- Izračunaj skupno število moških potnikov, ki so bili mlajši od 25 let in niso preživeli.
SELECT COUNT(*) AS stevilo_moskih
FROM passengers
WHERE age < 25 AND survived = 0 AND sex = 'male';

-- Izračunaj povprečno starost žensk, ki so potovale iz pristanišča 'C'.
SELECT AVG(age) AS avg_age
FROM passengers
WHERE sex = 'female' AND embarked = 'C';

-- Najdi maksimalno starost med potniki, ki so potovali v 3. razredu in niso imeli kabine.
SELECT MAX(age) AS max_age
FROM passengers
WHERE pclass=3 and cabin='';

-- Izračunaj skupno število potnikov, ki so potovali iz pristanišča 'S' in so plačali manj kot 10 za vozovnico.
SELECT COUNT(*) AS count_passengers
FROM passengers
WHERE embarked = 'S' AND fare < 10;

-- Poišči najmanjšo ceno vozovnice med vsemi preživelimi potniki.
SELECT MIN(fare) AS min_fare
FROM passengers
WHERE survived = 1;

-- Izračunaj povprečno ceno vozovnice za potnike, starejše od 40 let, ki niso imeli določene kabine.
SELECT AVG(fare) AS avg_fare
FROM passengers
WHERE age > 40 AND cabin = '';

-- Izračunaj povprečno starost potnikov, ki so potovali s pristanišča 'Q' in so plačali več kot 20 za vozovnico.
SELECT AVG(age) AS avg_age
FROM passengers
WHERE embarked = 'Q'and fare > 20;

-- Najdi najvišjo ceno vozovnice med ženskami, ki so potovale v 2. razredu.
SELECT MAX(fare) AS max_fare
FROM PASSENGERS
WHERE sex = 'female' AND pclass = 2;

-- Izračunaj skupno število potnikov brez kabine, ki so bili starejši od 30 let in niso preživeli.
SELECT COUNT(*) AS stevilo_potnikov 
FROM passengers
WHERE cabin = '' AND age > 30 AND survived = 0;