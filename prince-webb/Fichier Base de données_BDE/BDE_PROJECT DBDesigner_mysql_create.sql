CREATE TABLE `utilisateurs` ( 
	`id_utilisateur` varchar(04), 
	`nom` varchar(50) NOT NULL, 
	`prenom` varchar(50) NOT NULL, 
	`fonction` ENUM('etudiant', 'salaries') NOT NULL, 
	`email` VARCHAR(50) NOT NULL UNIQUE CHECK (email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'), 
	`localisation` ENUM('Douala', 'Kinshasa','Pointe-noire','Yaounde') NOT NULL, 
	PRIMARY KEY (`id_utilisateur`) 
);

-- CREATE TABLE `administrateur_iui` (
-- 	`id_admin` varchar(07) NOT NULL,
-- 	`username` varchar(50) NOT NULL UNIQUE,
-- 	`password` varchar(12) NOT NULL,
-- 	PRIMARY KEY (`id_admin`)
-- );

CREATE TABLE `inscrip_etudiant` (
	`id_etudiant` varchar(04),
	`email` VARCHAR(50) NOT NULL UNIQUE CHECK (email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'),
	`username` varchar(50) NOT NULL UNIQUE,
	`password` varchar(255) NOT NULL, 
	PRIMARY KEY (`id_etudiant`)
);

CREATE TABLE `membre_bde` (
	`id_mem_bde` varchar(04),
	`email` VARCHAR(50) NOT NULL UNIQUE CHECK (email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'),
	`username` varchar(50) NOT NULL UNIQUE,
	`password` varchar(12) NOT NULL,
	PRIMARY KEY (`id_mem_bde`)
);

CREATE TABLE `inscrip_salaries` (
	`id_salaries` varchar(04) ,
	`email` VARCHAR(50) NOT NULL UNIQUE CHECK (email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'),
	`username` varchar(50) NOT NULL UNIQUE,
	`password` varchar(12) NOT NULL,
	PRIMARY KEY (`id_salaries`)
);

CREATE TABLE `manifestation` (
	`id_manif` varchar(04),
	`nom_manif` varchar(20) NOT NULL,
	`description` VARCHAR(255) NOT NULL,
	`image_manif` blob NOT NULL,
	`date_prevu` DATE NOT NULL,
	`signaler` BOOLEAN NOT NULL DEFAULT TRUE,
	PRIMARY KEY (`id_manif`)
);

CREATE TABLE `incrit_manifestation` (
	`id_etudiant` varchar(04) NOT NULL,
	`id_manif` varchar(04) NOT NULL
);

CREATE TABLE `boite_idee` (
	`id_idee` varchar(04),
	`id_etudiant` varchar(04) NOT NULL,
	`nom_manif` varchar(20) NOT NULL,
	`description` VARCHAR(255) NOT NULL,
	`image_manif` blob NOT NULL,
	`vote` BOOLEAN NOT NULL DEFAULT FALSE,
	`date_prevu` DATE NOT NULL,
	`statut_idee` BOOLEAN NOT NULL DEFAULT FALSE,
	PRIMARY KEY (`id_idee`)
);

CREATE TABLE `notification_bde` (
	`id_notification_bde` varchar(04),
	`id_salaries` varchar(04) NOT NULL,
	`message_notif_bde` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id_notification_bde`)
);

CREATE TABLE `notification_etudiant` (
	`id_notification_etudiant` varchar(04),
	`id_etudiant` varchar(04) NOT NULL,
	`message_notif_etudiant` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id_notification_etudiant`)
);

CREATE TABLE `photo_evenement` (
	`id_photo` varchar(04),
	`id_etudiant` varchar(04) NOT NULL,
	`id_manif` varchar(04) NOT NULL,
	`photo` blob NOT NULL,
	`description` VARCHAR(255) NOT NULL,
	`likes` BOOLEAN NOT NULL DEFAULT FALSE,
	`date_poste` DATE NOT NULL,
	`signaler` BOOLEAN NOT NULL DEFAULT TRUE,
	PRIMARY KEY (`id_photo`)
);

CREATE TABLE `commentaire` (
	`id_commentaire` varchar(04),
	`id_photo` varchar(04) NOT NULL,
	`message_com` VARCHAR(255) NOT NULL,
	`signaler` BOOLEAN NOT NULL DEFAULT TRUE,
	PRIMARY KEY (`id_commentaire`)
);

CREATE TABLE `commande` (
	`id_commande` varchar(04),
	`id_panier` varchar(04) NOT NULL,
	`id_etudiant` varchar(04) NOT NULL,
	`prix_total` FLOAT NOT NULL,
	`date_commande` DATE NOT NULL,
	PRIMARY KEY (`id_commande`)
);

CREATE TABLE `panier` (
	`id_panier` varchar(04) NOT NULL ,
	`id_produit` varchar(04) NOT NULL,
	`id_etudiant` varchar(04) NOT NULL,
	`quantite` FLOAT(07) NOT NULL,
	`prix_multiplier` FLOAT NOT NULL
);

CREATE TABLE `id_panier` (
	`id_panier` varchar(04),
	PRIMARY KEY (`id_panier`)
);

CREATE TABLE `categorie` (
	`id_categorie` varchar(04),
	`categorie` varchar(20) NOT NULL,
	PRIMARY KEY (`id_categorie`)
);

CREATE TABLE `produit` (
	`id_produit` varchar(04),
	`id_categorie` varchar(04) NOT NULL,
	`nom_produit` varchar(20) NOT NULL,
	`description` VARCHAR(255) NOT NULL,
	`image_produit` blob NOT NULL,
	`prix_unitaire` FLOAT NOT NULL,
	PRIMARY KEY (`id_produit`)
);


ALTER TABLE `incrit_manifestation` ADD CONSTRAINT `incrit_manifestation_fk0` FOREIGN KEY (`id_etudiant`) REFERENCES `inscrip_etudiant`(`id_etudiant`);

ALTER TABLE `incrit_manifestation` ADD CONSTRAINT `incrit_manifestation_fk1` FOREIGN KEY (`id_manif`) REFERENCES `manifestation`(`id_manif`);

ALTER TABLE `boite_idee` ADD CONSTRAINT `boite_idee_fk0` FOREIGN KEY (`id_etudiant`) REFERENCES `inscrip_etudiant`(`id_etudiant`);

ALTER TABLE `notification_bde` ADD CONSTRAINT `notification_bde_fk0` FOREIGN KEY (`id_salaries`) REFERENCES `inscrip_salaries`(`id_salaries`);

ALTER TABLE `notification_etudiant` ADD CONSTRAINT `notification_etudiant_fk0` FOREIGN KEY (`id_etudiant`) REFERENCES `inscrip_etudiant`(`id_etudiant`);

ALTER TABLE `photo_evenement` ADD CONSTRAINT `photo_evenement_fk0` FOREIGN KEY (`id_etudiant`) REFERENCES `inscrip_etudiant`(`id_etudiant`);

ALTER TABLE `photo_evenement` ADD CONSTRAINT `photo_evenement_fk1` FOREIGN KEY (`id_manif`) REFERENCES `manifestation`(`id_manif`);

ALTER TABLE `commentaire` ADD CONSTRAINT `commentaire_fk0` FOREIGN KEY (`id_photo`) REFERENCES `photo_evenement`(`id_photo`);

ALTER TABLE `commande` ADD CONSTRAINT `commande_fk0` FOREIGN KEY (`id_panier`) REFERENCES `panier`(`id_panier`);

ALTER TABLE `commande` ADD CONSTRAINT `commande_fk1` FOREIGN KEY (`id_etudiant`) REFERENCES `inscrip_etudiant`(`id_etudiant`);

ALTER TABLE `panier` ADD CONSTRAINT `panier_fk0` FOREIGN KEY (`id_panier`) REFERENCES `id_panier`(`id_panier`);

ALTER TABLE `panier` ADD CONSTRAINT `panier_fk1` FOREIGN KEY (`id_produit`) REFERENCES `produit`(`id_produit`);

ALTER TABLE `panier` ADD CONSTRAINT `panier_fk2` FOREIGN KEY (`id_etudiant`) REFERENCES `inscrip_etudiant`(`id_etudiant`);

ALTER TABLE `produit` ADD CONSTRAINT `produit_fk0` FOREIGN KEY (`id_categorie`) REFERENCES `categorie`(`id_categorie`);

















