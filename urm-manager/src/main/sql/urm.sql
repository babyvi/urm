/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/2/24 18:22:23                           */
/*==============================================================*/


drop table if exists acct_token;

drop table if exists urm_acct;

drop table if exists urm_acct_rela_oper;

drop table if exists urm_acct_rela_role;

drop table if exists urm_app;

drop table if exists urm_auth_log;

drop table if exists urm_data_right;

drop table if exists urm_function_model;

drop table if exists urm_oper;

drop table if exists urm_oper_log;

drop table if exists urm_right_db_config;

drop table if exists urm_right_value_set_config;

drop table if exists urm_role;

drop table if exists urm_role_rela_oper;

drop table if exists verify_code;

/*==============================================================*/
/* Table: acct_token                                            */
/*==============================================================*/
create table acct_token
(
   token                varchar(32) not null,
   acct_id              bigint,
   acct_name            varchar(64),
   create_time          datetime,
   primary key (token)
);

alter table acct_token comment 'token ��';

/*==============================================================*/
/* Table: urm_acct                                              */
/*==============================================================*/
create table urm_acct
(
   acct_id              bigint not null auto_increment comment '�˺�id',
   acct_name            varchar(64) comment '��½�˺�����',
   phone                varchar(16) comment '�˺ŵ�½ �ֻ�����',
   email                varchar(64) comment '�˺ŵ�½email�������ַ',
   password             varchar(64),
   salt                 varchar(6),
   last_login_ip        varchar(16),
   last_login_time      datetime,
   status               int default 1 comment '1�������� 0 ������',
   create_time          datetime,
   update_time          datetime,
   create_by            bigint,
   update_by            bigint,
   record_status        int default 1 comment '1������������0 ��������ɾ��',
   primary key (acct_id)
)
auto_increment = 100000;

/*==============================================================*/
/* Table: urm_acct_rela_oper                                    */
/*==============================================================*/
create table urm_acct_rela_oper
(
   rela_id              bigint not null auto_increment,
   acct_id              bigint,
   oper_id              bigint,
   create_time          datetime,
   update_time          datetime,
   create_by            bigint,
   update_by            bigint,
   record_status        int default 1 comment '1������������0 ��������ɾ��',
   primary key (rela_id)
)
auto_increment = 100000;

/*==============================================================*/
/* Table: urm_acct_rela_role                                    */
/*==============================================================*/
create table urm_acct_rela_role
(
   rela_id              bigint not null auto_increment,
   acct_id              bigint,
   role_id              bigint,
   create_time          datetime,
   update_time          datetime,
   create_by            bigint,
   update_by            bigint,
   record_status        int default 1 comment '1������������0 ��������ɾ��',
   primary key (rela_id)
)
auto_increment = 100000;

/*==============================================================*/
/* Table: urm_app                                               */
/*==============================================================*/
create table urm_app
(
   app_id               bigint not null auto_increment,
   app_code             varchar(64),
   app_name             varchar(128),
   status               int default 1 comment '1�������� 0 ������',
   create_time          datetime,
   update_time          datetime,
   create_by            bigint,
   update_by            bigint,
   record_status        int default 1 comment '1������������0 ��������ɾ��',
   primary key (app_id)
)
auto_increment = 100000;

/*==============================================================*/
/* Table: urm_auth_log                                          */
/*==============================================================*/
create table urm_auth_log
(
   auth_log_id          bigint not null auto_increment,
   app_code             varchar(32),
   app_name             varchar(64),
   acct_id              bigint,
   acct_name            varchar(64),
   oper_code            varchar(32),
   oper_name            varchar(64),
   success              int comment '1���ɹ�    2��ʧ��',
   data_right           varchar(512),
   auth_cost            bigint comment '�ķ�ʱ��',
   req_ip               varchar(32),
   create_time          datetime,
   primary key (auth_log_id)
)
auto_increment = 100000;

alter table urm_auth_log comment 'urm ��Ȩϵͳ�����ⲿ�ṩ��Ȩ�Ĳ�������־';

/*==============================================================*/
/* Table: urm_data_right                                        */
/*==============================================================*/
create table urm_data_right
(
   right_id             bigint not null auto_increment,
   rela_id              bigint,
   rela_type            int comment '1���û�����������Ӧ������Ȩ��   2����ɫ����������Ӧ������Ȩ��',
   right_type           int,
   db_code              varchar(32),
   db_name              varchar(32),
   value_code           varchar(32),
   value_name           varchar(32),
   value_config         varchar(128),
   data_right_sql       varchar(128),
   status               int default 1 comment '1�������� 0 ������',
   create_time          datetime,
   update_time          datetime,
   create_by            bigint,
   update_by            bigint,
   record_status        int default 1 comment '1������������0 ��������ɾ��',
   primary key (right_id)
)
auto_increment = 100000;

alter table urm_data_right comment '�����µ�����Ȩ��';

/*==============================================================*/
/* Table: urm_function_model                                    */
/*==============================================================*/
create table urm_function_model
(
   function_id          bigint not null auto_increment,
   function_code        varchar(64),
   function_name        varchar(64),
   function_desc        varchar(128),
   app_id               bigint,
   parent_function_id   bigint,
   status               int default 1 comment '1�������� 0 ������',
   create_time          datetime,
   update_time          datetime,
   create_by            bigint,
   update_by            bigint,
   record_status        int default 1 comment '1������������0 ��������ɾ��',
   primary key (function_id)
)
auto_increment = 100000;

/*==============================================================*/
/* Table: urm_oper                                              */
/*==============================================================*/
create table urm_oper
(
   oper_id              bigint not null auto_increment,
   oper_code            varchar(64),
   oper_name            varchar(128),
   function_id          bigint,
   status               int default 1 comment '1�������� 0 ������',
   create_time          datetime,
   update_time          datetime,
   create_by            bigint,
   update_by            bigint,
   record_status        int default 1 comment '1������������0 ��������ɾ��',
   primary key (oper_id)
)
auto_increment = 100000;

/*==============================================================*/
/* Table: urm_oper_log                                          */
/*==============================================================*/
create table urm_oper_log
(
   oper_log_id          bigint not null auto_increment,
   user_id              bigint,
   user_name            varchar(64),
   url                  varchar(128) comment '���ʵ�ַ',
   oper_type            varchar(32) comment '�� menu ��ģ���Ӧ',
   oper_content         varchar(2048) comment '��������',
   oper_cost            bigint comment '�ķ�ʱ��',
   success              int comment '1���ɹ�    2��ʧ��',
   error_msg            varchar(2048) comment 'ʧ�ܵ�ԭ��',
   create_time          datetime,
   primary key (oper_log_id)
)
auto_increment = 100000;

alter table urm_oper_log comment 'urm ϵͳ�Ĳ�����־������Ա��½urm����ӣ��޸ģ�ɾ�� ����Ȩ �Ȳ���
';

/*==============================================================*/
/* Table: urm_right_db_config                                   */
/*==============================================================*/
create table urm_right_db_config
(
   db_code              varchar(32),
   db_name              varchar(32),
   db_intru             varchar(256),
   db_url               varchar(128),
   db_class             varchar(64),
   db_username          varchar(32),
   db_password          varchar(32),
   record_status        int default 1
);

alter table urm_right_db_config comment 'ϵͳ������·����';

/*==============================================================*/
/* Table: urm_right_value_set_config                            */
/*==============================================================*/
create table urm_right_value_set_config
(
   value_code           varchar(32) not null,
   value_name           varchar(32),
   value_intru          varchar(128),
   value_table_name     varchar(32),
   value_table_key      varchar(32),
   value_table_column   varchar(32),
   value_column_type    varchar(32) comment '�ֶ�����',
   value_config         varchar(256),
   db_code              varchar(32),
   record_status        int default 1,
   primary key (value_code)
);

/*==============================================================*/
/* Table: urm_role                                              */
/*==============================================================*/
create table urm_role
(
   role_id              bigint not null auto_increment,
   role_code            varchar(64),
   role_name            varchar(64),
   role_desc            varchar(256),
   status               int default 1 comment '1�������� 0 ������',
   create_time          datetime,
   update_time          datetime,
   create_by            bigint,
   update_by            bigint,
   record_status        int default 1 comment '1������������0 ��������ɾ��',
   primary key (role_id)
)
auto_increment = 100000;

/*==============================================================*/
/* Table: urm_role_rela_oper                                    */
/*==============================================================*/
create table urm_role_rela_oper
(
   rela_id              bigint not null auto_increment,
   role_id              bigint,
   oper_id              bigint,
   create_time          datetime,
   update_time          datetime,
   create_by            bigint,
   update_by            bigint,
   record_status        int default 1 comment '1������������0 ��������ɾ��',
   primary key (rela_id)
)
auto_increment = 100000;

/*==============================================================*/
/* Table: verify_code                                           */
/*==============================================================*/
create table verify_code
(
   verify_key           varchar(64) not null,
   verify_code          varchar(8),
   create_time          datetime,
   primary key (verify_key)
);

alter table verify_code comment '��֤���';

