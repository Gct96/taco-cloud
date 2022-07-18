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
  `create_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;

/*Data for the table `taco` */

insert  into `taco`(`id`,`name`,`create_at`) values (3,'mytaco','2022-06-28 16:27:20'),(4,'tacone','2022-06-28 16:31:30'),(5,'mytaut','2022-06-28 16:40:47'),(6,'tacone','2022-06-28 16:54:56'),(8,'tactao','2022-06-28 16:59:37'),(13,'Mctaco','2022-07-18 13:15:11'),(14,'Mctaco','2022-07-18 13:16:30'),(15,'Mctaco','2022-07-18 13:25:46'),(16,'Mctaco','2022-07-18 15:54:17'),(17,'Mmtaco','2022-07-18 16:50:23'),(18,'Wftaco','2022-07-18 16:59:37'),(19,'wftaco','2022-07-18 17:10:09');

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

insert  into `taco_ingredients`(`taco`,`ingredient`) values (3,'COTO'),(3,'GRBF'),(3,'CHED'),(3,'TMTO'),(3,'SLSA'),(4,'COTO'),(4,'GRBF'),(4,'CHED'),(4,'LETC'),(4,'SLSA'),(5,'COTO'),(5,'GRBF'),(5,'CHED'),(5,'TMTO'),(5,'SLSA'),(6,'COTO'),(6,'GRBF'),(6,'CHED'),(6,'TMTO'),(6,'SLSA'),(8,'FLTO'),(8,'CARN'),(8,'CHED'),(8,'TMTO'),(8,'SRCR'),(13,'COTO'),(13,'GRBF'),(13,'JACK'),(13,'TMTO'),(13,'SLSA'),(14,'COTO'),(14,'GRBF'),(14,'JACK'),(14,'LETC'),(14,'SLSA'),(15,'COTO'),(15,'GRBF'),(15,'JACK'),(15,'LETC'),(15,'SLSA'),(16,'COTO'),(16,'GRBF'),(16,'JACK'),(16,'TMTO'),(16,'SRCR'),(17,'COTO'),(17,'GRBF'),(17,'JACK'),(17,'TMTO'),(17,'SRCR'),(18,'COTO'),(18,'GRBF'),(18,'JACK'),(18,'TMTO'),(18,'SRCR'),(19,'COTO'),(19,'GRBF'),(19,'JACK'),(19,'LETC'),(19,'SLSA');

/*Table structure for table `taco_order` */

DROP TABLE IF EXISTS `taco_order`;

CREATE TABLE `taco_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `cc_number` varchar(16) NOT NULL,
  `cc_expiration` varchar(5) NOT NULL,
  `cc_cvv` varchar(3) NOT NULL,
  `place_at` timestamp NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `taco_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

/*Data for the table `taco_order` */

insert  into `taco_order`(`id`,`name`,`street`,`city`,`state`,`zip`,`cc_number`,`cc_expiration`,`cc_cvv`,`place_at`,`user_id`) values (1,'chongtao','street','London','El','0516487','4388576018410707','05/22','233','2022-06-28 16:27:44',NULL),(2,'Tim','Beik','Mihua','Ja','4542452','4388576018410707','06/22','234','2022-06-28 16:33:56',NULL),(3,'Jck','Shanghai','Guangzhou','TR','45796164','4388576018410707','07/22','235','2022-06-28 16:41:27',NULL),(4,'Lili','Moon','Star','lo','521314','4388576018410707','08/22','236','2022-06-28 16:55:51',NULL),(5,'Will','will','will','we','324661431','4388576018410707','09/22','239','2022-06-28 17:00:16',NULL),(8,'waifu','ville','Angels','TX','12345','4388576018410707','09/25','245','2022-07-18 17:10:34',2);

/*Table structure for table `taco_order_tacos` */

DROP TABLE IF EXISTS `taco_order_tacos`;

CREATE TABLE `taco_order_tacos` (
  `order_num` bigint NOT NULL,
  `taco` bigint NOT NULL,
  KEY `tacoOrder` (`order_num`),
  KEY `taco` (`taco`),
  CONSTRAINT `taco_order_tacos_ibfk_1` FOREIGN KEY (`order_num`) REFERENCES `taco_order` (`id`),
  CONSTRAINT `taco_order_tacos_ibfk_2` FOREIGN KEY (`taco`) REFERENCES `taco` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `taco_order_tacos` */

insert  into `taco_order_tacos`(`order_num`,`taco`) values (1,3),(2,4),(3,5),(4,6),(5,8),(8,19);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fullname` varchar(80) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `phone` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`fullname`,`street`,`city`,`state`,`zip`,`phone`) values (1,'testname','86bfcc5a97580b2e379176099e8901e39f26ee777281d41f4282d5bd7355fd0032f7cdd773abaa65','Test McTest','Test Street','ville','TX','12345','1231231234'),(2,'name','6f52f67e91eae05c0ff72842ad7ebfa5d609674daa2187b75b52ab09be2c5349d8fb98ac1254a5f5','Test McTest','Test Street','ville','TX','12345','1231231234');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
