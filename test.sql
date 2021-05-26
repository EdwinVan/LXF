-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2021-05-26 10:49:17
-- 服务器版本： 5.7.26
-- PHP 版本： 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `test`
--

-- --------------------------------------------------------

--
-- 表的结构 `announcement`
--

CREATE TABLE `announcement` (
  `uid` bigint(20) NOT NULL,
  `content` varchar(1500) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `announcement`
--

INSERT INTO `announcement` (`uid`, `content`, `time`, `publisher`) VALUES
(1, '马克思主义7天速成班开班啦', '2020.12.32', '范玉杰'),
(2, '小葵花妈妈课堂开课啦', '2021.03.24', '谢钲钲'),
(3, '7天从天才变成傻蛋', '2021.05.20', '梁爽');

-- --------------------------------------------------------

--
-- 表的结构 `book`
--

CREATE TABLE `book` (
  `uid` bigint(20) NOT NULL,
  `bookname` varchar(255) DEFAULT NULL,
  `bookinc` varchar(1500) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `book`
--

INSERT INTO `book` (`uid`, `bookname`, `bookinc`, `publisher`, `author`) VALUES
(1, '马克思主义基本原理概论', '本课程主要对学生进行唯物主义哲学的基本原理教育，使学生掌握马克思主义哲学的基本观点、立场和方法；帮助学生掌握马克思主义的世界观和方法论，帮助学生树立正确的人生观和价值观；培养学生运用马克思主义哲学的观点和方法去分析问题、解决问题的能力，提高学生的政治理论素质和思维水平；为学生正确理解马克思主义，确立社会主义信念自觉坚持党的路线、方针和政策打下坚实的基础。', '中国人民出版社', '马克思'),
(2, '中国近现代史纲要', '《中国近现代史纲要》这门课程主要介绍了近现代时期中国人民反对外国侵略斗争，探索国家出路，改革浪潮中的大事变，中国革命的新道路，中华民族的抗体战争，改革开放与现代化建设新时期等内容。\r\n《中国近现代史纲要》这门课程主要介绍了近现代时期中国人民反对外国侵略斗争，探索国家出路，改革浪潮中的大事变，中国革命的新道路，中华民族的抗体战争，改革开放与现代化建设新时期等内容。', '清华大学出版社', '谢征征'),
(3, '操作系统', '《操作系统》是计算机应用技术专业开设的专业基础课，是培养学生具备计算机操作系统的基本理论、基本原理和应用能力的一门必修课，是学习其它后续专业课程的基础。本课程主要培养学生理解计算机操作系统的基本理论及原理，提高学生分析和解决软件系统问题的能力，是一门对学生操作系统相关知识的学习及应用能力培养起到关键、基础作用的课程。', '厦门大学出版社', '范玉杰');

-- --------------------------------------------------------

--
-- 表的结构 `course`
--

CREATE TABLE `course` (
  `uid` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `introduction` varchar(1500) DEFAULT NULL,
  `kind` varchar(255) DEFAULT NULL,
  `credit` double(10,2) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `teacher` varchar(255) DEFAULT NULL,
  `goal` varchar(1500) DEFAULT NULL,
  `team` varchar(1500) DEFAULT NULL,
  `textbook` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `course`
--

INSERT INTO `course` (`uid`, `name`, `introduction`, `kind`, `credit`, `unit`, `teacher`, `goal`, `team`, `textbook`) VALUES
(1, '马克思主义基本原理概论', '本课程主要对学生进行唯物主义哲学的基本原理教育，使学生掌握马克思主义哲学的基本观点、立场和方法；帮助学生掌握马克思主义的世界观和方法论，帮助学生树立正确的人生观和价值观；培养学生运用马克思主义哲学的观点和方法去分析问题、解决问题的能力，提高学生的政治理论素质和思维水平；为学生正确理解马克思主义，确立社会主义信念自觉坚持党的路线、方针和政策打下坚实的基础。', '通识选修课', 3.24, '马克思学院', '李三', '通过本课程的教学，学生应达到下列学习目标：1.理解掌握马克思主义基本原理。2.运用马克思主义世界观、方法论观察、分析和解决问题。3.梳理马克思主义的世界观、社会历史观、人生观和价值观。', '教学队伍6人全部具有博士学位。具有高级职称者4人， 40岁至60岁1人，30岁至40岁4人，20岁至30岁1人。年龄结构合理，发展平稳且可持续性好，具有很强的战斗力，形成了骨干教师承担教学重任，青年教师在梯队中培养锻炼的格局。同时还请高年级优秀的硕士研究生参加课程辅导，从而使得辅导教师与学生的师生比例达到学校的要求。', '《马克思主义基本原理概论》'),
(2, '中国近现代史纲要', '《中国近现代史纲要》这门课程主要介绍了近现代时期中国人民反对外国侵略斗争，探索国家出路，改革浪潮中的大事变，中国革命的新道路，中华民族的抗体战争，改革开放与现代化建设新时期等内容。\r\n《中国近现代史纲要》这门课程主要介绍了近现代时期中国人民反对外国侵略斗争，探索国家出路，改革浪潮中的大事变，中国革命的新道路，中华民族的抗体战争，改革开放与现代化建设新时期等内容。', '必修课', 4.00, '历史学院', '熊大', NULL, NULL, NULL),
(3, '操作系统', '《操作系统》是计算机应用技术专业开设的专业基础课，是培养学生具备计算机操作系统的基本理论、基本原理和应用能力的一门必修课，是学习其它后续专业课程的基础。本课程主要培养学生理解计算机操作系统的基本理论及原理，提高学生分析和解决软件系统问题的能力，是一门对学生操作系统相关知识的学习及应用能力培养起到关键、基础作用的课程。', '通识选修课', 5.00, '计算机与信息科学学院', '李白', NULL, NULL, NULL),
(46, '2', '42', '通识选修课', 1.00, '32', '32', '个', '4', '4');

-- --------------------------------------------------------

--
-- 表的结构 `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `pattern` varchar(128) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `enabled` tinyint(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `component` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `menu`
--

INSERT INTO `menu` (`id`, `pattern`, `parentId`, `enabled`, `name`, `component`) VALUES
(1, '/', NULL, 1, '所有', ''),
(2, '/home', 1, 1, '所有管理', 'Home'),
(3, '/db/**', 2, 1, '成绩管理', 'Score'),
(4, '/admin/**', 2, 1, '基本信息', 'Information'),
(5, '/student/**', 2, 1, '学生管理', 'Student'),
(6, '/home', 1, 1, '权限管理', 'Home'),
(7, '/user/**', 6, 1, '用户管理', 'UserManage'),
(8, '/teacher/**', 2, 1, '教师管理', 'Teacher'),
(9, '/course/**', 2, 1, '课程管理', 'Course'),
(10, '/index', 1, 1, '界面', 'Index'),
(11, '/book/**', 2, 1, '书籍管理', 'Book'),
(12, '/announcment/**', 2, 1, '公告管理', 'Announcement'),
(13, '/introduction', 1, 1, '课程简介', 'Introduction');

-- --------------------------------------------------------

--
-- 表的结构 `menu_role`
--

CREATE TABLE `menu_role` (
  `id` int(11) NOT NULL,
  `mid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `menu_role`
--

INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES
(1, 3, 1),
(2, 4, 2),
(3, 5, 3),
(4, 7, 2),
(5, 8, 3),
(6, 9, 3),
(7, 10, 3),
(8, 11, 3),
(9, 12, 3);

-- --------------------------------------------------------

--
-- 表的结构 `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `nameZh` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `role`
--

INSERT INTO `role` (`id`, `name`, `nameZh`) VALUES
(1, 'ROLE_dba', '数据库管理员'),
(2, 'ROLE_admin', '系统管理员'),
(3, 'ROLE_user', '用户');

-- --------------------------------------------------------

--
-- 表的结构 `student`
--

CREATE TABLE `student` (
  `uid` bigint(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `student`
--

INSERT INTO `student` (`uid`, `name`, `age`, `sex`) VALUES
(29, '徐昊', 22, '男'),
(31, 'hello', 23, '女'),
(32, '哈哈', 22, '男');

-- --------------------------------------------------------

--
-- 表的结构 `student_copy`
--

CREATE TABLE `student_copy` (
  `uid` bigint(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `student_copy`
--

INSERT INTO `student_copy` (`uid`, `name`, `age`, `sex`) VALUES
(23, '徐昊', 22, '男'),
(25, '阿旺', NULL, NULL),
(27, '信息', 35, 'VC'),
(28, '徐哈', 22, '男');

-- --------------------------------------------------------

--
-- 表的结构 `student_count`
--

CREATE TABLE `student_count` (
  `id` bigint(11) NOT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `student_count`
--

INSERT INTO `student_count` (`id`, `count`) VALUES
(1, 3);

-- --------------------------------------------------------

--
-- 表的结构 `teacher`
--

CREATE TABLE `teacher` (
  `uid` bigint(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `nation` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `party` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `area` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `school` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `speciality` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `qualification` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `workDate` date DEFAULT NULL,
  `college` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `course` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `hobby` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `ability` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `evaluate` text CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `teacher`
--

INSERT INTO `teacher` (`uid`, `name`, `age`, `sex`, `nation`, `party`, `area`, `address`, `phone`, `email`, `school`, `speciality`, `qualification`, `workDate`, `college`, `course`, `title`, `hobby`, `rate`, `ability`, `evaluate`) VALUES
(29, '小吴', 23, '女', '汉族', 'false', '河北省 秦皇岛市 北戴河区', 'xxxx街', '12344568912', '123456@qq.com', '重庆师范大学', '软件工程', '硕士', '2021-03-18', '音乐学院', 'Java', '讲师', '运动,音乐,舞蹈', 4, '0', '哈哈哈哈哈哈'),
(31, 'hello', 23, '男', '汉族', 'false', '河北省 唐山市 路北区', 'xx街', '12456789', '123456@qq.com', '厦门大学', '软件工程', '硕士', '2021-03-08', '音乐学院', 'PHP', '助教', '音乐', 5, '17', '哈哈哈哈'),
(39, '哈哈', 4, '女', '汉族', 'false', '北京市 东城区', 'xx街xx号', '86464146889', '46889@qq.com', '清华大学', '物理学', '硕士', '2021-03-15', '音乐学院', '物理', '副教授', '舞蹈,游戏,看书,运动', 4, '30', '嘿嘿');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL COMMENT 'userID',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `phone` char(11) DEFAULT NULL COMMENT '手机号码',
  `telephone` varchar(16) DEFAULT NULL COMMENT '住宅电话',
  `address` varchar(64) DEFAULT NULL COMMENT '联系地址',
  `enabled` tinyint(1) DEFAULT '1',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `remark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `remark`) VALUES
(1, '超级管理员', '18568887789', '029-82881234', '哈尔滨', 1, 'admin', '$2a$10$FWyDqiPfbdDDzbNThkg/je8mhU8kNxvmMFDkLl2KfhfLWL9IFC77u', NULL),
(2, '徐昊', '18568123489', '029-82123434', '重庆', 1, 'xuhao', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', NULL),
(3, '老王', '18568123666', '029-82111555', '广州', 1, 'laowang', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', NULL),
(8, '老张', NULL, NULL, NULL, 1, 'laozhang', '$2a$10$lv5kCzOsIVXVrYSOxykyGOUPpW.AIJ9.rAIVk6EJ6nxOyFGVmC0Zq', NULL),
(9, '老李', NULL, NULL, NULL, 0, 'laoli', '$2a$10$s3.qcTY9tw9egA.UoyBZ8Oyi6.NVAW84P6mN.A8wcgzXJQho.Ck9i', NULL),
(10, '小程', NULL, NULL, NULL, 1, 'xiaocheng', '$2a$10$9WvViONP7a.VcId3ktgg.Odj.WJExpc./j/eSNv2bSa8nArwfGGY2', NULL),
(11, '哈哈哈', NULL, NULL, NULL, 1, 'hhh', '$2a$10$30.wi4mGO6.wWgG2TEVw/O5glfMG1TWpgeEi7xK5Y5GvrQglQlH86', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `user_role`
--

INSERT INTO `user_role` (`id`, `uid`, `rid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 3, 3),
(5, 1, 3);

--
-- 转储表的索引
--

--
-- 表的索引 `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`uid`) USING BTREE;

--
-- 表的索引 `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`uid`) USING BTREE;

--
-- 表的索引 `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`uid`) USING BTREE;

--
-- 表的索引 `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `menu_role`
--
ALTER TABLE `menu_role`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`uid`) USING BTREE;

--
-- 表的索引 `student_copy`
--
ALTER TABLE `student_copy`
  ADD PRIMARY KEY (`uid`) USING BTREE;

--
-- 表的索引 `student_count`
--
ALTER TABLE `student_count`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`uid`) USING BTREE;

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `announcement`
--
ALTER TABLE `announcement`
  MODIFY `uid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `book`
--
ALTER TABLE `book`
  MODIFY `uid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `course`
--
ALTER TABLE `course`
  MODIFY `uid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- 使用表AUTO_INCREMENT `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `menu_role`
--
ALTER TABLE `menu_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `student`
--
ALTER TABLE `student`
  MODIFY `uid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- 使用表AUTO_INCREMENT `student_copy`
--
ALTER TABLE `student_copy`
  MODIFY `uid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- 使用表AUTO_INCREMENT `student_count`
--
ALTER TABLE `student_count`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `teacher`
--
ALTER TABLE `teacher`
  MODIFY `uid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'userID', AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
