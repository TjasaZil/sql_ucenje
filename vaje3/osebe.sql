CREATE TABLE oseba (
  idoseba INT AUTO_INCREMENT PRIMARY KEY,
  ime VARCHAR(45),
  priimek VARCHAR(45),
  kraj_rojstva varchar(100)
);

-- dodajanje podatkov v tabelo oseba
insert into 
oseba 
values 
(null, 'Janez', 'Novak', 'Ljubljana'), 
(null, 'Miha', 'Kovač', 'Novo mesto'), 
(null, 'Ana', 'Metelko', 'Kranj'), 
(null, 'Lucija', 'Božič', 'Ljublana'),
(null, 'Božidar', 'Jaklič', 'Ptuj');

select * from oseba;

-- iskanje vseh, ki so rojeni v ljubljani
-.-lect * from oseba where kraj_rojstva = 'ljubljana';

-- brisanje tabele oseba
drop table oseba;