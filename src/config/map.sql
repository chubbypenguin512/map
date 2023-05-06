-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.31 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET NAMES utf8 */
;

/*!50503 SET NAMES utf8mb4 */
;

/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */
;

/*!40103 SET TIME_ZONE='+00:00' */
;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */
;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */
;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */
;

-- Dumping database structure for map_ws_dev_2
CREATE DATABASE IF NOT EXISTS `map_ws_dev_2`
/*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */
/*!80016 DEFAULT ENCRYPTION='N' */
;

USE `map_ws_dev_2`;

-- Dumping structure for table map_ws_dev_2.adm_area
CREATE TABLE IF NOT EXISTS `adm_area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `acreage` double DEFAULT NULL,
  `description` text,
  `status` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- Dumping structure for table map_ws_dev_2.adm_bin
CREATE TABLE IF NOT EXISTS `adm_bin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `address` text,
  `height` double DEFAULT NULL,
  `length` double DEFAULT NULL,
  `width` double DEFAULT NULL,
  `maxWeight` double DEFAULT NULL,
  `color` text,
  `material` text,
  `brand` text,
  `image` text,
  `description` text,
  `status` text,
  `areaId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `areaId` (`areaId`),
  CONSTRAINT `adm_bin_ibfk_1` FOREIGN KEY (`areaId`) REFERENCES `adm_area` (`id`) ON DELETE
  SET
    NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 49 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- Dumping structure for table map_ws_dev_2.adm_task
CREATE TABLE IF NOT EXISTS `adm_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `driverId` int DEFAULT NULL,
  `vehicleId` int DEFAULT NULL,
  `areaId` int DEFAULT NULL,
  `description` text,
  `status` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `driverId` (`driverId`),
  KEY `vehicleId` (`vehicleId`),
  KEY `areaId` (`areaId`),
  CONSTRAINT `adm_task_ibfk_1` FOREIGN KEY (`driverId`) REFERENCES `adm_user` (`id`) ON DELETE
  SET
    NULL ON UPDATE CASCADE,
    CONSTRAINT `adm_task_ibfk_2` FOREIGN KEY (`vehicleId`) REFERENCES `adm_vehicle` (`id`) ON DELETE
  SET
    NULL ON UPDATE CASCADE,
    CONSTRAINT `adm_task_ibfk_3` FOREIGN KEY (`areaId`) REFERENCES `adm_area` (`id`) ON DELETE
  SET
    NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 21 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- Dumping structure for table map_ws_dev_2.adm_user
CREATE TABLE IF NOT EXISTS `adm_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` text,
  `password` text,
  `email` text,
  `firstName` text,
  `lastName` text,
  `gender` text,
  `dob` text,
  `image` text,
  `role` text,
  `description` text,
  `status` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- Dumping structure for table map_ws_dev_2.adm_vehicle
CREATE TABLE IF NOT EXISTS `adm_vehicle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `engineHours` text,
  `engineId` text,
  `engineType` text,
  `model` text,
  `height` double DEFAULT NULL,
  `length` double DEFAULT NULL,
  `width` double DEFAULT NULL,
  `odometer` double DEFAULT NULL,
  `plate` text,
  `tonnage` double DEFAULT NULL,
  `image` text,
  `description` text,
  `status` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- Dumping structure for table map_ws_dev_2.log_bin_state
CREATE TABLE IF NOT EXISTS `log_bin_state` (
  `id` int NOT NULL AUTO_INCREMENT,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `description` text,
  `status` text,
  `binId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `binId` (`binId`),
  CONSTRAINT `log_bin_state_ibfk_1` FOREIGN KEY (`binId`) REFERENCES `adm_bin` (`id`) ON DELETE
  SET
    NULL ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- Dumping data for table map_ws_dev_2.log_bin_state: ~0 rows (approximately)
-- Dumping structure for table map_ws_dev_2.log_vehicle_work
CREATE TABLE IF NOT EXISTS `log_vehicle_work` (
  `id` int NOT NULL AUTO_INCREMENT,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `altitude` double DEFAULT NULL,
  `speed` double DEFAULT NULL,
  `angle` double DEFAULT NULL,
  `odometer` double DEFAULT NULL,
  `engineHours` double DEFAULT NULL,
  `fuel` double DEFAULT NULL,
  `description` text,
  `status` text,
  `vehicleId` int DEFAULT NULL,
  `driverId` int DEFAULT NULL,
  `binStateId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicleId` (`vehicleId`),
  KEY `driverId` (`driverId`),
  KEY `binStateId` (`binStateId`),
  CONSTRAINT `log_vehicle_work_ibfk_1` FOREIGN KEY (`vehicleId`) REFERENCES `adm_vehicle` (`id`) ON DELETE
  SET
    NULL ON UPDATE CASCADE,
    CONSTRAINT `log_vehicle_work_ibfk_2` FOREIGN KEY (`driverId`) REFERENCES `adm_user` (`id`) ON DELETE
  SET
    NULL ON UPDATE CASCADE,
    CONSTRAINT `log_vehicle_work_ibfk_3` FOREIGN KEY (`binStateId`) REFERENCES `log_bin_state` (`id`) ON DELETE
  SET
    NULL ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- Dumping data for table map_ws_dev_2.log_vehicle_work: ~0 rows (approximately)
-- Dumping structure for table map_ws_dev_2.sup_vehicle_position
CREATE TABLE IF NOT EXISTS `sup_vehicle_position` (
  `id` int NOT NULL AUTO_INCREMENT,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `vehicleId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicleId` (`vehicleId`),
  CONSTRAINT `sup_vehicle_position_ibfk_1` FOREIGN KEY (`vehicleId`) REFERENCES `adm_vehicle` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- Dumping structure for table map_ws_dev_2.sup_vehicle_state
CREATE TABLE IF NOT EXISTS `sup_vehicle_state` (
  `id` int NOT NULL AUTO_INCREMENT,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `altitude` double DEFAULT NULL,
  `speed` double DEFAULT NULL,
  `angle` double DEFAULT NULL,
  `state` text,
  `description` text,
  `status` text,
  `vehicleId` int DEFAULT NULL,
  `driverId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicleId` (`vehicleId`),
  KEY `driverId` (`driverId`),
  CONSTRAINT `sup_vehicle_state_ibfk_1` FOREIGN KEY (`vehicleId`) REFERENCES `adm_vehicle` (`id`) ON DELETE
  SET
    NULL ON UPDATE CASCADE,
    CONSTRAINT `sup_vehicle_state_ibfk_2` FOREIGN KEY (`driverId`) REFERENCES `adm_user` (`id`) ON DELETE
  SET
    NULL ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- Dumping data for table map_ws_dev_2.sup_vehicle_state: ~0 rows (approximately)
-- Dumping structure for table map_ws_dev_2.sup_vehicle_trouble
CREATE TABLE IF NOT EXISTS `sup_vehicle_trouble` (
  `id` int NOT NULL AUTO_INCREMENT,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `altitude` double DEFAULT NULL,
  `speed` double DEFAULT NULL,
  `angle` double DEFAULT NULL,
  `fuel` double DEFAULT NULL,
  `trouble` text,
  `description` text,
  `status` text,
  `vehicleId` int DEFAULT NULL,
  `driverId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicleId` (`vehicleId`),
  KEY `driverId` (`driverId`),
  CONSTRAINT `sup_vehicle_trouble_ibfk_1` FOREIGN KEY (`vehicleId`) REFERENCES `adm_vehicle` (`id`) ON DELETE
  SET
    NULL ON UPDATE CASCADE,
    CONSTRAINT `sup_vehicle_trouble_ibfk_2` FOREIGN KEY (`driverId`) REFERENCES `adm_user` (`id`) ON DELETE
  SET
    NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 52 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO
  map_ws_dev_2.adm_area (acreage, description, status, createdAt, updatedAt)
VALUES
  (
    142248.0,
    'Khu vuc 1',
    'on',
    '2022-12-17 14:32:11',
    '2022-12-17 14:32:11'
  ),
  (
    122865.0,
    'Khu vuc 2',
    'on',
    '2022-12-17 14:35:27',
    '2022-12-17 14:35:27'
  ),
  (
    675461.0,
    'Khu vuc 3',
    'on',
    '2022-12-17 14:36:12',
    '2022-12-17 14:36:12'
  ),
  (
    507331.0,
    'Khu vuc 4',
    'on',
    '2022-12-17 14:36:15',
    '2022-12-17 14:36:15'
  ),
  (
    108806.0,
    'Khu vuc 5',
    'on',
    '2022-12-17 14:36:18',
    '2022-12-17 14:36:18'
  );

INSERT INTO
  map_ws_dev_2.adm_task (
    driverId,
    vehicleId,
    areaId,
    description,
    status,
    createdAt,
    updatedAt
  )
VALUES
  (
    1,
    1,
    1,
    NULL,
    'finished',
    '2022-12-17 15:21:05',
    '2022-12-17 15:21:05'
  ),
  (
    4,
    NULL,
    2,
    NULL,
    'finished',
    '2022-12-17 15:21:29',
    '2022-12-17 15:21:29'
  ),
  (
    5,
    NULL,
    3,
    NULL,
    'finished',
    '2022-12-17 15:21:38',
    '2022-12-17 15:21:38'
  ),
  (
    6,
    NULL,
    4,
    NULL,
    'finished',
    '2022-12-17 15:21:44',
    '2022-12-17 15:21:44'
  ),
  (
    7,
    NULL,
    5,
    NULL,
    'finished',
    '2022-12-17 15:21:48',
    '2022-12-17 15:21:48'
  ),
  (
    1,
    NULL,
    2,
    NULL,
    'on',
    '2022-12-17 15:23:23',
    '2022-12-17 15:23:23'
  ),
  (
    4,
    1,
    3,
    NULL,
    'on',
    '2022-12-17 15:23:27',
    '2022-12-17 15:23:27'
  ),
  (
    5,
    NULL,
    5,
    NULL,
    'on',
    '2022-12-17 15:23:42',
    '2022-12-17 15:23:42'
  ),
  (
    6,
    NULL,
    1,
    NULL,
    'on',
    '2022-12-17 15:23:46',
    '2022-12-17 15:23:46'
  ),
  (
    7,
    NULL,
    4,
    NULL,
    'on',
    '2022-12-17 15:23:51',
    '2022-12-17 15:23:51'
  );

INSERT INTO
  map_ws_dev_2.adm_user (
    phone,
    password,
    email,
    firstName,
    lastName,
    gender,
    dob,
    image,
    `role`,
    description,
    status,
    createdAt,
    updatedAt
  )
VALUES
  (
    '0986420512',
    '$2b$10$vGJ/OfKbNy.AHzKL/4KKWuaQajmlR9yENcyQevoeqgZ9L9KTa.r12',
    'tungbv@gmail.com',
    'Bui Van',
    'Tung',
    'male',
    '05/12/2001',
    'user_1671284960657.png',
    'driver',
    'Bui Van Tung',
    'on',
    '2022-12-17 13:49:20',
    '2022-12-17 13:49:20'
  ),
  (
    '0123456789',
    '$2b$10$5xFgtYqWXvEH6Ge4LPqQu.fQInRS7X/EWC.kYyV7g7LvrmJWx74YW',
    'hungdn@gmail.com',
    'Dang Ngoc',
    'Hung',
    'male',
    '01/01/1980',
    'user_1671285089102.jpg',
    'manager',
    'Dang Ngoc Hung',
    'on',
    '2022-12-17 13:51:29',
    '2022-12-17 13:51:29'
  ),
  (
    '0123456780',
    '$2b$10$IHaTj61UTANTbp7gX8rlkuwc7bzVwby777LvcTOPNmq9hUFUoa8uK',
    'namvh@gmail.com',
    'Vu Hoai',
    'Nam',
    'male',
    '02/03/1980',
    'user_1671285138165.png',
    'admin',
    'Vu Hoai Nam',
    'on',
    '2022-12-17 13:52:18',
    '2022-12-17 13:52:18'
  ),
  (
    '0123456781',
    '$2b$10$C0Atk4Q.cG9yUSMoFouRi.Xg05D3hpwDY11EoVti0/kRYcMjmND1K',
    'dungdq@gmail.com',
    'Dang Quang',
    'Dung',
    'male',
    '15/02/2001',
    'user_1671285304631.png',
    'driver',
    'Dang Quang Dung',
    'on',
    '2022-12-17 13:55:04',
    '2022-12-17 13:55:04'
  ),
  (
    '0123456782',
    '$2b$10$EalGAlvc13LBsJSUV3/f4uGhSCeX8LwZ2DCPz59cmyE3xrPH./3NG',
    'anhvm@gmail.com',
    'Vu Minh',
    'Anh',
    'male',
    '04/02/2001',
    'user_1671285335485.png',
    'driver',
    'Vu Minh Anh',
    'on',
    '2022-12-17 13:55:35',
    '2022-12-17 13:55:35'
  ),
  (
    '0123456783',
    '$2b$10$fWPMlsIfdq.hWUDUI/dKTu/R7tRTV.JbKRaw5r7.sYvVMtEBrdzx2',
    'huynq@gmail.com',
    'Nguyen Quang',
    'Huy',
    'male',
    '05/06/2001',
    'user_1671285443603.png',
    'driver',
    'Nguyen Quang Huy',
    'on',
    '2022-12-17 13:57:23',
    '2022-12-17 13:57:23'
  ),
  (
    '0123456784',
    '$2b$10$8BfbH8/EymCt5Bvuzprg6ewlwfNRu1yJl/XTZG.5iBlvqZWaP1XYy',
    'tiennv@gmail.com',
    'Nguyen Van',
    'Tien',
    'male',
    '15/08/1995',
    'user_1671285535190.png',
    'driver',
    'Nguyen Van Tien',
    'on',
    '2022-12-17 13:58:55',
    '2022-12-17 13:58:55'
  );

INSERT INTO
  map_ws_dev_2.adm_vehicle (
    engineHours,
    engineId,
    engineType,
    model,
    height,
    `length`,
    width,
    odometer,
    plate,
    tonnage,
    image,
    description,
    status,
    createdAt,
    updatedAt
  )
VALUES
  (
    '1082730',
    'edaHFt4ZTu',
    'Petrol',
    'The Mammoth from New Way',
    2800.0,
    7270.0,
    2555.0,
    324393.0,
    '30E-96169',
    12550.0,
    'vehicle_1671289194156.jpg',
    '',
    'breakdown',
    '2022-12-17 14:59:54',
    '2022-12-17 20:44:30'
  );

INSERT INTO
  map_ws_dev_2.sup_vehicle_position (latitude, longitude, vehicleId, createdAt, updatedAt)
VALUES
  (
    21.021474,
    105.850632,
    1,
    '2022-12-17 14:59:54',
    '2022-12-17 14:59:54'
  );

INSERT INTO
  map_ws_dev_2.sup_vehicle_trouble (
    latitude,
    longitude,
    altitude,
    speed,
    angle,
    fuel,
    trouble,
    description,
    status,
    vehicleId,
    driverId,
    createdAt,
    updatedAt
  )
VALUES
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 19:58:38',
    '2022-12-17 19:58:38'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:05:02',
    '2022-12-17 20:05:02'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:05:24',
    '2022-12-17 20:05:24'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:05:26',
    '2022-12-17 20:05:26'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:05:26',
    '2022-12-17 20:05:26'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:05:39',
    '2022-12-17 20:05:39'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:08:48',
    '2022-12-17 20:08:48'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:09:28',
    '2022-12-17 20:09:28'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:13:24',
    '2022-12-17 20:13:24'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:14:03',
    '2022-12-17 20:14:03'
  );

INSERT INTO
  map_ws_dev_2.sup_vehicle_trouble (
    latitude,
    longitude,
    altitude,
    speed,
    angle,
    fuel,
    trouble,
    description,
    status,
    vehicleId,
    driverId,
    createdAt,
    updatedAt
  )
VALUES
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:15:05',
    '2022-12-17 20:15:05'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:16:14',
    '2022-12-17 20:16:14'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:19:31',
    '2022-12-17 20:19:31'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:19:37',
    '2022-12-17 20:19:37'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:21:22',
    '2022-12-17 20:21:22'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:23:36',
    '2022-12-17 20:23:36'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:24:52',
    '2022-12-17 20:24:52'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:25:06',
    '2022-12-17 20:25:06'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:25:58',
    '2022-12-17 20:25:58'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:26:28',
    '2022-12-17 20:26:28'
  );

INSERT INTO
  map_ws_dev_2.sup_vehicle_trouble (
    latitude,
    longitude,
    altitude,
    speed,
    angle,
    fuel,
    trouble,
    description,
    status,
    vehicleId,
    driverId,
    createdAt,
    updatedAt
  )
VALUES
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:26:42',
    '2022-12-17 20:26:42'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:27:03',
    '2022-12-17 20:27:03'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:27:08',
    '2022-12-17 20:27:08'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:27:11',
    '2022-12-17 20:27:11'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:27:11',
    '2022-12-17 20:27:11'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:27:38',
    '2022-12-17 20:27:38'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:30:06',
    '2022-12-17 20:30:06'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:30:20',
    '2022-12-17 20:30:20'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:30:21',
    '2022-12-17 20:30:21'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:30:53',
    '2022-12-17 20:30:53'
  );

INSERT INTO
  map_ws_dev_2.sup_vehicle_trouble (
    latitude,
    longitude,
    altitude,
    speed,
    angle,
    fuel,
    trouble,
    description,
    status,
    vehicleId,
    driverId,
    createdAt,
    updatedAt
  )
VALUES
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:31:10',
    '2022-12-17 20:31:10'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:32:07',
    '2022-12-17 20:32:07'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:33:18',
    '2022-12-17 20:33:18'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:35:36',
    '2022-12-17 20:35:36'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:35:47',
    '2022-12-17 20:35:47'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:36:27',
    '2022-12-17 20:36:27'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:37:14',
    '2022-12-17 20:37:14'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:44:03',
    '2022-12-17 20:44:03'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:44:21',
    '2022-12-17 20:44:21'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:44:28',
    '2022-12-17 20:44:28'
  );

INSERT INTO
  map_ws_dev_2.sup_vehicle_trouble (
    latitude,
    longitude,
    altitude,
    speed,
    angle,
    fuel,
    trouble,
    description,
    status,
    vehicleId,
    driverId,
    createdAt,
    updatedAt
  )
VALUES
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:44:28',
    '2022-12-17 20:44:28'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:44:28',
    '2022-12-17 20:44:28'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:44:28',
    '2022-12-17 20:44:28'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:44:28',
    '2022-12-17 20:44:28'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:44:29',
    '2022-12-17 20:44:29'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:44:29',
    '2022-12-17 20:44:29'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:44:29',
    '2022-12-17 20:44:29'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:44:29',
    '2022-12-17 20:44:29'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:44:29',
    '2022-12-17 20:44:29'
  ),
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:44:29',
    '2022-12-17 20:44:29'
  );

INSERT INTO
  map_ws_dev_2.sup_vehicle_trouble (
    latitude,
    longitude,
    altitude,
    speed,
    angle,
    fuel,
    trouble,
    description,
    status,
    vehicleId,
    driverId,
    createdAt,
    updatedAt
  )
VALUES
  (
    21.021474,
    105.850632,
    123.0,
    123.0,
    90.0,
    102.0,
    'car puncture',
    'car puncture',
    'breakdown',
    1,
    1,
    '2022-12-17 20:44:30',
    '2022-12-17 20:44:30'
  );

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */
;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */
;

/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */
;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */
;