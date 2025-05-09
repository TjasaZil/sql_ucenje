-- VAJA
/*
Izdelajte ER model za anketiranje. Anketa naj ima začetni in končni čas (to sta datuma, ko je anketa odprta). Vsaka anketa naj ima poljubna vprašanja, 
vsako vprašanje pa naj ima vnaprej pripravljene možne odgovore. Uporabnik, ki izpolnjuje anketo bo imel pri vsakem vprašanju n-možnih odgovorov izmed katerih mora izbrati enega.
Pri vsakem vprašanju moramo vedeti kateri so možni odgovori. Z namenom analize rezultatov moramo ugotoviti tudi kako so uporabniki odgovarjali na vprašanja.
Razmislite in implementirajte tako anketiranje, ki se izvaja kot kviz. Pri kvizu imamo na vsako vprašanje tudi znan pravilni odgovor in omogoča anketirancem, 
da takoj dobijo povratno informacijo, če so na vprašanje pravilno odgovorili ali ne.
*/

-- BRAINSTORMING
/*
Ankete
anketa id (PK)
naziv
zacetni datum
koncni datum

Uporabniki
uporabnik id (PK)
ime
priimek
mail

Vprasanja
vprasanje id (PK)
anketa id (FK)
vprasanjeTekst
praviOdgovor id (FK)

Odgovori
odgovor id (PK)
vprasanje id (FK)
uporabnik id (FK)
odgovorTekst
*/

-- -----------------------------------------------------
-- Table `er_vaje`.`Ankete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `er_vaje`.`Ankete` (
  `idAnkete` INT UNSIGNED NOT NULL,
  `naziv` VARCHAR(255) NOT NULL,
  `zacetniDatum` DATETIME NOT NULL,
  `koncniDatum` DATETIME NOT NULL,
  PRIMARY KEY (`idAnkete`))


-- -----------------------------------------------------
-- Table `er_vaje`.`Uporabniki`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `er_vaje`.`Uporabniki` (
  `idUporabniki` INT UNSIGNED NOT NULL,
  `ime` VARCHAR(45) NOT NULL,
  `priimek` VARCHAR(45) NOT NULL,
  `mail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUporabniki`))


-- -----------------------------------------------------
-- Table `er_vaje`.`Vprasanja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `er_vaje`.`Vprasanja` (
  `idVprasanja` INT UNSIGNED NOT NULL,
  `idAnkete` INT UNSIGNED NOT NULL,
  `vprasanjeTekst` LONGTEXT NOT NULL,
  PRIMARY KEY (`idVprasanja`),
  INDEX `fk_idAnkete_vprasanja_idx` (`idAnkete` ASC) VISIBLE,
  CONSTRAINT `fk_idAnkete_vprasanja`
    FOREIGN KEY (`idAnkete`)
    REFERENCES `er_vaje`.`Ankete` (`idAnkete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- -----------------------------------------------------
-- Table `er_vaje`.`Odgovori`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `er_vaje`.`Odgovori` (
  `idOdgovori` INT UNSIGNED NOT NULL,
  `idVprasanja` INT UNSIGNED NOT NULL,
  `idUporabnik` INT UNSIGNED NOT NULL,
  `odgovoriTekst` LONGTEXT NOT NULL,
  PRIMARY KEY (`idOdgovori`),
  INDEX `fk_idUporabniki_Odgovori_idx` (`idUporabnik` ASC) VISIBLE,
  CONSTRAINT `fk_idVprasanja_Odgovori`
    FOREIGN KEY (`idOdgovori`)
    REFERENCES `er_vaje`.`Vprasanja` (`idVprasanja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idUporabniki_Odgovori`
    FOREIGN KEY (`idUporabnik`)
    REFERENCES `er_vaje`.`Uporabniki` (`idUporabniki`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
