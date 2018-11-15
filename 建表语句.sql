/*
SQLyog Ultimate v11.42 (64 bit)
MySQL - 5.0.95-community-nt : Database - taotao
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`taotao` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `taotao`;

/*Table structure for table `tb_content` */

DROP TABLE IF EXISTS `tb_content`;

CREATE TABLE `tb_content` (
  `id` bigint(20) NOT NULL auto_increment,
  `category_id` bigint(20) default NULL,
  `title` varchar(255) default NULL,
  `sub_title` varchar(255) default NULL,
  `title_desc` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  `pic` varchar(255) default NULL,
  `pic2` varchar(255) default NULL,
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_content` */

/*Table structure for table `tb_content_category` */

DROP TABLE IF EXISTS `tb_content_category`;

CREATE TABLE `tb_content_category` (
  `id` bigint(20) NOT NULL auto_increment,
  `parent_id` bigint(20) default NULL,
  `name` varchar(255) default NULL,
  `status` int(11) default NULL,
  `sort_order` int(11) default NULL,
  `is_parent` bit(1) default NULL,
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_content_category` */

/*Table structure for table `tb_item` */

DROP TABLE IF EXISTS `tb_item`;

CREATE TABLE `tb_item` (
  `id` bigint(20) default NULL,
  `title` varchar(255) default NULL,
  `sell_point` varchar(255) default NULL,
  `price` bigint(20) default NULL,
  `num` int(11) default NULL,
  `barcode` varchar(255) default NULL,
  `image` varchar(255) default NULL,
  `cid` bigint(20) default NULL,
  `status` tinyint(4) default NULL,
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL default '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_item` */

/*Table structure for table `tb_item_cat` */

DROP TABLE IF EXISTS `tb_item_cat`;

CREATE TABLE `tb_item_cat` (
  `id` bigint(20) default NULL,
  `parent_id` bigint(20) default NULL,
  `name` varchar(255) default NULL,
  `status` int(11) default NULL,
  `sort_order` int(11) default NULL,
  `is_parent` bit(1) default NULL,
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL default '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_item_cat` */

/*Table structure for table `tb_item_desc` */

DROP TABLE IF EXISTS `tb_item_desc`;

CREATE TABLE `tb_item_desc` (
  `item_id` bigint(20) default NULL,
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL default '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_item_desc` */

/*Table structure for table `tb_item_param` */

DROP TABLE IF EXISTS `tb_item_param`;

CREATE TABLE `tb_item_param` (
  `id` bigint(20) default NULL,
  `item_cat_id` bigint(20) default NULL,
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL default '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_item_param` */

/*Table structure for table `tb_item_param_item` */

DROP TABLE IF EXISTS `tb_item_param_item`;

CREATE TABLE `tb_item_param_item` (
  `id` bigint(20) default NULL,
  `item_id` bigint(20) default NULL,
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL default '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_item_param_item` */

/*Table structure for table `tb_order` */

DROP TABLE IF EXISTS `tb_order`;

CREATE TABLE `tb_order` (
  `order_id` varchar(255) default NULL,
  `payment` varchar(255) default NULL,
  `payment_type` int(11) default NULL,
  `post_fee` varchar(255) default NULL,
  `status` int(11) default NULL,
  `create_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `payment_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `consign_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `end_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `close_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `shipping_name` varchar(255) default NULL,
  `shipping_code` varchar(255) default NULL,
  `user_id` bigint(20) default NULL,
  `buyer_message` varchar(255) default NULL,
  `buyer_nick` varchar(255) default NULL,
  `buyer_rate` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_order` */

/*Table structure for table `tb_order_item` */

DROP TABLE IF EXISTS `tb_order_item`;

CREATE TABLE `tb_order_item` (
  `id` varchar(255) default NULL,
  `item_id` varchar(255) default NULL,
  `order_id` varchar(255) default NULL,
  `num` int(11) default NULL,
  `title` varchar(255) default NULL,
  `price` bigint(20) default NULL,
  `total_fee` bigint(20) default NULL,
  `pic_path` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_order_item` */

/*Table structure for table `tb_order_shipping` */

DROP TABLE IF EXISTS `tb_order_shipping`;

CREATE TABLE `tb_order_shipping` (
  `order_id` varchar(255) default NULL,
  `receiver_name` varchar(255) default NULL,
  `receiver_phone` varchar(255) default NULL,
  `receiver_mobile` varchar(255) default NULL,
  `receiver_state` varchar(255) default NULL,
  `receiver_city` varchar(255) default NULL,
  `receiver_district` varchar(255) default NULL,
  `receiver_address` varchar(255) default NULL,
  `receiver_zip` varchar(255) default NULL,
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL default '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_order_shipping` */

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` bigint(20) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
