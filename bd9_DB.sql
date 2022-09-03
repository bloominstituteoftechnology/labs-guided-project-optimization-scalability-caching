-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.23 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for bd9_db
CREATE DATABASE IF NOT EXISTS `bd9_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd9_db`;

-- Dumping structure for table bd9_db.course
CREATE TABLE IF NOT EXISTS `course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `instructor_id` bigint NOT NULL,
  `description` text,
  `module_count` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_course_user` (`instructor_id`),
  CONSTRAINT `FK_course_user` FOREIGN KEY (`instructor_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table bd9_db.course: ~3 rows (approximately)
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` (`id`, `name`, `instructor_id`, `description`, `module_count`) VALUES
	(1, 'BMC1: Beginners', 2, 'Yoga for Beginners guide gives you all the tips, guidelines, and recommendations you will need to start a successful yoga practice. Yoga is in no way exclusive—being able to practice yoga does not matter how old you are, how much you weigh, what you do for a living, where you live or what religion you practice. Yoga is accessible for just about everyone.', 3),
	(2, 'BMC2: Body Chakras', 3, 'The entire universe is made of energy, and your body is no exception. The 7 chakras play an important role in the balance and health of our bodies. Long before modern technology and science, ancient cultures knew that all living things carried a life force with them. They called the centers of energy that moved inside of us the 7 chakras.', 3),
	(3, 'BMC3: Meditation', 2, 'Meditation isn’t about becoming a different person, a new person, or even a better person. It’s about training in awareness and getting a healthy sense of perspective. You’re not trying to turn off your thoughts or feelings. You’re learning to observe them without judgment. And eventually, you may start to better understand them as well.', 4),
	(4, 'BMC4: Yoga for Health', 4, 'Yoga is a practice that connects the body, breath, and mind. It uses physical postures, breathing exercises, and meditation to improve overall health.', 6),
	(5, 'BMC5: Yoga for Self Love', 3, 'Yoga is an internal journey of self-discovery, an opportunity to connect with your true self on a deeper level. At its core, it is about developing a deep reverence and pure love for your body temple as it houses your conscious spirit. In this way yoga is a beautiful practice for those who suffer from low self-esteem, anxiety and depression as it slowly and lovingly allows a holistic way to heal these emotions from the inside out.', 4);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;

-- Dumping structure for table bd9_db.course_student
CREATE TABLE IF NOT EXISTS `course_student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `student_id` bigint NOT NULL,
  `course_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_cs` (`student_id`,`course_id`),
  KEY `fk_course_cs` (`course_id`),
  CONSTRAINT `fk_course_cs` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_course_student_user` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table bd9_db.course_student: ~4 rows (approximately)
/*!40000 ALTER TABLE `course_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_student` ENABLE KEYS */;

-- Dumping structure for table bd9_db.databasechangelog
CREATE TABLE IF NOT EXISTS `databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table bd9_db.databasechangelog: ~5 rows (approximately)
/*!40000 ALTER TABLE `databasechangelog` DISABLE KEYS */;
INSERT INTO `databasechangelog` (`ID`, `AUTHOR`, `FILENAME`, `DATEEXECUTED`, `ORDEREXECUTED`, `EXECTYPE`, `MD5SUM`, `DESCRIPTION`, `COMMENTS`, `TAG`, `LIQUIBASE`, `CONTEXTS`, `LABELS`, `DEPLOYMENT_ID`) VALUES
	('1', 'sha', 'db/changelog/db.changelog-1.0.xml', '2019-11-02 16:10:43', 1, 'EXECUTED', '8:29d064df9b36396f212374eaece0c73e', 'sql', '', NULL, '3.6.3', NULL, NULL, '2725442872'),
	('2', 'sha', 'db/changelog/db.changelog-1.0.xml', '2019-11-02 16:10:43', 2, 'EXECUTED', '8:9e5952ea1d112351ffe8b87cdb8eb7ea', 'sql', '', NULL, '3.6.3', NULL, NULL, '2725442872'),
	('3', 'sha', 'db/changelog/db.changelog-1.0.xml', '2019-11-02 16:10:43', 3, 'EXECUTED', '8:b99dcc831771f6e8c189d60774888f79', 'sql', '', NULL, '3.6.3', NULL, NULL, '2725442872'),
	('4', 'sha', 'db/changelog/db.changelog-1.0.xml', '2019-11-02 16:10:43', 4, 'EXECUTED', '8:966f5dd9f96f5db7300710de1a14b11c', 'sql', '', NULL, '3.6.3', NULL, NULL, '2725442872'),
	('5', 'sha', 'db/changelog/db.changelog-1.0.xml', '2019-11-02 16:10:43', 5, 'EXECUTED', '8:9e8476578081358138f8681c78fc0385', 'sql', '', NULL, '3.6.3', NULL, NULL, '2725442872');
/*!40000 ALTER TABLE `databasechangelog` ENABLE KEYS */;

-- Dumping structure for table bd9_db.databasechangeloglock
CREATE TABLE IF NOT EXISTS `databasechangeloglock` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table bd9_db.databasechangeloglock: ~0 rows (approximately)
/*!40000 ALTER TABLE `databasechangeloglock` DISABLE KEYS */;
INSERT INTO `databasechangeloglock` (`ID`, `LOCKED`, `LOCKGRANTED`, `LOCKEDBY`) VALUES
	(1, b'0', NULL, NULL);
/*!40000 ALTER TABLE `databasechangeloglock` ENABLE KEYS */;

-- Dumping structure for table bd9_db.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `user_description` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `mobile` bigint DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zipcode` bigint DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table bd9_db.user: ~0 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `name`, `password`, `role`, `user_description`, `first_name`, `last_name`, `gender`, `mobile`, `city`, `state`, `zipcode`, `country`, `address`) VALUES
	(2, 'bruce', 'Bruce Wayne', '$2a$10$MORPM68jTu7prh5FtmI.D.unluBQ/3G2wKeakd7Syy.4HCryMgD8O', 'TEACHER', '', 'Bruce', 'Wayne', '', NULL, 'maryland', '', 20740, 'USA', 'college park'),
	(3, 'clark', 'Clark Kent', '$2a$10$MORPM68jTu7prh5FtmI.D.unluBQ/3G2wKeakd7Syy.4HCryMgD8O', 'TEACHER', 'Live life to the fullest', 'Clark', 'Kent', '', NULL, 'Metropolis', '', 20740, 'USA', 'college'),
	(4, 'diana', 'Dian', '$2a$10$MORPM68jTu7prh5FtmI.D.unluBQ/3G2wKeakd7Syy.4HCryMgD8O', 'TEACHER', 'Women empowerment', 'Dian', '', '', NULL, 'Themyscira ', '', 20740, 'USA', 'college');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
