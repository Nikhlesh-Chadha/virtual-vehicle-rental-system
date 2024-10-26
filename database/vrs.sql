-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.15 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for vrs
CREATE DATABASE IF NOT EXISTS `vrs` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `vrs`;

-- Dumping structure for table vrs.app2_employee
CREATE TABLE IF NOT EXISTS `app2_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `salary` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table vrs.app2_employee: ~2 rows (approximately)
/*!40000 ALTER TABLE `app2_employee` DISABLE KEYS */;
INSERT INTO `app2_employee` (`id`, `name`, `city`, `status`, `salary`) VALUES
	(1, 'BIPAN CHANDER DHYANI', 'Chandigarh', 1, 12000),
	(2, 'anuj', 'mumbai', 1, 20000);
/*!40000 ALTER TABLE `app2_employee` ENABLE KEYS */;

-- Dumping structure for table vrs.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vrs.auth_group: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Dumping structure for table vrs.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vrs.auth_group_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Dumping structure for table vrs.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

-- Dumping data for table vrs.auth_permission: ~45 rows (approximately)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can add permission', 2, 'add_permission'),
	(5, 'Can change permission', 2, 'change_permission'),
	(6, 'Can delete permission', 2, 'delete_permission'),
	(7, 'Can add group', 3, 'add_group'),
	(8, 'Can change group', 3, 'change_group'),
	(9, 'Can delete group', 3, 'delete_group'),
	(10, 'Can add user', 4, 'add_user'),
	(11, 'Can change user', 4, 'change_user'),
	(12, 'Can delete user', 4, 'delete_user'),
	(13, 'Can add content type', 5, 'add_contenttype'),
	(14, 'Can change content type', 5, 'change_contenttype'),
	(15, 'Can delete content type', 5, 'delete_contenttype'),
	(16, 'Can add session', 6, 'add_session'),
	(17, 'Can change session', 6, 'change_session'),
	(18, 'Can delete session', 6, 'delete_session'),
	(19, 'Can add cancelcharges', 7, 'add_cancelcharges'),
	(20, 'Can change cancelcharges', 7, 'change_cancelcharges'),
	(21, 'Can delete cancelcharges', 7, 'delete_cancelcharges'),
	(22, 'Can add user role', 8, 'add_userrole'),
	(23, 'Can change user role', 8, 'change_userrole'),
	(24, 'Can delete user role', 8, 'delete_userrole'),
	(25, 'Can add user', 9, 'add_user'),
	(26, 'Can change user', 9, 'change_user'),
	(27, 'Can delete user', 9, 'delete_user'),
	(28, 'Can add booking', 10, 'add_booking'),
	(29, 'Can change booking', 10, 'change_booking'),
	(30, 'Can delete booking', 10, 'delete_booking'),
	(31, 'Can add vehicle_company', 11, 'add_vehicle_company'),
	(32, 'Can change vehicle_company', 11, 'change_vehicle_company'),
	(33, 'Can delete vehicle_company', 11, 'delete_vehicle_company'),
	(34, 'Can add vehicle_types', 12, 'add_vehicle_types'),
	(35, 'Can change vehicle_types', 12, 'change_vehicle_types'),
	(36, 'Can delete vehicle_types', 12, 'delete_vehicle_types'),
	(37, 'Can add vehicles', 13, 'add_vehicles'),
	(38, 'Can change vehicles', 13, 'change_vehicles'),
	(39, 'Can delete vehicles', 13, 'delete_vehicles'),
	(40, 'Can add employee', 14, 'add_employee'),
	(41, 'Can change employee', 14, 'change_employee'),
	(42, 'Can delete employee', 14, 'delete_employee'),
	(43, 'Can add student', 15, 'add_student'),
	(44, 'Can change student', 15, 'change_student'),
	(45, 'Can delete student', 15, 'delete_student');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Dumping structure for table vrs.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table vrs.auth_user: ~4 rows (approximately)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$100000$7jQAqpy43QHe$LnpBh3lp8ZgLRAwpEeprgxYE8J34+8ePFP08WtVgCeU=', '2018-04-14 08:31:42', 1, 'ramandeep', '', '', 'rk170195@gmail.com', 1, 1, '2018-04-14 08:30:19'),
	(2, 'pbkdf2_sha256$100000$cQlRkwAMkAJB$PcooZ+5aal5N2ihX4c/hspop7hdFD3airKpnsbX4Hko=', '2020-03-18 06:56:49', 1, 'ankit', '', '', 'ank@gmail.com', 1, 1, '2020-03-18 06:55:55'),
	(4, 'pbkdf2_sha256$100000$J6UtuC9ArkHr$R3M2grkrZzpewLxNJ9KQ1gkI39B1ptqt00HP2TuneB8=', NULL, 0, 'arjun', 'Anurag', 'Dhyani', '', 0, 1, '2020-03-18 07:45:42'),
	(5, 'pbkdf2_sha256$100000$bxlft0Qwr04X$vkKShDM9Oj3wkpGOHgjF0IgFvrEuEzmQmYQj8CBliJw=', '2020-09-15 08:23:12', 1, 'aditi', '', '', 'any123@gmail.com', 1, 1, '2020-09-15 08:11:50');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Dumping structure for table vrs.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vrs.auth_user_groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Dumping structure for table vrs.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vrs.auth_user_user_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Dumping structure for table vrs.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table vrs.django_admin_log: ~2 rows (approximately)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2020-03-18 06:57:27', '1', 'employee object (1)', 1, '[{"added": {}}]', 14, 2),
	(2, '2020-03-19 06:54:52', '2', 'employee object (2)', 1, '[{"added": {}}]', 14, 2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Dumping structure for table vrs.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumping data for table vrs.django_content_type: ~15 rows (approximately)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(14, 'app2', 'employee'),
	(15, 'app2', 'student'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(6, 'sessions', 'session'),
	(13, 'staff', 'vehicles'),
	(11, 'staff', 'vehicle_company'),
	(12, 'staff', 'vehicle_types'),
	(10, 'users', 'booking'),
	(7, 'users', 'cancelcharges'),
	(9, 'users', 'user'),
	(8, 'users', 'userrole');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Dumping structure for table vrs.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Dumping data for table vrs.django_migrations: ~25 rows (approximately)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2018-05-10 10:10:06'),
	(2, 'auth', '0001_initial', '2018-05-10 10:10:10'),
	(3, 'admin', '0001_initial', '2018-05-10 10:10:10'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2018-05-10 10:10:11'),
	(5, 'contenttypes', '0002_remove_content_type_name', '2018-05-10 10:10:11'),
	(6, 'auth', '0002_alter_permission_name_max_length', '2018-05-10 10:10:12'),
	(7, 'auth', '0003_alter_user_email_max_length', '2018-05-10 10:10:12'),
	(8, 'auth', '0004_alter_user_username_opts', '2018-05-10 10:10:12'),
	(9, 'auth', '0005_alter_user_last_login_null', '2018-05-10 10:10:12'),
	(10, 'auth', '0006_require_contenttypes_0002', '2018-05-10 10:10:12'),
	(11, 'auth', '0007_alter_validators_add_error_messages', '2018-05-10 10:10:12'),
	(12, 'auth', '0008_alter_user_username_max_length', '2018-05-10 10:10:13'),
	(13, 'auth', '0009_alter_user_last_name_max_length', '2018-05-10 10:10:14'),
	(14, 'sessions', '0001_initial', '2018-05-10 10:10:14'),
	(15, 'staff', '0001_initial', '2018-05-10 10:10:15'),
	(16, 'staff', '0002_vehicles_vehicle_isavaliable', '2018-05-10 10:10:15'),
	(17, 'staff', '0003_vehicles_u_email', '2018-05-10 10:10:16'),
	(18, 'users', '0001_initial', '2018-05-10 10:10:19'),
	(19, 'users', '0002_booking_booking_iscancel', '2018-05-10 10:10:19'),
	(20, 'users', '0003_cancelcharges', '2018-05-10 10:10:20'),
	(21, 'users', '0004_auto_20180503_1145', '2018-05-10 10:10:20'),
	(22, 'users', '0005_user_con_password', '2018-05-10 10:10:20'),
	(23, 'users', '0006_remove_user_con_password', '2018-05-10 10:10:21'),
	(24, 'staff', '0004_auto_20180510_1605', '2018-05-10 10:35:21'),
	(25, 'app2', '0001_initial', '2020-03-18 06:46:45');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Dumping structure for table vrs.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vrs.django_session: ~4 rows (approximately)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('99n2px43807zvbuy9ffll6zjls11x68m', 'NDFiMzYyNzJiMjljNTg3YjY1ZWYyODQ2ZWM4OTA3MzEzNGRjMjQzMDp7InVzZXJfbmFtZSI6InJhbWFuZGVlcCIsInBhc3N3b3JkIjoiMTIzIiwicm9sZWlkIjozLCJlbWFpbGlkIjoiYW5raXRkaHlhbmlAZ21haWwuY29tIiwiYXV0aGVudGljYXRlZCI6ZmFsc2UsInVzZXJfaW1hZ2UiOiJkZW1vMS5qcGcifQ==', '2018-10-02 06:07:49'),
	('9z2hbk70tpitbjdzwc7r8ngbpqv1918q', 'NDRiZDM4OWUzMTNlODdhNWVlYWU2ZWUwMDEyYjhiMjIxYjZlZGI5Nzp7InJvbGVpZCI6NCwicGFzc3dvcmQiOiIxMjM0IiwiZW1haWxpZCI6ImRhbGppdHNpbmdobmV0bWF4QGdtYWlsLmNvbSIsImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX25hbWUiOiJkYWxqaXQiLCJ1c2VyX2ltYWdlIjoiY2FyMi5qcGcifQ==', '2018-06-10 07:36:43'),
	('guf9dfbjz4py20jytu23y2l9pywhern9', 'OWMwNzM4ODJmZjE4NzA4NjkzNzY0ODVmMDYwYzFhOWM2Nzc0ZDcyMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiJhZjQzZGEyZTdlNjA5YTdiMDViNDQwOGMwODg2Y2U4Y2EzNzMwZjlhIn0=', '2020-04-01 06:56:49'),
	('i8y45olm8qr8i9itm0c502hwflx23fhp', 'NGIyNjI5MGZiMjNhOTJjNjM0YzA2Y2Q1OTY0MTYzZjJjYWE4MTMxZDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc3OGNhM2MyYTQ4MWE1ZWQzMzkwMWMxN2ZjZDY1YTk0YzBmMWRiNTAiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2020-09-29 08:23:12');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Dumping structure for table vrs.staff_vehicles
CREATE TABLE IF NOT EXISTS `staff_vehicles` (
  `vehicle_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_name` varchar(255) NOT NULL,
  `vehicle_description` varchar(255) NOT NULL,
  `vehicle_image` varchar(255) DEFAULT NULL,
  `vehicles_isactive` tinyint(1) NOT NULL,
  `company_id_id` int(11) NOT NULL,
  `type_id_id` int(11) NOT NULL,
  `vehicle_isavaliable` tinyint(1) NOT NULL,
  `u_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vehicle_id`),
  KEY `staff_vehicles_company_id_id_96fb7ad4_fk_staff_veh` (`company_id_id`),
  KEY `staff_vehicles_type_id_id_f51c9e69_fk_staff_veh` (`type_id_id`),
  CONSTRAINT `staff_vehicles_company_id_id_96fb7ad4_fk_staff_veh` FOREIGN KEY (`company_id_id`) REFERENCES `staff_vehicle_company` (`company_id`),
  CONSTRAINT `staff_vehicles_type_id_id_f51c9e69_fk_staff_veh` FOREIGN KEY (`type_id_id`) REFERENCES `staff_vehicle_types` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table vrs.staff_vehicles: ~4 rows (approximately)
/*!40000 ALTER TABLE `staff_vehicles` DISABLE KEYS */;
INSERT INTO `staff_vehicles` (`vehicle_id`, `vehicle_name`, `vehicle_description`, `vehicle_image`, `vehicles_isactive`, `company_id_id`, `type_id_id`, `vehicle_isavaliable`, `u_email`) VALUES
	(1, 'audi', 'abs', 'b.jpg', 1, 2, 1, 1, 'ad@gmail.com'),
	(5, 'swift', 'dddd', 'car.jpg', 1, 1, 1, 1, 'ad@gmail.com'),
	(7, 'thar', 'ddd', 'a.jpg', 1, 1, 2, 1, 'ad@gmail.com'),
	(8, 'toyota', 'four wheeler', 'rect.png', 0, 1, 1, 1, 'adi@gmail.com');
/*!40000 ALTER TABLE `staff_vehicles` ENABLE KEYS */;

-- Dumping structure for table vrs.staff_vehicle_company
CREATE TABLE IF NOT EXISTS `staff_vehicle_company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL,
  `company_isactive` tinyint(1) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table vrs.staff_vehicle_company: ~6 rows (approximately)
/*!40000 ALTER TABLE `staff_vehicle_company` DISABLE KEYS */;
INSERT INTO `staff_vehicle_company` (`company_id`, `company_name`, `company_isactive`) VALUES
	(1, 'honda', 1),
	(2, 'maruti', 1),
	(3, 'skoda', 1),
	(4, 'hyundai', 1),
	(5, 'Nissan', 1),
	(6, 'toyota', 1);
/*!40000 ALTER TABLE `staff_vehicle_company` ENABLE KEYS */;

-- Dumping structure for table vrs.staff_vehicle_types
CREATE TABLE IF NOT EXISTS `staff_vehicle_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  `type_price` int(11) NOT NULL,
  `type_isactive` tinyint(1) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table vrs.staff_vehicle_types: ~3 rows (approximately)
/*!40000 ALTER TABLE `staff_vehicle_types` DISABLE KEYS */;
INSERT INTO `staff_vehicle_types` (`type_id`, `type_name`, `type_price`, `type_isactive`) VALUES
	(1, 'Sport utility vehicle', 20000, 1),
	(2, 'Sedan', 30000, 1),
	(5, 'Hatchback', 40000, 1);
/*!40000 ALTER TABLE `staff_vehicle_types` ENABLE KEYS */;

-- Dumping structure for table vrs.users_booking
CREATE TABLE IF NOT EXISTS `users_booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_startdate` varchar(255) NOT NULL,
  `booking_enddate` varchar(255) NOT NULL,
  `pickup_point` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `reviews` varchar(255) DEFAULT NULL,
  `booking_isactive` tinyint(1) NOT NULL,
  `user_email_id` varchar(255) NOT NULL,
  `vehicle_id_id` int(11) NOT NULL,
  `booking_iscancel` tinyint(1) NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `users_booking_user_email_id_a31fca38_fk_users_user_user_email` (`user_email_id`),
  KEY `users_booking_vehicle_id_id_5c1c0211_fk_staff_veh` (`vehicle_id_id`),
  CONSTRAINT `users_booking_user_email_id_a31fca38_fk_users_user_user_email` FOREIGN KEY (`user_email_id`) REFERENCES `users_user` (`user_email`),
  CONSTRAINT `users_booking_vehicle_id_id_5c1c0211_fk_staff_veh` FOREIGN KEY (`vehicle_id_id`) REFERENCES `staff_vehicles` (`vehicle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table vrs.users_booking: ~1 rows (approximately)
/*!40000 ALTER TABLE `users_booking` DISABLE KEYS */;
INSERT INTO `users_booking` (`booking_id`, `booking_startdate`, `booking_enddate`, `pickup_point`, `location`, `reviews`, `booking_isactive`, `user_email_id`, `vehicle_id_id`, `booking_iscancel`) VALUES
	(1, '2018-05-23', '2018-05-17', 'sector 41-a', 'chandigarh', NULL, 1, 'h@gmail.com', 1, 1);
/*!40000 ALTER TABLE `users_booking` ENABLE KEYS */;

-- Dumping structure for table vrs.users_cancelcharges
CREATE TABLE IF NOT EXISTS `users_cancelcharges` (
  `cancel_id` int(11) NOT NULL AUTO_INCREMENT,
  `pending_charges` int(11) NOT NULL,
  `cancel_isactive` tinyint(1) NOT NULL,
  `booking_id_id` int(11) NOT NULL,
  `user_email_id` varchar(255) NOT NULL,
  PRIMARY KEY (`cancel_id`),
  KEY `users_cancelcharges_booking_id_id_aff3b300_fk_users_boo` (`booking_id_id`),
  KEY `users_cancelcharges_user_email_id_572983c1_fk_users_use` (`user_email_id`),
  CONSTRAINT `users_cancelcharges_booking_id_id_aff3b300_fk_users_boo` FOREIGN KEY (`booking_id_id`) REFERENCES `users_booking` (`booking_id`),
  CONSTRAINT `users_cancelcharges_user_email_id_572983c1_fk_users_use` FOREIGN KEY (`user_email_id`) REFERENCES `users_user` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table vrs.users_cancelcharges: ~1 rows (approximately)
/*!40000 ALTER TABLE `users_cancelcharges` DISABLE KEYS */;
INSERT INTO `users_cancelcharges` (`cancel_id`, `pending_charges`, `cancel_isactive`, `booking_id_id`, `user_email_id`) VALUES
	(1, 10000, 1, 1, 'h@gmail.com');
/*!40000 ALTER TABLE `users_cancelcharges` ENABLE KEYS */;

-- Dumping structure for table vrs.users_user
CREATE TABLE IF NOT EXISTS `users_user` (
  `user_name` varchar(255) NOT NULL,
  `user_password` varchar(500) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_mobile` varchar(255) NOT NULL,
  `user_dob` varchar(255) NOT NULL,
  `user_image` varchar(255) DEFAULT NULL,
  `user_isactive` tinyint(1) NOT NULL,
  `user_roleid_id` int(11) NOT NULL,
  PRIMARY KEY (`user_email`),
  KEY `users_user_user_roleid_id_4869697b_fk_users_userrole_role_id` (`user_roleid_id`),
  CONSTRAINT `users_user_user_roleid_id_4869697b_fk_users_userrole_role_id` FOREIGN KEY (`user_roleid_id`) REFERENCES `users_userrole` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vrs.users_user: ~15 rows (approximately)
/*!40000 ALTER TABLE `users_user` DISABLE KEYS */;
INSERT INTO `users_user` (`user_name`, `user_password`, `user_email`, `user_mobile`, `user_dob`, `user_image`, `user_isactive`, `user_roleid_id`) VALUES
	('Ad', 'pbkdf2_sha256$100000$AvjcUS1n5Nfg$F4C9EH2Yp0iSpUZlMcvSIqkLjO9o8Fkql0HKxScxAIc=', 'ad@gmail.com', '1234567891', '1995-07-03', 'eclipse.png', 1, 1),
	('aditya', 'pbkdf2_sha256$100000$85hpkwBCPe85$CQn0CZKWGqUnvRqlfY5hl90FhI/tykWnvLt/Kwu7jZE=', 'adi@gmail.com', '9878988879', '1991-10-02', 'rect.png', 1, 1),
	('Ad', 'pbkdf2_sha256$100000$aBvdGMUH6yjN$8QTcCvx4pPg6psC+XRyfV/TLM0oXO0HXO6NeYorIOXY=', 'aman@gmail.com', '8976789598', '12-4-1997', 'saampleimage1.jpg', 1, 4),
	('aniket', 'pbkdf2_sha256$100000$KIDedw7sJlUY$9ISPoeHC2p8zORJaJpqyxYgJxGSSMW0poFw9dkwfuGc=', 'anke@gmail.com', '1234567891', '1994-04-17', 'rect.png', 1, 1),
	('ramandeep', 'pbkdf2_sha256$100000$CokapqFBn949$DNYTiPxDgQ0a4Af+q+zZo5rFX5xOAfhRdMH/q7KUEqo=', 'ankitdhyani@gmail.com', '8764523456', '17-01-95', 'demo1.jpg', 1, 3),
	('anurag Dhyani', 'pbkdf2_sha256$100000$7OUUvklIM976$QLti0a6GEiBEHO2fllsjCSu/SyXpIo9SEqnJORdAybs=', 'anuragd66@gmail.com', '9501205660', '2-4-1996', 'rect.png', 1, 4),
	('BCD', 'pbkdf2_sha256$100000$sqhWrawvqP2b$dZry5vkXY1LNCoVC6lNDVSGJKhAkVPeScTDeak+90PU=', 'bcdhyani62@gmail.com', '7869938389', '15-11-1964', 'rect.png', 1, 4),
	('daljit', 'pbkdf2_sha256$100000$GO34xZkO586U$coEEfBR1ZFgk+vtm1OgzkxbrCDV7znUyQr3Fkyl+/kY=', 'daljitsinghnetmax@gmail.com', '8427857530', '1987-01-12', 'car2.jpg', 1, 4),
	('gaurav', 'pbkdf2_sha256$100000$EQtaDoh3U4MQ$ZLjS6GH6rWSu/bI8AftGkmu7oItEFU1CSam9ynBKiJE=', 'gaurav@gmail.com', '9464116566', '1947-11-10', 'saampleimage1.jpg', 1, 1),
	('harman', 'pbkdf2_sha256$100000$xyO9kW4jJyO7$oLFQJlYnhz4yq3ryOId7tprsgCaNWHptCno9uiT36Js=', 'h@gmail.com', '98764523564', '12-01-87', 'car5.jpg', 1, 2),
	('jason', 'pbkdf2_sha256$100000$DCuvhjPE46nV$86+jEBR4fPi5JwiesKIsuUmVNakgw0MjBJ4/Lrc6gZk=', 'kulwinderkaur1694@gmail.com', '9876543210', '2018-05-05', 'Untitled.png', 1, 1),
	('payal', 'pbkdf2_sha256$100000$CokapqFBn949$DNYTiPxDgQ0a4Af+q+zZo5rFX5xOAfhRdMH/q7KUEqo=', 'p@gmail.com', '98764523564', '2018-04-10', 'demo1.jpg', 1, 1),
	('kulveer', 'pbkdf2_sha256$100000$qgovLSnlY7DU$3ot1GoPZzY224CYGGHDD2jcbboCeoav5LTdBQQagBrQ=', 'payalmonga1995@gmail.com', '98764523564', '12-01-87', 'car4.jpg', 1, 4),
	('radhika', 'pbkdf2_sha256$100000$ktc6yY8tJLHO$L3fpaEiyno9S7/ecAd1eaSiYm/7bl1EQ24/xy3YCEjA=', 'radhika@gmail.com', '98764523564', '12-01-87', 'demo1.jpg', 1, 4),
	('Ketan', 'pbkdf2_sha256$100000$X0TfmfS3aqKB$EJ5/eTP5SKIl/h1Ky9fPq51vkObjWS6U5eAuVpqvM+8=', 'sabiketan55@gmail.com', '9464320619', '20-01-1997', 'eclipse.png', 1, 4);
/*!40000 ALTER TABLE `users_user` ENABLE KEYS */;

-- Dumping structure for table vrs.users_userrole
CREATE TABLE IF NOT EXISTS `users_userrole` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table vrs.users_userrole: ~4 rows (approximately)
/*!40000 ALTER TABLE `users_userrole` DISABLE KEYS */;
INSERT INTO `users_userrole` (`role_id`, `role_name`) VALUES
	(1, 'bussinessuser'),
	(3, 'company'),
	(2, 'customer'),
	(4, 'staff');
/*!40000 ALTER TABLE `users_userrole` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
