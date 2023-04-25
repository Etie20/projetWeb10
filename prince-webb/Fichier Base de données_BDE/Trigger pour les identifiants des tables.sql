-- Trigger pour les identifiants de la table utilisateurs

-- DELIMITER $$
-- CREATE TRIGGER update_id_trigger_utilisateurs
-- BEFORE INSERT ON utilisateurs
-- FOR EACH ROW
-- BEGIN
-- SET NEW.id_utilisateur = CONCAT('U', LPAD((SUBSTR((SELECT MAX(id_utilisateur) FROM utilisateurs), 2) + 1), 3, '0'));
-- END$$
-- DELIMITER ;



-- Trigger pour les identifiants de la table membre_bde

DELIMITER $$
CREATE TRIGGER update_id_trigger_membre_bde
BEFORE INSERT ON membre_bde
FOR EACH ROW
BEGIN
SET NEW.id_mem_bde = CONCAT('BDE', LPAD((SUBSTR((SELECT MAX(id_mem_bde) FROM membre_bde), 2) + 1), 3, '0'));
END$$
DELIMITER ;

-- Trigger pour les identifiants de la table inscrip_salaries

DELIMITER $$
CREATE TRIGGER update_id_trigger_inscrip_salaries
BEFORE INSERT ON inscrip_salaries
FOR EACH ROW
BEGIN
SET NEW.id_salaries = CONCAT('S', LPAD((SUBSTR((SELECT MAX(id_salaries) FROM inscrip_salaries), 2) + 1), 3, '0'));
END$$
DELIMITER ;

-- Trigger pour les identifiants de la table inscrip_etudiant

DELIMITER $$
CREATE TRIGGER update_id_trigger_inscrip_etudiant
BEFORE INSERT ON inscrip_etudiant
FOR EACH ROW
BEGIN
SET NEW.id_etudiant = CONCAT('E', LPAD((SUBSTR((SELECT MAX(id_etudiant) FROM inscrip_etudiant), 2) + 1), 3, '0'));
END$$
DELIMITER ;

-- Trigger pour les identifiants de la table token

DELIMITER $$
CREATE TRIGGER update_id_trigger_token
BEFORE INSERT ON token
FOR EACH ROW
BEGIN
SET NEW.id_token = CONCAT('T', LPAD((SUBSTR((SELECT MAX(id_token) FROM token), 2) + 1), 3, '0'));
END$$
DELIMITER ;

-- Trigger pour la mise a jour de l'horodatage de la table token (((FACULTATIF //parceque la clause "ON UPDATE CURRENT_TIMESTAMP," qui est dans le fichier creation de la table token joue le meme role que ce trigger)))


-- CREATE TRIGGER maj_on_time
-- BEFORE UPDATE ON token
-- FOR EACH ROW
-- SET NEW.updated_at = CURRENT_TIMESTAMP;


-- Trigger pour les identifiants de la table manifestation

DELIMITER $$
CREATE TRIGGER update_id_trigger_manifestation
BEFORE INSERT ON manifestation
FOR EACH ROW
BEGIN
SET NEW.id_manif = CONCAT('M', LPAD((SUBSTR((SELECT MAX(id_manif) FROM manifestation), 2) + 1), 3, '0'));
END$$
DELIMITER ;

-- Trigger pour les identifiants de la table boite_idee

DELIMITER $$
CREATE TRIGGER update_id_trigger_boite_idee
BEFORE INSERT ON boite_idee
FOR EACH ROW
BEGIN
SET NEW.id_idee = CONCAT('I', LPAD((SUBSTR((SELECT MAX(id_idee) FROM boite_idee), 2) + 1), 3, '0'));
END$$
DELIMITER ;

-- Trigger pour les identifiants de la table notification_bde

DELIMITER $$
CREATE TRIGGER update_id_trigger_notification_bde
BEFORE INSERT ON notification_bde
FOR EACH ROW
BEGIN
SET NEW.id_notification_bde = CONCAT('NB', LPAD((SUBSTR((SELECT MAX(id_notification_bde) FROM notification_bde), 2) + 1), 3, '0'));
END$$
DELIMITER ;

-- Trigger pour les identifiants de la table notification_etudiant

DELIMITER $$
CREATE TRIGGER update_id_trigger_notification_etudiant
BEFORE INSERT ON notification_etudiant
FOR EACH ROW
BEGIN
SET NEW.id_notification_etudiant = CONCAT('NE', LPAD((SUBSTR((SELECT MAX(id_notification_etudiant) FROM notification_etudiant), 2) + 1), 3, '0'));
END$$
DELIMITER ;

-- Trigger pour les identifiants de la table photo_evenement

DELIMITER $$
CREATE TRIGGER update_id_trigger_photo_evenement
BEFORE INSERT ON photo_evenement
FOR EACH ROW
BEGIN
SET NEW.id_photo = CONCAT('PH', LPAD((SUBSTR((SELECT MAX(id_photo) FROM photo_evenement), 2) + 1), 3, '0'));
END$$
DELIMITER ;

-- Trigger pour les identifiants de la table commentaire

DELIMITER $$
CREATE TRIGGER update_id_trigger_commentaire
BEFORE INSERT ON commentaire
FOR EACH ROW
BEGIN
SET NEW.id_commentaire = CONCAT('CM', LPAD((SUBSTR((SELECT MAX(id_commentaire) FROM commentaire), 2) + 1), 3, '0'));
END$$
DELIMITER ;

-- Trigger pour les identifiants de la table commande

DELIMITER $$
CREATE TRIGGER update_id_trigger_commande
BEFORE INSERT ON commande
FOR EACH ROW
BEGIN
SET NEW.id_commande = CONCAT('C', LPAD((SUBSTR((SELECT MAX(id_commande) FROM commande), 2) + 1), 3, '0'));
END$$
DELIMITER ;

-- Trigger pour les identifiants de la table  panier

DELIMITER $$
CREATE TRIGGER update_id_trigger_panier
BEFORE INSERT ON panier
FOR EACH ROW
BEGIN
SET NEW.id_panier = CONCAT('PA', LPAD((SUBSTR((SELECT MAX(id_panier) FROM id_panier), 2) + 1), 3, '0'));
END$$
DELIMITER ;

-- Trigger pour les identifiants de la table produit

DELIMITER $$
CREATE TRIGGER update_id_trigger_produit
BEFORE INSERT ON produit
FOR EACH ROW
BEGIN
SET NEW.id_produit = CONCAT('P', LPAD((SUBSTR((SELECT MAX(id_produit) FROM produit), 2) + 1), 3, '0'));
END$$
DELIMITER ;