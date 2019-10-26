/*
Navicat MySQL Data Transfer

Source Server         : My
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : imooc_o2o

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-10-26 16:23:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for o2o_area
-- ----------------------------
DROP TABLE IF EXISTS `o2o_area`;
CREATE TABLE `o2o_area` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `uname` varchar(50) NOT NULL DEFAULT '',
  `city_id` int(11) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `city_id` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_area
-- ----------------------------

-- ----------------------------
-- Table structure for o2o_bis
-- ----------------------------
DROP TABLE IF EXISTS `o2o_bis`;
CREATE TABLE `o2o_bis` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `uname` varchar(50) NOT NULL DEFAULT '',
  `licence_logo` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `city_id` int(11) unsigned NOT NULL DEFAULT '0',
  `city_path` varchar(50) NOT NULL DEFAULT '0',
  `bank_info` varchar(50) NOT NULL DEFAULT '0',
  `money` decimal(20,2) NOT NULL DEFAULT '0.00',
  `bank_name` varchar(50) NOT NULL DEFAULT '',
  `bank_user` varchar(50) NOT NULL DEFAULT '',
  `faren` varchar(20) NOT NULL DEFAULT '',
  `faren_tel` varchar(20) NOT NULL DEFAULT '',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_bis
-- ----------------------------
INSERT INTO `o2o_bis` VALUES ('1', '删除状态', 'eshuo@outlook.com', '/upload\\20191022\\a4bbb9d023c064618113aa086855ca3b.jpg', '', '/upload\\20191022\\1d7d3bb0935449f8c99829517693d317.', '<p>PHP是世界最好的语言</p>', '3', '3,4', '123', '0.00', 'PHP是世界最好的语言', 'PHP是世界最好的语言', 'PHP是世界最好的语言', '13411787878', '0', '-1', '1571733598', '1571733598');
INSERT INTO `o2o_bis` VALUES ('3', '删除状态', 'eshuo@outlook.com', '/upload\\20191022\\a4bbb9d023c064618113aa086855ca3b.jpg', '', '/upload\\20191022\\1d7d3bb0935449f8c99829517693d317.', '<p>PHP是世界最好的语言</p>', '3', '3,4', '123', '0.00', 'PHP是世界最好的语言', 'PHP是世界最好的语言', 'PHP是世界最好的语言', '13411787878', '0', '-1', '1571733598', '1571733598');
INSERT INTO `o2o_bis` VALUES ('5', '删除状态', 'eshuo@outlook.com', '/upload\\20191022\\a4bbb9d023c064618113aa086855ca3b.jpg', '', '/upload\\20191022\\1d7d3bb0935449f8c99829517693d317.', '<p>PHP是世界最好的语言</p>', '3', '3,4', '123', '0.00', 'PHP是世界最好的语言', 'PHP是世界最好的语言', 'PHP是世界最好的语言', '13411787878', '0', '-1', '1571733598', '1571733598');
INSERT INTO `o2o_bis` VALUES ('6', '待审状态', 'eshuo@outlook.com', '/upload\\20191022\\a4bbb9d023c064618113aa086855ca3b.jpg', '', '/upload\\20191022\\1d7d3bb0935449f8c99829517693d317.', '<p>PHP是世界最好的语言</p>', '3', '3,4', '123', '0.00', 'PHP是世界最好的语言', 'PHP是世界最好的语言', 'PHP是世界最好的语言', '13411787878', '0', '0', '1571733598', '1571733598');
INSERT INTO `o2o_bis` VALUES ('7', '待审状态', 'eshuo@outlook.com', '/upload\\20191022\\a4bbb9d023c064618113aa086855ca3b.jpg', '', '/upload\\20191022\\1d7d3bb0935449f8c99829517693d317.', '<p>PHP是世界最好的语言</p>', '3', '3,4', '123', '0.00', 'PHP是世界最好的语言', 'PHP是世界最好的语言', 'PHP是世界最好的语言', '13411787878', '0', '0', '1571733598', '1571733598');
INSERT INTO `o2o_bis` VALUES ('8', '待审状态', 'eshuo@outlook.com', '/upload\\20191022\\a4bbb9d023c064618113aa086855ca3b.jpg', '', '/upload\\20191022\\1d7d3bb0935449f8c99829517693d317.', '<p>PHP是世界最好的语言</p>', '3', '3,4', '123', '0.00', 'PHP是世界最好的语言', 'PHP是世界最好的语言', 'PHP是世界最好的语言', '13411787878', '0', '0', '1571733598', '1571733598');
INSERT INTO `o2o_bis` VALUES ('9', '正常状态', 'eshuo@outlook.com', '/upload\\20191022\\a4bbb9d023c064618113aa086855ca3b.jpg', '', '/upload\\20191022\\1d7d3bb0935449f8c99829517693d317.', '<p>PHP是世界最好的语言</p>', '3', '3,4', '123', '0.00', 'PHP是世界最好的语言', 'PHP是世界最好的语言', 'PHP是世界最好的语言', '13411787878', '0', '1', '1571733598', '1571733598');
INSERT INTO `o2o_bis` VALUES ('10', '正常状态', 'eshuo@outlook.com', '/upload\\20191022\\a4bbb9d023c064618113aa086855ca3b.jpg', '', '/upload\\20191022\\1d7d3bb0935449f8c99829517693d317.', '<p>PHP是世界最好的语言</p>', '3', '3,4', '123', '0.00', 'PHP是世界最好的语言', 'PHP是世界最好的语言', 'PHP是世界最好的语言', '13411787878', '0', '1', '1571733598', '1571733598');
INSERT INTO `o2o_bis` VALUES ('11', '正常状态', 'eshuo@outlook.com', '/upload\\20191022\\a4bbb9d023c064618113aa086855ca3b.jpg', '', '/upload\\20191022\\1d7d3bb0935449f8c99829517693d317.', '<p>PHP是世界最好的语言</p>', '3', '3,4', '123', '0.00', 'PHP是世界最好的语言', 'PHP是世界最好的语言', 'PHP是世界最好的语言', '13411787878', '0', '1', '1571733598', '1571733598');

-- ----------------------------
-- Table structure for o2o_bis_account
-- ----------------------------
DROP TABLE IF EXISTS `o2o_bis_account`;
CREATE TABLE `o2o_bis_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `code` varchar(10) NOT NULL DEFAULT '',
  `bis_id` int(11) unsigned NOT NULL DEFAULT '0',
  `last_login_ip` varchar(20) NOT NULL DEFAULT '',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0',
  `is_main` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bis_id` (`bis_id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_bis_account
-- ----------------------------
INSERT INTO `o2o_bis_account` VALUES ('1', 'admin1', '202cb962ac59075b964b07152d234b70', '9588', '3', '', '0', '1', '0', '0', '0', '0');
INSERT INTO `o2o_bis_account` VALUES ('2', 'admin', '202cb962ac59075b964b07152d234b70', '3449', '9', '', '1571748942', '1', '0', '1', '1486234748', '1571748942');
INSERT INTO `o2o_bis_account` VALUES ('4', 'admin3', '8881854a47e7a52b08d4e7c0af73d6da', '8216', '4', '', '1571730547', '1', '0', '1', '1571730472', '1571730547');
INSERT INTO `o2o_bis_account` VALUES ('5', 'eshuo', '2b6fd52a109d1d684c48fd83be3e1632', '4428', '5', '', '0', '1', '0', '0', '1571733598', '1571733598');

-- ----------------------------
-- Table structure for o2o_bis_location
-- ----------------------------
DROP TABLE IF EXISTS `o2o_bis_location`;
CREATE TABLE `o2o_bis_location` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `tel` varchar(20) NOT NULL DEFAULT '',
  `contact` varchar(20) NOT NULL DEFAULT '',
  `xpoint` varchar(20) NOT NULL DEFAULT '',
  `ypoint` varchar(20) NOT NULL DEFAULT '',
  `bis_id` int(11) unsigned NOT NULL DEFAULT '0',
  `open_time` int(11) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `is_main` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `api_address` varchar(255) NOT NULL DEFAULT '0',
  `city_id` int(11) unsigned NOT NULL DEFAULT '0',
  `city_path` varchar(50) NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  `category_path` varchar(50) NOT NULL DEFAULT '0',
  `bank_info` varchar(50) NOT NULL DEFAULT '0',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bis_id` (`bis_id`),
  KEY `city_id` (`city_id`),
  KEY `category_id` (`category_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_bis_location
-- ----------------------------
INSERT INTO `o2o_bis_location` VALUES ('4', 'PHP是世界最好的语言', '/upload\\20191022\\a4bbb9d023c064618113aa086855ca3b.jpg', '', '13411787878', '13411787878', '', '', '9', '8', '<p>PHP是世界最好的语言</p>', '1', 'PHP是世界最好的语言', '3', '3,4', '1', '1,6|5', '0', '0', '1', '1571733598', '1571733598');
INSERT INTO `o2o_bis_location` VALUES ('5', '新增门店', '/upload\\20191022\\7203d4ffe92d50375f5c7d9a656cee34.png', '', '这是测试数据', '这是测试数据', '', '', '9', '0', '<p><span style=\"border: 1px solid rgb(0, 0, 0);\"></span></p><pre style=\"background-color:#2b2b2b;color:#a9b7c6;font-family:&#39;宋体&#39;;font-size:12.8pt;\">//&nbsp;下面没有做&nbsp;定位功能</pre><p><span style=\"border: 1px solid rgb(0, 0, 0);\"></span><br/></p>', '0', '这是测试数据', '1', '1,2', '1', '1,', '0', '0', '1', '1571745894', '1571745894');

-- ----------------------------
-- Table structure for o2o_category
-- ----------------------------
DROP TABLE IF EXISTS `o2o_category`;
CREATE TABLE `o2o_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_category
-- ----------------------------
INSERT INTO `o2o_category` VALUES ('1', '美食', '0', '12', '1', '1522673663', '1571821814');
INSERT INTO `o2o_category` VALUES ('2', '一点点', '0', '4', '-1', '1522673872', '1571650857');
INSERT INTO `o2o_category` VALUES ('3', '娱乐', '0', '11', '1', '1522673934', '1571821823');
INSERT INTO `o2o_category` VALUES ('4', '汉堡', '1', '0', '1', '1522674801', '1522674801');
INSERT INTO `o2o_category` VALUES ('5', '薯条', '1', '1', '1', '1522675065', '1522823254');
INSERT INTO `o2o_category` VALUES ('6', '可乐', '1', '0', '1', '4294967295', '1522675201');
INSERT INTO `o2o_category` VALUES ('10', 'KTV', '1', '0', '1', '1571638488', '1571638488');

-- ----------------------------
-- Table structure for o2o_city
-- ----------------------------
DROP TABLE IF EXISTS `o2o_city`;
CREATE TABLE `o2o_city` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `uname` varchar(50) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `is_default` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uname` (`uname`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_city
-- ----------------------------
INSERT INTO `o2o_city` VALUES ('1', '北京', 'beijing1', '0', '0', '0', '1', '1522673872', '1522673872');
INSERT INTO `o2o_city` VALUES ('2', '北京', 'beijing', '1', '0', '0', '1', '1522673872', '1522673872');
INSERT INTO `o2o_city` VALUES ('3', '江西', 'jiangxi', '3', '0', '0', '1', '1522673872', '1522673872');
INSERT INTO `o2o_city` VALUES ('4', '南昌', 'nanchang', '3', '0', '0', '1', '1522673872', '1522673872');
INSERT INTO `o2o_city` VALUES ('5', '上饶', 'shangrao', '3', '1', '0', '1', '1522673872', '1522673872');
INSERT INTO `o2o_city` VALUES ('6', '抚州', 'fuzhou', '3', '0', '0', '1', '1522673872', '1522673872');
INSERT INTO `o2o_city` VALUES ('7', '景德镇', 'jdz', '3', '0', '0', '1', '1522673872', '1522673872');

-- ----------------------------
-- Table structure for o2o_deal
-- ----------------------------
DROP TABLE IF EXISTS `o2o_deal`;
CREATE TABLE `o2o_deal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `se_category_id` int(11) NOT NULL DEFAULT '0' COMMENT '浜岀骇鏍忕洰',
  `bis_id` int(11) NOT NULL DEFAULT '0' COMMENT '姣忎釜鍟嗗搧瀵瑰簲鐨勫晢瀹?',
  `location_ids` varchar(100) NOT NULL DEFAULT '',
  `image` varchar(200) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `origin_price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `current_price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `buy_count` int(11) NOT NULL DEFAULT '0',
  `total_count` int(11) NOT NULL DEFAULT '0',
  `coupons_begin_time` int(11) NOT NULL DEFAULT '0' COMMENT '鍥㈣喘鍗峰紑濮嬫椂闂?',
  `coupons_end_time` int(11) NOT NULL DEFAULT '0' COMMENT '鍥㈣喘鍗风粨鏉熸椂闂?',
  `xpoint` varchar(20) NOT NULL DEFAULT '',
  `ypoint` varchar(20) NOT NULL DEFAULT '',
  `bis_account_id` int(10) NOT NULL DEFAULT '0' COMMENT '鍟嗗?鎻愪氦鐨勬暟鎹?',
  `balance_price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '鍟嗗?鍜屽钩鍙扮殑鎶藉彇鎻愭垚',
  `notes` text NOT NULL COMMENT '鍟嗗搧鎻愮ず',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `city_id` (`city_id`),
  KEY `se_category_id` (`se_category_id`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_deal
-- ----------------------------
INSERT INTO `o2o_deal` VALUES ('1', '团购商品添加1', '1', '1', '9', '5,4', '/upload\\20191022\\a1fa36002d58d41d655914267de32b9b.jpg', '<p>团购商品添加</p>', '1571749920', '1571836320', '9.88', '0.00', '5', '0', '1000', '1571757180', '1571836380', '', '', '2', '0.00', '<p>团购商品添加</p>', '0', '1', '1571750023', '1571750023');
INSERT INTO `o2o_deal` VALUES ('2', 'csser', '2', '3', '9', '4', '', '<p>123</p>', '0', '0', '0.00', '8.89', '1', '0', '0', '0', '0', '', '', '2', '0.00', '<p>123</p>', '0', '1', '1571750606', '1571750606');
INSERT INTO `o2o_deal` VALUES ('3', '团购商品添加2', '1', '3', '9', '5,4', '/upload\\20191022\\a1fa36002d58d41d655914267de32b9b.jpg', '<p>团购商品添加</p>', '1571749920', '1571836320', '9.88', '0.00', '2', '0', '1000', '1571757180', '1571836380', '', '', '2', '0.00', '<p>团购商品添加</p>', '0', '1', '1571750023', '1571750023');
INSERT INTO `o2o_deal` VALUES ('4', '团购商品添加3', '1', '3', '9', '5', '/upload\\20191022\\a1fa36002d58d41d655914267de32b9b.jpg', '<p>测试抢购时间</p>', '1973111920', '1571836320', '9.88', '5.00', '3', '0', '1000', '1571757180', '1571836380', '', '', '2', '0.00', '<p>团购商品添加</p>', '0', '1', '1571750023', '1571750023');
INSERT INTO `o2o_deal` VALUES ('5', '团购商品添加4', '1', '3', '9', '5,4', '/upload\\20191022\\a1fa36002d58d41d655914267de32b9b.jpg', '<p>团购商品添加</p>', '1571749920', '1571836320', '9.88', '5.40', '3', '0', '1000', '1571757180', '1571836380', '', '', '2', '0.00', '<p>团购商品添加</p>', '0', '1', '1571750023', '1571750023');
INSERT INTO `o2o_deal` VALUES ('6', '团购商品添加5', '1', '3', '9', '5,4', '/upload\\20191022\\a1fa36002d58d41d655914267de32b9b.jpg', '<p>团购商品添加</p>', '1571749920', '1571836320', '9.88', '999.00', '4', '0', '1000', '1571757180', '1571836380', '', '', '2', '0.00', '<p>团购商品添加</p>', '0', '1', '1571750023', '1571750023');
INSERT INTO `o2o_deal` VALUES ('7', '团购商品添加6', '1', '3', '9', '5,4', '/upload\\20191022\\a1fa36002d58d41d655914267de32b9b.jpg', '<p>团购商品添加</p>', '1571749920', '1571836320', '9.88', '333.00', '5', '333', '1000', '1571757180', '1571836380', '', '', '2', '0.00', '<p>团购商品添加</p>', '0', '1', '1571750023', '1571750023');

-- ----------------------------
-- Table structure for o2o_featured
-- ----------------------------
DROP TABLE IF EXISTS `o2o_featured`;
CREATE TABLE `o2o_featured` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(30) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_featured
-- ----------------------------
INSERT INTO `o2o_featured` VALUES ('14', '0', '小米体育', '/upload\\20191022\\7203d4ffe92d50375f5c7d9a656cee34.png', 'https://imgur.com/gallery/nBv3E7f', '11', '0', '0', '1571727718', '1571821547');
INSERT INTO `o2o_featured` VALUES ('15', '0', '推荐文添加', '/upload\\20191023\\010812147e6428a4d2897ab657d23427.jpg', 'baidu.com', '测试', '0', '1', '1571820384', '1571820384');
INSERT INTO `o2o_featured` VALUES ('16', '1', '小米体育', '/upload\\20191022\\a4bbb9d023c064618113aa086855ca3b.jpg', 'https://imgur.com/gallery/nBv3E7f', '11', '0', '1', '1571727718', '1571821547');
INSERT INTO `o2o_featured` VALUES ('17', '1', '推荐文添加', '/upload\\20191023\\010812147e6428a4d2897ab657d23427.jpg', 'baidu.com', '测试', '0', '0', '1571820384', '1571820384');

-- ----------------------------
-- Table structure for o2o_order
-- ----------------------------
DROP TABLE IF EXISTS `o2o_order`;
CREATE TABLE `o2o_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `out_trade_no` varchar(100) NOT NULL DEFAULT '',
  `transaction_id` varchar(100) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `pay_time` varchar(20) NOT NULL DEFAULT '',
  `payment_id` tinyint(1) NOT NULL DEFAULT '1',
  `deal_id` int(11) NOT NULL DEFAULT '0',
  `deal_count` int(11) NOT NULL DEFAULT '0',
  `pay_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付状态 0:未支付 1支付成功 2支付失败 3',
  `total_price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pay_amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `referer` varchar(255) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `out_trade_no` (`out_trade_no`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_order
-- ----------------------------
INSERT INTO `o2o_order` VALUES ('2', '1571921591245782682', '', '7', 'admin', '', '1', '6', '2', '0', '0.00', '0.00', '1', 'http://singwa.com/index/order/confirm.html?id=6&count=1', '1571921591', '1571921591');
INSERT INTO `o2o_order` VALUES ('3', '1572060327464266142', '', '7', 'admin', '', '1', '5', '2', '0', '10.80', '0.00', '1', 'http://singwa.com/index/order/confirm.html?id=5&count=2', '1572060327', '1572060327');
INSERT INTO `o2o_order` VALUES ('4', '157206247930564574', '', '7', 'admin', '', '1', '5', '4', '0', '21.60', '0.00', '1', 'http://singwa.com/index/order/confirm.html?id=5&count=2', '1572062479', '1572062479');

-- ----------------------------
-- Table structure for o2o_user
-- ----------------------------
DROP TABLE IF EXISTS `o2o_user`;
CREATE TABLE `o2o_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `code` varchar(10) NOT NULL DEFAULT '',
  `last_login_ip` varchar(20) NOT NULL DEFAULT '',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '',
  `mobile` varchar(20) NOT NULL DEFAULT '',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_user
-- ----------------------------
INSERT INTO `o2o_user` VALUES ('1', 'admin1', '123', '', '', '0', 'admin1@qq.com', '', '0', '1', '1571825685', '1571825685');
INSERT INTO `o2o_user` VALUES ('5', 'admin22', '123', '', '', '0', 'admin@qq.com', '', '0', '1', '1571825861', '1571825861');
INSERT INTO `o2o_user` VALUES ('6', 'csser', '123', '', '', '0', 'csser@qq.com', '', '0', '1', '1571825977', '1571825977');
INSERT INTO `o2o_user` VALUES ('7', 'admin', '202cb962ac59075b964b07152d234b70', '', '', '1572062684', '3177164364@qq.com', '', '0', '1', '1571826116', '1572062684');
