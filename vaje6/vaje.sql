-- Izdelajte ER diagram za preprosto socialno omrežje. Poudarek naj bo na podatkih 'prijateljstva'. Izdelajte tabelo uporabniki in implementirajte povezave s katerimi bo možno ugotoviti kateri uporabniki so med seboj prijatelji. Upoštevajte, da so prijateljstva obojestranska.


-- Dopolnite zgornji ER model tako, da si bosta dva uporabnika lahko izmenjevala sporočila. Vsa sporočila se seveda hranijo v tabeli skupaj z datumom in časom izdelave sporočila.


-- Izdelajte vse tabele ter v vsako zapišite po nekaj podatkov.

-- -----------------------------------------------------
-- Table `mydb`.`Uporabniki`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Uporabniki` (
  `idUporabniki` INT UNSIGNED NOT NULL,
  `ime` VARCHAR(45) NOT NULL,
  `priimek` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUporabniki`))


-- -----------------------------------------------------
-- Table `mydb`.`Sporocilo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sporocilo` (
  `idSporočilo` INT UNSIGNED NOT NULL,
  `idUporabnik` INT UNSIGNED NOT NULL,
  `idPrejemnik` INT UNSIGNED NOT NULL,
  `datum` DATETIME NOT NULL,
  `vsebina` LONGTEXT NOT NULL,
  PRIMARY KEY (`idSporočilo`),
  INDEX `fk_idUporabnik_Sporocilo_idx` (`idUporabnik` ASC) VISIBLE,
  INDEX `fk_idPrejemnik_Sporocilo_idx` (`idPrejemnik` ASC) VISIBLE,
  CONSTRAINT `fk_idUporabnik_Sporocilo`
    FOREIGN KEY (`idUporabnik`)
    REFERENCES `mydb`.`Uporabniki` (`idUporabniki`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idPrejemnik_Sporocilo`
    FOREIGN KEY (`idPrejemnik`)
    REFERENCES `mydb`.`Uporabniki` (`idUporabniki`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

-- -----------------------------------------------------
-- Table `mydb`.`Prijateljstvo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Prijateljstvo` (
  `idPrvegaUporabnika` INT UNSIGNED NOT NULL,
  `idDrugegaUporabnika` INT UNSIGNED NOT NULL,
  `datumPrijateljstva` DATETIME NOT NULL,
  INDEX `fk_idPrvegaUporabnika_Prijateljstvo_idx` (`idPrvegaUporabnika` ASC) VISIBLE,
  INDEX `fk_idDrugegaUporabnika_Prijateljstvo_idx` (`idDrugegaUporabnika` ASC) INVISIBLE,
  PRIMARY KEY (`idPrvegaUporabnika`, `idDrugegaUporabnika`),
  CONSTRAINT `fk_idPrvegaUporabnika_Prijateljstvo`
    FOREIGN KEY (`idPrvegaUporabnika`)
    REFERENCES `mydb`.`Uporabniki` (`idUporabniki`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idDrugegaUporabnika_Prijateljstvo`
    FOREIGN KEY (`idDrugegaUporabnika`)
    REFERENCES `mydb`.`Uporabniki` (`idUporabniki`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


INSERT INTO Uporabniki VALUES
  (1,'Ana','Novak'),
  (2,'Boris', 'Kranjc'),
  (3,'Cvetka','Zupan'),
  (4,'David','Petrič'),
  (5,'Eva', 'Kraner');
  
INSERT INTO Prijateljstvo VALUES
(1, 2, '2025-01-15 10:00:00'),
  (1, 3, '2025-02-20 14:45:00'),
  (2, 3, '2025-03-05 09:30:00'),
  (2, 4, '2025-04-10 16:15:00'),
  (3, 5, '2025-05-01 12:00:00');
  
INSERT INTO Sporocilo VALUES
 (1,1,2,'2025-05-10 08:15:00', 'Živjo Boris, kako si?'),
  (2,2,1,'2025-05-10 08:17:00', 'Živjo Ana, v redu sem, hvala!'),
  (3,3,1,'2025-05-11 09:00:00', 'Ana, lahko mi pomagaš pri projektu?'),
  (4,1,3,'2025-05-11 09:05:00', 'Seveda, Cvetka. Kje se dobiva?'),
  (5,4,2,'2025-05-12 14:30:00', 'Boris, kje je poročilo?'),
  (6,2,4,'2025-05-12 14:45:00', 'David, sem ti ga poslal po emailu.'),
  (7,5,3,'2025-05-13 11:00:00', 'Cvetka, se dobiva na kavi?'),
  (8,3,5,'2025-05-13 11:10:00', 'Seveda, Eva!');

  -- Zapišite poizvedbo, ki bo izpisala vse prijatelje "Tega in Tega" uporabnika.



-- Zapišite poizvedbe s katerimi lahko poiščete in izpišete vsa sporočila, ki jih je poslal "Ta in Ta".