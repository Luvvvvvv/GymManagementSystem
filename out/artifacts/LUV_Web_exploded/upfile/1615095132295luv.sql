/*
 Navicat Premium Data Transfer

 Source Server         : MYSQL
 Source Server Type    : MySQL
 Source Server Version : 50022
 Source Host           : localhost:3306
 Source Schema         : keyan

 Target Server Type    : MySQL
 Target Server Version : 50022
 File Encoding         : 65001

 Date: 07/03/2021 13:14:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `realname` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `sex` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `age` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `tel` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `addtime` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `sf` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '员工',
  UNIQUE INDEX `id` USING BTREE(`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '111', '罗敬文', '男', '18', '18152059486', NULL, '2021-02-10', '系统管理员');
INSERT INTO `admin` VALUES (34, 'ljw', '1', '罗敬文', '男', '24526', '15320222131', NULL, '2021-03-04', '健身教练');
INSERT INTO `admin` VALUES (35, 'jw', '1', '罗敬文', '男', '26', '15320222131', NULL, '2021-03-04', '管理人员');
INSERT INTO `admin` VALUES (46, 'dmz', '1', '邓明哲', '男', '15', '15320222131', NULL, '2021-03-05', '健身教练');
INSERT INTO `admin` VALUES (49, 'fyy', '1', '付彦颖', '男', '20', '15320222131', NULL, '2021-03-06', '管理人员');
INSERT INTO `admin` VALUES (53, 'dmz654', '1', '123', '123', '123', '15320222131', NULL, '2021-03-06', '管理人员');
INSERT INTO `admin` VALUES (54, 'hjs', '1', '胡靖松', '男', '20', '15320222131', NULL, '2021-03-06', '健身教练');
INSERT INTO `admin` VALUES (55, 'dmzasdas', '1', 'asdasd', 'asdasd', 'asdasd', '15320222131', NULL, '2021-03-07', '健身教练');

-- ----------------------------
-- Table structure for cg
-- ----------------------------
DROP TABLE IF EXISTS `cg`;
CREATE TABLE `cg`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `bh` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `lb` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `mc` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `fzr` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `xk` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `bz` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `url` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `yh` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `dw` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `sj` date NULL DEFAULT NULL,
  `sh` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '暂无',
  `yj` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '暂无',
  UNIQUE INDEX `id` USING BTREE(`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cg
-- ----------------------------
INSERT INTO `cg` VALUES (18, '罗敬文', 'null', '力量训练', 'null', '增肌', '12', 'upfile/16150114441212018.2之后的版本用这个.txt', 'ljw', 'null', '2021-03-06', '暂无', '暂无');
INSERT INTO `cg` VALUES (19, '张琳茂', 'null', '拉伸塑形', 'null', '减脂', '24', 'upfile/16150120501112018.2之后的版本用这个.txt', 'ljw', 'null', '2021-03-06', '暂无', '暂无');
INSERT INTO `cg` VALUES (21, '胡靖松', 'null', '有氧运动、HIIT', 'null', '减脂', '12', 'upfile/16150128136642018.2之后的版本用这个.txt', 'ljw', 'null', '2021-03-06', '暂无', '暂无');
INSERT INTO `cg` VALUES (22, '龚雪竹', NULL, '力量训练', NULL, '增肌、减脂', '36', 'upfile/16150129960352018.2之后的版本用这个.txt', 'ljw', 'null', '2021-03-06', '暂无', '暂无');
INSERT INTO `cg` VALUES (23, '付彦颖', NULL, '自由泳', NULL, '减脂', '12', 'upfile/1615042283307新建 Microsoft Excel 工作表.xlsx', 'ljw', 'null', '2021-03-06', '暂无', '暂无');
INSERT INTO `cg` VALUES (24, '胡靖松', NULL, '负重深蹲', NULL, '增肌', '6', 'upfile/1615043594683新建 Microsoft Excel 工作表 (2).xlsx', 'dmz', 'null', '2021-03-06', '暂无', '暂无');

-- ----------------------------
-- Table structure for cg1
-- ----------------------------
DROP TABLE IF EXISTS `cg1`;
CREATE TABLE `cg1`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `bh` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `mc` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `fzr` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `xk` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `bz` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `url` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `yh` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `dw` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `sj` date NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cg1
-- ----------------------------
INSERT INTO `cg1` VALUES (3, '1561609028803', '人工智能大数据行业讲座', '李靖', '2019.6.20', '1000', 'upfile/1561609118237高德地图API数据接入实现步行导航.doc', 'kyms', '大数据与软件学院', '2019-06-27');

-- ----------------------------
-- Table structure for dw
-- ----------------------------
DROP TABLE IF EXISTS `dw`;
CREATE TABLE `dw`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `mc` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `bz` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  UNIQUE INDEX `id` USING BTREE(`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dw
-- ----------------------------
INSERT INTO `dw` VALUES (1, '大数据与软件学院', 'test');
INSERT INTO `dw` VALUES (2, '经济管理学院', '测试\r\n');
INSERT INTO `dw` VALUES (3, '通识学院', '测试');
INSERT INTO `dw` VALUES (4, '中德学院', 'hsh');
INSERT INTO `dw` VALUES (5, '远景学院', 'ss');

-- ----------------------------
-- Table structure for fk
-- ----------------------------
DROP TABLE IF EXISTS `fk`;
CREATE TABLE `fk`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `mc` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `bz` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `sj` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `yh` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `dw` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  UNIQUE INDEX `id` USING BTREE(`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fk
-- ----------------------------
INSERT INTO `fk` VALUES (16, 'test', 'test', '2021-03-06', 'ljw', 'null');
INSERT INTO `fk` VALUES (17, '12312312', '124235423523453245', '2021-03-06', 'ljw', 'null');
INSERT INTO `fk` VALUES (18, '154234234', '124234234234234', '2021-03-06', 'ljw', 'null');

-- ----------------------------
-- Table structure for hd
-- ----------------------------
DROP TABLE IF EXISTS `hd`;
CREATE TABLE `hd`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `mc` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `bz` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `jzr` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `sj` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `yh` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `dw` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `sh` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '暂无',
  `yj` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '暂无',
  UNIQUE INDEX `id` USING BTREE(`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hd
-- ----------------------------
INSERT INTO `hd` VALUES (2, '关于举办百家讲坛的申请', '测试', 'sd', '2019-02-17', 'xxxry', '大数据与软件学院', '通过', '热烈支持');
INSERT INTO `hd` VALUES (3, '短时间', '大叔大婶大所大大奥大大啊', 'ad', '2019-06-25', 'kyry', '大数据与软件学院', '暂无', '暂无');
INSERT INTO `hd` VALUES (4, 'dasdasd', 'dasdasdasdasd', 'da', '2019-06-25', 'kyry', '大数据与软件学院', '暂无', '暂无');

-- ----------------------------
-- Table structure for rz
-- ----------------------------
DROP TABLE IF EXISTS `rz`;
CREATE TABLE `rz`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `yh` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `sf` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `sj` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `ip` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  UNIQUE INDEX `id` USING BTREE(`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 685 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rz
-- ----------------------------
INSERT INTO `rz` VALUES (393, 'admin', '系统管理员', '2021-03-04 15:30:48', '127.0.0.1');
INSERT INTO `rz` VALUES (394, 'admin', '系统管理员', '2021-03-04 15:34:26', '127.0.0.1');
INSERT INTO `rz` VALUES (395, 'admin', '系统管理员', '2021-03-04 15:36:33', '127.0.0.1');
INSERT INTO `rz` VALUES (396, 'admin', '系统管理员', '2021-03-04 15:38:21', '127.0.0.1');
INSERT INTO `rz` VALUES (397, 'admin', '系统管理员', '2021-03-04 15:39:05', '127.0.0.1');
INSERT INTO `rz` VALUES (398, 'admin', '系统管理员', '2021-03-04 15:53:27', '127.0.0.1');
INSERT INTO `rz` VALUES (399, 'admin', '系统管理员', '2021-03-04 15:54:27', '127.0.0.1');
INSERT INTO `rz` VALUES (400, 'admin', '系统管理员', '2021-03-04 15:56:16', '127.0.0.1');
INSERT INTO `rz` VALUES (401, 'admin', '系统管理员', '2021-03-04 15:58:49', '127.0.0.1');
INSERT INTO `rz` VALUES (402, 'admin', '系统管理员', '2021-03-04 16:00:58', '127.0.0.1');
INSERT INTO `rz` VALUES (403, 'admin', '系统管理员', '2021-03-04 16:02:19', '127.0.0.1');
INSERT INTO `rz` VALUES (404, 'admin', '系统管理员', '2021-03-04 16:03:41', '127.0.0.1');
INSERT INTO `rz` VALUES (405, 'admin', '系统管理员', '2021-03-04 16:04:27', '127.0.0.1');
INSERT INTO `rz` VALUES (406, 'admin', '系统管理员', '2021-03-04 16:09:32', '127.0.0.1');
INSERT INTO `rz` VALUES (407, 'admin', '系统管理员', '2021-03-04 16:11:05', '127.0.0.1');
INSERT INTO `rz` VALUES (408, 'admin', '系统管理员', '2021-03-04 16:12:49', '127.0.0.1');
INSERT INTO `rz` VALUES (409, 'admin', '系统管理员', '2021-03-04 16:14:33', '127.0.0.1');
INSERT INTO `rz` VALUES (412, 'admin', '系统管理员', '2021-03-04 16:19:48', '127.0.0.1');
INSERT INTO `rz` VALUES (413, 'ljw', '健身教练', '2021-03-04 16:22:51', '127.0.0.1');
INSERT INTO `rz` VALUES (414, 'admin', '系统管理员', '2021-03-04 16:25:25', '127.0.0.1');
INSERT INTO `rz` VALUES (415, 'jw', '管理人员', '2021-03-04 16:31:05', '127.0.0.1');
INSERT INTO `rz` VALUES (416, 'admin', '系统管理员', '2021-03-04 16:31:49', '127.0.0.1');
INSERT INTO `rz` VALUES (417, 'ljw', '健身教练', '2021-03-04 16:32:00', '127.0.0.1');
INSERT INTO `rz` VALUES (418, 'jw', '管理人员', '2021-03-04 16:32:45', '127.0.0.1');
INSERT INTO `rz` VALUES (419, 'ljw', '健身教练', '2021-03-04 16:34:00', '127.0.0.1');
INSERT INTO `rz` VALUES (420, 'admin', '系统管理员', '2021-03-04 16:35:02', '127.0.0.1');
INSERT INTO `rz` VALUES (421, 'admin', '系统管理员', '2021-03-04 16:55:31', '127.0.0.1');
INSERT INTO `rz` VALUES (422, 'admin', '系统管理员', '2021-03-04 17:06:40', '127.0.0.1');
INSERT INTO `rz` VALUES (423, 'admin', '系统管理员', '2021-03-04 17:25:43', '127.0.0.1');
INSERT INTO `rz` VALUES (424, 'jw', '管理人员', '2021-03-04 17:26:10', '127.0.0.1');
INSERT INTO `rz` VALUES (425, 'ljw', '健身教练', '2021-03-04 17:29:01', '127.0.0.1');
INSERT INTO `rz` VALUES (426, 'admin', '系统管理员', '2021-03-04 17:52:10', '127.0.0.1');
INSERT INTO `rz` VALUES (427, 'ljw', '健身教练', '2021-03-04 17:53:17', '127.0.0.1');
INSERT INTO `rz` VALUES (428, 'jw', '管理人员', '2021-03-04 17:54:31', '127.0.0.1');
INSERT INTO `rz` VALUES (429, 'ljw', '健身教练', '2021-03-04 17:55:38', '127.0.0.1');
INSERT INTO `rz` VALUES (430, 'ljw', '健身教练', '2021-03-05 10:24:50', '127.0.0.1');
INSERT INTO `rz` VALUES (431, 'ljw', '健身教练', '2021-03-05 10:38:15', '127.0.0.1');
INSERT INTO `rz` VALUES (432, 'jw', '管理人员', '2021-03-05 10:38:46', '127.0.0.1');
INSERT INTO `rz` VALUES (433, 'admin', '系统管理员', '2021-03-05 10:42:43', '127.0.0.1');
INSERT INTO `rz` VALUES (434, 'jw', '管理人员', '2021-03-05 10:44:50', '127.0.0.1');
INSERT INTO `rz` VALUES (435, 'ljw', '健身教练', '2021-03-05 10:53:21', '127.0.0.1');
INSERT INTO `rz` VALUES (437, 'admin', '系统管理员', '2021-03-05 10:59:21', '127.0.0.1');
INSERT INTO `rz` VALUES (438, 'ljw', '健身教练', '2021-03-05 11:00:12', '127.0.0.1');
INSERT INTO `rz` VALUES (439, 'admin', '系统管理员', '2021-03-05 11:08:19', '127.0.0.1');
INSERT INTO `rz` VALUES (440, 'admin', '系统管理员', '2021-03-05 11:10:50', '127.0.0.1');
INSERT INTO `rz` VALUES (441, 'admin', '系统管理员', '2021-03-05 11:12:31', '127.0.0.1');
INSERT INTO `rz` VALUES (442, 'admin', '系统管理员', '2021-03-05 11:13:15', '127.0.0.1');
INSERT INTO `rz` VALUES (443, 'admin', '系统管理员', '2021-03-05 11:14:37', '127.0.0.1');
INSERT INTO `rz` VALUES (444, 'admin', '系统管理员', '2021-03-05 11:18:44', '127.0.0.1');
INSERT INTO `rz` VALUES (445, 'ljw', '健身教练', '2021-03-05 11:19:42', '127.0.0.1');
INSERT INTO `rz` VALUES (446, 'ljw', '健身教练', '2021-03-05 11:20:23', '127.0.0.1');
INSERT INTO `rz` VALUES (447, 'jw', '管理人员', '2021-03-05 11:20:33', '127.0.0.1');
INSERT INTO `rz` VALUES (448, 'jw', '管理人员', '2021-03-05 11:24:26', '127.0.0.1');
INSERT INTO `rz` VALUES (449, 'jw', '管理人员', '2021-03-05 11:25:02', '127.0.0.1');
INSERT INTO `rz` VALUES (450, 'admin', '系统管理员', '2021-03-05 11:34:22', '127.0.0.1');
INSERT INTO `rz` VALUES (451, 'admin', '系统管理员', '2021-03-05 11:37:11', '127.0.0.1');
INSERT INTO `rz` VALUES (452, 'admin', '系统管理员', '2021-03-05 11:39:18', '127.0.0.1');
INSERT INTO `rz` VALUES (453, 'admin', '系统管理员', '2021-03-05 11:43:32', '127.0.0.1');
INSERT INTO `rz` VALUES (454, 'admin', '系统管理员', '2021-03-05 11:46:33', '127.0.0.1');
INSERT INTO `rz` VALUES (455, 'admin', '系统管理员', '2021-03-05 11:47:51', '127.0.0.1');
INSERT INTO `rz` VALUES (456, 'admin', '系统管理员', '2021-03-05 11:51:45', '127.0.0.1');
INSERT INTO `rz` VALUES (457, 'admin', '系统管理员', '2021-03-05 11:54:57', '127.0.0.1');
INSERT INTO `rz` VALUES (458, 'admin', '系统管理员', '2021-03-05 11:59:18', '127.0.0.1');
INSERT INTO `rz` VALUES (459, 'admin', '系统管理员', '2021-03-05 12:06:45', '127.0.0.1');
INSERT INTO `rz` VALUES (460, 'admin', '系统管理员', '2021-03-05 12:12:35', '127.0.0.1');
INSERT INTO `rz` VALUES (461, 'admin', '系统管理员', '2021-03-05 12:14:26', '127.0.0.1');
INSERT INTO `rz` VALUES (462, 'admin', '系统管理员', '2021-03-05 12:16:05', '127.0.0.1');
INSERT INTO `rz` VALUES (463, 'admin', '系统管理员', '2021-03-05 12:19:15', '127.0.0.1');
INSERT INTO `rz` VALUES (464, 'admin', '系统管理员', '2021-03-05 13:07:44', '127.0.0.1');
INSERT INTO `rz` VALUES (465, 'admin', '系统管理员', '2021-03-05 13:14:25', '127.0.0.1');
INSERT INTO `rz` VALUES (466, 'admin', '系统管理员', '2021-03-05 13:17:37', '127.0.0.1');
INSERT INTO `rz` VALUES (467, 'admin', '系统管理员', '2021-03-05 13:23:35', '127.0.0.1');
INSERT INTO `rz` VALUES (468, 'admin', '系统管理员', '2021-03-05 13:25:43', '127.0.0.1');
INSERT INTO `rz` VALUES (469, 'admin', '系统管理员', '2021-03-05 13:30:38', '127.0.0.1');
INSERT INTO `rz` VALUES (470, 'admin', '系统管理员', '2021-03-05 13:31:56', '127.0.0.1');
INSERT INTO `rz` VALUES (471, 'admin', '系统管理员', '2021-03-05 13:32:42', '127.0.0.1');
INSERT INTO `rz` VALUES (472, 'admin', '系统管理员', '2021-03-05 13:36:45', '127.0.0.1');
INSERT INTO `rz` VALUES (473, 'admin', '系统管理员', '2021-03-05 13:41:20', '127.0.0.1');
INSERT INTO `rz` VALUES (474, 'admin', '系统管理员', '2021-03-05 13:44:40', '127.0.0.1');
INSERT INTO `rz` VALUES (475, 'admin', '系统管理员', '2021-03-05 13:45:41', '127.0.0.1');
INSERT INTO `rz` VALUES (476, 'admin', '系统管理员', '2021-03-05 13:48:13', '127.0.0.1');
INSERT INTO `rz` VALUES (478, 'admin', '系统管理员', '2021-03-06 10:20:50', '127.0.0.1');
INSERT INTO `rz` VALUES (479, 'admin', '系统管理员', '2021-03-06 10:23:14', '127.0.0.1');
INSERT INTO `rz` VALUES (480, 'admin', '系统管理员', '2021-03-06 10:29:34', '127.0.0.1');
INSERT INTO `rz` VALUES (481, 'admin', '系统管理员', '2021-03-06 10:35:51', '127.0.0.1');
INSERT INTO `rz` VALUES (482, 'ljw', '健身教练', '2021-03-06 10:37:08', '127.0.0.1');
INSERT INTO `rz` VALUES (483, 'ljw', '健身教练', '2021-03-06 10:39:15', '127.0.0.1');
INSERT INTO `rz` VALUES (484, 'ljw', '健身教练', '2021-03-06 10:40:39', '127.0.0.1');
INSERT INTO `rz` VALUES (485, 'ljw', '健身教练', '2021-03-06 10:47:26', '127.0.0.1');
INSERT INTO `rz` VALUES (486, 'ljw', '健身教练', '2021-03-06 10:49:35', '127.0.0.1');
INSERT INTO `rz` VALUES (487, 'ljw', '健身教练', '2021-03-06 10:51:37', '127.0.0.1');
INSERT INTO `rz` VALUES (488, 'ljw', '健身教练', '2021-03-06 11:25:22', '127.0.0.1');
INSERT INTO `rz` VALUES (489, 'ljw', '健身教练', '2021-03-06 11:31:15', '127.0.0.1');
INSERT INTO `rz` VALUES (490, 'ljw', '健身教练', '2021-03-06 12:03:42', '127.0.0.1');
INSERT INTO `rz` VALUES (491, 'ljw', '健身教练', '2021-03-06 12:04:43', '127.0.0.1');
INSERT INTO `rz` VALUES (492, 'ljw', '健身教练', '2021-03-06 12:09:58', '127.0.0.1');
INSERT INTO `rz` VALUES (493, 'ljw', '健身教练', '2021-03-06 12:13:41', '127.0.0.1');
INSERT INTO `rz` VALUES (494, 'ljw', '健身教练', '2021-03-06 12:17:41', '127.0.0.1');
INSERT INTO `rz` VALUES (495, 'ljw', '健身教练', '2021-03-06 12:27:38', '127.0.0.1');
INSERT INTO `rz` VALUES (496, 'ljw', '健身教练', '2021-03-06 12:32:15', '127.0.0.1');
INSERT INTO `rz` VALUES (497, 'ljw', '健身教练', '2021-03-06 12:34:53', '127.0.0.1');
INSERT INTO `rz` VALUES (498, 'ljw', '健身教练', '2021-03-06 12:36:09', '127.0.0.1');
INSERT INTO `rz` VALUES (499, 'ljw', '健身教练', '2021-03-06 12:42:33', '127.0.0.1');
INSERT INTO `rz` VALUES (500, 'ljw', '健身教练', '2021-03-06 12:44:05', '127.0.0.1');
INSERT INTO `rz` VALUES (501, 'ljw', '健身教练', '2021-03-06 12:44:42', '127.0.0.1');
INSERT INTO `rz` VALUES (502, 'ljw', '健身教练', '2021-03-06 12:48:44', '127.0.0.1');
INSERT INTO `rz` VALUES (503, 'ljw', '健身教练', '2021-03-06 12:53:29', '127.0.0.1');
INSERT INTO `rz` VALUES (504, 'ljw', '健身教练', '2021-03-06 12:56:59', '127.0.0.1');
INSERT INTO `rz` VALUES (505, 'ljw', '健身教练', '2021-03-06 12:58:26', '127.0.0.1');
INSERT INTO `rz` VALUES (506, 'ljw', '健身教练', '2021-03-06 13:02:30', '127.0.0.1');
INSERT INTO `rz` VALUES (507, 'ljw', '健身教练', '2021-03-06 13:07:08', '127.0.0.1');
INSERT INTO `rz` VALUES (508, 'ljw', '健身教练', '2021-03-06 13:10:16', '127.0.0.1');
INSERT INTO `rz` VALUES (509, 'ljw', '健身教练', '2021-03-06 13:14:02', '127.0.0.1');
INSERT INTO `rz` VALUES (510, 'ljw', '健身教练', '2021-03-06 13:15:53', '127.0.0.1');
INSERT INTO `rz` VALUES (511, 'ljw', '健身教练', '2021-03-06 13:18:57', '127.0.0.1');
INSERT INTO `rz` VALUES (512, 'ljw', '健身教练', '2021-03-06 13:21:43', '127.0.0.1');
INSERT INTO `rz` VALUES (513, 'admin', '系统管理员', '2021-03-06 13:22:59', '127.0.0.1');
INSERT INTO `rz` VALUES (514, 'ljw', '健身教练', '2021-03-06 13:23:18', '127.0.0.1');
INSERT INTO `rz` VALUES (515, 'ljw', '健身教练', '2021-03-06 13:24:40', '127.0.0.1');
INSERT INTO `rz` VALUES (516, 'ljw', '健身教练', '2021-03-06 13:25:30', '127.0.0.1');
INSERT INTO `rz` VALUES (517, 'ljw', '健身教练', '2021-03-06 13:32:53', '127.0.0.1');
INSERT INTO `rz` VALUES (518, 'ljw', '健身教练', '2021-03-06 13:33:44', '127.0.0.1');
INSERT INTO `rz` VALUES (519, 'ljw', '健身教练', '2021-03-06 13:40:33', '127.0.0.1');
INSERT INTO `rz` VALUES (520, 'ljw', '健身教练', '2021-03-06 13:46:02', '127.0.0.1');
INSERT INTO `rz` VALUES (521, 'ljw', '健身教练', '2021-03-06 13:48:50', '127.0.0.1');
INSERT INTO `rz` VALUES (522, 'ljw', '健身教练', '2021-03-06 13:53:41', '127.0.0.1');
INSERT INTO `rz` VALUES (523, 'ljw', '健身教练', '2021-03-06 13:55:06', '127.0.0.1');
INSERT INTO `rz` VALUES (524, 'ljw', '健身教练', '2021-03-06 13:57:05', '127.0.0.1');
INSERT INTO `rz` VALUES (525, 'ljw', '健身教练', '2021-03-06 14:10:37', '127.0.0.1');
INSERT INTO `rz` VALUES (526, 'ljw', '健身教练', '2021-03-06 14:15:04', '127.0.0.1');
INSERT INTO `rz` VALUES (527, 'ljw', '健身教练', '2021-03-06 14:16:57', '127.0.0.1');
INSERT INTO `rz` VALUES (528, 'ljw', '健身教练', '2021-03-06 14:24:49', '127.0.0.1');
INSERT INTO `rz` VALUES (529, 'ljw', '健身教练', '2021-03-06 14:29:16', '127.0.0.1');
INSERT INTO `rz` VALUES (530, 'ljw', '健身教练', '2021-03-06 14:31:39', '127.0.0.1');
INSERT INTO `rz` VALUES (531, 'ljw', '健身教练', '2021-03-06 14:34:41', '127.0.0.1');
INSERT INTO `rz` VALUES (532, 'ljw', '健身教练', '2021-03-06 14:37:08', '127.0.0.1');
INSERT INTO `rz` VALUES (533, 'ljw', '健身教练', '2021-03-06 14:38:27', '127.0.0.1');
INSERT INTO `rz` VALUES (534, 'ljw', '健身教练', '2021-03-06 14:39:36', '127.0.0.1');
INSERT INTO `rz` VALUES (535, 'ljw', '健身教练', '2021-03-06 14:42:35', '127.0.0.1');
INSERT INTO `rz` VALUES (536, 'admin', '系统管理员', '2021-03-06 16:46:51', '127.0.0.1');
INSERT INTO `rz` VALUES (537, 'admin', '系统管理员', '2021-03-06 16:48:17', '127.0.0.1');
INSERT INTO `rz` VALUES (538, 'ljw', '健身教练', '2021-03-06 16:49:16', '127.0.0.1');
INSERT INTO `rz` VALUES (539, 'jw', '管理人员', '2021-03-06 16:51:37', '127.0.0.1');
INSERT INTO `rz` VALUES (540, 'ljw', '健身教练', '2021-03-06 16:52:43', '127.0.0.1');
INSERT INTO `rz` VALUES (541, 'admin', '系统管理员', '2021-03-06 16:55:30', '127.0.0.1');
INSERT INTO `rz` VALUES (542, 'admin', '系统管理员', '2021-03-06 17:09:08', '127.0.0.1');
INSERT INTO `rz` VALUES (543, 'admin', '系统管理员', '2021-03-06 17:11:43', '127.0.0.1');
INSERT INTO `rz` VALUES (544, 'admin', '系统管理员', '2021-03-06 17:14:04', '127.0.0.1');
INSERT INTO `rz` VALUES (545, 'ljw', '健身教练', '2021-03-06 17:29:13', '127.0.0.1');
INSERT INTO `rz` VALUES (546, 'admin', '系统管理员', '2021-03-06 17:30:30', '127.0.0.1');
INSERT INTO `rz` VALUES (547, 'admin', '系统管理员', '2021-03-06 17:38:44', '127.0.0.1');
INSERT INTO `rz` VALUES (548, 'ljw', '健身教练', '2021-03-06 17:39:02', '127.0.0.1');
INSERT INTO `rz` VALUES (549, 'admin', '系统管理员', '2021-03-06 17:40:04', '127.0.0.1');
INSERT INTO `rz` VALUES (550, 'admin', '系统管理员', '2021-03-06 17:43:19', '127.0.0.1');
INSERT INTO `rz` VALUES (551, 'admin', '系统管理员', '2021-03-06 17:46:01', '127.0.0.1');
INSERT INTO `rz` VALUES (552, 'admin', '系统管理员', '2021-03-06 17:50:17', '127.0.0.1');
INSERT INTO `rz` VALUES (553, 'jw', '管理人员', '2021-03-06 17:50:33', '127.0.0.1');
INSERT INTO `rz` VALUES (554, 'ljw', '健身教练', '2021-03-06 17:51:02', '127.0.0.1');
INSERT INTO `rz` VALUES (555, 'admin', '系统管理员', '2021-03-06 17:51:24', '127.0.0.1');
INSERT INTO `rz` VALUES (556, 'ljw', '健身教练', '2021-03-06 17:51:37', '127.0.0.1');
INSERT INTO `rz` VALUES (557, 'admin', '系统管理员', '2021-03-06 17:51:54', '127.0.0.1');
INSERT INTO `rz` VALUES (558, 'admin', '系统管理员', '2021-03-06 18:03:20', '127.0.0.1');
INSERT INTO `rz` VALUES (559, 'admin', '系统管理员', '2021-03-06 18:07:09', '127.0.0.1');
INSERT INTO `rz` VALUES (560, 'admin', '系统管理员', '2021-03-06 18:20:53', '127.0.0.1');
INSERT INTO `rz` VALUES (561, 'ljw', '健身教练', '2021-03-06 18:22:03', '127.0.0.1');
INSERT INTO `rz` VALUES (562, 'admin', '系统管理员', '2021-03-06 18:22:31', '127.0.0.1');
INSERT INTO `rz` VALUES (563, 'admin', '系统管理员', '2021-03-06 18:27:15', '127.0.0.1');
INSERT INTO `rz` VALUES (564, 'admin', '系统管理员', '2021-03-06 22:19:52', '127.0.0.1');
INSERT INTO `rz` VALUES (565, 'admin', '系统管理员', '2021-03-06 22:21:50', '127.0.0.1');
INSERT INTO `rz` VALUES (566, 'admin', '系统管理员', '2021-03-06 22:22:44', '127.0.0.1');
INSERT INTO `rz` VALUES (567, 'admin', '系统管理员', '2021-03-06 22:23:22', '127.0.0.1');
INSERT INTO `rz` VALUES (568, 'admin', '系统管理员', '2021-03-06 22:24:35', '127.0.0.1');
INSERT INTO `rz` VALUES (569, 'admin', '系统管理员', '2021-03-06 22:27:46', '127.0.0.1');
INSERT INTO `rz` VALUES (570, 'ljw', '健身教练', '2021-03-06 22:29:57', '127.0.0.1');
INSERT INTO `rz` VALUES (571, 'ljw', '健身教练', '2021-03-06 22:31:56', '127.0.0.1');
INSERT INTO `rz` VALUES (572, 'ljw', '健身教练', '2021-03-06 22:32:58', '127.0.0.1');
INSERT INTO `rz` VALUES (573, 'ljw', '健身教练', '2021-03-06 22:36:49', '127.0.0.1');
INSERT INTO `rz` VALUES (574, 'ljw', '健身教练', '2021-03-06 22:41:23', '127.0.0.1');
INSERT INTO `rz` VALUES (575, 'ljw', '健身教练', '2021-03-06 22:42:19', '127.0.0.1');
INSERT INTO `rz` VALUES (576, 'ljw', '健身教练', '2021-03-06 22:50:10', '127.0.0.1');
INSERT INTO `rz` VALUES (577, 'jw', '管理人员', '2021-03-06 22:51:47', '127.0.0.1');
INSERT INTO `rz` VALUES (578, 'ljw', '健身教练', '2021-03-06 22:53:51', '127.0.0.1');
INSERT INTO `rz` VALUES (579, 'jw', '管理人员', '2021-03-06 22:57:02', '127.0.0.1');
INSERT INTO `rz` VALUES (580, 'dmz', '健身教练', '2021-03-06 23:06:24', '127.0.0.1');
INSERT INTO `rz` VALUES (581, 'jw', '管理人员', '2021-03-06 23:07:10', '127.0.0.1');
INSERT INTO `rz` VALUES (582, 'jw', '管理人员', '2021-03-06 23:12:33', '127.0.0.1');
INSERT INTO `rz` VALUES (583, 'dmz', '健身教练', '2021-03-06 23:12:48', '127.0.0.1');
INSERT INTO `rz` VALUES (584, 'ljw', '健身教练', '2021-03-06 23:15:50', '127.0.0.1');
INSERT INTO `rz` VALUES (585, 'ljw', '健身教练', '2021-03-06 23:16:54', '127.0.0.1');
INSERT INTO `rz` VALUES (586, 'ljw', '健身教练', '2021-03-06 23:17:53', '127.0.0.1');
INSERT INTO `rz` VALUES (587, 'jw', '管理人员', '2021-03-06 23:18:17', '127.0.0.1');
INSERT INTO `rz` VALUES (588, 'jw', '管理人员', '2021-03-06 23:21:47', '127.0.0.1');
INSERT INTO `rz` VALUES (589, 'jw', '管理人员', '2021-03-06 23:22:58', '127.0.0.1');
INSERT INTO `rz` VALUES (590, 'ljw', '健身教练', '2021-03-06 23:23:34', '127.0.0.1');
INSERT INTO `rz` VALUES (591, 'jw', '管理人员', '2021-03-06 23:26:37', '127.0.0.1');
INSERT INTO `rz` VALUES (592, 'ljw', '健身教练', '2021-03-06 23:27:30', '127.0.0.1');
INSERT INTO `rz` VALUES (593, 'admin', '系统管理员', '2021-03-06 23:28:41', '127.0.0.1');
INSERT INTO `rz` VALUES (594, 'ljw', '健身教练', '2021-03-06 23:29:07', '127.0.0.1');
INSERT INTO `rz` VALUES (595, 'jw', '管理人员', '2021-03-06 23:29:22', '127.0.0.1');
INSERT INTO `rz` VALUES (596, 'ljw', '健身教练', '2021-03-06 23:30:30', '127.0.0.1');
INSERT INTO `rz` VALUES (597, 'jw', '管理人员', '2021-03-06 23:31:03', '127.0.0.1');
INSERT INTO `rz` VALUES (598, 'admin', '系统管理员', '2021-03-06 23:32:17', '127.0.0.1');
INSERT INTO `rz` VALUES (599, 'ljw', '健身教练', '2021-03-06 23:32:36', '127.0.0.1');
INSERT INTO `rz` VALUES (600, 'ljw', '健身教练', '2021-03-06 23:53:49', '127.0.0.1');
INSERT INTO `rz` VALUES (601, 'admin', '系统管理员', '2021-03-06 23:54:07', '127.0.0.1');
INSERT INTO `rz` VALUES (602, 'admin', '系统管理员', '2021-03-06 23:55:25', '127.0.0.1');
INSERT INTO `rz` VALUES (603, 'ljw', '健身教练', '2021-03-07 00:00:21', '127.0.0.1');
INSERT INTO `rz` VALUES (604, 'ljw', '健身教练', '2021-03-07 00:01:47', '127.0.0.1');
INSERT INTO `rz` VALUES (605, 'ljw', '健身教练', '2021-03-07 00:05:23', '127.0.0.1');
INSERT INTO `rz` VALUES (606, 'ljw', '健身教练', '2021-03-07 00:07:12', '127.0.0.1');
INSERT INTO `rz` VALUES (607, 'ljw', '健身教练', '2021-03-07 00:09:33', '127.0.0.1');
INSERT INTO `rz` VALUES (608, 'ljw', '健身教练', '2021-03-07 00:11:24', '127.0.0.1');
INSERT INTO `rz` VALUES (609, 'ljw', '健身教练', '2021-03-07 00:13:55', '127.0.0.1');
INSERT INTO `rz` VALUES (610, 'ljw', '健身教练', '2021-03-07 00:17:07', '127.0.0.1');
INSERT INTO `rz` VALUES (611, 'ljw', '健身教练', '2021-03-07 00:20:33', '127.0.0.1');
INSERT INTO `rz` VALUES (612, 'ljw', '健身教练', '2021-03-07 00:21:23', '127.0.0.1');
INSERT INTO `rz` VALUES (613, 'dmz', '健身教练', '2021-03-07 00:22:02', '127.0.0.1');
INSERT INTO `rz` VALUES (614, 'ljw', '健身教练', '2021-03-07 00:23:21', '127.0.0.1');
INSERT INTO `rz` VALUES (615, 'ljw', '健身教练', '2021-03-07 00:24:17', '127.0.0.1');
INSERT INTO `rz` VALUES (616, 'jw', '管理人员', '2021-03-07 00:26:22', '127.0.0.1');
INSERT INTO `rz` VALUES (617, 'ljw', '健身教练', '2021-03-07 00:29:48', '127.0.0.1');
INSERT INTO `rz` VALUES (618, 'ljw', '健身教练', '2021-03-07 00:31:10', '127.0.0.1');
INSERT INTO `rz` VALUES (619, 'ljw', '健身教练', '2021-03-07 00:34:05', '127.0.0.1');
INSERT INTO `rz` VALUES (620, 'ljw', '健身教练', '2021-03-07 00:35:21', '127.0.0.1');
INSERT INTO `rz` VALUES (621, 'ljw', '健身教练', '2021-03-07 00:37:11', '127.0.0.1');
INSERT INTO `rz` VALUES (622, 'ljw', '健身教练', '2021-03-07 00:39:00', '127.0.0.1');
INSERT INTO `rz` VALUES (623, 'ljw', '健身教练', '2021-03-07 00:40:15', '127.0.0.1');
INSERT INTO `rz` VALUES (624, 'admin', '系统管理员', '2021-03-07 00:43:07', '127.0.0.1');
INSERT INTO `rz` VALUES (625, 'ljw', '健身教练', '2021-03-07 00:44:38', '127.0.0.1');
INSERT INTO `rz` VALUES (626, 'ljw', '健身教练', '2021-03-07 00:45:39', '127.0.0.1');
INSERT INTO `rz` VALUES (627, 'ljw', '健身教练', '2021-03-07 00:47:03', '127.0.0.1');
INSERT INTO `rz` VALUES (628, 'ljw', '健身教练', '2021-03-07 00:50:52', '127.0.0.1');
INSERT INTO `rz` VALUES (629, 'ljw', '健身教练', '2021-03-07 00:52:23', '127.0.0.1');
INSERT INTO `rz` VALUES (630, 'admin', '系统管理员', '2021-03-07 00:52:33', '127.0.0.1');
INSERT INTO `rz` VALUES (631, 'ljw', '健身教练', '2021-03-07 00:54:48', '127.0.0.1');
INSERT INTO `rz` VALUES (632, 'ljw', '健身教练', '2021-03-07 00:55:47', '127.0.0.1');
INSERT INTO `rz` VALUES (633, 'ljw', '健身教练', '2021-03-07 00:58:36', '127.0.0.1');
INSERT INTO `rz` VALUES (634, 'ljw', '健身教练', '2021-03-07 00:59:11', '127.0.0.1');
INSERT INTO `rz` VALUES (635, 'ljw', '健身教练', '2021-03-07 01:00:58', '127.0.0.1');
INSERT INTO `rz` VALUES (636, 'ljw', '健身教练', '2021-03-07 01:03:04', '127.0.0.1');
INSERT INTO `rz` VALUES (637, 'ljw', '健身教练', '2021-03-07 01:07:38', '127.0.0.1');
INSERT INTO `rz` VALUES (638, 'ljw', '健身教练', '2021-03-07 01:10:58', '127.0.0.1');
INSERT INTO `rz` VALUES (639, 'ljw', '健身教练', '2021-03-07 01:13:50', '127.0.0.1');
INSERT INTO `rz` VALUES (640, 'ljw', '健身教练', '2021-03-07 01:16:57', '127.0.0.1');
INSERT INTO `rz` VALUES (641, 'ljw', '健身教练', '2021-03-07 01:18:16', '127.0.0.1');
INSERT INTO `rz` VALUES (642, 'ljw', '健身教练', '2021-03-07 01:18:54', '127.0.0.1');
INSERT INTO `rz` VALUES (643, 'ljw', '健身教练', '2021-03-07 01:20:55', '127.0.0.1');
INSERT INTO `rz` VALUES (644, 'ljw', '健身教练', '2021-03-07 01:21:29', '127.0.0.1');
INSERT INTO `rz` VALUES (645, 'ljw', '健身教练', '2021-03-07 01:23:35', '127.0.0.1');
INSERT INTO `rz` VALUES (646, 'ljw', '健身教练', '2021-03-07 01:26:43', '127.0.0.1');
INSERT INTO `rz` VALUES (647, 'ljw', '健身教练', '2021-03-07 01:29:12', '127.0.0.1');
INSERT INTO `rz` VALUES (648, 'ljw', '健身教练', '2021-03-07 01:32:12', '127.0.0.1');
INSERT INTO `rz` VALUES (649, 'ljw', '健身教练', '2021-03-07 01:33:08', '127.0.0.1');
INSERT INTO `rz` VALUES (650, 'ljw', '健身教练', '2021-03-07 01:33:42', '127.0.0.1');
INSERT INTO `rz` VALUES (651, 'ljw', '健身教练', '2021-03-07 01:42:27', '127.0.0.1');
INSERT INTO `rz` VALUES (652, 'ljw', '健身教练', '2021-03-07 02:13:21', '127.0.0.1');
INSERT INTO `rz` VALUES (653, 'ljw', '健身教练', '2021-03-07 02:14:11', '127.0.0.1');
INSERT INTO `rz` VALUES (654, 'ljw', '健身教练', '2021-03-07 02:19:31', '127.0.0.1');
INSERT INTO `rz` VALUES (655, 'ljw', '健身教练', '2021-03-07 02:22:06', '127.0.0.1');
INSERT INTO `rz` VALUES (656, 'ljw', '健身教练', '2021-03-07 02:25:39', '127.0.0.1');
INSERT INTO `rz` VALUES (657, 'ljw', '健身教练', '2021-03-07 02:26:18', '127.0.0.1');
INSERT INTO `rz` VALUES (658, 'ljw', '健身教练', '2021-03-07 02:26:35', '127.0.0.1');
INSERT INTO `rz` VALUES (659, 'ljw', '健身教练', '2021-03-07 02:27:32', '127.0.0.1');
INSERT INTO `rz` VALUES (660, 'ljw', '健身教练', '2021-03-07 02:27:54', '127.0.0.1');
INSERT INTO `rz` VALUES (661, 'ljw', '健身教练', '2021-03-07 02:28:53', '127.0.0.1');
INSERT INTO `rz` VALUES (662, 'ljw', '健身教练', '2021-03-07 02:29:20', '127.0.0.1');
INSERT INTO `rz` VALUES (663, 'ljw', '健身教练', '2021-03-07 02:30:42', '127.0.0.1');
INSERT INTO `rz` VALUES (664, 'ljw', '健身教练', '2021-03-07 02:32:47', '127.0.0.1');
INSERT INTO `rz` VALUES (665, 'ljw', '健身教练', '2021-03-07 02:38:56', '127.0.0.1');
INSERT INTO `rz` VALUES (666, 'ljw', '健身教练', '2021-03-07 02:39:15', '127.0.0.1');
INSERT INTO `rz` VALUES (667, 'ljw', '健身教练', '2021-03-07 02:40:01', '127.0.0.1');
INSERT INTO `rz` VALUES (668, 'ljw', '健身教练', '2021-03-07 02:42:12', '127.0.0.1');
INSERT INTO `rz` VALUES (669, 'ljw', '健身教练', '2021-03-07 02:43:42', '127.0.0.1');
INSERT INTO `rz` VALUES (670, 'ljw', '健身教练', '2021-03-07 02:52:40', '127.0.0.1');
INSERT INTO `rz` VALUES (671, 'ljw', '健身教练', '2021-03-07 03:01:12', '127.0.0.1');
INSERT INTO `rz` VALUES (672, 'ljw', '健身教练', '2021-03-07 03:02:25', '127.0.0.1');
INSERT INTO `rz` VALUES (673, 'ljw', '健身教练', '2021-03-07 03:03:17', '127.0.0.1');
INSERT INTO `rz` VALUES (674, 'ljw', '健身教练', '2021-03-07 03:07:10', '127.0.0.1');
INSERT INTO `rz` VALUES (675, 'ljw', '健身教练', '2021-03-07 03:07:53', '127.0.0.1');
INSERT INTO `rz` VALUES (676, 'ljw', '健身教练', '2021-03-07 13:06:59', '127.0.0.1');
INSERT INTO `rz` VALUES (677, 'ljw', '健身教练', '2021-03-07 13:07:42', '127.0.0.1');
INSERT INTO `rz` VALUES (678, 'ljw', '健身教练', '2021-03-07 13:08:22', '127.0.0.1');
INSERT INTO `rz` VALUES (679, 'ljw', '健身教练', '2021-03-07 13:10:01', '127.0.0.1');
INSERT INTO `rz` VALUES (680, 'admin', '系统管理员', '2021-03-07 13:10:34', '127.0.0.1');
INSERT INTO `rz` VALUES (681, 'ljw', '健身教练', '2021-03-07 13:10:39', '127.0.0.1');
INSERT INTO `rz` VALUES (682, 'ljw', '健身教练', '2021-03-07 13:11:09', '127.0.0.1');
INSERT INTO `rz` VALUES (683, 'ljw', '健身教练', '2021-03-07 13:12:19', '127.0.0.1');
INSERT INTO `rz` VALUES (684, 'ljw', '健身教练', '2021-03-07 13:13:00', '127.0.0.1');

-- ----------------------------
-- Table structure for tz
-- ----------------------------
DROP TABLE IF EXISTS `tz`;
CREATE TABLE `tz`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `mc` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `bz` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `sj` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `yh` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `dw` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  UNIQUE INDEX `id` USING BTREE(`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tz
-- ----------------------------
INSERT INTO `tz` VALUES (15, '123', 'adasdaddddddddddddddddddddddddddddddqwdqwdq', '2021-03-06', 'jw', 'null');
INSERT INTO `tz` VALUES (16, '1231231', '432534534r34r2d23d13e123', '2021-03-06', 'jw', 'null');
INSERT INTO `tz` VALUES (17, '2131231', 'dawd12d1wd', '2021-03-06', 'jw', 'null');
INSERT INTO `tz` VALUES (18, '1w31312', 'daweqwdad', '2021-03-06', 'jw', 'null');

-- ----------------------------
-- Table structure for wj
-- ----------------------------
DROP TABLE IF EXISTS `wj`;
CREATE TABLE `wj`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `mc` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `url` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `bz` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `sj` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `yh` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `dw` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  UNIQUE INDEX `id` USING BTREE(`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for xm
-- ----------------------------
DROP TABLE IF EXISTS `xm`;
CREATE TABLE `xm`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `bh` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `mc` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `fzr` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `lb` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `xk` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `jf` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `ksj` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `esj` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `url` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `yh` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `dw` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `sj` date NULL DEFAULT NULL,
  `sh` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '暂无',
  `yj` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '暂无',
  `zj` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '暂无',
  `zhj` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '暂无',
  `pf` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '暂无',
  UNIQUE INDEX `id` USING BTREE(`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xm
-- ----------------------------
INSERT INTO `xm` VALUES (22, '胡靖松', 'null', 'null', 'null', 'null', 'null', '2021-03-06', '2021-03-20', 'upfile/16150088398982018.2之后的版本用这个.txt', 'ljw', 'null', '2021-03-06', '暂无', '暂无', '暂无', '暂无', '暂无');
INSERT INTO `xm` VALUES (23, '付彦颖', NULL, 'null', 'null', 'null', 'null', '2021-03-10', '2021-03-28', 'upfile/16150101189512018.2之后的版本用这个.txt', 'ljw', 'null', '2021-03-06', '暂无', '暂无', '暂无', '暂无', '暂无');
INSERT INTO `xm` VALUES (24, '龚雪竹', NULL, NULL, NULL, NULL, NULL, '2021-03-10', '2021-03-27', 'upfile/16150102461662018.2之后的版本用这个.txt', 'ljw', 'null', '2021-03-06', '暂无', '暂无', '暂无', '暂无', '暂无');
INSERT INTO `xm` VALUES (26, '付彦颖', NULL, NULL, NULL, NULL, NULL, '2021-03-06', '2031-03-06', 'upfile/1615042235256新建 Microsoft Excel 工作表 (2).xlsx', 'ljw', 'null', '2021-03-06', '暂无', '暂无', '暂无', '暂无', '暂无');
INSERT INTO `xm` VALUES (27, '王茂森', NULL, NULL, NULL, NULL, NULL, '2021-03-05', '2021-03-07', 'upfile/1615043202041IMG_1121.PNG', 'dmz', 'null', '2021-03-06', '暂无', '暂无', '暂无', '暂无', '暂无');
INSERT INTO `xm` VALUES (28, '匡鹏', NULL, NULL, NULL, NULL, NULL, '2021-03-10', '2021-04-11', 'upfile/1615043219314IMG_1121.PNG', 'dmz', 'null', '2021-03-06', '暂无', '暂无', '暂无', '暂无', '暂无');

SET FOREIGN_KEY_CHECKS = 1;
