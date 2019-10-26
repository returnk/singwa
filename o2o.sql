
0、o2o_city 数据库表中少了个字段 is_default  1是默认城市 0 否

1、api/config.php定义的 show（） 默认输出类型json不行 

2、数据库表中的o2o_deal  current_paice 需换成 current_price

3、微信支付没有做也没有代码
    3.1、$data = input('post.','','htmlentities');   // 将用户添加数据实体化 在thinkphp/helper.php 第三个参数是过滤方法
    3.2、反转换         {编辑框内容|html_entity_decode} 

    3.3、还可以在config.php里的默认全局过滤方法里填写 htmlentities 如果有多种可以用逗号隔开

4、老师代码中没有 微信支付的代码 Order.php

5、在public/head 动态加载样式后 有点问题
    5.1、登录成功后显示 未定义变量：controller 









-- 生活分类表
CREATE TABLE `o2o_category`(
	`id` int(11) unsigned NOT NULL auto_increment,
	`name` VARCHAR(50) NOT NULL DEFAULT '',
	`parent_id` int(10) unsigned NOT NULL default 0,
	`listorder` int(8) unsigned NOT NULL DEFAULT 0,
	`status` tinyint(1) NOT NULL DEFAULT 0,
	`create_time` int(11) unsigned NOT NULL DEFAULT 0,
	`update_time` int(11) unsigned NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	KEY parent_id(`parent_id`)

)ENGINE=innoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- 城市表
CREATE TABLE `o2o_city`(
	`id` int(11) unsigned NOT NULL auto_increment,
	`name` VARCHAR(50) NOT NULL DEFAULT '',
	`uname` VARCHAR(50) NOT NULL DEFAULT '',
	`parent_id` int(10) unsigned NOT NULL default 0,
	`listorder` int(8) unsigned NOT NULL DEFAULT 0,
	`status` tinyint(1) NOT NULL DEFAULT 0,
	`create_time` int(11) unsigned NOT NULL DEFAULT 0,
	`update_time` int(11) unsigned NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	KEY parent_id(`parent_id`),
	UNIQUE KEY uname(`uname`)

)ENGINE=innoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- 商圈表
CREATE TABLE `o2o_area`(
	`id` int(11) unsigned NOT NULL auto_increment,
	`name` VARCHAR(50) NOT NULL DEFAULT '',
	`uname` VARCHAR(50) NOT NULL DEFAULT '',
	`city_id` int(11) unsigned NOT NULL DEFAULT 0,
	`parent_id` int(10) unsigned NOT NULL default 0,
	`listorder` int(8) unsigned NOT NULL DEFAULT 0,
	`status` tinyint(1) NOT NULL DEFAULT 0,
	`create_time` int(11) unsigned NOT NULL DEFAULT 0,
	`update_time` int(11) unsigned NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	KEY parent_id(`parent_id`),
	KEY city_id(`city_id`)

)ENGINE=innoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- 商户表
CREATE TABLE `o2o_bis`(
	`id` int(11) unsigned NOT NULL auto_increment,
	`name` VARCHAR(50) NOT NULL DEFAULT '',
	`email` VARCHAR(50) NOT NULL DEFAULT '',
	`logo` VARCHAR(255) NOT NULL DEFAULT '',
	`uname` VARCHAR(50) NOT NULL DEFAULT '',
	`licence_logo` VARCHAR(50) NOT NULL DEFAULT '',
	`description` text NOT NULL,
	`city_id` int(11) unsigned NOT NULL DEFAULT 0,
	`city_path` varchar(50) NOT NULL DEFAULT 0,
	`bank_info` varchar(50) NOT NULL DEFAULT 0,
	`money` decimal(20,2) NOT NULL DEFAULT '0.00',
	`bank_name` varchar(50) NOT NULL DEFAULT '',
	`bank_user` varchar(50) NOT NULL DEFAULT '',
	`faren` varchar(20) NOT NULL DEFAULT '',
	`faren_tel` varchar(20) NOT NULL DEFAULT '',
	`listorder` int(8) unsigned NOT NULL DEFAULT 0,
	`status` tinyint(1) NOT NULL DEFAULT 0,
	`create_time` int(11) unsigned NOT NULL DEFAULT 0,
	`update_time` int(11) unsigned NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	KEY city_id(`city_id`),
	KEY name(`name`)

)ENGINE=innoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

	-- 商户账号表
CREATE TABLE `o2o_bis_account`(
	`id` int(11) unsigned NOT NULL auto_increment,
	`username` VARCHAR(50) NOT NULL DEFAULT '',
	`password` char(30) NOT NULL DEFAULT '',
	`code` varchar(10) NOT NULL DEFAULT '',
	`bis_id` int(11) unsigned NOT NULL DEFAULT 0,
	`last_login_ip` varchar(20) NOT NULL DEFAULT '',
	`last_login_time` int(11) unsigned NOT NULL default 0,
	`is_main` tinyint(1) unsigned NOT NULL DEFAULT 0,
	`listorder` int(8) unsigned NOT NULL DEFAULT 0,
	`status` tinyint(1) NOT NULL DEFAULT 0,
	`create_time` int(11) unsigned NOT NULL DEFAULT 0,
	`update_time` int(11) unsigned NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	KEY bis_id(`bis_id`),
	KEY username(`username`)

)ENGINE=innoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

	-- 商户门店表
CREATE TABLE `o2o_bis_location`(
	`id` int(11) unsigned NOT NULL auto_increment,
	`name` VARCHAR(50) NOT NULL DEFAULT '',
	`logo` VARCHAR(255) NOT NULL DEFAULT '',
	`address` VARCHAR(255) NOT NULL DEFAULT '',
	`tel` VARCHAR(20) NOT NULL DEFAULT '',
	`contact` VARCHAR(20) NOT NULL DEFAULT '',
	`xpoint` VARCHAR(20) NOT NULL DEFAULT '',
	`ypoint` VARCHAR(20) NOT NULL DEFAULT '',
	`bis_id` int(11) unsigned NOT NULL DEFAULT 0,
	`open_time` int(11) unsigned NOT NULL DEFAULT 0,
	`content` text NOT NULL ,
	`is_main` tinyint(1) unsigned NOT NULL DEFAULT 0,
	`api_address` VARCHAR(255) NOT NULL DEFAULT 0,
	`city_id` int(11) unsigned NOT NULL DEFAULT 0,
	`city_path` varchar(50) NOT NULL DEFAULT 0,
	`category_id` int(11) unsigned NOT NULL DEFAULT 0,
	`category_path` varchar(50) NOT NULL DEFAULT 0,
	`bank_info` varchar(50) NOT NULL DEFAULT 0,
	`listorder` int(8) unsigned NOT NULL DEFAULT 0,
	`status` tinyint(1) NOT NULL DEFAULT 0,
	`create_time` int(11) unsigned NOT NULL DEFAULT 0,
	`update_time` int(11) unsigned NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	KEY bis_id(`bis_id`),
	KEY city_id(`city_id`),
	KEY category_id(`category_id`),
	KEY name(`name`)

)ENGINE=innoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- 团购商品表
CREATE TABLE `o2o_deal`(
	`id` int(11) unsigned NOT NULL auto_increment,
	`name` VARCHAR(100) NOT NULL DEFAULT '',
	`category_id` int(11) NOT NULL DEFAULT 0,
	`se_category_id` int(11) NOT NULL DEFAULT 0 COMMENT '二级栏目',
	`bis_id` int(11) NOT NULL DEFAULT 0 COMMENT '每个商品对应的商家',
	`location_ids` VARCHAR(100) NOT NULL DEFAULT '',
	`image` VARCHAR(200) NOT NULL DEFAULT '',
	`description` text NOT NULL,
	`start_time` int(11) NOT NULL DEFAULT 0,
	`end_time` int(11) NOT NULL DEFAULT 0,
	`origin_price` decimal(20,2) NOT NULL DEFAULT 0.00,
	`current_paice` decimal(20,2) NOT NULL DEFAULT 0.00,
	`city_id` int(11) NOT NULL DEFAULT 0,
	`buy_count` int(11) NOT NULL DEFAULT 0,
	`total_count` int(11) NOT NULL DEFAULT 0,
	`coupons_begin_time` int(11) NOT NULL DEFAULT 0 COMMENT '团购卷开始时间',
	`coupons_end_time` int(11) NOT NULL DEFAULT 0 COMMENT '团购卷结束时间',
	`xpoint` VARCHAR(20) NOT NULL DEFAULT '',
	`ypoint` VARCHAR(20) NOT NULL DEFAULT '',
	`bis_account_id` int(10) NOT NULL DEFAULT 0 COMMENT '商家提交的数据',
	`balance_price` decimal(20,2) NOT NULL DEFAULT 0.00 COMMENT '商家和平台的抽取提成',
	`notes` text not null COMMENT '商品提示',
	`listorder` int(8) unsigned NOT NULL DEFAULT 0,
	`status` tinyint(1) NOT NULL DEFAULT 0,
	`create_time` int(11) unsigned NOT NULL DEFAULT 0,
	`update_time` int(11) unsigned NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	KEY category_id(`category_id`),
	KEY city_id(`city_id`),
	KEY se_category_id(`se_category_id`),
	KEY start_time(`start_time`),
	KEY end_time(`end_time`)
)ENGINE=innoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- 用户表
CREATE TABLE `o2o_user`(
	`id` int(11) unsigned NOT NULL auto_increment,
	`username` VARCHAR(50) NOT NULL DEFAULT '',
	`password` char(32) NOT NULL DEFAULT '',
	`code` varchar(10) NOT NULL DEFAULT '',
	`last_login_ip` varchar(20) NOT NULL DEFAULT '',
	`last_login_time` int(11) unsigned NOT NULL default 0,
	`email` VARCHAR(50) NOT NULL DEFAULT '',
	`mobile` VARCHAR(20) NOT NULL DEFAULT '',
	`listorder` int(8) unsigned NOT NULL DEFAULT 0,
	`status` tinyint(1) NOT NULL DEFAULT 0,
	`create_time` int(11) unsigned NOT NULL DEFAULT 0,
	`update_time` int(11) unsigned NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE KEY username(`username`),
	UNIQUE KEY email(`email`)
)ENGINE=innoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- 推荐位表
CREATE TABLE `o2o_featured`(
	`id` int(11) unsigned NOT NULL auto_increment,
	`type` tinyint(1) NOT NULL DEFAULT 0,
	`title` varchar(30) NOT NULL DEFAULT '',
	`image` varchar(255) NOT NULL DEFAULT '',
	`url` varchar(255) NOT NULL DEFAULT '',
	`description` varchar(255) not null default '',
	`listorder` int(8) unsigned NOT NULL DEFAULT 0,
	`status` tinyint(1) NOT NULL DEFAULT 0,
	`create_time` int(11) unsigned NOT NULL DEFAULT 0,
	`update_time` int(11) unsigned NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
)ENGINE=innoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- pay_time用varchar 20191024 rederer来源 
-- 订单表
CREATE TABLE `o2o_order`(
	`id` int(11) unsigned NOT NULL auto_increment,
	`out_trade_no` varchar(100) NOT NULL DEFAULT '',
	`transaction_id` varchar(100) NOT NULL DEFAULT '',
	`user_id` int(11) NOT NULL DEFAULT 0,
	`username` varchar(50) NOT NULL DEFAULT '',
	`pay_time` varchar(20) NOT NULL DEFAULT '',
	`payment_id` tinyint(1) NOT NULL DEFAULT 1,
	`deal_id` int(11) NOT NULL DEFAULT 0,
	`deal_count` int(11) NOT NULL DEFAULT 0,
	`pay_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '支付状态 0:未支付 1支付成功 2支付失败 3',
	`total_price` DECIMAL(20,2) NOT NULL DEFAULT '0.00',
	`pay_amount` DECIMAL(20,2) NOT NULL DEFAULT '0.00',
	`status` tinyint(1) NOT NULL DEFAULT 1,
	`referer` varchar(255) NOT NULL DEFAULT 0,
	`create_time` int(11) unsigned NOT NULL DEFAULT 0,
	`update_time` int(11) unsigned NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE `out_trade_no`(`out_trade_no`),
	key user_id(`user_id`),
	key create_time(`create_time`)
)ENGINE=innoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;