SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- ============================================================
-- Base  : reservation_hotel
-- ============================================================

-- ------------------------------------------------------------
-- Table : hotels
-- ------------------------------------------------------------
DROP TABLE IF EXISTS hotels;
CREATE TABLE hotels (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  libelle VARCHAR(50) NOT NULL COMMENT 'unique',
  etoile VARCHAR(5) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_hotels_libelle (libelle)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ------------------------------------------------------------
-- Table : salles_de_bain
-- ------------------------------------------------------------
DROP TABLE IF EXISTS salles_de_bain;
CREATE TABLE salles_de_bain (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nom VARCHAR(50) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_sdb_nom (nom)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ------------------------------------------------------------
-- Table : couchages
-- ------------------------------------------------------------
DROP TABLE IF EXISTS couchages;
CREATE TABLE couchages (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nom VARCHAR(20) NOT NULL,
  nb_places TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_couchages_nom (nom)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ------------------------------------------------------------
-- Table : chambre_types
-- ------------------------------------------------------------
DROP TABLE IF EXISTS chambre_types;
CREATE TABLE chambre_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nom VARCHAR(50) NOT NULL,
  description VARCHAR(80) NOT NULL,
  id_salle_de_bain INT UNSIGNED NOT NULL,          
  PRIMARY KEY (id),
  KEY idx_ct_sdb (id_salle_de_bain),
  CONSTRAINT fk_ct_sdb
    FOREIGN KEY (id_salle_de_bain)
    REFERENCES salles_de_bain (id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ------------------------------------------------------------
-- Table : chambres
-- ------------------------------------------------------------
DROP TABLE IF EXISTS chambres;
CREATE TABLE chambres (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_hotel INT UNSIGNED NOT NULL,
  id_type INT UNSIGNED NOT NULL,
  numero VARCHAR(6) NOT NULL,
  commentaire TEXT DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_chambres_hotel_num (id_hotel, numero),
  KEY idx_chambres_type (id_type),
  CONSTRAINT fk_chambres_hotel
    FOREIGN KEY (id_hotel)
    REFERENCES hotels (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_chambres_type
    FOREIGN KEY (id_type)
    REFERENCES chambre_types (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ------------------------------------------------------------
-- Table : chambre_type_couchage (PK composite)
-- ------------------------------------------------------------
DROP TABLE IF EXISTS chambre_type_couchage;
CREATE TABLE chambre_type_couchage (
  id_type INT UNSIGNED NOT NULL,             
  id_couchage INT UNSIGNED NOT NULL,               
  qte TINYINT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (id_type, id_couchage),
  KEY idx_ctc_couchage (id_couchage),
  CONSTRAINT fk_ctc_type
    FOREIGN KEY (id_type)
    REFERENCES chambre_types (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_ctc_couchage
    FOREIGN KEY (id_couchage)
    REFERENCES couchages (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ------------------------------------------------------------
-- Table : tarifs
-- ------------------------------------------------------------
DROP TABLE IF EXISTS tarifs;
CREATE TABLE tarifs (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_hotel INT UNSIGNED DEFAULT NULL,                 
  id_type INT UNSIGNED DEFAULT NULL,                
  date_debut DATE DEFAULT NULL,
  prix DECIMAL(7,2) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY idx_tarifs_hotel (id_hotel),
  KEY idx_tarifs_type  (id_type),
  CONSTRAINT fk_tarifs_hotel
    FOREIGN KEY (id_hotel)
    REFERENCES hotels (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_tarifs_type
    FOREIGN KEY (id_type)
    REFERENCES chambre_types (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ------------------------------------------------------------
-- Table : utilisateurs
-- ------------------------------------------------------------
DROP TABLE IF EXISTS utilisateurs;
CREATE TABLE utilisateurs (
  id INT NOT NULL AUTO_INCREMENT,
  prenom VARCHAR(50) NOT NULL,
  date_creation TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  date_modification DATETIME DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

COMMIT;
