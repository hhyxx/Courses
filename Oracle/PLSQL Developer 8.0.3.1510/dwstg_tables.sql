------------------------------------------
-- Export file for user DWSTG           --
-- Created by jj on 2013/8/23, 17:32:00 --
------------------------------------------

spool dwstg_tables.log

prompt
prompt Creating table AFWK_LOOKUP_TYPES
prompt ================================
prompt
create table DWSTG.AFWK_LOOKUP_TYPES
(
  lookup_id             NUMBER not null,
  lookup_type           VARCHAR2(30) not null,
  module_id             NUMBER not null,
  system_defined        VARCHAR2(30),
  allow_user_defined    VARCHAR2(30),
  object_version_number NUMBER,
  created_by            NUMBER not null,
  creation_date         DATE not null,
  last_updated_by       NUMBER not null,
  last_update_date      DATE not null,
  last_update_login     NUMBER
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.AFWK_LOOKUP_TYPES
  add constraint AFWK_LOOKUPS_PK primary key (LOOKUP_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.AFWK_LOOKUP_TYPES
  add constraint AFWK_LOOKUPS_UK1 unique (LOOKUP_TYPE)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table AFWK_LOOKUP_VALUES
prompt =================================
prompt
create table DWSTG.AFWK_LOOKUP_VALUES
(
  lookup_value_id       NUMBER not null,
  lookup_id             NUMBER not null,
  lookup_code           VARCHAR2(100) not null,
  display_sequence      NUMBER,
  tag                   VARCHAR2(240),
  system_defined        VARCHAR2(30),
  enabled_flag          VARCHAR2(30),
  start_date_active     DATE,
  end_date_active       DATE,
  object_version_number NUMBER,
  created_by            NUMBER not null,
  creation_date         DATE not null,
  last_updated_by       NUMBER not null,
  last_update_date      DATE not null,
  last_update_login     NUMBER
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.AFWK_LOOKUP_VALUES
  add constraint AFWK_LOOKUP_VALUES_PK primary key (LOOKUP_VALUE_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.AFWK_LOOKUP_VALUES
  add constraint AFWK_LOOKUP_VALUES_UK1 unique (LOOKUP_ID, LOOKUP_CODE)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.AFWK_LOOKUP_VALUES
  add constraint AFWK_LOOKUP_VALUES_FK1 foreign key (LOOKUP_ID)
  references DWSTG.AFWK_LOOKUP_TYPES (LOOKUP_ID);

prompt
prompt Creating table AFWK_LOOKUP_VALUES_TL
prompt ====================================
prompt
create table DWSTG.AFWK_LOOKUP_VALUES_TL
(
  lookup_value_id       NUMBER not null,
  meaning               VARCHAR2(100) not null,
  description           VARCHAR2(240),
  language              VARCHAR2(10) not null,
  source_lang           VARCHAR2(10),
  object_version_number NUMBER,
  created_by            NUMBER not null,
  creation_date         DATE not null,
  last_updated_by       NUMBER not null,
  last_update_date      DATE not null,
  last_update_login     NUMBER
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.AFWK_LOOKUP_VALUES_TL
  add constraint AFWK_LOOKUP_VALUES_TL_PK primary key (LOOKUP_VALUE_ID, LANGUAGE)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.AFWK_LOOKUP_VALUES_TL
  add constraint AFWK_LOOKUP_VALUES_TL_FK1 foreign key (LOOKUP_VALUE_ID)
  references DWSTG.AFWK_LOOKUP_VALUES (LOOKUP_VALUE_ID);

prompt
prompt Creating table BSM_BASE_BUDGET
prompt ==============================
prompt
create table DWSTG.BSM_BASE_BUDGET
(
  sale_budget_id     NUMBER not null,
  region_name        VARCHAR2(150) not null,
  region_id          NUMBER not null,
  zone_name          VARCHAR2(150) not null,
  zone_id            NUMBER not null,
  branch_name        VARCHAR2(150),
  branch_id          NUMBER,
  center_series_name VARCHAR2(150) not null,
  center_series_id   NUMBER not null,
  source_code        VARCHAR2(10),
  year               DATE,
  jan_quantity       NUMBER,
  feb_quantity       NUMBER,
  mar_quantity       NUMBER,
  apr_quantity       NUMBER,
  may_quantity       NUMBER,
  jun_quantity       NUMBER,
  jul_quantity       NUMBER,
  aug_quantity       NUMBER,
  sep_quantity       NUMBER,
  oct_quantity       NUMBER,
  nov_quantity       NUMBER,
  dec_quantity       NUMBER,
  row_version_number NUMBER default 1 not null,
  creation_date      DATE default sysdate not null,
  created_by         NUMBER default -1 not null,
  last_updated_by    NUMBER default -1 not null,
  last_update_date   DATE default sysdate not null,
  last_update_login  NUMBER,
  attribute_category VARCHAR2(30),
  attribute1         VARCHAR2(240),
  attribute2         VARCHAR2(240),
  attribute3         VARCHAR2(240),
  attribute4         VARCHAR2(240),
  attribute5         VARCHAR2(240),
  attribute6         VARCHAR2(240),
  attribute7         VARCHAR2(240),
  attribute8         VARCHAR2(240),
  attribute9         VARCHAR2(240),
  attribute10        VARCHAR2(240),
  attribute11        VARCHAR2(240),
  attribute12        VARCHAR2(240),
  attribute13        VARCHAR2(240),
  attribute14        VARCHAR2(240),
  attribute15        VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BSM_CENTER_BATTLE_BUDGET
prompt =======================================
prompt
create table DWSTG.BSM_CENTER_BATTLE_BUDGET
(
  sale_budget_id     NUMBER not null,
  region_name        VARCHAR2(150) not null,
  region_id          NUMBER not null,
  zone_name          VARCHAR2(150) not null,
  zone_id            NUMBER not null,
  branch_name        VARCHAR2(150),
  branch_id          NUMBER,
  center_series_name VARCHAR2(150) not null,
  center_series_id   NUMBER not null,
  source_code        VARCHAR2(10),
  year               DATE,
  jan_quantity       NUMBER,
  feb_quantity       NUMBER,
  mar_quantity       NUMBER,
  apr_quantity       NUMBER,
  may_quantity       NUMBER,
  jun_quantity       NUMBER,
  jul_quantity       NUMBER,
  aug_quantity       NUMBER,
  sep_quantity       NUMBER,
  oct_quantity       NUMBER,
  nov_quantity       NUMBER,
  dec_quantity       NUMBER,
  row_version_number NUMBER default 1 not null,
  creation_date      DATE default sysdate not null,
  created_by         NUMBER default -1 not null,
  last_updated_by    NUMBER default -1 not null,
  last_update_date   DATE default sysdate not null,
  last_update_login  NUMBER,
  attribute_category VARCHAR2(30),
  attribute1         VARCHAR2(240),
  attribute2         VARCHAR2(240),
  attribute3         VARCHAR2(240),
  attribute4         VARCHAR2(240),
  attribute5         VARCHAR2(240),
  attribute6         VARCHAR2(240),
  attribute7         VARCHAR2(240),
  attribute8         VARCHAR2(240),
  attribute9         VARCHAR2(240),
  attribute10        VARCHAR2(240),
  attribute11        VARCHAR2(240),
  attribute12        VARCHAR2(240),
  attribute13        VARCHAR2(240),
  attribute14        VARCHAR2(240),
  attribute15        VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.BSM_CENTER_BATTLE_BUDGET
  add constraint BSM_CENTER_BATTLE_BUDGET_PK primary key (SALE_BUDGET_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BSM_CUSTOMER_MAPPING
prompt ===================================
prompt
create table DWSTG.BSM_CUSTOMER_MAPPING
(
  customer_mapping_id NUMBER not null,
  primary_customer_id NUMBER not null,
  customer_id         NUMBER not null,
  customer_number     VARCHAR2(30) not null,
  customer_name       VARCHAR2(360) not null,
  row_version_number  NUMBER default 1 not null,
  creation_date       DATE default sysdate not null,
  created_by          NUMBER default -1 not null,
  last_updated_by     NUMBER default -1 not null,
  last_update_date    DATE default sysdate not null,
  last_update_login   NUMBER,
  attribute_category  VARCHAR2(30),
  attribute1          VARCHAR2(240),
  attribute2          VARCHAR2(240),
  attribute3          VARCHAR2(240),
  attribute4          VARCHAR2(240),
  attribute5          VARCHAR2(240),
  attribute6          VARCHAR2(240),
  attribute7          VARCHAR2(240),
  attribute8          VARCHAR2(240),
  attribute9          VARCHAR2(240),
  attribute10         VARCHAR2(240),
  attribute11         VARCHAR2(240),
  attribute12         VARCHAR2(240),
  attribute13         VARCHAR2(240),
  attribute14         VARCHAR2(240),
  attribute15         VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DWSTG.BSM_CUSTOMER_MAPPING
  is '一户多名匹配关系';
comment on column DWSTG.BSM_CUSTOMER_MAPPING.customer_mapping_id
  is '表ID，主键，供其他表做外键';
comment on column DWSTG.BSM_CUSTOMER_MAPPING.primary_customer_id
  is '大客户ID';
comment on column DWSTG.BSM_CUSTOMER_MAPPING.customer_id
  is '客户ID';
comment on column DWSTG.BSM_CUSTOMER_MAPPING.customer_number
  is '客户编码';
comment on column DWSTG.BSM_CUSTOMER_MAPPING.customer_name
  is '客户名称';
comment on column DWSTG.BSM_CUSTOMER_MAPPING.row_version_number
  is '行版本号，用来处理锁';
alter table DWSTG.BSM_CUSTOMER_MAPPING
  add constraint BSM_CUSTOMER_MAPPING_PK primary key (CUSTOMER_MAPPING_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BSM_DISTRIBUTOR_BUDGET
prompt =====================================
prompt
create table DWSTG.BSM_DISTRIBUTOR_BUDGET
(
  distributor_budget_id NUMBER not null,
  region_name           VARCHAR2(150) not null,
  region_id             NUMBER not null,
  distributor_name      VARCHAR2(150) not null,
  distributor_id        NUMBER not null,
  center_series_name    VARCHAR2(150) not null,
  center_series_id      NUMBER not null,
  year                  DATE,
  jan_quantity          NUMBER,
  feb_quantity          NUMBER,
  mar_quantity          NUMBER,
  apr_quantity          NUMBER,
  may_quantity          NUMBER,
  jun_quantity          NUMBER,
  jul_quantity          NUMBER,
  aug_quantity          NUMBER,
  sep_quantity          NUMBER,
  oct_quantity          NUMBER,
  nov_quantity          NUMBER,
  dec_quantity          NUMBER,
  row_version_number    NUMBER default 1 not null,
  creation_date         DATE default sysdate not null,
  created_by            NUMBER default -1 not null,
  last_updated_by       NUMBER default -1 not null,
  last_update_date      DATE default sysdate not null,
  last_update_login     NUMBER,
  attribute_category    VARCHAR2(30),
  attribute1            VARCHAR2(240),
  attribute2            VARCHAR2(240),
  attribute3            VARCHAR2(240),
  attribute4            VARCHAR2(240),
  attribute5            VARCHAR2(240),
  attribute6            VARCHAR2(240),
  attribute7            VARCHAR2(240),
  attribute8            VARCHAR2(240),
  attribute9            VARCHAR2(240),
  attribute10           VARCHAR2(240),
  attribute11           VARCHAR2(240),
  attribute12           VARCHAR2(240),
  attribute13           VARCHAR2(240),
  attribute14           VARCHAR2(240),
  attribute15           VARCHAR2(240),
  source_code           VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DWSTG.BSM_DISTRIBUTOR_BUDGET
  is '经销商预算';
comment on column DWSTG.BSM_DISTRIBUTOR_BUDGET.distributor_budget_id
  is '表ID，主键，供其他表做外键';
comment on column DWSTG.BSM_DISTRIBUTOR_BUDGET.region_name
  is '省区';
comment on column DWSTG.BSM_DISTRIBUTOR_BUDGET.region_id
  is '省区ID';
comment on column DWSTG.BSM_DISTRIBUTOR_BUDGET.distributor_name
  is '经销商名称';
comment on column DWSTG.BSM_DISTRIBUTOR_BUDGET.distributor_id
  is '经销商ID';
comment on column DWSTG.BSM_DISTRIBUTOR_BUDGET.center_series_name
  is '中心系列';
comment on column DWSTG.BSM_DISTRIBUTOR_BUDGET.center_series_id
  is '中心系列ID';
comment on column DWSTG.BSM_DISTRIBUTOR_BUDGET.year
  is '年';
comment on column DWSTG.BSM_DISTRIBUTOR_BUDGET.jan_quantity
  is '一月预算数量';
comment on column DWSTG.BSM_DISTRIBUTOR_BUDGET.feb_quantity
  is '二月预算数量';
comment on column DWSTG.BSM_DISTRIBUTOR_BUDGET.mar_quantity
  is '三月预算数量';
comment on column DWSTG.BSM_DISTRIBUTOR_BUDGET.apr_quantity
  is '四月预算数量';
comment on column DWSTG.BSM_DISTRIBUTOR_BUDGET.may_quantity
  is '五月预算数量';
comment on column DWSTG.BSM_DISTRIBUTOR_BUDGET.jun_quantity
  is '六月预算数量';
comment on column DWSTG.BSM_DISTRIBUTOR_BUDGET.jul_quantity
  is '七月预算数量';
comment on column DWSTG.BSM_DISTRIBUTOR_BUDGET.aug_quantity
  is '八月预算数量';
comment on column DWSTG.BSM_DISTRIBUTOR_BUDGET.sep_quantity
  is '九月预算数量';
comment on column DWSTG.BSM_DISTRIBUTOR_BUDGET.oct_quantity
  is '十月预算数量';
comment on column DWSTG.BSM_DISTRIBUTOR_BUDGET.nov_quantity
  is '十一月预算数量';
comment on column DWSTG.BSM_DISTRIBUTOR_BUDGET.dec_quantity
  is '十二月预算数量';
comment on column DWSTG.BSM_DISTRIBUTOR_BUDGET.row_version_number
  is '行版本号，用来处理锁';
alter table DWSTG.BSM_DISTRIBUTOR_BUDGET
  add constraint BSM_DISTRIBUTOR_BUDGET_PK primary key (DISTRIBUTOR_BUDGET_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BSM_HIGH_ADDITIONAL_PRODUCT
prompt ==========================================
prompt
create table DWSTG.BSM_HIGH_ADDITIONAL_PRODUCT
(
  high_add_prod_id   NUMBER not null,
  inventory_item_id  NUMBER,
  center_series_id   NUMBER,
  type_code          VARCHAR2(10) not null,
  row_version_number NUMBER default 1 not null,
  creation_date      DATE default sysdate not null,
  created_by         NUMBER default -1 not null,
  last_updated_by    NUMBER default -1 not null,
  last_update_date   DATE default sysdate not null,
  last_update_login  NUMBER,
  attribute_category VARCHAR2(30),
  attribute1         VARCHAR2(240),
  attribute2         VARCHAR2(240),
  attribute3         VARCHAR2(240),
  attribute4         VARCHAR2(240),
  attribute5         VARCHAR2(240),
  attribute6         VARCHAR2(240),
  attribute7         VARCHAR2(240),
  attribute8         VARCHAR2(240),
  attribute9         VARCHAR2(240),
  attribute10        VARCHAR2(240),
  attribute11        VARCHAR2(240),
  attribute12        VARCHAR2(240),
  attribute13        VARCHAR2(240),
  attribute14        VARCHAR2(240),
  attribute15        VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DWSTG.BSM_HIGH_ADDITIONAL_PRODUCT
  is '高附产品信息维护';
comment on column DWSTG.BSM_HIGH_ADDITIONAL_PRODUCT.high_add_prod_id
  is '表ID，主键，供其他表做外键';
comment on column DWSTG.BSM_HIGH_ADDITIONAL_PRODUCT.inventory_item_id
  is '物料D';
comment on column DWSTG.BSM_HIGH_ADDITIONAL_PRODUCT.center_series_id
  is '中心系列ID';
comment on column DWSTG.BSM_HIGH_ADDITIONAL_PRODUCT.type_code
  is '记录高附品信息，是单品还是中心系列';
comment on column DWSTG.BSM_HIGH_ADDITIONAL_PRODUCT.row_version_number
  is '行版本号，用来处理锁';
create index DWSTG.BSM_HIGH_ADDITIONAL_PRODUCT_N1 on DWSTG.BSM_HIGH_ADDITIONAL_PRODUCT (CENTER_SERIES_ID)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index DWSTG.BSM_HIGH_ADDITIONAL_PRODUCT_U1 on DWSTG.BSM_HIGH_ADDITIONAL_PRODUCT (INVENTORY_ITEM_ID, CENTER_SERIES_ID)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.BSM_HIGH_ADDITIONAL_PRODUCT
  add constraint BSM_HIGH_ADDITIONAL_PRODUCT_PK primary key (HIGH_ADD_PROD_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BSM_NEW_PRODUCT
prompt ==============================
prompt
create table DWSTG.BSM_NEW_PRODUCT
(
  new_product_id     NUMBER not null,
  inventory_item_id  NUMBER,
  center_detail_id   NUMBER,
  type_code          VARCHAR2(10) not null,
  row_version_number NUMBER default 1 not null,
  creation_date      DATE default sysdate not null,
  created_by         NUMBER default -1 not null,
  last_updated_by    NUMBER default -1 not null,
  last_update_date   DATE default sysdate not null,
  last_update_login  NUMBER,
  attribute_category VARCHAR2(30),
  attribute1         VARCHAR2(240),
  attribute2         VARCHAR2(240),
  attribute3         VARCHAR2(240),
  attribute4         VARCHAR2(240),
  attribute5         VARCHAR2(240),
  attribute6         VARCHAR2(240),
  attribute7         VARCHAR2(240),
  attribute8         VARCHAR2(240),
  attribute9         VARCHAR2(240),
  attribute10        VARCHAR2(240),
  attribute11        VARCHAR2(240),
  attribute12        VARCHAR2(240),
  attribute13        VARCHAR2(240),
  attribute14        VARCHAR2(240),
  attribute15        VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DWSTG.BSM_NEW_PRODUCT
  is '新品信息维护';
comment on column DWSTG.BSM_NEW_PRODUCT.new_product_id
  is '表ID，主键，供其他表做外键';
comment on column DWSTG.BSM_NEW_PRODUCT.inventory_item_id
  is '物料ID';
comment on column DWSTG.BSM_NEW_PRODUCT.center_detail_id
  is '中心明细系列ID';
comment on column DWSTG.BSM_NEW_PRODUCT.type_code
  is '记录新品信息，是单品还是中心明细系列';
comment on column DWSTG.BSM_NEW_PRODUCT.row_version_number
  is '行版本号，用来处理锁';
create index DWSTG.BSM_NEW_PRODUCT_N1 on DWSTG.BSM_NEW_PRODUCT (CENTER_DETAIL_ID)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index DWSTG.BSM_NEW_PRODUCT_U1 on DWSTG.BSM_NEW_PRODUCT (INVENTORY_ITEM_ID, CENTER_DETAIL_ID)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.BSM_NEW_PRODUCT
  add constraint BSM_NEW_PRODUCT_PK primary key (NEW_PRODUCT_ID)
  using index 
  tablespace BI_DW_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BSM_NEW_SALE_QUANTITY
prompt ====================================
prompt
create table DWSTG.BSM_NEW_SALE_QUANTITY
(
  new_sale_qty_id    NUMBER not null,
  sale_date          DATE,
  zone_id            NUMBER,
  zone_name          VARCHAR2(150),
  source_code        VARCHAR2(10),
  detail_series_id   NUMBER,
  detail_series_name VARCHAR2(150),
  sale_quantity      NUMBER,
  creation_date      DATE default SYSDATE not null,
  created_by         NUMBER default -1 not null,
  last_updated_by    NUMBER default -1 not null,
  last_update_date   DATE default SYSDATE not null,
  last_update_login  NUMBER
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DWSTG.BSM_NEW_SALE_QUANTITY
  is '新品销量信息';
comment on column DWSTG.BSM_NEW_SALE_QUANTITY.new_sale_qty_id
  is '表ID，主键，供其他表做外键';
comment on column DWSTG.BSM_NEW_SALE_QUANTITY.sale_date
  is '销售日期';
comment on column DWSTG.BSM_NEW_SALE_QUANTITY.zone_id
  is '片区ID';
comment on column DWSTG.BSM_NEW_SALE_QUANTITY.zone_name
  is '片区名';
comment on column DWSTG.BSM_NEW_SALE_QUANTITY.source_code
  is '区域来源';
comment on column DWSTG.BSM_NEW_SALE_QUANTITY.detail_series_id
  is '明细系列ID';
comment on column DWSTG.BSM_NEW_SALE_QUANTITY.detail_series_name
  is '明细系列名称';
comment on column DWSTG.BSM_NEW_SALE_QUANTITY.sale_quantity
  is '销量';
alter table DWSTG.BSM_NEW_SALE_QUANTITY
  add constraint BSM_NEW_SALE_QUANTITY_PK primary key (NEW_SALE_QTY_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BSM_PROVINCE_BATTLE_BUDGET
prompt =========================================
prompt
create table DWSTG.BSM_PROVINCE_BATTLE_BUDGET
(
  sale_budget_id     NUMBER not null,
  region_name        VARCHAR2(150) not null,
  region_id          NUMBER not null,
  zone_name          VARCHAR2(150) not null,
  zone_id            NUMBER not null,
  branch_name        VARCHAR2(150),
  branch_id          NUMBER,
  center_series_name VARCHAR2(150) not null,
  center_series_id   NUMBER not null,
  source_code        VARCHAR2(10),
  year               DATE,
  jan_quantity       NUMBER,
  feb_quantity       NUMBER,
  mar_quantity       NUMBER,
  apr_quantity       NUMBER,
  may_quantity       NUMBER,
  jun_quantity       NUMBER,
  jul_quantity       NUMBER,
  aug_quantity       NUMBER,
  sep_quantity       NUMBER,
  oct_quantity       NUMBER,
  nov_quantity       NUMBER,
  dec_quantity       NUMBER,
  row_version_number NUMBER default 1 not null,
  creation_date      DATE default sysdate not null,
  created_by         NUMBER default -1 not null,
  last_updated_by    NUMBER default -1 not null,
  last_update_date   DATE default sysdate not null,
  last_update_login  NUMBER,
  attribute_category VARCHAR2(30),
  attribute1         VARCHAR2(240),
  attribute2         VARCHAR2(240),
  attribute3         VARCHAR2(240),
  attribute4         VARCHAR2(240),
  attribute5         VARCHAR2(240),
  attribute6         VARCHAR2(240),
  attribute7         VARCHAR2(240),
  attribute8         VARCHAR2(240),
  attribute9         VARCHAR2(240),
  attribute10        VARCHAR2(240),
  attribute11        VARCHAR2(240),
  attribute12        VARCHAR2(240),
  attribute13        VARCHAR2(240),
  attribute14        VARCHAR2(240),
  attribute15        VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.BSM_PROVINCE_BATTLE_BUDGET
  add constraint BSM_PROVINCE_BATTLE_BUDGET_PK primary key (SALE_BUDGET_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BSM_SALE_BUDGET
prompt ==============================
prompt
create table DWSTG.BSM_SALE_BUDGET
(
  sale_budget_id     NUMBER not null,
  region_name        VARCHAR2(150) not null,
  region_id          NUMBER not null,
  zone_name          VARCHAR2(150) not null,
  zone_id            NUMBER not null,
  branch_name        VARCHAR2(150),
  branch_id          NUMBER,
  detail_series_name VARCHAR2(150) not null,
  detail_series_id   NUMBER not null,
  year               DATE,
  jan_quantity       NUMBER,
  feb_quantity       NUMBER,
  mar_quantity       NUMBER,
  apr_quantity       NUMBER,
  may_quantity       NUMBER,
  jun_quantity       NUMBER,
  jul_quantity       NUMBER,
  aug_quantity       NUMBER,
  sep_quantity       NUMBER,
  oct_quantity       NUMBER,
  nov_quantity       NUMBER,
  dec_quantity       NUMBER,
  row_version_number NUMBER default 1 not null,
  creation_date      DATE default sysdate not null,
  created_by         NUMBER default -1 not null,
  last_updated_by    NUMBER default -1 not null,
  last_update_date   DATE default sysdate not null,
  last_update_login  NUMBER,
  attribute_category VARCHAR2(30),
  attribute1         VARCHAR2(240),
  attribute2         VARCHAR2(240),
  attribute3         VARCHAR2(240),
  attribute4         VARCHAR2(240),
  attribute5         VARCHAR2(240),
  attribute6         VARCHAR2(240),
  attribute7         VARCHAR2(240),
  attribute8         VARCHAR2(240),
  attribute9         VARCHAR2(240),
  attribute10        VARCHAR2(240),
  attribute11        VARCHAR2(240),
  attribute12        VARCHAR2(240),
  attribute13        VARCHAR2(240),
  attribute14        VARCHAR2(240),
  attribute15        VARCHAR2(240),
  source_code        VARCHAR2(10)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.BSM_SALE_BUDGET
  add constraint BSM_SALE_BUDGET_PK primary key (SALE_BUDGET_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CNL_REGION_SBL_ALL
prompt =================================
prompt
create table DWSTG.CNL_REGION_SBL_ALL
(
  region_id         VARCHAR2(30 CHAR),
  region_code       VARCHAR2(50 CHAR),
  region_name       VARCHAR2(100 CHAR) not null,
  region_level_id   NUMBER,
  parent_id         VARCHAR2(30 CHAR),
  status            NUMBER,
  source_code       VARCHAR2(4),
  base_attribute    VARCHAR2(4),
  battle_attribute  VARCHAR2(9),
  factory_attribute VARCHAR2(100 CHAR),
  factory_desc      VARCHAR2(50 CHAR)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table CST_BRAND_D
prompt ==========================
prompt
create table DWSTG.CST_BRAND_D
(
  brand_l1dim  VARCHAR2(20),
  brand_l1desc VARCHAR2(200),
  brand_l2dim  VARCHAR2(20),
  brand_l2desc VARCHAR2(200),
  brand_l3dim  VARCHAR2(20) not null,
  brand_l3desc VARCHAR2(200),
  attribute1   VARCHAR2(240),
  attribute2   VARCHAR2(240),
  attribute3   VARCHAR2(240),
  attribute4   VARCHAR2(240),
  attribute5   VARCHAR2(240),
  attribute6   VARCHAR2(240),
  attribute7   VARCHAR2(240),
  attribute8   VARCHAR2(240),
  attribute9   VARCHAR2(240),
  attribute10  VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.CST_BRAND_D
  add primary key (BRAND_L3DIM)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CST_BUDVER_D
prompt ===========================
prompt
create table DWSTG.CST_BUDVER_D
(
  budver_l1dim  VARCHAR2(20) not null,
  budver_l1desc VARCHAR2(200),
  attribute1    VARCHAR2(240),
  attribute2    VARCHAR2(240),
  attribute3    VARCHAR2(240),
  attribute4    VARCHAR2(240),
  attribute5    VARCHAR2(240),
  attribute6    VARCHAR2(240),
  attribute7    VARCHAR2(240),
  attribute8    VARCHAR2(240),
  attribute9    VARCHAR2(240),
  attribute10   VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.CST_BUDVER_D
  add primary key (BUDVER_L1DIM)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CST_COM_D
prompt ========================
prompt
create table DWSTG.CST_COM_D
(
  com_l1dim   VARCHAR2(20),
  com_l1desc  VARCHAR2(200),
  com_l2dim   VARCHAR2(20) not null,
  com_l2desc  VARCHAR2(200),
  attribute1  VARCHAR2(240),
  attribute2  VARCHAR2(240),
  attribute3  VARCHAR2(240),
  attribute4  VARCHAR2(240),
  attribute5  VARCHAR2(240),
  attribute6  VARCHAR2(240),
  attribute7  VARCHAR2(240),
  attribute8  VARCHAR2(240),
  attribute9  VARCHAR2(240),
  attribute10 VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.CST_COM_D
  add primary key (COM_L2DIM)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CST_CONTAINER_D
prompt ==============================
prompt
create table DWSTG.CST_CONTAINER_D
(
  container_l1dim  VARCHAR2(20),
  container_l1desc VARCHAR2(200),
  container_l2dim  VARCHAR2(20),
  container_l2desc VARCHAR2(200),
  container_l3dim  VARCHAR2(20),
  container_l3desc VARCHAR2(200),
  container_l4dim  VARCHAR2(20) not null,
  container_l4desc VARCHAR2(200),
  attribute1       VARCHAR2(240),
  attribute2       VARCHAR2(240),
  attribute3       VARCHAR2(240),
  attribute4       VARCHAR2(240),
  attribute5       VARCHAR2(240),
  attribute6       VARCHAR2(240),
  attribute7       VARCHAR2(240),
  attribute8       VARCHAR2(240),
  attribute9       VARCHAR2(240),
  attribute10      VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.CST_CONTAINER_D
  add primary key (CONTAINER_L4DIM)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CST_DENSITY_D
prompt ============================
prompt
create table DWSTG.CST_DENSITY_D
(
  density_l1dim  VARCHAR2(20),
  density_l1desc VARCHAR2(200),
  density_l2dim  VARCHAR2(20) not null,
  density_l2desc VARCHAR2(200),
  attribute1     VARCHAR2(240),
  attribute2     VARCHAR2(240),
  attribute3     VARCHAR2(240),
  attribute4     VARCHAR2(240),
  attribute5     VARCHAR2(240),
  attribute6     VARCHAR2(240),
  attribute7     VARCHAR2(240),
  attribute8     VARCHAR2(240),
  attribute9     VARCHAR2(240),
  attribute10    VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.CST_DENSITY_D
  add primary key (DENSITY_L2DIM)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CST_ELEMENT_D
prompt ============================
prompt
create table DWSTG.CST_ELEMENT_D
(
  element_l1dim      VARCHAR2(20),
  element_l1desc     VARCHAR2(200),
  element_l1fulldesc VARCHAR2(200),
  element_l2dim      VARCHAR2(20),
  element_l2desc     VARCHAR2(200),
  element_l2fulldesc VARCHAR2(200),
  element_l3dim      VARCHAR2(20),
  element_l3desc     VARCHAR2(200),
  element_l3fulldesc VARCHAR2(200),
  element_l4dim      VARCHAR2(20),
  element_l4desc     VARCHAR2(200),
  element_l4fulldesc VARCHAR2(200),
  element_l5dim      VARCHAR2(20),
  element_l5desc     VARCHAR2(200),
  element_l5fulldesc VARCHAR2(200),
  element_l6dim      VARCHAR2(20) not null,
  element_l6desc     VARCHAR2(200),
  element_l6fulldesc VARCHAR2(200),
  attribute1         VARCHAR2(240),
  attribute2         VARCHAR2(240),
  attribute3         VARCHAR2(240),
  attribute4         VARCHAR2(240),
  attribute5         VARCHAR2(240),
  attribute6         VARCHAR2(240),
  attribute7         VARCHAR2(240),
  attribute8         VARCHAR2(240),
  attribute9         VARCHAR2(240),
  attribute10        VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.CST_ELEMENT_D
  add primary key (ELEMENT_L6DIM)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CST_PACKAGE_D
prompt ============================
prompt
create table DWSTG.CST_PACKAGE_D
(
  package_l1dim  VARCHAR2(20),
  package_l1desc VARCHAR2(200),
  package_l2dim  VARCHAR2(20),
  package_l2desc VARCHAR2(200),
  package_l3dim  VARCHAR2(20) not null,
  package_l3desc VARCHAR2(200),
  attribute1     VARCHAR2(240),
  attribute2     VARCHAR2(240),
  attribute3     VARCHAR2(240),
  attribute4     VARCHAR2(240),
  attribute5     VARCHAR2(240),
  attribute6     VARCHAR2(240),
  attribute7     VARCHAR2(240),
  attribute8     VARCHAR2(240),
  attribute9     VARCHAR2(240),
  attribute10    VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.CST_PACKAGE_D
  add primary key (PACKAGE_L3DIM)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CST_PERIOD_D
prompt ===========================
prompt
create table DWSTG.CST_PERIOD_D
(
  year_dim        VARCHAR2(20) not null,
  year_desc       VARCHAR2(240) not null,
  year_id         NUMBER,
  momth_dim       VARCHAR2(20) not null,
  month_desc      VARCHAR2(240) not null,
  month_desc1     VARCHAR2(240) not null,
  month_name      VARCHAR2(240),
  sequence_number NUMBER,
  attribute1      VARCHAR2(240) not null,
  attribute2      VARCHAR2(240),
  attribute3      VARCHAR2(240),
  attribute4      VARCHAR2(240),
  attribute5      VARCHAR2(240),
  attribute6      VARCHAR2(240),
  attribute7      VARCHAR2(240),
  attribute8      VARCHAR2(240),
  attribute9      VARCHAR2(240),
  attribute10     VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.CST_PERIOD_D
  add primary key (ATTRIBUTE1)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CST_SIZE_D
prompt =========================
prompt
create table DWSTG.CST_SIZE_D
(
  size_l1dim    VARCHAR2(20),
  size_l1desc   VARCHAR2(200),
  size_l2dim    VARCHAR2(20),
  size_l2desc   VARCHAR2(200),
  size_l2qtypkl NUMBER,
  size_l3dim    VARCHAR2(20) not null,
  size_l3desc   VARCHAR2(200),
  size_l3qtypkl NUMBER,
  attribute1    VARCHAR2(240),
  attribute2    VARCHAR2(240),
  attribute3    VARCHAR2(240),
  attribute4    VARCHAR2(240),
  attribute5    VARCHAR2(240),
  attribute6    VARCHAR2(240),
  attribute7    VARCHAR2(240),
  attribute8    VARCHAR2(240),
  attribute9    VARCHAR2(240),
  attribute10   VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.CST_SIZE_D
  add primary key (SIZE_L3DIM)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CUS_PROD_CUSTOM_SERIES
prompt =====================================
prompt
create table DWSTG.CUS_PROD_CUSTOM_SERIES
(
  custom_series_id   NUMBER not null,
  custom_series_name VARCHAR2(100) not null,
  custom_series_desc VARCHAR2(100) not null,
  status             NUMBER not null,
  creation_date      DATE,
  last_update_date   DATE
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index DWSTG.CUS_PROD_CUSTOM_SERIES_U1 on DWSTG.CUS_PROD_CUSTOM_SERIES (CUSTOM_SERIES_NAME)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.CUS_PROD_CUSTOM_SERIES
  add constraint CUS_PROD_CUSTOM_SERIES_PK unique (CUSTOM_SERIES_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CUS_PROD_CUSTOM_VALUE
prompt ====================================
prompt
create table DWSTG.CUS_PROD_CUSTOM_VALUE
(
  custom_value_id   NUMBER not null,
  custom_value_name VARCHAR2(100) not null,
  custom_value_desc VARCHAR2(100) not null,
  custom_series_id  NUMBER not null,
  status            NUMBER not null,
  order_num         NUMBER not null,
  creation_date     DATE,
  last_update_date  DATE
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DWSTG.CUS_PROD_CUSTOM_VALUE_N1 on DWSTG.CUS_PROD_CUSTOM_VALUE (CUSTOM_SERIES_ID)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index DWSTG.CUS_PROD_CUSTOM_VALUE_U1 on DWSTG.CUS_PROD_CUSTOM_VALUE (CUSTOM_VALUE_NAME)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.CUS_PROD_CUSTOM_VALUE
  add constraint CUS_PROD_CUSTOM_VALUE_PK unique (CUSTOM_VALUE_ID)
  using index 
  tablespace SOAU_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CUS_PROD_SERIES_MAPPING
prompt ======================================
prompt
create table DWSTG.CUS_PROD_SERIES_MAPPING
(
  series_mapping_id NUMBER not null,
  custom_value_id   NUMBER not null,
  detail_series_id  NUMBER not null,
  custom_series_id  NUMBER not null,
  status            NUMBER not null,
  creation_date     DATE,
  last_update_date  DATE
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index DWSTG.CUS_PROD_SERIES_MAPPING_U1 on DWSTG.CUS_PROD_SERIES_MAPPING (CUSTOM_VALUE_ID, DETAIL_SERIES_ID)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index DWSTG.CUS_PROD_SERIES_MAPPING_U2 on DWSTG.CUS_PROD_SERIES_MAPPING (CUSTOM_SERIES_ID, DETAIL_SERIES_ID)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.CUS_PROD_SERIES_MAPPING
  add constraint CUS_PROD_SERIES_MAPPING_PK unique (SERIES_MAPPING_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DL_ENTITIES
prompt ==========================
prompt
create table DWSTG.DL_ENTITIES
(
  entity_id          NUMBER not null,
  entity_code        VARCHAR2(80) not null,
  entity_name        VARCHAR2(80) not null,
  entity_type        VARCHAR2(80),
  hfm_flag           VARCHAR2(10),
  data_flag          VARCHAR2(10),
  import_flag        VARCHAR2(1),
  parent_entity_code VARCHAR2(80),
  parent_entity_name VARCHAR2(80),
  cost_parent_code   VARCHAR2(80),
  cost_parent_name   VARCHAR2(80),
  is_mark            VARCHAR2(1),
  org_id             NUMBER,
  attribute1         VARCHAR2(240),
  attribute2         VARCHAR2(240),
  attribute3         VARCHAR2(240),
  attribute4         VARCHAR2(240),
  attribute5         VARCHAR2(240),
  attribute6         VARCHAR2(240),
  attribute7         VARCHAR2(240),
  attribute8         VARCHAR2(240),
  attribute9         VARCHAR2(240),
  attribute10        VARCHAR2(240),
  created_by         NUMBER not null,
  creation_date      DATE not null,
  last_updated_by    NUMBER not null,
  last_update_date   DATE not null,
  last_update_login  NUMBER
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index DWSTG.DL_ENTITIES_U1 on DWSTG.DL_ENTITIES (ENTITY_CODE)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index DWSTG.DL_ENTITIES_U2 on DWSTG.DL_ENTITIES (ENTITY_NAME)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.DL_ENTITIES
  add constraint DL_ENTITIES_PK primary key (ENTITY_ID)
  using index 
  tablespace BI_DW_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DL_PRODUCTS
prompt ==========================
prompt
create table DWSTG.DL_PRODUCTS
(
  product_id                 NUMBER not null,
  product_code               VARCHAR2(240) not null,
  product_name               VARCHAR2(240) not null,
  inventory_item_status_code VARCHAR2(30),
  brand_type                 VARCHAR2(240),
  brand_serial               VARCHAR2(240),
  center_serial              VARCHAR2(240),
  center_serial_detail       VARCHAR2(240),
  cost_brand                 VARCHAR2(240),
  container                  VARCHAR2(240),
  cost_container             VARCHAR2(240),
  pack                       VARCHAR2(240),
  cost_pack                  VARCHAR2(240),
  volume                     VARCHAR2(240),
  cost_volume                VARCHAR2(240),
  specifications             VARCHAR2(240),
  cost_specifications        VARCHAR2(240),
  concentraiton              VARCHAR2(240),
  cost_concentraiton         VARCHAR2(240),
  operation                  VARCHAR2(240),
  cost_operation             VARCHAR2(240),
  price_refer                VARCHAR2(240),
  created_by                 NUMBER not null,
  creation_date              DATE not null,
  last_updated_by            NUMBER not null,
  last_update_date           DATE not null,
  last_update_login          NUMBER
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index DWSTG.DL_PRODUCTS_U1 on DWSTG.DL_PRODUCTS (PRODUCT_CODE)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.DL_PRODUCTS
  add constraint DL_PRODUCTS_PK primary key (PRODUCT_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DL_SALE_COST_ALL
prompt ===============================
prompt
create table DWSTG.DL_SALE_COST_ALL
(
  header_id         NUMBER not null,
  line_id           NUMBER not null,
  period_name       VARCHAR2(15) not null,
  entity_id         NUMBER not null,
  data_type         VARCHAR2(240) not null,
  product_id        NUMBER not null,
  pack_type         VARCHAR2(240) not null,
  cost_type         VARCHAR2(240) not null,
  quantity          NUMBER,
  amount            NUMBER not null,
  source_type       VARCHAR2(30) not null,
  created_by        NUMBER not null,
  creation_date     DATE not null,
  last_updated_by   NUMBER not null,
  last_update_date  DATE not null,
  last_update_login NUMBER
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DWSTG.DL_SALE_COST_ALL_N1 on DWSTG.DL_SALE_COST_ALL (PERIOD_NAME, PRODUCT_ID, PACK_TYPE, COST_TYPE, ENTITY_ID)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DWSTG.DL_SALE_COST_ALL_N2 on DWSTG.DL_SALE_COST_ALL (PERIOD_NAME, ENTITY_ID, DATA_TYPE, PRODUCT_ID, PACK_TYPE, COST_TYPE)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DWSTG.DL_SALE_COST_ALL_N3 on DWSTG.DL_SALE_COST_ALL (ENTITY_ID, DATA_TYPE, PRODUCT_ID, PACK_TYPE, COST_TYPE)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DWSTG.DL_SALE_COST_ALL_N4 on DWSTG.DL_SALE_COST_ALL (PERIOD_NAME)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.DL_SALE_COST_ALL
  add constraint DL_SALE_COST_ALL_PK primary key (LINE_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.DL_SALE_COST_ALL
  add constraint DL_SALE_COST_ALL_UK1 unique (HEADER_ID, DATA_TYPE, PRODUCT_ID, PACK_TYPE, COST_TYPE)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DL_TARGET_SETS
prompt =============================
prompt
create table DWSTG.DL_TARGET_SETS
(
  line_id           NUMBER(15) not null,
  target_code       VARCHAR2(150) not null,
  entity_type       VARCHAR2(240) not null,
  target_weight     NUMBER not null,
  point1            NUMBER not null,
  point2            NUMBER not null,
  point3            NUMBER not null,
  point4            NUMBER not null,
  point5            NUMBER not null,
  point_type        VARCHAR2(240) not null,
  start_date        DATE not null,
  end_date          DATE not null,
  descriptions      VARCHAR2(240),
  attribute1        VARCHAR2(240),
  attribute2        VARCHAR2(240),
  attribute3        VARCHAR2(240),
  attribute4        VARCHAR2(240),
  attribute5        VARCHAR2(240),
  attribute6        VARCHAR2(240),
  attribute7        VARCHAR2(240),
  attribute8        VARCHAR2(240),
  attribute9        VARCHAR2(240),
  attribute10       VARCHAR2(240),
  created_by        NUMBER,
  creation_date     DATE,
  last_updated_by   NUMBER,
  last_update_date  DATE,
  last_update_login NUMBER
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.DL_TARGET_SETS
  add constraint DL_TARGET_SETS_PK primary key (LINE_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table FND_FLEX_VALUES
prompt ==============================
prompt
create table DWSTG.FND_FLEX_VALUES
(
  flex_value_set_id          NUMBER(10),
  flex_value_id              NUMBER(15) not null,
  flex_value                 VARCHAR2(150),
  last_update_date           DATE,
  last_updated_by            NUMBER(15),
  creation_date              DATE,
  created_by                 NUMBER(15),
  last_update_login          NUMBER(15),
  enabled_flag               VARCHAR2(1),
  summary_flag               VARCHAR2(1),
  start_date_active          DATE,
  end_date_active            DATE,
  parent_flex_value_low      VARCHAR2(60),
  parent_flex_value_high     VARCHAR2(60),
  structured_hierarchy_level NUMBER(15),
  hierarchy_level            VARCHAR2(30),
  compiled_value_attributes  VARCHAR2(2000),
  value_category             VARCHAR2(30),
  attribute1                 VARCHAR2(240),
  attribute2                 VARCHAR2(240),
  attribute3                 VARCHAR2(240),
  attribute4                 VARCHAR2(240),
  attribute5                 VARCHAR2(240),
  attribute6                 VARCHAR2(240),
  attribute7                 VARCHAR2(240),
  attribute8                 VARCHAR2(240),
  attribute9                 VARCHAR2(240),
  attribute10                VARCHAR2(240),
  attribute11                VARCHAR2(240),
  attribute12                VARCHAR2(240),
  attribute13                VARCHAR2(240),
  attribute14                VARCHAR2(240),
  attribute15                VARCHAR2(240),
  attribute16                VARCHAR2(240),
  attribute17                VARCHAR2(240),
  attribute18                VARCHAR2(240),
  attribute19                VARCHAR2(240),
  attribute20                VARCHAR2(240),
  attribute21                VARCHAR2(240),
  attribute22                VARCHAR2(240),
  attribute23                VARCHAR2(240),
  attribute24                VARCHAR2(240),
  attribute25                VARCHAR2(240),
  attribute26                VARCHAR2(240),
  attribute27                VARCHAR2(240),
  attribute28                VARCHAR2(240),
  attribute29                VARCHAR2(240),
  attribute30                VARCHAR2(240),
  attribute31                VARCHAR2(240),
  attribute32                VARCHAR2(240),
  attribute33                VARCHAR2(240),
  attribute34                VARCHAR2(240),
  attribute35                VARCHAR2(240),
  attribute36                VARCHAR2(240),
  attribute37                VARCHAR2(240),
  attribute38                VARCHAR2(240),
  attribute39                VARCHAR2(240),
  attribute40                VARCHAR2(240),
  attribute41                VARCHAR2(240),
  attribute42                VARCHAR2(240),
  attribute43                VARCHAR2(240),
  attribute44                VARCHAR2(240),
  attribute45                VARCHAR2(240),
  attribute46                VARCHAR2(240),
  attribute47                VARCHAR2(240),
  attribute48                VARCHAR2(240),
  attribute49                VARCHAR2(240),
  attribute50                VARCHAR2(240),
  attribute_sort_order       NUMBER(15)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DWSTG.FND_FLEX_VALUES_N1 on DWSTG.FND_FLEX_VALUES (FLEX_VALUE_SET_ID)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.FND_FLEX_VALUES
  add constraint FND_FLEX_VALUES_PK primary key (FLEX_VALUE_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table FND_FLEX_VALUES_TL
prompt =================================
prompt
create table DWSTG.FND_FLEX_VALUES_TL
(
  flex_value_id      NUMBER(15) not null,
  language           VARCHAR2(4) not null,
  last_update_date   DATE,
  last_updated_by    NUMBER(15),
  creation_date      DATE,
  created_by         NUMBER(15),
  last_update_login  NUMBER(10),
  description        VARCHAR2(240),
  source_lang        VARCHAR2(4),
  flex_value_meaning VARCHAR2(150)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.FND_FLEX_VALUES_TL
  add constraint FND_FLEX_VALUES_TL_PK primary key (LANGUAGE, FLEX_VALUE_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table FND_FLEX_VALUE_SETS
prompt ==================================
prompt
create table DWSTG.FND_FLEX_VALUE_SETS
(
  flex_value_set_id         NUMBER(10) not null,
  flex_value_set_name       VARCHAR2(60),
  last_update_date          DATE,
  last_updated_by           NUMBER(15),
  creation_date             DATE,
  created_by                NUMBER(15),
  last_update_login         NUMBER(15),
  validation_type           VARCHAR2(1),
  protected_flag            VARCHAR2(1),
  security_enabled_flag     VARCHAR2(1),
  longlist_flag             VARCHAR2(1),
  format_type               VARCHAR2(1),
  maximum_size              NUMBER(3),
  alphanumeric_allowed_flag VARCHAR2(1),
  uppercase_only_flag       VARCHAR2(1),
  numeric_mode_enabled_flag VARCHAR2(1),
  description               VARCHAR2(240),
  dependant_default_value   VARCHAR2(60),
  dependant_default_meaning VARCHAR2(240),
  parent_flex_value_set_id  NUMBER(10),
  minimum_value             VARCHAR2(150),
  maximum_value             VARCHAR2(150),
  number_precision          NUMBER(2)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DWSTG.FND_FLEX_VALUE_SETS_N1 on DWSTG.FND_FLEX_VALUE_SETS (FLEX_VALUE_SET_NAME)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.FND_FLEX_VALUE_SETS
  add constraint FND_FLEX_VALUE_SETS_PK primary key (FLEX_VALUE_SET_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table FND_ITEM
prompt =======================
prompt
create table DWSTG.FND_ITEM
(
  item_id          NUMBER not null,
  item_code        VARCHAR2(500) not null,
  item_name        VARCHAR2(500) not null,
  status           NUMBER(1) default 0 not null,
  is_standard      NUMBER(1) default 0 not null,
  item_desc        VARCHAR2(1000),
  type_id          NUMBER default 9 not null,
  uom              VARCHAR2(200),
  region_id        NUMBER,
  product_level_id NUMBER,
  product_category NUMBER,
  largess_type_id  NUMBER,
  purchase_place   VARCHAR2(200),
  unit_volume      NUMBER,
  standard         VARCHAR2(200),
  trademark_id     NUMBER,
  brand_id         NUMBER,
  category_id      NUMBER,
  package_id       NUMBER,
  series_id        NUMBER,
  creation_date    DATE not null,
  created_by       NUMBER not null,
  last_update_date DATE not null,
  last_updated_by  NUMBER not null
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.FND_ITEM
  add constraint FND_ITEM_PK primary key (ITEM_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table FND_LOOKUP_VALUES
prompt ================================
prompt
create table DWSTG.FND_LOOKUP_VALUES
(
  lookup_type         VARCHAR2(30) not null,
  language            VARCHAR2(30) not null,
  lookup_code         VARCHAR2(30) not null,
  meaning             VARCHAR2(80),
  description         VARCHAR2(240),
  enabled_flag        VARCHAR2(1),
  start_date_active   DATE,
  end_date_active     DATE,
  created_by          NUMBER(15),
  creation_date       DATE,
  last_updated_by     NUMBER(15),
  last_update_login   NUMBER(15),
  last_update_date    DATE,
  source_lang         VARCHAR2(4),
  security_group_id   NUMBER(15) not null,
  view_application_id NUMBER(15) not null,
  territory_code      VARCHAR2(2),
  attribute_category  VARCHAR2(30),
  attribute1          VARCHAR2(150),
  attribute2          VARCHAR2(150),
  attribute3          VARCHAR2(150),
  attribute4          VARCHAR2(150),
  attribute5          VARCHAR2(150),
  attribute6          VARCHAR2(150),
  attribute7          VARCHAR2(150),
  attribute8          VARCHAR2(150),
  attribute9          VARCHAR2(150),
  attribute10         VARCHAR2(150),
  attribute11         VARCHAR2(150),
  attribute12         VARCHAR2(150),
  attribute13         VARCHAR2(150),
  attribute14         VARCHAR2(150),
  attribute15         VARCHAR2(150),
  tag                 VARCHAR2(150),
  leaf_node           VARCHAR2(1)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DWSTG.FND_LOOPUP_VALUES_N1 on DWSTG.FND_LOOKUP_VALUES (LAST_UPDATE_DATE)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.FND_LOOKUP_VALUES
  add constraint FND_LOOKUP_VALUES_PK primary key (LOOKUP_TYPE, LANGUAGE, LOOKUP_CODE, SECURITY_GROUP_ID, VIEW_APPLICATION_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table FND_USER
prompt =======================
prompt
create table DWSTG.FND_USER
(
  user_id                 NUMBER(15) not null,
  user_name               VARCHAR2(100),
  last_update_date        DATE,
  last_updated_by         NUMBER(15),
  creation_date           DATE,
  created_by              NUMBER(15),
  last_update_login       NUMBER(15),
  start_date              DATE,
  end_date                DATE,
  description             VARCHAR2(240),
  employee_id             NUMBER(15),
  email_address           VARCHAR2(240),
  fax                     VARCHAR2(80),
  customer_id             NUMBER(15),
  supplier_id             NUMBER(15),
  gcn_code_combination_id NUMBER(15),
  person_party_id         NUMBER,
  last_logon_date         DATE
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SOAU.FND_USER_INDEX on DWSTG.FND_USER (USER_NAME)
  tablespace BI_DW_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.FND_USER
  add constraint FND_USER_PK primary key (USER_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table HFM_TBHFM_ENTITY
prompt ===============================
prompt
create table DWSTG.HFM_TBHFM_ENTITY
(
  id              INTEGER not null,
  label           NVARCHAR2(100) not null,
  parentid        INTEGER not null,
  parentlabel     NVARCHAR2(100),
  description     NVARCHAR2(256),
  userdefined1    NVARCHAR2(256),
  userdefined2    NVARCHAR2(256),
  userdefined3    NVARCHAR2(256),
  isshared        INTEGER not null,
  isicp           INTEGER not null,
  defaultcurrency INTEGER not null,
  isleaf          INTEGER not null
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.HFM_TBHFM_ENTITY
  add primary key (ID, PARENTID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table HFM_TBHFM_PERIOD
prompt ===============================
prompt
create table DWSTG.HFM_TBHFM_PERIOD
(
  id          INTEGER not null,
  label       NVARCHAR2(100) not null,
  parentid    INTEGER not null,
  parentlabel NVARCHAR2(100),
  description NVARCHAR2(256),
  isshared    INTEGER not null,
  isleaf      INTEGER not null
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.HFM_TBHFM_PERIOD
  add primary key (ID, PARENTID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table HP_DATA_TBCBYS_COST
prompt ==================================
prompt
create table DWSTG.HP_DATA_TBCBYS_COST
(
  account    VARCHAR2(240) not null,
  periods    VARCHAR2(240) not null,
  spare      VARCHAR2(240) not null,
  years      VARCHAR2(240) not null,
  stage      VARCHAR2(240) not null,
  version    VARCHAR2(240) not null,
  package    VARCHAR2(240) not null,
  entity     VARCHAR2(240) not null,
  input      VARCHAR2(240) not null,
  department VARCHAR2(240) not null,
  product    VARCHAR2(240) not null,
  material   VARCHAR2(240) not null,
  scenario   VARCHAR2(240) not null,
  data       NUMBER,
  attribute1 VARCHAR2(240),
  attribute2 VARCHAR2(240),
  attribute3 VARCHAR2(240),
  attribute4 VARCHAR2(240),
  attribute5 VARCHAR2(240)
)
partition by range (YEARS)
subpartition by list (SCENARIO)
(
  partition PART_2009 values less than ('FY10')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2009_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2009_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2009_SC03 values ('SC03') tablespace BI_DW_DATA
  ),
  partition PART_2010 values less than ('FY11')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2010_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2010_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2010_SC03 values ('SC03') tablespace BI_DW_DATA
  ),
  partition PART_2011 values less than ('FY12')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2011_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2011_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2011_SC03 values ('SC03') tablespace BI_DW_DATA
  ),
  partition PART_2012 values less than ('FY13')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2012_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2012_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2012_SC03 values ('SC03') tablespace BI_DW_DATA
  ),
  partition PART_2013 values less than ('FY14')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2013_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2013_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2013_SC03 values ('SC03') tablespace BI_DW_DATA
  ),
  partition PART_2014 values less than ('FY15')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2014_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2014_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2014_SC03 values ('SC03') tablespace BI_DW_DATA
  ),
  partition PART_2015 values less than ('FY16')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2015_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2015_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2015_SC03 values ('SC03') tablespace BI_DW_DATA
  ),
  partition PART_2016 values less than ('FY17')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2016_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2016_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2016_SC03 values ('SC03') tablespace BI_DW_DATA
  ),
  partition PART_2017 values less than ('FY18')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2017_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2017_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2017_SC03 values ('SC03') tablespace BI_DW_DATA
  ),
  partition PART_2018 values less than ('FY19')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2018_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2018_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2018_SC03 values ('SC03') tablespace BI_DW_DATA
  ),
  partition PART_2019 values less than ('FY20')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2019_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2019_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2019_SC03 values ('SC03') tablespace BI_DW_DATA
  ),
  partition PART_2020 values less than ('FY21')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2020_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2020_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2020_SC03 values ('SC03') tablespace BI_DW_DATA
  )
);
create index SOAU.HP_DATA_TBCBYS_COST_PK on DWSTG.HP_DATA_TBCBYS_COST (ACCOUNT, SCENARIO, VERSION, YEARS, PERIODS, PRODUCT, MATERIAL)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table HP_DATA_TBCBYS_EXPENSE
prompt =====================================
prompt
create table DWSTG.HP_DATA_TBCBYS_EXPENSE
(
  account    VARCHAR2(240) not null,
  periods    VARCHAR2(240) not null,
  spare      VARCHAR2(240) not null,
  scenario   VARCHAR2(240) not null,
  years      VARCHAR2(240) not null,
  version    VARCHAR2(240) not null,
  entity     VARCHAR2(240) not null,
  department VARCHAR2(240) not null,
  data       NUMBER,
  attribute1 VARCHAR2(240),
  attribute2 VARCHAR2(240),
  attribute3 VARCHAR2(240),
  attribute4 VARCHAR2(240),
  attribute5 VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;

prompt
prompt Creating table HP_DATA_TBCWYS_NONPROD
prompt =====================================
prompt
create table DWSTG.HP_DATA_TBCWYS_NONPROD
(
  account    VARCHAR2(240),
  periods    VARCHAR2(240),
  spare      VARCHAR2(240),
  years      VARCHAR2(240),
  version    VARCHAR2(240),
  scenario   VARCHAR2(240),
  buyer      VARCHAR2(240),
  entity     VARCHAR2(240),
  department VARCHAR2(240),
  data       NUMBER,
  attribute1 VARCHAR2(240),
  attribute2 VARCHAR2(240),
  attribute3 VARCHAR2(240),
  attribute4 VARCHAR2(240),
  attribute5 VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table HP_DATA_TBCWYS_PROD
prompt ==================================
prompt
create table DWSTG.HP_DATA_TBCWYS_PROD
(
  account    VARCHAR2(240),
  periods    VARCHAR2(240),
  joint      VARCHAR2(240),
  spare      VARCHAR2(240),
  years      VARCHAR2(240),
  logistic   VARCHAR2(240),
  version    VARCHAR2(240),
  source     VARCHAR2(240),
  scenario   VARCHAR2(240),
  buyer      VARCHAR2(240),
  entity     VARCHAR2(240),
  department VARCHAR2(240),
  product    VARCHAR2(240),
  data       NUMBER,
  attribute1 VARCHAR2(240),
  attribute2 VARCHAR2(240),
  attribute3 VARCHAR2(240),
  attribute4 VARCHAR2(240),
  attribute5 VARCHAR2(240)
)
partition by range (YEARS)
subpartition by list (SCENARIO)
(
  partition PART_2009 values less than ('FY10')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2009_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2009_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2009_SC03 values ('SC03') tablespace BI_DW_DATA
  ),
  partition PART_2010 values less than ('FY11')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2010_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2010_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2010_SC03 values ('SC03') tablespace BI_DW_DATA
  ),
  partition PART_2011 values less than ('FY12')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2011_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2011_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2011_SC03 values ('SC03') tablespace BI_DW_DATA
  ),
  partition PART_2012 values less than ('FY13')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2012_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2012_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2012_SC03 values ('SC03') tablespace BI_DW_DATA
  ),
  partition PART_2013 values less than ('FY14')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2013_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2013_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2013_SC03 values ('SC03') tablespace BI_DW_DATA
  ),
  partition PART_2014 values less than ('FY15')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2014_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2014_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2014_SC03 values ('SC03') tablespace BI_DW_DATA
  ),
  partition PART_2015 values less than ('FY16')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2015_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2015_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2015_SC03 values ('SC03') tablespace BI_DW_DATA
  ),
  partition PART_2016 values less than ('FY17')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2016_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2016_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2016_SC03 values ('SC03') tablespace BI_DW_DATA
  ),
  partition PART_2017 values less than ('FY18')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2017_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2017_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2017_SC03 values ('SC03') tablespace BI_DW_DATA
  ),
  partition PART_2018 values less than ('FY19')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2018_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2018_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2018_SC03 values ('SC03') tablespace BI_DW_DATA
  ),
  partition PART_2019 values less than ('FY20')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2019_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2019_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2019_SC03 values ('SC03') tablespace BI_DW_DATA
  ),
  partition PART_2020 values less than ('FY21')
    tablespace BI_DW_DATA
    pctfree 10
    initrans 1
    maxtrans 255
  (
    subpartition PART_2020_SC01 values ('SC01') tablespace BI_DW_DATA,
    subpartition PART_2020_SC02 values ('SC02') tablespace BI_DW_DATA,
    subpartition PART_2020_SC03 values ('SC03') tablespace BI_DW_DATA
  )
);

prompt
prompt Creating table HP_DATA_TBCWYS_REPORT
prompt ====================================
prompt
create table DWSTG.HP_DATA_TBCWYS_REPORT
(
  account    VARCHAR2(240),
  periods    VARCHAR2(240),
  spare      VARCHAR2(240),
  years      VARCHAR2(240),
  version    VARCHAR2(240),
  scenario   VARCHAR2(240),
  entity     VARCHAR2(240),
  department VARCHAR2(240),
  data       NUMBER,
  attribute1 VARCHAR2(240),
  attribute2 VARCHAR2(240),
  attribute3 VARCHAR2(240),
  attribute4 VARCHAR2(240),
  attribute5 VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table HP_DATA_TBXHYB_CONSUMPT
prompt ======================================
prompt
create table DWSTG.HP_DATA_TBXHYB_CONSUMPT
(
  account    VARCHAR2(240) not null,
  periods    VARCHAR2(240) not null,
  spare      VARCHAR2(240) not null,
  years      VARCHAR2(240) not null,
  version    VARCHAR2(240) not null,
  package    VARCHAR2(240) not null,
  entity     VARCHAR2(240) not null,
  department VARCHAR2(240) not null,
  scenario   VARCHAR2(240) not null,
  category   VARCHAR2(240) not null,
  data       NUMBER,
  attribute1 VARCHAR2(240),
  attribute2 VARCHAR2(240),
  attribute3 VARCHAR2(240),
  attribute4 VARCHAR2(240),
  attribute5 VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table HP_HADF_COST_MAPPING
prompt ===================================
prompt
create table DWSTG.HP_HADF_COST_MAPPING
(
  hp_code    VARCHAR2(240) not null,
  hadf_code  VARCHAR2(240) not null,
  attribute1 VARCHAR2(240),
  attribute2 VARCHAR2(240),
  attribute3 VARCHAR2(240),
  attribute4 VARCHAR2(240),
  attribute5 VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table HP_HADF_PACK_MAPPING
prompt ===================================
prompt
create table DWSTG.HP_HADF_PACK_MAPPING
(
  hp_code    VARCHAR2(240) not null,
  hadf_code  VARCHAR2(240) not null,
  attribute1 VARCHAR2(240),
  attribute2 VARCHAR2(240),
  attribute3 VARCHAR2(240),
  attribute4 VARCHAR2(240),
  attribute5 VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table HP_HADF_PERIOD_MAPPING
prompt =====================================
prompt
create table DWSTG.HP_HADF_PERIOD_MAPPING
(
  hp_code    VARCHAR2(240) not null,
  hadf_code  VARCHAR2(240) not null,
  month      NUMBER,
  attribute1 VARCHAR2(240),
  attribute2 VARCHAR2(240),
  attribute3 VARCHAR2(240),
  attribute4 VARCHAR2(240),
  attribute5 VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table HR_ORGANIZATION_INFORMATION
prompt ==========================================
prompt
create table DWSTG.HR_ORGANIZATION_INFORMATION
(
  org_information_id      NUMBER not null,
  org_information_context VARCHAR2(40),
  organization_id         NUMBER(15),
  org_information1        VARCHAR2(150),
  org_information10       VARCHAR2(150),
  org_information11       VARCHAR2(150),
  org_information12       VARCHAR2(150),
  org_information13       VARCHAR2(150),
  org_information14       VARCHAR2(150),
  org_information15       VARCHAR2(150),
  org_information16       VARCHAR2(150),
  org_information17       VARCHAR2(150),
  org_information18       VARCHAR2(150),
  org_information19       VARCHAR2(150),
  org_information2        VARCHAR2(150),
  org_information20       VARCHAR2(150),
  org_information3        VARCHAR2(150),
  org_information4        VARCHAR2(150),
  org_information5        VARCHAR2(150),
  org_information6        VARCHAR2(150),
  org_information7        VARCHAR2(150),
  org_information8        VARCHAR2(150),
  org_information9        VARCHAR2(150),
  request_id              NUMBER(15),
  program_application_id  NUMBER(15),
  program_id              NUMBER(15),
  program_update_date     DATE,
  attribute_category      VARCHAR2(30),
  attribute1              VARCHAR2(150),
  attribute2              VARCHAR2(150),
  attribute3              VARCHAR2(150),
  attribute4              VARCHAR2(150),
  attribute5              VARCHAR2(150),
  attribute6              VARCHAR2(150),
  attribute7              VARCHAR2(150),
  attribute8              VARCHAR2(150),
  attribute9              VARCHAR2(150),
  attribute10             VARCHAR2(150),
  attribute11             VARCHAR2(150),
  attribute12             VARCHAR2(150),
  attribute13             VARCHAR2(150),
  attribute14             VARCHAR2(150),
  attribute15             VARCHAR2(150),
  attribute16             VARCHAR2(150),
  attribute17             VARCHAR2(150),
  attribute18             VARCHAR2(150),
  attribute19             VARCHAR2(150),
  attribute20             VARCHAR2(150),
  last_update_date        DATE,
  last_updated_by         NUMBER(15),
  last_update_login       NUMBER(15),
  created_by              NUMBER(15),
  creation_date           DATE,
  object_version_number   NUMBER(9),
  party_id                NUMBER(15)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.HR_ORGANIZATION_INFORMATION
  add constraint HR_ORGANIZATION_INFORMATION_PK primary key (ORG_INFORMATION_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table HZ_CUST_ACCOUNTS
prompt ===============================
prompt
create table DWSTG.HZ_CUST_ACCOUNTS
(
  cust_account_id                NUMBER(15) not null,
  party_id                       NUMBER(15),
  last_update_date               DATE,
  account_number                 VARCHAR2(30),
  last_updated_by                NUMBER(15),
  creation_date                  DATE,
  created_by                     NUMBER(15),
  last_update_login              NUMBER(15),
  request_id                     NUMBER(15),
  program_application_id         NUMBER(15),
  program_id                     NUMBER(15),
  program_update_date            DATE,
  wh_update_date                 DATE,
  attribute_category             VARCHAR2(30),
  attribute1                     VARCHAR2(150),
  attribute2                     VARCHAR2(150),
  attribute3                     VARCHAR2(150),
  attribute4                     VARCHAR2(150),
  attribute5                     VARCHAR2(150),
  attribute6                     VARCHAR2(150),
  attribute7                     VARCHAR2(150),
  attribute8                     VARCHAR2(150),
  attribute9                     VARCHAR2(150),
  attribute10                    VARCHAR2(150),
  attribute11                    VARCHAR2(150),
  attribute12                    VARCHAR2(150),
  attribute13                    VARCHAR2(150),
  attribute14                    VARCHAR2(150),
  attribute15                    VARCHAR2(150),
  attribute16                    VARCHAR2(150),
  attribute17                    VARCHAR2(150),
  attribute18                    VARCHAR2(150),
  attribute19                    VARCHAR2(150),
  attribute20                    VARCHAR2(150),
  global_attribute_category      VARCHAR2(30),
  global_attribute1              VARCHAR2(150),
  global_attribute2              VARCHAR2(150),
  global_attribute3              VARCHAR2(150),
  global_attribute4              VARCHAR2(150),
  global_attribute5              VARCHAR2(150),
  global_attribute6              VARCHAR2(150),
  global_attribute7              VARCHAR2(150),
  global_attribute8              VARCHAR2(150),
  global_attribute9              VARCHAR2(150),
  global_attribute10             VARCHAR2(150),
  global_attribute11             VARCHAR2(150),
  global_attribute12             VARCHAR2(150),
  global_attribute13             VARCHAR2(150),
  global_attribute14             VARCHAR2(150),
  global_attribute15             VARCHAR2(150),
  global_attribute16             VARCHAR2(150),
  global_attribute17             VARCHAR2(150),
  global_attribute18             VARCHAR2(150),
  global_attribute19             VARCHAR2(150),
  global_attribute20             VARCHAR2(150),
  orig_system_reference          VARCHAR2(240),
  status                         VARCHAR2(1),
  customer_type                  VARCHAR2(30),
  customer_class_code            VARCHAR2(30),
  primary_salesrep_id            NUMBER(15),
  sales_channel_code             VARCHAR2(30),
  order_type_id                  NUMBER(15),
  price_list_id                  NUMBER(15),
  subcategory_code               VARCHAR2(30),
  tax_code                       VARCHAR2(50),
  fob_point                      VARCHAR2(30),
  freight_term                   VARCHAR2(30),
  ship_partial                   VARCHAR2(1),
  ship_via                       VARCHAR2(30),
  warehouse_id                   NUMBER(15),
  payment_term_id                NUMBER(15),
  tax_header_level_flag          VARCHAR2(1),
  tax_rounding_rule              VARCHAR2(30),
  coterminate_day_month          VARCHAR2(6),
  primary_specialist_id          NUMBER(15),
  secondary_specialist_id        NUMBER(15),
  account_liable_flag            VARCHAR2(1),
  restriction_limit_amount       NUMBER,
  current_balance                NUMBER,
  password_text                  VARCHAR2(60),
  high_priority_indicator        VARCHAR2(1),
  account_established_date       DATE,
  account_termination_date       DATE,
  account_activation_date        DATE,
  credit_classification_code     VARCHAR2(30),
  department                     VARCHAR2(30),
  major_account_number           VARCHAR2(30),
  hotwatch_service_flag          VARCHAR2(1),
  hotwatch_svc_bal_ind           VARCHAR2(30),
  held_bill_expiration_date      DATE,
  hold_bill_flag                 VARCHAR2(1),
  high_priority_remarks          VARCHAR2(80),
  po_effective_date              DATE,
  po_expiration_date             DATE,
  realtime_rate_flag             VARCHAR2(1),
  single_user_flag               VARCHAR2(1),
  watch_account_flag             VARCHAR2(1),
  watch_balance_indicator        VARCHAR2(1),
  geo_code                       VARCHAR2(30),
  acct_life_cycle_status         VARCHAR2(30),
  account_name                   VARCHAR2(240),
  deposit_refund_method          VARCHAR2(20),
  dormant_account_flag           VARCHAR2(1),
  npa_number                     VARCHAR2(60),
  pin_number                     NUMBER(16),
  suspension_date                DATE,
  write_off_adjustment_amount    NUMBER,
  write_off_payment_amount       NUMBER,
  write_off_amount               NUMBER,
  source_code                    VARCHAR2(150),
  competitor_type                VARCHAR2(150),
  comments                       VARCHAR2(240),
  dates_negative_tolerance       NUMBER,
  dates_positive_tolerance       NUMBER,
  date_type_preference           VARCHAR2(20),
  over_shipment_tolerance        NUMBER,
  under_shipment_tolerance       NUMBER,
  over_return_tolerance          NUMBER,
  under_return_tolerance         NUMBER,
  item_cross_ref_pref            VARCHAR2(30),
  ship_sets_include_lines_flag   VARCHAR2(1),
  arrivalsets_include_lines_flag VARCHAR2(1),
  sched_date_push_flag           VARCHAR2(1),
  invoice_quantity_rule          VARCHAR2(30),
  pricing_event                  VARCHAR2(30),
  account_replication_key        NUMBER(15),
  status_update_date             DATE,
  autopay_flag                   VARCHAR2(1),
  notify_flag                    VARCHAR2(1),
  last_batch_id                  NUMBER,
  org_id                         NUMBER(15),
  object_version_number          NUMBER,
  created_by_module              VARCHAR2(150),
  application_id                 NUMBER,
  selling_party_id               NUMBER(15)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.HZ_CUST_ACCOUNTS
  add constraint HZ_CUST_ACCOUNTS_PK primary key (CUST_ACCOUNT_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table HZ_CUST_SITE_USES_ALL
prompt ====================================
prompt
create table DWSTG.HZ_CUST_SITE_USES_ALL
(
  site_use_id                    NUMBER(15) not null,
  cust_acct_site_id              NUMBER(15),
  last_update_date               DATE,
  last_updated_by                NUMBER(15),
  creation_date                  DATE,
  created_by                     NUMBER(15),
  site_use_code                  VARCHAR2(30),
  primary_flag                   VARCHAR2(1),
  status                         VARCHAR2(1),
  location                       VARCHAR2(40),
  last_update_login              NUMBER(15),
  contact_id                     NUMBER(15),
  bill_to_site_use_id            NUMBER(15),
  orig_system_reference          VARCHAR2(240),
  sic_code                       VARCHAR2(30),
  payment_term_id                NUMBER(15),
  gsa_indicator                  VARCHAR2(1),
  ship_partial                   VARCHAR2(1),
  ship_via                       VARCHAR2(30),
  fob_point                      VARCHAR2(30),
  order_type_id                  NUMBER(15),
  price_list_id                  NUMBER(15),
  freight_term                   VARCHAR2(30),
  warehouse_id                   NUMBER(15),
  territory_id                   NUMBER(15),
  attribute_category             VARCHAR2(30),
  attribute1                     VARCHAR2(150),
  attribute2                     VARCHAR2(150),
  attribute3                     VARCHAR2(150),
  attribute4                     VARCHAR2(150),
  attribute5                     VARCHAR2(150),
  attribute6                     VARCHAR2(150),
  attribute7                     VARCHAR2(150),
  attribute8                     VARCHAR2(150),
  attribute9                     VARCHAR2(150),
  attribute10                    VARCHAR2(150),
  request_id                     NUMBER(15),
  program_application_id         NUMBER(15),
  program_id                     NUMBER(15),
  program_update_date            DATE,
  tax_reference                  VARCHAR2(50),
  sort_priority                  NUMBER(5),
  tax_code                       VARCHAR2(50),
  attribute11                    VARCHAR2(150),
  attribute12                    VARCHAR2(150),
  attribute13                    VARCHAR2(150),
  attribute14                    VARCHAR2(150),
  attribute15                    VARCHAR2(150),
  attribute16                    VARCHAR2(150),
  attribute17                    VARCHAR2(150),
  attribute18                    VARCHAR2(150),
  attribute19                    VARCHAR2(150),
  attribute20                    VARCHAR2(150),
  attribute21                    VARCHAR2(150),
  attribute22                    VARCHAR2(150),
  attribute23                    VARCHAR2(150),
  attribute24                    VARCHAR2(150),
  attribute25                    VARCHAR2(150),
  last_accrue_charge_date        DATE,
  second_last_accrue_charge_date DATE,
  last_unaccrue_charge_date      DATE,
  second_last_unaccrue_chrg_date DATE,
  demand_class_code              VARCHAR2(30),
  org_id                         NUMBER(15),
  tax_header_level_flag          VARCHAR2(1),
  tax_rounding_rule              VARCHAR2(30),
  wh_update_date                 DATE,
  global_attribute1              VARCHAR2(150),
  global_attribute2              VARCHAR2(150),
  global_attribute3              VARCHAR2(150),
  global_attribute4              VARCHAR2(150),
  global_attribute5              VARCHAR2(150),
  global_attribute6              VARCHAR2(150),
  global_attribute7              VARCHAR2(150),
  global_attribute8              VARCHAR2(150),
  global_attribute9              VARCHAR2(150),
  global_attribute10             VARCHAR2(150),
  global_attribute11             VARCHAR2(150),
  global_attribute12             VARCHAR2(150),
  global_attribute13             VARCHAR2(150),
  global_attribute14             VARCHAR2(150),
  global_attribute15             VARCHAR2(150),
  global_attribute16             VARCHAR2(150),
  global_attribute17             VARCHAR2(150),
  global_attribute18             VARCHAR2(150),
  global_attribute19             VARCHAR2(150),
  global_attribute20             VARCHAR2(150),
  global_attribute_category      VARCHAR2(30),
  primary_salesrep_id            NUMBER(15),
  finchrg_receivables_trx_id     NUMBER(15),
  dates_negative_tolerance       NUMBER,
  dates_positive_tolerance       NUMBER,
  date_type_preference           VARCHAR2(20),
  over_shipment_tolerance        NUMBER,
  under_shipment_tolerance       NUMBER,
  item_cross_ref_pref            VARCHAR2(30),
  over_return_tolerance          NUMBER,
  under_return_tolerance         NUMBER,
  ship_sets_include_lines_flag   VARCHAR2(1),
  arrivalsets_include_lines_flag VARCHAR2(1),
  sched_date_push_flag           VARCHAR2(1),
  invoice_quantity_rule          VARCHAR2(30),
  pricing_event                  VARCHAR2(30),
  gl_id_rec                      NUMBER(15),
  gl_id_rev                      NUMBER(15),
  gl_id_tax                      NUMBER(15),
  gl_id_freight                  NUMBER(15),
  gl_id_clearing                 NUMBER(15),
  gl_id_unbilled                 NUMBER(15),
  gl_id_unearned                 NUMBER(15),
  gl_id_unpaid_rec               NUMBER(15),
  gl_id_remittance               NUMBER(15),
  gl_id_factor                   NUMBER(15),
  tax_classification             VARCHAR2(30),
  object_version_number          NUMBER,
  created_by_module              VARCHAR2(150),
  application_id                 NUMBER
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DWSTG.HZ_CUST_SITE_USES_ALL_N1 on DWSTG.HZ_CUST_SITE_USES_ALL (CUST_ACCT_SITE_ID)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DWSTG.HZ_CUST_SITE_USES_ALL_N2 on DWSTG.HZ_CUST_SITE_USES_ALL (TERRITORY_ID)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DWSTG.HZ_CUST_SITE_USES_ALL_N4 on DWSTG.HZ_CUST_SITE_USES_ALL (ORG_ID, SITE_USE_CODE)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.HZ_CUST_SITE_USES_ALL
  add constraint PK_HZ_CUST_SITE_USES_ALL primary key (SITE_USE_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MEP_BRAND_DETAIL
prompt ===============================
prompt
create table DWSTG.MEP_BRAND_DETAIL
(
  header_id          NUMBER not null,
  line_id            NUMBER not null,
  entity_code        VARCHAR2(30) not null,
  province_code      VARCHAR2(240) not null,
  brand_type         VARCHAR2(240),
  brand_serial       VARCHAR2(240),
  center_serial      VARCHAR2(240),
  expense_project    VARCHAR2(240),
  expense_account    VARCHAR2(240),
  amount             NUMBER,
  source_type        VARCHAR2(30) not null,
  creation_date      DATE default sysdate not null,
  created_by         NUMBER default -1 not null,
  last_updated_by    NUMBER default -1 not null,
  last_update_date   DATE default sysdate not null,
  last_update_login  NUMBER,
  attribute_category VARCHAR2(30),
  attribute1         VARCHAR2(240),
  attribute2         VARCHAR2(240),
  attribute3         VARCHAR2(240),
  attribute4         VARCHAR2(240),
  attribute5         VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DWSTG.MEP_BRAND_DETAIL
  is '品牌费用台账';
comment on column DWSTG.MEP_BRAND_DETAIL.header_id
  is '头表ID';
comment on column DWSTG.MEP_BRAND_DETAIL.line_id
  is '表ID，主键，供其他表做外键';
comment on column DWSTG.MEP_BRAND_DETAIL.entity_code
  is '销售单位';
comment on column DWSTG.MEP_BRAND_DETAIL.province_code
  is '省份或直辖市 ';
comment on column DWSTG.MEP_BRAND_DETAIL.brand_type
  is '品牌大类';
comment on column DWSTG.MEP_BRAND_DETAIL.brand_serial
  is '品牌系列';
comment on column DWSTG.MEP_BRAND_DETAIL.center_serial
  is '中心系列';
comment on column DWSTG.MEP_BRAND_DETAIL.expense_project
  is '费用项目';
comment on column DWSTG.MEP_BRAND_DETAIL.expense_account
  is '费用科目';
comment on column DWSTG.MEP_BRAND_DETAIL.amount
  is '金额';
comment on column DWSTG.MEP_BRAND_DETAIL.source_type
  is '数据来源,AUTO/MANUAL';
create index DWSTG.MEP_BRAND_DETAIL_N1 on DWSTG.MEP_BRAND_DETAIL (HEADER_ID)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.MEP_BRAND_DETAIL
  add constraint MEP_BRAND_DETAIL_PK primary key (LINE_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MEP_DISCOUNT_NORMAL
prompt ==================================
prompt
create table DWSTG.MEP_DISCOUNT_NORMAL
(
  header_id          NUMBER not null,
  line_id            NUMBER not null,
  item_id            NUMBER not null,
  entity_code        VARCHAR2(30) not null,
  province_code      VARCHAR2(240) not null,
  region_code        VARCHAR2(240) not null,
  city_code          VARCHAR2(240) not null,
  discount_code      VARCHAR2(240),
  amount             NUMBER,
  source_type        VARCHAR2(30) not null,
  creation_date      DATE default sysdate not null,
  created_by         NUMBER default -1 not null,
  last_updated_by    NUMBER default -1 not null,
  last_update_date   DATE default sysdate not null,
  last_update_login  NUMBER,
  attribute_category VARCHAR2(30),
  attribute1         VARCHAR2(240),
  attribute2         VARCHAR2(240),
  attribute3         VARCHAR2(240),
  attribute4         VARCHAR2(240),
  attribute5         VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DWSTG.MEP_DISCOUNT_NORMAL
  is '常规促销费用台账';
comment on column DWSTG.MEP_DISCOUNT_NORMAL.header_id
  is '头表ID';
comment on column DWSTG.MEP_DISCOUNT_NORMAL.line_id
  is '表ID，主键，供其他表做外键';
comment on column DWSTG.MEP_DISCOUNT_NORMAL.item_id
  is '产品ID';
comment on column DWSTG.MEP_DISCOUNT_NORMAL.entity_code
  is '销售单位';
comment on column DWSTG.MEP_DISCOUNT_NORMAL.province_code
  is '省份或直辖市 ';
comment on column DWSTG.MEP_DISCOUNT_NORMAL.region_code
  is '片区';
comment on column DWSTG.MEP_DISCOUNT_NORMAL.city_code
  is '城市大区';
comment on column DWSTG.MEP_DISCOUNT_NORMAL.discount_code
  is '促销费用二级活动形式';
comment on column DWSTG.MEP_DISCOUNT_NORMAL.amount
  is '金额';
comment on column DWSTG.MEP_DISCOUNT_NORMAL.source_type
  is '数据来源,AUTO/MANUAL';
create index DWSTG.MEP_DISCOUNT_NORMAL_N1 on DWSTG.MEP_DISCOUNT_NORMAL (HEADER_ID)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.MEP_DISCOUNT_NORMAL
  add constraint MEP_DISCOUNT_NORMAL_PK primary key (LINE_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MEP_DISCOUNT_SPECIAL
prompt ===================================
prompt
create table DWSTG.MEP_DISCOUNT_SPECIAL
(
  header_id          NUMBER not null,
  line_id            NUMBER not null,
  item_id            NUMBER not null,
  entity_code        VARCHAR2(30) not null,
  province_code      VARCHAR2(240) not null,
  region_code        VARCHAR2(240) not null,
  city_code          VARCHAR2(240) not null,
  discount_code      VARCHAR2(240),
  amount             NUMBER,
  source_type        VARCHAR2(30) not null,
  creation_date      DATE default sysdate not null,
  created_by         NUMBER default -1 not null,
  last_updated_by    NUMBER default -1 not null,
  last_update_date   DATE default sysdate not null,
  last_update_login  NUMBER,
  attribute_category VARCHAR2(30),
  attribute1         VARCHAR2(240),
  attribute2         VARCHAR2(240),
  attribute3         VARCHAR2(240),
  attribute4         VARCHAR2(240),
  attribute5         VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DWSTG.MEP_DISCOUNT_SPECIAL
  is '专项促销费用台账';
comment on column DWSTG.MEP_DISCOUNT_SPECIAL.header_id
  is '头表ID';
comment on column DWSTG.MEP_DISCOUNT_SPECIAL.line_id
  is '表ID，主键，供其他表做外键';
comment on column DWSTG.MEP_DISCOUNT_SPECIAL.item_id
  is '产品ID';
comment on column DWSTG.MEP_DISCOUNT_SPECIAL.entity_code
  is '销售单位';
comment on column DWSTG.MEP_DISCOUNT_SPECIAL.province_code
  is '省份或直辖市 ';
comment on column DWSTG.MEP_DISCOUNT_SPECIAL.region_code
  is '片区';
comment on column DWSTG.MEP_DISCOUNT_SPECIAL.city_code
  is '城市大区';
comment on column DWSTG.MEP_DISCOUNT_SPECIAL.discount_code
  is '促销费用二级活动形式';
comment on column DWSTG.MEP_DISCOUNT_SPECIAL.amount
  is '金额';
comment on column DWSTG.MEP_DISCOUNT_SPECIAL.source_type
  is '数据来源,AUTO/MANUAL';
create index DWSTG.MEP_DISCOUNT_SPECIAL_N1 on DWSTG.MEP_DISCOUNT_SPECIAL (HEADER_ID)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.MEP_DISCOUNT_SPECIAL
  add constraint MEP_DISCOUNT_SPECIAL_PK primary key (LINE_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MEP_PROJECT_DETAIL
prompt =================================
prompt
create table DWSTG.MEP_PROJECT_DETAIL
(
  header_id          NUMBER not null,
  line_id            NUMBER not null,
  entity_code        VARCHAR2(30) not null,
  province_code      VARCHAR2(240) not null,
  region_code        VARCHAR2(240) not null,
  city_code          VARCHAR2(240) not null,
  expense_project    VARCHAR2(240),
  expense_account    VARCHAR2(240),
  amount             NUMBER,
  source_type        VARCHAR2(30) not null,
  creation_date      DATE default sysdate not null,
  created_by         NUMBER default -1 not null,
  last_updated_by    NUMBER default -1 not null,
  last_update_date   DATE default sysdate not null,
  last_update_login  NUMBER,
  attribute_category VARCHAR2(30),
  attribute1         VARCHAR2(240),
  attribute2         VARCHAR2(240),
  attribute3         VARCHAR2(240),
  attribute4         VARCHAR2(240),
  attribute5         VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DWSTG.MEP_PROJECT_DETAIL
  is '运行费用项目明细';
comment on column DWSTG.MEP_PROJECT_DETAIL.header_id
  is '头表ID';
comment on column DWSTG.MEP_PROJECT_DETAIL.line_id
  is '表ID，主键，供其他表做外键';
comment on column DWSTG.MEP_PROJECT_DETAIL.entity_code
  is '销售单位';
comment on column DWSTG.MEP_PROJECT_DETAIL.province_code
  is '省份或直辖市 ';
comment on column DWSTG.MEP_PROJECT_DETAIL.region_code
  is '片区';
comment on column DWSTG.MEP_PROJECT_DETAIL.city_code
  is '城市大区';
comment on column DWSTG.MEP_PROJECT_DETAIL.expense_project
  is '费用项目';
comment on column DWSTG.MEP_PROJECT_DETAIL.expense_account
  is '费用科目';
comment on column DWSTG.MEP_PROJECT_DETAIL.amount
  is '金额';
comment on column DWSTG.MEP_PROJECT_DETAIL.source_type
  is '数据来源,AUTO/MANUAL';
create index DWSTG.MEP_PROJECT_DETAIL_N1 on DWSTG.MEP_PROJECT_DETAIL (HEADER_ID)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.MEP_PROJECT_DETAIL
  add constraint MEP_PROJECT_DETAIL_PK primary key (LINE_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MTL_CATEGORIES_B
prompt ===============================
prompt
create table DWSTG.MTL_CATEGORIES_B
(
  category_id            NUMBER not null,
  structure_id           NUMBER not null,
  description            VARCHAR2(240),
  disable_date           DATE,
  segment1               VARCHAR2(40),
  segment2               VARCHAR2(40),
  segment3               VARCHAR2(40),
  segment4               VARCHAR2(40),
  segment5               VARCHAR2(40),
  segment6               VARCHAR2(40),
  segment7               VARCHAR2(40),
  segment8               VARCHAR2(40),
  segment9               VARCHAR2(40),
  segment10              VARCHAR2(40),
  segment11              VARCHAR2(40),
  segment12              VARCHAR2(40),
  segment13              VARCHAR2(40),
  segment14              VARCHAR2(40),
  segment15              VARCHAR2(40),
  segment16              VARCHAR2(40),
  segment17              VARCHAR2(40),
  segment18              VARCHAR2(40),
  segment19              VARCHAR2(40),
  segment20              VARCHAR2(40),
  summary_flag           VARCHAR2(1) not null,
  enabled_flag           VARCHAR2(1) not null,
  start_date_active      DATE,
  end_date_active        DATE,
  attribute_category     VARCHAR2(30),
  attribute1             VARCHAR2(150),
  attribute2             VARCHAR2(150),
  attribute3             VARCHAR2(150),
  attribute4             VARCHAR2(150),
  attribute5             VARCHAR2(150),
  attribute6             VARCHAR2(150),
  attribute7             VARCHAR2(150),
  attribute8             VARCHAR2(150),
  attribute9             VARCHAR2(150),
  attribute10            VARCHAR2(150),
  attribute11            VARCHAR2(150),
  attribute12            VARCHAR2(150),
  attribute13            VARCHAR2(150),
  attribute14            VARCHAR2(150),
  attribute15            VARCHAR2(150),
  last_update_date       DATE not null,
  last_updated_by        NUMBER not null,
  creation_date          DATE not null,
  created_by             NUMBER not null,
  last_update_login      NUMBER,
  request_id             NUMBER,
  program_application_id NUMBER,
  program_id             NUMBER,
  program_update_date    DATE,
  web_status             VARCHAR2(30),
  supplier_enabled_flag  VARCHAR2(1)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.MTL_CATEGORIES_B
  add constraint MTL_CATEGORIES_B_PK primary key (CATEGORY_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MTL_ITEM_CATEGORIES
prompt ==================================
prompt
create table DWSTG.MTL_ITEM_CATEGORIES
(
  inventory_item_id      NUMBER not null,
  organization_id        NUMBER not null,
  category_set_id        NUMBER not null,
  category_id            NUMBER not null,
  last_update_date       DATE not null,
  last_updated_by        NUMBER not null,
  creation_date          DATE not null,
  created_by             NUMBER not null,
  last_update_login      NUMBER,
  request_id             NUMBER,
  program_application_id NUMBER,
  program_id             NUMBER,
  program_update_date    DATE,
  wh_update_date         DATE
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.MTL_ITEM_CATEGORIES
  add constraint MTL_ITEM_CATEGORIES_PK unique (ORGANIZATION_ID, CATEGORY_SET_ID, CATEGORY_ID, INVENTORY_ITEM_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MTL_SYSTEM_ITEMS_B
prompt =================================
prompt
create table DWSTG.MTL_SYSTEM_ITEMS_B
(
  inventory_item_id              NUMBER not null,
  organization_id                NUMBER not null,
  last_update_date               DATE not null,
  last_updated_by                NUMBER not null,
  creation_date                  DATE not null,
  created_by                     NUMBER not null,
  last_update_login              NUMBER,
  summary_flag                   VARCHAR2(1) not null,
  enabled_flag                   VARCHAR2(1) not null,
  start_date_active              DATE,
  end_date_active                DATE,
  description                    VARCHAR2(240),
  buyer_id                       NUMBER(9),
  accounting_rule_id             NUMBER,
  invoicing_rule_id              NUMBER,
  segment1                       VARCHAR2(40),
  segment2                       VARCHAR2(40),
  segment3                       VARCHAR2(40),
  segment4                       VARCHAR2(40),
  segment5                       VARCHAR2(40),
  segment6                       VARCHAR2(40),
  segment7                       VARCHAR2(40),
  segment8                       VARCHAR2(40),
  segment9                       VARCHAR2(40),
  segment10                      VARCHAR2(40),
  segment11                      VARCHAR2(40),
  segment12                      VARCHAR2(40),
  segment13                      VARCHAR2(40),
  segment14                      VARCHAR2(40),
  segment15                      VARCHAR2(40),
  segment16                      VARCHAR2(40),
  segment17                      VARCHAR2(40),
  segment18                      VARCHAR2(40),
  segment19                      VARCHAR2(40),
  segment20                      VARCHAR2(40),
  attribute_category             VARCHAR2(30),
  attribute1                     VARCHAR2(150),
  attribute2                     VARCHAR2(150),
  attribute3                     VARCHAR2(150),
  attribute4                     VARCHAR2(150),
  attribute5                     VARCHAR2(150),
  attribute6                     VARCHAR2(150),
  attribute7                     VARCHAR2(150),
  attribute8                     VARCHAR2(150),
  attribute9                     VARCHAR2(150),
  attribute10                    VARCHAR2(150),
  attribute11                    VARCHAR2(150),
  attribute12                    VARCHAR2(150),
  attribute13                    VARCHAR2(150),
  attribute14                    VARCHAR2(150),
  attribute15                    VARCHAR2(150),
  purchasing_item_flag           VARCHAR2(1) not null,
  shippable_item_flag            VARCHAR2(1) not null,
  customer_order_flag            VARCHAR2(1) not null,
  internal_order_flag            VARCHAR2(1) not null,
  service_item_flag              VARCHAR2(1) not null,
  inventory_item_flag            VARCHAR2(1) not null,
  eng_item_flag                  VARCHAR2(1) not null,
  inventory_asset_flag           VARCHAR2(1) not null,
  purchasing_enabled_flag        VARCHAR2(1) not null,
  customer_order_enabled_flag    VARCHAR2(1) not null,
  internal_order_enabled_flag    VARCHAR2(1) not null,
  so_transactions_flag           VARCHAR2(1) not null,
  mtl_transactions_enabled_flag  VARCHAR2(1) not null,
  stock_enabled_flag             VARCHAR2(1) not null,
  bom_enabled_flag               VARCHAR2(1) not null,
  build_in_wip_flag              VARCHAR2(1) not null,
  revision_qty_control_code      NUMBER,
  item_catalog_group_id          NUMBER,
  catalog_status_flag            VARCHAR2(1),
  returnable_flag                VARCHAR2(1),
  default_shipping_org           NUMBER,
  collateral_flag                VARCHAR2(1),
  taxable_flag                   VARCHAR2(1),
  qty_rcv_exception_code         VARCHAR2(25),
  allow_item_desc_update_flag    VARCHAR2(1),
  inspection_required_flag       VARCHAR2(1),
  receipt_required_flag          VARCHAR2(1),
  market_price                   NUMBER,
  hazard_class_id                NUMBER,
  rfq_required_flag              VARCHAR2(1),
  qty_rcv_tolerance              NUMBER,
  list_price_per_unit            NUMBER,
  un_number_id                   NUMBER,
  price_tolerance_percent        NUMBER,
  asset_category_id              NUMBER,
  rounding_factor                NUMBER,
  unit_of_issue                  VARCHAR2(25),
  enforce_ship_to_location_code  VARCHAR2(25),
  allow_substitute_receipts_flag VARCHAR2(1),
  allow_unordered_receipts_flag  VARCHAR2(1),
  allow_express_delivery_flag    VARCHAR2(1),
  days_early_receipt_allowed     NUMBER,
  days_late_receipt_allowed      NUMBER,
  receipt_days_exception_code    VARCHAR2(25),
  receiving_routing_id           NUMBER,
  invoice_close_tolerance        NUMBER,
  receive_close_tolerance        NUMBER,
  auto_lot_alpha_prefix          VARCHAR2(30),
  start_auto_lot_number          VARCHAR2(30),
  lot_control_code               NUMBER,
  shelf_life_code                NUMBER,
  shelf_life_days                NUMBER,
  serial_number_control_code     NUMBER,
  start_auto_serial_number       VARCHAR2(30),
  auto_serial_alpha_prefix       VARCHAR2(30),
  source_type                    NUMBER,
  source_organization_id         NUMBER,
  source_subinventory            VARCHAR2(10),
  expense_account                NUMBER,
  encumbrance_account            NUMBER,
  restrict_subinventories_code   NUMBER,
  unit_weight                    NUMBER,
  weight_uom_code                VARCHAR2(3),
  volume_uom_code                VARCHAR2(3),
  unit_volume                    NUMBER,
  restrict_locators_code         NUMBER,
  location_control_code          NUMBER,
  shrinkage_rate                 NUMBER,
  acceptable_early_days          NUMBER,
  planning_time_fence_code       NUMBER,
  demand_time_fence_code         NUMBER,
  lead_time_lot_size             NUMBER,
  std_lot_size                   NUMBER,
  cum_manufacturing_lead_time    NUMBER,
  overrun_percentage             NUMBER,
  mrp_calculate_atp_flag         VARCHAR2(1),
  acceptable_rate_increase       NUMBER,
  acceptable_rate_decrease       NUMBER,
  cumulative_total_lead_time     NUMBER,
  planning_time_fence_days       NUMBER,
  demand_time_fence_days         NUMBER,
  end_assembly_pegging_flag      VARCHAR2(1),
  repetitive_planning_flag       VARCHAR2(1),
  planning_exception_set         VARCHAR2(10),
  bom_item_type                  NUMBER not null,
  pick_components_flag           VARCHAR2(1) not null,
  replenish_to_order_flag        VARCHAR2(1) not null,
  base_item_id                   NUMBER,
  atp_components_flag            VARCHAR2(1) not null,
  atp_flag                       VARCHAR2(1) not null,
  fixed_lead_time                NUMBER,
  variable_lead_time             NUMBER,
  wip_supply_locator_id          NUMBER,
  wip_supply_type                NUMBER,
  wip_supply_subinventory        VARCHAR2(10),
  primary_uom_code               VARCHAR2(3),
  primary_unit_of_measure        VARCHAR2(25),
  allowed_units_lookup_code      NUMBER,
  cost_of_sales_account          NUMBER,
  sales_account                  NUMBER,
  default_include_in_rollup_flag VARCHAR2(1),
  inventory_item_status_code     VARCHAR2(10) not null,
  inventory_planning_code        NUMBER,
  planner_code                   VARCHAR2(10),
  planning_make_buy_code         NUMBER,
  fixed_lot_multiplier           NUMBER,
  rounding_control_type          NUMBER,
  carrying_cost                  NUMBER,
  postprocessing_lead_time       NUMBER,
  preprocessing_lead_time        NUMBER,
  full_lead_time                 NUMBER,
  order_cost                     NUMBER,
  mrp_safety_stock_percent       NUMBER,
  mrp_safety_stock_code          NUMBER,
  min_minmax_quantity            NUMBER,
  max_minmax_quantity            NUMBER,
  minimum_order_quantity         NUMBER,
  fixed_order_quantity           NUMBER,
  fixed_days_supply              NUMBER,
  maximum_order_quantity         NUMBER,
  atp_rule_id                    NUMBER,
  picking_rule_id                NUMBER,
  reservable_type                NUMBER,
  positive_measurement_error     NUMBER,
  negative_measurement_error     NUMBER,
  engineering_ecn_code           VARCHAR2(50),
  engineering_item_id            NUMBER,
  engineering_date               DATE,
  service_starting_delay         NUMBER,
  vendor_warranty_flag           VARCHAR2(1) not null,
  serviceable_component_flag     VARCHAR2(1),
  serviceable_product_flag       VARCHAR2(1) not null,
  base_warranty_service_id       NUMBER,
  payment_terms_id               NUMBER,
  preventive_maintenance_flag    VARCHAR2(1),
  primary_specialist_id          NUMBER,
  secondary_specialist_id        NUMBER,
  serviceable_item_class_id      NUMBER,
  time_billable_flag             VARCHAR2(1),
  material_billable_flag         VARCHAR2(30),
  expense_billable_flag          VARCHAR2(1),
  prorate_service_flag           VARCHAR2(1),
  coverage_schedule_id           NUMBER,
  service_duration_period_code   VARCHAR2(10),
  service_duration               NUMBER,
  warranty_vendor_id             NUMBER,
  max_warranty_amount            NUMBER,
  response_time_period_code      VARCHAR2(30),
  response_time_value            NUMBER,
  new_revision_code              VARCHAR2(30),
  invoiceable_item_flag          VARCHAR2(1) not null,
  tax_code                       VARCHAR2(50),
  invoice_enabled_flag           VARCHAR2(1) not null,
  must_use_approved_vendor_flag  VARCHAR2(1) not null,
  request_id                     NUMBER,
  program_application_id         NUMBER,
  program_id                     NUMBER,
  program_update_date            DATE,
  outside_operation_flag         VARCHAR2(1) not null,
  outside_operation_uom_type     VARCHAR2(25),
  safety_stock_bucket_days       NUMBER,
  auto_reduce_mps                NUMBER(22),
  costing_enabled_flag           VARCHAR2(1) not null,
  auto_created_config_flag       VARCHAR2(1) not null,
  cycle_count_enabled_flag       VARCHAR2(1) not null,
  item_type                      VARCHAR2(30),
  model_config_clause_name       VARCHAR2(10),
  ship_model_complete_flag       VARCHAR2(1),
  mrp_planning_code              NUMBER,
  return_inspection_requirement  NUMBER,
  ato_forecast_control           NUMBER,
  release_time_fence_code        NUMBER,
  release_time_fence_days        NUMBER,
  container_item_flag            VARCHAR2(1),
  vehicle_item_flag              VARCHAR2(1),
  maximum_load_weight            NUMBER,
  minimum_fill_percent           NUMBER,
  container_type_code            VARCHAR2(30),
  internal_volume                NUMBER,
  wh_update_date                 DATE,
  product_family_item_id         NUMBER,
  global_attribute_category      VARCHAR2(150),
  global_attribute1              VARCHAR2(150),
  global_attribute2              VARCHAR2(150),
  global_attribute3              VARCHAR2(150),
  global_attribute4              VARCHAR2(150),
  global_attribute5              VARCHAR2(150),
  global_attribute6              VARCHAR2(150),
  global_attribute7              VARCHAR2(150),
  global_attribute8              VARCHAR2(150),
  global_attribute9              VARCHAR2(150),
  global_attribute10             VARCHAR2(150),
  purchasing_tax_code            VARCHAR2(50),
  overcompletion_tolerance_type  NUMBER,
  overcompletion_tolerance_value NUMBER,
  effectivity_control            NUMBER,
  check_shortages_flag           VARCHAR2(1),
  over_shipment_tolerance        NUMBER,
  under_shipment_tolerance       NUMBER,
  over_return_tolerance          NUMBER,
  under_return_tolerance         NUMBER,
  equipment_type                 NUMBER,
  recovered_part_disp_code       VARCHAR2(30),
  defect_tracking_on_flag        VARCHAR2(1),
  usage_item_flag                VARCHAR2(1),
  event_flag                     VARCHAR2(1),
  electronic_flag                VARCHAR2(1),
  downloadable_flag              VARCHAR2(1),
  vol_discount_exempt_flag       VARCHAR2(1),
  coupon_exempt_flag             VARCHAR2(1),
  comms_nl_trackable_flag        VARCHAR2(1),
  asset_creation_code            VARCHAR2(30),
  comms_activation_reqd_flag     VARCHAR2(1),
  orderable_on_web_flag          VARCHAR2(1),
  back_orderable_flag            VARCHAR2(1),
  web_status                     VARCHAR2(30),
  indivisible_flag               VARCHAR2(1),
  dimension_uom_code             VARCHAR2(3),
  unit_length                    NUMBER,
  unit_width                     NUMBER,
  unit_height                    NUMBER,
  bulk_picked_flag               VARCHAR2(1),
  lot_status_enabled             VARCHAR2(1),
  default_lot_status_id          NUMBER,
  serial_status_enabled          VARCHAR2(1),
  default_serial_status_id       NUMBER,
  lot_split_enabled              VARCHAR2(1),
  lot_merge_enabled              VARCHAR2(1),
  inventory_carry_penalty        NUMBER,
  operation_slack_penalty        NUMBER,
  financing_allowed_flag         VARCHAR2(1),
  eam_item_type                  NUMBER,
  eam_activity_type_code         VARCHAR2(30),
  eam_activity_cause_code        VARCHAR2(30),
  eam_act_notification_flag      VARCHAR2(1),
  eam_act_shutdown_status        VARCHAR2(30),
  dual_uom_control               NUMBER,
  secondary_uom_code             VARCHAR2(3),
  dual_uom_deviation_high        NUMBER,
  dual_uom_deviation_low         NUMBER,
  contract_item_type_code        VARCHAR2(30),
  subscription_depend_flag       VARCHAR2(1),
  serv_req_enabled_code          VARCHAR2(30),
  serv_billing_enabled_flag      VARCHAR2(1),
  serv_importance_level          NUMBER,
  planned_inv_point_flag         VARCHAR2(1),
  lot_translate_enabled          VARCHAR2(1),
  default_so_source_type         VARCHAR2(30) not null,
  create_supply_flag             VARCHAR2(1) not null,
  substitution_window_code       NUMBER,
  substitution_window_days       NUMBER,
  ib_item_instance_class         VARCHAR2(30),
  config_model_type              VARCHAR2(30),
  lot_substitution_enabled       VARCHAR2(1),
  minimum_license_quantity       NUMBER,
  eam_activity_source_code       VARCHAR2(30),
  lifecycle_id                   NUMBER,
  current_phase_id               NUMBER,
  object_version_number          NUMBER(9)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DWSTG.MTL_SYSTEM_ITEMS_B_N1 on DWSTG.MTL_SYSTEM_ITEMS_B (LAST_UPDATE_DATE, ORGANIZATION_ID)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DWSTG.MTL_SYSTEM_ITEMS_B_N2 on DWSTG.MTL_SYSTEM_ITEMS_B (ORGANIZATION_ID, SEGMENT1)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 11
  maxtrans 255
  storage
  (
    initial 16K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.MTL_SYSTEM_ITEMS_B
  add constraint MTL_SYSTEM_ITEMS_B_PK primary key (INVENTORY_ITEM_ID, ORGANIZATION_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table OFA_CST_ACTUAL
prompt =============================
prompt
create table DWSTG.OFA_CST_ACTUAL
(
  cst_element_d   VARCHAR2(5) not null,
  cst_brand_d     VARCHAR2(10) not null,
  cst_size_d      VARCHAR2(10) not null,
  cst_com_d       VARCHAR2(10) not null,
  cst_container_d VARCHAR2(10) not null,
  cst_package_d   VARCHAR2(10) not null,
  cst_density_d   VARCHAR2(5) not null,
  gl_time1        VARCHAR2(20) not null,
  ytd_qty         NUMBER,
  ytd_amt         NUMBER,
  creation_date   DATE,
  created_from    VARCHAR2(20)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.OFA_CST_ACTUAL
  add primary key (CST_ELEMENT_D, CST_BRAND_D, CST_SIZE_D, CST_COM_D, CST_CONTAINER_D, CST_PACKAGE_D, CST_DENSITY_D, GL_TIME1)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PER_ALL_PEOPLE_F
prompt ===============================
prompt
create table DWSTG.PER_ALL_PEOPLE_F
(
  person_id                     NUMBER(10),
  effective_start_date          DATE,
  effective_end_date            DATE,
  business_group_id             NUMBER(15),
  person_type_id                NUMBER(15),
  last_name                     VARCHAR2(150),
  start_date                    DATE,
  applicant_number              VARCHAR2(30),
  background_check_status       VARCHAR2(30),
  background_date_check         DATE,
  blood_type                    VARCHAR2(30),
  comment_id                    NUMBER(15),
  correspondence_language       VARCHAR2(30),
  current_applicant_flag        VARCHAR2(30),
  current_emp_or_apl_flag       VARCHAR2(30),
  current_employee_flag         VARCHAR2(30),
  date_employee_data_verified   DATE,
  date_of_birth                 DATE,
  email_address                 VARCHAR2(240),
  employee_number               VARCHAR2(30),
  expense_check_send_to_address VARCHAR2(30),
  fast_path_employee            VARCHAR2(30),
  first_name                    VARCHAR2(150),
  fte_capacity                  NUMBER(5,2),
  full_name                     VARCHAR2(240),
  hold_applicant_date_until     DATE,
  honors                        VARCHAR2(45),
  internal_location             VARCHAR2(45),
  known_as                      VARCHAR2(80),
  last_medical_test_by          VARCHAR2(60),
  last_medical_test_date        DATE,
  mailstop                      VARCHAR2(45),
  marital_status                VARCHAR2(30),
  middle_names                  VARCHAR2(60),
  nationality                   VARCHAR2(30),
  national_identifier           VARCHAR2(30),
  office_number                 VARCHAR2(45),
  on_military_service           VARCHAR2(30),
  order_name                    VARCHAR2(240),
  pre_name_adjunct              VARCHAR2(30),
  previous_last_name            VARCHAR2(150),
  projected_start_date          DATE,
  rehire_authorizor             VARCHAR2(30),
  rehire_reason                 VARCHAR2(60),
  rehire_recommendation         VARCHAR2(30),
  resume_exists                 VARCHAR2(30),
  resume_last_updated           DATE,
  registered_disabled_flag      VARCHAR2(30),
  second_passport_exists        VARCHAR2(30),
  sex                           VARCHAR2(30),
  student_status                VARCHAR2(30),
  suffix                        VARCHAR2(30),
  title                         VARCHAR2(30),
  vendor_id                     NUMBER(15),
  work_schedule                 VARCHAR2(30),
  work_telephone                VARCHAR2(60),
  coord_ben_med_pln_no          VARCHAR2(30),
  coord_ben_no_cvg_flag         VARCHAR2(30),
  dpdnt_adoption_date           DATE,
  dpdnt_vlntry_svce_flag        VARCHAR2(30),
  receipt_of_death_cert_date    DATE,
  uses_tobacco_flag             VARCHAR2(30),
  benefit_group_id              NUMBER(15),
  request_id                    NUMBER(15),
  program_application_id        NUMBER(15),
  program_id                    NUMBER(15),
  program_update_date           DATE,
  attribute_category            VARCHAR2(30),
  attribute1                    VARCHAR2(150),
  attribute2                    VARCHAR2(150),
  attribute3                    VARCHAR2(150),
  attribute4                    VARCHAR2(150),
  attribute5                    VARCHAR2(150),
  attribute6                    VARCHAR2(150),
  attribute7                    VARCHAR2(150),
  attribute8                    VARCHAR2(150),
  attribute9                    VARCHAR2(150),
  attribute10                   VARCHAR2(150),
  attribute11                   VARCHAR2(150),
  attribute12                   VARCHAR2(150),
  attribute13                   VARCHAR2(150),
  attribute14                   VARCHAR2(150),
  attribute15                   VARCHAR2(150),
  attribute16                   VARCHAR2(150),
  attribute17                   VARCHAR2(150),
  attribute18                   VARCHAR2(150),
  attribute19                   VARCHAR2(150),
  attribute20                   VARCHAR2(150),
  attribute21                   VARCHAR2(150),
  attribute22                   VARCHAR2(150),
  attribute23                   VARCHAR2(150),
  attribute24                   VARCHAR2(150),
  attribute25                   VARCHAR2(150),
  attribute26                   VARCHAR2(150),
  attribute27                   VARCHAR2(150),
  attribute28                   VARCHAR2(150),
  attribute29                   VARCHAR2(150),
  attribute30                   VARCHAR2(150),
  last_update_date              DATE,
  last_updated_by               NUMBER(15),
  last_update_login             NUMBER(15),
  created_by                    NUMBER(15),
  creation_date                 DATE,
  per_information_category      VARCHAR2(30),
  per_information1              VARCHAR2(150),
  per_information2              VARCHAR2(150),
  per_information3              VARCHAR2(150),
  per_information4              VARCHAR2(150),
  per_information5              VARCHAR2(150),
  per_information6              VARCHAR2(150),
  per_information7              VARCHAR2(150),
  per_information8              VARCHAR2(150),
  per_information9              VARCHAR2(150),
  per_information10             VARCHAR2(150),
  per_information11             VARCHAR2(150),
  per_information12             VARCHAR2(150),
  per_information13             VARCHAR2(150),
  per_information14             VARCHAR2(150),
  per_information15             VARCHAR2(150),
  per_information16             VARCHAR2(150),
  per_information17             VARCHAR2(150),
  per_information18             VARCHAR2(150),
  per_information19             VARCHAR2(150),
  per_information20             VARCHAR2(150),
  per_information21             VARCHAR2(150),
  per_information22             VARCHAR2(150),
  per_information23             VARCHAR2(150),
  per_information24             VARCHAR2(150),
  per_information25             VARCHAR2(150),
  per_information26             VARCHAR2(150),
  per_information27             VARCHAR2(150),
  per_information28             VARCHAR2(150),
  per_information29             VARCHAR2(150),
  per_information30             VARCHAR2(150),
  object_version_number         NUMBER(9),
  date_of_death                 DATE,
  original_date_of_hire         DATE,
  town_of_birth                 VARCHAR2(90),
  region_of_birth               VARCHAR2(90),
  country_of_birth              VARCHAR2(90),
  global_person_id              VARCHAR2(30),
  coord_ben_med_pl_name         VARCHAR2(80),
  coord_ben_med_insr_crr_name   VARCHAR2(80),
  coord_ben_med_insr_crr_ident  VARCHAR2(80),
  coord_ben_med_ext_er          VARCHAR2(80),
  coord_ben_med_cvg_strt_dt     DATE,
  coord_ben_med_cvg_end_dt      DATE,
  party_id                      NUMBER(15),
  npw_number                    VARCHAR2(30),
  current_npw_flag              VARCHAR2(30),
  global_name                   VARCHAR2(240),
  local_name                    VARCHAR2(240)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DWSTG.PER_ALL_PEOPLE_F_N1 on DWSTG.PER_ALL_PEOPLE_F (PERSON_ID, EFFECTIVE_START_DATE, EFFECTIVE_END_DATE)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DWSTG.PER_ALL_PEOPLE_F_N2 on DWSTG.PER_ALL_PEOPLE_F (EMPLOYEE_NUMBER)
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PO_VENDORS
prompt =========================
prompt
create table DWSTG.PO_VENDORS
(
  vendor_id                      NUMBER not null,
  last_update_date               DATE,
  last_updated_by                NUMBER,
  vendor_name                    VARCHAR2(240),
  vendor_name_alt                VARCHAR2(320),
  segment1                       VARCHAR2(30),
  summary_flag                   VARCHAR2(1),
  enabled_flag                   VARCHAR2(1),
  segment2                       VARCHAR2(30),
  segment3                       VARCHAR2(30),
  segment4                       VARCHAR2(30),
  segment5                       VARCHAR2(30),
  last_update_login              NUMBER,
  creation_date                  DATE,
  created_by                     NUMBER,
  employee_id                    NUMBER,
  vendor_type_lookup_code        VARCHAR2(30),
  customer_num                   VARCHAR2(25),
  one_time_flag                  VARCHAR2(1),
  parent_vendor_id               NUMBER,
  min_order_amount               NUMBER,
  ship_to_location_id            NUMBER,
  bill_to_location_id            NUMBER,
  ship_via_lookup_code           VARCHAR2(25),
  freight_terms_lookup_code      VARCHAR2(25),
  fob_lookup_code                VARCHAR2(25),
  terms_id                       NUMBER,
  set_of_books_id                NUMBER,
  credit_status_lookup_code      VARCHAR2(25),
  credit_limit                   NUMBER,
  always_take_disc_flag          VARCHAR2(1),
  pay_date_basis_lookup_code     VARCHAR2(25),
  pay_group_lookup_code          VARCHAR2(25),
  payment_priority               NUMBER,
  invoice_currency_code          VARCHAR2(15),
  payment_currency_code          VARCHAR2(15),
  invoice_amount_limit           NUMBER,
  exchange_date_lookup_code      VARCHAR2(25),
  hold_all_payments_flag         VARCHAR2(1),
  hold_future_payments_flag      VARCHAR2(1),
  hold_reason                    VARCHAR2(240),
  distribution_set_id            NUMBER,
  accts_pay_code_combination_id  NUMBER,
  disc_lost_code_combination_id  NUMBER,
  disc_taken_code_combination_id NUMBER,
  expense_code_combination_id    NUMBER,
  prepay_code_combination_id     NUMBER,
  num_1099                       VARCHAR2(30),
  type_1099                      VARCHAR2(10),
  withholding_status_lookup_code VARCHAR2(25),
  withholding_start_date         DATE,
  organization_type_lookup_code  VARCHAR2(25),
  vat_code                       VARCHAR2(15),
  start_date_active              DATE,
  end_date_active                DATE,
  minority_group_lookup_code     VARCHAR2(25),
  payment_method_lookup_code     VARCHAR2(25),
  bank_account_name              VARCHAR2(80),
  bank_account_num               VARCHAR2(30),
  bank_num                       VARCHAR2(25),
  bank_account_type              VARCHAR2(25),
  women_owned_flag               VARCHAR2(1),
  small_business_flag            VARCHAR2(1),
  standard_industry_class        VARCHAR2(25),
  hold_flag                      VARCHAR2(1),
  purchasing_hold_reason         VARCHAR2(240),
  hold_by                        NUMBER(9),
  hold_date                      DATE,
  terms_date_basis               VARCHAR2(25),
  price_tolerance                NUMBER,
  inspection_required_flag       VARCHAR2(1),
  receipt_required_flag          VARCHAR2(1),
  qty_rcv_tolerance              NUMBER,
  qty_rcv_exception_code         VARCHAR2(25),
  enforce_ship_to_location_code  VARCHAR2(25),
  days_early_receipt_allowed     NUMBER,
  days_late_receipt_allowed      NUMBER,
  receipt_days_exception_code    VARCHAR2(25),
  receiving_routing_id           NUMBER,
  allow_substitute_receipts_flag VARCHAR2(1),
  allow_unordered_receipts_flag  VARCHAR2(1),
  hold_unmatched_invoices_flag   VARCHAR2(1),
  exclusive_payment_flag         VARCHAR2(1),
  ap_tax_rounding_rule           VARCHAR2(1),
  auto_tax_calc_flag             VARCHAR2(1),
  auto_tax_calc_override         VARCHAR2(1),
  amount_includes_tax_flag       VARCHAR2(1),
  tax_verification_date          DATE,
  name_control                   VARCHAR2(4),
  state_reportable_flag          VARCHAR2(1),
  federal_reportable_flag        VARCHAR2(1),
  attribute_category             VARCHAR2(30),
  attribute1                     VARCHAR2(150),
  attribute2                     VARCHAR2(150),
  attribute3                     VARCHAR2(150),
  attribute4                     VARCHAR2(150),
  attribute5                     VARCHAR2(150),
  attribute6                     VARCHAR2(150),
  attribute7                     VARCHAR2(150),
  attribute8                     VARCHAR2(150),
  attribute9                     VARCHAR2(150),
  attribute10                    VARCHAR2(150),
  attribute11                    VARCHAR2(150),
  attribute12                    VARCHAR2(150),
  attribute13                    VARCHAR2(150),
  attribute14                    VARCHAR2(150),
  attribute15                    VARCHAR2(150),
  request_id                     NUMBER,
  program_application_id         NUMBER,
  program_id                     NUMBER,
  program_update_date            DATE,
  offset_vat_code                VARCHAR2(20),
  vat_registration_num           VARCHAR2(20),
  auto_calculate_interest_flag   VARCHAR2(1),
  validation_number              NUMBER,
  exclude_freight_from_discount  VARCHAR2(1),
  tax_reporting_name             VARCHAR2(80),
  check_digits                   VARCHAR2(30),
  bank_number                    VARCHAR2(30),
  allow_awt_flag                 VARCHAR2(1),
  awt_group_id                   NUMBER(15),
  global_attribute1              VARCHAR2(150),
  global_attribute2              VARCHAR2(150),
  global_attribute3              VARCHAR2(150),
  global_attribute4              VARCHAR2(150),
  global_attribute5              VARCHAR2(150),
  global_attribute6              VARCHAR2(150),
  global_attribute7              VARCHAR2(150),
  global_attribute8              VARCHAR2(150),
  global_attribute9              VARCHAR2(150),
  global_attribute10             VARCHAR2(150),
  global_attribute11             VARCHAR2(150),
  global_attribute12             VARCHAR2(150),
  global_attribute13             VARCHAR2(150),
  global_attribute14             VARCHAR2(150),
  global_attribute15             VARCHAR2(150),
  global_attribute16             VARCHAR2(150),
  global_attribute17             VARCHAR2(150),
  global_attribute18             VARCHAR2(150),
  global_attribute19             VARCHAR2(150),
  global_attribute20             VARCHAR2(150),
  global_attribute_category      VARCHAR2(30),
  edi_transaction_handling       VARCHAR2(25),
  edi_payment_method             VARCHAR2(25),
  edi_payment_format             VARCHAR2(25),
  edi_remittance_method          VARCHAR2(25),
  edi_remittance_instruction     VARCHAR2(256),
  bank_charge_bearer             VARCHAR2(1),
  bank_branch_type               VARCHAR2(25),
  match_option                   VARCHAR2(25),
  future_dated_payment_ccid      NUMBER(15),
  create_debit_memo_flag         VARCHAR2(25),
  offset_tax_flag                VARCHAR2(1)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.PO_VENDORS
  add constraint PO_VENDORS_PK primary key (VENDOR_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RA_TERRITORIES
prompt =============================
prompt
create table DWSTG.RA_TERRITORIES
(
  territory_id       NUMBER(15) not null,
  last_update_date   DATE,
  last_updated_by    NUMBER(15),
  creation_date      DATE,
  created_by         NUMBER(15),
  last_update_login  NUMBER(15),
  enabled_flag       VARCHAR2(1),
  summary_flag       VARCHAR2(1),
  name               VARCHAR2(40),
  description        VARCHAR2(240),
  status             VARCHAR2(30),
  start_date_active  DATE,
  end_date_active    DATE,
  segment1           VARCHAR2(25),
  segment2           VARCHAR2(25),
  segment3           VARCHAR2(25),
  segment4           VARCHAR2(25),
  segment5           VARCHAR2(25),
  segment6           VARCHAR2(25),
  segment7           VARCHAR2(25),
  segment8           VARCHAR2(25),
  segment9           VARCHAR2(25),
  segment10          VARCHAR2(25),
  segment11          VARCHAR2(25),
  segment12          VARCHAR2(25),
  segment13          VARCHAR2(25),
  segment14          VARCHAR2(25),
  segment15          VARCHAR2(25),
  segment16          VARCHAR2(25),
  segment17          VARCHAR2(25),
  segment18          VARCHAR2(25),
  segment19          VARCHAR2(25),
  segment20          VARCHAR2(25),
  attribute_category VARCHAR2(30),
  attribute1         VARCHAR2(150),
  attribute2         VARCHAR2(150),
  attribute3         VARCHAR2(150),
  attribute4         VARCHAR2(150),
  attribute5         VARCHAR2(150),
  attribute6         VARCHAR2(150),
  attribute7         VARCHAR2(150),
  attribute8         VARCHAR2(150),
  attribute9         VARCHAR2(150),
  attribute10        VARCHAR2(150),
  attribute11        VARCHAR2(150),
  attribute12        VARCHAR2(150),
  attribute13        VARCHAR2(150),
  attribute14        VARCHAR2(150),
  attribute15        VARCHAR2(150)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DWSTG.RA_TERRITORIES_N1 on DWSTG.RA_TERRITORIES (SEGMENT1)
  tablespace BI_DW_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.RA_TERRITORIES
  add constraint PK_RA_TERRITORIES primary key (TERRITORY_ID)
  using index 
  tablespace BI_DW_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STG_HFM_DATA_ALL
prompt ===============================
prompt
create table DWSTG.STG_HFM_DATA_ALL
(
  scenarioid INTEGER,
  yearid     INTEGER,
  periodid   INTEGER,
  viewid     INTEGER,
  entityid   NUMBER,
  parentid   INTEGER,
  valueid    INTEGER,
  accountid  INTEGER,
  icpid      INTEGER,
  custom1id  INTEGER,
  custom2id  INTEGER,
  custom3id  INTEGER,
  custom4id  INTEGER,
  ddata      FLOAT
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table STG_HFM_ENTITY_NOLEVEL_ALL
prompt =========================================
prompt
create table DWSTG.STG_HFM_ENTITY_NOLEVEL_ALL
(
  id           INTEGER not null,
  label        NVARCHAR2(100) not null,
  description  NVARCHAR2(256),
  userdefined3 NVARCHAR2(256)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table STG_HFM_PERIOD_ALL
prompt =================================
prompt
create table DWSTG.STG_HFM_PERIOD_ALL
(
  month_id       INTEGER not null,
  month_lab      NVARCHAR2(100) not null,
  month_desc     NVARCHAR2(256),
  quarter_id     INTEGER not null,
  quarter_label  NVARCHAR2(100) not null,
  quarter_desc   NVARCHAR2(256),
  halfyear_id    INTEGER not null,
  halfyear_label NVARCHAR2(100) not null,
  halfyear_desc  NVARCHAR2(256),
  year_id        INTEGER not null,
  year_label     NVARCHAR2(100) not null,
  year_desc      CHAR(2)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table STG_PROD_CATEGORY_SERIES_ALL
prompt ===========================================
prompt
create table DWSTG.STG_PROD_CATEGORY_SERIES_ALL
(
  category_series_id   NUMBER not null,
  category_series_name VARCHAR2(100) not null,
  category_series_desc VARCHAR2(100) not null,
  last_update_date     DATE,
  order_num            NUMBER not null
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table STG_PROD_PACK_GRADE_ALL
prompt ======================================
prompt
create table DWSTG.STG_PROD_PACK_GRADE_ALL
(
  pack_grade_id    NUMBER not null,
  pack_grade_name  VARCHAR2(100) not null,
  pack_grade_desc  VARCHAR2(100) not null,
  last_update_date DATE,
  order_num        NUMBER not null
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table STG_REGION_SECONDARY_SBL_ALL
prompt ===========================================
prompt
create table DWSTG.STG_REGION_SECONDARY_SBL_ALL
(
  region_src_id               VARCHAR2(30 CHAR),
  region_name                 VARCHAR2(100 CHAR) not null,
  zone_src_id                 VARCHAR2(30 CHAR),
  zone_name                   VARCHAR2(100 CHAR) not null,
  branch_src_id               VARCHAR2(30 CHAR),
  branch_name                 VARCHAR2(100 CHAR) not null,
  base_attribute              VARCHAR2(4),
  battle_attribute            VARCHAR2(9),
  factory_attribute           VARCHAR2(100 CHAR),
  factory_desc                VARCHAR2(50 CHAR),
  secondary_region_src_id     VARCHAR2(30 CHAR),
  secondary_region_name       VARCHAR2(100 CHAR) not null,
  secondary_base_attribute    VARCHAR2(4),
  secondary_battle_attribute  VARCHAR2(9),
  secondary_factory_attribute VARCHAR2(100 CHAR)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table STG_TIME_TIMESPAN
prompt ================================
prompt
create table DWSTG.STG_TIME_TIMESPAN
(
  timespan_id   NUMBER,
  out_table     VARCHAR2(30),
  timespan      NUMBER,
  global_flag   VARCHAR2(1),
  once_timespan NUMBER,
  once_flag     VARCHAR2(1)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBCBYS_COST_DEPARTMENT
prompt =====================================
prompt
create table DWSTG.TBCBYS_COST_DEPARTMENT
(
  parentname    VARCHAR2(240),
  membername    VARCHAR2(240) not null,
  alias         VARCHAR2(240),
  datastorage   VARCHAR2(240),
  twopasscalc   VARCHAR2(240),
  consolidation VARCHAR2(240),
  uda           VARCHAR2(240),
  formula       VARCHAR2(255),
  pack_type     VARCHAR2(255),
  band_type     VARCHAR2(255),
  capacity      VARCHAR2(255),
  attribute1    VARCHAR2(100),
  attribute2    VARCHAR2(100),
  attribute3    VARCHAR2(100),
  attribute4    VARCHAR2(100),
  attribute5    VARCHAR2(100)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBCBYS_COST_ENTITY
prompt =================================
prompt
create table DWSTG.TBCBYS_COST_ENTITY
(
  parentname    VARCHAR2(240),
  membername    VARCHAR2(240) not null,
  alias         VARCHAR2(240),
  datastorage   VARCHAR2(240),
  twopasscalc   VARCHAR2(240),
  consolidation VARCHAR2(240),
  uda           VARCHAR2(240),
  formula       VARCHAR2(255),
  attribute1    VARCHAR2(100),
  attribute2    VARCHAR2(100),
  attribute3    VARCHAR2(100),
  attribute4    VARCHAR2(100),
  attribute5    VARCHAR2(100)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBCBYS_COST_MATERIAL
prompt ===================================
prompt
create table DWSTG.TBCBYS_COST_MATERIAL
(
  parentname    VARCHAR2(240),
  membername    VARCHAR2(240) not null,
  alias         VARCHAR2(240),
  datastorage   VARCHAR2(240),
  twopasscalc   VARCHAR2(240),
  consolidation VARCHAR2(240),
  uda           VARCHAR2(240),
  formula       VARCHAR2(255),
  attribute1    VARCHAR2(100),
  attribute2    VARCHAR2(100),
  attribute3    VARCHAR2(100),
  attribute4    VARCHAR2(100),
  attribute5    VARCHAR2(100)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBCBYS_COST_PACKAGE
prompt ==================================
prompt
create table DWSTG.TBCBYS_COST_PACKAGE
(
  parentname    VARCHAR2(240),
  membername    VARCHAR2(240) not null,
  alias         VARCHAR2(240),
  datastorage   VARCHAR2(240),
  twopasscalc   VARCHAR2(240),
  consolidation VARCHAR2(240),
  uda           VARCHAR2(240),
  formula       VARCHAR2(255),
  attribute1    VARCHAR2(100),
  attribute2    VARCHAR2(100),
  attribute3    VARCHAR2(100),
  attribute4    VARCHAR2(100),
  attribute5    VARCHAR2(100)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBCBYS_EXPENSE_ACCOUNT
prompt =====================================
prompt
create table DWSTG.TBCBYS_EXPENSE_ACCOUNT
(
  parentname    VARCHAR2(240),
  membername    VARCHAR2(240) not null,
  alias         VARCHAR2(240),
  datastorage   VARCHAR2(240),
  twopasscalc   VARCHAR2(240),
  consolidation VARCHAR2(240),
  uda           VARCHAR2(240),
  formula       VARCHAR2(255),
  attribute1    VARCHAR2(100),
  attribute2    VARCHAR2(100),
  attribute3    VARCHAR2(100),
  attribute4    VARCHAR2(100),
  attribute5    VARCHAR2(100)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBCWYS_NONPRODU_ACCOUNT
prompt ======================================
prompt
create table DWSTG.TBCWYS_NONPRODU_ACCOUNT
(
  parentname  VARCHAR2(240),
  membername  VARCHAR2(240) not null,
  alias       VARCHAR2(240),
  datastorage VARCHAR2(240),
  attribute1  VARCHAR2(100),
  attribute2  VARCHAR2(100)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBCWYS_PRODUCTR_ACCOUNT
prompt ======================================
prompt
create table DWSTG.TBCWYS_PRODUCTR_ACCOUNT
(
  parentname  VARCHAR2(240),
  membername  VARCHAR2(240) not null,
  alias       VARCHAR2(240),
  datastorage VARCHAR2(240),
  attribute1  VARCHAR2(100),
  attribute2  VARCHAR2(100)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBCWYS_PRODUCTR_BUYER
prompt ====================================
prompt
create table DWSTG.TBCWYS_PRODUCTR_BUYER
(
  parentname  VARCHAR2(240),
  membername  VARCHAR2(240) not null,
  alias       VARCHAR2(240),
  datastorage VARCHAR2(240),
  attribute1  VARCHAR2(100),
  attribute2  VARCHAR2(100)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBCWYS_PRODUCTR_DEPARTMENT
prompt =========================================
prompt
create table DWSTG.TBCWYS_PRODUCTR_DEPARTMENT
(
  parentname  VARCHAR2(240),
  membername  VARCHAR2(240) not null,
  alias       VARCHAR2(240),
  datastorage VARCHAR2(240),
  province    VARCHAR2(240),
  attribute1  VARCHAR2(100),
  attribute2  VARCHAR2(100)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBCWYS_PRODUCTR_ENTITY
prompt =====================================
prompt
create table DWSTG.TBCWYS_PRODUCTR_ENTITY
(
  parentname  VARCHAR2(240),
  membername  VARCHAR2(240) not null,
  alias       VARCHAR2(240),
  datastorage VARCHAR2(240),
  attribute1  VARCHAR2(100),
  attribute2  VARCHAR2(100)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBCWYS_PRODUCTR_JOINT
prompt ====================================
prompt
create table DWSTG.TBCWYS_PRODUCTR_JOINT
(
  parentname  VARCHAR2(240),
  membername  VARCHAR2(240) not null,
  alias       VARCHAR2(240),
  datastorage VARCHAR2(240),
  attribute1  VARCHAR2(100),
  attribute2  VARCHAR2(100)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBCWYS_PRODUCTR_LOGISTIC
prompt =======================================
prompt
create table DWSTG.TBCWYS_PRODUCTR_LOGISTIC
(
  parentname  VARCHAR2(240),
  membername  VARCHAR2(240) not null,
  alias       VARCHAR2(240),
  datastorage VARCHAR2(240),
  attribute1  VARCHAR2(100),
  attribute2  VARCHAR2(100)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBCWYS_PRODUCTR_PERIODS
prompt ======================================
prompt
create table DWSTG.TBCWYS_PRODUCTR_PERIODS
(
  parentname  VARCHAR2(240),
  membername  VARCHAR2(240) not null,
  alias       VARCHAR2(240),
  datastorage VARCHAR2(240),
  attribute1  VARCHAR2(100),
  attribute2  VARCHAR2(100)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBCWYS_PRODUCTR_SCENARIO
prompt =======================================
prompt
create table DWSTG.TBCWYS_PRODUCTR_SCENARIO
(
  parentname  VARCHAR2(240),
  membername  VARCHAR2(240) not null,
  alias       VARCHAR2(240),
  datastorage VARCHAR2(240),
  attribute1  VARCHAR2(100),
  attribute2  VARCHAR2(100)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBCWYS_PRODUCTR_SOURCE
prompt =====================================
prompt
create table DWSTG.TBCWYS_PRODUCTR_SOURCE
(
  parentname  VARCHAR2(240),
  membername  VARCHAR2(240) not null,
  alias       VARCHAR2(240),
  datastorage VARCHAR2(240),
  attribute1  VARCHAR2(100),
  attribute2  VARCHAR2(100)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBCWYS_PRODUCTR_YEARS
prompt ====================================
prompt
create table DWSTG.TBCWYS_PRODUCTR_YEARS
(
  parentname  VARCHAR2(240),
  membername  VARCHAR2(240) not null,
  alias       VARCHAR2(240),
  datastorage VARCHAR2(240),
  attribute1  VARCHAR2(100),
  attribute2  VARCHAR2(100)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBCWYS_REPORT_ACCOUNT
prompt ====================================
prompt
create table DWSTG.TBCWYS_REPORT_ACCOUNT
(
  parentname  VARCHAR2(240),
  membername  VARCHAR2(240) not null,
  alias       VARCHAR2(240),
  datastorage VARCHAR2(240),
  attribute1  VARCHAR2(100),
  attribute2  VARCHAR2(100)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBHFM_ACCOUNT
prompt ============================
prompt
create table DWSTG.TBHFM_ACCOUNT
(
  id             INTEGER not null,
  label          NVARCHAR2(100) not null,
  parentid       INTEGER not null,
  parentlabel    NVARCHAR2(100),
  description    NVARCHAR2(256),
  userdefined1   NVARCHAR2(256),
  userdefined2   NVARCHAR2(256),
  userdefined3   NVARCHAR2(256),
  isshared       INTEGER not null,
  iscalculated   INTEGER not null,
  isconsolidated INTEGER not null,
  isicp          INTEGER not null,
  accounttype    NVARCHAR2(256) not null,
  isleaf         INTEGER not null
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.TBHFM_ACCOUNT
  add primary key (ID, PARENTID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBHFM_CUSTOM1
prompt ============================
prompt
create table DWSTG.TBHFM_CUSTOM1
(
  id           INTEGER not null,
  label        NVARCHAR2(100) not null,
  parentid     INTEGER not null,
  parentlabel  NVARCHAR2(100),
  description  NVARCHAR2(256),
  userdefined1 NVARCHAR2(256),
  userdefined2 NVARCHAR2(256),
  userdefined3 NVARCHAR2(256),
  isshared     INTEGER not null,
  iscalculated INTEGER not null,
  switchsign   INTEGER not null,
  switchtype   INTEGER not null,
  aggweight    FLOAT not null,
  isleaf       INTEGER not null
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.TBHFM_CUSTOM1
  add primary key (ID, PARENTID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBHFM_ENTITY
prompt ===========================
prompt
create table DWSTG.TBHFM_ENTITY
(
  id              INTEGER not null,
  label           NVARCHAR2(100) not null,
  parentid        INTEGER not null,
  parentlabel     NVARCHAR2(100),
  description     NVARCHAR2(256),
  userdefined1    NVARCHAR2(256),
  userdefined2    NVARCHAR2(256),
  userdefined3    NVARCHAR2(256),
  isshared        INTEGER not null,
  isicp           INTEGER not null,
  defaultcurrency INTEGER not null,
  isleaf          INTEGER not null
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.TBHFM_ENTITY
  add primary key (ID, PARENTID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBHFM_PERIOD
prompt ===========================
prompt
create table DWSTG.TBHFM_PERIOD
(
  id          INTEGER not null,
  label       NVARCHAR2(100) not null,
  parentid    INTEGER not null,
  parentlabel NVARCHAR2(100),
  description NVARCHAR2(256),
  isshared    INTEGER not null,
  isleaf      INTEGER not null
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.TBHFM_PERIOD
  add primary key (ID, PARENTID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBHFM_USAGE_TRACK
prompt ================================
prompt
create table DWSTG.TBHFM_USAGE_TRACK
(
  id             NUMBER not null,
  yearid         NUMBER,
  monthid        NUMBER,
  is_replace_dec VARCHAR2(1)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.TBHFM_USAGE_TRACK
  add constraint TBHFM_USAGE_TRACK_PK primary key (ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBHFM_YEAR
prompt =========================
prompt
create table DWSTG.TBHFM_YEAR
(
  id          INTEGER not null,
  label       NVARCHAR2(100) not null,
  parentid    INTEGER not null,
  parentlabel NVARCHAR2(100),
  description NVARCHAR2(256),
  isshared    INTEGER not null,
  isleaf      INTEGER not null
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.TBHFM_YEAR
  add primary key (ID, PARENTID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBXHYB_CONSUMPT_CATEGORY
prompt =======================================
prompt
create table DWSTG.TBXHYB_CONSUMPT_CATEGORY
(
  parentname  VARCHAR2(240),
  membername  VARCHAR2(240) not null,
  alias       VARCHAR2(240),
  datastorage VARCHAR2(240),
  attribute1  VARCHAR2(100),
  attribute2  VARCHAR2(100)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBXHYB_CONSUMPT_DEPARTMENT
prompt =========================================
prompt
create table DWSTG.TBXHYB_CONSUMPT_DEPARTMENT
(
  parentname  VARCHAR2(240),
  membername  VARCHAR2(240) not null,
  alias       VARCHAR2(240),
  datastorage VARCHAR2(240),
  dmodel      VARCHAR2(240),
  dtype       VARCHAR2(240),
  dcapacity   VARCHAR2(240),
  attribute1  VARCHAR2(100),
  attribute2  VARCHAR2(100)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBXHYB_CONSUMPT_ENTITY
prompt =====================================
prompt
create table DWSTG.TBXHYB_CONSUMPT_ENTITY
(
  parentname  VARCHAR2(240),
  membername  VARCHAR2(240) not null,
  alias       VARCHAR2(240),
  datastorage VARCHAR2(240),
  attribute1  VARCHAR2(100),
  attribute2  VARCHAR2(100)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TBXHYB_CONSUMPT_PACKAGE
prompt ======================================
prompt
create table DWSTG.TBXHYB_CONSUMPT_PACKAGE
(
  parentname  VARCHAR2(240),
  membername  VARCHAR2(240) not null,
  alias       VARCHAR2(240),
  datastorage VARCHAR2(240),
  attribute1  VARCHAR2(100),
  attribute2  VARCHAR2(100)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TIP_DAILY_INDEXES
prompt ================================
prompt
create table DWSTG.TIP_DAILY_INDEXES
(
  lookup_type       VARCHAR2(50) not null,
  lookup_code       VARCHAR2(20) not null,
  day_id            NUMBER not null,
  value1            NUMBER,
  value2            NUMBER,
  value3            NUMBER,
  value4            NUMBER,
  value5            NUMBER,
  value6            NUMBER,
  value7            NUMBER,
  value8            NUMBER,
  value9            NUMBER,
  value10           NUMBER,
  attribute1        VARCHAR2(240),
  attribute2        VARCHAR2(240),
  attribute3        VARCHAR2(240),
  attribute4        VARCHAR2(240),
  attribute5        VARCHAR2(240),
  attribute6        VARCHAR2(240),
  attribute7        VARCHAR2(240),
  attribute8        VARCHAR2(240),
  attribute9        VARCHAR2(240),
  attribute10       VARCHAR2(240),
  created_by        NUMBER not null,
  creation_date     DATE not null,
  last_update_by    NUMBER not null,
  last_update_date  DATE not null,
  last_update_login NUMBER not null
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.TIP_DAILY_INDEXES
  add primary key (DAY_ID, LOOKUP_CODE, LOOKUP_TYPE)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TIP_ITSM_CLASSIFICATIONS_V
prompt =========================================
prompt
create table DWSTG.TIP_ITSM_CLASSIFICATIONS_V
(
  l1_classfication_id VARCHAR2(2),
  l1_description      VARCHAR2(500),
  l2_classfication_id VARCHAR2(4),
  l2_description      VARCHAR2(500),
  l3_classfication_id VARCHAR2(6),
  l3_description      VARCHAR2(500),
  l4_classfication_id VARCHAR2(384) not null,
  l4_description      VARCHAR2(500)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.TIP_ITSM_CLASSIFICATIONS_V
  add primary key (L4_CLASSFICATION_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TIP_ITSM_INCIDENTS_V
prompt ===================================
prompt
create table DWSTG.TIP_ITSM_INCIDENTS_V
(
  event_id             VARCHAR2(20) not null,
  event_uid            NUMBER not null,
  actual_finish_date   DATE,
  actual_start_date    DATE,
  affected_date        DATE,
  affected_email       VARCHAR2(200),
  affected_person      VARCHAR2(124),
  affected_phone       VARCHAR2(40),
  change_by            VARCHAR2(100),
  change_date          DATE not null,
  classification_id    VARCHAR2(384),
  created_by           VARCHAR2(60),
  creation_date        DATE,
  impact               VARCHAR2(6),
  internal_priority    VARCHAR2(2),
  owner                VARCHAR2(100),
  report_date          DATE,
  reported_by          VARCHAR2(124),
  reported_email       VARCHAR2(200),
  reported_phone       VARCHAR2(40),
  reported_priority    VARCHAR2(2),
  status               VARCHAR2(20) not null,
  status_date          DATE not null,
  supervisor           VARCHAR2(60),
  urgency              VARCHAR2(4),
  effective_start_date DATE,
  description          VARCHAR2(200),
  ldtext               VARCHAR2(4000)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.TIP_ITSM_INCIDENTS_V
  add primary key (EVENT_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TIP_ITSM_WORKLOGS_V
prompt ==================================
prompt
create table DWSTG.TIP_ITSM_WORKLOGS_V
(
  event_id    VARCHAR2(20) not null,
  worklog_id  NUMBER not null,
  create_by   VARCHAR2(100),
  create_date DATE not null,
  description VARCHAR2(200),
  ldtext      VARCHAR2(4000)
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.TIP_ITSM_WORKLOGS_V
  add primary key (WORKLOG_ID)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TIP_LOOKUP_CODES
prompt ===============================
prompt
create table DWSTG.TIP_LOOKUP_CODES
(
  lookup_type        VARCHAR2(50) not null,
  lookup_code        VARCHAR2(20) not null,
  meaning            VARCHAR2(240) not null,
  short_name         VARCHAR2(240),
  description        VARCHAR2(500),
  unit               VARCHAR2(20),
  sign               NUMBER,
  start_date         DATE,
  end_date           DATE,
  parent_flag        VARCHAR2(2),
  parent_lookup_code VARCHAR2(20),
  hierarchy_level    NUMBER,
  attribute1         VARCHAR2(240),
  attribute2         VARCHAR2(240),
  attribute3         VARCHAR2(240),
  attribute4         VARCHAR2(240),
  attribute5         VARCHAR2(240),
  attribute6         VARCHAR2(240),
  attribute7         VARCHAR2(240),
  attribute8         VARCHAR2(240),
  attribute9         VARCHAR2(240),
  attribute10        VARCHAR2(240),
  created_by         NUMBER not null,
  creation_date      DATE not null,
  last_update_by     NUMBER not null,
  last_update_date   DATE not null,
  last_update_login  NUMBER not null
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.TIP_LOOKUP_CODES
  add primary key (LOOKUP_CODE, LOOKUP_TYPE)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TIP_LOOKUP_TYPES
prompt ===============================
prompt
create table DWSTG.TIP_LOOKUP_TYPES
(
  lookup_type       VARCHAR2(50) not null,
  meaning           VARCHAR2(240) not null,
  short_name        VARCHAR2(240),
  description       VARCHAR2(500),
  category          VARCHAR2(50),
  attribute1        VARCHAR2(240),
  attribute2        VARCHAR2(240),
  attribute3        VARCHAR2(240),
  attribute4        VARCHAR2(240),
  attribute5        VARCHAR2(240),
  attribute6        VARCHAR2(240),
  attribute7        VARCHAR2(240),
  attribute8        VARCHAR2(240),
  attribute9        VARCHAR2(240),
  attribute10       VARCHAR2(240),
  created_by        NUMBER not null,
  creation_date     DATE not null,
  last_update_by    NUMBER not null,
  last_update_date  DATE not null,
  last_update_login NUMBER not null
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.TIP_LOOKUP_TYPES
  add primary key (LOOKUP_TYPE)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TIP_MONTHLY_COM_INDEXES
prompt ======================================
prompt
create table DWSTG.TIP_MONTHLY_COM_INDEXES
(
  lookup_type       VARCHAR2(50) not null,
  lookup_code       VARCHAR2(20) not null,
  com_code          VARCHAR2(20) not null,
  month_code        VARCHAR2(20) not null,
  value1            NUMBER,
  value2            NUMBER,
  value3            NUMBER,
  value4            NUMBER,
  value5            NUMBER,
  value6            NUMBER,
  value7            NUMBER,
  value8            NUMBER,
  value9            NUMBER,
  value10           NUMBER,
  attribute1        VARCHAR2(240),
  attribute2        VARCHAR2(240),
  attribute3        VARCHAR2(240),
  attribute4        VARCHAR2(240),
  attribute5        VARCHAR2(240),
  attribute6        VARCHAR2(240),
  attribute7        VARCHAR2(240),
  attribute8        VARCHAR2(240),
  attribute9        VARCHAR2(240),
  attribute10       VARCHAR2(2000),
  created_by        NUMBER not null,
  creation_date     DATE not null,
  last_update_by    NUMBER not null,
  last_update_date  DATE not null,
  last_update_login NUMBER not null
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.TIP_MONTHLY_COM_INDEXES
  add primary key (COM_CODE, MONTH_CODE, LOOKUP_CODE, LOOKUP_TYPE)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TIP_MONTHLY_INDEXES
prompt ==================================
prompt
create table DWSTG.TIP_MONTHLY_INDEXES
(
  lookup_type       VARCHAR2(50) not null,
  lookup_code       VARCHAR2(20) not null,
  month_code        VARCHAR2(20) not null,
  value1            NUMBER,
  value2            NUMBER,
  value3            NUMBER,
  value4            NUMBER,
  value5            NUMBER,
  value6            NUMBER,
  value7            NUMBER,
  value8            NUMBER,
  value9            NUMBER,
  value10           NUMBER,
  attribute1        VARCHAR2(2000),
  attribute2        VARCHAR2(2000),
  attribute3        VARCHAR2(2000),
  attribute4        VARCHAR2(240),
  attribute5        VARCHAR2(240),
  attribute6        VARCHAR2(240),
  attribute7        VARCHAR2(240),
  attribute8        VARCHAR2(240),
  attribute9        VARCHAR2(240),
  attribute10       VARCHAR2(240),
  created_by        NUMBER not null,
  creation_date     DATE not null,
  last_update_by    NUMBER not null,
  last_update_date  DATE not null,
  last_update_login NUMBER not null
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.TIP_MONTHLY_INDEXES
  add primary key (MONTH_CODE, LOOKUP_CODE, LOOKUP_TYPE)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TIP_YEARLY_INDEXES
prompt =================================
prompt
create table DWSTG.TIP_YEARLY_INDEXES
(
  lookup_type       VARCHAR2(50) not null,
  lookup_code       VARCHAR2(20) not null,
  year_code         VARCHAR2(20) not null,
  value1            NUMBER,
  value2            NUMBER,
  value3            NUMBER,
  value4            NUMBER,
  value5            NUMBER,
  value6            NUMBER,
  value7            NUMBER,
  value8            NUMBER,
  value9            NUMBER,
  value10           NUMBER,
  attribute1        VARCHAR2(240),
  attribute2        VARCHAR2(240),
  attribute3        VARCHAR2(240),
  attribute4        VARCHAR2(240),
  attribute5        VARCHAR2(240),
  attribute6        VARCHAR2(240),
  attribute7        VARCHAR2(240),
  attribute8        VARCHAR2(240),
  attribute9        VARCHAR2(240),
  attribute10       VARCHAR2(240),
  created_by        NUMBER not null,
  creation_date     DATE not null,
  last_update_by    NUMBER not null,
  last_update_date  DATE not null,
  last_update_login NUMBER not null
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.TIP_YEARLY_INDEXES
  add primary key (YEAR_CODE, LOOKUP_CODE, LOOKUP_TYPE)
  using index 
  tablespace BI_DW_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table XXZZ_CON_BUDGET_LINE
prompt ===================================
prompt
create table DWSTG.XXZZ_CON_BUDGET_LINE
(
  header_id             NUMBER not null,
  line_id               NUMBER not null,
  uom                   VARCHAR2(10),
  vendor_id             NUMBER,
  last_average_price    NUMBER,
  budget_quantity       NUMBER,
  budget_price          NUMBER,
  segment1              VARCHAR2(40),
  segment2              VARCHAR2(40),
  segment3              VARCHAR2(40),
  segment4              VARCHAR2(40),
  segment5              VARCHAR2(40),
  segment6              VARCHAR2(40),
  segment7              VARCHAR2(40),
  segment8              VARCHAR2(40),
  segment9              VARCHAR2(40),
  segment10             VARCHAR2(40),
  segment11             VARCHAR2(40),
  segment12             VARCHAR2(40),
  segment13             VARCHAR2(40),
  segment14             VARCHAR2(40),
  segment15             VARCHAR2(40),
  attribute1            VARCHAR2(150),
  attribute2            VARCHAR2(150),
  attribute3            VARCHAR2(150),
  attribute4            VARCHAR2(150),
  attribute5            VARCHAR2(150),
  attribute6            VARCHAR2(150),
  attribute7            VARCHAR2(150),
  attribute8            VARCHAR2(150),
  attribute9            VARCHAR2(150),
  attribute10           VARCHAR2(150),
  attribute11           VARCHAR2(150),
  attribute12           VARCHAR2(150),
  attribute13           VARCHAR2(150),
  attribute14           VARCHAR2(150),
  attribute15           VARCHAR2(150),
  created_by            NUMBER not null,
  creation_date         DATE not null,
  last_updated_by       NUMBER not null,
  last_update_date      DATE not null,
  last_update_login     NUMBER,
  category_id           NUMBER,
  check_flag            VARCHAR2(2),
  checked_by            NUMBER,
  check_date            DATE,
  approve_flag          VARCHAR2(2),
  approved_zone         VARCHAR2(30),
  approved_by           NUMBER,
  approve_date          DATE,
  auto_create_flag      VARCHAR2(2),
  checked_zone          VARCHAR2(30),
  next_action           VARCHAR2(30),
  status_code           VARCHAR2(30),
  adjust_flag           VARCHAR2(2),
  purchase_quantity     NUMBER,
  purchase_price        NUMBER,
  budget_percent        NUMBER,
  purchase_percent      NUMBER,
  vat_code              VARCHAR2(30),
  organization_id       NUMBER,
  year_id               NUMBER,
  quarter_id            NUMBER,
  month_id              NUMBER,
  budget_type_code      VARCHAR2(30),
  actual_purchase_price NUMBER,
  factor1               NUMBER,
  factor2               NUMBER,
  factor3               NUMBER,
  factor4               NUMBER,
  factor5               NUMBER,
  factor6               NUMBER,
  factor7               NUMBER,
  factor8               NUMBER,
  factor9               NUMBER,
  factor10              NUMBER,
  factor11              NUMBER,
  factor12              NUMBER,
  factor13              NUMBER,
  factor14              NUMBER,
  factor15              NUMBER,
  factor16              NUMBER,
  factor17              NUMBER,
  factor18              NUMBER,
  factor19              NUMBER,
  factor20              NUMBER,
  factor21              NUMBER,
  factor22              NUMBER,
  factor23              NUMBER,
  factor24              NUMBER,
  factor25              NUMBER,
  factor26              NUMBER,
  factor27              NUMBER,
  factor28              NUMBER,
  factor29              NUMBER,
  factor30              NUMBER,
  result1               NUMBER,
  result2               NUMBER,
  result3               NUMBER,
  result4               NUMBER,
  result5               NUMBER,
  result6               NUMBER,
  result7               NUMBER,
  result8               NUMBER,
  result9               NUMBER,
  result10              NUMBER,
  result11              NUMBER,
  result12              NUMBER,
  result13              NUMBER,
  result14              NUMBER,
  result15              NUMBER,
  result16              NUMBER,
  result17              NUMBER,
  result18              NUMBER,
  result19              NUMBER,
  result20              NUMBER,
  result21              NUMBER,
  result22              NUMBER,
  result23              NUMBER,
  result24              NUMBER,
  result25              NUMBER,
  result26              NUMBER,
  result27              NUMBER,
  result28              NUMBER,
  result29              NUMBER,
  result30              NUMBER
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index SOAU.SYS_C00422180 on DWSTG.XXZZ_CON_BUDGET_LINE (HEADER_ID, VENDOR_ID, CATEGORY_ID)
  tablespace BI_DW_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SOAU.XXZZ_CON_BUDGET_LINE_N1 on DWSTG.XXZZ_CON_BUDGET_LINE (HEADER_ID)
  tablespace BI_DW_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 16K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.XXZZ_CON_BUDGET_LINE
  add primary key (LINE_ID)
  using index 
  tablespace BI_DW_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table XXZZ_CON_CATEGORY_TARGET
prompt =======================================
prompt
create table DWSTG.XXZZ_CON_CATEGORY_TARGET
(
  line_id                     NUMBER not null,
  org_id                      NUMBER,
  organization_id             NUMBER,
  category_id                 NUMBER,
  uom                         VARCHAR2(30),
  year_id                     NUMBER,
  type_code                   VARCHAR2(30),
  year_save_target_amount     NUMBER,
  year_budget_purchase_amount NUMBER,
  attribute1                  VARCHAR2(150),
  attribute2                  VARCHAR2(150),
  attribute3                  VARCHAR2(150),
  attribute4                  VARCHAR2(150),
  attribute5                  VARCHAR2(150),
  attribute6                  VARCHAR2(150),
  attribute7                  VARCHAR2(150),
  attribute8                  VARCHAR2(150),
  attribute9                  VARCHAR2(150),
  attribute10                 VARCHAR2(150),
  attribute11                 VARCHAR2(150),
  attribute12                 VARCHAR2(150),
  attribute13                 VARCHAR2(150),
  attribute14                 VARCHAR2(150),
  attribute15                 VARCHAR2(150),
  created_by                  NUMBER,
  creation_date               DATE,
  last_updated_by             NUMBER,
  last_update_date            DATE,
  last_update_login           NUMBER
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DWSTG.XXZZ_CON_CATEGORY_TARGET
  add primary key (LINE_ID)
  using index 
  tablespace BI_DW_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table XXZZ_CON_PRODUCT_BUDGET
prompt ======================================
prompt
create table DWSTG.XXZZ_CON_PRODUCT_BUDGET
(
  line_id            NUMBER not null,
  month_id           NUMBER,
  organization_id    NUMBER,
  status_code        VARCHAR2(30) not null,
  layer1_category_id NUMBER,
  uom                VARCHAR2(10),
  quantity           NUMBER,
  barly_uom          VARCHAR2(10),
  barly_convert_rate NUMBER,
  segment1           VARCHAR2(40),
  segment2           VARCHAR2(40),
  segment3           VARCHAR2(40),
  segment4           VARCHAR2(40),
  segment5           VARCHAR2(40),
  segment6           VARCHAR2(40),
  segment7           VARCHAR2(40),
  segment8           VARCHAR2(40),
  segment9           VARCHAR2(40),
  segment10          VARCHAR2(40),
  segment11          VARCHAR2(40),
  segment12          VARCHAR2(40),
  segment13          VARCHAR2(40),
  segment14          VARCHAR2(40),
  segment15          VARCHAR2(40),
  attribute1         VARCHAR2(150),
  attribute2         VARCHAR2(150),
  attribute3         VARCHAR2(150),
  attribute4         VARCHAR2(150),
  attribute5         VARCHAR2(150),
  attribute6         VARCHAR2(150),
  attribute7         VARCHAR2(150),
  attribute8         VARCHAR2(150),
  attribute9         VARCHAR2(150),
  attribute10        VARCHAR2(150),
  attribute11        VARCHAR2(150),
  attribute12        VARCHAR2(150),
  attribute13        VARCHAR2(150),
  attribute14        VARCHAR2(150),
  attribute15        VARCHAR2(150),
  created_by         NUMBER not null,
  creation_date      DATE not null,
  last_updated_by    NUMBER not null,
  last_update_date   DATE not null,
  last_update_login  NUMBER
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table XXZZ_CON_WHEAT_QUANLITY
prompt ======================================
prompt
create table DWSTG.XXZZ_CON_WHEAT_QUANLITY
(
  line_id           NUMBER not null,
  year_id           NUMBER,
  organization_id   NUMBER,
  type_lookup_code  VARCHAR2(30),
  uom               VARCHAR2(10),
  quantity_of_year  NUMBER,
  quantity_of_day   NUMBER,
  days_of_year      NUMBER,
  quantity_actual   NUMBER,
  segment1          VARCHAR2(40),
  segment2          VARCHAR2(40),
  segment3          VARCHAR2(40),
  segment4          VARCHAR2(40),
  segment5          VARCHAR2(40),
  segment6          VARCHAR2(40),
  segment7          VARCHAR2(40),
  segment8          VARCHAR2(40),
  segment9          VARCHAR2(40),
  segment10         VARCHAR2(40),
  segment11         VARCHAR2(40),
  segment12         VARCHAR2(40),
  segment13         VARCHAR2(40),
  segment14         VARCHAR2(40),
  segment15         VARCHAR2(40),
  attribute1        VARCHAR2(150),
  attribute2        VARCHAR2(150),
  attribute3        VARCHAR2(150),
  attribute4        VARCHAR2(150),
  attribute5        VARCHAR2(150),
  attribute6        VARCHAR2(150),
  attribute7        VARCHAR2(150),
  attribute8        VARCHAR2(150),
  attribute9        VARCHAR2(150),
  attribute10       VARCHAR2(150),
  attribute11       VARCHAR2(150),
  attribute12       VARCHAR2(150),
  attribute13       VARCHAR2(150),
  attribute14       VARCHAR2(150),
  attribute15       VARCHAR2(150),
  created_by        NUMBER not null,
  creation_date     DATE not null,
  last_updated_by   NUMBER not null,
  last_update_date  DATE not null,
  last_update_login NUMBER
)
tablespace BI_DW_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );


spool off
