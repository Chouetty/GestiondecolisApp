CREATE DATABASE  IF NOT EXISTS `gestioncolis` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gestioncolis`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: gestioncolis
-- ------------------------------------------------------
-- Server version	5.7.9-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bordereau`
--

DROP TABLE IF EXISTS `bordereau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bordereau` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `COMMANDE` int(11) unsigned NOT NULL,
  `DETAIL` varchar(128) NOT NULL,
  `DATE_SIGNATURE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_bordereau_commande1_idx` (`COMMANDE`),
  CONSTRAINT `fk_bordereau_commande1` FOREIGN KEY (`COMMANDE`) REFERENCES `commande` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `colis`
--

DROP TABLE IF EXISTS `colis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colis` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `REFERENCE` varchar(32) NOT NULL,
  `INTITULE` varchar(128) DEFAULT NULL,
  `POIDS` float NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `REFERENCE_UNIQUE` (`REFERENCE`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commande` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PAQUET` int(11) unsigned NOT NULL,
  `DATE_COMMANDE` datetime NOT NULL,
  `DATE_ENVOI` datetime DEFAULT NULL,
  `ETAT` int(11) unsigned NOT NULL DEFAULT '1',
  `ACK_SENT` datetime DEFAULT NULL,
  `ACK_RECEIVED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_commande_paquet1_idx` (`PAQUET`),
  KEY `fk_commande_etat1_idx` (`ETAT`),
  CONSTRAINT `fk_commande_etat1` FOREIGN KEY (`ETAT`) REFERENCES `etat` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_commande_paquet1` FOREIGN KEY (`PAQUET`) REFERENCES `paquet` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coordonnees`
--

DROP TABLE IF EXISTS `coordonnees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordonnees` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `LASTNAME` varchar(48) NOT NULL,
  `FIRSTNAME` varchar(48) NOT NULL,
  `ADDRESS_LINE1` varchar(128) NOT NULL,
  `ADDRESS_LINE2` varchar(128) DEFAULT NULL,
  `POSTAL_CODE` int(11) NOT NULL,
  `CITY` varchar(32) NOT NULL,
  `COUNTRY` varchar(32) NOT NULL,
  `PHONE_NUMBER` varchar(16) DEFAULT NULL,
  `EMAIL` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `etat`
--

DROP TABLE IF EXISTS `etat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etat` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOM` varchar(24) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `facture`
--

DROP TABLE IF EXISTS `facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facture` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `REFERENCE` varchar(32) NOT NULL,
  `COMMANDE` int(11) unsigned NOT NULL,
  `MONTANT` double DEFAULT NULL,
  `DATE_FACTURE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_facture_commande1_idx` (`COMMANDE`),
  CONSTRAINT `fk_facture_commande1` FOREIGN KEY (`COMMANDE`) REFERENCES `commande` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liasse`
--

DROP TABLE IF EXISTS `liasse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liasse` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `COMMANDE` int(11) unsigned NOT NULL,
  `VALEUR` double NOT NULL,
  `NATURE` varchar(80) NOT NULL,
  `DATE_SIGNATURE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_liasse_commande1_idx` (`COMMANDE`),
  CONSTRAINT `fk_liasse_commande1` FOREIGN KEY (`COMMANDE`) REFERENCES `commande` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paquet`
--

DROP TABLE IF EXISTS `paquet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paquet` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `COLIS` int(11) unsigned NOT NULL,
  `EXPEDITEUR` int(11) unsigned NOT NULL,
  `DESTINATAIRE` int(11) unsigned NOT NULL,
  `DATE_RECIPISSE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `REF_UNIQUE` (`ID`),
  KEY `fk_Commande_Coordonnees_idx` (`EXPEDITEUR`),
  KEY `fk_Commande_Coordonnees1_idx` (`DESTINATAIRE`),
  KEY `fk_Commande_COLIS1_idx` (`COLIS`),
  CONSTRAINT `fk_Commande_COLIS1` FOREIGN KEY (`COLIS`) REFERENCES `colis` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Commande_Coordonnees` FOREIGN KEY (`EXPEDITEUR`) REFERENCES `coordonnees` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Commande_Coordonnees1` FOREIGN KEY (`DESTINATAIRE`) REFERENCES `coordonnees` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-09  9:42:54
