/*
SQLyog Ultimate v11.25 (64 bit)
MySQL - 8.0.26 : Database - tacodb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tacodb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `tacodb`;

/*Table structure for table `ingredient` */

DROP TABLE IF EXISTS `ingredient`;

CREATE TABLE `ingredient` (
  `id` varchar(4) NOT NULL,
  `name` varchar(25) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `ingredient` */

insert  into `ingredient`(`id`,`name`,`type`) values ('CARN','Carnitas','PROTEIN'),('CHED','Cheddar','CHEESE'),('COTO','Corn Tortilla','WRAP'),('FLTO','Flour Tortilla','WRAP'),('GRBF','Ground Beef','PROTEIN'),('JACK','Monterrey Jack','CHEESE'),('LETC','Lettuce','VEGGIES'),('SLSA','Salsa','SAUCE'),('SRCR','Sour Cream','SAUCE'),('TMTO','Diced Tomatoes','VEGGIES');

/*Table structure for table `taco` */

DROP TABLE IF EXISTS `taco`;

CREATE TABLE `taco` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `createdAt` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

/*Data for the table `taco` */

insert  into `taco`(`id`,`name`,`createdAt`) values (3,'mytaco','2022-06-28 16:27:20'),(4,'tacone','2022-06-28 16:31:30'),(5,'mytaut','2022-06-28 16:40:47'),(6,'tacone','2022-06-28 16:54:56'),(8,'tactao','2022-06-28 16:59:37');

/*Table structure for table `taco_ingredients` */

DROP TABLE IF EXISTS `taco_ingredients`;

CREATE TABLE `taco_ingredients` (
  `taco` bigint NOT NULL,
  `ingredient` varchar(4) NOT NULL,
  KEY `taco` (`taco`),
  KEY `ingredient` (`ingredient`),
  CONSTRAINT `taco_ingredients_ibfk_1` FOREIGN KEY (`taco`) REFERENCES `taco` (`id`),
  CONSTRAINT `taco_ingredients_ibfk_2` FOREIGN KEY (`ingredient`) REFERENCES `ingredient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `taco_ingredients` */

insert  into `taco_ingredients`(`taco`,`ingredient`) values (3,'COTO'),(3,'GRBF'),(3,'CHED'),(3,'TMTO'),(3,'SLSA'),(4,'COTO'),(4,'GRBF'),(4,'CHED'),(4,'LETC'),(4,'SLSA'),(5,'COTO'),(5,'GRBF'),(5,'CHED'),(5,'TMTO'),(5,'SLSA'),(6,'COTO'),(6,'GRBF'),(6,'CHED'),(6,'TMTO'),(6,'SLSA'),(8,'FLTO'),(8,'CARN'),(8,'CHED'),(8,'TMTO'),(8,'SRCR');

/*Table structure for table `taco_order` */

DROP TABLE IF EXISTS `taco_order`;

CREATE TABLE `taco_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `ccNumber` varchar(16) NOT NULL,
  `ccExpiration` varchar(5) NOT NULL,
  `ccCVV` varchar(3) NOT NULL,
  `placedAt` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

/*Data for the table `taco_order` */

insert  into `taco_order`(`id`,`name`,`street`,`city`,`state`,`zip`,`ccNumber`,`ccExpiration`,`ccCVV`,`placedAt`) values (1,'chongtao','street','London','El','0516487','4388576018410707','05/22','233','2022-06-28 16:27:44'),(2,'Tim','Beik','Mihua','Ja','4542452','4388576018410707','06/22','234','2022-06-28 16:33:56'),(3,'Jck','Shanghai','Guangzhou','TR','45796164','4388576018410707','07/22','235','2022-06-28 16:41:27'),(4,'Lili','Moon','Star','lo','521314','4388576018410707','08/22','236','2022-06-28 16:55:51'),(5,'Will','will','will','we','324661431','4388576018410707','09/22','239','2022-06-28 17:00:16');

/*Table structure for table `taco_order_tacos` */

DROP TABLE IF EXISTS `taco_order_tacos`;

CREATE TABLE `taco_order_tacos` (
  `tacoOrder` bigint NOT NULL,
  `taco` bigint NOT NULL,
  KEY `tacoOrder` (`tacoOrder`),
  KEY `taco` (`taco`),
  CONSTRAINT `taco_order_tacos_ibfk_1` FOREIGN KEY (`tacoOrder`) REFERENCES `taco_order` (`id`),
  CONSTRAINT `taco_order_tacos_ibfk_2` FOREIGN KEY (`taco`) REFERENCES `taco` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `taco_order_tacos` */

insert  into `taco_order_tacos`(`tacoOrder`,`taco`) values (1,3),(2,4),(3,5),(4,6),(5,8);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
