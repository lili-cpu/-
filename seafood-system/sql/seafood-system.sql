/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:3306
 Source Schema         : seafood_website

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 04/04/2022 18:37:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (3, 'admin', 'admin');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (15, '鱼类（活鲜）');
INSERT INTO `category` VALUES (16, '贝类');
INSERT INTO `category` VALUES (17, '蟹类');
INSERT INTO `category` VALUES (18, '藻类');
INSERT INTO `category` VALUES (19, '虾类');
INSERT INTO `category` VALUES (20, '鱼类（冰鲜）');

-- ----------------------------
-- Table structure for order_
-- ----------------------------
DROP TABLE IF EXISTS `order_`;
CREATE TABLE `order_`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `post` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `receiver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userMessage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `createDate` datetime(0) DEFAULT NULL,
  `payDate` datetime(0) DEFAULT NULL,
  `deliveryDate` datetime(0) DEFAULT NULL,
  `confirmDate` datetime(0) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_user`(`uid`) USING BTREE,
  CONSTRAINT `order__ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_
-- ----------------------------
INSERT INTO `order_` VALUES (1, '202203312057126007913', '', '', '', '', '', '2022-03-31 20:57:12', '2022-03-31 20:57:14', '2022-03-31 21:00:11', NULL, 1, 'delete');
INSERT INTO `order_` VALUES (2, '202203312100396016537', '', '', '', '', '', '2022-03-31 21:00:39', '2022-03-31 21:00:42', '2022-04-01 21:43:34', '2022-04-01 21:45:02', 1, 'waitReview');
INSERT INTO `order_` VALUES (3, '202204012142009813373', '广东深圳', '516000', '林', '1521817777', '', '2022-04-01 21:42:00', '2022-04-01 21:42:03', '2022-04-01 21:43:33', '2022-04-01 21:44:47', 1, 'finish');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_orderitem_user`(`uid`) USING BTREE,
  INDEX `fk_orderitem_product`(`pid`) USING BTREE,
  INDEX `fk_orderitem_order`(`oid`) USING BTREE,
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `order_` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orderitem_ibfk_3` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (1, 4, 3, 1, 1);
INSERT INTO `orderitem` VALUES (2, 9, 3, 1, 1);
INSERT INTO `orderitem` VALUES (3, 15, 3, 1, 1);
INSERT INTO `orderitem` VALUES (4, 7, 2, 1, 1);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `subTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `originalPrice` float DEFAULT NULL,
  `promotePrice` float DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `createDate` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_product_category`(`cid`) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (4, '八爪鱼', '章鱼', 52, 50, 88, 20, '2022-03-31 00:24:12');
INSERT INTO `product` VALUES (5, '带鱼', '裙带鱼', 69, 58, 50, 20, '2022-03-31 00:24:27');
INSERT INTO `product` VALUES (6, '沙丁鱼', '萨丁鱼', 20, 19.9, 99, 20, '2022-03-31 00:24:42');
INSERT INTO `product` VALUES (7, '先生鱼', '狮子鱼', 30, 25, 80, 20, '2022-03-31 00:25:12');
INSERT INTO `product` VALUES (8, '比目鱼', '多宝鱼', 128, 72, 45, 20, '2022-03-31 00:25:25');
INSERT INTO `product` VALUES (9, '小河虾', '小河虾', 19.99, 9.99, 199, 19, '2022-03-31 00:25:52');
INSERT INTO `product` VALUES (10, '竹节虾', '花尾虾', 99.98, 88.88, 44, 19, '2022-03-31 00:26:16');
INSERT INTO `product` VALUES (11, '虾姑', '皮皮虾', 35.88, 30.88, 66, 19, '2022-03-31 00:26:35');
INSERT INTO `product` VALUES (12, '紫菜', '紫菜', 10, 9.9, 99, 18, '2022-03-31 00:27:45');
INSERT INTO `product` VALUES (13, '海木耳', '海木耳', 10, 10, 99, 18, '2022-03-31 00:28:12');
INSERT INTO `product` VALUES (14, '海带', '海带', 18, 15.9, 99, 18, '2022-03-31 00:28:27');
INSERT INTO `product` VALUES (15, '大闸蟹', '大闸蟹', 59.98, 49.98, 88, 17, '2022-03-31 00:29:16');
INSERT INTO `product` VALUES (16, '青蟹', '膏蟹', 99.98, 90.99, 99, 17, '2022-03-31 00:29:43');
INSERT INTO `product` VALUES (17, '梭子蟹', '三疣梭子蟹', 88.88, 80.88, 99, 17, '2022-03-31 00:30:03');
INSERT INTO `product` VALUES (18, '生蚝', '生蚝', 78, 75, 88, 16, '2022-03-31 00:30:42');
INSERT INTO `product` VALUES (19, '海螺', '香螺', 40, 40, 99, 16, '2022-03-31 00:31:04');
INSERT INTO `product` VALUES (20, '蛏子', '蛏子', 99.98, 88.8, 66, 16, '2022-03-31 00:31:21');
INSERT INTO `product` VALUES (21, '草鱼', '草鱼', 40, 35, 99, 15, '2022-03-31 00:32:24');
INSERT INTO `product` VALUES (22, '鲢鱼', '胖头鱼', 50, 40, 99, 15, '2022-03-31 00:32:39');
INSERT INTO `product` VALUES (23, '罗非鱼', '非洲鲫', 20, 19.98, 99, 15, '2022-03-31 00:32:51');
INSERT INTO `product` VALUES (24, '黄辣丁', '黄姑子', 30, 29, 99, 15, '2022-03-31 00:33:29');
INSERT INTO `product` VALUES (25, '青口', '贻贝', 19.9, 18.9, 200, 16, '2022-03-31 00:33:45');

-- ----------------------------
-- Table structure for productimage
-- ----------------------------
DROP TABLE IF EXISTS `productimage`;
CREATE TABLE `productimage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_productimage_product`(`pid`) USING BTREE,
  CONSTRAINT `productimage_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 150 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productimage
-- ----------------------------
INSERT INTO `productimage` VALUES (81, 8, 'detail');
INSERT INTO `productimage` VALUES (82, 8, 'detail');
INSERT INTO `productimage` VALUES (83, 7, 'single');
INSERT INTO `productimage` VALUES (84, 7, 'detail');
INSERT INTO `productimage` VALUES (85, 7, 'detail');
INSERT INTO `productimage` VALUES (86, 6, 'single');
INSERT INTO `productimage` VALUES (87, 6, 'detail');
INSERT INTO `productimage` VALUES (88, 6, 'detail');
INSERT INTO `productimage` VALUES (89, 5, 'single');
INSERT INTO `productimage` VALUES (90, 5, 'detail');
INSERT INTO `productimage` VALUES (91, 5, 'detail');
INSERT INTO `productimage` VALUES (92, 4, 'single');
INSERT INTO `productimage` VALUES (93, 4, 'detail');
INSERT INTO `productimage` VALUES (94, 4, 'detail');
INSERT INTO `productimage` VALUES (95, 8, 'single');
INSERT INTO `productimage` VALUES (96, 11, 'single');
INSERT INTO `productimage` VALUES (97, 11, 'detail');
INSERT INTO `productimage` VALUES (98, 11, 'detail');
INSERT INTO `productimage` VALUES (99, 10, 'single');
INSERT INTO `productimage` VALUES (100, 10, 'detail');
INSERT INTO `productimage` VALUES (101, 10, 'detail');
INSERT INTO `productimage` VALUES (102, 9, 'single');
INSERT INTO `productimage` VALUES (103, 9, 'detail');
INSERT INTO `productimage` VALUES (104, 9, 'detail');
INSERT INTO `productimage` VALUES (105, 14, 'single');
INSERT INTO `productimage` VALUES (106, 14, 'detail');
INSERT INTO `productimage` VALUES (107, 14, 'detail');
INSERT INTO `productimage` VALUES (108, 13, 'single');
INSERT INTO `productimage` VALUES (109, 13, 'detail');
INSERT INTO `productimage` VALUES (110, 13, 'detail');
INSERT INTO `productimage` VALUES (111, 12, 'single');
INSERT INTO `productimage` VALUES (112, 12, 'detail');
INSERT INTO `productimage` VALUES (113, 12, 'detail');
INSERT INTO `productimage` VALUES (114, 17, 'single');
INSERT INTO `productimage` VALUES (115, 17, 'detail');
INSERT INTO `productimage` VALUES (116, 17, 'detail');
INSERT INTO `productimage` VALUES (117, 16, 'single');
INSERT INTO `productimage` VALUES (118, 16, 'detail');
INSERT INTO `productimage` VALUES (119, 16, 'detail');
INSERT INTO `productimage` VALUES (120, 15, 'single');
INSERT INTO `productimage` VALUES (121, 15, 'detail');
INSERT INTO `productimage` VALUES (122, 15, 'detail');
INSERT INTO `productimage` VALUES (123, 25, 'single');
INSERT INTO `productimage` VALUES (124, 25, 'detail');
INSERT INTO `productimage` VALUES (125, 25, 'detail');
INSERT INTO `productimage` VALUES (126, 20, 'single');
INSERT INTO `productimage` VALUES (127, 20, 'detail');
INSERT INTO `productimage` VALUES (128, 20, 'detail');
INSERT INTO `productimage` VALUES (129, 19, 'single');
INSERT INTO `productimage` VALUES (130, 19, 'detail');
INSERT INTO `productimage` VALUES (131, 19, 'detail');
INSERT INTO `productimage` VALUES (132, 18, 'single');
INSERT INTO `productimage` VALUES (133, 18, 'detail');
INSERT INTO `productimage` VALUES (134, 18, 'detail');
INSERT INTO `productimage` VALUES (135, 18, 'detail');
INSERT INTO `productimage` VALUES (136, 24, 'single');
INSERT INTO `productimage` VALUES (137, 24, 'detail');
INSERT INTO `productimage` VALUES (138, 24, 'detail');
INSERT INTO `productimage` VALUES (139, 24, 'detail');
INSERT INTO `productimage` VALUES (140, 23, 'single');
INSERT INTO `productimage` VALUES (141, 23, 'detail');
INSERT INTO `productimage` VALUES (142, 23, 'detail');
INSERT INTO `productimage` VALUES (143, 23, 'detail');
INSERT INTO `productimage` VALUES (144, 22, 'single');
INSERT INTO `productimage` VALUES (145, 22, 'detail');
INSERT INTO `productimage` VALUES (146, 22, 'detail');
INSERT INTO `productimage` VALUES (147, 21, 'single');
INSERT INTO `productimage` VALUES (148, 21, 'detail');
INSERT INTO `productimage` VALUES (149, 21, 'detail');

-- ----------------------------
-- Table structure for property
-- ----------------------------
DROP TABLE IF EXISTS `property`;
CREATE TABLE `property`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_property_category`(`cid`) USING BTREE,
  CONSTRAINT `property_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for propertyvalue
-- ----------------------------
DROP TABLE IF EXISTS `propertyvalue`;
CREATE TABLE `propertyvalue`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `ptid` int(11) DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_propertyvalue_property`(`ptid`) USING BTREE,
  INDEX `fk_propertyvalue_product`(`pid`) USING BTREE,
  CONSTRAINT `propertyvalue_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `propertyvalue_ibfk_2` FOREIGN KEY (`ptid`) REFERENCES `property` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `createDate` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_review_product`(`pid`) USING BTREE,
  INDEX `fk_review_user`(`uid`) USING BTREE,
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES (1, '好吃', 1, 15, '2022-04-01 21:46:46');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'lin', 'f07281dc076edfb014acb48e76d3f476', 'cxiQ6b3icsTFVDpa6fFA9Q==');
INSERT INTO `user` VALUES (2, 'qin', '686834893a3275e8ac2d16f273d8ed49', 'exj11FxDi0K8xmZps5UE1A==');
INSERT INTO `user` VALUES (3, '林', '15e362f453b0355087598a109cfa14c4', 'ebVlnVJBnHMj4A+gSBijqg==');

SET FOREIGN_KEY_CHECKS = 1;
