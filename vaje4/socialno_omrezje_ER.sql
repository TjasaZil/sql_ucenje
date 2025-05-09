-- VAJA
/* Izdelajmo ER model preprostega socialnega omrežja. 
 Uporabnik lahko objavi poljubno število objav. 
 K vsaki objavi lahko uporabniki dodajajo svoje komentarje. 
 Tako pri komentarjih kot objavah nas zanima tudi koliko všečkov ima 
 dana objava/komentar.
 V vsakem primeru želimo vedeti katere objave je 
objavil kateri uporabnik in kateri komentarji so bili namenjeni 
kateri objavi, ter seveda, kdo jih je objavil. Zelo pomembno je tudi, 
da so vse objave kronološko razporejene in da v vsakem trenutku lahko 
ugotovimo kdaj sta bila objava ali komentar objavljena. */


-- BRAINSTORMING - KAJ HOČEM IMETI V ER
/*uporabnik:
uporabnik id (PK)
ime
priimek
username
mail
datum registracije

objava:
objava id (PK)
uporabnik id (FK uporabnik)
vsebina objave
datum in čas objave

komentar:
komentar id (PK)
objava id (FK objava)
uporabnik id (FK uporabnik)
vsebina komentarja
datum in čas komentarja

vsecek objava:
uporabnik id (FK uporabnik)
objava id (Fk objava)

vsecek komentar:
uporabnik id (FK uporabnik)
komentar id (FK komentar) */

-- -----------------------------------------------------
-- Table `er_vaje`.`Uporabniki`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `er_vaje`.`Uporabniki` (
  `idUporabniki` INT UNSIGNED NOT NULL,
  `ime` VARCHAR(45) NOT NULL,
  `priimek` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `datumRegistracije` DATE NOT NULL,
  PRIMARY KEY (`idUporabniki`))


-- -----------------------------------------------------
-- Table `er_vaje`.`Objave`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `er_vaje`.`Objave` (
  `idObjave` INT UNSIGNED NOT NULL,
  `idUporabniki` INT UNSIGNED NOT NULL,
  `vsebinaObjave` LONGTEXT NOT NULL,
  `datumObjave` DATETIME NULL,
  PRIMARY KEY (`idObjave`),
  INDEX `fk_idUporabniki_Objave_idx` (`idUporabniki` ASC) VISIBLE,
  CONSTRAINT `fk_idUporabniki_Objave`
    FOREIGN KEY (`idUporabniki`)
    REFERENCES `er_vaje`.`Uporabniki` (`idUporabniki`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- -----------------------------------------------------
-- Table `er_vaje`.`Komentarji`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `er_vaje`.`Komentarji` (
  `idKomentarji` INT UNSIGNED NOT NULL,
  `idUporabniki` INT UNSIGNED NOT NULL,
  `idObjave` INT UNSIGNED NOT NULL,
  `vsebinaKomentarja` LONGTEXT NOT NULL,
  `datumKomentarja` DATETIME NOT NULL,
  PRIMARY KEY (`idKomentarji`),
  INDEX `fk_idUporabniki_Komentarji_idx` (`idUporabniki` ASC) VISIBLE,
  INDEX `fk_idObjave_Komentarji_idx` (`idObjave` ASC) VISIBLE,
  CONSTRAINT `fk_idUporabniki_Komentarji`
    FOREIGN KEY (`idUporabniki`)
    REFERENCES `er_vaje`.`Uporabniki` (`idUporabniki`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idObjave_Komentarji`
    FOREIGN KEY (`idObjave`)
    REFERENCES `er_vaje`.`Objave` (`idObjave`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- -----------------------------------------------------
-- Table `er_vaje`.`VseckiObjave`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `er_vaje`.`VseckiObjave` (
  `idObjave` INT UNSIGNED NOT NULL,
  `idUporabniki` INT UNSIGNED NOT NULL,
  `datumVseckaObjave` DATETIME NOT NULL,
  INDEX `fk_idObjave_vseckiObjave_idx` (`idObjave` ASC) VISIBLE,
  INDEX `fk_idUporabnika_vseckiObjave_idx` (`idUporabniki` ASC) VISIBLE,
  CONSTRAINT `fk_idObjave_vseckiObjave`
    FOREIGN KEY (`idObjave`)
    REFERENCES `er_vaje`.`Objave` (`idObjave`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idUporabnika_vseckiObjave`
    FOREIGN KEY (`idUporabniki`)
    REFERENCES `er_vaje`.`Uporabniki` (`idUporabniki`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- -----------------------------------------------------
-- Table `er_vaje`.`VseckiKomentarji`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `er_vaje`.`VseckiKomentarji` (
  `idKomentarji` INT UNSIGNED NOT NULL,
  `idUporabniki` INT UNSIGNED NOT NULL,
  `datumVseckaKomentarja` DATETIME NOT NULL,
  INDEX `fk_idUporabnika_vseckiObjave_idx` (`idUporabniki` ASC) VISIBLE,
  INDEX `fk_idKomentarji_vseckiKomentarji_idx` (`idKomentarji` ASC) VISIBLE,
  CONSTRAINT `fk_idUporabnika_vseckiKomentarja`
    FOREIGN KEY (`idUporabniki`)
    REFERENCES `er_vaje`.`Uporabniki` (`idUporabniki`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idKomentarji_vseckiKomentarji`
    FOREIGN KEY (`idKomentarji`)
    REFERENCES `er_vaje`.`Komentarji` (`idKomentarji`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)