/*
Navicat MySQL Data Transfer

Source Server         : 666
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : jiuniangwang

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-12-14 20:15:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for adverimage
-- ----------------------------
DROP TABLE IF EXISTS `adverimage`;
CREATE TABLE `adverimage` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `imgUrl` varchar(255) DEFAULT NULL,
  `addTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `keyWord` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of adverimage
-- ----------------------------
INSERT INTO `adverimage` VALUES ('1', 'index', './src/assets/image/carousel/indexCarou1.png,./src/assets/image/carousel/indexCarou2.png,./src/assets/image/carousel/indexCarou3.jpg', '2017-12-12 14:19:21', '茅台,茅台,茅台');
INSERT INTO `adverimage` VALUES ('2', 'sale', './src/assets/image/carousel/sale1.jpg,./src/assets/image/carousel/sale2.jpg,./src/assets/image/carousel/sale3.jpg', '2017-12-12 14:20:30', '杏花村,杏花村,杏花村');
INSERT INTO `adverimage` VALUES ('3', 'adver', './src/assets/image/adver/adver.png', '2017-12-12 14:00:03', '茅台');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) CHARACTER SET utf8 NOT NULL,
  `goodsId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('6', '111111@11.com', '31,31,31,31,28,28,28,28,28');
INSERT INTO `cart` VALUES ('8', '18334794663', '28,11,11,9,10,');
INSERT INTO `cart` VALUES ('12', '13660631228', '31,9,9,9,9,9,9,31,31,31,31,1,1,1,1,1,1,1,1,1,1,1,1,1');
INSERT INTO `cart` VALUES ('13', '17666064663', '30,30,2,2,2');
INSERT INTO `cart` VALUES ('14', '17717717717', '33,33,33,33,');
INSERT INTO `cart` VALUES ('15', '1234@qq.com', '');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `barCode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `standard` varchar(255) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `salePrice` varchar(255) DEFAULT NULL,
  `keepQty` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `keepDate` varchar(255) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `saleQty` int(255) DEFAULT NULL,
  `addTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '2321323213213', '白酒1', '白酒', '汾酒', '50ml', './src/assets/image/white_spirit/1.jpg', '66', '23', '3', '北京', '1998/2/3 星期二', '', '52°贵州茅台集团茅台醇香珍藏级N50柔雅浓香型白酒500ml*4瓶 礼盒装', '1000', '2017-12-10 14:44:32');
INSERT INTO `goods` VALUES ('2', '2321323213213', '白酒2', '白酒', '二锅头', '51ml', './src/assets/image/white_spirit/2.jpg', '67', '24', '4', '上海', '1998/2/4 星期三', '', '52°贵州茅台集团茅台醇香珍藏级N50柔雅浓香型白酒500ml*5瓶 礼盒装', '1001', '2017-12-10 14:44:38');
INSERT INTO `goods` VALUES ('3', '2321323213213', '白酒3', '白酒', '二锅头', '52ml', './src/assets/image/white_spirit/3.jpg', '68', '25', '5', '广州', '1998/2/5 星期四', '', '52°贵州茅台集团茅台醇香珍藏级N50柔雅浓香型白酒500ml*6瓶 礼盒装', '1002', '2017-12-10 14:44:43');
INSERT INTO `goods` VALUES ('4', '2321323213213', '白酒4', '白酒', '二锅头', '53ml', './src/assets/image/white_spirit/4.jpg', '69', '26', '6', '广州', '1998/2/6 星期五', '', '52°贵州茅台集团茅台醇香珍藏级N50柔雅浓香型白酒500ml*7瓶 礼盒装', '1003', '2017-12-10 14:44:48');
INSERT INTO `goods` VALUES ('5', '2321323213213', '白酒5', '白酒', '汾酒', '54ml', './src/assets/image/white_spirit/5.jpg', '70', '27', '7', '广州', '1998/2/7 星期六', '', '52°贵州茅台集团茅台醇香珍藏级N50柔雅浓香型白酒500ml*8瓶 礼盒装', '1004', '2017-12-10 14:44:54');
INSERT INTO `goods` VALUES ('6', '2321323213213', '白酒6', '白酒', '茅台', '55ml', './src/assets/image/white_spirit/6.jpg', '71', '28', '8', '广州', '1998/2/8 星期日', '', '52°贵州茅台集团茅台醇香珍藏级N50柔雅浓香型白酒500ml*9瓶 礼盒装', '1005', '2017-12-10 14:44:56');
INSERT INTO `goods` VALUES ('7', '2321323213213', '白酒7', '白酒', '茅台', '56ml', './src/assets/image/white_spirit/7.jpg', '72', '29', '9', '广州', '1998/2/9 星期一', '', '52°贵州茅台集团茅台醇香珍藏级N50柔雅浓香型白酒500ml*10瓶 礼盒装', '1006', '2017-12-10 14:44:58');
INSERT INTO `goods` VALUES ('8', '2321323213213', '白酒8', '白酒', '茅台', '57ml', './src/assets/image/white_spirit/8.jpg', '73', '30', '10', '广州', '1998/2/10 星期二', '', '52°贵州茅台集团茅台醇香珍藏级N50柔雅浓香型白酒500ml*11瓶 礼盒装', '1007', '2017-12-10 14:44:59');
INSERT INTO `goods` VALUES ('9', '2321323213213', '白酒9', '白酒', '茅台', '58ml', './src/assets/image/white_spirit/9.jpg', '74', '31', '11', '广州', '1998/2/11 星期三', '', '52°贵州茅台集团茅台醇香珍藏级N50柔雅浓香型白酒500ml*12瓶 礼盒装', '1008', '2017-12-10 14:45:02');
INSERT INTO `goods` VALUES ('10', '2321323213214', '啤酒1', '啤酒', '雪花啤酒', '59ml', './src/assets/image/beer/1.jpg', '75', '32', '12', '广州', '2017/2/12 星期日', '2018/3/3 星期六', '泰山啤酒（Taishan）10度黑啤原浆 490ml*12听 整箱装', '1009', '2017-12-10 14:45:05');
INSERT INTO `goods` VALUES ('11', '2321323213214', '啤酒2', '啤酒', '百威啤酒', '60ml', './src/assets/image/beer/2.jpg', '76', '33', '13', '广州', '1998/2/13 星期五', '2018/3/4 星期日', '泰山啤酒（Taishan）10度黑啤原浆 490ml*13听 整箱装', '1010', '2017-12-10 14:45:11');
INSERT INTO `goods` VALUES ('12', '2321323213214', '啤酒3', '啤酒', '哈尔冰', '61ml', './src/assets/image/beer/3.jpg', '77', '34', '14', '广州', '1998/2/14 星期六', '2018/3/5 星期一', '泰山啤酒（Taishan）10度黑啤原浆 490ml*14听 整箱装', '1011', '2017-12-10 14:45:13');
INSERT INTO `goods` VALUES ('13', '2321323213214', '啤酒4', '啤酒', '哈尔冰', '62ml', './src/assets/image/beer/4.jpg', '78', '35', '15', '广州', '1998/2/15 星期日', '2018/3/6 星期二', '泰山啤酒（Taishan）10度黑啤原浆 490ml*15听 整箱装', '1012', '2017-12-10 14:45:16');
INSERT INTO `goods` VALUES ('14', '2321323213214', '啤酒5', '啤酒', '哈尔冰', '63ml', './src/assets/image/beer/5.jpg', '79', '36', '16', '广州', '1998/2/16 星期一', '2018/3/7 星期三', '泰山啤酒（Taishan）10度黑啤原浆 490ml*16听 整箱装', '1013', '2017-12-10 14:45:19');
INSERT INTO `goods` VALUES ('15', '2321323213214', '啤酒6', '啤酒', '百威啤酒', '64ml', './src/assets/image/beer/6.jpg', '80', '37', '17', '广州', '1998/2/17 星期二', '2018/3/8 星期四', '泰山啤酒（Taishan）10度黑啤原浆 490ml*17听 整箱装', '1014', '2017-12-01 14:45:21');
INSERT INTO `goods` VALUES ('16', '2321323213214', '啤酒7', '啤酒', '百威啤酒', '65ml', './src/assets/image/beer/7.jpg', '81', '38', '18', '广州', '1998/2/18 星期三', '2018/3/9 星期五', '泰山啤酒（Taishan）10度黑啤原浆 490ml*18听 整箱装', '1015', '2017-02-15 14:45:23');
INSERT INTO `goods` VALUES ('17', '2321323213214', '啤酒8', '啤酒', '百威啤酒', '66ml', './src/assets/image/beer/8.jpg', '82', '39', '19', '广州', '1998/2/19 星期四', '2018/3/10 星期六', '泰山啤酒（Taishan）10度黑啤原浆 490ml*19听 整箱装', '1016', '2017-03-22 14:45:27');
INSERT INTO `goods` VALUES ('18', '2321323213214', '啤酒9', '啤酒', '百威啤酒', '67ml', './src/assets/image/beer/9.jpg', '83', '40', '20', '广州', '1998/2/20 星期五', '2018/3/11 星期日', '泰山啤酒（Taishan）10度黑啤原浆 490ml*20听 整箱装', '1017', '2017-11-06 14:45:29');
INSERT INTO `goods` VALUES ('19', '2321323213215', '葡萄酒1', '葡萄酒', '百威葡萄酒', '500ml', './src/assets/image/grape/1.jpg', '84', '41', '21', '广州', '1998/2/21 星期六', '2018/3/12 星期一', '葡萄酒整箱装', '1018', '2017-01-10 14:45:35');
INSERT INTO `goods` VALUES ('20', '2321323213215', '葡萄酒2', '葡萄酒', '百威葡萄酒', '500ml', './src/assets/image/grape/2.jpg', '85', '42', '22', '广州', '1998/2/22 星期日', '2018/3/13 星期二', '葡萄酒整箱装', '1019', '2017-06-20 14:45:36');
INSERT INTO `goods` VALUES ('21', '2321323213215', '葡萄酒3', '葡萄酒', '百威葡萄酒', '500ml', './src/assets/image/grape/3.jpg', '86', '43', '23', '广州', '1998/2/23 星期一', '2018/3/14 星期三', '葡萄酒整箱装', '1020', '2017-08-16 14:45:39');
INSERT INTO `goods` VALUES ('22', '2321323213215', '葡萄酒4', '葡萄酒', '百威葡萄酒', '500ml', './src/assets/image/grape/4.jpg', '87', '44', '24', '广州', '1998/2/24 星期二', '2018/3/15 星期四', '葡萄酒整箱装', '1021', '2017-03-08 14:45:42');
INSERT INTO `goods` VALUES ('23', '2321323213215', '葡萄酒5', '葡萄酒', '百威葡萄酒', '500ml', './src/assets/image/grape/5.jpg', '88', '45', '25', '广州', '1998/2/25 星期三', '2018/3/16 星期五', '葡萄酒整箱装', '1022', '2017-02-10 14:45:43');
INSERT INTO `goods` VALUES ('24', '2321323213215', '葡萄酒6', '葡萄酒', '百威葡萄酒', '500ml', './src/assets/image/grape/6.jpg', '89', '46', '26', '广州', '1998/2/26 星期四', '2018/3/17 星期六', '葡萄酒整箱装', '1023', '2017-09-10 14:45:45');
INSERT INTO `goods` VALUES ('25', '2321323213215', '葡萄酒7', '葡萄酒', '百威葡萄酒', '500ml', './src/assets/image/grape/7.jpg', '90', '47', '27', '广州', '1998/2/27 星期五', '2018/3/18 星期日', '葡萄酒整箱装', '1024', '2017-10-17 14:45:47');
INSERT INTO `goods` VALUES ('26', '2321323213215', '葡萄酒8', '葡萄酒', '百威葡萄酒', '500ml', './src/assets/image/grape/8.jpg', '91', '48', '28', '广州', '1998/2/28 星期六', '2018/3/19 星期一', '葡萄酒整箱装', '1025', '2018-11-22 14:45:49');
INSERT INTO `goods` VALUES ('27', '2321323213215', '葡萄酒9', '葡萄酒', '百威葡萄酒', '500ml', './src/assets/image/grape/9.jpg', '92', '49', '29', '广州', '1998/3/1 星期日', '2018/3/20 星期二', '葡萄酒整箱装', '1026', '2017-12-27 14:45:51');
INSERT INTO `goods` VALUES ('28', '2321323213216', '洋酒1', '洋酒', '百威洋酒', '500ml', './src/assets/image/imported_wines/1.jpg', '1040', '58', '30', '广州', '1998/3/2 星期一', '', '洋酒', '1027', '2017-12-14 17:34:10');
INSERT INTO `goods` VALUES ('29', '2321323213216', '洋酒2', '洋酒', '百威洋酒', '500ml', './src/assets/image/imported_wines/2.jpg', '101', '58', '31', '广州', '1998/3/3 星期二', '', '洋酒', '1028', '2017-12-14 17:34:15');
INSERT INTO `goods` VALUES ('30', '2321323213216', '洋酒3', '洋酒', '百威洋酒', '500ml', './src/assets/image/imported_wines/3.jpg', '104', '58', '32', '广州', '1998/3/4 星期三', '', '洋酒', '1029', '2017-12-14 17:33:51');
INSERT INTO `goods` VALUES ('31', '2321323213216', '洋酒4', '洋酒', '百威洋酒', '500ml', './src/assets/image/imported_wines/4.jpg', '78', '58', '33', '广州', '1998/3/5 星期四', '', '洋酒', '1030', '2017-12-14 17:34:24');
INSERT INTO `goods` VALUES ('32', '2321323213216', '洋酒5', '洋酒', '百威洋酒', '500ml', './src/assets/image/imported_wines/5.jpg', '89', '58', '34', '广州', '1998/3/6 星期五', '', '洋酒', '1031', '2017-12-14 17:34:27');
INSERT INTO `goods` VALUES ('33', '2321323213216', '洋酒6', '洋酒', '百威洋酒', '500ml', './src/assets/image/imported_wines/6.jpg', '90', '58', '35', '广州', '1998/3/7 星期六', '', '洋酒', '1032', '2017-12-14 17:34:29');
INSERT INTO `goods` VALUES ('34', '2321323213216', '洋酒7', '洋酒', '百威洋酒', '500ml', './src/assets/image/imported_wines/7.jpg', '67', '58', '36', '广州', '1998/3/8 星期日', '', '洋酒', '1033', '2017-12-14 17:34:32');
INSERT INTO `goods` VALUES ('35', '2321323213216', '洋酒8', '洋酒', '百威洋酒', '500ml', './src/assets/image/imported_wines/8.jpg', '85', '58', '37', '广州', '1998/3/9 星期一', '', '洋酒', '1034', '2017-12-14 17:34:36');
INSERT INTO `goods` VALUES ('36', '2321323213216', '洋酒9', '洋酒', '百威洋酒', '500ml', './src/assets/image/imported_wines/9.jpg', '108', '58', '38', '广州', '1998/3/10 星期二', '', '洋酒', '1035', '2017-12-14 17:49:06');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `orderid` int(255) NOT NULL,
  `state` int(10) NOT NULL,
  `update` datetime DEFAULT NULL COMMENT 'CURRENT_TIMSTAMP',
  `userName` varchar(255) NOT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', '1', '2017-12-09 20:14:51', '123');
INSERT INTO `order` VALUES ('2', '2', '2017-12-12 18:20:27', '123');
INSERT INTO `order` VALUES ('4', '2', null, '123');
INSERT INTO `order` VALUES ('51315152', '1', null, '18334794663');
INSERT INTO `order` VALUES ('5', '1', null, '123');
INSERT INTO `order` VALUES ('6', '2', null, '123');
INSERT INTO `order` VALUES ('1231242', '2', null, '123');
INSERT INTO `order` VALUES ('123124', '2', null, '123');
INSERT INTO `order` VALUES ('51315347', '2', null, '18334794663');
INSERT INTO `order` VALUES ('51315246', '2', null, '18334794663');
INSERT INTO `order` VALUES ('51315225', '1', null, '18334794663');
INSERT INTO `order` VALUES ('51315224', '2', null, '18334794663');
INSERT INTO `order` VALUES ('51315222', '2', null, '18334794663');
INSERT INTO `order` VALUES ('51315177', '1', null, '18334794663');
INSERT INTO `order` VALUES ('51315357', '2', null, '18334794663');
INSERT INTO `order` VALUES ('51315503', '1', null, '18334794663');
INSERT INTO `order` VALUES ('51315504', '1', null, '18334794663');
INSERT INTO `order` VALUES ('51315740', '1', null, '13660631228');
INSERT INTO `order` VALUES ('51315743', '1', null, '13660631228');
INSERT INTO `order` VALUES ('51316187', '2', null, '17666064663');
INSERT INTO `order` VALUES ('51316253', '2', null, '17666064663');
INSERT INTO `order` VALUES ('51316320', '2', null, '17666064663');

-- ----------------------------
-- Table structure for orderlist
-- ----------------------------
DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist` (
  `orderid` int(255) NOT NULL,
  `goodsid` char(255) NOT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderlist
-- ----------------------------
INSERT INTO `orderlist` VALUES ('2', '1,2,3');
INSERT INTO `orderlist` VALUES ('1', '4,5,6');
INSERT INTO `orderlist` VALUES ('4', '1,2,3');
INSERT INTO `orderlist` VALUES ('51315149', '29');
INSERT INTO `orderlist` VALUES ('5', '1,2,3');
INSERT INTO `orderlist` VALUES ('6', '1,2,3');
INSERT INTO `orderlist` VALUES ('1231242', '1,2,3');
INSERT INTO `orderlist` VALUES ('123124', '1,2,3');
INSERT INTO `orderlist` VALUES ('51315357', '10,10,10');
INSERT INTO `orderlist` VALUES ('51315347', '12,12,12,12,12');
INSERT INTO `orderlist` VALUES ('51315246', '19');
INSERT INTO `orderlist` VALUES ('51315225', '29');
INSERT INTO `orderlist` VALUES ('51315224', '29,29,29');
INSERT INTO `orderlist` VALUES ('51315222', '12');
INSERT INTO `orderlist` VALUES ('51315177', '29,29,29');
INSERT INTO `orderlist` VALUES ('51315503', '30');
INSERT INTO `orderlist` VALUES ('51315504', '30');
INSERT INTO `orderlist` VALUES ('51315740', '9');
INSERT INTO `orderlist` VALUES ('51315743', '10');
INSERT INTO `orderlist` VALUES ('51316187', '28,28,28');
INSERT INTO `orderlist` VALUES ('51316253', '28,28');
INSERT INTO `orderlist` VALUES ('51316320', '28');

-- ----------------------------
-- Table structure for repertory
-- ----------------------------
DROP TABLE IF EXISTS `repertory`;
CREATE TABLE `repertory` (
  `id` int(11) NOT NULL,
  `barCode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `standard` varchar(255) DEFAULT NULL,
  `imgUrl` varchar(255) DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL,
  `salePrice` varchar(10) DEFAULT NULL,
  `keepQty` int(10) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `keepDate` datetime DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `saleQty` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL COMMENT 'CURRENT_TIMSTAMP',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of repertory
-- ----------------------------
INSERT INTO `repertory` VALUES ('1', '1234567890', '金星', '啤酒', '金星', '300ml', null, '3.00', '2.90', null, null, null, null, null, '888', null);
INSERT INTO `repertory` VALUES ('2', '789456123', '哈啤', '啤酒', '哈啤', '450ml', null, '5.00', '4.50', null, null, null, null, null, '666', null);
INSERT INTO `repertory` VALUES ('3', '147258369', '鸡尾酒', '洋酒', '机尾', '200ml', null, '4.00', '4.00', null, null, null, null, null, '100', null);
INSERT INTO `repertory` VALUES ('4', '564681235', '82年拉菲', '洋酒', '拉菲', '100ml', null, '10.00', '9.80', null, null, null, null, null, '50', null);
INSERT INTO `repertory` VALUES ('5', '875165213', '威士忌', '洋酒', '威士忌', '150ml', null, '50.00', '48.00', null, null, null, null, null, '800', null);
INSERT INTO `repertory` VALUES ('6', '321186438', '二锅头', '白酒', '二锅头', '500ml', null, '15.00', '14.50', null, null, null, null, null, '500', null);
INSERT INTO `repertory` VALUES ('7', '5610325155', '老村长', '白酒', '老村长企业', '500ml', null, '15.00', '14.00', null, null, null, null, null, '999', null);

-- ----------------------------
-- Table structure for searchword
-- ----------------------------
DROP TABLE IF EXISTS `searchword`;
CREATE TABLE `searchword` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL,
  `keyWord` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of searchword
-- ----------------------------
INSERT INTO `searchword` VALUES ('1', 'hh', 'true,我我我,2222,13332222,1,2,3,4,45,5');
INSERT INTO `searchword` VALUES ('2', 'hww', '');
INSERT INTO `searchword` VALUES ('11', '18334794663', '');
INSERT INTO `searchword` VALUES ('4', 'hw', 'true');
INSERT INTO `searchword` VALUES ('8', '', '啤酒,网,');
INSERT INTO `searchword` VALUES ('7', 'hhh@hh.com', '忘我sssss,111,三三四四,忘我,得到,伸缩,d对对对,啥啥啥,');
INSERT INTO `searchword` VALUES ('13', '13660631228', '');
INSERT INTO `searchword` VALUES ('10', '18688554911@qq.com', '茅台酒,茅台');
INSERT INTO `searchword` VALUES ('12', 'hhh@qq.com', '');
INSERT INTO `searchword` VALUES ('14', '17717717717', '');

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `power` varchar(255) DEFAULT NULL,
  `workTime` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('1', '老王', '男', '42', '仓库管理员', '1', '3.5年', '13838381438', '北京朝阳区');
INSERT INTO `staff` VALUES ('2', '张三', '男', '38', '保洁总管', '1', '5年', '14725873697', '广州天河区');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `nickName` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `userImg` varchar(255) DEFAULT NULL,
  `history` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `dAddress` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `address3` varchar(255) DEFAULT NULL,
  `address4` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'CURRENT_TIMESTAMP',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('9', '18688554922', '2143a2be7bd7dbeac9d635b8a186f1a3', '男', '222222', '09-12-12', './php/image/defultHead.jpg', '', '广州', '广东省广州市越秀区中山六路1033', '', '', null, null, '2017-12-13 05:35:57');
INSERT INTO `user` VALUES ('11', '13582929309', 'd6502f070c7e50402b7ee7e690d7dbb9', '男', '快乐1', '02-11-12', './php/image/defultHead.jpg', '', '广东', '广东省广州市越秀区中山六路101号', '', '', null, null, '2017-12-13 04:23:32');
INSERT INTO `user` VALUES ('12', '18688273981', 'bae5e3208a3c700e3db642b6631e95b9', '女', '齐天', '09-09-12', './php/image/defultHead.jpg', '', '广州', '广州白云区美丽小区', '', '', null, null, '2017-12-08 15:14:20');
INSERT INTO `user` VALUES ('13', '18222321323', '9120163167c05aed85f30bf88495bd89', '女', '人生', '11-09-12', './php/image/defultHead.jpg', '', '茂名', '广东茂名市唯美小区12138号', '', '', null, null, '2017-12-08 15:16:57');
INSERT INTO `user` VALUES ('33', '13172050157', '123456', '男', '小枫', '99-12-13', './php/image/defultHead.jpg', null, '广州', '广东省广州市越秀区中山六路97号', null, null, null, null, '2017-12-13 10:36:46');
INSERT INTO `user` VALUES ('14', '18688492232', '15f60db657eb2bf27d3475c1d8e8db83', '男', '小明', '06-12-12', './php/image/defultHead.jpg', null, '深圳', '广东省深圳市福田区滨海大道34号', null, null, null, null, '2017-12-08 15:40:26');
INSERT INTO `user` VALUES ('15', 'huwan@123.con', '99fb024110823e2061fe6b59cf949d24', '男', '小米', '12-12-12', './php/image/defultHead.jpg', null, '深圳', '广东省深圳市福田区滨海大道', null, null, null, null, '2017-12-08 16:13:40');
INSERT INTO `user` VALUES ('16', '110@qq.com', '7fa8282ad93047a4d6fe6111c93b308a', '女', '小6', '08-08-12', './php/image/defultHead.jpg', null, '广东', '广东省茂名市官渡二路139号', null, null, null, null, '2017-12-08 16:16:19');
INSERT INTO `user` VALUES ('20', '18618618618', '7fa8282ad93047a4d6fe6111c93b308a', '女', '人生如梦', '09-12-24', './php/image/defultHead.jpg', null, '茂名', '广东省高州市高凉东路636号', '', '', null, null, '2017-12-12 10:14:31');
INSERT INTO `user` VALUES ('21', '18688554912', '3d9eaa4f83cbc626acd1b541a892ddf0', '男', '五本', '06-12-06', './php/image/defultHead.jpg', null, '广东', '广东省茂名市官渡二路23号', null, null, null, null, '2017-12-09 18:41:39');
INSERT INTO `user` VALUES ('22', '3169@qq.com', 'c153255c6aa1dbc190e6aa68a3ec5ed3', '男', '小号', '09-12-12', './php/image/defultHead.jpg', null, '茂名', '广东省茂名市油城五路28号', null, null, null, null, '2017-12-09 18:42:47');
INSERT INTO `user` VALUES ('23', 'hww125@126.cn', '1ebed047ca63cc9fcf9ab3661466c6ad', '男', '小花', '12-04-12', './php/image/defultHead.jpg', null, '广州', '广州市番禺区万博中心商业街10号天河城百货F1', null, null, null, null, '2017-12-09 18:43:36');
INSERT INTO `user` VALUES ('44', '17811111111', '7fa8282ad93047a4d6fe6111c93b308a', null, null, null, null, null, null, '广东省东莞市市辖区g107', null, null, null, null, '2017-12-13 11:00:11');
INSERT INTO `user` VALUES ('32', '123456', '123456', '男', '小东', '04-07-12', './php/image/defultHead.jpg', null, '广东', '广东省东莞市市辖区g107', null, null, null, null, '2017-12-12 16:27:05');
INSERT INTO `user` VALUES ('42', '13172050157', 'e10adc3949ba59abbe56e057f20f883e', '男', '辉少', '04-03-12', './php/image/defultHead.jpg', null, '广东', '广东省东莞市市辖区长泰路18号', null, null, null, null, '2017-12-13 10:49:56');
INSERT INTO `user` VALUES ('54', '17717717717', '7fa8282ad93047a4d6fe6111c93b308a', null, null, null, null, null, null, '广东省东莞市市辖区长泰路18号', null, null, null, null, '2017-12-14 11:26:01');
INSERT INTO `user` VALUES ('46', '18688492243', 'bae5e3208a3c700e3db642b6631e95b9', null, null, null, null, null, '深圳', '广东省深圳市福田区滨海大道', null, null, null, null, '2017-12-13 11:23:26');
INSERT INTO `user` VALUES ('50', '18334794663', '1111111', '男', '志伟', null, null, null, '广东', '广东省茂名市油城五路28号', null, null, null, null, '2017-12-13 18:37:09');
INSERT INTO `user` VALUES ('48', 'hhh@qq.com', '7fa8282ad93047a4d6fe6111c93b308a', null, null, null, null, null, '广东', '广东省茂名市油城五路28号', null, null, null, null, '2017-12-13 14:05:22');
INSERT INTO `user` VALUES ('49', 'hhh@11.com', '7fa8282ad93047a4d6fe6111c93b308a', null, null, null, null, null, null, null, null, null, null, null, '2017-12-13 17:05:34');
INSERT INTO `user` VALUES ('52', '17666064663', '7fa8282ad93047a4d6fe6111c93b308a', null, '志伟', null, null, null, '广东', '广东省茂名市油城五路28号', null, null, null, null, '2017-12-13 18:39:43');
INSERT INTO `user` VALUES ('53', '13111111111', '7fa8282ad93047a4d6fe6111c93b308a', null, '12314', null, '', null, null, '', '', '', null, null, '2017-12-14 04:52:46');
INSERT INTO `user` VALUES ('55', '18718718718', '1bbd886460827015e5d605ed44252251', null, null, null, null, null, null, null, null, null, null, null, '2017-12-14 16:02:02');
INSERT INTO `user` VALUES ('57', '1234@qq.com', 'fcea920f7412b5da7be0cf42b8c93759', null, null, null, null, null, null, null, null, null, null, null, '2017-12-14 19:26:48');
