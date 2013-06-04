# MySQL-Front 5.1  (Build 2.7)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;


# Host: localhost    Database: sampledb
# ------------------------------------------------------
# Server version 5.5.17

DROP DATABASE IF EXISTS `sampledb`;
CREATE DATABASE `sampledb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sampledb`;

#
# Source for table t_comment_log
#

DROP TABLE IF EXISTS `t_comment_log`;
CREATE TABLE `t_comment_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `space_id` int(11) NOT NULL COMMENT '风景区',
  `ip` varchar(20) NOT NULL COMMENT 'IP',
  `comment_type` int(11) NOT NULL COMMENT '评论类型',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table t_comment_log
#


#
# Source for table t_login_log
#

DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE `t_login_log` (
  `login_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(23) DEFAULT NULL,
  `login_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`login_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

#
# Dumping data for table t_login_log
#

INSERT INTO `t_login_log` VALUES (1,1,'0.0.0.0','2013-04-18 19:44:15');
INSERT INTO `t_login_log` VALUES (2,1,'0.0.0.0','2013-04-18 19:46:57');
INSERT INTO `t_login_log` VALUES (3,1,'0.0.0.0','2013-05-21 16:25:20');
INSERT INTO `t_login_log` VALUES (4,1,'0.0.0.0','2013-05-21 16:29:40');
INSERT INTO `t_login_log` VALUES (5,1,'0.0.0.0','2013-05-21 16:39:48');
INSERT INTO `t_login_log` VALUES (6,1,'0.0.0.0','2013-05-21 16:57:31');
INSERT INTO `t_login_log` VALUES (7,1,'0.0.0.0','2013-05-21 22:17:31');
INSERT INTO `t_login_log` VALUES (8,1,'0.0.0.0','2013-05-21 22:27:37');
INSERT INTO `t_login_log` VALUES (9,1,'0.0.0.0','2013-05-21 22:53:31');
INSERT INTO `t_login_log` VALUES (10,1,'0.0.0.0','2013-05-21 23:38:04');
INSERT INTO `t_login_log` VALUES (11,1,'0.0.0.0','2013-05-21 23:44:02');
INSERT INTO `t_login_log` VALUES (12,1,'0.0.0.0','2013-05-22 09:00:57');
INSERT INTO `t_login_log` VALUES (13,1,'0.0.0.0','2013-05-22 09:24:55');
INSERT INTO `t_login_log` VALUES (14,1,'0.0.0.0','2013-05-22 09:32:18');
INSERT INTO `t_login_log` VALUES (15,1,'0.0.0.0','2013-05-22 10:50:38');
INSERT INTO `t_login_log` VALUES (16,1,'0.0.0.0','2013-05-22 11:01:43');
INSERT INTO `t_login_log` VALUES (17,1,'10.9.2.89','2013-05-22 11:04:06');
INSERT INTO `t_login_log` VALUES (18,1,'0.0.0.0','2013-05-22 11:07:58');
INSERT INTO `t_login_log` VALUES (19,1,'0.0.0.0','2013-05-22 11:17:26');
INSERT INTO `t_login_log` VALUES (20,1,'10.9.2.89','2013-05-22 12:07:21');
INSERT INTO `t_login_log` VALUES (21,1,'0.0.0.0','2013-05-22 15:02:05');
INSERT INTO `t_login_log` VALUES (22,1,'0.0.0.0','2013-05-22 15:46:18');
INSERT INTO `t_login_log` VALUES (23,1,'0.0.0.0','2013-05-22 17:20:00');
INSERT INTO `t_login_log` VALUES (24,1,'0.0.0.0','2013-05-22 17:21:56');
INSERT INTO `t_login_log` VALUES (25,1,'0.0.0.0','2013-05-23 09:48:15');
INSERT INTO `t_login_log` VALUES (26,1,'0.0.0.0','2013-05-23 10:25:49');
INSERT INTO `t_login_log` VALUES (27,1,'0.0.0.0','2013-05-23 13:55:17');
INSERT INTO `t_login_log` VALUES (28,1,'10.9.2.89','2013-05-23 16:26:59');
INSERT INTO `t_login_log` VALUES (29,1,'10.9.2.89','2013-05-24 10:08:50');
INSERT INTO `t_login_log` VALUES (30,1,'10.9.2.89','2013-05-24 10:38:09');
INSERT INTO `t_login_log` VALUES (31,1,'10.9.2.89','2013-05-24 15:55:08');
INSERT INTO `t_login_log` VALUES (32,1,'10.9.2.89','2013-05-24 16:35:09');
INSERT INTO `t_login_log` VALUES (33,1,'10.9.2.89','2013-05-24 16:36:29');
INSERT INTO `t_login_log` VALUES (34,1,'10.9.2.89','2013-05-24 16:37:37');
INSERT INTO `t_login_log` VALUES (35,1,'10.9.2.89','2013-05-24 16:51:47');

#
# Source for table t_role
#

DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table t_role
#


#
# Source for table t_user
#

DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户Id',
  `user_name` varchar(30) NOT NULL COMMENT '用户名',
  `password` varchar(30) NOT NULL DEFAULT '' COMMENT '密码',
  `last_login_time` date NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  PRIMARY KEY (`user_id`),
  KEY `AK_AK_USER_USER_NAME` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Dumping data for table t_user
#

INSERT INTO `t_user` VALUES (1,'tom','1234','2013-05-24','10.9.2.89');

#
# Source for table t_view_point
#

DROP TABLE IF EXISTS `t_view_point`;
CREATE TABLE `t_view_point` (
  `point_id` int(11) NOT NULL AUTO_INCREMENT,
  `space_id` int(11) NOT NULL COMMENT '景区ID',
  `point_name` varchar(100) DEFAULT NULL COMMENT '景点名',
  `ticket_price` float(7,2) DEFAULT NULL COMMENT '票价',
  `img_file` varchar(100) DEFAULT NULL COMMENT '图片文件',
  `description` text COMMENT '景点描述',
  PRIMARY KEY (`point_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

#
# Dumping data for table t_view_point
#

INSERT INTO `t_view_point` VALUES (5,2,'实验室介绍',1,NULL,'光纤通信技术和网络国家重点实验室（筹）于2008年4月由国家科技部批准筹建，是首批筹建的企业国家重点实验室之一，实验室建设依托单位是武汉邮电科学研究院。\r\n实验室总体定位是整合光通信技术和网络领域行业研究资源，部署战略高技术和前沿技术，吸引、培养和引进国内外优秀人才和创新团队，通过灵活高效的运行机制，解决光纤通信领域发展战略中急需的关键技术和共性技术问题，尤其在代表行业最新、最高的技术领域，如超高速/超大容量/超长距离的光传输技术、智能光网络技术、IP城域网技术、光通信核心芯片/模块技术、光网络自动保护技术、新型光纤材料技术、光纤到户核心技术等方面获得重要进展和突破。\r\n实验室集聚优秀人才，拥有以高层次人才为牵引的、有凝聚力、有活力的创新团队，具有灵活高效的运行机制。同时，实验室面向国际国内全方位开放，加强国际交流，设立开放合作基金，吸引国内外优秀科学家共同开展合作研究。\r\n实验室将以《国家中长期科学和技术发展规划纲要》为指导和依据，以带动国内光通信技术和产业发展、服务国家基础通信设施建设、努力培养高端的光通信技术人才，为我国在光通信技术领域缩短与国际发达国家差距，并最终在若干领域达到或领先于世界最高水平而奋斗。');
INSERT INTO `t_view_point` VALUES (9,2,'实验室研究方向',2,NULL,'本着落实国家中长期发展规划、服务运营商建设需要、超前部署和发展未来必争的战略高技术和前沿技术、加强原创性技术研究、突破光纤通信领域发展战略中急需的关键技术问题等目标，实验室确定如下重点研究方向。\r\n\r\n方向一：应用基础和前沿高技术。重点包括：超高速超大容量超长距离光传输基础；光相干通信系统；新兴光接入网技术；新一代光调制/解调技术、全光时钟恢复技术、全光判决技术、光参量放大技术；光分组交换(OPS)系统、全光交换技术；Radio over Fiber技术；绿色光网络技术等。\r\n\r\n方向二：光网络和光接入技术。重点包括：1）超高速、超大容量、超长距离光纤通信基础研究，如：超高速——研究适合于长途干线超高速光传输的具有高谱效率的10－400Gb/s新型光调制/解调方式、非线性效应的抑制方法和色散管理机制；160×40Gb/s DWDM超长距离光传输系统技术研究，光功率动态均衡技术、色散斜率补偿技术、电色散补偿技术等；2）网络技术及其演进研究，如：研究新一代的城域网多业务传送技术，如100GE光以太网关键技术、快速业务恢复、快速业务提供和拓展等，基于PTN的关键技术和实验系统，以及组网应用研究，研究新网络结构体系——OTN、ROADM的演进及其网络技术研究与应用等；3）光接入技术研究，如：NG-PON体系及其技术研究，WDM－PON技术研究，智能ODN技术，家庭网络环境下多网络业务融合应用示范研究等。\r\n\r\n方向三：光纤光缆技术。重点开展：微结构光纤结构设计及制备工艺的创新与基础研究，高功率光纤激光器用光纤及耦合组件的研究，高效率、低成本单模光纤预制棒制造技术研究，FTTx用新型光纤光缆研究等。\r\n\r\n方向四：光通信集成电路设计技术。重点开展光通信系统用集成电路的研究、光电模块的集成电路套片的研究等。\r\n\r\n方向五：光有源器件和集成技术。重点开展光通信用有源芯片、器件及集成工艺技术研究。\r\n\r\n方向六：光无源器件和集成技术。重点开展光通信用无源芯片、器件及集成工艺技术研究。\r\n\r\n方向七：光以太网技术。重点开展基于电信级光以太网及业务相关的关键技术、互联网和光网络融合的技术等内容的研究。');
INSERT INTO `t_view_point` VALUES (10,2,'实验室研究环境',3,NULL,'实验室总面积3100平米，拥有以太网测试仪、SDH测试仪、高速示波器、误码仪等一大批高、精、尖科研用关键仪器仪表，总价值5800多万元。着力建设光网络系统设备研发平台、宽带接入系统设备实验平台、通信用集成电路开发平台、光纤线缆实验平台、有源光器件和光电集成开发平台、无源光电子器件设计与制造工艺平台、数据通信网研发平台等研究平台。');
INSERT INTO `t_view_point` VALUES (11,3,'学术专家',1,NULL,'实验室主任\r\n\r\n余少华，男，1962年9月出生，博士，教授级高工，博士生导师。武汉邮电科学研究院总工程师，国际电信联盟第15研究组（光和其它传送网络）副主席，第13研究组（下一代网络）第14专题报告人，中国通信标准化协会IP与多媒体委员会副主席。长期从事光通信和IP网络技术的研究，牵头负责并完成了863、下一代互联网、电子发展基金、国家发改委产业化项目、国家重大标准专项十多项国家重要课题，取得了一批科研成果，提出了3项国际标准和2项国际标准增补。作为唯一发明人，有20项发明专利。获得2项国家科技进步二等奖，3项全国信息产业重大技术发明，1项中国通信学会科学技术一等奖，湖北省科学技术突出贡献奖，全国杰出专业技术人才称号获得者，邮电科技进步一等奖，中国青年科技奖，入选新世纪百千万人才工程国家级人选。国内外一级刊物上发表论文15篇，著有《城域网多业务传送理论与技术》一书。热爱祖国，为人正派，学风严谨，先后被授予湖北省劳模、全国五一劳动奖章、全国劳模称号。\r\n\r\n实验室副主任\r\n\r\n杨铸，电信专业教授级高级工程师，中国通信学会会士。长期从事光纤通信技术和网络规划研究。1988年参加国家七五攻关项目，“565Mb/s（五次群）光纤线路终端机”。1991年参加国家重点科技攻关专题项目，565Mb/s光端机、光中继机研制。1993年参加国内第一条五次群工程，上海－无锡565Mb/s光缆通信系统试验段工程。1995年负责组织完成863课题“SDH 10Gb/s时分复用系统总体实现方案研究”。1997年负责组织完成863重大课题“10Gb/s SDH时分复用实验系统”，并承担总体设计和光发送盘研制。1999年负责组织完成863课题“16×10Gb/s SDH波分复用系统”，并承担总体设计。2001年负责主持国家八六三计划 “WDM超长距离光传输技术的研究与实现”课题，总体设计。2004年担任国家“十一五科技规划”通信领域专家组专家。2004年负责完成863课题 “WDM超长距离光传输（ULH）”，“WDM超长距离光传输（ULH）（1）”，“WDM大容量超长距离光传输（ULH）（1）”。2005年负责863课题“新型光器件在光网络中的应用”。2006年负责组织编制YD/T1636-2007《光纤到户（FTTH）体系结构和总体要求》。曾获1994年度邮电部科技进步一等奖、1995年度国家科技进步二等奖、中国通信标准化协会三等奖、中国通信学会2006年度二等奖、武汉市“科技成果转化重大贡献奖”、信产部“信息产业科技创新先进工作者”、国家八五科技攻关先进个人、国家“八六三计划”十五周年先进个人、武汉市劳动模范。\r\n\r\n部分学术带头人\r\n\r\n赵梓森，曾任武汉邮电科学研究院副院长兼总工，现任武汉邮电科学研究院高级技术顾问，工信部科技委委员。早在1973年就开展光纤通信技术研究，并提出正确的技术路线，参与起草了我国\"六五\"、\"七五\"、八五\"、\"九五\"光纤通信攻关计划，为我国光纤通信发展少走弯路起了决定性作用。在70年代末，组织研制生产出我国的首批实用化的光纤光缆和设备。作为技术负责人、总体设计人，完成了我国第一条实用化8Mb/s、34Mb／s和 140Mb／s等6项国家、邮电部光缆通信重点工程，其中有3项工程获国家科进步二等奖。在90年代，领导开发的光纤通信产品大面积推广应用，取得显著经济效益。发表论文数十篇，著书和合著共十本。作为我国光纤通信公认的开拓者之一, 1995中当选为中国工程院院士。因发展中国的光纤通信技术和工业所作贡献，1997年被IEEE国际电气电子工程师协会选为Fellow 会士荣誉称号。发表论文40余篇，著书11本。\r\n\r\n毛谦，武汉邮电科学研究院原副院长兼总工程师 ，国内最早研究光传输线路码型并应用于实用化系统 ，国家“八五”科技攻关项目《565Mb/s现场试验系统（无锡—上海）》的项目负责人和主要完成者，工程开通的消息在国内外报纸上报道后，当时AT&T的总裁在美国国会听政会呼吁：解除对中国的通信设备禁运，“巴统”应该解散。该工程对1994年“巴统”的解体起了重大的作用，国家“十五”科技攻关项目《40Gb/s SDH（STM-256）光纤通信设备与系统》的项目负责人，研制出了世界上第一套具有STM-256的40Gb/s SDH光纤通信设备。 ');
INSERT INTO `t_view_point` VALUES (12,5,'开放课题',1,NULL,'申报注意事项\r\n\r\n2010年第一批开放基金资助项目（截止2010年5月31号）\r\n\r\n2010年第二批开放基金资助项目（截止2010年11月7号）\r\n\r\n2011年第一批开放基金资助项目（截止2011年10月15号）\r\n\r\n2011年第二批开放基金资助项目指南（截止2011年11月20号）\r\n\r\n2012年第一批开放基金资助项目指南（截止2012年12月07号）\r\n\r\n2012年第二批开放基金资助项目指南（截止2012年12月14号）\r\n\r\n2012年第三批开放基金资助项目指南（截止2012年12月21号）\r\n\r\n2013年第一批开放基金资助项目指南（截止2013年03月20号）');
INSERT INTO `t_view_point` VALUES (13,5,'项目介绍',1,'1EAAC371-954B-4226-8C54-9D964F06EA79.JPG','项目介绍');
INSERT INTO `t_view_point` VALUES (14,6,'招聘信息',1,NULL,'光网络_高级/中级_研究师（研发工程师）\r\n职位描述：\r\n1、组织光通信网络（骨干网、城域网、接入网）以及相关技术的研究和探索，进行各种光网络解决方案的研究；\r\n2、组织和负责科研项目的申报工作。\r\n职位要求：\r\n1、通信相关专业（通信工程、信息与通信工程、通信与信息系统、光电信息工程、电子信息工程、信号与信息处理、光学、光学工程、光信息科学与技术、光电子等）硕士或硕士以上学历；\r\n2、精通光传输网络的网络结构和系统关键技术；如ADC/DAC微电子电路设计、光相干通信处理算法、嵌入式系统、光通信FEC等技术的其中一种。\r\n3、具有2年以上相关的技术研究、产品开发的工作经验；\r\n4、具有优秀的团队精神和人际交往能力；\r\n5、具有较好的专业文档资料的撰写能力；\r\n6、具有良好的英语阅读、听、说能力；\r\n7、具有一定的会议演讲能力；\r\n8、具有博士学位者优先。\r\n工作地点：武汉。\r\n招聘人数：5～8。\r\n注：1) 招聘暂不考虑本集团员工；2) 招聘暂不考虑应届生。 ');
INSERT INTO `t_view_point` VALUES (18,9,'xx',0,'华为移动办公解决方案白皮书.pdf','\"\"\"');

#
# Source for table t_view_space
#

DROP TABLE IF EXISTS `t_view_space`;
CREATE TABLE `t_view_space` (
  `space_id` int(11) NOT NULL AUTO_INCREMENT,
  `space_name` varchar(50) NOT NULL COMMENT '景区名称',
  `description` text COMMENT '描述',
  `website` varchar(100) DEFAULT NULL COMMENT '对应的网站',
  `address` varchar(150) DEFAULT NULL COMMENT '所在地址',
  `user_id` int(11) NOT NULL COMMENT '创建者',
  `want_num` int(11) DEFAULT NULL COMMENT '想去的人数',
  `been_num` int(11) DEFAULT NULL COMMENT '去过的人数',
  `notwant_num` int(11) DEFAULT NULL COMMENT '不想去的人数',
  PRIMARY KEY (`space_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

#
# Dumping data for table t_view_space
#

INSERT INTO `t_view_space` VALUES (2,'实验室概况','','','',1,0,0,0);
INSERT INTO `t_view_space` VALUES (3,'人员组成','','','',1,0,0,0);
INSERT INTO `t_view_space` VALUES (5,'研究项目','','','',1,0,0,0);
INSERT INTO `t_view_space` VALUES (6,'人力资源','','','',1,0,0,0);
INSERT INTO `t_view_space` VALUES (9,'test H','t','','fd',1,0,0,0);

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

# set for admin management

insert into t_user(user_id,user_name,password) values(0,'admin','admin');
update t_user set user_id=0 where user_name='admin';
insert into t_view_space(space_id,space_name,user_id) values(0,'内容管理',0);
update t_view_space set space_id=0 where space_name='内容管理' and user_id='0';


