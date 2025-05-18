/* TABELE

Jadralec(jid(PK), ime, rating, starost)
Coln(cid(PK), ime, dolzina, barva)
Rezervacija(#jid, #cid, dan)

*/

CREATE TABLE IF NOT EXISTS Jadralec (
jid INT,
ime VARCHAR(10),
rating INT,
starost DOUBLE,
PRIMARY KEY (jid)
);

INSERT INTO Jadralec (jid, ime, rating, starost) VALUES
(22, 'Darko', 7, 45),
(29, 'Borut', 1, 33),
(31, 'Lojze', 8, 55.5),
(32, 'Andrej', 8, 25.5),
(58, 'Rajko', 10, 35),
(64, 'Henrik', 7, 35),
(71, 'Zdravko', 10, 16),
(74, 'Henrik', 9, 35),
(85, 'Anze', 3, 25.5),
(95, 'Bine', 3, 63.5);

CREATE TABLE IF NOT EXISTS Coln(
    cid INT,
    ime VARCHAR(20),
    dolzina INT,
    barva VARCHAR(10),
    PRIMARY KEY (cid)
);

INSERT INTO Coln (cid, ime, dolzina, barva) VALUES
(101, Elan, 34, 'modra'),
(102, Elan, 34, 'rdeca'),
(103, Sun Odyssey, 37, 'zelena'),
(104, Bavaria, 50, 'rdeca');

CREATE TABLE IF NOT EXISTS Rezervacija(
    jid INT,
    cid INT,
    dan DATE,
    FOREIGN KEY (jid) REFERENCES Jadralec(jid),
    FOREIGN KEY (cid) REFERENCES Coln(cid)
);

INSERT INTO Rezervacija (jid, cid, dan) VALUES
(22, 101, '2006-10-10'),
(64, 101, '2006-09-05'),
(22, 102, '2006-10-10'),
(31, 102, '2006-11-10'),
(64, 102, '2006-09-08'),
(22, 103, '2006-10-08'),
(31, 103, '2006-11-06'),
(74, 103, '2006-09-08'),
(22, 104, '2006-10-07'),
(31, 104, '2006-11-12');

-- VAJE

-- 1.izpiši vse podatke iz tabele jadralec
select * from jadralec;

-- 2.izpiši ime, startost in rating iz tabele jadralec
select ime, starost, rating from jadralec;

-- 3.izpiši samo unikatna (distinct) imena iz tabele coln
select distinct ime from coln;

-- 4.pretvori dolžine colnov iz čevljev v metre
select ime, dolzina as ft, dolzina * 0.3 as m, barva from coln;

-- 5.Izpis šifer in imen rdečih čolnov, ki so krajši od 40 čevljev
select cid, ime from coln where barva = 'rdeca' and dolzina < 40;

-- 6.Izpis vseh oktobrskih rezervacij v letu 2006
select * from rezervacija where dan between '2006-10-01' and '2006-11-01';

-- 7.Izpis vseh rdečih in zelenih čolnov.
select * from coln where barva = 'zelena' or barva = 'rdeca';

-- 8.Izpis vseh jadralcev, katerih ime se začne s črko A
select ime from jadralec where ime like 'A%';

-- 9.Izpis vseh novembrskih rezervacij
select * from rezervacija where month(dan)='11';

-- 10.Izpis vseh jadralcev, ki še nimajo ratinga
select * from jadralec where rating is null;

-- 11.Izpis vseh podatkov o jadralcih, urejeno po starosti od najmlajšega do najstarejšega in pri enaki starosti nato še padajoče po ratingu (najprej višji rating)
select * from jadralec order by starost asc, rating desc;

-- 12.Izpis podatkov o rezervacijah zelenih čolnov
select * 
from jadralec j, coln c, rezervacija r
where j.jid = r.jid and c.cid = r.cid and c.barva = 'zelena';

-- 13.Izpis imen jadralcev, ki so rezervirali zelene čolne na dan 08.10.2006
select j.ime
from jadralec j, coln c, rezervacija r
where j.jid = r.jid and c.cid = r.cid and c.barva='zelena' and dan = '2006-10-08';

-- 14.Imena in šifre čolnov, ki sta jih rezervirala Darko ali Lojze (UNIJA in brez unije, simulacija preseka in razlike)
-- unija
select *
from c.cid, c.ime
where j.jid = r.jid and c.cid = r.cid and j.ime = 'Lojze'
union
select c.cid, c.ime
from jadralec j, coln c, rezervacija r
where j.jid = r.jid and c.cid = r.cid and j.ime = 'Darko';

-- brez unije
select c.cid, c.ime
from jadralec j, coln c, rezervacija r
where j.jid = r.jid and c.cid = r.cid and (j.ime = 'Lojze' or j.ime = 'Darko');

-- simulacija preseka 
select c.cid
from jadralec j, coln c, rezervacija r
where j.jid = r.jid and c.cid = r.cid and j.ime = 'Lojze'
and c.cid in (select c.cid
from jadralec j, coln c, rezervacija r
where j.jid = r.jid and c.cid = r.cid and j.ime = 'Darko');

-- simulacija razlike -> niso opravili nobene rezervacije
select j.* 
from jadralec j
where j.jid not in (
select r.jid
from rezervacija r
);

-- 15.Imena jadralcev, ki so rezervirali modre čolne (gnezdenje)
select j.*
from jadralec j
where j.jid in (
select jid
from rezervacija r, coln c
where c.cid = r.cid and c.barva='modra'
);

-- 16.brez gnezdenja
select * 
from jadralec j, rezervacija r, coln c
where j.jid = r.jid and c.cid = r.cid and c.barva = 'modra';

-- 17.Imena jadralcev, ki nikoli niso rezervirali nobenega rdečega čolna (gnezdenje)
select *
from jadralec j 
where j.jid in (
select jid
from coln c, rezervacija r
where c.cid = r.cid and c.barva != 'rdeča'
);

-- 18.brez gnezdenja
select *
from jadralec j, rezervacija r, coln c
where  j.jid = r.jid and c.cid = r.cid and c.barva != 'rdeča';

-- 19.Imena čolnov, ki so daljši od vsaj enega rdečega čolna
select *
from coln
where dolzina > any(
select dolzina
from coln
where barva = 'rdeča'
);

-- 20.Imena čolnov, ki so daljši od vseh zelenih čolnov
select c.ime
from coln c
where dolzina > all(
select co.dolzina
from coln co
where co.barva = 'zelena'
);

-- 21.Imena jadralcev, ki nikoli niso ničesar rezervirali
select j.ime
from jadralec j
left join rezervacija r on j.jid = r.jid
where r.jid is null;

-- 22.Koliko rezervacij je bilo opravljenih z zelenimi čolni?
select count(c.barva) as stevilo_zelenih_rezervacij
from coln c, rezervacija r
where c.cid = r.cid and c.barva = 'zelena';

-- 23.Koliko različnih jadralcev je rezerviralo rdeče čolne?
select count(distinct j.ime) as stevilo_jadralcev, c.barva
from coln c
inner join rezervacija r on r.cid = c.cid
inner join jadralec j on j.jid = r.jid
group by c.barva
having c.barva = 'rdeca';

select count(distinct j.ime) as stevilo_jadralcev, c.barva
from coln c, rezervacija r, jadralec j
where j.jid = r.jid and c.cid = r.cid and c.barva = 'rdeca';

-- 24.Izpis povprečne, minimalne in maksimalne starosti jadralcev z ratingom 8 ali več.
select avg(starost) as avg_starost, min(starost) as min_starost, max(starost) as max_starost, rating
from jadralec j
group by rating
having rating > 7;

-- 25.Izpis števila jadralcev po ratinških skupinah
select count(rating) as count_rating, rating
from jadralec 
group by rating;

-- 26.Izpis povprečne starosti jadralcev, ki so rezervirali čolne, glede na ratinške skupine in dolžino čolnov.
select avg(j.starost) as avg_starost,  j.rating, c.dolzina
from jadralec j
inner join rezervacija r on j.jid = r.jid
inner join coln c on c.cid = r.cid
group by j.rating, c.dolzina
order by j.rating, c.dolzina;

-- 27.Izpis povprečne starosti jadralcev starejših od 30 let po posameznih ratinških skupinah za ratinge višje od 5.
select avg(starost) as povprecna_starost, rating
from jadralec
where rating > 5  and starost > 30
group by rating;

-- 28.Za vsak rating v tabeli jadralcev izpiši starost najmlajšega polnoletnega jadralca s tem ratingom, vendar samo za tiste ratinge, ki jih imata vsaj dva jadralca!
select min(starost) as min_starost, rating, count(rating)
from jadralec
group by rating
having count(rating)>1;

