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

-- ------------------------------------------------------
-- Table `hotels`
-- ------------------------------------------------------
INSERT INTO `hotels` (`id`, `libelle`, `etoile`) VALUES
  (1,'Ski Hotel','*'),
  (2,'Art Hotel','**'),
  (3,'Rose Hotel','***'),
  (4,'Lions Hotel','****');

-- ------------------------------------------------------
-- Table `couchages`
-- ------------------------------------------------------
INSERT INTO `couchages` (`id`, `nom`, `nb_places`) VALUES
  (1,'Lit simple',1),
  (2,'Lit double',2),
  (3,'Lit XL',2),
  (4,'Lit superposé',2);

-- ------------------------------------------------------
-- Table `salles_de_bain`
-- ------------------------------------------------------
INSERT INTO `salles_de_bain` (`id`, `nom`) VALUES
  (1,'Douche'),
  (2,'Douche et WC séparé'),
  (3,'Baignoire'),
  (4,'Baignoire et WC séparé');

-- ------------------------------------------------------
-- Table `chambre_types`
-- ------------------------------------------------------
INSERT INTO `chambre_types` (`id`,`nom`,`description`,`id_salle_de_bain`) VALUES
  (1,'Chambre Standard','1 lit simple avec douche (1 personne)',1),
  (2,'Chambre Twin','2 lits simples avec douche (2 personnes)',1),
  (3,'Chambre Twin +','2 lits simples avec douche et WC séparé (2 personnes)',2),
  (4,'Chambre Double','1 lit double avec douche (2 personnes)',1),
  (5,'Chambre Double +','1 lit double avec douche et WC séparé (2 personnes)',2),
  (6,'Chambre Familiale','1 lit double, 2 lits superposés avec douche et WC séparé (4 personnes)',2),
  (7,'Chambre Familiale +','1 lit double, 2 lits superposés avec bain et WC séparé (4 personnes)',4),
  (8,'Chambre King Size','1 lit double large avec bain et WC séparé (2 personnes)',4);

-- ------------------------------------------------------
-- Table `chambres`
-- ------------------------------------------------------
INSERT INTO `chambres` (`id`,`id_hotel`,`id_type`,`numero`,`commentaire`) VALUES
  (1 ,1,1,'1',NULL),
  (2 ,1,1,'2','En travaux'),
  (3 ,1,3,'3',NULL),
  (4 ,1,1,'4',NULL),
  (6 ,1,6,'6',NULL),
  (8 ,2,1,'1',NULL),
  (9 ,2,2,'2',NULL),
  (10,2,3,'3',NULL),
  (11,2,4,'4',NULL),
  (12,2,5,'5','Vue sur le lac'),
  (13,2,6,'6',NULL),
  (14,2,8,'7',NULL),
  (15,3,1,'1',NULL),
  (16,3,2,'2',NULL),
  (17,3,3,'3',NULL),
  (18,3,4,'4',NULL),
  (19,3,5,'5',NULL),
  (20,3,6,'6',NULL),
  (21,3,8,'7',NULL),
  (22,4,1,'1',NULL),
  (23,4,2,'2',NULL),
  (24,4,3,'3',NULL),
  (25,4,4,'4',NULL),
  (26,4,5,'5',NULL),
  (27,4,6,'6',NULL),
  (28,4,8,'7',NULL),
  (29,1,5,'5','Réservée aux VIP');

-- ------------------------------------------------------
-- Table `chambre_type_couchage`
-- ------------------------------------------------------
INSERT INTO `chambre_type_couchage` (`id_type`,`id_couchage`,`qte`) VALUES
  (1,1,1),
  (2,1,2),
  (3,1,2),
  (4,2,1),
  (5,2,1),
  (6,2,1),
  (6,4,2),
  (7,2,1),
  (7,4,2),
  (8,3,1);

-- ------------------------------------------------------
-- Table `tarifs`
-- ------------------------------------------------------
INSERT INTO `tarifs` (`id`,`id_hotel`,`id_type`,`date_debut`,`prix`) VALUES
  ( 8,2,1,'2021-12-15','57.49'),
  ( 9,2,2,'2021-12-15','68.99'),
  (10,2,3,'2021-12-15','80.49'),
  (11,2,4,'2021-12-15','68.99'),
  (12,2,5,'2021-12-15','80.49'),
  (13,2,6,'2021-12-15','91.99'),
  (14,2,8,'2021-12-15','103.49'),
  (15,3,1,'2021-12-15','57.49'),
  (16,3,2,'2021-12-15','68.99'),
  (17,3,3,'2021-12-15','80.49'),
  (18,3,4,'2021-12-15','68.99'),
  (19,3,5,'2021-12-15','80.49'),
  (20,3,6,'2021-12-15','91.99'),
  (21,3,8,'2021-12-15','103.49'),
  (22,4,1,'2021-10-01','49.99'),
  (23,4,2,'2021-10-01','59.99'),
  (24,4,3,'2021-10-01','69.99'),
  (25,4,4,'2021-10-01','59.99'),
  (26,4,5,'2021-10-01','69.99'),
  (27,4,6,'2021-10-01','79.99'),
  (28,4,8,'2021-10-01','89.99'),
  (36,4,1,'2021-04-01','57.49'),
  (37,4,2,'2021-04-01','68.99'),
  (38,4,3,'2021-04-01','80.49'),
  (39,4,4,'2021-04-01','68.99'),
  (40,4,5,'2021-04-01','80.49'),
  (41,4,6,'2021-04-01','91.99'),
  (42,4,8,'2021-04-01','103.49'),
  (43,2,1,'2021-04-16','49.99'),
  (44,2,2,'2021-04-16','59.99'),
  (45,2,3,'2021-04-16','69.99'),
  (46,2,4,'2021-04-16','59.99'),
  (47,2,5,'2021-04-16','69.99'),
  (48,2,6,'2021-04-16','79.99'),
  (49,2,8,'2021-04-16','89.99'),
  (50,3,1,'2021-04-16','49.99'),
  (51,3,2,'2021-04-16','59.99'),
  (52,3,3,'2021-04-16','69.99'),
  (53,3,4,'2021-04-16','59.99'),
  (54,3,5,'2021-04-16','69.99'),
  (55,3,6,'2021-04-16','79.99'),
  (56,3,8,'2021-04-16','89.99'),

  --  Ski Hotel (id_hotel = 1) – tarifs 2025‑04‑01 - Supposition
  (57,1,1,'2025-04-01','49.99'),
  (58,1,3,'2025-04-01','59.99'),
  (59,1,5,'2025-04-01','69.99'),
  (60,1,6,'2025-04-01','79.99');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
