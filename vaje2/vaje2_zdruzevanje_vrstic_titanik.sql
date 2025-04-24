-- ZDRUZEVANJE VRSTIC PASSENGERS

-- Kakšna je bila povprečna cena vozovnice v posameznem cenovnem razredu?
SELECT pclass, AVG(fare) AS avg_fare
FROM passengers
GROUP BY pclass;

-- Kakšen je bil odstotek preživelih moških in žensk?
SELECT
  sex,
  ROUND(AVG(survived) * 100, 2) AS survival_percentage
FROM passengers
GROUP BY sex;

-- Kakšna je bila povprečna starost preživelega in ne-preživelega potnika?
SELECT survived, AVG(age) AS avg_age
FROM passengers
GROUP BY survived;

-- Koliko ljudi je bilo v posameznem rešilnem čolnu?
SELECT boat, COUNT(*) AS count_passengers
FROM passengers
WHERE boat != ''
GROUP BY boat;

-- Koliko potnikov niso nikoli našli?
SELECT COUNT(*) AS count_passengers
FROM passengers
WHERE body = 0;

-- Koliko potnikov se je vkrcalo na posameznem pristanišču?
SELECT embarked, COUNT(*) AS stevilo_potnikom
FROM passengers
GROUP BY embarked;