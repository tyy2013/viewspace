drop table if exists t_comment_log;

drop table if exists t_user;

drop table if exists t_view_point;

drop table if exists t_view_space;

/*==============================================================*/
/* Table: t_comment_log                                         */
/*==============================================================*/
DROP DATABASE IF EXISTS sampledb;
CREATE DATABASE sampledb DEFAULT CHARACTER SET utf8;
USE sampledb;


create table t_comment_log
(
   log_id               int not null auto_increment,
   space_id             int not null comment '�羰��',
   ip               varchar(20) not null comment 'IP',
   comment_type         int not null comment '��������',
   primary key (log_id)
);

/*==============================================================*/
/* Table: t_user                                                */
/*==============================================================*/
create table t_user
(
   user_id              int not null auto_increment comment '�û�Id',
   user_name            varchar(30) not null comment '�û���',
   password             varchar(30) not null default '' comment '����',
   last_login_time      date not null comment '����¼ʱ��',
   last_login_ip        varchar(20) not null default '0' comment '����¼IP',
   primary key (user_id),
   key AK_AK_USER_USER_NAME (user_name)
)
type = InnoDB;

INSERT INTO t_user (user_name, password, last_login_time, last_login_ip) 
VALUES ('tom', '1234', '2007-12-23', '127.0.0.1');
CREATE TABLE  t_login_log (
  login_log_id int(11) NOT NULL auto_increment,
  user_id int(11) default NULL,
  ip varchar(23) default NULL,
  login_datetime datetime default NULL,
  PRIMARY KEY  (login_log_id)
) ENGINE=InnoDB;
/*==============================================================*/
/* Table: t_view_point                                          */
/*==============================================================*/
create table t_view_point
(
   point_id             int not null auto_increment,
   space_id             int not null comment '����ID',
   point_name           varchar(100) comment '������',
   ticket_price         float(7,2) comment 'Ʊ��',
   img_file             varchar(100) comment 'ͼƬ�ļ�',
   description          text comment '��������',
   primary key (point_id)
);

/*==============================================================*/
/* Table: t_view_space                                          */
/*==============================================================*/
create table t_view_space
(
   space_id             int not null auto_increment,
   space_name           varchar(50) not null comment '��������',
   description          text comment '����',
   website              varchar(100) comment '��Ӧ����վ',
   address              varchar(150) comment '���ڵ�ַ',
   user_id              int not null comment '������',
   want_num             int comment '��ȥ������',
   been_num             int comment 'ȥ��������',
   notwant_num          int comment '����ȥ������',
   primary key (space_id)
);

