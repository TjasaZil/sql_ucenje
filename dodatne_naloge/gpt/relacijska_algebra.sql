/*Shema
Student(sid, name, age, major)

Course(cid, title, credits)

Enrollment(sid, cid, grade)

Professor(pid, name, department)

Teaches(pid, cid)*/

-- NALOGE
-- Osnovna selekcija + projekcija
-- Izluščite imena in študijske smeri (major) vseh študentov, ki so starejši od 21 let.

-- Unija in razlika
-- a) Poiščite vse študente, ki so vpisani vsaj enkrat (preko tabele Enrollment).
-- b) Nato z različno (−) poizvedbo identificirajte tiste, ki še niso imeli nobenega vpisa.

-- Notranji join
-- Izpišite par „ime študenta – naslov (title) predmeta“, za vse študente, ki so vpisani na kakršen koli predmet.

-- Join z dodatnimi pogojih
-- Prikažite imena študentov in naziv profesorja za vse primere, kjer študent obiskuje predmet, ki ga predava določeni profesor.

-- Deljenje (division)
-- Navedite vse študente, ki so se udeležili vseh predmetov, ki jih poučuje profesor z imenom „Dr. Novak“.

-- Preimenovanje (ρ) in self-join
-- Najdite vse pare različnih študentov, ki sta oba vpisana na vsaj en isti predmet. Pri tem tabelo Student preimenujte dvakrat (npr. S1, S2) in uporabite self-join.

-- Združevanje rezultatov (∪)
-- a) Seznam vseh predmetov, ki imajo vsaj 3 kredite.
-- b) Seznam vseh predmetov, ki jih predava oddelek „Matematika“.
-- Združite ti dve množici z unijo (∪).

-- Razlika množic (−)
-- Prikažite naslove vseh predmetov, ki jih ni noben študent nikoli uspešno zaključil z oceno ≥ ’B’.