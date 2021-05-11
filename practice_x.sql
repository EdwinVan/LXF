/*
 Navicat Premium Data Transfer

 Source Server         : Edwin
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : practice_x

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 12/05/2021 01:41:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kind` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `credit` double(10, 2) NULL DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `teacher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '马克思主义基本原理概论', '本课程主要对学生进行唯物主义哲学的基本原理教育，使学生掌握马克思主义哲学的基本观点、立场和方法；帮助学生掌握马克思主义的世界观和方法论，帮助学生树立正确的人生观和价值观；培养学生运用马克思主义哲学的观点和方法去分析问题、解决问题的能力，提高学生的政治理论素质和思维水平；为学生正确理解马克思主义，确立社会主义信念自觉坚持党的路线、方针和政策打下坚实的基础。', '通识选修课', 3.24, '马克思学院', '李三');
INSERT INTO `course` VALUES (2, '中国近现代史纲要', '《中国近现代史纲要》这门课程主要介绍了近现代时期中国人民反对外国侵略斗争，探索国家出路，改革浪潮中的大事变，中国革命的新道路，中华民族的抗体战争，改革开放与现代化建设新时期等内容。\r\n《中国近现代史纲要》这门课程主要介绍了近现代时期中国人民反对外国侵略斗争，探索国家出路，改革浪潮中的大事变，中国革命的新道路，中华民族的抗体战争，改革开放与现代化建设新时期等内容。', '必修课', 4.00, '历史学院', '熊大');
INSERT INTO `course` VALUES (3, '操作系统', '《操作系统》是计算机应用技术专业开设的专业基础课，是培养学生具备计算机操作系统的基本理论、基本原理和应用能力的一门必修课，是学习其它后续专业课程的基础。本课程主要培养学生理解计算机操作系统的基本理论及原理，提高学生分析和解决软件系统问题的能力，是一门对学生操作系统相关知识的学习及应用能力培养起到关键、基础作用的课程。', '通识选修课', 5.00, '计算机与信息科学学院', '李白');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pattern` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentId` int(11) NULL DEFAULT NULL,
  `enabled` tinyint(255) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '/', NULL, 1, '所有', '');
INSERT INTO `menu` VALUES (2, '/home', 1, 1, '所有管理', 'Home');
INSERT INTO `menu` VALUES (3, '/db/**', 2, 1, '成绩管理', 'Score');
INSERT INTO `menu` VALUES (4, '/admin/**', 2, 1, '基本信息', 'Information');
INSERT INTO `menu` VALUES (5, '/student/**', 2, 1, '学生管理', 'Student');
INSERT INTO `menu` VALUES (6, '/home', 1, 1, '权限管理', 'Home');
INSERT INTO `menu` VALUES (7, '/user/**', 6, 1, '用户管理', 'UserManage');
INSERT INTO `menu` VALUES (8, '/teacher/**', 2, 1, '教师管理', 'Teacher');
INSERT INTO `menu` VALUES (9, '/course/**', 2, 1, '课程管理', 'Course');

-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NULL DEFAULT NULL,
  `rid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
INSERT INTO `menu_role` VALUES (1, 3, 1);
INSERT INTO `menu_role` VALUES (2, 4, 2);
INSERT INTO `menu_role` VALUES (3, 5, 3);
INSERT INTO `menu_role` VALUES (4, 7, 2);
INSERT INTO `menu_role` VALUES (5, 8, 3);
INSERT INTO `menu_role` VALUES (6, 9, 3);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nameZh` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'ROLE_dba', '数据库管理员');
INSERT INTO `role` VALUES (2, 'ROLE_admin', '系统管理员');
INSERT INTO `role` VALUES (3, 'ROLE_user', '用户');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (29, '徐昊', 22, '男');
INSERT INTO `student` VALUES (31, 'hello', 23, '女');
INSERT INTO `student` VALUES (32, '哈哈', 22, '男');

-- ----------------------------
-- Table structure for student_copy
-- ----------------------------
DROP TABLE IF EXISTS `student_copy`;
CREATE TABLE `student_copy`  (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student_copy
-- ----------------------------
INSERT INTO `student_copy` VALUES (23, '徐昊', 22, '男');
INSERT INTO `student_copy` VALUES (25, '阿旺', NULL, NULL);
INSERT INTO `student_copy` VALUES (27, '信息', 35, 'VC');
INSERT INTO `student_copy` VALUES (28, '徐哈', 22, '男');

-- ----------------------------
-- Table structure for student_count
-- ----------------------------
DROP TABLE IF EXISTS `student_count`;
CREATE TABLE `student_count`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student_count
-- ----------------------------
INSERT INTO `student_count` VALUES (1, 3);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nation` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `party` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `area` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `school` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `speciality` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `qualification` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `workDate` date NULL DEFAULT NULL,
  `college` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `course` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `title` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `hobby` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `rate` double NULL DEFAULT NULL,
  `ability` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `evaluate` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (29, '大吴', 23, '女', '汉族', 'false', '河北省 秦皇岛市 北戴河区', 'xxxx街', '12344568912', '123456@qq.com', '重庆师范大学', '软件工程', '硕士', '2021-03-18', '音乐学院', 'Java', '讲师', '运动,音乐,舞蹈', 4, '0', '哈哈哈哈哈哈');
INSERT INTO `teacher` VALUES (31, 'hello', 23, '男', '汉族', 'false', '河北省 唐山市 路北区', 'xx街', '12456789', '123456@qq.com', '厦门大学', '软件工程', '硕士', '2021-03-08', '音乐学院', 'PHP', '助教', '音乐', 5, '17', '哈哈哈哈');
INSERT INTO `teacher` VALUES (39, '哈哈', 4, '女', '汉族', 'false', '北京市 东城区', 'xx街xx号', '86464146889', '46889@qq.com', '清华大学', '物理学', '硕士', '2021-03-15', '音乐学院', '物理', '副教授', '舞蹈,游戏,看书,运动', 4, '30', '嘿嘿');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'userID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `telephone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住宅电话',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `enabled` tinyint(1) NULL DEFAULT 1,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '超级管理员', '18568887789', '029-82881234', '哈尔滨', 1, 'admin', '$2a$10$.sLdL22ByKkT2.7KE6GJX.mcYFy8PdUWrahVDd65lY.UZG5Q5.We2', NULL);
INSERT INTO `user` VALUES (2, '徐昊', '18568123489', '029-82123434', '重庆', 1, 'xuhao', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', NULL);
INSERT INTO `user` VALUES (3, '老王', '18568123666', '029-82111555', '广州', 1, 'laowang', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', NULL);
INSERT INTO `user` VALUES (8, '老张', NULL, NULL, NULL, 1, 'laozhang', '$2a$10$lv5kCzOsIVXVrYSOxykyGOUPpW.AIJ9.rAIVk6EJ6nxOyFGVmC0Zq', NULL);
INSERT INTO `user` VALUES (9, '老李', NULL, NULL, NULL, 0, 'laoli', '$2a$10$s3.qcTY9tw9egA.UoyBZ8Oyi6.NVAW84P6mN.A8wcgzXJQho.Ck9i', NULL);
INSERT INTO `user` VALUES (10, '小程', NULL, NULL, NULL, 1, 'xiaocheng', '$2a$10$9WvViONP7a.VcId3ktgg.Odj.WJExpc./j/eSNv2bSa8nArwfGGY2', NULL);
INSERT INTO `user` VALUES (11, '哈哈哈', NULL, NULL, NULL, 1, 'hhh', '$2a$10$30.wi4mGO6.wWgG2TEVw/O5glfMG1TWpgeEi7xK5Y5GvrQglQlH86', NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `rid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 1, 2);
INSERT INTO `user_role` VALUES (3, 2, 2);
INSERT INTO `user_role` VALUES (4, 3, 3);
INSERT INTO `user_role` VALUES (5, 1, 3);

SET FOREIGN_KEY_CHECKS = 1;
