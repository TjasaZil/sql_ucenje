-- vaje 1 -- student, predmet in predavatelj
-- Izpišite vse podatke o vseh študentih z imenom Marcel.
select * from student where ime = 'Marcel';

-- Izpiši imena in vpisne številke vseh študentov, ki se pišejo Kolar.
select ime, vpisna_st from student where priimek = 'Kolar';

-- Kako je ime študentu z vpisno številko 2417862?
select ime from student where vpisna_st = 2417862;

-- Katerega leta je rojen Emil Skok?
select leto_rojstva from student where ime = 'Emil' and priimek = 'Skok';

-- Kakšna je vpisna številka Elvisa Javornika?
select vpisna_st from student where ime = 'Elvis' and priimek = 'Javornik';

-- Izpišite vse podatke o študentih, ki so rojeni po letu 1980.
select * from student where leto_rojstva > 1980;

-- Izpišite vse podatke o študentkah z imenom Cvetka, ki so starejše od 50 let.
select * from student where year(now()) - leto_rojstva > 50 and ime = 'Cvetka';

-- Izpišite imena in priimke vseh študentov, ki so rojeni med 1970 in 1980.
select * from student where leto_rojstva between 1970 and 1980;

-- Izpišite vse podatke o študentih, ki so rojeni v letih 1970, 1980, 1990 in 2000.
select * from student where leto_rojstva = 1970 or leto_rojstva = 1980 or leto_rojstva = 1990 or leto_rojstva = 2000;

-- Izpišite vse podatke o študentih, ki niso rojeni v letih 1970, 1980, 1990 in 2000.
select * from student where leto_rojstva != 1970 or leto_rojstva != 1980 or leto_rojstva != 1990 or leto_rojstva != 2000;

-- Izpišite vse podatke o študentih, ki so rojeni ali 1998 ali 2000.
select * from student where leto_rojstva = 1998 or leto_rojstva = 2000;

-- Ali obstaja študentka Tia Kolar rojena 1999?
select * from student where ime = 'Tia' and priimek = 'Kolar' and leto_rojstva = '1999';

-- vaje 2 -- movies, mpaa_ratings, genres, characters, actors
-- Kako dolgo traja najdaljši film? Rezultat poimenujte 'trajanje najdaljšega filma'.
select max(runtime) as trajanje_najdaljsega_filma from movies;

-- Koliko v povprečju stane film? Rezultat poimenujte 'povprečen budget filma'.
select avg(budget) as povprecen_budget_filma from movies;

-- Koliko je vseh filmov? Rezultat poimenujte 'vseh filmov'.
select count(*) as vseh_filmov from movies;

-- Koliko je različnih žanrov?
select count(*) as razlicnih_zanrov from genres;

-- Koliko je akcijskih (Action) filmov?
select count(g.name) as stevilo_akcijskih_filmov
from movies m
inner join genres g on m.genre_id = g.genre_id
where g.name = 'Action'
group by g.name;

-- Kakšna je povprečna ocena (rating) grozljivk (Horror)?
select avg(m.rating)
from movies m
inner join genres g on g.genre_id = m.genre_id
where g.name = 'Horror';

-- Kakšen je bil največji zaslužek (gross - budget)? Rezultat poimenujte 'zaslužek'.
select max(gross-budget) as zasluzek from movies;

-- Koliko filmov je primernih za vse generacije (G - rating)?
select count(r.rating_value) 
from movies m 
inner join mpaa_ratings r on r.mpaa_rating_id = m.mpaa_rating_id
where r.rating_value='G';

-- Izpišite dolžino najdaljšega naslova akcijskih filmov.
select max(m.title)
from movies m, genres g
where m.genre_id = g.genre_id and g.name = 'Action';

-- Kdaj je bil izdan najstarejši film?
select min(release_date) from movies;

-- Koliko filmov je bilo posnetih leta 1990?
select count(*) from movies where release_date like'1990%';

-- Kateri (naslovi) filmi so bili izdani novembra ali decembra?
select title from movies where month(release_date)= '11' or month(release_date)='12';

 -- passengers
 -- Izračunaj povprečno starost vseh potnikov.
 select avg(age) as avg_age from passengers;

-- Izračunaj skupno število potnikov.
select count(*) as all_passengers from passengers;

-- Izračunaj povprečno ceno vozovnice za potnike, ki so potovali v 2. razredu.
select avg(fare) as avg_ticket from passengers where pclass = 2;

-- Izračunaj skupni prihodek iz vozovnic potnikov, ki so potovali iz pristanišča 'S'.
select sum(fare) as sum_fare from passengers where embarked = 'S';

-- Izračunaj povprečno starost preživelih potnikov.
select avg(age) as avg_age from passengers where survived = 1;

-- Preštej, koliko potnikov je bilo žensk.
select count(*) as count_female from passengers where sex = 'female';

-- Preštej, koliko potnikov je bilo mlajših od 18 let.
select count(*) from passengers where age < 18;

-- Izračunaj povprečno ceno vozovnice za moške potnike, ki niso preživeli.
select avg(fare) as avg_fare from passengers where sex = 'male' and survived = 0;

-- Izračunaj skupno število potnikov, ki so potovali v 3. razredu in niso imeli kabine.
select count(*) as count_passengers from passengers where pclass=3 and cabin = '';

-- Izračunaj skupno število preživelih potnikov, ki so potovali iz pristanišča 'Q'.
select count(*) as count_passengers from passengers where survived = 1 and embarked = 'Q';

-- Izračunaj povprečno ceno vozovnice za preživele potnike, ki so potovali v 1. razredu.
select count(*) as count_passengers from passengers where pclass = 1 and survived = 1;

-- Izračunaj skupno število moških potnikov, ki so bili mlajši od 25 let in niso preživeli.
select count(*) as count_passengers from passengers where sex = 'male' and survived = 0 and age < 25;

-- Izračunaj povprečno starost žensk, ki so potovale iz pristanišča 'C'.
select count(*) as count_passengers from passengers where sex = 'female'  and embarked = 'C';

-- Najdi maksimalno starost med potniki, ki so potovali v 3. razredu in niso imeli kabine.
select max(age) from passengers where pclass=3 and cabin = '';

-- Izračunaj skupno število potnikov, ki so potovali iz pristanišča 'S' in so plačali manj kot 10 za vozovnico.
select count(*) from passengers where embarked = 'S' and fare <10;

-- Poišči najmanjšo ceno vozovnice med vsemi preživelimi potniki.
select min(fare) from passengers where survived = 1;

-- Izračunaj povprečno ceno vozovnice za potnike, starejše od 40 let, ki niso imeli določene kabine.
select avg(fare) from passengers where age > 40 and cabin = '';

-- Izračunaj povprečno starost potnikov, ki so potovali s pristanišča 'Q' in so plačali več kot 20 za vozovnico.
select avg(age) from passengers where embarked = 'Q' and fare > 20;

-- Najdi najvišjo ceno vozovnice med ženskami, ki so potovale v 2. razredu.
select max(fare) from passengers where pclass = 2 and sex = 'female';

-- Izračunaj skupno število potnikov brez kabine, ki so bili starejši od 30 let in niso preživeli.
select count(*) from passengers where survived = 0 and age > 30 and cabin = '';

-- Koliko filmov je bilo izdanih v vsakem žanru po letu 2010?

-- Koliko filmov je bilo izdanih v vsakem letu?

-- Za vsak mpaa_rating izpiši povprečno oceno filma.

-- Koliko je zaslužil vsak žanr? Uredite od tistega z največjim zaslužkom do tistega z najnižjim.

-- Kakšna je povprečna dolžina filma po letih?

-- Kakšno je bilo skupno število ocen v vsakem žanru?

-- Koliko v povprečju trajajo filmi različnih žanrov?

-- Koliko je skupnih ocen (rating_count) vsakega žanra?

-- Kakšna je bila povprečna cena vozovnice v posameznem cenovnem razredu?
Select avg(fare), pclass from passengers group by pclass;

-- Kakšna je bila povprečna starost preživelega in ne-preživelega potnika?
select avg(age), survived from passengers group by survived;

-- Koliko ljudi je bilo v posameznem rešilnem čolnu?
select count(*), boat from passengers group by boat;

-- Koliko potnikov niso nikoli našli?
select count(*) from passengers where body = 0;

-- Koliko potnikov se je vkrcalo na posameznem pristanišču?
select count(embarked) as embarked_group from passengers
group by embarked;

-- vaje 3 -- movies, mpaa_ratings, genres, characters, actors
-- inner join in brez
-- Izpišite imena karakterjev, ki jih je igral Arnold Schwarzenegger.
-- Poiščite povprečno oceno vsakega žanra.
-- Poiščite povprečen čas trajanja filma vsakega žanra.
-- Koliko filmov je v vsakem mpaa ratingu?
-- Izpišite naslove filmov z ratingom 'R' in oceno večjo od 7.
-- Izpišite naslove filmov v katerih je igral Keanu Reeves.
-- Izpišite imena igralcev, ki so igrali v filmu Titanic.
-- Izpišite imena igralcev, ki so kdaj igrali v grozljivki (Horror).
-- Kakšna je povprečna ocena filmov v katerih igra Robert De Niro?
-- Koliko so zaslužili filmi v katerih je igral Tom Cruise?
-- Poišči naslove vseh filmov z več kot 3 liki (characters).
-- Prikaži vse žanre (genres), kjer je bilo ustvarjenih več kot 5 filmov.
-- Prikaži vse igralce, ki so igrali v več kot 10 filmih.
-- Poišči naslove vseh filmov, ki so zaslužili več kot 1 milijon USD (budget < gross).
-- Izpiši MPAA ocene (rating_value), ki jih ima več kot 20 filmov.
-- Izpiši vse igralce, ki so igrali v vsaj enem filmu z žanrom "Drama".
-- Prikaži naslove filmov, ki imajo povprečno oceno (rating) več kot 8.0 in več kot 1000 ocen (rating_count).
-- Poišči vse filme, katerih dolžina (runtime) je nad povprečno dolžino vseh filmov.
-- Prikaži vse igralce, ki so višji od povprečne višine vseh igralcev (height_inches).
-- Prikaži naslove vseh filmov, ki so bili izdani po letu 2000 in imajo zaslužek (gross - budget) večji od povprečnega zaslužka vseh filmov.
-- Poišči igralce, ki so igrali v vsaj 3 filmih iz žanra "Drama", kjer so filmi imeli povprečno oceno (rating) več kot 7.5 in skupen zaslužek (gross - budget) več kot 10 milijonov. Prikaži ime igralca, število teh filmov, povprečno oceno teh filmov ter skupen zaslužek. Rezultate razvrsti po skupnem zaslužku.