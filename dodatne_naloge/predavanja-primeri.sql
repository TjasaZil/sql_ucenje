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

-- izpiši vse podatke iz tabele jadralec

-- izpiši ime, startost in rating iz tabele jadralec

-- izpiši samo unikatna (distinct) imena iz tabele coln

-- pretvori dolžine colnov iz čevljev v metre

-- Izpis šifer in imen rdečih čolnov, ki so krajši od 40 čevljev

-- Izpis vseh oktobrskih rezervacij v letu 2006

-- Izpis vseh rdečih in zelenih čolnov.

-- Izpis vseh jadralcev, katerih ime se začne s črko A

-- Izpis vseh novembrskih rezervacij

-- Izpis vseh jadralcev, ki še nimajo ratinga

-- Izpis vseh podatkov o jadralcih, urejeno po starosti od najmlajšega do
-- najstarejšega in pri enaki starosti nato še padajoče po ratingu (najprej
-- višji rating)

-- Izpis podatkov o rezervacijah zelenih čolnov

-- Izpis imen jadralcev, ki so rezervirali zelene čolne na dan 08.10.2006

-- Imena in šifre čolnov, ki sta jih rezervirala Darko ali Lojze (UNIJA in brez unije, simulacija preseka in razlike)

-- Imena jadralcev, ki so rezervirali modre čolne (gnezdenje)

-- Imena jadralcev, ki nikoli niso rezervirali nobenega rdečega čolna (gnezdenje)

-- Imena čolnov, ki so daljši od vsaj enega rdečega čolna

-- Imena čolnov, ki so daljši od vseh zelenih čolnov

-- Imena jadralcev, ki nikoli niso ničesar rezervirali

-- Koliko rezervacij je bilo opravljenih z zelenimi čolni?

-- Koliko različnih jadralcev je rezerviralo rdeče čolne?

-- Izpis povprečne, minimalne in maksimalne starosti jadralcev z ratingom 8 ali več.

-- Izpis števila jadralcev po ratinških skupinah

-- Izpis povprečne starosti jadralcev, ki so rezervirali čolne, glede na ratinške skupine in dolžino čolnov.

-- Izpis povprečne starosti jadralcev starejših od 30 let po posameznih ratinških skupinah za ratinge višje od 5.

-- Za vsak rating v tabeli jadralcev izpiši starost najmlajšega polnoletnega
-- jadralca s tem ratingom, vendar samo za tiste ratinge, ki jih imata vsaj
-- dva jadralca!

-- Vnos nove vrstice v tabelo rezervacija (brez imen stolpcev):

-- V tabelo Jadralec dodamo novo vrstico

-- Predpostavimo, da imamo tabelo stariJadralec z enako shemo kot
-- tabela jadralec. Vanjo želimo vnesti šifre, imena in starost jadralcev,
-- starejših od 40 let.

-- Vsem starim jadralcem postavimo rating na 10.

-- Vsem starim jadralcem zmanjšaj rating za 10%

-- Izbriši vse rezervacije pred letom 2006.

-- Izbriši vse rezervacije zelenih čolnov pred letom 2006.