-- 1. Ustvarite novo tabelo »uporabniki« s stolpci »id« (avtomatsko povečevalni ID),»ime« in »priimek«. 
-- Ta tabela bo shranjevala podatke o uporabnikih sistema.
CREATE TABLE Uporabniki(
    id INT, NOT NULL,  AUTO_INCREMENT, PRIMARY KEY, 
    ime VARCHAR(45), NOT NULL,
    priimek VARCHAR(45), NOT NULL
)

-- 2. Ustvarite tri nove uporabnike v tabelo »uporabniki«. Uporabniki naj imajo imena
-- »Janez Novak«, »Ana Kovač« in »Miha Horvat«.
INSERT INTO Uporabniki (ime, priimek)
VALUES
('janez','novak'),
('ana','kovač'),
('miha','horvat');

-- 6. Poiščite vse knjige, katerih avtorji so stari med 30 in 40 let ter imajo več kot 300 strani.
SELECT *
FROM knjige
WHERE strani > 300 AND starost BETWEEN 30 AND 40;

-- 7. Poiščite vse uporabnike, ki so iz mesta Ljubljana ali Maribor ter so si izposodili knjige s številom 
-- strani več kot 400.

SELECT uporabnik
FROM knjige
WHERE (mesto = 'Ljubljana' OR mesto ='Maribor') AND strani>400;

-- 8. Poiščite vse izposoje, ki so se zgodile v zadnjih 3 mesecih in so knjige z naslovom,ki se konča na »a«.
SELECT *
FROM knjige
WHERE datum_izposoje > current_date()-3 AND title LIKE '%a';

-- 9. Poiščite vse knjige, katerih avtorji imajo vsaj 2 izposoji.
SELECT *
FROM knjige
GROUP BY id
Having COUNT(izposoja)>2;

-- 10. Poiščite vse knjige, ki imajo v naslovu besedo »ljubezen« in so izdane po letu 2010.
Select *
from knjige
where naslov like '%ljubezen%' and leto_izdaje > 2010;

-- 11. Poiščite vse uporabnike, ki so si izposodili več kot eno knjigo in so v starostnem razponu od 25 do 35 let.
select uporabnik
from knjige
group by uporabnik
having count(izposoja) > 1 and age between 25 and 35;

-- 12. Poiščite vse knjige, ki so bile izposojene več kot dvakrat in so avtorji teh knjig mlajši od 40 let (INNER JOIN).
select *
from knjige k
inner join avtorji a on a.id=k.avtor_id
group by k.title
having a.starost < 40 and count(k.izposoja)>2;

-- 13. Poiščite vse uporabnike, ki so si izposodili vsaj eno knjigo v zadnjem mesecu.
-- Prikažite njihova imena, datume izposoj in naslove izposojenih knjig (INNER JOIN).
select u.ime, k.datum_izposoje, k.naslov
from uporabnik u
inner join knjige k on u.knjiga_id = k.id;
group by u.uporabnik_id
having Month(izposoja) = month(get_date())

-- 14. Poiščite vse knjige, ki so bile izposojene več kot dvakrat. Prikažite naslove teh knjig in število izposoj 
select naslovi, count(izposoje) as izposoja
from knjige
group by naslovi
where izposoja > 2;


