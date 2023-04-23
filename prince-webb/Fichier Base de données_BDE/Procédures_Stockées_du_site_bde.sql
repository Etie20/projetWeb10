-- Les Procedures Stockées des tables dans la Gestion du Bde



-- procédure stockée pour récupèrer le mail de tous les utilisateurs de la table utilisateur

DROP PROCEDURE IF EXISTS get_user_emails ;

DELIMITER //                                         -- Détermine un nouveau délimiteur personnalisé pour la requête globale
CREATE PROCEDURE get_user_emails()
BEGIN
  SELECT email FROM utilisateurs;
END //
DELIMITER ;                                            -- rétablir  un nouveau délimiteur par défaut pour la requête globale


-- procédure stockée pour avoir la localisation et la fonction de tous les utilisateurs de la table utilisateur dont le mail correspond avec celui en paramètre

DROP PROCEDURE IF EXISTS get_user_info ;

DELIMITER //                                         -- Détermine un nouveau délimiteur personnalisé pour la requête globale
CREATE PROCEDURE get_user_info(IN _email VARCHAR(50))
BEGIN
  SELECT localisation, fonction FROM utilisateurs WHERE email = _email;
END //
DELIMITER ;                                         -- rétablir  un nouveau délimiteur par défaut pour la requête globale

-- procédure stockée pour récupérer le nom, la description, l'image et la date prévu d'une idée de la table boîte à idée

DROP PROCEDURE IF EXISTS get_info_idee ;

DELIMITER //                                         --- Détermine un nouveau délimiteur personnalisé pour la requête globale
CREATE PROCEDURE get_info_idee()
BEGIN
  SELECT nom_manif, description, image_manif, date_prevu FROM boite_idee WHERE statut_idee = 1;
END //
DELIMITER ;                                          -- rétablir  un nouveau délimiteur par défaut pour la requête globale

-- procédure stockée pour mettre à jour la table manifestation avec les nouvelles valeurs entrées par l'administrateur

DROP PROCEDURE IF EXISTS update_manifestation;

DELIMITER //                                         -- rétablir  un nouveau délimiteur personnalisé pour la requête globale
CREATE PROCEDURE update_manifestation(IN manif_id varchar(04), IN new_nom varchar(20), IN new_description varchar(255), IN new_image blob, IN new_date DATE)
BEGIN
  UPDATE manifestation SET nom_manif = new_nom, 
                          description = new_description, 
                          image_manif = new_image, 
                          date_prevu = new_date 
                        
                        WHERE id_manif = manif_id;
END //
DELIMITER ;                                          -- rétablir  un nouveau délimiteur par défaut pour la requête globale

-- procédure stockée pour récupérer des élements de la table photo_évenement

DROP PROCEDURE IF EXISTS get_photo_event ;

DELIMITER //                                        -- Détermine un nouveau délimiteur personnalisé pour la requête globale
CREATE PROCEDURE get_photo_event()
BEGIN
  SELECT photo, description, likes, date_poste FROM photo_evenement;
END //
DELIMITER ;                                        -- rétablir  un nouveau délimiteur par défaut pour la requête globale

-- procédure stockée pour récupérer des élements de la table commentaire

DROP PROCEDURE IF EXISTS get_info_commentaire ;

DELIMITER //                                        -- Détermine un nouveau délimiteur personnalisé pour la requête globale
CREATE PROCEDURE get_info_commentaire (IN commentaire_id varchar(04))
BEGIN
  SELECT message_com FROM commentaire WHERE id_commentaire = commentaire_id;
END //
DELIMITER ;                                         -- rétablir  un nouveau délimiteur par défaut pour la requête globale

-- procédure stockée pour récupérer des élements de la notification_etudiant

DROP PROCEDURE IF EXISTS get_info_notification_etudiant ;

DELIMITER //                                        -- Détermine un nouveau délimiteur personnalisé pour la requête globale
CREATE PROCEDURE get_info_notification_etudiant (IN etudiant_id varchar(04))
BEGIN
  SELECT message_notif_etudiant FROM notification_etudiant WHERE id_etudiant = etudiant_id;
END //
DELIMITER ;                                         -- rétablir un nouveau délimiteur par défaut pour la requête g

-- procédure stockée pour récupérer des élements de la notification_bde

DROP PROCEDURE IF EXISTS get_info_notification_bde ;

DELIMITER //                                      -- Détermine un nouveau délimiteur personnalisé pour la requête globale
CREATE PROCEDURE get_info_notification_bde (IN salaries_id varchar(04))
BEGIN
  SELECT message_notif_bde, username FROM notification_bde WHERE id_salaries = salariest_id;
END //                                            -- rétablir un nouveau délimiteur par défaut pour la requête globale
DELIMITER ;-- procédure stockée pour récupèrer le mail de tous les utilisateurs de la table utilisateur

DROP PROCEDURE IF EXISTS get_user_emails ;

DELIMITER //                                         -- Détermine un nouveau délimiteur personnalisé pour la requête globale
CREATE PROCEDURE get_user_emails()
BEGIN
  SELECT email FROM utilisateurs;
END //
DELIMITER ;                                            -- rétablir  un nouveau délimiteur par défaut pour la requête globale


-- procédure stockée pour avoir la localisation et la fonction de tous les utilisateurs de la table utilisateur dont le mail correspond avec celui en paramètre

DROP PROCEDURE IF EXISTS get_user_info ;

DELIMITER //                                         -- Détermine un nouveau délimiteur personnalisé pour la requête globale
CREATE PROCEDURE get_user_info(IN _email VARCHAR(50))
BEGIN
  SELECT localisation, fonction FROM utilisateurs WHERE email = _email;
END //
DELIMITER ;                                         -- rétablir  un nouveau délimiteur par défaut pour la requête globale

-- procédure stockée pour récupérer le nom, la description, l'image et la date prévu d'une idée de la table boîte à idée

DROP PROCEDURE IF EXISTS get_info_idee ;

DELIMITER //                                         --- Détermine un nouveau délimiteur personnalisé pour la requête globale
CREATE PROCEDURE get_info_idee()
BEGIN
  SELECT nom_manif, description, image_manif, date_prevu FROM boite_idee WHERE statut_idee = 1;
END //
DELIMITER ;                                          -- rétablir  un nouveau délimiteur par défaut pour la requête globale

-- procédure stockée pour mettre à jour la table manifestation avec les nouvelles valeurs entrées par l'administrateur

DROP PROCEDURE IF EXISTS update_manifestation;

DELIMITER //                                         -- rétablir  un nouveau délimiteur personnalisé pour la requête globale
CREATE PROCEDURE update_manifestation(IN manif_id varchar(04), IN new_nom varchar(20), IN new_description varchar(255), IN new_image blob, IN new_date DATE)
BEGIN
  UPDATE manifestation SET nom_manif = new_nom, 
                          description = new_description, 
                          image_manif = new_image, 
                          date_prevu = new_date 
                        
                        WHERE id_manif = manif_id;
END //
DELIMITER ;                                          -- rétablir  un nouveau délimiteur par défaut pour la requête globale

-- procédure stockée pour récupérer des élements de la table photo_évenement

DROP PROCEDURE IF EXISTS get_photo_event ;

DELIMITER //                                        -- Détermine un nouveau délimiteur personnalisé pour la requête globale
CREATE PROCEDURE get_photo_event()
BEGIN
  SELECT photo, description, likes, date_poste FROM photo_evenement;
END //
DELIMITER ;                                        -- rétablir  un nouveau délimiteur par défaut pour la requête globale

-- procédure stockée pour récupérer des élements de la table commentaire

DROP PROCEDURE IF EXISTS get_info_commentaire ;

DELIMITER //                                        -- Détermine un nouveau délimiteur personnalisé pour la requête globale
CREATE PROCEDURE get_info_commentaire (IN commentaire_id varchar(04))
BEGIN
  SELECT message_com FROM commentaire WHERE id_commentaire = commentaire_id;
END //
DELIMITER ;                                         -- rétablir  un nouveau délimiteur par défaut pour la requête globale

-- procédure stockée pour récupérer des élements de la notification_etudiant

DROP PROCEDURE IF EXISTS get_info_notification_etudiant ;

DELIMITER //                                        -- Détermine un nouveau délimiteur personnalisé pour la requête globale
CREATE PROCEDURE get_info_notification_etudiant (IN etudiant_id varchar(04))
BEGIN
  SELECT message_notif_etudiant FROM notification_etudiant WHERE id_etudiant = etudiant_id;
END //
DELIMITER ;                                         -- rétablir un nouveau délimiteur par défaut pour la requête g

-- procédure stockée pour récupérer des élements de la notification_bde

DROP PROCEDURE IF EXISTS get_info_notification_bde ;

DELIMITER //                                      -- Détermine un nouveau délimiteur personnalisé pour la requête globale
CREATE PROCEDURE get_info_notification_bde (IN salaries_id varchar(04))
BEGIN
  SELECT message_notif_bde, username FROM notification_bde WHERE id_salaries = salariest_id;
END //                                            -- rétablir un nouveau délimiteur par défaut pour la requête globale
DELIMITER ;




---------------------------------------------------------------------------------------------------------------------------------------------------



-- La Procedure Stockée de la table inscrip_etudiant

DELIMITER //

CREATE PROCEDURE `affiche_etudiant` ()
BEGIN
    SELECT id_etudiant, username, REPEAT('*', LENGTH(password)) AS password 
    FROM inscrip_etudiant LIMIT 0, 25;
END //

DELIMITER ;



-- Les Procedures Stockées des tables dans la Boutique du Bde

-- La Procedure Stockée de la table produit

DELIMITER //

CREATE PROCEDURE `affiche_produit` ()
BEGIN
    SELECT `nom_produit`, `description`, `image_produit`, `prix_unitaire`
    FROM `produit`;
END //

DELIMITER ;


-- LLa Procedure Stockée de la table panier

DELIMITER //

CREATE PROCEDURE `affiche_panier` ()
BEGIN
    SELECT `id_panier`, `id_produit`, `quantite`, `prix_multiplier`
    FROM `panier`;
END //

DELIMITER ;


-- La Procedure Stockée de la table commande

DELIMITER //

CREATE PROCEDURE `affiche_commande` (IN id_etudiant VARCHAR(04))
BEGIN
    SELECT `id_commande`, `date_commande`, `prix_total`
    FROM `commande`
    WHERE `id_etudiant` = id_etudiant;
END //

DELIMITER ;