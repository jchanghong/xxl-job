create database check_job2
  with owner postgres;

create table if not exists camera_gaw_sync
(
  "share_IndexCode" char(50),
  name char(100)
);

alter table camera_gaw_sync owner to postgres;

create table if not exists check_device
(
  uid varchar(64) not null
    constraint check_device_uid
      primary key,
  device_ip varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  replaced_no varchar(255),
  update_time varchar(64),
  device_name varchar(255)
);

alter table check_device owner to postgres;

create table if not exists check_history_info
(
  id serial not null
    constraint check_history_info_pkey
      primary key,
  sis_data text,
  sis_time numeric
);

alter table check_history_info owner to postgres;

create table if not exists check_omoa
(
  index_code varchar(255),
  device_name varchar(255),
  brand varchar(255),
  city_code varchar(255),
  camera_type varchar(250),
  address varchar(255),
  address_type varchar(250),
  network varchar(250),
  orgname varchar(255),
  install_time varchar(250),
  manage_org_name varchar(255),
  manage_org_tel varchar(255),
  record_time varchar(255),
  device_status varchar(250),
  id serial not null
    constraint omoa_id
      primary key,
  lon varchar(50),
  lat varchar(50)
);

alter table check_omoa owner to postgres;

create table if not exists check_org
(
  org_id serial not null
    constraint org_pr_key
      primary key,
  parent_id integer default 1 not null,
  org_name varchar(225),
  dbtype integer default 1,
  dbuser varchar(100),
  dburl varchar(100),
  dbpassword varchar(100),
  jobtime timestamp,
  cms_cascade_id integer,
  login_user varchar(255),
  login_password varchar(255)
);

comment on column check_org.dbtype is '1 oracle  2 postgresql';

alter table check_org owner to postgres;

create table if not exists check_push_public
(
  index_code varchar(50),
  name varchar(255),
  text varchar(255)
);

alter table check_push_public owner to postgres;

create table if not exists check_qrtz_calendars
(
  sched_name varchar(120) not null,
  calendar_name varchar(200) not null,
  calendar bytea not null,
  constraint check_qrtz_calendars_pkey
    primary key (sched_name, calendar_name)
);

alter table check_qrtz_calendars owner to postgres;

create table if not exists check_qrtz_fired_triggers
(
  sched_name varchar(120) not null,
  entry_id varchar(95) not null,
  trigger_name varchar(200) not null,
  trigger_group varchar(200) not null,
  instance_name varchar(200) not null,
  fired_time bigint not null,
  sched_time bigint not null,
  priority integer not null,
  state varchar(16) not null,
  job_name varchar(200),
  job_group varchar(200),
  is_nonconcurrent varchar(16),
  requests_recovery varchar(16),
  constraint check_qrtz_fired_triggers_pkey
    primary key (sched_name, entry_id)
);

alter table check_qrtz_fired_triggers owner to postgres;

create table if not exists check_qrtz_job_details
(
  sched_name varchar(120) not null,
  job_name varchar(200) not null,
  job_group varchar(200) not null,
  description varchar(250),
  job_class_name varchar(250) not null,
  is_durable varchar(16) not null,
  is_nonconcurrent varchar(16) not null,
  is_update_data varchar(16) not null,
  requests_recovery varchar(16) not null,
  job_data bytea,
  constraint check_qrtz_job_details_pkey
    primary key (sched_name, job_name, job_group)
);

alter table check_qrtz_job_details owner to postgres;

create table if not exists check_qrtz_locks
(
  sched_name varchar(120) not null,
  lock_name varchar(40) not null,
  constraint check_qrtz_locks_pkey
    primary key (sched_name, lock_name)
);

alter table check_qrtz_locks owner to postgres;

create table if not exists check_qrtz_paused_trigger_grps
(
  sched_name varchar(120) not null,
  trigger_group varchar(200) not null,
  constraint check_qrtz_paused_trigger_grps_pkey
    primary key (sched_name, trigger_group)
);

alter table check_qrtz_paused_trigger_grps owner to postgres;

create table if not exists check_qrtz_scheduler_state
(
  sched_name varchar(120) not null,
  instance_name varchar(200) not null,
  last_checkin_time bigint not null,
  checkin_interval bigint not null,
  constraint check_qrtz_scheduler_state_pkey
    primary key (sched_name, instance_name)
);

alter table check_qrtz_scheduler_state owner to postgres;

create table if not exists check_qrtz_trigger_group
(
  id serial not null
    constraint check_qrtz_trigger_group_pkey
      primary key,
  app_name varchar(64) not null,
  title varchar(12) not null,
  group_order integer default 0 not null,
  address_type integer default 0 not null,
  address_list varchar(512) default NULL::character varying
);

alter table check_qrtz_trigger_group owner to postgres;

create table if not exists check_qrtz_trigger_info
(
  id serial not null
    constraint check_qrtz_trigger_info_pkey
      primary key,
  job_group integer not null,
  job_cron varchar(128) not null,
  job_desc varchar(255) not null,
  add_time timestamp,
  update_time timestamp,
  author varchar(64) default NULL::character varying,
  alarm_email varchar(255) default NULL::character varying,
  executor_route_strategy varchar(50) default NULL::character varying,
  executor_handler varchar(255) default NULL::character varying,
  executor_param varchar(512) default NULL::character varying,
  executor_block_strategy varchar(50) default NULL::character varying,
  executor_fail_strategy varchar(50) default NULL::character varying,
  glue_type varchar(50) not null,
  glue_source text,
  glue_remark varchar(128) default NULL::character varying,
  glue_updatetime timestamp,
  child_jobid varchar(255) default NULL::character varying
);

alter table check_qrtz_trigger_info owner to postgres;

create table if not exists check_qrtz_trigger_log
(
  id serial not null
    constraint check_qrtz_trigger_log_pkey
      primary key,
  job_group integer not null,
  job_id integer not null,
  glue_type varchar(50) default NULL::character varying,
  executor_address varchar(255) default NULL::character varying,
  executor_handler varchar(255) default NULL::character varying,
  executor_param varchar(512) default NULL::character varying,
  trigger_time timestamp,
  trigger_code integer default 0 not null,
  trigger_msg varchar(2048) default NULL::character varying,
  handle_time timestamp,
  handle_code integer default 0 not null,
  handle_msg varchar(2048) default NULL::character varying
);

alter table check_qrtz_trigger_log owner to postgres;

create table if not exists check_qrtz_trigger_logglue
(
  id serial not null
    constraint check_qrtz_trigger_logglue_pkey
      primary key,
  job_id integer not null,
  glue_type varchar(50) default NULL::character varying,
  glue_source bytea,
  glue_remark varchar(128) not null,
  add_time timestamp,
  update_time timestamp
);

alter table check_qrtz_trigger_logglue owner to postgres;

create table if not exists check_qrtz_trigger_registry
(
  id serial not null
    constraint check_qrtz_trigger_registry_pkey
      primary key,
  registry_group varchar(255) not null,
  registry_key varchar(255) not null,
  registry_value varchar(255) not null,
  update_time timestamp default now() not null
);

alter table check_qrtz_trigger_registry owner to postgres;

create table if not exists check_qrtz_triggers
(
  sched_name varchar(120) not null,
  trigger_name varchar(200) not null,
  trigger_group varchar(200) not null,
  job_name varchar(200) not null,
  job_group varchar(200) not null,
  description varchar(250),
  next_fire_time bigint,
  prev_fire_time bigint,
  priority integer,
  trigger_state varchar(16) not null,
  trigger_type varchar(8) not null,
  start_time bigint not null,
  end_time bigint,
  calendar_name varchar(200),
  misfire_instr smallint,
  job_data bytea,
  constraint check_qrtz_triggers_pkey
    primary key (sched_name, trigger_name, trigger_group),
  constraint check_qrtz_triggers_sched_name_fkey
    foreign key (sched_name, job_name, job_group) references check_qrtz_job_details
);

alter table check_qrtz_triggers owner to postgres;

create table if not exists check_qrtz_blob_triggers
(
  sched_name varchar(120) not null,
  trigger_name varchar(200) not null,
  trigger_group varchar(200) not null,
  blob_data bytea,
  constraint check_qrtz_blob_triggers_pkey
    primary key (sched_name, trigger_name, trigger_group),
  constraint check_qrtz_blob_triggers_sched_name_fkey
    foreign key (sched_name, trigger_name, trigger_group) references check_qrtz_triggers
);

alter table check_qrtz_blob_triggers owner to postgres;

create table if not exists check_qrtz_cron_triggers
(
  sched_name varchar(120) not null,
  trigger_name varchar(200) not null,
  trigger_group varchar(200) not null,
  cron_expression varchar(200) not null,
  time_zone_id varchar(80),
  constraint check_qrtz_cron_triggers_pkey
    primary key (sched_name, trigger_name, trigger_group),
  constraint check_qrtz_cron_triggers_sched_name_fkey
    foreign key (sched_name, trigger_name, trigger_group) references check_qrtz_triggers
);

alter table check_qrtz_cron_triggers owner to postgres;

create table if not exists check_qrtz_simple_triggers
(
  sched_name varchar(120) not null,
  trigger_name varchar(200) not null,
  trigger_group varchar(200) not null,
  repeat_count bigint not null,
  repeat_interval bigint not null,
  times_triggered bigint not null,
  constraint check_qrtz_simple_triggers_pkey
    primary key (sched_name, trigger_name, trigger_group),
  constraint check_qrtz_simple_triggers_sched_name_fkey
    foreign key (sched_name, trigger_name, trigger_group) references check_qrtz_triggers
);

alter table check_qrtz_simple_triggers owner to postgres;

create table if not exists check_qrtz_simprop_triggers
(
  sched_name varchar(120) not null,
  trigger_name varchar(200) not null,
  trigger_group varchar(200) not null,
  str_prop_1 varchar(512),
  str_prop_2 varchar(512),
  str_prop_3 varchar(512),
  int_prop_1 integer,
  int_prop_2 integer,
  long_prop_1 bigint,
  long_prop_2 bigint,
  dec_prop_1 numeric(13,4),
  dec_prop_2 numeric(13,4),
  bool_prop_1 varchar(16),
  bool_prop_2 varchar(16),
  constraint check_qrtz_simprop_triggers_pkey
    primary key (sched_name, trigger_name, trigger_group),
  constraint check_qrtz_simprop_triggers_sched_name_fkey
    foreign key (sched_name, trigger_name, trigger_group) references check_qrtz_triggers
);

alter table check_qrtz_simprop_triggers owner to postgres;

create table if not exists check_video_quality
(
  index_code varchar(255) not null
    constraint check_video_quality_id
      primary key,
  status integer,
  image_url varchar(2048),
  quality integer,
  update_time varchar(255)
);

alter table check_video_quality owner to postgres;

create table if not exists t_camera_info_tmp_1
(
  id serial not null
    constraint t_camera_info_tmp_1_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(30,12),
  lat numeric(30,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(255),
  osd_check_time varchar(255)
);

alter table t_camera_info_tmp_1 owner to postgres;

create table if not exists t_camera_info_tmp_10
(
  id serial not null
    constraint t_camera_info_tmp_10_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(264),
  osd_check_time varchar(264)
);

alter table t_camera_info_tmp_10 owner to postgres;

create table if not exists t_camera_info_tmp_11
(
  id serial not null
    constraint t_camera_info_tmp_11_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(265),
  osd_check_time varchar(265)
);

alter table t_camera_info_tmp_11 owner to postgres;

create table if not exists t_camera_info_tmp_12
(
  id serial not null
    constraint t_camera_info_tmp_12_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(266),
  osd_check_time varchar(266)
);

alter table t_camera_info_tmp_12 owner to postgres;

create table if not exists t_camera_info_tmp_13
(
  id serial not null
    constraint t_camera_info_tmp_13_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(267),
  osd_check_time varchar(267)
);

alter table t_camera_info_tmp_13 owner to postgres;

create table if not exists t_camera_info_tmp_14
(
  id serial not null
    constraint t_camera_info_tmp_14_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(268),
  osd_check_time varchar(268)
);

alter table t_camera_info_tmp_14 owner to postgres;

create table if not exists t_camera_info_tmp_15
(
  id serial not null
    constraint t_camera_info_tmp_15_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(269),
  osd_check_time varchar(269)
);

alter table t_camera_info_tmp_15 owner to postgres;

create table if not exists t_camera_info_tmp_16
(
  id serial not null
    constraint t_camera_info_tmp_16_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(270),
  osd_check_time varchar(270)
);

alter table t_camera_info_tmp_16 owner to postgres;

create table if not exists t_camera_info_tmp_17
(
  id serial not null
    constraint t_camera_info_tmp_17_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(271),
  osd_check_time varchar(271)
);

alter table t_camera_info_tmp_17 owner to postgres;

create table if not exists t_camera_info_tmp_18
(
  id serial not null
    constraint t_camera_info_tmp_18_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(272),
  osd_check_time varchar(272)
);

alter table t_camera_info_tmp_18 owner to postgres;

create table if not exists t_camera_info_tmp_19
(
  id serial not null
    constraint t_camera_info_tmp_19_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(273),
  osd_check_time varchar(273)
);

alter table t_camera_info_tmp_19 owner to postgres;

create table if not exists t_camera_info_tmp_20
(
  id serial not null
    constraint t_camera_info_tmp_20_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(274),
  osd_check_time varchar(274)
);

alter table t_camera_info_tmp_20 owner to postgres;

create table if not exists t_camera_info_tmp_21
(
  id serial not null
    constraint t_camera_info_tmp_21_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(275),
  osd_check_time varchar(275)
);

alter table t_camera_info_tmp_21 owner to postgres;

create table if not exists t_camera_info_tmp_22
(
  id serial not null
    constraint t_camera_info_tmp_22_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(276),
  osd_check_time varchar(276)
);

alter table t_camera_info_tmp_22 owner to postgres;

create table if not exists t_camera_info_tmp_23
(
  id serial not null
    constraint t_camera_info_tmp_23_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(277),
  osd_check_time varchar(277)
);

alter table t_camera_info_tmp_23 owner to postgres;

create table if not exists t_camera_info_tmp_24
(
  id serial not null
    constraint t_camera_info_tmp_24_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(278),
  osd_check_time varchar(278)
);

alter table t_camera_info_tmp_24 owner to postgres;

create table if not exists t_camera_info_tmp_25
(
  id serial not null
    constraint t_camera_info_tmp_25_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(279),
  osd_check_time varchar(279)
);

alter table t_camera_info_tmp_25 owner to postgres;

create table if not exists t_camera_info_tmp_26
(
  id serial not null
    constraint t_camera_info_tmp_26_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(280),
  osd_check_time varchar(280)
);

alter table t_camera_info_tmp_26 owner to postgres;

create table if not exists t_camera_info_tmp_27
(
  id serial not null
    constraint t_camera_info_tmp_27_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(281),
  osd_check_time varchar(281)
);

alter table t_camera_info_tmp_27 owner to postgres;

create table if not exists t_camera_info_tmp_28
(
  id serial not null
    constraint t_camera_info_tmp_28_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(282),
  osd_check_time varchar(282)
);

alter table t_camera_info_tmp_28 owner to postgres;

create table if not exists t_camera_info_tmp_29
(
  id serial not null
    constraint t_camera_info_tmp_29_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(283),
  osd_check_time varchar(283)
);

alter table t_camera_info_tmp_29 owner to postgres;

create table if not exists t_camera_info_tmp_30
(
  id serial not null
    constraint t_camera_info_tmp_30_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(284),
  osd_check_time varchar(284)
);

alter table t_camera_info_tmp_30 owner to postgres;

create table if not exists t_camera_info_tmp_31
(
  id serial not null
    constraint t_camera_info_tmp_31_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(285),
  osd_check_time varchar(285)
);

alter table t_camera_info_tmp_31 owner to postgres;

create table if not exists t_camera_info_tmp_32
(
  id serial not null
    constraint t_camera_info_tmp_32_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(286),
  osd_check_time varchar(286)
);

alter table t_camera_info_tmp_32 owner to postgres;

create table if not exists t_camera_info_tmp_33
(
  id serial not null
    constraint t_camera_info_tmp_33_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(287),
  osd_check_time varchar(287)
);

alter table t_camera_info_tmp_33 owner to postgres;

create table if not exists t_camera_info_tmp_34
(
  id serial not null
    constraint t_camera_info_tmp_34_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(288),
  osd_check_time varchar(288)
);

alter table t_camera_info_tmp_34 owner to postgres;

create table if not exists t_camera_info_tmp_35
(
  id serial not null
    constraint t_camera_info_tmp_35_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(289),
  osd_check_time varchar(289)
);

alter table t_camera_info_tmp_35 owner to postgres;

create table if not exists t_camera_info_tmp_36
(
  id serial not null
    constraint t_camera_info_tmp_36_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(290),
  osd_check_time varchar(290)
);

alter table t_camera_info_tmp_36 owner to postgres;

create table if not exists t_camera_info_tmp_37
(
  id serial not null
    constraint t_camera_info_tmp_37_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(291),
  osd_check_time varchar(291)
);

alter table t_camera_info_tmp_37 owner to postgres;

create table if not exists t_camera_info_tmp_38
(
  id serial not null
    constraint t_camera_info_tmp_38_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(292),
  osd_check_time varchar(292)
);

alter table t_camera_info_tmp_38 owner to postgres;

create table if not exists t_camera_info_tmp_39
(
  id serial not null
    constraint t_camera_info_tmp_39_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(293),
  osd_check_time varchar(293)
);

alter table t_camera_info_tmp_39 owner to postgres;

create table if not exists t_camera_info_tmp_40
(
  id serial not null
    constraint t_camera_info_tmp_40_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(294),
  osd_check_time varchar(294)
);

alter table t_camera_info_tmp_40 owner to postgres;

create table if not exists t_camera_info_tmp_41
(
  id serial not null
    constraint t_camera_info_tmp_41_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(295),
  osd_check_time varchar(295)
);

alter table t_camera_info_tmp_41 owner to postgres;

create table if not exists t_camera_info_tmp_42
(
  id serial not null
    constraint t_camera_info_tmp_42_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(296),
  osd_check_time varchar(296)
);

alter table t_camera_info_tmp_42 owner to postgres;

create table if not exists t_camera_info_tmp_43
(
  id serial not null
    constraint t_camera_info_tmp_43_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(297),
  osd_check_time varchar(297)
);

alter table t_camera_info_tmp_43 owner to postgres;

create table if not exists t_camera_info_tmp_44
(
  id serial not null
    constraint t_camera_info_tmp_44_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(298),
  osd_check_time varchar(298)
);

alter table t_camera_info_tmp_44 owner to postgres;

create table if not exists t_camera_info_tmp_45
(
  id serial not null
    constraint t_camera_info_tmp_45_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(299),
  osd_check_time varchar(299)
);

alter table t_camera_info_tmp_45 owner to postgres;

create table if not exists t_camera_info_tmp_6
(
  id serial not null
    constraint t_camera_info_tmp_6_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(260),
  osd_check_time varchar(260)
);

alter table t_camera_info_tmp_6 owner to postgres;

create table if not exists t_camera_info_tmp_7
(
  id serial not null
    constraint t_camera_info_tmp_7_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(261),
  osd_check_time varchar(261)
);

alter table t_camera_info_tmp_7 owner to postgres;

create table if not exists t_camera_info_tmp_8
(
  id serial not null
    constraint t_camera_info_tmp_8_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(262),
  osd_check_time varchar(262)
);

alter table t_camera_info_tmp_8 owner to postgres;

create table if not exists t_camera_info_tmp_9
(
  id serial not null
    constraint t_camera_info_tmp_9_pkey
      primary key,
  index_code varchar(255) not null,
  device_name varchar(255),
  device_no varchar(255),
  cms_cascade_id integer,
  cms_cascade_info integer,
  network_addr varchar(255),
  user_name varchar(255),
  pwd varchar(255),
  time_offset_seconds integer,
  is_osd_right integer,
  is_gbt_right integer,
  is_location integer,
  lon numeric(16,12),
  lat numeric(16,12),
  capture varchar(255),
  belong varchar(255),
  osd_error_info varchar(255),
  omoa integer,
  status integer,
  quality integer,
  image_url varchar(2048),
  status_check_time varchar(263),
  osd_check_time varchar(263)
);

alter table t_camera_info_tmp_9 owner to postgres;

create table if not exists xueliang_statistics
(
  uid char(64) not null
    constraint xueliang_uid
      primary key,
  org_id integer,
  data text,
  status integer,
  create_time varchar(64),
  org_name varchar(255),
  update_time varchar(64)
);

alter table xueliang_statistics owner to postgres;

create table if not exists xxl_job_qrtz_job_details
(
  sched_name varchar(120) not null,
  job_name varchar(200) not null,
  job_group varchar(200) not null,
  description varchar(250),
  job_class_name varchar(250) not null,
  is_durable varchar(1) not null,
  is_nonconcurrent varchar(1) not null,
  is_update_data varchar(1) not null,
  requests_recovery varchar(1) not null,
  job_data bytea,
  constraint xxl_job_qrtz_job_details_pkey
    primary key (sched_name, job_name, job_group)
);

alter table xxl_job_qrtz_job_details owner to postgres;

create table if not exists xxl_job_qrtz_triggers
(
  sched_name varchar(120) not null,
  trigger_name varchar(200) not null,
  trigger_group varchar(200) not null,
  job_name varchar(200) not null,
  job_group varchar(200) not null,
  description varchar(250),
  next_fire_time bigint,
  prev_fire_time bigint,
  priority integer,
  trigger_state varchar(16) not null,
  trigger_type varchar(8) not null,
  start_time bigint not null,
  end_time bigint,
  calendar_name varchar(200),
  misfire_instr integer,
  job_data bytea,
  constraint xxl_job_qrtz_triggers_pkey
    primary key (sched_name, trigger_name, trigger_group),
  constraint xxl_job_qrtz_triggers_sched_name_fkey
    foreign key (sched_name, job_name, job_group) references xxl_job_qrtz_job_details
);

alter table xxl_job_qrtz_triggers owner to postgres;

create table if not exists xxl_job_qrtz_simple_triggers
(
  sched_name varchar(120) not null,
  trigger_name varchar(200) not null,
  trigger_group varchar(200) not null,
  repeat_count bigint not null,
  repeat_interval bigint not null,
  times_triggered bigint not null,
  constraint xxl_job_qrtz_simple_triggers_pkey
    primary key (sched_name, trigger_name, trigger_group),
  constraint xxl_job_qrtz_simple_triggers_sched_name_fkey
    foreign key (sched_name, trigger_name, trigger_group) references xxl_job_qrtz_triggers
);

alter table xxl_job_qrtz_simple_triggers owner to postgres;

create table if not exists xxl_job_qrtz_cron_triggers
(
  sched_name varchar(120) not null,
  trigger_name varchar(200) not null,
  trigger_group varchar(200) not null,
  cron_expression varchar(200) not null,
  time_zone_id varchar(80),
  constraint xxl_job_qrtz_cron_triggers_pkey
    primary key (sched_name, trigger_name, trigger_group),
  constraint xxl_job_qrtz_cron_triggers_sched_name_fkey
    foreign key (sched_name, trigger_name, trigger_group) references xxl_job_qrtz_triggers
);

alter table xxl_job_qrtz_cron_triggers owner to postgres;

create table if not exists xxl_job_qrtz_simprop_triggers
(
  sched_name varchar(120) not null,
  trigger_name varchar(200) not null,
  trigger_group varchar(200) not null,
  str_prop_1 varchar(512),
  str_prop_2 varchar(512),
  str_prop_3 varchar(512),
  int_prop_1 integer,
  int_prop_2 integer,
  long_prop_1 bigint,
  long_prop_2 bigint,
  dec_prop_1 numeric(13,4),
  dec_prop_2 numeric(13,4),
  bool_prop_1 varchar(1),
  bool_prop_2 varchar(1),
  constraint xxl_job_qrtz_simprop_triggers_pkey
    primary key (sched_name, trigger_name, trigger_group),
  constraint xxl_job_qrtz_simprop_triggers_sched_name_fkey
    foreign key (sched_name, trigger_name, trigger_group) references xxl_job_qrtz_triggers
);

alter table xxl_job_qrtz_simprop_triggers owner to postgres;

create table if not exists xxl_job_qrtz_bytea_triggers
(
  sched_name varchar(120) not null,
  trigger_name varchar(200) not null,
  trigger_group varchar(200) not null,
  bytea_data bytea,
  constraint xxl_job_qrtz_bytea_triggers_pkey
    primary key (sched_name, trigger_name, trigger_group),
  constraint xxl_job_qrtz_bytea_triggers_sched_name_fkey
    foreign key (sched_name, trigger_name, trigger_group) references xxl_job_qrtz_triggers
);

alter table xxl_job_qrtz_bytea_triggers owner to postgres;

create table if not exists xxl_job_qrtz_calendars
(
  sched_name varchar(120) not null,
  calendar_name varchar(200) not null,
  calendar bytea not null,
  constraint xxl_job_qrtz_calendars_pkey
    primary key (sched_name, calendar_name)
);

alter table xxl_job_qrtz_calendars owner to postgres;

create table if not exists xxl_job_qrtz_paused_trigger_grps
(
  sched_name varchar(120) not null,
  trigger_group varchar(200) not null,
  constraint xxl_job_qrtz_paused_trigger_grps_pkey
    primary key (sched_name, trigger_group)
);

alter table xxl_job_qrtz_paused_trigger_grps owner to postgres;

create table if not exists xxl_job_qrtz_fired_triggers
(
  sched_name varchar(120) not null,
  entry_id varchar(95) not null,
  trigger_name varchar(200) not null,
  trigger_group varchar(200) not null,
  instance_name varchar(200) not null,
  fired_time bigint not null,
  sched_time bigint not null,
  priority integer not null,
  state varchar(16) not null,
  job_name varchar(200),
  job_group varchar(200),
  is_nonconcurrent varchar(1),
  requests_recovery varchar(1),
  constraint xxl_job_qrtz_fired_triggers_pkey
    primary key (sched_name, entry_id)
);

alter table xxl_job_qrtz_fired_triggers owner to postgres;

create table if not exists xxl_job_qrtz_scheduler_state
(
  sched_name varchar(120) not null,
  instance_name varchar(200) not null,
  last_checkin_time bigint not null,
  checkin_interval bigint not null,
  constraint xxl_job_qrtz_scheduler_state_pkey
    primary key (sched_name, instance_name)
);

alter table xxl_job_qrtz_scheduler_state owner to postgres;

create table if not exists xxl_job_qrtz_locks
(
  sched_name varchar(120) not null,
  lock_name varchar(40) not null,
  constraint xxl_job_qrtz_locks_pkey
    primary key (sched_name, lock_name)
);

alter table xxl_job_qrtz_locks owner to postgres;

create table if not exists table_8900statis
(
  id bigserial not null,
  name varchar(50) not null,
  xunluo bigint not null,
  yuntai bigint not null,
  yulan bigint not null,
  huifang bigint not null,
  login bigint not null,
  day date not null
);

alter table table_8900statis owner to postgres;

create table if not exists chongqing_check
(
  id bigserial not null,
  org_omoa double precision,
  org_osd double precision,
  org_iscascade_all double precision,
  org_all bigint,
  org_quality double precision,
  org_time double precision,
  org_is_yingzhi_all bigint,
  org_gbt double precision,
  org_online double precision,
  org_name varchar(50),
  org_location double precision,
  datetime date
);

alter table chongqing_check owner to postgres;

create table if not exists chongqing_check_index_right
(
  id bigserial not null,
  type varchar(50),
  org_omoa double precision,
  org_osd double precision,
  org_all bigint,
  org_quality double precision,
  org_time double precision,
  org_gbt double precision,
  org_online double precision,
  org_location double precision,
  org_all_percent double precision
);

alter table chongqing_check_index_right owner to postgres;

