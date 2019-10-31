/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.27-0ubuntu0.16.04.1 : Database - step-app
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`step-app` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `step-app`;

/*Table structure for table `access_tokens` */

DROP TABLE IF EXISTS `access_tokens`;

CREATE TABLE `access_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_time` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `access_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `access_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `access_tokens` */

insert  into `access_tokens`(`id`,`user_id`,`access_token`,`expiry_time`,`created_at`,`updated_at`,`deleted_at`) values (1,7,'27AdjVhVSqAbp4tZ1571141201','1602677201','2019-10-15 11:46:28','2019-10-15 12:06:41',NULL),(2,8,'4revrsXNYgyvOGPp1571319128','1602855128','2019-10-16 10:32:51','2019-10-17 13:32:08',NULL),(3,9,'TjhLUba8ONuf7iOs1571223307','1602759307','2019-10-16 10:55:07','2019-10-16 10:55:07',NULL),(4,10,'YObtY8GQJTM1V1PP1571223458','1602759458','2019-10-16 10:57:38','2019-10-16 10:57:38',NULL),(5,11,'B85w2neOyIBMgzVY1571223677','1602759677','2019-10-16 11:01:17','2019-10-16 11:01:17',NULL),(6,12,'8GCZqciEJGrHTI5O1571223900','1602759900','2019-10-16 11:05:00','2019-10-16 11:05:00',NULL);

/*Table structure for table `app_users` */

DROP TABLE IF EXISTS `app_users`;

CREATE TABLE `app_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_notify` tinyint(1) DEFAULT NULL,
  `is_paid` int(11) NOT NULL DEFAULT '0',
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `app_users` */

insert  into `app_users`(`id`,`first_name`,`last_name`,`email`,`password`,`photo`,`device_token`,`platform_type`,`platform_id`,`image_url`,`reset_token`,`is_notify`,`is_paid`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values (6,'Qirat','Merchant','qmerchant251@yopmail.com','$2y$10$bb6tCmzF3y.HsHO7LFhYquB7Hdqm2sB3CnyXaOLd1/Wz/OGrMOwHe','uploads/0/2019-10/f1184599803905830ad311aa6fd5e741.jpg','test123','custom',NULL,NULL,NULL,NULL,0,1,'2019-10-15 11:45:05',NULL,NULL),(7,'Qirat','Merchant','qmerchant@yopmail.com','$2y$10$283ooXg7tmUtHwhvuXZT6O.kE0TKbCqsGhHquMHwq4hvHDEkQsVZO','uploads/0/2019-10/f1dc0e1d49a8ebb6a0ba37ee5313b710.jpg','no_token','custom',NULL,NULL,NULL,NULL,0,1,'2019-10-15 11:46:28','2019-10-15 12:05:53',NULL),(8,'Sajjad Hussain','Khokhar','sajjad.hussain@cubixlabs.com','123456789',NULL,'no_token','custom',NULL,NULL,NULL,1,0,1,'2019-10-16 10:32:51','2019-10-18 15:29:47',NULL),(9,'Sajjad Hussain','Khokhar','sajjad.hussain@cubixlabx.com','$2y$10$aWHkgiDjBRhqy86UCG3wpeMvwtXiO0DeOwgKCxfynC3Hh6zqE1TiO',NULL,'1234','custom',NULL,NULL,NULL,NULL,0,1,'2019-10-16 10:55:07',NULL,NULL),(10,'Sajjad Hussain','Khokhar','sajjad.hussain@cubixlsabx.com','$2y$10$t/wh1ALV772oNYeYqEfG/.PvuH2.8ejgnMBd8ky3gc5Joh/Ahi.yG',NULL,'1234','custom',NULL,NULL,NULL,NULL,0,1,'2019-10-16 10:57:38',NULL,NULL),(11,'Sajjad Hussain','Khokhar','sajjad.hussain@cubixlsab2x.com','$2y$10$qSEaH8C72nD2RIDojmy.cOhKbIb2UYrp4eE.gLz28fBtF8OSpCmXu',NULL,'1234','custom',NULL,NULL,NULL,NULL,0,1,'2019-10-16 11:01:17',NULL,NULL),(12,'Sajjad Hussain','Khokhar','sajjad.hussain@cubixlsabdd2x.com','$2y$10$y3UuIlHjKygdUacksCZ.EO.qfhhBipxsQRBpJ6AYxaj7m0r/oVbyW',NULL,'1234','custom',NULL,NULL,NULL,NULL,0,1,'2019-10-16 11:05:00',NULL,NULL);

/*Table structure for table `cms_apicustom` */

DROP TABLE IF EXISTS `cms_apicustom`;

CREATE TABLE `cms_apicustom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permalink` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tabel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aksi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kolom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderby` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_query_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sql_where` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `method_type` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` longtext COLLATE utf8mb4_unicode_ci,
  `responses` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_apicustom` */

insert  into `cms_apicustom`(`id`,`permalink`,`tabel`,`aksi`,`kolom`,`orderby`,`sub_query_1`,`sql_where`,`nama`,`keterangan`,`parameter`,`created_at`,`updated_at`,`method_type`,`parameters`,`responses`) values (1,'user_register','app_users','save_add',NULL,NULL,NULL,NULL,'User Register','<p>User App Registration</p>',NULL,NULL,NULL,'post','a:8:{i:0;a:5:{s:4:\"name\";s:10:\"first_name\";s:4:\"type\";s:12:\"alpha_spaces\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:1;a:5:{s:4:\"name\";s:9:\"last_name\";s:4:\"type\";s:12:\"alpha_spaces\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:2;a:5:{s:4:\"name\";s:5:\"email\";s:4:\"type\";s:6:\"unique\";s:6:\"config\";s:15:\"app_users,email\";s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:3;a:5:{s:4:\"name\";s:8:\"password\";s:4:\"type\";s:8:\"password\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:4;a:5:{s:4:\"name\";s:5:\"photo\";s:4:\"type\";s:5:\"image\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"1\";}i:5;a:5:{s:4:\"name\";s:12:\"device_token\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:6;a:5:{s:4:\"name\";s:13:\"platform_type\";s:4:\"type\";s:2:\"in\";s:6:\"config\";s:21:\"custom,facebook,gmail\";s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:7;a:5:{s:4:\"name\";s:11:\"platform_id\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"1\";}}','a:1:{i:0;a:4:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}}'),(2,'user_login','app_users','detail',NULL,NULL,NULL,NULL,'User Login','<p>User Authentication API<br></p>',NULL,NULL,NULL,'post','a:3:{i:0;a:5:{s:4:\"name\";s:5:\"email\";s:4:\"type\";s:5:\"email\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"0\";}i:1;a:5:{s:4:\"name\";s:8:\"password\";s:4:\"type\";s:8:\"password\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"0\";}i:2;a:5:{s:4:\"name\";s:12:\"device_token\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"0\";}}','a:0:{}'),(3,'user_login_social','app_users','save_add',NULL,NULL,NULL,NULL,'User Login - Social','<p>Login with Social Platforms (Facebook, Google)<br></p>',NULL,NULL,NULL,'post','a:7:{i:0;a:5:{s:4:\"name\";s:10:\"first_name\";s:4:\"type\";s:12:\"alpha_spaces\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:1;a:5:{s:4:\"name\";s:9:\"last_name\";s:4:\"type\";s:12:\"alpha_spaces\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:2;a:5:{s:4:\"name\";s:5:\"email\";s:4:\"type\";s:5:\"email\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:3;a:5:{s:4:\"name\";s:12:\"device_token\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:4;a:5:{s:4:\"name\";s:13:\"platform_type\";s:4:\"type\";s:2:\"in\";s:6:\"config\";s:14:\"facebook,gmail\";s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:5;a:5:{s:4:\"name\";s:11:\"platform_id\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:6;a:5:{s:4:\"name\";s:9:\"image_url\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"1\";}}','a:1:{i:0;a:4:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}}'),(4,'user_profile_update','app_users','save_edit',NULL,NULL,NULL,NULL,'User Profile Update','<p>Application User: Update Profile<br></p>',NULL,NULL,NULL,'post','a:4:{i:0;a:5:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:1;a:5:{s:4:\"name\";s:10:\"first_name\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"1\";}i:2;a:5:{s:4:\"name\";s:9:\"last_name\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"1\";}i:3;a:5:{s:4:\"name\";s:5:\"photo\";s:4:\"type\";s:5:\"image\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"1\";}}','a:1:{i:0;a:4:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}}'),(5,'user_exists_check_third_party','app_users','detail',NULL,NULL,NULL,NULL,'User Exists Check Third Party','<p>Check Third Party User Exists<br></p>',NULL,NULL,NULL,'get','a:2:{i:0;a:5:{s:4:\"name\";s:12:\"device_token\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"0\";}i:1;a:5:{s:4:\"name\";s:11:\"platform_id\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"0\";}}','a:1:{i:0;a:4:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}}'),(6,'user_delete','app_users','delete',NULL,NULL,NULL,NULL,'User Delete','<p>App User Delete</p>',NULL,NULL,NULL,'get','a:1:{i:0;a:5:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}}','a:1:{i:0;a:4:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}}'),(7,'user_get_profile_details','app_users','detail',NULL,NULL,NULL,NULL,'User Get Profile Details','<p>Get User Profile Details<br></p>',NULL,NULL,NULL,'get','a:1:{i:0;a:5:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}}','a:0:{}'),(8,'get_page','content_pages','detail',NULL,NULL,NULL,NULL,'Get Page','<p>Get Dynamic Page by Slug<br></p>',NULL,NULL,NULL,'get','a:1:{i:0;a:5:{s:4:\"name\";s:4:\"slug\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}}','a:0:{}'),(9,'user_logout','app_users','save_edit',NULL,NULL,NULL,NULL,'User Logout','<p>Application User Logout<br></p>',NULL,NULL,NULL,'post','a:0:{}','a:0:{}'),(10,'get_courses','courses','list',NULL,NULL,NULL,'is_active = 1','Get Courses','<p>Get All Active Courses</p>',NULL,NULL,NULL,'get','a:0:{}','a:4:{i:0;a:4:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:6:\"bigint\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:1;a:4:{s:4:\"name\";s:5:\"title\";s:4:\"type\";s:6:\"string\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:2;a:4:{s:4:\"name\";s:4:\"icon\";s:4:\"type\";s:5:\"image\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:3;a:4:{s:4:\"name\";s:13:\"audio_allowed\";s:4:\"type\";s:7:\"tinyint\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}}'),(11,'user_forgot_password','app_users','save_edit',NULL,NULL,NULL,NULL,'User Forgot Password','<p>Forgot Password Token Mail<br></p>',NULL,NULL,NULL,'post','a:1:{i:0;a:5:{s:4:\"name\";s:5:\"email\";s:4:\"type\";s:5:\"email\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}}','a:1:{i:0;a:4:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}}'),(12,'user_reset_password','app_users','save_edit',NULL,NULL,NULL,NULL,'User Reset Password','<p>Reset Password After Forgot Password<br></p>',NULL,NULL,NULL,'post','a:3:{i:0;a:5:{s:4:\"name\";s:4:\"code\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:1;a:5:{s:4:\"name\";s:8:\"password\";s:4:\"type\";s:8:\"password\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:2;a:5:{s:4:\"name\";s:6:\"resend\";s:4:\"type\";s:7:\"boolean\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}}','a:1:{i:0;a:4:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}}'),(13,'user_change_password','app_users','save_edit',NULL,NULL,NULL,NULL,'User Change Password','<p>Change App User Password<br></p>',NULL,NULL,NULL,'post','a:2:{i:0;a:5:{s:4:\"name\";s:8:\"password\";s:4:\"type\";s:8:\"password\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:1;a:5:{s:4:\"name\";s:12:\"old_password\";s:4:\"type\";s:8:\"password\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}}','a:1:{i:0;a:4:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}}'),(14,'get_course_lesson','lessons','list',NULL,NULL,NULL,NULL,'Get Course Lesson','<p>Get All Lessons of Specific Course.</p>',NULL,NULL,NULL,'get','a:1:{i:0;a:5:{s:4:\"name\";s:9:\"course_id\";s:4:\"type\";s:6:\"exists\";s:6:\"config\";s:10:\"courses,id\";s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}}','a:7:{i:0;a:4:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:6:\"bigint\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:1;a:4:{s:4:\"name\";s:9:\"course_id\";s:4:\"type\";s:7:\"integer\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:2;a:4:{s:4:\"name\";s:10:\"created_by\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:3;a:4:{s:4:\"name\";s:5:\"title\";s:4:\"type\";s:6:\"string\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:4;a:4:{s:4:\"name\";s:8:\"overview\";s:4:\"type\";s:6:\"string\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:5;a:4:{s:4:\"name\";s:7:\"content\";s:4:\"type\";s:8:\"longtext\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:6;a:4:{s:4:\"name\";s:9:\"is_active\";s:4:\"type\";s:7:\"tinyint\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}}'),(16,'lesson_reviews','reviews','save_add',NULL,NULL,NULL,NULL,'Lesson Reviews','<p>-- Lesson Reviews</p>',NULL,NULL,NULL,'post','a:3:{i:0;a:5:{s:4:\"name\";s:9:\"lesson_id\";s:4:\"type\";s:6:\"exists\";s:6:\"config\";s:10:\"lessons,id\";s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:1;a:5:{s:4:\"name\";s:6:\"rating\";s:4:\"type\";s:14:\"digits_between\";s:6:\"config\";s:3:\"1,5\";s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:2;a:5:{s:4:\"name\";s:6:\"review\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}}','a:7:{i:0;a:4:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:1;a:4:{s:4:\"name\";s:9:\"review_by\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:2;a:4:{s:4:\"name\";s:9:\"lesson_id\";s:4:\"type\";s:7:\"integer\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:3;a:4:{s:4:\"name\";s:6:\"rating\";s:4:\"type\";s:6:\"string\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:4;a:4:{s:4:\"name\";s:6:\"review\";s:4:\"type\";s:6:\"string\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:5;a:4:{s:4:\"name\";s:9:\"is_active\";s:4:\"type\";s:7:\"tinyint\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:6;a:4:{s:4:\"name\";s:7:\"comment\";s:4:\"type\";s:6:\"string\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}}'),(17,'quiz_list','quizzes','list',NULL,NULL,NULL,NULL,'Quiz List','<p>-- Quiz questions</p>',NULL,NULL,NULL,'get','a:1:{i:0;a:5:{s:4:\"name\";s:9:\"lesson_id\";s:4:\"type\";s:6:\"exists\";s:6:\"config\";s:10:\"lessons,id\";s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}}','a:4:{i:0;a:4:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:1;a:4:{s:4:\"name\";s:9:\"lesson_id\";s:4:\"type\";s:7:\"integer\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:2;a:4:{s:4:\"name\";s:8:\"question\";s:4:\"type\";s:6:\"string\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:3;a:4:{s:4:\"name\";s:9:\"is_active\";s:4:\"type\";s:7:\"tinyint\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}}'),(19,'quiz_result','quiz_result','save_add',NULL,NULL,NULL,NULL,'Quiz Result','<p>-- Quiz Results</p>',NULL,NULL,NULL,'post','a:8:{i:0;a:5:{s:4:\"name\";s:15:\"total_questions\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"1\";}i:1;a:5:{s:4:\"name\";s:9:\"attempted\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"1\";}i:2;a:5:{s:4:\"name\";s:7:\"correct\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"1\";}i:3;a:5:{s:4:\"name\";s:5:\"wrong\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"1\";}i:4;a:5:{s:4:\"name\";s:5:\"score\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"1\";}i:5;a:5:{s:4:\"name\";s:9:\"lesson_id\";s:4:\"type\";s:7:\"integer\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:6;a:5:{s:4:\"name\";s:7:\"user_id\";s:4:\"type\";s:6:\"exists\";s:6:\"config\";s:12:\"app_users,id\";s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:7;a:5:{s:4:\"name\";s:10:\"is_correct\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}}','a:9:{i:0;a:4:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:1;a:4:{s:4:\"name\";s:15:\"total_questions\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:2;a:4:{s:4:\"name\";s:9:\"attempted\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:3;a:4:{s:4:\"name\";s:7:\"correct\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:4;a:4:{s:4:\"name\";s:5:\"wrong\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:5;a:4:{s:4:\"name\";s:5:\"score\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:6;a:4:{s:4:\"name\";s:9:\"lesson_id\";s:4:\"type\";s:7:\"integer\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:7;a:4:{s:4:\"name\";s:7:\"quiz_id\";s:4:\"type\";s:7:\"integer\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:8;a:4:{s:4:\"name\";s:7:\"user_id\";s:4:\"type\";s:7:\"integer\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}}'),(21,'get_quiz_results','quiz_result','list',NULL,NULL,NULL,NULL,'Get Quiz Results','<p>-- Get Quiz Results</p>',NULL,NULL,NULL,'get','a:1:{i:0;a:5:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:6:\"exists\";s:6:\"config\";s:14:\"quiz_result,id\";s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}}','a:9:{i:0;a:4:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:1;a:4:{s:4:\"name\";s:15:\"total_questions\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:2;a:4:{s:4:\"name\";s:9:\"attempted\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:3;a:4:{s:4:\"name\";s:7:\"correct\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:4;a:4:{s:4:\"name\";s:5:\"wrong\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:5;a:4:{s:4:\"name\";s:5:\"score\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:6;a:4:{s:4:\"name\";s:9:\"lesson_id\";s:4:\"type\";s:7:\"integer\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:7;a:4:{s:4:\"name\";s:7:\"user_id\";s:4:\"type\";s:7:\"integer\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:8;a:4:{s:4:\"name\";s:6:\"status\";s:4:\"type\";s:6:\"string\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}}'),(22,'contact_us','contact_us','save_add',NULL,NULL,NULL,NULL,'Contact Us','<p>-- Contact Us</p>',NULL,NULL,NULL,'post','a:3:{i:0;a:5:{s:4:\"name\";s:4:\"name\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:1;a:5:{s:4:\"name\";s:5:\"email\";s:4:\"type\";s:5:\"email\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:2;a:5:{s:4:\"name\";s:7:\"message\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}}','a:4:{i:0;a:4:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:1;a:4:{s:4:\"name\";s:4:\"name\";s:4:\"type\";s:6:\"string\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:2;a:4:{s:4:\"name\";s:5:\"email\";s:4:\"type\";s:5:\"email\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:3;a:4:{s:4:\"name\";s:7:\"message\";s:4:\"type\";s:6:\"string\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}}'),(23,'terms_of_services','cms_settings','list',NULL,NULL,NULL,NULL,'Terms of Services','<p>-- Terms of services</p>',NULL,NULL,NULL,'get','a:0:{}','a:0:{}'),(24,'about_step_app','cms_settings','list',NULL,NULL,NULL,NULL,'About Step App','<p>-- About Step App</p>',NULL,NULL,NULL,'get','a:0:{}','a:0:{}'),(25,'faq','cms_settings','list',NULL,NULL,NULL,NULL,'FAQ','<p>-- FAQS</p>',NULL,NULL,NULL,'get','a:0:{}','a:0:{}'),(26,'change_password','app_users','save_edit',NULL,NULL,NULL,NULL,'Change Password','<p>-- Update Password</p>',NULL,NULL,NULL,'post','a:3:{i:0;a:5:{s:4:\"name\";s:8:\"password\";s:4:\"type\";s:8:\"password\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:1;a:5:{s:4:\"name\";s:12:\"new_password\";s:4:\"type\";s:8:\"password\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:2;a:5:{s:4:\"name\";s:16:\"confirm_password\";s:4:\"type\";s:8:\"password\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}}','a:0:{}'),(27,'mock_quiz_list','mock_quizzes','list',NULL,NULL,NULL,NULL,'Mock Quiz List','<p>-- Mock Quiz listing</p>',NULL,NULL,NULL,'get','a:3:{i:0;a:5:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"0\";}i:1;a:5:{s:4:\"name\";s:8:\"question\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"0\";}i:2;a:5:{s:4:\"name\";s:9:\"is_active\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"0\";}}','a:3:{i:0;a:4:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:1;a:4:{s:4:\"name\";s:8:\"question\";s:4:\"type\";s:6:\"string\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:2;a:4:{s:4:\"name\";s:9:\"is_active\";s:4:\"type\";s:7:\"tinyint\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}}'),(28,'mock_quiz_result','mock_quiz_result','save_add',NULL,NULL,NULL,NULL,'Mock Quiz Result','<p>-- Mock Results Submit</p>',NULL,NULL,NULL,'post','a:7:{i:0;a:5:{s:4:\"name\";s:15:\"total_questions\";s:4:\"type\";s:7:\"integer\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"1\";}i:1;a:5:{s:4:\"name\";s:9:\"attempted\";s:4:\"type\";s:7:\"integer\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"1\";}i:2;a:5:{s:4:\"name\";s:7:\"correct\";s:4:\"type\";s:7:\"integer\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"1\";}i:3;a:5:{s:4:\"name\";s:5:\"wrong\";s:4:\"type\";s:7:\"integer\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"1\";}i:4;a:5:{s:4:\"name\";s:5:\"score\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"1\";}i:5;a:5:{s:4:\"name\";s:7:\"user_id\";s:4:\"type\";s:6:\"exists\";s:6:\"config\";s:12:\"app_users,id\";s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:6;a:5:{s:4:\"name\";s:10:\"is_correct\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}}','a:8:{i:0;a:4:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:1;a:4:{s:4:\"name\";s:15:\"total_questions\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:2;a:4:{s:4:\"name\";s:9:\"attempted\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:3;a:4:{s:4:\"name\";s:7:\"correct\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:4;a:4:{s:4:\"name\";s:5:\"wrong\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:5;a:4:{s:4:\"name\";s:5:\"score\";s:4:\"type\";s:6:\"string\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:6;a:4:{s:4:\"name\";s:7:\"user_id\";s:4:\"type\";s:7:\"integer\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:7;a:4:{s:4:\"name\";s:6:\"status\";s:4:\"type\";s:6:\"string\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}}'),(29,'quiz_overall_result','quiz_result','list',NULL,NULL,NULL,NULL,'Quiz Overall Result','<p>-- Quiz Overall Result</p>',NULL,NULL,NULL,'get','a:9:{i:0;a:5:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"0\";}i:1;a:5:{s:4:\"name\";s:15:\"total_questions\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"0\";}i:2;a:5:{s:4:\"name\";s:9:\"attempted\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"0\";}i:3;a:5:{s:4:\"name\";s:7:\"correct\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"0\";}i:4;a:5:{s:4:\"name\";s:5:\"wrong\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"0\";}i:5;a:5:{s:4:\"name\";s:5:\"score\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"0\";}i:6;a:5:{s:4:\"name\";s:9:\"lesson_id\";s:4:\"type\";s:7:\"integer\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"0\";}i:7;a:5:{s:4:\"name\";s:7:\"user_id\";s:4:\"type\";s:6:\"exists\";s:6:\"config\";s:12:\"app_users,id\";s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}i:8;a:5:{s:4:\"name\";s:6:\"status\";s:4:\"type\";s:6:\"string\";s:6:\"config\";N;s:8:\"required\";s:1:\"0\";s:4:\"used\";s:1:\"0\";}}','a:9:{i:0;a:4:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:1;a:4:{s:4:\"name\";s:15:\"total_questions\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:2;a:4:{s:4:\"name\";s:9:\"attempted\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:3;a:4:{s:4:\"name\";s:7:\"correct\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:4;a:4:{s:4:\"name\";s:5:\"wrong\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:5;a:4:{s:4:\"name\";s:5:\"score\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:6;a:4:{s:4:\"name\";s:9:\"lesson_id\";s:4:\"type\";s:7:\"integer\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:7;a:4:{s:4:\"name\";s:7:\"user_id\";s:4:\"type\";s:7:\"integer\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:8;a:4:{s:4:\"name\";s:6:\"status\";s:4:\"type\";s:6:\"string\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}}'),(30,'mock_quiz_overall_result','mock_quiz_result','list',NULL,NULL,NULL,NULL,'Mock Quiz Overall Result','<p>-- Mock Quiz results overall</p>',NULL,NULL,NULL,'get','a:1:{i:0;a:5:{s:4:\"name\";s:7:\"user_id\";s:4:\"type\";s:6:\"exists\";s:6:\"config\";s:12:\"app_users,id\";s:8:\"required\";s:1:\"1\";s:4:\"used\";s:1:\"1\";}}','a:8:{i:0;a:4:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:1;a:4:{s:4:\"name\";s:15:\"total_questions\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:2;a:4:{s:4:\"name\";s:9:\"attempted\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:3;a:4:{s:4:\"name\";s:7:\"correct\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:4;a:4:{s:4:\"name\";s:5:\"wrong\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:5;a:4:{s:4:\"name\";s:5:\"score\";s:4:\"type\";s:6:\"string\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:6;a:4:{s:4:\"name\";s:7:\"user_id\";s:4:\"type\";s:7:\"integer\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:7;a:4:{s:4:\"name\";s:6:\"status\";s:4:\"type\";s:6:\"string\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}}'),(31,'notification_setting','cms_settings','save_edit',NULL,NULL,NULL,NULL,'Notification Setting','<p>-- Notification Settings</p>',NULL,NULL,NULL,'post','a:0:{}','a:8:{i:0;a:4:{s:4:\"name\";s:2:\"id\";s:4:\"type\";s:3:\"int\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:1;a:4:{s:4:\"name\";s:4:\"name\";s:4:\"type\";s:6:\"string\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:2;a:4:{s:4:\"name\";s:7:\"content\";s:4:\"type\";s:6:\"string\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:3;a:4:{s:4:\"name\";s:18:\"content_input_type\";s:4:\"type\";s:6:\"string\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:4;a:4:{s:4:\"name\";s:8:\"dataenum\";s:4:\"type\";s:6:\"string\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:5;a:4:{s:4:\"name\";s:6:\"helper\";s:4:\"type\";s:6:\"string\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:6;a:4:{s:4:\"name\";s:13:\"group_setting\";s:4:\"type\";s:6:\"string\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}i:7;a:4:{s:4:\"name\";s:5:\"label\";s:4:\"type\";s:6:\"string\";s:8:\"subquery\";N;s:4:\"used\";s:1:\"1\";}}'),(32,'mock_test_timer','cms_settings','list',NULL,NULL,NULL,NULL,'Mock Test Timer','<p>-- Mock Test Timer</p>',NULL,NULL,NULL,'get','a:0:{}','a:0:{}');

/*Table structure for table `cms_apikey` */

DROP TABLE IF EXISTS `cms_apikey`;

CREATE TABLE `cms_apikey` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screetkey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hit` int(11) DEFAULT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_apikey` */

/*Table structure for table `cms_dashboard` */

DROP TABLE IF EXISTS `cms_dashboard`;

CREATE TABLE `cms_dashboard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_dashboard` */

/*Table structure for table `cms_email_queues` */

DROP TABLE IF EXISTS `cms_email_queues`;

CREATE TABLE `cms_email_queues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `send_at` datetime DEFAULT NULL,
  `email_recipient` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_cc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_content` text COLLATE utf8mb4_unicode_ci,
  `email_attachments` text COLLATE utf8mb4_unicode_ci,
  `is_sent` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_email_queues` */

/*Table structure for table `cms_email_templates` */

DROP TABLE IF EXISTS `cms_email_templates`;

CREATE TABLE `cms_email_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_email_templates` */

insert  into `cms_email_templates`(`id`,`name`,`slug`,`subject`,`content`,`description`,`from_name`,`from_email`,`cc_email`,`created_at`,`updated_at`) values (1,'Email Template Forgot Password Backend','forgot_password_backend',NULL,'<p>Hi,</p><p>Someone requested forgot password, here is your new password : </p><p>[password]</p><p><br></p><p>--</p><p>Regards,</p><p>Admin</p>','[password]','System','system@crudbooster.com',NULL,'2019-10-11 11:12:23',NULL),(2,'User Registration','user_registration','Welcome to Step App','<p style=\"color: rgb(51, 51, 51);\">Dear [username],</p><p style=\"color: rgb(51, 51, 51);\">Thank you for joining us.</p><p style=\"color: rgb(51, 51, 51);\"><br></p><p style=\"color: rgb(51, 51, 51);\">Regards,</p><p style=\"color: rgb(51, 51, 51);\">Team Step App.</p>','User Registration','Step App Support','support@stepapp.com',NULL,'2019-10-15 10:53:29',NULL),(3,'Forgot Password App User','forgot_password_app','Password Reset Request','<p>Hi,</p><p>You have requested a password reset, here is your password reset token:&nbsp;</p><p>[reset_token]</p><p><br></p><p>--</p><p>Regards,</p><p>Step App Support.</p>','[reset_token]','Step App Support','support@stepapp.com',NULL,'2019-10-15 13:57:07',NULL),(4,'Contact Us','contact_us','Thank you for contacting us','<p>Dear User,</p><p>Thank you for contacting us.</p><p>We appreciate your time.</p><p><br></p><p><br></p><p>Regards,</p><p>Step-App</p>','When a user contacts','StepApp','stepapp@cubix.co','stepapp@cubix.co','2019-10-21 08:13:08',NULL);

/*Table structure for table `cms_logs` */

DROP TABLE IF EXISTS `cms_logs`;

CREATE TABLE `cms_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `id_cms_users` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_logs` */

insert  into `cms_logs`(`id`,`ipaddress`,`useragent`,`url`,`description`,`details`,`id_cms_users`,`created_at`,`updated_at`) values (1,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/login','admin@crudbooster.com login with IP Address ::1','',1,'2019-10-11 11:13:32',NULL),(2,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/menu_management/add-save','Add New Data Users Management at Menu Management','',1,'2019-10-11 11:15:37',NULL),(3,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/menu_management/add-save','Add New Data Roles Management at Menu Management','',1,'2019-10-11 11:17:36',NULL),(4,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/menu_management/add-save','Add New Data Role Permissions at Menu Management','',1,'2019-10-11 11:22:03',NULL),(5,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/menu_management/edit-save/3','Update data Role Permissions at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>2</td><td></td></tr></tbody></table>',1,'2019-10-11 11:22:24',NULL),(6,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/menu_management/edit-save/2','Update data Roles Management at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>',1,'2019-10-11 11:22:32',NULL),(7,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/menu_management/edit-save/1','Update data Users Management at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>',1,'2019-10-11 11:22:38',NULL),(8,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/menu_management/delete/3','Delete data Role Permissions at Menu Management','',1,'2019-10-11 11:24:09',NULL),(9,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/courses/add-save','Add New Data Listening at Courses','',1,'2019-10-11 12:21:45',NULL),(10,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/courses/add-save','Add New Data Vocabulary at Courses','',1,'2019-10-11 12:22:05',NULL),(11,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/courses/add-save','Add New Data Writing at Courses','',1,'2019-10-11 12:22:18',NULL),(12,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/courses/add-save','Add New Data Reading at Courses','',1,'2019-10-11 12:22:41',NULL),(13,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/courses/add-save','Add New Data Grammar at Courses','',1,'2019-10-11 12:22:47',NULL),(14,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/courses/edit-save/1','Update data Listening at Courses','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>deleted_at</td><td></td><td></td></tr><tr><td>audio_allowed</td><td>0</td><td>1</td></tr></tbody></table>',1,'2019-10-11 12:46:06',NULL),(15,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/courses/detail/5','Try view the data Grammar at Courses','',1,'2019-10-11 12:47:29',NULL),(16,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/lessons/add-save','Add New Data Grammar Lesson 1 at Lessons','',1,'2019-10-11 12:54:38',NULL),(17,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/quizzes/add-save','Add New Data Grammar Lesson 1 Question 1 at Quiz Questions','',1,'2019-10-11 12:59:49',NULL),(18,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/quizzes/edit-save/1','Update data Grammar Lesson 1 Question 1 at Quiz Questions','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>deleted_at</td><td></td><td></td></tr></tbody></table>',1,'2019-10-11 12:59:54',NULL),(19,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/quizzes/add-save','Add New Data Grammar Lesson 1 Question 2 at Quiz Questions','',1,'2019-10-11 13:20:35',NULL),(20,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/options/add-save','Add New Data  at Options','',1,'2019-10-11 13:21:30',NULL),(21,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/options/edit-save/1','Update data  at Options','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>deleted_at</td><td></td><td></td></tr></tbody></table>',1,'2019-10-11 13:29:31',NULL),(22,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/options/add-save','Add New Data  at Options','',1,'2019-10-11 13:29:43',NULL),(23,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/options/add-save','Add New Data  at Options','',1,'2019-10-11 13:29:49',NULL),(24,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/options/edit-save/2','Update data  at Options','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>is_correct</td><td>0</td><td>1</td></tr><tr><td>deleted_at</td><td></td><td></td></tr></tbody></table>',1,'2019-10-11 13:30:26',NULL),(25,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/content_pages/add-save','Add New Data About Step App at Content Management','',1,'2019-10-11 13:36:55',NULL),(26,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/content_pages/add-save','Add New Data Terms of Service at Content Management','',1,'2019-10-11 13:37:23',NULL),(27,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/menu_management/delete/9','Delete data Lesson Reviews at Menu Management','',1,'2019-10-11 13:54:14',NULL),(28,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/menu_management/delete/8','Delete data Options at Menu Management','',1,'2019-10-11 13:54:27',NULL),(29,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/menu_management/edit-save/4','Update data Content Management at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>',1,'2019-10-11 13:54:36',NULL),(30,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/menu_management/edit-save/5','Update data Courses at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>',1,'2019-10-11 13:54:41',NULL),(31,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/menu_management/edit-save/6','Update data Lessons at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>5</td><td></td></tr></tbody></table>',1,'2019-10-11 13:54:46',NULL),(32,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/menu_management/edit-save/7','Update data Questions at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>6</td><td></td></tr></tbody></table>',1,'2019-10-11 13:54:51',NULL),(33,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/menu_management/delete/11','Delete data Mock Quiz Options at Menu Management','',1,'2019-10-11 14:03:57',NULL),(34,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/menu_management/edit-save/10','Update data Mock Quiz at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>7</td><td></td></tr></tbody></table>',1,'2019-10-11 14:04:03',NULL),(35,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/mock_quizzes/add-save','Add New Data  at Mock Quiz','',1,'2019-10-11 14:04:16',NULL),(36,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/mock_quiz_options/add-save','Add New Data  at Mock Quiz Options','',1,'2019-10-11 14:04:24',NULL),(37,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/mock_quiz_options/add-save','Add New Data  at Mock Quiz Options','',1,'2019-10-11 14:04:28',NULL),(38,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/mock_quiz_options/add-save','Add New Data  at Mock Quiz Options','',1,'2019-10-11 14:04:30',NULL),(39,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/mock_quiz_options/edit-save/3','Update data  at Mock Quiz Options','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>deleted_at</td><td></td><td></td></tr></tbody></table>',1,'2019-10-11 14:04:37',NULL),(40,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/mock_quizzes/add-save','Add New Data  at Mock Quiz','',1,'2019-10-11 14:04:46',NULL),(41,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/users/edit-save/1','Update data Super Admin at Users Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2019-10/user.jpg</td></tr><tr><td>email</td><td>admin@crudbooster.com</td><td>devs@stepapp.com</td></tr><tr><td>password</td><td>$2y$10$9qoZsRaYvLiuGkeKkyMileGnikjhypNLBsBgXfXlRk6C2fSGwK0qe</td><td>$2y$10$ZCW901KVMdZ24/HSHiBeb.8oYx2wXwRl6sADBUMQ.k3GADGMtsikm</td></tr><tr><td>status</td><td>Active</td><td></td></tr></tbody></table>',1,'2019-10-11 14:05:43',NULL),(42,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/users/add-save','Add New Data Admin at Users Management','',1,'2019-10-11 14:06:05',NULL),(43,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/logout','devs@stepapp.com logout','',1,'2019-10-11 14:06:11',NULL),(44,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/login','admin@stepapp.com login with IP Address ::1','',2,'2019-10-11 14:06:20',NULL),(45,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/courses','Try view the data :name at Courses','',2,'2019-10-11 14:19:55',NULL),(46,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/lessons','Try view the data :name at Lessons','',2,'2019-10-11 14:19:57',NULL),(47,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/logout','admin@stepapp.com logout','',2,'2019-10-11 14:20:03',NULL),(48,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/login','devs@stepapp.com login with IP Address ::1','',1,'2019-10-11 14:20:14',NULL),(49,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/logout','devs@stepapp.com logout','',1,'2019-10-11 14:20:53',NULL),(50,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/login','admin@stepapp.com login with IP Address ::1','',2,'2019-10-11 14:21:09',NULL),(51,'192.168.12.30','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://192.168.12.30/stepapp/public/admin/login','admin@stepapp.com login with IP Address 192.168.12.30','',2,'2019-10-11 14:26:55',NULL),(52,'192.168.12.65','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://192.168.12.30/stepapp/public/admin/login','admin@stepapp.com login with IP Address 192.168.12.65','',2,'2019-10-11 14:28:58',NULL),(53,'192.168.12.65','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://192.168.12.30/stepapp/public/admin/quizzes/add-save','Add New Data test at Quiz Questions','',2,'2019-10-11 14:29:52',NULL),(54,'192.168.12.65','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://192.168.12.30/stepapp/public/admin/quizzes/delete/3','Delete data test at Quiz Questions','',2,'2019-10-11 14:30:23',NULL),(55,'192.168.12.65','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://192.168.12.30/stepapp/public/admin/mock_quizzes/add-save','Add New Data  at Mock Quiz','',2,'2019-10-11 14:30:37',NULL),(56,'192.168.12.21','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://192.168.12.30/stepapp/public/admin/login','admin@stepapp.com login with IP Address 192.168.12.21','',2,'2019-10-11 14:35:09',NULL),(57,'192.168.12.30','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://192.168.12.30/stepapp/public/admin/logout','admin@stepapp.com logout','',2,'2019-10-11 14:41:24',NULL),(58,'192.168.12.30','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://192.168.12.30/stepapp/public/admin/login','devs@stepapp.com login with IP Address 192.168.12.30','',1,'2019-10-11 14:41:44',NULL),(59,'192.168.12.30','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://192.168.12.30/stepapp/public/admin/menu_management/delete/7','Delete data Questions at Menu Management','',1,'2019-10-11 14:42:02',NULL),(60,'192.168.12.30','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://192.168.12.30/stepapp/public/admin/logout','devs@stepapp.com logout','',1,'2019-10-11 14:42:06',NULL),(61,'192.168.12.30','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://192.168.12.30/stepapp/public/admin/login','admin@stepapp.com login with IP Address 192.168.12.30','',2,'2019-10-11 14:42:13',NULL),(62,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/login','devs@stepapp.com login with IP Address ::1','',1,'2019-10-14 07:12:57',NULL),(63,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/quizzes/action-selected','Delete data 5,4 at Quiz Questions','',1,'2019-10-14 07:21:20',NULL),(64,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/quizzes/add-save','Add New Data Grammar Lesson 1 Question 3 at Quiz Questions','',1,'2019-10-14 07:27:52',NULL),(65,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/options/action-selected','Delete data 8,7,6,5,4 at Options','',1,'2019-10-14 07:30:21',NULL),(66,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/quizzes/action-selected','Delete data 8,7 at Quiz Questions','',1,'2019-10-14 07:30:33',NULL),(67,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/quizzes/action-selected','Delete data 6 at Quiz Questions','',1,'2019-10-14 07:30:45',NULL),(68,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/quizzes/add-save','Add New Data Grammar Lesson 1 Question 4 at Quiz Questions','',1,'2019-10-14 07:32:36',NULL),(69,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/quizzes/add-save','Add New Data Grammar Lesson 1 Question 3 at Quiz Questions','',1,'2019-10-14 07:34:35',NULL),(70,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/options/delete/13','Delete data 13 at Options','',1,'2019-10-14 07:42:24',NULL),(71,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/options/edit-save/16','Update data  at Options','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>deleted_at</td><td></td><td></td></tr></tbody></table>',1,'2019-10-14 07:42:37',NULL),(72,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/quizzes/edit-save/10','Update data Grammar Lesson 1 Question 3 at Quiz Questions','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>deleted_at</td><td></td><td></td></tr></tbody></table>',1,'2019-10-14 07:43:03',NULL),(73,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/login','devs@stepapp.com login with IP Address ::1','',1,'2019-10-14 11:53:26',NULL),(74,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/quizzes/action-selected','Delete data 11 at Quiz Questions','',1,'2019-10-14 12:12:55',NULL),(75,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/quizzes/action-selected','Delete data 10 at Quiz Questions','',1,'2019-10-14 12:13:02',NULL),(76,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/login','devs@stepapp.com login with IP Address ::1','',1,'2019-10-15 07:18:58',NULL),(77,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/email_templates/add-save','Add New Data User Registration at Email Templates','',1,'2019-10-15 10:53:29',NULL),(78,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','http://localhost/stepapp/public/admin/email_templates/add-save','Add New Data Forgot Password App User at Email Templates','',1,'2019-10-15 13:57:07',NULL),(79,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/login','devs@stepapp.com login with IP Address ::1','',1,'2019-10-16 08:49:22',NULL),(80,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/module_generator/delete/20','Delete data Dummy at Module Generator','',1,'2019-10-16 09:04:36',NULL),(81,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/settings/add-save','Add New Data passing_score at Settings','',1,'2019-10-16 14:10:07',NULL),(82,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/settings/add-save','Add New Data marks_per_question at Settings','',1,'2019-10-16 15:00:44',NULL),(83,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/login','devs@stepapp.com login with IP Address ::1','',1,'2019-10-17 13:24:44',NULL),(84,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/settings/add-save','Add New Data terms_of_services at Settings','',1,'2019-10-17 14:10:09',NULL),(85,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/settings/add-save','Add New Data about_step_app at Settings','',1,'2019-10-17 14:15:17',NULL),(86,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/settings/edit-save/20','Update data  at Settings','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>about_step_app</td><td></td></tr><tr><td>content</td><td></td><td></td></tr><tr><td>content_input_type</td><td>text</td><td>textarea</td></tr><tr><td>dataenum</td><td></td><td></td></tr><tr><td>helper</td><td></td><td></td></tr></tbody></table>',1,'2019-10-17 14:15:31',NULL),(87,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/settings/add-save','Add New Data faq at Settings','',1,'2019-10-17 14:27:27',NULL),(88,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/settings/add-save','Add New Data mock_passing_score at Settings','',1,'2019-10-17 15:26:11',NULL),(89,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/settings/add-save','Add New Data mock_marks_per_question at Settings','',1,'2019-10-17 15:26:29',NULL),(90,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/login','devs@stepapp.com login with IP Address ::1','',1,'2019-10-18 07:16:25',NULL),(91,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/lessons/add-save','Add New Data dfasfsdf at Lessons','',1,'2019-10-18 10:36:37',NULL),(92,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/lessons/add-save','Add New Data Listening Lessong at Lessons','',1,'2019-10-18 10:38:43',NULL),(93,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/lessons/add-save','Add New Data Listening Lesson at Lessons','',1,'2019-10-18 10:49:42',NULL),(94,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/lessons/add-save','Add New Data Reset Password at Lessons','',1,'2019-10-18 10:53:29',NULL),(95,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/lessons/add-save','Add New Data hello at Lessons','',1,'2019-10-18 10:54:40',NULL),(96,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/lessons/add-save','Add New Data fsadf at Lessons','',1,'2019-10-18 10:56:00',NULL),(97,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/lessons/add-save','Add New Data fasdf at Lessons','',1,'2019-10-18 11:01:34',NULL),(98,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/lessons/add-save','Add New Data fsdafas at Lessons','',1,'2019-10-18 11:07:44',NULL),(99,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/lessons/add-save','Add New Data fasdf at Lessons','',1,'2019-10-18 11:09:24',NULL),(100,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/lessons/add-save','Add New Data fasdf at Lessons','',1,'2019-10-18 11:12:28',NULL),(101,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/lessons/add-save','Add New Data fasdfa at Lessons','',1,'2019-10-18 11:16:25',NULL),(102,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/lessons/add-save','Add New Data Forgot Password at Lessons','',1,'2019-10-18 11:16:52',NULL),(103,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/lessons/action-selected','Delete data 13,12,11,10,9,8,7,6,5,4,3 at Lessons','',1,'2019-10-18 11:18:01',NULL),(104,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/lessons/add-save','Add New Data Listening Lesson at Lessons','',1,'2019-10-18 11:18:33',NULL),(105,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/lessons/add-save','Add New Data fasfd at Lessons','',1,'2019-10-18 11:22:43',NULL),(106,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/settings/add-save','Add New Data notification_status at Settings','',1,'2019-10-18 15:17:37',NULL),(107,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/login','devs@stepapp.com login with IP Address ::1','',1,'2019-10-21 07:02:12',NULL),(108,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/settings/add-save','Add New Data mock_test_timer at Settings','',1,'2019-10-21 07:04:18',NULL),(109,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/settings/edit-save/25','Update data  at Settings','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>mock_test_timer</td><td></td></tr><tr><td>content</td><td></td><td></td></tr><tr><td>content_input_type</td><td>datepicker</td><td>number</td></tr><tr><td>dataenum</td><td></td><td></td></tr><tr><td>helper</td><td></td><td></td></tr><tr><td>label</td><td>Mock Test Timer</td><td>Mock Test Completion Minutes</td></tr></tbody></table>',1,'2019-10-21 07:25:14',NULL),(110,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/lessons/delete-image','Delete the image of Listening Lesson at Lessons','',1,'2019-10-21 07:42:05',NULL),(111,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36','http://localhost/step-app/public/admin/email_templates/add-save','Add New Data Contact Us at Email Templates','',1,'2019-10-21 08:13:08',NULL);

/*Table structure for table `cms_menus` */

DROP TABLE IF EXISTS `cms_menus`;

CREATE TABLE `cms_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'url',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_dashboard` tinyint(1) NOT NULL DEFAULT '0',
  `id_cms_privileges` int(11) DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_menus` */

insert  into `cms_menus`(`id`,`name`,`type`,`path`,`color`,`icon`,`parent_id`,`is_active`,`is_dashboard`,`id_cms_privileges`,`sorting`,`created_at`,`updated_at`) values (1,'Users Management','Module','users','normal','fa fa-users',0,1,0,1,1,'2019-10-11 11:15:37','2019-10-11 11:22:38'),(2,'Roles Management','Module','privileges','normal','fa fa-user-plus',0,1,0,1,2,'2019-10-11 11:17:36','2019-10-11 11:22:32'),(4,'Content Management','Route','AdminContentPagesControllerGetIndex','normal','fa fa-edit',0,1,0,1,3,'2019-10-11 12:00:08','2019-10-11 13:54:36'),(5,'Courses','Route','AdminCoursesControllerGetIndex','normal','fa fa-sitemap',0,1,0,1,4,'2019-10-11 12:00:38','2019-10-11 13:54:41'),(6,'Lessons','Route','AdminLessonsControllerGetIndex','normal','fa fa-pagelines',0,1,0,1,5,'2019-10-11 12:00:58','2019-10-11 13:54:46'),(10,'Mock Quiz','Route','AdminMockQuizzesControllerGetIndex','normal','fa fa-question-circle',0,1,0,1,7,'2019-10-11 13:55:30','2019-10-11 14:04:03');

/*Table structure for table `cms_menus_privileges` */

DROP TABLE IF EXISTS `cms_menus_privileges`;

CREATE TABLE `cms_menus_privileges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_menus` int(11) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_menus_privileges` */

insert  into `cms_menus_privileges`(`id`,`id_cms_menus`,`id_cms_privileges`) values (3,NULL,2),(4,3,2),(5,3,1),(6,2,2),(7,2,1),(8,1,2),(9,1,1),(14,8,1),(15,9,1),(16,4,2),(17,4,1),(18,5,2),(19,5,1),(20,6,2),(21,6,1),(22,7,2),(23,7,1),(25,11,1),(26,10,2),(27,10,1),(28,11,1);

/*Table structure for table `cms_moduls` */

DROP TABLE IF EXISTS `cms_moduls`;

CREATE TABLE `cms_moduls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_protected` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_moduls` */

insert  into `cms_moduls`(`id`,`name`,`icon`,`path`,`table_name`,`controller`,`is_protected`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values (1,'Notifications','fa fa-cog','notifications','cms_notifications','NotificationsController',1,1,'2019-10-11 11:12:23',NULL,NULL),(2,'Privileges','fa fa-cog','privileges','cms_privileges','PrivilegesController',0,1,'2019-10-11 11:12:23',NULL,NULL),(3,'Privileges Roles','fa fa-cog','privileges_roles','cms_privileges_roles','PrivilegesRolesController',1,1,'2019-10-11 11:12:23',NULL,NULL),(4,'Users Management','fa fa-users','users','cms_users','AdminCmsUsersController',0,1,'2019-10-11 11:12:23',NULL,NULL),(5,'Settings','fa fa-cog','settings','cms_settings','SettingsController',1,1,'2019-10-11 11:12:23',NULL,NULL),(6,'Module Generator','fa fa-database','module_generator','cms_moduls','ModulsController',1,1,'2019-10-11 11:12:23',NULL,NULL),(7,'Menu Management','fa fa-bars','menu_management','cms_menus','MenusController',1,1,'2019-10-11 11:12:23',NULL,NULL),(8,'Email Templates','fa fa-envelope-o','email_templates','cms_email_templates','EmailTemplatesController',1,1,'2019-10-11 11:12:23',NULL,NULL),(9,'Statistic Builder','fa fa-dashboard','statistic_builder','cms_statistics','StatisticBuilderController',1,1,'2019-10-11 11:12:23',NULL,NULL),(10,'API Generator','fa fa-cloud-download','api_generator','','ApiCustomController',1,1,'2019-10-11 11:12:23',NULL,NULL),(11,'Log User Access','fa fa-flag-o','logs','cms_logs','LogsController',1,1,'2019-10-11 11:12:23',NULL,NULL),(12,'Content Management','fa fa-edit','content_pages','content_pages','AdminContentPagesController',0,0,'2019-10-11 12:00:08',NULL,NULL),(13,'Courses','fa fa-sitemap','courses','courses','AdminCoursesController',0,0,'2019-10-11 12:00:38',NULL,NULL),(14,'Lessons','fa fa-pagelines','lessons','lessons','AdminLessonsController',0,0,'2019-10-11 12:00:58',NULL,NULL),(15,'Quiz Questions','fa fa-question-circle','quizzes','quizzes','AdminQuizzesController',0,0,'2019-10-11 12:01:21',NULL,NULL),(16,'Options','fa fa-check-square-o','options','options','AdminOptionsController',0,0,'2019-10-11 12:02:07',NULL,NULL),(17,'Lesson Reviews','fa fa-star','reviews','reviews','AdminReviewsController',0,0,'2019-10-11 12:02:34',NULL,NULL),(18,'Mock Quiz','fa fa-question-circle','mock_quizzes','mock_quizzes','AdminMockQuizzesController',0,0,'2019-10-11 13:55:30',NULL,NULL),(19,'Mock Quiz Options','fa fa-check-circle-o','mock_quiz_options','mock_quiz_options','AdminMockQuizOptionsController',0,0,'2019-10-11 13:59:20',NULL,NULL),(20,'Dummy','fa fa-glass','access_tokens','access_tokens','AdminAccessTokensController',0,0,'2019-10-16 09:03:56',NULL,'2019-10-16 09:04:36');

/*Table structure for table `cms_notifications` */

DROP TABLE IF EXISTS `cms_notifications`;

CREATE TABLE `cms_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_users` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_notifications` */

/*Table structure for table `cms_privileges` */

DROP TABLE IF EXISTS `cms_privileges`;

CREATE TABLE `cms_privileges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_superadmin` tinyint(1) DEFAULT NULL,
  `theme_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_privileges` */

insert  into `cms_privileges`(`id`,`name`,`is_superadmin`,`theme_color`,`created_at`,`updated_at`) values (1,'Super Administrator',1,'skin-red','2019-10-11 11:12:23',NULL),(2,'Administrator',0,'skin-black',NULL,NULL);

/*Table structure for table `cms_privileges_roles` */

DROP TABLE IF EXISTS `cms_privileges_roles`;

CREATE TABLE `cms_privileges_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_visible` tinyint(1) DEFAULT NULL,
  `is_create` tinyint(1) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `is_edit` tinyint(1) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `id_cms_moduls` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_privileges_roles` */

insert  into `cms_privileges_roles`(`id`,`is_visible`,`is_create`,`is_read`,`is_edit`,`is_delete`,`id_cms_privileges`,`id_cms_moduls`,`created_at`,`updated_at`) values (1,1,0,0,0,0,1,1,'2019-10-11 11:12:23',NULL),(2,1,1,1,1,1,1,2,'2019-10-11 11:12:23',NULL),(3,0,1,1,1,1,1,3,'2019-10-11 11:12:23',NULL),(4,1,1,1,1,1,1,4,'2019-10-11 11:12:23',NULL),(5,1,1,1,1,1,1,5,'2019-10-11 11:12:23',NULL),(6,1,1,1,1,1,1,6,'2019-10-11 11:12:23',NULL),(7,1,1,1,1,1,1,7,'2019-10-11 11:12:23',NULL),(8,1,1,1,1,1,1,8,'2019-10-11 11:12:23',NULL),(9,1,1,1,1,1,1,9,'2019-10-11 11:12:23',NULL),(10,1,1,1,1,1,1,10,'2019-10-11 11:12:23',NULL),(11,1,0,1,0,1,1,11,'2019-10-11 11:12:23',NULL),(14,1,1,1,1,1,1,12,NULL,NULL),(15,1,1,1,1,1,1,13,NULL,NULL),(16,1,1,1,1,1,1,14,NULL,NULL),(17,1,1,1,1,1,1,15,NULL,NULL),(18,1,1,1,1,1,1,16,NULL,NULL),(19,1,1,1,1,1,1,17,NULL,NULL),(20,1,1,1,1,1,1,18,NULL,NULL),(21,1,1,1,1,1,1,19,NULL,NULL),(22,1,1,1,1,1,2,12,NULL,NULL),(23,1,1,1,1,1,2,13,NULL,NULL),(24,1,1,1,1,1,2,17,NULL,NULL),(25,1,1,1,1,1,2,14,NULL,NULL),(26,1,1,1,1,1,2,18,NULL,NULL),(27,1,1,1,1,1,2,19,NULL,NULL),(28,1,1,1,1,1,2,16,NULL,NULL),(29,1,1,1,1,1,2,2,NULL,NULL),(30,1,1,1,1,1,2,15,NULL,NULL),(31,1,1,1,1,1,2,4,NULL,NULL),(32,1,1,1,1,1,1,20,NULL,NULL);

/*Table structure for table `cms_settings` */

DROP TABLE IF EXISTS `cms_settings`;

CREATE TABLE `cms_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `content_input_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dataenum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `helper` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_setting` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_settings` */

insert  into `cms_settings`(`id`,`name`,`content`,`content_input_type`,`dataenum`,`helper`,`created_at`,`updated_at`,`group_setting`,`label`) values (1,'login_background_color',NULL,'text',NULL,'Input hexacode','2019-10-11 11:12:23',NULL,'Login Register Style','Login Background Color'),(2,'login_font_color',NULL,'text',NULL,'Input hexacode','2019-10-11 11:12:23',NULL,'Login Register Style','Login Font Color'),(3,'login_background_image',NULL,'upload_image',NULL,NULL,'2019-10-11 11:12:23',NULL,'Login Register Style','Login Background Image'),(4,'email_sender','support@stepapp.com','text',NULL,NULL,'2019-10-11 11:12:23',NULL,'Email Setting','Email Sender'),(5,'smtp_driver','smtp','select','smtp,mail,sendmail',NULL,'2019-10-11 11:12:23',NULL,'Email Setting','Mail Driver'),(6,'smtp_host','smtp.gmail.com','text',NULL,NULL,'2019-10-11 11:12:23',NULL,'Email Setting','SMTP Host'),(7,'smtp_port','587','text',NULL,'default 25','2019-10-11 11:12:23',NULL,'Email Setting','SMTP Port'),(8,'smtp_username','testsmtp@cubixlabs.com','text',NULL,NULL,'2019-10-11 11:12:23',NULL,'Email Setting','SMTP Username'),(9,'smtp_password','smtp@123','text',NULL,NULL,'2019-10-11 11:12:23',NULL,'Email Setting','SMTP Password'),(10,'appname','Step App','text',NULL,NULL,'2019-10-11 11:12:23',NULL,'Application Setting','Application Name'),(11,'default_paper_size','Legal','text',NULL,'Paper size, ex : A4, Legal, etc','2019-10-11 11:12:23',NULL,'Application Setting','Default Paper Print Size'),(12,'logo',NULL,'upload_image',NULL,NULL,'2019-10-11 11:12:23',NULL,'Application Setting','Logo'),(13,'favicon',NULL,'upload_image',NULL,NULL,'2019-10-11 11:12:23',NULL,'Application Setting','Favicon'),(14,'api_debug_mode','true','select','true,false',NULL,'2019-10-11 11:12:23',NULL,'Application Setting','API Debug Mode'),(15,'google_api_key',NULL,'text',NULL,NULL,'2019-10-11 11:12:23',NULL,'Application Setting','Google API Key'),(16,'google_fcm_key',NULL,'text',NULL,NULL,'2019-10-11 11:12:23',NULL,'Application Setting','Google FCM Key'),(17,'passing_score','70','text',NULL,NULL,'2019-10-16 14:10:07',NULL,'General Setting','Passing Score'),(18,'marks_per_question','10','number',NULL,NULL,'2019-10-16 15:00:44',NULL,'General Setting','Marks Per Question'),(19,'terms_of_services','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis arcu hendrerit, convallis lectus vitae, condimentum ex. Aliquam sagittis eleifend orci eu blandit. Mauris a mi malesuada, maximus velit in, iaculis ipsum. Praesent vehicula quis mi sed tristique. In consectetur ligula eu risus pulvinar, et facilisis sapien interdum. Etiam non est gravida, pretium eros in, porttitor orci. Mauris pulvinar sapien ipsum, a dapibus enim pharetra et.\r\n\r\nAenean a augue scelerisque, cursus ligula et, semper tellus. In vestibulum nec nisl ut imperdiet. Aenean sapien metus, finibus sit amet ultrices eu, convallis a neque. Duis malesuada maximus commodo. Vestibulum eleifend leo id sem eleifend vestibulum. Nulla finibus nunc magna, aliquet porttitor massa porttitor pharetra. Cras in congue tellus, ac efficitur mauris. Vestibulum tincidunt eget tortor eget fermentum.\r\n\r\nSed vitae orci sit amet risus dictum vehicula sit amet ut est. Nulla vitae mollis nibh. Morbi vitae tempus ante. Mauris vitae quam blandit, tincidunt nisl at, tempor mauris. Sed laoreet ligula nunc, id feugiat diam condimentum eget. Sed venenatis erat vel justo sodales luctus. Aenean viverra mi ligula, ac viverra augue scelerisque ut. Aenean sem nulla, viverra porttitor enim sed, egestas hendrerit nisl. Ut rhoncus elit vel lobortis mattis. Integer fringilla libero eu turpis varius rutrum. Vivamus non erat magna. Donec a consequat est.\r\n\r\nQuisque ac nulla id nunc placerat egestas. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque sollicitudin in elit at rhoncus. Suspendisse potenti. Morbi ac blandit sem. Praesent rutrum enim nisl, sed imperdiet arcu sagittis in. Vestibulum laoreet accumsan facilisis. Fusce at purus sapien. Nullam hendrerit suscipit odio. Sed tempus lacinia diam non porttitor. Mauris condimentum commodo mi, id tristique neque sollicitudin eget. Etiam eu leo eget nisl lobortis iaculis. Fusce in scelerisque est, quis dictum eros. Proin finibus odio turpis, ut gravida nisi auctor et. Praesent lobortis leo in neque porttitor imperdiet. Vestibulum at arcu eu lacus pellentesque volutpat.\r\n\r\nMaecenas eget aliquam est. Pellentesque vulputate tortor ligula, ac elementum leo placerat sit amet. Integer et auctor est. Sed at odio viverra turpis rhoncus scelerisque. Nunc posuere augue ac ex egestas, sit amet luctus diam malesuada. Pellentesque vitae metus rutrum, sodales magna a, tincidunt lacus. Phasellus non venenatis metus.','textarea',NULL,NULL,'2019-10-17 14:10:09',NULL,'General Setting','Terms of Services'),(20,'about_step_app','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis arcu hendrerit, convallis lectus vitae, condimentum ex. Aliquam sagittis eleifend orci eu blandit. Mauris a mi malesuada, maximus velit in, iaculis ipsum. Praesent vehicula quis mi sed tristique. In consectetur ligula eu risus pulvinar, et facilisis sapien interdum. Etiam non est gravida, pretium eros in, porttitor orci. Mauris pulvinar sapien ipsum, a dapibus enim pharetra et.\r\n\r\nAenean a augue scelerisque, cursus ligula et, semper tellus. In vestibulum nec nisl ut imperdiet. Aenean sapien metus, finibus sit amet ultrices eu, convallis a neque. Duis malesuada maximus commodo. Vestibulum eleifend leo id sem eleifend vestibulum. Nulla finibus nunc magna, aliquet porttitor massa porttitor pharetra. Cras in congue tellus, ac efficitur mauris. Vestibulum tincidunt eget tortor eget fermentum.\r\n\r\nSed vitae orci sit amet risus dictum vehicula sit amet ut est. Nulla vitae mollis nibh. Morbi vitae tempus ante. Mauris vitae quam blandit, tincidunt nisl at, tempor mauris. Sed laoreet ligula nunc, id feugiat diam condimentum eget. Sed venenatis erat vel justo sodales luctus. Aenean viverra mi ligula, ac viverra augue scelerisque ut. Aenean sem nulla, viverra porttitor enim sed, egestas hendrerit nisl. Ut rhoncus elit vel lobortis mattis. Integer fringilla libero eu turpis varius rutrum. Vivamus non erat magna. Donec a consequat est.\r\n\r\nQuisque ac nulla id nunc placerat egestas. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque sollicitudin in elit at rhoncus. Suspendisse potenti. Morbi ac blandit sem. Praesent rutrum enim nisl, sed imperdiet arcu sagittis in. Vestibulum laoreet accumsan facilisis. Fusce at purus sapien. Nullam hendrerit suscipit odio. Sed tempus lacinia diam non porttitor. Mauris condimentum commodo mi, id tristique neque sollicitudin eget. Etiam eu leo eget nisl lobortis iaculis. Fusce in scelerisque est, quis dictum eros. Proin finibus odio turpis, ut gravida nisi auctor et. Praesent lobortis leo in neque porttitor imperdiet. Vestibulum at arcu eu lacus pellentesque volutpat.\r\n\r\nMaecenas eget aliquam est. Pellentesque vulputate tortor ligula, ac elementum leo placerat sit amet. Integer et auctor est. Sed at odio viverra turpis rhoncus scelerisque. Nunc posuere augue ac ex egestas, sit amet luctus diam malesuada. Pellentesque vitae metus rutrum, sodales magna a, tincidunt lacus. Phasellus non venenatis metus.','textarea',NULL,NULL,'2019-10-17 14:15:17','2019-10-17 14:15:31','General Setting','About Step App'),(21,'faq','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis arcu hendrerit, convallis lectus vitae, condimentum ex. Aliquam sagittis eleifend orci eu blandit. Mauris a mi malesuada, maximus velit in, iaculis ipsum. Praesent vehicula quis mi sed tristique. In consectetur ligula eu risus pulvinar, et facilisis sapien interdum. Etiam non est gravida, pretium eros in, porttitor orci. Mauris pulvinar sapien ipsum, a dapibus enim pharetra et.','textarea',NULL,NULL,'2019-10-17 14:27:27',NULL,'General Setting','FAQ'),(22,'mock_passing_score','80','text',NULL,NULL,'2019-10-17 15:26:11',NULL,'General Setting','Mock Passing Score'),(23,'mock_marks_per_question','10','text',NULL,NULL,'2019-10-17 15:26:29',NULL,'General Setting','Mock Marks Per Question'),(24,'notification_status','1','text',NULL,NULL,'2019-10-18 15:17:37',NULL,'General Setting','Notification Status'),(25,'mock_test_timer','33','number',NULL,NULL,'2019-10-21 07:04:18','2019-10-21 07:25:14','General Setting','Mock Test Completion Minutes');

/*Table structure for table `cms_statistic_components` */

DROP TABLE IF EXISTS `cms_statistic_components`;

CREATE TABLE `cms_statistic_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_statistics` int(11) DEFAULT NULL,
  `componentID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `component_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_name` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_statistic_components` */

/*Table structure for table `cms_statistics` */

DROP TABLE IF EXISTS `cms_statistics`;

CREATE TABLE `cms_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_statistics` */

/*Table structure for table `cms_users` */

DROP TABLE IF EXISTS `cms_users`;

CREATE TABLE `cms_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_users` */

insert  into `cms_users`(`id`,`name`,`photo`,`email`,`password`,`id_cms_privileges`,`created_at`,`updated_at`,`status`) values (1,'Super Admin','uploads/1/2019-10/user.jpg','devs@stepapp.com','$2y$10$ZCW901KVMdZ24/HSHiBeb.8oYx2wXwRl6sADBUMQ.k3GADGMtsikm',1,'2019-10-11 11:12:23','2019-10-11 14:05:43','Active'),(2,'Admin','uploads/1/2019-10/user.jpg','admin@stepapp.com','$2y$10$gAgOVIjsttSP.mnBiAWfoOU3EiOYMN5W4KPLkmxla3SylWUGshjUq',2,'2019-10-11 14:06:05',NULL,NULL);

/*Table structure for table `contact_us` */

DROP TABLE IF EXISTS `contact_us`;

CREATE TABLE `contact_us` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `contact_us` */

insert  into `contact_us`(`id`,`name`,`email`,`message`,`created_at`,`updated_at`) values (1,'Sajjad Hussain','sajjad.hussain@cubixlabs.com','Hello word','2019-10-17 14:58:50',NULL),(2,'Sajjad Hussain','sajjad.hussain@cubixlabs.com','Hello word','2019-10-17 14:59:59',NULL);

/*Table structure for table `content_pages` */

DROP TABLE IF EXISTS `content_pages`;

CREATE TABLE `content_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `content_pages` */

insert  into `content_pages`(`id`,`type`,`title`,`content`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values (1,'about','About Step App','<div style=\"margin: 0px 14.3906px 0px 28.7969px; padding: 0px; width: 436.797px; float: left; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><h2 style=\"margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; font-family: DauphinPlain; font-size: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div style=\"margin: 0px 28.7969px 0px 14.3906px; padding: 0px; width: 436.797px; float: right; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><h2 style=\"margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; font-family: DauphinPlain; font-size: 24px;\">Why do we use it?</h2><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div>',1,'2019-10-11 13:36:55',NULL,NULL),(2,'terms','Terms of Service','<div style=\"margin: 0px 14.3906px 0px 28.7969px; padding: 0px; width: 436.797px; float: left; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><h2 style=\"margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; font-family: DauphinPlain; font-size: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div style=\"margin: 0px 28.7969px 0px 14.3906px; padding: 0px; width: 436.797px; float: right; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><h2 style=\"margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; font-family: DauphinPlain; font-size: 24px;\">Why do we use it?</h2><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div>',1,'2019-10-11 13:37:23',NULL,NULL);

/*Table structure for table `courses` */

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `audio_allowed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `courses` */

insert  into `courses`(`id`,`title`,`icon`,`is_active`,`created_at`,`updated_at`,`deleted_at`,`audio_allowed`) values (1,'Listening','uploads/1/2019-10/icon.png',1,'2019-10-11 12:21:45','2019-10-11 12:46:06',NULL,1),(2,'Vocabulary','uploads/1/2019-10/icon.png',1,'2019-10-11 12:22:05',NULL,NULL,0),(3,'Writing','uploads/1/2019-10/icon.png',1,'2019-10-11 12:22:18',NULL,NULL,0),(4,'Reading','uploads/1/2019-10/icon.png',1,'2019-10-11 12:22:41',NULL,NULL,0),(5,'Grammar','uploads/1/2019-10/icon.png',1,'2019-10-11 12:22:47',NULL,NULL,0);

/*Table structure for table `lessons` */

DROP TABLE IF EXISTS `lessons`;

CREATE TABLE `lessons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overview` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `audio_file` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lessons_course_id_foreign` (`course_id`),
  KEY `lessons_created_by_foreign` (`created_by`),
  CONSTRAINT `lessons_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `lessons_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `cms_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `lessons` */

insert  into `lessons`(`id`,`identifier`,`course_id`,`created_by`,`title`,`overview`,`content`,`is_active`,`audio_file`,`created_at`,`updated_at`,`deleted_at`) values (1,'grammar',5,1,'Grammar Lesson 1','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has su','<div style=\"margin: 0px 14.3906px 0px 28.7969px; padding: 0px; width: 436.797px; float: left; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><h2 style=\"margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; font-family: DauphinPlain; font-size: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div style=\"margin: 0px 28.7969px 0px 14.3906px; padding: 0px; width: 436.797px; float: right; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><h2 style=\"margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; font-family: DauphinPlain; font-size: 24px;\">Why do we use it?</h2><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><p><br style=\"margin: 0px; padding: 0px; clear: both; font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: center;\"></p><div style=\"margin: 0px 14.3906px 0px 28.7969px; padding: 0px; width: 436.797px; float: left; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><h2 style=\"margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; font-family: DauphinPlain; font-size: 24px;\">Where does it come from?</h2><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify;\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div><div style=\"margin: 0px 28.7969px 0px 14.3906px; padding: 0px; width: 436.797px; float: right; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><h2 style=\"margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; font-family: DauphinPlain; font-size: 24px;\">Where can I get some?</h2><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify;\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p></div>',1,NULL,'2019-10-11 12:54:38',NULL,NULL),(2,'reading',2,1,'dfasfsdf','dfasfdsf','<p>fdsfasf</p>',1,NULL,'2019-10-18 10:36:37',NULL,NULL),(3,'listening',1,1,'Listening Lessong','Overview Here','<p>Content herer</p>',1,'uploads/1/2019-10/file_example_mp3_700kb.mp3','2019-10-18 10:38:43',NULL,'2019-10-18 11:18:01'),(4,'listening',1,1,'Listening Lesson','fasdfasdf','<p>fsadfsdfas</p>',1,'uploads/1/2019-10/file_example_mp3_700kb.mp3','2019-10-18 10:49:42',NULL,'2019-10-18 11:18:01'),(5,'listening',1,1,'Reset Password','fasdfa','<p>adfsf</p>',1,'uploads/1/2019-10/file_example_mp3_700kb.mp3','2019-10-18 10:53:29',NULL,'2019-10-18 11:18:01'),(6,'listening',1,1,'hello','fasdf','<p>sdaf</p>',1,'uploads/1/2019-10/file_example_mp3_700kb.mp3','2019-10-18 10:54:40',NULL,'2019-10-18 11:18:01'),(7,'listening',1,1,'fsadf','fasdf','<p>fasd</p>',1,'uploads/1/2019-10/file_example_mp3_700kb.mp3','2019-10-18 10:56:00',NULL,'2019-10-18 11:18:01'),(8,'listening',1,1,'fasdf','asdfasd','<p>fsdfa</p>',1,'uploads/1/2019-10/file_example_mp3_700kb.mp3','2019-10-18 11:01:34',NULL,'2019-10-18 11:18:01'),(9,'listening',1,1,'fsdafas','fasdf','<p>fsdaf</p>',1,'uploads/1/2019-10/file_example_mp3_700kb.mp3','2019-10-18 11:07:44',NULL,'2019-10-18 11:18:01'),(10,'listening',1,1,'fasdf','fasdf','<p>fasdf</p>',1,'uploads/1/2019-10/file_example_mp3_700kb.mp3','2019-10-18 11:09:24',NULL,'2019-10-18 11:18:01'),(11,'listening',1,1,'fasdf','asdf','<p>fasdf</p>',1,'uploads/1/2019-10/teste_3.pdf','2019-10-18 11:12:28',NULL,'2019-10-18 11:18:01'),(12,'listening',1,1,'fasdfa','dfasf','<p>asdf</p>',1,'uploads/1/2019-10/608420450edcabb9042d4153c4f25b4f.pdf','2019-10-18 11:16:25',NULL,'2019-10-18 11:18:01'),(13,'listening',1,1,'Forgot Password','fasdf','<p>daf</p>',1,'uploads/1/2019-10/07f0dd6664712c88b750c95b27747d78.mp3','2019-10-18 11:16:52',NULL,'2019-10-18 11:18:01'),(14,'listening',1,1,'Listening Lesson','Overview here','<p>Content here</p>',1,NULL,'2019-10-18 11:18:33',NULL,NULL),(15,'listening',1,1,'fasfd','asdf','<p>fasdfa</p>',1,'uploads/1/2019-10/93d8e38ba4e0dd77a6813928bcffdd91.mp3','2019-10-18 11:22:43',NULL,NULL);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2016_08_07_145904_add_table_cms_apicustom',1),(2,'2016_08_07_150834_add_table_cms_dashboard',1),(3,'2016_08_07_151210_add_table_cms_logs',1),(4,'2016_08_07_151211_add_details_cms_logs',1),(5,'2016_08_07_152014_add_table_cms_privileges',1),(6,'2016_08_07_152214_add_table_cms_privileges_roles',1),(7,'2016_08_07_152320_add_table_cms_settings',1),(8,'2016_08_07_152421_add_table_cms_users',1),(9,'2016_08_07_154624_add_table_cms_menus_privileges',1),(10,'2016_08_07_154624_add_table_cms_moduls',1),(11,'2016_08_17_225409_add_status_cms_users',1),(12,'2016_08_20_125418_add_table_cms_notifications',1),(13,'2016_09_04_033706_add_table_cms_email_queues',1),(14,'2016_09_16_035347_add_group_setting',1),(15,'2016_09_16_045425_add_label_setting',1),(16,'2016_09_17_104728_create_nullable_cms_apicustom',1),(17,'2016_10_01_141740_add_method_type_apicustom',1),(18,'2016_10_01_141846_add_parameters_apicustom',1),(19,'2016_10_01_141934_add_responses_apicustom',1),(20,'2016_10_01_144826_add_table_apikey',1),(21,'2016_11_14_141657_create_cms_menus',1),(22,'2016_11_15_132350_create_cms_email_templates',1),(23,'2016_11_15_190410_create_cms_statistics',1),(24,'2016_11_17_102740_create_cms_statistic_components',1),(25,'2017_06_06_164501_add_deleted_at_cms_moduls',1),(26,'2019_10_11_113747_create_courses_table',2),(27,'2019_10_11_113753_create_lessons_table',2),(28,'2019_10_11_114349_create_quizzes_table',2),(29,'2019_10_11_114625_create_options_table',2),(30,'2019_10_11_114959_create_content_pages_table',2),(31,'2019_10_11_115300_create_reviews_table',2),(32,'2019_10_11_134049_create_app_users_table',3),(33,'2019_10_11_134104_create_access_tokens_table',3),(34,'2019_10_11_134847_create_mock_quizzes_table',3),(35,'2019_10_11_134922_create_mock_quiz_options_table',4);

/*Table structure for table `mock_quiz_options` */

DROP TABLE IF EXISTS `mock_quiz_options`;

CREATE TABLE `mock_quiz_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mock_quiz_id` int(10) unsigned NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT '1',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mock_quiz_options_mock_quiz_id_foreign` (`mock_quiz_id`),
  CONSTRAINT `mock_quiz_options_mock_quiz_id_foreign` FOREIGN KEY (`mock_quiz_id`) REFERENCES `mock_quizzes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mock_quiz_options` */

insert  into `mock_quiz_options`(`id`,`mock_quiz_id`,`answer`,`is_correct`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values (1,1,'Option 1',0,1,'2019-10-11 14:04:24',NULL,NULL),(2,1,'Option 2',0,1,'2019-10-11 14:04:28',NULL,NULL),(3,1,'Option 3',1,1,'2019-10-11 14:04:30','2019-10-11 14:04:37',NULL),(4,2,'Options here',1,1,NULL,NULL,NULL);

/*Table structure for table `mock_quiz_result` */

DROP TABLE IF EXISTS `mock_quiz_result`;

CREATE TABLE `mock_quiz_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_questions` int(11) NOT NULL,
  `attempted` int(11) NOT NULL,
  `correct` int(11) NOT NULL,
  `wrong` int(11) NOT NULL,
  `score` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'fail',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `mock_quiz_result` */

insert  into `mock_quiz_result`(`id`,`total_questions`,`attempted`,`correct`,`wrong`,`score`,`user_id`,`status`,`created_at`,`updated_at`) values (2,7,6,3,3,'37.50%',8,'Fail','2019-10-17 15:31:14',NULL);

/*Table structure for table `mock_quizzes` */

DROP TABLE IF EXISTS `mock_quizzes`;

CREATE TABLE `mock_quizzes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mock_quizzes` */

insert  into `mock_quizzes`(`id`,`question`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values (1,'Mock Question 1',1,'2019-10-11 14:04:16',NULL,NULL),(2,'Mock Question 2',1,'2019-10-11 14:04:46',NULL,NULL),(3,'aabbcc',1,'2019-10-11 14:30:37',NULL,NULL),(4,'Grammar Lesson 1 Question 3ss',1,'2019-10-14 14:31:25','2019-10-14 14:31:25',NULL),(5,'Grammar Lesson 1 Question 3ss',1,'2019-10-14 14:32:15','2019-10-14 14:32:15',NULL),(6,'www',1,'2019-10-14 14:32:31','2019-10-14 14:32:31',NULL),(7,'Dummy Question',1,'2019-10-16 08:55:28','2019-10-16 08:55:28',NULL);

/*Table structure for table `options` */

DROP TABLE IF EXISTS `options`;

CREATE TABLE `options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` int(10) unsigned NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT '1',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `options_quiz_id_foreign` (`quiz_id`),
  CONSTRAINT `options_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `options` */

insert  into `options`(`id`,`quiz_id`,`answer`,`is_correct`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values (1,2,'Option 1',0,1,'2019-10-11 13:21:30','2019-10-11 13:29:31',NULL),(2,2,'Option 2',1,1,'2019-10-11 13:29:43','2019-10-11 13:30:26',NULL),(3,2,'Option 3',0,1,'2019-10-11 13:29:49',NULL,NULL),(37,34,'ss',1,1,'2019-10-14 12:21:01','2019-10-14 12:21:01',NULL),(38,34,'aa',0,1,'2019-10-14 12:21:01','2019-10-14 12:21:01',NULL),(39,35,'ss',1,1,'2019-10-14 12:22:32','2019-10-14 12:22:32',NULL),(40,35,'aa',0,1,'2019-10-14 12:22:32','2019-10-14 12:22:32',NULL),(41,36,'55',0,1,'2019-10-15 07:23:29','2019-10-15 07:23:29',NULL),(42,36,'44',1,1,'2019-10-15 07:23:29','2019-10-15 07:23:29',NULL),(43,36,'33',0,1,'2019-10-15 07:23:29','2019-10-15 07:23:29',NULL),(44,36,'ee',0,1,'2019-10-15 07:23:29','2019-10-15 07:23:29',NULL),(45,37,'2',1,1,'2019-10-15 07:39:32','2019-10-15 07:39:32',NULL),(46,37,'ss',0,1,'2019-10-15 07:39:32','2019-10-15 07:39:32',NULL),(47,38,'sdfddf',1,1,'2019-10-15 07:43:27','2019-10-15 07:43:27',NULL),(48,38,'fssfd',0,1,'2019-10-15 07:43:27','2019-10-15 07:43:27',NULL),(49,38,'sfd',0,1,'2019-10-15 07:43:27','2019-10-15 07:43:27',NULL),(50,45,'Op 1',1,1,'2019-10-18 12:37:16','2019-10-18 12:37:16',NULL),(51,45,'Op 2',0,1,'2019-10-18 12:37:16','2019-10-18 12:37:16',NULL),(52,45,'Op 3',0,1,'2019-10-18 12:37:16','2019-10-18 12:37:16',NULL),(53,46,'Option 1',1,1,'2019-10-18 17:42:18','2019-10-18 17:42:18',NULL),(54,46,'Option 2',0,1,'2019-10-18 17:42:18','2019-10-18 17:42:18',NULL),(55,47,'Option 3',1,1,'2019-10-18 17:42:56','2019-10-18 17:42:56',NULL),(56,47,'dfasf',0,1,'2019-10-18 17:42:56','2019-10-18 17:42:56',NULL);

/*Table structure for table `quiz_result` */

DROP TABLE IF EXISTS `quiz_result`;

CREATE TABLE `quiz_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_questions` int(11) NOT NULL,
  `attempted` int(11) NOT NULL,
  `correct` int(11) NOT NULL,
  `wrong` int(11) NOT NULL,
  `score` varchar(10) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'fail',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `quiz_result` */

insert  into `quiz_result`(`id`,`total_questions`,`attempted`,`correct`,`wrong`,`score`,`lesson_id`,`course_id`,`user_id`,`status`,`created_at`,`updated_at`) values (3,7,4,2,2,'28.57%',1,5,8,'Fail','2019-10-18 11:45:22',NULL),(6,4,3,1,2,'14.29%',15,1,8,'Fail','2019-10-18 17:46:16',NULL);

/*Table structure for table `quizzes` */

DROP TABLE IF EXISTS `quizzes`;

CREATE TABLE `quizzes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lesson_id` int(10) unsigned NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `quizzes` */

insert  into `quizzes`(`id`,`lesson_id`,`question`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values (1,1,'Grammar Lesson 1 Question 1',1,'2019-10-11 12:59:49','2019-10-11 12:59:54',NULL),(2,1,'Grammar Lesson 1 Question 2',1,'2019-10-11 13:20:35',NULL,NULL),(10,1,'Grammar Lesson 1 Question 3',1,'2019-10-14 07:34:35','2019-10-14 07:43:03','2019-10-14 12:13:02'),(11,1,'Grammar Lesson 1 Question 4',1,'2019-10-14 10:34:18','2019-10-14 10:34:18','2019-10-14 12:12:55'),(34,1,'Grammar Lesson 1 Question 3',1,'2019-10-14 12:21:01','2019-10-14 12:21:01',NULL),(35,1,'Grammar Lesson 1 Question 3s',1,'2019-10-14 12:22:32','2019-10-14 12:22:32',NULL),(36,1,'Grammar Lesson 1 Question 35',1,'2019-10-15 07:23:29','2019-10-15 07:23:29',NULL),(37,1,'Grammar Lesson 1 Question 3566',1,'2019-10-15 07:39:32','2019-10-15 07:39:32',NULL),(38,1,'Grammar Lesson 1 Question 4sfgs',1,'2019-10-15 07:43:27','2019-10-15 07:43:27',NULL),(44,15,'fasdfasdf',1,'2019-10-18 12:36:31','2019-10-18 12:36:31',NULL),(45,15,'Question for Listening',1,'2019-10-18 12:37:16','2019-10-18 12:37:16',NULL),(46,15,'Another Question Bro',1,'2019-10-18 17:42:18','2019-10-18 17:42:18',NULL),(47,15,'Some New questions',1,'2019-10-18 17:42:56','2019-10-18 17:42:56',NULL);

/*Table structure for table `reviews` */

DROP TABLE IF EXISTS `reviews`;

CREATE TABLE `reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `review_by` int(10) unsigned NOT NULL,
  `lesson_id` int(10) unsigned NOT NULL,
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `review` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reviews_1_idx` (`review_by`),
  KEY `fk_reviews_2_idx` (`lesson_id`),
  CONSTRAINT `reviews_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`review_by`) REFERENCES `app_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `reviews` */

insert  into `reviews`(`id`,`review_by`,`lesson_id`,`rating`,`review`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values (20,8,1,'3','Ratings here',1,'2019-10-16 12:08:35','2019-10-21 08:03:35',NULL),(21,7,1,'4','Good Lesson',1,'2019-10-16 12:08:41',NULL,NULL),(23,8,15,'3','Ratings here',1,'2019-10-21 08:03:46',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
