-- Insertion valide et invalide de la table utilisateurs


-------------------------------------Bdd UCAC-ICAM--------------------------------------------------------------------------------

-- la table utilisateurs (valide)
INSERT INTO `utilisateurs` (`id_utilisateur`, `nom`, `prenom`, `fonction`, `email`, `localisation`) 
VALUES ('U001', 'Bokandjo', 'Prince', 'etudiant', 'prince.bokandjo@promo.ucac-icam.com', 'Douala'),
       ('U002', 'Ngako', 'Franck', 'salaries', 'franck.ngako@worker.ucac-icam.com', 'Kinshasa'),
       ('U003', 'Kamdem', 'Leonard', 'etudiant', 'leonard.kamdem@promo.ucac-icam.com', 'Pointe-noire'),
       ('U004', 'Kouam', 'Hervé', 'salaries', 'hervé.kouam@worker.ucac-icam.com', 'Yaounde'),
       ('U005', 'Foyang', 'Etienne', 'etudiant', 'etienne.foyang@promo.ucac-icam.com', 'Yaounde');




-- la table utilisateurs (invalide)
INSERT INTO `utilisateurs` (`id_utilisateur`, `nom`, `prenom`, `fonction`, `email`, `localisation`) 
VALUES ('U006', 'Tchana', 'Jordan', 'salaries', 'jordan.tchana@worker.com', ''),
       ('U007', 'Tamba', 'Samuel', 'etudiant', 'samuel.tamba_promo.com', 'Douala'),
       ('U0001', 'Gohui', 'Landry', 'etudiant', 'landry.gohui@promo.com', 'Pointe-noire'),
       ('U008', 'Tchagoue', 'Passi', 'etudiant', 'passi.tchagoue@promo.com', 'Paris'),
       ('U009', 'Keng', 'Zed', 'salaries', '', 'Yaounde');


-- Insertion valide des tables BDE


-------------------------------------Bdd BDE -------------------------------------------------------------------------------------

-- la table membre_bde
INSERT INTO membre_bde (id_mem_bde, email, username, password)
VALUES ('BDE0', 'xxxx.xxxx@example.com', 'xxxxxx', 'xxxxxxx');

-- la table inscrip_salaries
INSERT INTO inscrip_salaries (id_salaries, email, username, password)
VALUES ('S000', 'xxxx.xxxx@example.com', 'xxxxxx', 'xxxxxxx');

-- la table inscrip_etudiant
INSERT INTO inscrip_etudiant (id_etudiant, email, username, password)
VALUES ('E000', 'xxxx.xxxx@example.com', 'xxxxxx', 'xxxxxxx');

-- la table token
INSERT INTO token (id_token, id_user, token, expires_at, created_at, updated_at, fonction)
VALUES ('T000', 'xxxx', 'xxxxxxxx', '2023-06-30 23:59:59', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'xxxxxxxx');

-- la table manifestation
INSERT INTO manifestation (id_manif, nom_manif, description, image_manif, date_prevu, signaler)
VALUES ('M000', 'xxxxxxxxx', 'xxxxxxxx', LOAD_FILE('/chemin/vers/image.jpg'), 'xxxxxxx',  FALSE);

-- la table boite_idee
INSERT INTO boite_idee (id_idee, id_etudiant, nom_manif, description, image_manif, vote, date_prevu, statut_idee)
VALUES ('I000', 'xxxx', 'xxxxxxxx', 'xxxxxxxx',LOAD_FILE('/chemin/vers/image.jpg'), FALSE ,'xxxxxxxx', FALSE);

-- la table notification_bde
INSERT INTO notification_bde (id_notification_bde, id_salaries ,message_notif_bde)
VALUES ('NB00', 'xxxx' ,'xxxxxxxxx');

-- la table notification_etudiant
INSERT INTO notification_etudiant (id_notification_etudiant, id_etudiant ,message_notif_etudiant)
VALUES ('NE00', 'xxxx' ,'xxxxxxxxx');

-- la table photo_evenement
INSERT INTO photo_evenement (id_photo, id_etudiant, id_manif, photo, description, likes, date_poste, signaler) 
VALUES ('PH00', 'xxxx', 'xxxx',  LOAD_FILE('/chemin/vers/image.jpg'), 'xxxxxxx', FALSE ,'xxxxxxxxx',TRUE);

-- la table commentaire
INSERT INTO commentaire (id_commentaire, id_photo, message_com, signaler)
VALUES ('CM00', 'xxxx', 'xxxxxxxx',TRUE);

-- la table commande
INSERT INTO commande (id_commande, id_panier, id_etudiant, prix_total, date_commande)
VALUES ('C000', 'xxxx', 'xxxx', '00000', 'xxxxxxx');

-- la table  panier
INSERT INTO panier (id_panier, id_produit, id_etudiant, quantite, prix_multiplier)
VALUES ('PA00', 'xxxx', 'xxxx', '0000', '0000');

-- la table produit
INSERT INTO produit (id_produit, id_categorie, nom_produit, description, image_produit, prix_unitaire)
VALUES ('P000', 'xxxx', 'xxxxxxxx','xxxxxxxx', LOAD_FILE('/chemin/vers/image.jpg') , '00000');

