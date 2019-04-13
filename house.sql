/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : house

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-04-13 21:46:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `h_help`
-- ----------------------------
DROP TABLE IF EXISTS `h_help`;
CREATE TABLE `h_help` (
  `help_id` varchar(32) NOT NULL DEFAULT '帮助id',
  `help_content` mediumtext COMMENT '帮助内容',
  `help_title` varchar(128) DEFAULT NULL COMMENT '帮助名称',
  PRIMARY KEY (`help_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帮助表';

-- ----------------------------
-- Records of h_help
-- ----------------------------
INSERT INTO `h_help` VALUES ('1113784552347672576', '就是注册页面那一套拉，注册都不会别玩电脑了', '注册流程');

-- ----------------------------
-- Table structure for `h_house`
-- ----------------------------
DROP TABLE IF EXISTS `h_house`;
CREATE TABLE `h_house` (
  `house_id` varchar(32) NOT NULL COMMENT '房屋id',
  `house_name` varchar(32) DEFAULT NULL COMMENT '房屋名',
  `house_area` double DEFAULT NULL COMMENT '建筑面积',
  `house_address` mediumtext COMMENT '房屋地址',
  `house_user` varchar(32) DEFAULT NULL COMMENT '发布人',
  `house_price` double DEFAULT NULL COMMENT '价位',
  `house_content` mediumtext COMMENT '房屋描述',
  `house_img` varchar(128) DEFAULT NULL COMMENT '照骗',
  `house_state` int(11) DEFAULT NULL COMMENT '1未租出2已租出',
  `house_comment` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`house_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房屋表';

-- ----------------------------
-- Records of h_house
-- ----------------------------
INSERT INTO `h_house` VALUES ('1113431849851428864', '12311', '12312', '323123', '1', '500', '321321', '/photo/e5965e2afec64a19b904fa40e8b854ab.jpg', '2', '321');

-- ----------------------------
-- Table structure for `h_log`
-- ----------------------------
DROP TABLE IF EXISTS `h_log`;
CREATE TABLE `h_log` (
  `log_id` varchar(32) NOT NULL COMMENT '日志id',
  `log_house` varchar(32) NOT NULL COMMENT '出租房屋',
  `log_user` varchar(32) DEFAULT NULL COMMENT '租房用户',
  `log_state` int(11) DEFAULT NULL COMMENT '1正在租用，2已退房',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出租日志表';

-- ----------------------------
-- Records of h_log
-- ----------------------------
INSERT INTO `h_log` VALUES ('1113764533991682048', '1113431849851428864', '1', '2');
INSERT INTO `h_log` VALUES ('1114029939067281408', '1113431849851428864', '1', '2');
INSERT INTO `h_log` VALUES ('1117047221133545472', '1113431849851428864', '1113437212348784640', '1');

-- ----------------------------
-- Table structure for `h_money`
-- ----------------------------
DROP TABLE IF EXISTS `h_money`;
CREATE TABLE `h_money` (
  `money_id` varchar(32) NOT NULL COMMENT '租金记录id',
  `money_user` varchar(32) DEFAULT NULL COMMENT '租金缴费人',
  `money_house` varchar(32) DEFAULT NULL COMMENT '所属房屋',
  `money_month` varchar(32) DEFAULT NULL COMMENT '月份',
  `money_money` double DEFAULT NULL COMMENT '金额',
  PRIMARY KEY (`money_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='租金缴费表';

-- ----------------------------
-- Records of h_money
-- ----------------------------
INSERT INTO `h_money` VALUES ('1114040006923563008', '1', '1113431849851428864', '2019-04', '122');
INSERT INTO `h_money` VALUES ('1114040015920345088', '1', '1113431849851428864', '2019-04', '122');
INSERT INTO `h_money` VALUES ('1114040024980041728', '1', '1113431849851428864', '2019-04', '122');

-- ----------------------------
-- Table structure for `h_recharge`
-- ----------------------------
DROP TABLE IF EXISTS `h_recharge`;
CREATE TABLE `h_recharge` (
  `recharge_id` varchar(32) NOT NULL,
  `recharge_user` varchar(32) NOT NULL COMMENT '用户id',
  `recharge_money` double NOT NULL DEFAULT '0' COMMENT '充值金额',
  `recharge_time` varchar(64) NOT NULL COMMENT '充值时间',
  PRIMARY KEY (`recharge_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值记录表';

-- ----------------------------
-- Records of h_recharge
-- ----------------------------
INSERT INTO `h_recharge` VALUES ('1117040374590742528', '1113437212348784640', '10', '2019-04-13 20:22:33');
INSERT INTO `h_recharge` VALUES ('1117046292187484160', '1113437212348784640', '500', '2019-04-13 20:46:04');

-- ----------------------------
-- Table structure for `h_repair`
-- ----------------------------
DROP TABLE IF EXISTS `h_repair`;
CREATE TABLE `h_repair` (
  `repair_id` varchar(32) NOT NULL COMMENT '报修id',
  `repair_house` varchar(32) NOT NULL COMMENT '报修房屋',
  `repair_user` varchar(32) NOT NULL COMMENT '报修人',
  `repair_time` varchar(32) DEFAULT NULL COMMENT '保修时间',
  `repair_content` mediumtext COMMENT '报修内容',
  `repair_staff` varchar(64) DEFAULT NULL COMMENT '维修人',
  `repair_state` int(11) NOT NULL DEFAULT '0' COMMENT '0未维修，1维修中，2维修完毕',
  PRIMARY KEY (`repair_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报修表';

-- ----------------------------
-- Records of h_repair
-- ----------------------------
INSERT INTO `h_repair` VALUES ('1113792026932985856', '1113431849851428864', '1', '2019-04-04 21:14:47', '测测', '张三', '1');
INSERT INTO `h_repair` VALUES ('1117058282737926144', '1113431849851428864', '1113437212348784640', '2019-04-13 21:33:43', '测试', '李四', '2');

-- ----------------------------
-- Table structure for `h_user`
-- ----------------------------
DROP TABLE IF EXISTS `h_user`;
CREATE TABLE `h_user` (
  `id` varchar(32) NOT NULL COMMENT '用户id',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(12) DEFAULT NULL COMMENT '手机号',
  `card` varchar(32) DEFAULT NULL COMMENT '身份证号码，无用字段，不删，怕业务出问题',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `sex` int(11) DEFAULT NULL COMMENT '1男2女',
  `money` double DEFAULT '0' COMMENT '余额',
  `role` int(11) DEFAULT NULL COMMENT '1租户，2租赁公司，3管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of h_user
-- ----------------------------
INSERT INTO `h_user` VALUES ('1', 'admin', 'admin', '超级管理员', '123', '123', '18', '1', '-110', '3');
INSERT INTO `h_user` VALUES ('1113412484166909952', 'gongsi', 'gongsi', '公司', '312', null, '18', '2', '0', '2');
INSERT INTO `h_user` VALUES ('1113437212348784640', '12312', '123', '123123', '123123', null, '12', '1', '10', '1');
INSERT INTO `h_user` VALUES ('1113437227993538560', '41231', '1231', '23213', '321321', null, '1232131', '1', '0', '1');
INSERT INTO `h_user` VALUES ('1113437253788508160', '13', '213213', '123', '343254325', null, '123123', '1', '0', '1');
INSERT INTO `h_user` VALUES ('1113437269710086144', '23423', '4324', '234423', '2323424', null, '4234', '1', '0', '1');
INSERT INTO `h_user` VALUES ('1113437287087087616', '54232', '432', '2343235', '5234523', null, '234', '1', '0', '1');
INSERT INTO `h_user` VALUES ('1113437306414440448', '2345', '235', '234', '4234', null, '32532', '1', '0', '1');
INSERT INTO `h_user` VALUES ('1114054247143530496', 'gudazi', 'gudazi', '咕哒子', '1321', null, '17', '2', '0', '1');
INSERT INTO `h_user` VALUES ('1117044255731253248', '5324234', '3421324', '4234', '18296662232', '340323199703144933', '3423', '1', '0', '1');
