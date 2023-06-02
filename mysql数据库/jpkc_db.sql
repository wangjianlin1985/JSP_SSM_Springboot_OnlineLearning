/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : jpkc_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2018-07-12 15:01:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_classinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_classinfo`;
CREATE TABLE `t_classinfo` (
  `classNo` varchar(20) NOT NULL COMMENT 'classNo',
  `className` varchar(20) NOT NULL COMMENT '班级名称',
  `bornDate` varchar(20) default NULL COMMENT '成立日期',
  `mainTeacher` varchar(20) NOT NULL COMMENT '班主任',
  `classMemo` varchar(800) default NULL COMMENT '班级备注',
  PRIMARY KEY  (`classNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_classinfo
-- ----------------------------
INSERT INTO `t_classinfo` VALUES ('BJ001', '计算机3班', '2018-04-04', '王贤', '搞it的班级');
INSERT INTO `t_classinfo` VALUES ('BJ002', '电子技术1班', '2018-04-01', '李明清', '搞电子技术的班级');

-- ----------------------------
-- Table structure for `t_course`
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `courseNo` varchar(20) NOT NULL COMMENT 'courseNo',
  `courseName` varchar(20) NOT NULL COMMENT '课程名称',
  `coursePhoto` varchar(60) NOT NULL COMMENT '课程图片',
  `teacherObj` varchar(20) NOT NULL COMMENT '上课老师',
  `courseHours` int(11) NOT NULL COMMENT '课程学时',
  `jxff` varchar(500) NOT NULL COMMENT '教学大纲',
  `kcjj` varchar(800) NOT NULL COMMENT '课程简介',
  PRIMARY KEY  (`courseNo`),
  KEY `teacherObj` (`teacherObj`),
  CONSTRAINT `t_course_ibfk_1` FOREIGN KEY (`teacherObj`) REFERENCES `t_teacher` (`teacherNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES ('KC001', 'php网站开发', 'upload/41732e0d-666e-477f-9df8-cebe8f3e70b0.jpg', 'TH001', '32', '本书共分10章。主要内容包括：配置PHP开发环境、PHP语言基础、数组与函数、字符串与正则表达式、构建PHP互动网页、PHP文件编程、PHP图像处理、MySQL数据库管理、PHP数据库编程、会员管理系统设计。', '本书结构合理、论述准确、内容翔实、思路清晰，采用案例驱动和项目教学的讲述方式，通过大量实例深入浅出、循序渐进地引导读者学习，并提供了一个综合设计项目，每章后面均配有习题和上机实验。\r\n本书既可作为中等、高等职业院校计算机及相关专业或PHP培训班的教材，也可作为PHP爱好者和动态网站开发维护人员的学习参考书。\r\n本书还配有电子教学参考资料包（包括教学指南、电子教案和习题答案），以方便读者学习。');
INSERT INTO `t_course` VALUES ('KC002', 'HTML5网站设计', 'upload/2d1b7d2c-fa22-4172-b184-6de44f8bd74a.jpg', 'TH001', '40', '第一部分介绍了HTML5 Geolocation API。使用这种API，开发人员不必针对特定设备编程，就能够在浏览器中直接编写地理定位应用。这部分共6章，介绍了Geolocation API在浏览器代码中的使用，并通过大量示例向读者展示其“一次编写，随处部署”的特点。具体内容包括地理定位的基础知识简介，这套API的浏览器支持情况，以及如何利用它和其他常用地图工具在网页中实现类似Google地图的嵌入式地图。\r\n这一部分的主要内容还有：\r\n根据设备的不同，从各种来源收集地理信息\r\n探索地理坐标系统，包括大地测量系统和基准点?\r\n使用Geolocation API，以JavaScript代码从用户的浏览器中取得位置信息\r\n使用Google地图或基于JavaScript 的ArcGIS API将位置信息显示在地图上\r\n使用数据库、KML文件和Shapefile保存地理信息', '《深入HTML5应用开发》是人民邮电出版社2012-03-01出版的图书，作者是（美）Anthony T. Holdener III。本书合并了O’Reilly出版的《HTML5 Geolocation》与《HTML5:等轴实时游戏开发》两本书的内容。');

-- ----------------------------
-- Table structure for `t_homework`
-- ----------------------------
DROP TABLE IF EXISTS `t_homework`;
CREATE TABLE `t_homework` (
  `homeworkId` int(11) NOT NULL auto_increment COMMENT '作业id',
  `courseObj` varchar(20) NOT NULL COMMENT '作业课程',
  `taskTitle` varchar(20) NOT NULL COMMENT '作业任务',
  `taskContent` varchar(800) NOT NULL COMMENT '作业要求',
  `taskFile` varchar(60) NOT NULL COMMENT '作业文件',
  `homeworkDate` varchar(20) default NULL COMMENT '作业日期',
  PRIMARY KEY  (`homeworkId`),
  KEY `courseObj` (`courseObj`),
  CONSTRAINT `t_homework_ibfk_1` FOREIGN KEY (`courseObj`) REFERENCES `t_course` (`courseNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_homework
-- ----------------------------
INSERT INTO `t_homework` VALUES ('1', 'KC001', '完成第2章php基础作业', '打开教科书第58页，完成第3题，编写一个for循环计算从1加到100，测试好后发到老师邮箱sfafs@163.com', 'upload/4c29a40c-fb1d-4058-be78-7465181a2073.doc', '2018-04-09');
INSERT INTO `t_homework` VALUES ('2', 'KC002', '4月13日HTML5家庭作业', '请同学们利用HTML5的画布Canva实现常见几何图形的绘制，结果发到老师邮箱', 'upload/438f82df-cd62-4e44-8bed-03955898e448.doc', '2018-04-13');

-- ----------------------------
-- Table structure for `t_kejian`
-- ----------------------------
DROP TABLE IF EXISTS `t_kejian`;
CREATE TABLE `t_kejian` (
  `kejianId` int(11) NOT NULL auto_increment COMMENT '课件id',
  `title` varchar(60) NOT NULL COMMENT '课件标题',
  `courseObj` varchar(20) NOT NULL COMMENT '所属课程',
  `kejianDesc` varchar(800) NOT NULL COMMENT '课件描述',
  `kejianFile` varchar(60) NOT NULL COMMENT '课件文件',
  `addTime` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`kejianId`),
  KEY `courseObj` (`courseObj`),
  CONSTRAINT `t_kejian_ibfk_1` FOREIGN KEY (`courseObj`) REFERENCES `t_course` (`courseNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_kejian
-- ----------------------------
INSERT INTO `t_kejian` VALUES ('1', 'PHP开发基础for循环讲解课件', 'KC001', 'PHP开发基础for循环讲解课件，PHP开发基础for循环讲解课件，PHP开发基础for循环讲解课件，PHP开发基础for循环讲解课件，PHP开发基础for循环讲解课件，PHP开发基础for循环讲解课件', 'upload/2e999695-3996-4593-88cf-8a89ab11e598.ppt', '2018-04-09 10:33:03');
INSERT INTO `t_kejian` VALUES ('2', 'HTML5获取用户定位课件', 'KC002', 'HTML5获取用户定位课件，HTML5获取用户定位课件，HTML5获取用户定位课件，HTML5获取用户定位课件，HTML5获取用户定位课件，HTML5获取用户定位课件，HTML5获取用户定位课件，HTML5获取用户定位课件', 'upload/e307ad7b-4f71-4b95-9056-5d302a4397a8.ppt', '2018-04-14 00:56:48');

-- ----------------------------
-- Table structure for `t_leaveword`
-- ----------------------------
DROP TABLE IF EXISTS `t_leaveword`;
CREATE TABLE `t_leaveword` (
  `leaveWordId` int(11) NOT NULL auto_increment COMMENT '留言id',
  `leaveTitle` varchar(80) NOT NULL COMMENT '留言问题',
  `leaveContent` varchar(2000) NOT NULL COMMENT '留言内容',
  `userObj` varchar(30) NOT NULL COMMENT '留言人',
  `leaveTime` varchar(20) default NULL COMMENT '留言时间',
  `replyContent` varchar(1000) default NULL COMMENT '答疑回复',
  `replyTime` varchar(20) default NULL COMMENT '答疑时间',
  PRIMARY KEY  (`leaveWordId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_leaveword_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_student` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_leaveword
-- ----------------------------
INSERT INTO `t_leaveword` VALUES ('1', '老师我想学php网站', '这2年php好像比较火，学习入门比java低吗，好像说容易点？', 'STU001', '2018-04-09 10:32:15', '是的，初学者学网站这个入门快', '2018-04-13 22:37:56');
INSERT INTO `t_leaveword` VALUES ('2', '学习php网站开发工资多少？', '我是初学者，刚报了一个培训机构学习php,学5个月出来工资大概多少？', 'STU001', '2018-04-14 00:14:49', '--', '--');

-- ----------------------------
-- Table structure for `t_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeId` int(11) NOT NULL auto_increment COMMENT '公告id',
  `title` varchar(80) NOT NULL COMMENT '标题',
  `content` varchar(5000) NOT NULL COMMENT '公告内容',
  `publishDate` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`noticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '精品在线学习网成立了', '<p>同学们以后需要学习最新的课程内容，下载最新的课程课件，查看老师布置的作业，都在这个平台吧！</p>', '2018-04-09 10:33:30');

-- ----------------------------
-- Table structure for `t_student`
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `user_name` varchar(30) NOT NULL COMMENT 'user_name',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `classObj` varchar(20) NOT NULL COMMENT '所在班级',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `userPhoto` varchar(60) NOT NULL COMMENT '用户照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `address` varchar(80) default NULL COMMENT '家庭地址',
  `regTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`user_name`),
  KEY `classObj` (`classObj`),
  CONSTRAINT `t_student_ibfk_1` FOREIGN KEY (`classObj`) REFERENCES `t_classinfo` (`classNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('STU001', '123', 'BJ001', '李微梦', '女', '2018-03-27', 'upload/75a82242-c2be-41f3-bba3-14e7a1f60198.jpg', '13908095024', 'weimeng@163.com', '四川成都红星路', '2018-04-09 10:32:00');
INSERT INTO `t_student` VALUES ('STU002', '123', 'BJ002', '王晓雪', '女', '2018-04-04', 'upload/f75a7e49-29b1-43b4-9fc5-c5ec44059c06.jpg', '13539842343', 'xiaoxue@163.com', '福建福州海阳路12号', '2018-04-14 01:10:37');

-- ----------------------------
-- Table structure for `t_teacher`
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher` (
  `teacherNo` varchar(20) NOT NULL COMMENT 'teacherNo',
  `password` varchar(20) NOT NULL COMMENT '登录密码',
  `teacherName` varchar(20) NOT NULL COMMENT '教师姓名',
  `teacherSex` varchar(4) NOT NULL COMMENT '教师性别',
  `teacherPhoto` varchar(60) NOT NULL COMMENT '教师照片',
  `comeDate` varchar(20) default NULL COMMENT '入职日期',
  `teacherDesc` varchar(8000) NOT NULL COMMENT '教师介绍',
  PRIMARY KEY  (`teacherNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO `t_teacher` VALUES ('TH001', '123', '李兵', '男', 'upload/c0763bc9-8802-499c-b7c5-b03689e67ea6.jpg', '2018-04-03', '<p><span style=\"font-family:楷体_GB2312\"><span style=\"font-size:18px\"><span style=\"color:#000000\"><strong>李&nbsp;&nbsp;兵</strong>，1976年12月生，江苏徐州人，教授，博士生导师。<br/>&nbsp;&nbsp;&nbsp; 1999年本科毕业于西北工业大学热力发动机专业，2005年6月获西安交通大学工学博士学位，2005年11月至2007年4月在美国ANSYS公司工作，2007年6月返校从事教学科研工作至今。<br/>&nbsp;&nbsp;&nbsp; 主要研究领域为机械动态设计与故障诊断，主持了国家自然科学基金项目“基于第二代小波核函数的结构特征参数辨识及预测方法研究”，参加了国家自然科学基金重点项目“关键设备故障预示与运行安全保障的新理论和新技术”等研究工作。曾为华为、富士康、陕鼓、中船重工、西北电力设计研究院等企事业单位解决产品设计、有限元分析等方面的技术难题。<br/>&nbsp;&nbsp;&nbsp; 目前出版《小波有限元理论及其工程应用》、《ANSYS工程应用》、《ANSYS Workbench设计、仿真与优化》等论著3本，发表论文40余篇，其中被SCI和EI收录20余篇，获发明专利3项，研究成果“大型回转机械结构裂纹的动态定量诊断技术与应用”获2009年国家技术发明二等奖。<br/>&nbsp;&nbsp;&nbsp; 招收硕士研究生：“080201机械制造及其自动化”专业，研究方向“机电设备动态信号处理与有限元分析”；“080401精密仪器及机械 ”专业，研究方向“数字化制造装备远程监测与智能维护系统”。</span></span></span></p><p><span style=\"font-family:楷体_GB2312\"><span style=\"font-size:18px\"><span style=\"color:#000000\">&nbsp;&nbsp;&nbsp; 招收博士研究生：“080200机械工程”专业，研究方向“机电设备故障预示与振动控制”和“航空运行安全监控与表面强化”。</span></span></span></p><p><br/></p>');
INSERT INTO `t_teacher` VALUES ('TH002', '123', '张晓梅', '女', 'upload/c044bc36-1065-4e73-a513-aa78a2bbc8aa.jpg', '2018-04-04', '<p style=\"white-space: normal;\">2009年7月，毕业于<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%9C%E5%8C%97%E5%B8%88%E8%8C%83%E5%A4%A7%E5%AD%A6\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">xx师范大学</a>中文系，获得<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%96%87%E5%AD%A6%E5%AD%A6%E5%A3%AB\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">文学学士</a>学位。</p><p style=\"white-space: normal;\">2017年7月，毕业于<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A4%A9%E6%B4%A5%E5%A4%A7%E5%AD%A6\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">***大学</a>技术经济系，获得<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%B7%A5%E5%95%86%E7%AE%A1%E7%90%86%E7%A1%95%E5%A3%AB\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">工商管理硕士</a>学位。</p><p style=\"white-space: normal;\">现为<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%B2%88%E9%98%B3%E5%B7%A5%E4%B8%9A%E5%A4%A7%E5%AD%A6%E6%96%87%E6%B3%95%E5%AD%A6%E9%99%A2\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">**大学文法学院</a>新闻传播系<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%95%99%E5%B8%88\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">教师</a>、系<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%BB%E4%BB%BB\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">主任</a>。</p><p style=\"white-space: normal;\">中国高教研究会广告学教育研究会理事。</p><p style=\"white-space: normal;\"><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%AD%E5%9B%BD%E9%AB%98%E6%95%99%E7%A0%94%E7%A9%B6\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">中国高教研究</a>会公共关系专业委员会理事。</p><p><br/></p>');

-- ----------------------------
-- Table structure for `t_video`
-- ----------------------------
DROP TABLE IF EXISTS `t_video`;
CREATE TABLE `t_video` (
  `videoId` int(11) NOT NULL auto_increment COMMENT '视频id',
  `title` varchar(60) NOT NULL COMMENT '视频标题',
  `courseObj` varchar(20) NOT NULL COMMENT '所属课程',
  `videoDesc` varchar(800) NOT NULL COMMENT '视频介绍',
  `videoFile` varchar(60) NOT NULL COMMENT '视频文件',
  `videoTime` varchar(20) default NULL COMMENT '录制时间',
  PRIMARY KEY  (`videoId`),
  KEY `courseObj` (`courseObj`),
  CONSTRAINT `t_video_ibfk_1` FOREIGN KEY (`courseObj`) REFERENCES `t_course` (`courseNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_video
-- ----------------------------
INSERT INTO `t_video` VALUES ('1', 'php文件基本操作视频讲解', 'KC001', '本节讲解了php开发语言怎么操作文件的过程，包括建立文件和文件夹，打开文件读取文件内容，删除文件等等！', 'upload/b5ffbe1a-1b24-443f-bdb7-c401643169a5.mp4', '2018-04-09 10:32:53');
INSERT INTO `t_video` VALUES ('2', '面向对象封装与复用', 'KC001', '讲解了php语言怎么实现面向对象编程的过程！', 'upload/b5ffbe1a-1b24-443f-bdb7-c401643169a5.mp4', '2018-04-14 00:42:22');

-- ----------------------------
-- Table structure for `t_xiti`
-- ----------------------------
DROP TABLE IF EXISTS `t_xiti`;
CREATE TABLE `t_xiti` (
  `xitiId` int(11) NOT NULL auto_increment COMMENT '习题id',
  `courseObj` varchar(20) NOT NULL COMMENT '所属课程',
  `title` varchar(50) NOT NULL COMMENT '习题标题',
  `content` varchar(20000) NOT NULL COMMENT '习题内容',
  `xitiTime` varchar(20) default NULL COMMENT '添加时间',
  PRIMARY KEY  (`xitiId`),
  KEY `courseObj` (`courseObj`),
  CONSTRAINT `t_xiti_ibfk_1` FOREIGN KEY (`courseObj`) REFERENCES `t_course` (`courseNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_xiti
-- ----------------------------
INSERT INTO `t_xiti` VALUES ('1', 'KC001', 'PHP面试题目', '<p style=\"margin-top: 20px; margin-bottom: 20px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>1 数据库中的事务是什么？</strong></p><p style=\"margin-top: 20px; margin-bottom: 20px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><strong><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\">2 用PHP写出显示客户端IP与服务器IP的代码</strong></strong></p><p style=\"margin-top: 20px; margin-bottom: 20px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><strong><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\">3 error_reporting(2047)什么作用？</strong></strong></p><p style=\"margin-top: 20px; margin-bottom: 20px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><strong><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\"><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\">4 session与cookie的区别?</strong></strong></strong></p><p style=\"margin-top: 20px; margin-bottom: 20px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><strong><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\"><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\"><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\">5 表单中 get与post提交方法的区别?</strong></strong></strong></strong></p><p style=\"margin-top: 20px; margin-bottom: 20px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><strong><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\"><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\"><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\"><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\">6 用PHP打印出前一天的时间格式是2013-11-26 12:11:11</strong></strong></strong></strong></strong></p><p style=\"margin-top: 20px; margin-bottom: 20px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><strong><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\"><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\"><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\"><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\"><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\">7 打开php.ini中的Safe_mode，会影响哪些函数？至少说出6个。</strong></strong></strong></strong></strong></strong></p><p style=\"margin-top: 20px; margin-bottom: 20px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><strong><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\"><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\"><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\"><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\"><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\"><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\">8 MySQL数据库，怎么优化？</strong></strong></strong></strong></strong></strong></strong></p><p style=\"margin-top: 20px; margin-bottom: 20px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><strong><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\"><strong style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal;\"><br/></strong></strong></strong></p><p style=\"margin-top: 20px; margin-bottom: 20px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">1 答:事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，&nbsp;事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。&nbsp;答：事务就是一系列的操作,这些操作完成一项任务。只要这些操作里有一个操作没有成功,事务就操作失败,发生回滚事件。即撤消前面的操作,这样可以保证数据的一致性。而且可以把操作暂时放在缓存里,等所有操作都成功有提交数据库,这样保证费时的操作都是有效操作。</p><p style=\"margin-top: 20px; margin-bottom: 20px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">2答:打印客户端IP:echo $_SERVER[&#39;REMOTE_ADDR&#39;]; 或者: getenv(&#39;REMOTE_ADDR&#39;);&nbsp;打印服务器IP:echo gethostbyname(&#39;www.meizhi520.com&#39;)</p><p style=\"margin-top: 20px; margin-bottom: 20px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">3 答：PHP 显示所有错误 E_ALL</p><p style=\"margin-top: 20px; margin-bottom: 20px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">4 答:session:储存用户访问的全局唯一变量,存储在服务器上的php指定的目录中的（session_dir）的位置进行的存放&nbsp;cookie:用来存储连续訪問一个頁面时所使用，是存储在客户端，对于Cookie来说是存储在用户WIN的Temp目录中的。&nbsp;两者都可通过时间来设置时间长短</p><p style=\"margin-top: 20px; margin-bottom: 20px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">5 答:get是发送请求HTTP协议通过url参数传递进行接收,而post是实体数据,可以通过表单提交大量信息.</p><p style=\"margin-top: 20px; margin-bottom: 20px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">6 答:echodate(&#39;Y-m-d H:i:s&#39;,&nbsp;strtotime(&#39;-1 days&#39;));</p><p style=\"margin-top: 20px; margin-bottom: 20px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">7 答：&nbsp;1:用户输入输出函数(fopen() file()require(),只能用于调用这些函数有相同脚本的拥有者)&nbsp;2:创建新文件(限制用户只在该用户拥有目录下创建文件)&nbsp;3:用户调用popen() systen()exec()等脚本，只有脚本处在sa fe_mode_exec_dir配置指令指定的 录中才可能&nbsp;4:加强HTTP认证，认证脚本拥有者的UID的划入认证领域范围内，此外启用安全模式下，不会设置PHP_AUTH&nbsp;5:mysql服务器所用的用户名必须与调用mysql_connect()的文件的拥有者用户名相同&nbsp;6:受影响的函数变量以及配置命令达到40个</p><p style=\"margin-top: 20px; margin-bottom: 20px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">8 答：&nbsp;(1)配置优化（服务器配置） &nbsp;&nbsp;(2)建表优化（表、字段设置）&nbsp;(3)查询优化（sql语句）&nbsp;答：&nbsp;1、选取最适用的字段属性,尽可能减少定义字段长度,尽量把字段设置NOT NULL,例如’省份,性别’,最好设置为ENUM&nbsp;2、使用连接（JOIN）来代替子查询:&nbsp;3、使用联合(UNION)来代替手动创建的临时表&nbsp;4、事务处理:&nbsp;5、锁定表,优化事务处理:&nbsp;6、使用外键,优化锁定表&nbsp;7、建立索引:&nbsp;8、优化查询语句</p><p><br/></p>', '2018-04-09 10:31:32');
INSERT INTO `t_xiti` VALUES ('2', 'KC002', 'Html5+js测试题', '<p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5; font-size: 18pt; color: rgb(255, 0, 0);\">1. 谈谈你对js闭包的理解:</span></p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5;\">使用闭包主要是为了设计私有的方法和变量。闭包的优点是可以避免全局变量的污染，缺点是闭包会常驻内存，会增大内存使用量，使用不当很容易造成内存泄露。</span></p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5; color: rgb(51, 102, 255);\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5; color: rgb(0, 0, 0);\">闭包三个特性:</span>&nbsp;&nbsp;&nbsp;</span></p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5; color: rgb(51, 102, 255);\">　　　　　　&nbsp;①：函数嵌套函数&nbsp;;</span></p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5; color: rgb(51, 102, 255);\">　　　　　　 ②：函数内部可以引用外部的参数和变量&nbsp;;</span></p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5; color: rgb(51, 102, 255);\">　　　　　　 ③：参数和变量不会被垃圾回收机制回收</span></p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><br/><span style=\"margin: 0px; padding: 0px; line-height: 1.5; font-size: 18pt; color: rgb(255, 0, 0);\">2.	谈谈你对Cookie的理解和优缺点:【客户端】</span></p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5;\">cookie虽然在持久保存客户端数据提供了方便，分担了服务器存储的负担，但还是有很多局限性的;</span></p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5;\">每个特定的域名下最多生成20个cookie;IE和Opera 会清理近期最少使用的cookie，Firefox会随机清理cookie;cookie的最大大约为4096字节，为了兼容性，一般不能超过4095字节;</span></p><h3 style=\"margin: 10px 0px; padding: 0px; font-size: 16px; line-height: 1.5; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5; color: rgb(51, 102, 255);\">优点：极高的扩展性和可用性</span></h3><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5;\">1.通过良好的编程，控制保存在cookie中的session对象的大小。</span></p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5;\">2.通过加密和安全传输技术（SSL），减少cookie被破解的可能性。</span></p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5;\">3.只在cookie中存放不敏感数据，即使被盗也不会有重大损失。</span></p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5;\">4.控制cookie的生命期，使之不会永远有效。偷盗者很可能拿到一个过期的cookie。</span></p><h3 style=\"margin: 10px 0px; padding: 0px; font-size: 16px; line-height: 1.5; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5; color: rgb(51, 102, 255);\">缺点:</span></h3><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5;\">1.Cookie数量和长度的限制。每个domain最多只能有20条cookie，每个cookie长度不能超过4KB，否则会被截掉。</span></p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5;\">2.安全性问题。如果cookie被人拦截了，那人就可以取得所有的session信息。即使加密也与事无补，因为拦截者并不需要知道cookie的意义，他只要原样转发cookie就可以达到目的了。</span></p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5;\">3.有些状态不可能保存在客户端。例如，为了防止重复提交表单，我们需要在服务器端保存一个计数器。如果我们把这个计数器保存在客户端，那么它起不到任何作用。</span></p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><br/><span style=\"margin: 0px; padding: 0px; line-height: 1.5; font-size: 18pt; color: rgb(255, 0, 0);\">3.	html5浏览器本地存储有哪些?</span></p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">在较高版本的浏览器中，js提供了<span style=\"margin: 0px; padding: 0px; line-height: 1.5; background-color: rgb(255, 255, 153);\">sessionStorage</span>和<span style=\"margin: 0px; padding: 0px; line-height: 1.5; background-color: rgb(255, 255, 153);\">globalStorage</span>。在HTML5中提供了localStorage来取代globalStorage。</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">html5中的Web Storage包括了两种存储方式：sessionStorage和localStorage。</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">sessionStorage:用于本地存储一个会话（session）中的数据，这些数据只有在同一个会话中的页面才能访问并且当会话结束后数据也随之销毁。因此sessionStorage不是一种持久化的本地存储，仅仅是会话级别的存储。</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">localStorage:用于持久化的本地存储，除非主动删除数据，否则数据是永远不会过期的。</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><br/><span style=\"margin: 0px; padding: 0px; line-height: 1.5; font-size: 18pt; color: rgb(255, 0, 0);\">4.	web storage和cookie的区别?</span></p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">Web Storage的概念和cookie相似，区别是:</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><strong style=\"margin: 0px; padding: 0px;\">Web storage:</strong>1.是为了更大容量存储设计的。2.Web Storage拥有setItem,getItem,removeItem,clear等方法.3.Web Storage仅仅是为了在本地“存储”数据而生</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><strong style=\"margin: 0px; padding: 0px;\">Cookie:</strong>1.大小是受限的，并且每次你请求一个新的页面的时候Cookie都会被发送过去，这样无形中浪费了带宽;2.cookie还需要指定作用域，不可以跨域调用。3.需要前端开发者自己封装setCookie，getCookie.4.cookie的作用是与服务器进行交互，作为HTTP规范的一部分而存在;</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">**localStorage和sessionStorage都具有相同的操作方法，例如setItem、getItem和removeItem等**</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><br/><span style=\"margin: 0px; padding: 0px; line-height: 1.5; font-size: 18pt; color: rgb(255, 0, 0);\">5.	cookie 和session 的区别：</span></p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">1.cookie数据存放在客户的浏览器上，session数据放在服务器上。</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">2.cookie不是很安全，别人可以分析存放在本地的COOKIE并进行COOKIE欺骗 考虑到安全应当使用session。</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">3.session会在一定时间内保存在服务器上。当访问增多，会比较占用你服务器的性能 考虑到减轻服务器性能方面，应当使用COOKIE。</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">4.单个cookie保存的数据不能超过4K，很多浏览器都限制一个站点最多保存20个cookie。</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">5.所以个人建议:将登陆信息等重要信息存放为SESSION其他信息如果需要保留,可以放在COOKIE中</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><br/><span style=\"margin: 0px; padding: 0px; line-height: 1.5; font-size: 18pt; color: rgb(255, 0, 0);\">6.	<span style=\"margin: 0px; padding: 0px; line-height: 1.5; color: rgb(51, 153, 102);\">display:none</span>和<span style=\"margin: 0px; padding: 0px; line-height: 1.5; color: rgb(51, 153, 102);\">visibility:hidden</span>的区别？</span></p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">display:none:隐藏对应的元素，在文档布局中不再给它分配空间，它各边的元素会合拢， 就当他从来不存在。</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">visibility:hidden:隐藏对应的元素，但是在文档布局中仍保留原来的空间。</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><br/><span style=\"margin: 0px; padding: 0px; line-height: 1.5; font-size: 18pt; color: rgb(255, 0, 0);\">7.	position:absolute和float属性的异同</span></p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">共同点：对内联元素设置`float`和`absolute`属性，可以让元素脱离文档流，并且可以设置其宽高。</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">不同点：float仍会占据位置，position会覆盖文档流中的其他元素。</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\"><br/><span style=\"margin: 0px; padding: 0px; line-height: 1.5; font-size: 18pt; color: rgb(255, 0, 0);\">8.	介绍一下box-sizing属性？</span></p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">box-sizing属性主要用来控制元素的盒模型的解析模式。默认值是content-box。&nbsp;</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">content-box：让元素维持W3C的标准盒模型。元素的宽度/高度由border + padding + content的宽度/高度决定，设置width/height属性指的是content部分的宽/高</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">border-box：让元素维持IE传统盒模型（IE6以下版本和IE6~7的怪异模式）。设置width/height属性指的是border + padding + content</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">标准浏览器下，按照W3C规范对盒模型解析，一旦修改了元素的边框或内距，就会影响元素的盒子尺寸，就不得不重新计算元素的盒子尺寸，从而影响整个页面的布局。</p><p><br/></p>', '2018-04-13 22:34:31');
