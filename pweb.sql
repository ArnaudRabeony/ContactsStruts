-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Dim 16 Octobre 2016 à 03:50
-- Version du serveur :  5.7.15-0ubuntu0.16.04.1
-- Version de PHP :  7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pweb`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE `adresse` (
  `idAdresse` int(11) NOT NULL,
  `rue` varchar(60) NOT NULL,
  `ville` varchar(30) NOT NULL,
  `codePostal` varchar(10) NOT NULL,
  `pays` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `adresse`
--

INSERT INTO `adresse` (`idAdresse`, `rue`, `ville`, `codePostal`, `pays`) VALUES
(4, '42 Avenue Poincare', 'Vlr', '94290', 'France'),
(5, 'ok azeaze', 'ok', 'ok', 'ok'),
(6, 'nouvelleAdresse eara', 'eaze', 'zaea', 'ezaeaz'),
(10, 'azaeaz zae', 'zar', 'rzar', 'aeza'),
(11, 'test a', 'a', 'a', 'a');

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `idContact` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `idAdresse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `contact`
--

INSERT INTO `contact` (`idContact`, `nom`, `prenom`, `email`, `idAdresse`) VALUES
(5, 'testNomm', 'testPrenomm', 'testEmailll', 4),
(6, 'Fring', 'Gustavo', 'gustavo@g.c', 5),
(10, 'White', 'Walter', 'teste', 6),
(11, 'Pinkman', 'Jesse', 'ok', 10),
(21, 'a', 'e', 'r', NULL),
(22, 'az', 'r', 'r', 4);

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

CREATE TABLE `contacts` (
  `ID_CONTACT` bigint(20) NOT NULL,
  `FIRSTNAME` varchar(255) DEFAULT NULL,
  `LASTNAME` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `contacts`
--

INSERT INTO `contacts` (`ID_CONTACT`, `FIRSTNAME`, `LASTNAME`, `EMAIL`) VALUES
(1, 'Rabeony', 'Arnaud', 'ar_rabeony@hotmail.fr'),
(2, 'e', 'a', 'r');

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE `groupe` (
  `idGroupe` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `groupe`
--

INSERT INTO `groupe` (`idGroupe`, `nom`) VALUES
(10, 'Cuisiniers'),
(11, 'Groupe'),
(12, 'Los pollos hermanos');

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

CREATE TABLE `membre` (
  `idGroupe` int(11) NOT NULL,
  `idContact` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `membre`
--

INSERT INTO `membre` (`idGroupe`, `idContact`) VALUES
(10, 6),
(10, 10),
(10, 11),
(11, 5),
(11, 10),
(12, 6),
(12, 11);

-- --------------------------------------------------------

--
-- Structure de la table `telephone`
--

CREATE TABLE `telephone` (
  `idTelephone` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `idContact` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `telephone`
--

INSERT INTO `telephone` (`idTelephone`, `type`, `numero`, `idContact`) VALUES
(3, 'pro', '04561247', 0),
(4, 'perso', '0123456789', 10),
(5, 'pro', '06123456789', 10),
(13, 'pro', 'gustavoNum', 6),
(15, 'pro', 'aza', 6);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`idAdresse`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`idContact`),
  ADD UNIQUE KEY `id` (`idContact`);

--
-- Index pour la table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`ID_CONTACT`);

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`idGroupe`);

--
-- Index pour la table `membre`
--
ALTER TABLE `membre`
  ADD PRIMARY KEY (`idGroupe`,`idContact`);

--
-- Index pour la table `telephone`
--
ALTER TABLE `telephone`
  ADD PRIMARY KEY (`idTelephone`),
  ADD KEY `fk_contact_id` (`idContact`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `idAdresse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `idContact` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT pour la table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `ID_CONTACT` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `idGroupe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `telephone`
--
ALTER TABLE `telephone`
  MODIFY `idTelephone` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
