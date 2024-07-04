-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 04 juil. 2024 à 14:31
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `avis_agora`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(2, 'Film', '2024-07-03 09:17:56', '2024-07-03 09:17:56'),
(3, 'Livre', '2024-07-03 09:18:01', '2024-07-03 09:18:01'),
(4, 'Manga', '2024-07-03 09:18:07', '2024-07-03 09:18:07'),
(5, 'Serie', '2024-07-03 09:18:16', '2024-07-03 09:18:16');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rating` int NOT NULL,
  `comment` varchar(255) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime NOT NULL,
  `productId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `rating`, `comment`, `createdAt`, `updatedAt`, `productId`) VALUES
(11, 4, 'test', '2024-07-04 09:05:44', '2024-07-04 09:05:44', NULL),
(12, 4, 'test', '2024-07-04 09:05:54', '2024-07-04 09:05:54', 34),
(13, 4, 'azdad', '2024-07-04 09:39:00', '2024-07-04 09:39:00', 21),
(14, 1, 'adzd', '2024-07-04 09:40:31', '2024-07-04 09:40:31', 21),
(15, 4, 'azdad', '2024-07-04 13:02:12', '2024-07-04 13:02:12', 23),
(16, 3, 'Tres bon film', '2024-07-04 13:54:39', '2024-07-04 13:54:39', 21),
(17, 5, 'test', '2024-07-04 14:01:51', '2024-07-04 14:01:51', 21),
(18, 1, 'ADADZ', '2024-07-04 14:02:31', '2024-07-04 14:02:31', 21),
(19, 5, 'AAJAJ', '2024-07-04 14:02:59', '2024-07-04 14:02:59', 43),
(20, 1, 'AZDJAHZ', '2024-07-04 14:03:10', '2024-07-04 14:03:10', 43);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `rating` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `categoryId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryId` (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `image`, `rating`, `createdAt`, `updatedAt`, `categoryId`) VALUES
(21, 'Film1', 'adqsqdaz', '/assets/images/film/1.jpg', 3, '2024-07-04 08:56:49', '2024-07-04 14:02:31', 2),
(22, 'Film2', 'adqsqdaz', '/assets/images/film/2.jpg', NULL, '2024-07-04 08:56:57', '2024-07-04 08:56:57', 2),
(23, 'Film3', 'adqsqdaz', '/assets/images/film/3.jpg', 4, '2024-07-04 08:57:03', '2024-07-04 13:02:12', 2),
(24, 'Film4', 'adqsqdaz', '/assets/images/film/4.jpg', NULL, '2024-07-04 08:57:10', '2024-07-04 08:57:10', 2),
(25, 'Film5', 'adqsqdaz', '/assets/images/film/5.jpg', NULL, '2024-07-04 08:57:16', '2024-07-04 08:57:16', 2),
(26, 'Livre1', 'adqsqdaz', '/assets/images/livre/1.jpg', NULL, '2024-07-04 08:58:04', '2024-07-04 08:58:04', 3),
(27, 'Livre2', 'adqsqdaz', '/assets/images/livre/2.jpg', NULL, '2024-07-04 08:58:10', '2024-07-04 08:58:10', 3),
(28, 'Livre3', 'adqsqdaz', '/assets/images/livre/3.jpg', NULL, '2024-07-04 08:58:15', '2024-07-04 08:58:15', 3),
(29, 'Livre4', 'adqsqdaz', '/assets/images/livre/4.jpg', NULL, '2024-07-04 08:58:48', '2024-07-04 08:58:48', 3),
(30, 'Livre5', 'adqsqdaz', '/assets/images/livre/5.jpg', NULL, '2024-07-04 08:58:55', '2024-07-04 08:58:55', 3),
(31, 'Manga1', 'adqsqdaz', '/assets/images/manga/1.jpg', NULL, '2024-07-04 09:00:03', '2024-07-04 09:00:03', 4),
(32, 'Manga2', 'adqsqdaz', '/assets/images/manga/2.jpg', NULL, '2024-07-04 09:00:16', '2024-07-04 09:00:16', 4),
(33, 'Manga3', 'adqsqdaz', '/assets/images/manga/3.jpg', NULL, '2024-07-04 09:00:22', '2024-07-04 09:00:22', 4),
(34, 'Manga4', 'adqsqdaz', '/assets/images/manga/4.jpg', 4, '2024-07-04 09:00:28', '2024-07-04 09:05:54', 4),
(35, 'Manga5', 'adqsqdaz', '/assets/images/manga/5.jpg', NULL, '2024-07-04 09:00:35', '2024-07-04 09:00:35', 4),
(36, 'Serie1', 'adqsqdaz', '/assets/images/serie/1.jpg', NULL, '2024-07-04 09:00:48', '2024-07-04 09:00:48', 5),
(37, 'Serie2', 'adqsqdaz', '/assets/images/serie/2.jpg', NULL, '2024-07-04 09:00:54', '2024-07-04 09:00:54', 5),
(38, 'Serie3', 'adqsqdaz', '/assets/images/serie/3.jpg', NULL, '2024-07-04 09:00:59', '2024-07-04 09:00:59', 5),
(39, 'Serie4', 'adqsqdaz', '/assets/images/serie/4.jpg', NULL, '2024-07-04 09:01:03', '2024-07-04 09:01:03', 5),
(40, 'Serie5', 'adqsqdaz', '/assets/images/serie/5.jpg', NULL, '2024-07-04 09:01:10', '2024-07-04 09:01:10', 5),
(43, 'Test', 'adqsqdaz', 'ada', 3, '2024-07-04 13:55:20', '2024-07-04 14:03:10', 3);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
