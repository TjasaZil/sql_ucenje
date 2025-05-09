-- VAJA
/*
 Vaša naloga je izdelati ER (Entity-Relationship) model, ki bo prikazoval ključne
entitete in njihove povezave pri organizaciji ropa banke. Uporabite svoje znanje o ER modeliranju
in kreativnost, da ustvarite natančen in smiseln model.
*/

-- BRAINSTORMING
/*
Roparji
roparji id (PK)
vozilo id (FK)
naloga id (FK)
lokacija id (FK)
ime
priimek
starost

naloga roparja
naloga id (PK)
opis naloge (voznik, tehnik, heker, obveščevalec, drugo)

vozilo
vozilo id (PK)
ime vozila
kapaciteta

orodje
orodje id (PK)
roparji id (FK)
ime orodja (vreča, telefon, ključi)
število orodja

orožje
orožje id (PK)
roparji id (FK)
ime orožja (sekira, pištola, nož)
število orožja

Lokacije
lokacije id (PK)
ime lokacije
tip
opis
*/

-- -----------------------------------------------------
-- Table `er_vaje`.`Naloge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `er_vaje`.`Naloge` (
  `idNaloge` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `imeNaloge` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idNaloge`))


-- -----------------------------------------------------
-- Table `er_vaje`.`Vozila`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `er_vaje`.`Vozila` (
  `idVozila` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `vrstaVozila` VARCHAR(45) NOT NULL,
  `kapaciteta` INT NULL,
  `barva` VARCHAR(45) NULL,
  PRIMARY KEY (`idVozila`))


-- -----------------------------------------------------
-- Table `er_vaje`.`Lokacije`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `er_vaje`.`Lokacije` (
  `idLokacije` INT UNSIGNED NOT NULL,
  `imeLokacije` VARCHAR(255) NOT NULL,
  `tip` VARCHAR(45) NOT NULL,
  `opis` MEDIUMTEXT NULL,
  PRIMARY KEY (`idLokacije`))


-- -----------------------------------------------------
-- Table `er_vaje`.`Roparji`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `er_vaje`.`Roparji` (
  `idRoparji` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idVozilo` INT UNSIGNED NOT NULL,
  `idNaloga` INT UNSIGNED NOT NULL,
  `idLokacija` INT UNSIGNED NOT NULL,
  `ime` VARCHAR(45) NOT NULL,
  `priimek` VARCHAR(45) NOT NULL,
  `starost` INT NOT NULL,
  PRIMARY KEY (`idRoparji`),
  INDEX `fk_idNaloge_Roparji_idx` (`idNaloga` ASC) VISIBLE,
  INDEX `fk_idVozilo_Roparji_idx` (`idVozilo` ASC) VISIBLE,
  INDEX `fk_idLokacije_Roparji_idx` (`idLokacija` ASC) VISIBLE,
  CONSTRAINT `fk_idNaloge_Roparji`
    FOREIGN KEY (`idNaloga`)
    REFERENCES `er_vaje`.`Naloge` (`idNaloge`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idVozilo_Roparji`
    FOREIGN KEY (`idVozilo`)
    REFERENCES `er_vaje`.`Vozila` (`idVozila`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idLokacije_Roparji`
    FOREIGN KEY (`idLokacija`)
    REFERENCES `er_vaje`.`Lokacije` (`idLokacije`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- -----------------------------------------------------
-- Table `er_vaje`.`Orodja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `er_vaje`.`Orodja` (
  `idOrodja` INT UNSIGNED NOT NULL,
  `idRoparji` INT UNSIGNED NOT NULL,
  `imeOrodja` VARCHAR(45) NULL,
  `steviloOrodja` INT UNSIGNED NULL,
  PRIMARY KEY (`idOrodja`),
  INDEX `fk_idRoparji_Orodja_idx` (`idRoparji` ASC) VISIBLE,
  CONSTRAINT `fk_idRoparji_Orodja`
    FOREIGN KEY (`idRoparji`)
    REFERENCES `er_vaje`.`Roparji` (`idRoparji`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- -----------------------------------------------------
-- Table `er_vaje`.`Orozja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `er_vaje`.`Orozja` (
  `idOrozja` INT UNSIGNED NOT NULL,
  `idRoparji` INT UNSIGNED NOT NULL,
  `imeOrodja` VARCHAR(45) NULL,
  `steviloOrozja` INT UNSIGNED NULL,
  PRIMARY KEY (`idOrozja`),
  INDEX `fk_idRoparji_Orodja_idx` (`idRoparji` ASC) VISIBLE,
  CONSTRAINT `fk_idRoparji_Orodja`
    FOREIGN KEY (`idRoparji`)
    REFERENCES `er_vaje`.`Roparji` (`idRoparji`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)