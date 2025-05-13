/*
Izdelajte preprost(-e) sprožilec(-ce), ki preveri(-jo) 
nepravilne vnose v tabele za ljubljanski maraton.
Preverite lahko ali so letnice tekmovalcev ustrezne
*/

DELIMITER //

CREATE TRIGGER prevent_age_error_maraton
BEFORE INSERT ON tekac
FOR EACH ROW
BEGIN
    IF  YEAR(NOW()) - YEAR(NEW.datum_rojstva) < 20 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Starost ne udelezenca mora biti vsaj 20 let!’;
    END IF;
END 
//
DELIMITER ;
