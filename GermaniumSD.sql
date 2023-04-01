CREATE DATABASE  IF NOT EXISTS `inflables` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `inflables`;
-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: inflables
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `IdA` int(11) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Apellido` varchar(25) NOT NULL,
  `Correo` varchar(45) NOT NULL,
  PRIMARY KEY (`IdA`),
  UNIQUE KEY `Correo` (`Correo`),
  CONSTRAINT `fk_adm` FOREIGN KEY (`Correo`) REFERENCES `usuarios` (`Usu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `IdC` int(11) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Apellido` varchar(25) NOT NULL,
  `Correo` varchar(45) NOT NULL,
  `Tel` int(11) NOT NULL,
  `Dom` varchar(45) NOT NULL,
  `Ocupacion` varchar(20) NOT NULL,
  `Gen` varchar(20) NOT NULL,
  `RFC` varchar(13) NOT NULL,
  `Activo` int(1) NOT NULL,
  PRIMARY KEY (`IdC`),
  UNIQUE KEY `Correo` (`Correo`),
  CONSTRAINT `fk_cl` FOREIGN KEY (`Correo`) REFERENCES `usuarios` (`Usu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `IdE` int(11) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Apellido` varchar(25) NOT NULL,
  `Correo` varchar(45) NOT NULL,
  `Tel` int(11) NOT NULL,
  `Activo` int(1) NOT NULL,
  PRIMARY KEY (`IdE`),
  UNIQUE KEY `Correo` (`Correo`),
  CONSTRAINT `fk_em` FOREIGN KEY (`Correo`) REFERENCES `usuarios` (`Usu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inflable`
--

DROP TABLE IF EXISTS `inflable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inflable` (
  `idInflable` int(11) NOT NULL,
  `Tipo` varchar(20) NOT NULL,
  `Precio_individual` int(11) NOT NULL,
  `Cantidad_maxima` int(11) NOT NULL,
  `Cantidad_inventario` int(11) NOT NULL,
  PRIMARY KEY (`idInflable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `intfall`
--

DROP TABLE IF EXISTS `intfall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intfall` (
  `UsuF` varchar(45) NOT NULL,
  `Intentos` int(11) NOT NULL,
  PRIMARY KEY (`UsuF`),
  CONSTRAINT `fk_fails` FOREIGN KEY (`UsuF`) REFERENCES `usuarios` (`Usu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario` (
  `idInventario` int(11) NOT NULL,
  `Disponibles` int(11) NOT NULL,
  PRIMARY KEY (`idInventario`),
  CONSTRAINT `fk_Inventario_Inflable1` FOREIGN KEY (`idInventario`) REFERENCES `inflable` (`idInflable`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `idInflable` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Precio` int(11) NOT NULL,
  `Fecha_pedido` datetime NOT NULL,
  `Fecha_recogido` datetime NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_Pedido_clientes1` (`idCliente`),
  KEY `fk_Pedido_Inflable1` (`idInflable`),
  CONSTRAINT `fk_Pedido_Inflable1` FOREIGN KEY (`idInflable`) REFERENCES `inflable` (`idInflable`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_clientes1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`IdC`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reseña`
--

DROP TABLE IF EXISTS `reseña`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reseña` (
  `idResenia` int(11) NOT NULL,
  `clientes_IdC` int(11) NOT NULL,
  `IdInflable` int(11) NOT NULL,
  `Texto` varchar(255) DEFAULT NULL,
  `Valoracion` decimal(5,0) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`idResenia`),
  KEY `fk_Resenia_clientes` (`clientes_IdC`),
  KEY `fk_Resenia_Inflable1` (`IdInflable`),
  CONSTRAINT `fk_Resenia_Inflable1` FOREIGN KEY (`IdInflable`) REFERENCES `inflable` (`idInflable`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Resenia_clientes` FOREIGN KEY (`clientes_IdC`) REFERENCES `clientes` (`IdC`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipos`
--

DROP TABLE IF EXISTS `tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos` (
  `IdT` int(11) NOT NULL,
  `Descr` varchar(20) NOT NULL,
  `URL` varchar(20) NOT NULL,
  `Nivel` int(1) NOT NULL,
  PRIMARY KEY (`IdT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `Usu` varchar(45) NOT NULL,
  `Pass` varchar(20) NOT NULL,
  `IdT` int(11) NOT NULL,
  `Activo` int(1) NOT NULL,
  PRIMARY KEY (`Usu`),
  KEY `fk_usu` (`IdT`),
  CONSTRAINT `fk_usu` FOREIGN KEY (`IdT`) REFERENCES `tipos` (`IdT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-27 19:23:51
