-- FUNKCIJE ZDRUZEVANJA

-- Kako dolgo traja najdaljši film? Rezultat poimenujte 'trajanje najdaljšega filma'.
SELECT MAX(runtime) AS trajanje_najdaljsega_filma
FROM movie2;

-- Koliko v povprečju stane film? Rezultat poimenujte 'povprečen budget filma'.
SELECT AVG(budget) AS povprecen_budget_filma
FROM movie2;

-- Koliko je vseh filmov? Rezultat poimenujte 'vseh filmov'.
SELECT COUNT(*) AS vseh_filmov
FROM movie2;

-- Koliko je različnih žanrov?
SELECT COUNT(DISTINCT genre) AS razlicnih_zanrov
FROM movie2;

-- Koliko je akcijskih (Action) filmov? -> nisem ziher ce je prava resitev
SELECT genre, COUNT(genre) AS stevilo_akcijskih_filmov
FROM movie2
GROUP BY genre
HAVING genre = 'Action';

-- kakšna je povprečna ocena (rating) grozljivk (Horror)?
SELECT genre,  AVG(rating) AS povprecna_ocena
FROM movie2
GROUP BY genre
HAVING genre='Horror';

-- Kakšen je bil največji zaslužek (gross - budget)? Rezultat poimenujte 'zaslužek'. -> NISEM ZIHER CE JE PRAVI REZULTAT
SELECT MAX(gross-budget) AS najvecji_zasluzek
FROM movie2; 

-- Koliko filmov je primernih za vse generacije (G - rating)?
SELECT mpaa_rating, COUNT(mpaa_rating) AS primerni_za_vse_generacije
FROM movie2
GROUP BY mpaa_rating
HAVING mpaa_rating = 'G';