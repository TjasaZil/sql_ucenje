/*
Izdelajte ER model za upravljanje s podatki tekačev ljubljanskega maratona: https://ljubljanskimaraton.si/
Po izdelanem ER modelu, sestavite SQL CREATE stavke s katerimi izdelajte tabele.
Preverite ali ER model omogoča pridobivanje ustreznih informacij o tekih. Npr.: iz katere države je ženska z najhitrejšim časom v kategoriji C v teku na 21km?
Z uporabo stavka ALTER spremenite poljubne atribute 
(dodajte, spremenite in odstranite).
V tabele nato zapišite po nekaj podatkov z uporabi SQL INSERT stavkov.
Tabelo napolnite še s podatki, ki jih ustvarite s pomočjo: https://www.mockaroo.com/
*/

/*
Podatki tekačev

- tekač
id tekača
ime
priimek
štartna številka
spol
starost
rojstni datum
id maratona
čas teka
id kategorija
id države

- maratoni
id maratona
ime maratona
dolžina maratona
je prijavnina
datum in ura

kategorije
id kategorije
ime kategorije

države
id države
ime države

*/

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Maratoni`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Maratoni` (
  `idMaratoni` INT UNSIGNED NOT NULL,
  `naslov` VARCHAR(100) NOT NULL,
  `dolzina` INT UNSIGNED NOT NULL,
  `prijavnina` INT UNSIGNED NULL,
  `datum` DATETIME NOT NULL,
  PRIMARY KEY (`idMaratoni`))


-- -----------------------------------------------------
-- Table `mydb`.`Kategorije`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Kategorije` (
  `idKategorije` INT UNSIGNED NOT NULL,
  `imeKategorije` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idKategorije`))


-- -----------------------------------------------------
-- Table `mydb`.`Drzave`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Drzave` (
  `idDrzave` INT UNSIGNED NOT NULL,
  `imeDrzave` VARCHAR(45) NULL,
  PRIMARY KEY (`idDrzave`))


-- -----------------------------------------------------
-- Table `mydb`.`Tekaci`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tekaci` (
  `idTekaci` INT UNSIGNED NOT NULL,
  `ime` VARCHAR(45) NOT NULL,
  `priimek` VARCHAR(45) NOT NULL,
  `startna_stevilka` INT UNSIGNED NOT NULL,
  `spol` VARCHAR(1) NOT NULL,
  `starost` INT UNSIGNED NULL,
  `idMaraton` INT UNSIGNED NOT NULL,
  `cas_teka` INT UNSIGNED NULL,
  `idKategorija` INT UNSIGNED NOT NULL,
  `idDrzave` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idTekaci`),
  INDEX `fk_idMaraton_tekaci_idx` (`idMaraton` ASC) VISIBLE,
  INDEX `fk_idKategorije_Tekaci_idx` (`idKategorija` ASC) VISIBLE,
  INDEX `fk_idDrzave_Tekaci_idx` (`idDrzave` ASC) VISIBLE,
  CONSTRAINT `fk_idMaraton_tekaci`
    FOREIGN KEY (`idMaraton`)
    REFERENCES `mydb`.`Maratoni` (`idMaratoni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idKategorije_Tekaci`
    FOREIGN KEY (`idKategorija`)
    REFERENCES `mydb`.`Kategorije` (`idKategorije`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idDrzave_Tekaci`
    FOREIGN KEY (`idDrzave`)
    REFERENCES `mydb`.`Drzave` (`idDrzave`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

    -- Primer alter

    ALTER TABLE mydb.Tekaci ADD datum_rojstva DATETIME;
    ALTER TABLE mydb.Tekaci DROP COLUMN starost;

    ALTER TABLE mydb.Tekaci ADD starost INT;
    ALTER TABLE mydb.Tekaci DROP COLUMN datum_rojstva;

    -- insert

    INSERT INTO Tekaci VALUES
      ( 1, 'Ana',     'Horvat', 101, 'Z', 29, 1, 15000, 2, 1),
  ( 2, 'Marko',   'Novak',  102, 'M', 35, 1, 13800, 1, 1),
  ( 3, 'Petra',   'Kralj',  201, 'Z', 45, 2, 16000, 3, 1),
  ( 4, 'Ivan',    'Jelenc', 202, 'M', 17, 2, 14500, 4, 2),
  ( 5, 'Lucia',   'Rossi',  301, 'Z', 31, 3,  7000, 2, 3),
  ( 6, 'Tom',     'Müller', 302, 'M', 40, 3,  6500, 3, 4),
  ( 7, 'Eva',     'Schmidt',401, 'Z', 50, 4, 17000, 3, 4),
  ( 8, 'Luka',    'Kovač',  402, 'M', 28, 4, 13200, 2, 1),
  ( 9, 'Sophie',  'Dubois', 501, 'Z', 38, 5,  3600, 5, 5),
  (10, 'Peter',   'Meier',  502, 'M', 42, 5,  3500, 5, 5);

    INSERT INTO Drzave VALUES
      (1, 'Slovenija'),
  (2, 'Hrvaška'),
  (3, 'Italija'),
  (4, 'Nemčija'),
  (5, 'Švica');

    INSERT INTO Maratoni VALUES 
    (1, 'Ljubljana Marathon',        42, 50, '2025-10-15 08:00:00'),
  (2, 'Maraton Franja',            42, 40, '2025-06-01 09:00:00'),
  (3, 'Half Marathon Maribor',     21, 30, '2025-05-20 09:30:00'),
  (4, 'Celje Marathon',            42, 45, '2024-10-27 08:00:00'),
  (5, 'Piran 10K',                 10, 20, '2025-09-10 07:00:00');

    iNSERT INTO Kategorije VALUES
      (1, 'Elite'),
  (2, 'Open'),
  (3, 'Veteran 40+'),
  (4, 'Youth'),
  (5, 'Wheelchair');