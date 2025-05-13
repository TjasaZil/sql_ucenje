/*-- Študenti in predmeti
Student(sid, name, age, major)  
Course(cid, title, credits)  
Enrollment(sid, cid, grade)  

-- Profesorji in predavanja
Professor(pid, name, department)  
Teaches(pid, cid)  */

-- 1. Osnovne selekcije in projekcije
-- Izpišite name in major vseh študentov s smerjo “Računalništvo”.

-- Prikažite title in credits vseh predmetov, ki imajo več kot 4 kredite.

-- 2. Filtri in urejanje
-- Poiščite vse študente, stare med 20 in 25 let, urejene po priimku (vzponjo).

-- Prikažite vse predmete, katerih naziv vsebuje niz “Data”, urejene po številu kreditov padajoče.

-- 3. Joini
-- Izpišite seznam vseh vpisov z imenom študenta, naslovom predmeta in oceno.

-- Prikažite za vsakega profesorja (pid, name) seznam predmetov, ki jih predava (tudi če jih ni – uporaba LEFT JOIN).

-- 4. Agregacije in GROUP BY
-- Za vsak predmet izračunajte povprečno oceno in število vpisov, nato rezultat omejite na tiste s povprečjem ≥ 3.5.

-- Prikažite, koliko različnih študentov je vpisanih na vsako smer (major).

-- 5. HAVING vs. WHERE
-- Prikažite predmete, kjer je vsaj 5 vpisov (COUNT(enrollment.sid) ≥ 5).

-- Izrišite oddelke profesorjev (department) z vsaj 3 profesorji.

-- 6. Podpoizvedbe
-- Napišite poizvedbo, ki najde študente, ki so vpisani na vse predmete s krediti ≥ 3.

-- Poiščite predmete, na katere se ni vpisal noben študent.

-- 7. Korelirane podpoizvedbe
-- Prikažite študente, katerih osebna ocena (v kateremkoli predmetu) je nad povprečjem vseh njihovih ocen.

-- Najdite professorje, ki predavajo le predmete z vsaj 4 krediti.

-- 8. CTE (WITH)
-- Uporabite CTE za izračun povprečne ocene vsakega študenta, nato iz te CTE izpišite le tiste z ocenami ≥ 3.0.

-- Z dvojnim CTE: najprej izračunajte “težke” predmete (credits ≥ 4), nato iz njih čez drugi CTE pridobite število vpisov na ta “težke” predmete.

-- 9. Okenske funkcije
-- Prikažite za vsakega študenta (sid, name) vrstni red predmetov glede na oceno (najvišja ocena ˃ 1).

-- Izpišite za vsako smer (major) študenta njegov sid, name, oceno in % relativno uvrstitev znotraj smeri (funkcija PERCENT_RANK).

-- 10. Kompleksne naloge
-- Združite CTE, podpoizvedbe in okenske funkcije, da za vsakega študenta pridobite:

-- skupno število točk (vsota credits * grade),

-- povprečno oceno,

-- položaj (rank) glede na skupne točke v okviru smeri (major).

-- Napišite transakcijo, ki:

-- v tabeli Enrollment doda nov vpis,

-- če je grade nižja od ’C’, ga popravi na ’C’,

-- zabeleži v pomočni tabeli Audit(sid, cid, old_grade, new_grade, changed_at) vse spremembe ocen.