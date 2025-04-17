create table if not exists student (
	vpisna_st int,
	ime varchar(20),
	priimek varchar(20),
	leto_rojstva int
);

create table if not exists predmet(
ime_predmeta varchar(50),
stevilo_ur int,
datum_zacetka date,
datum_izpita datetime,
kreditne_tocke int
);

create table if not exists predavatelj(
ime_predavatelja varchar(20),
priimek_predavatelja varchar(20),
naziv varchar(20),
datum_zaposlitve date,
placa int
);

-- drop table predmet;
-- drop table predavatelj;