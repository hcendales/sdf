---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 11/08/2011, 11:09:02 --
---------------------------------------------

spool 01_deptal.log

prompt
prompt Creating table DEPARTAMENTAL
prompt ============================
prompt
create table SIMIT.DEPARTAMENTAL
(
  IDDPTAL     CHAR(8) not null,
  IDMUNICIPIO CHAR(8) not null
)
;
comment on column SIMIT.DEPARTAMENTAL.IDDPTAL
  is 'departamental';
comment on column SIMIT.DEPARTAMENTAL.IDMUNICIPIO
  is 'municipio';
alter table SIMIT.DEPARTAMENTAL
  add constraint PK_DPTAL primary key (IDDPTAL, IDMUNICIPIO);


spool off
