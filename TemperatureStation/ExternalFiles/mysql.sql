-- --------------------------------------------------------
-- Host:                         192.168.4.2
-- Server version:               5.7.16-0ubuntu0.16.10.1 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table TemperatureStation.AspNetRoleClaims
CREATE TABLE IF NOT EXISTS `AspNetRoleClaims` (
  `Id` int(11) NOT NULL,
  `ClaimType` varchar(255) DEFAULT NULL,
  `ClaimValue` varchar(255) DEFAULT NULL,
  `RoleId` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table TemperatureStation.AspNetRoles
CREATE TABLE IF NOT EXISTS `AspNetRoles` (
  `Id` varchar(255) NOT NULL,
  `ConcurrencyStamp` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `NormalizedName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table TemperatureStation.AspNetUserClaims
CREATE TABLE IF NOT EXISTS `AspNetUserClaims` (
  `Id` int(11) NOT NULL,
  `ClaimType` varchar(255) DEFAULT NULL,
  `ClaimValue` varchar(255) DEFAULT NULL,
  `UserId` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table TemperatureStation.AspNetUserLogins
CREATE TABLE IF NOT EXISTS `AspNetUserLogins` (
  `LoginProvider` varchar(255) NOT NULL,
  `ProviderKey` varchar(255) NOT NULL,
  `ProviderDisplayName` varchar(255) DEFAULT NULL,
  `UserId` varchar(255) NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table TemperatureStation.AspNetUserRoles
CREATE TABLE IF NOT EXISTS `AspNetUserRoles` (
  `UserId` varchar(255) NOT NULL,
  `RoleId` varchar(255) NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  KEY `IX_AspNetUserRoles_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table TemperatureStation.AspNetUsers
CREATE TABLE IF NOT EXISTS `AspNetUsers` (
  `Id` varchar(255) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  `ConcurrencyStamp` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `EmailConfirmed` bit(1) NOT NULL,
  `LockoutEnabled` bit(1) NOT NULL,
  `LockoutEnd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `NormalizedEmail` varchar(255) DEFAULT NULL,
  `NormalizedUserName` varchar(255) DEFAULT NULL,
  `PasswordHash` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(255) DEFAULT NULL,
  `PhoneNumberConfirmed` bit(1) NOT NULL,
  `SecurityStamp` varchar(255) DEFAULT NULL,
  `TwoFactorEnabled` bit(1) NOT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table TemperatureStation.AspNetUserTokens
CREATE TABLE IF NOT EXISTS `AspNetUserTokens` (
  `UserId` varchar(255) NOT NULL,
  `LoginProvider` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table TemperatureStation.Calculators
CREATE TABLE IF NOT EXISTS `Calculators` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `MeasurementId` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Parameters` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Calculators_Measurements` (`MeasurementId`),
  CONSTRAINT `FK_Calculators_Measurements` FOREIGN KEY (`MeasurementId`) REFERENCES `Measurements` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table TemperatureStation.Measurements
CREATE TABLE IF NOT EXISTS `Measurements` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IsActive` bit(1) NOT NULL DEFAULT b'0',
  `Name` varchar(50) NOT NULL,
  `FreezingPoint` double DEFAULT NULL,
  `CoolingRate` double DEFAULT NULL,
  `OriginalGravity` double DEFAULT NULL,
  `FinalGravity` double DEFAULT NULL,
  `AlcoholByVolume` double DEFAULT NULL,
  `AlcoholByWeight` double DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table TemperatureStation.Readings
CREATE TABLE IF NOT EXISTS `Readings` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ReadingType` varchar(50) NOT NULL,
  `ReadingTime` datetime NOT NULL,
  `Value` double NOT NULL,
  `MeasurementId` int(11) NOT NULL,
  `SensorRoleId` int(11) DEFAULT NULL,
  `CalculatorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Readings_SensorRoles` (`SensorRoleId`),
  KEY `FK_Readings_Measurements` (`MeasurementId`),
  KEY `FK_Readings_Calculators` (`CalculatorId`),
  CONSTRAINT `FK_Readings_Calculators` FOREIGN KEY (`CalculatorId`) REFERENCES `Calculators` (`Id`),
  CONSTRAINT `FK_Readings_Measurements` FOREIGN KEY (`MeasurementId`) REFERENCES `Measurements` (`Id`),
  CONSTRAINT `FK_Readings_SensorRoles` FOREIGN KEY (`SensorRoleId`) REFERENCES `SensorRoles` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table TemperatureStation.SensorRoles
CREATE TABLE IF NOT EXISTS `SensorRoles` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `MeasurementId` int(11) NOT NULL,
  `SensorId` varchar(450) NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_SensorRoles_Measurements` (`MeasurementId`),
  KEY `FK_SensorRoles_Sensors` (`SensorId`),
  CONSTRAINT `FK_SensorRoles_Measurements` FOREIGN KEY (`MeasurementId`) REFERENCES `Measurements` (`Id`),
  CONSTRAINT `FK_SensorRoles_Sensors` FOREIGN KEY (`SensorId`) REFERENCES `Sensors` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table TemperatureStation.Sensors
CREATE TABLE IF NOT EXISTS `Sensors` (
  `Id` varchar(450) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.19-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for view temperaturestation.measurementstats
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `measurementstats` (
	`Name` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`MeasurementId` INT(11) NOT NULL,
	`Min` DOUBLE NULL,
	`Max` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view temperaturestation.measurementstats
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `measurementstats`;
CREATE VIEW `measurementstats` AS select `sr`.`RoleName` AS `Name`,`sr`.`MeasurementId` AS `MeasurementId`,min(`r`.`Value`) AS `Min`,max(`r`.`Value`) AS `Max` from (`readings` `r` join `sensorroles` `sr` on((`r`.`SensorRoleId` = `sr`.`Id`))) group by `sr`.`RoleName`,`sr`.`MeasurementId` union select `c`.`Name` AS `Name`,`c`.`MeasurementId` AS `MeasurementId`,min(`r`.`Value`) AS `Min`,max(`r`.`Value`) AS `Max` from (`readings` `r` join `calculators` `c` on((`r`.`CalculatorId` = `c`.`Id`))) group by `c`.`Name`,`c`.`MeasurementId`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;


-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
