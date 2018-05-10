spool 03_trfsiniden.log

prompt PL/SQL Developer import file
prompt Created on jueves, 11 de agosto de 2011 by user
set feedback off
set define off
prompt Dropping TRXSINIDENTIFICAR...
drop table TRXSINIDENTIFICAR cascade constraints;
prompt Creating TRXSINIDENTIFICAR...
create table TRXSINIDENTIFICAR
(
  IDBANCO               CHAR(2),
  CUENTA                VARCHAR2(16),
  PERIODO               CHAR(6),
  NUMEROTRX             NUMBER,
  FECHATRX              DATE,
  DESCRIPCIONTRX        VARCHAR2(250),
  VALORTRX              NUMBER,
  OFICINAORIGEN         VARCHAR2(250),
  INDTIPO               CHAR(5),
  IDMUNICIPIO           CHAR(8),
  P_CONSIGNADO          NUMBER,
  FECHACARGUE           DATE,
  USUARIOCARGUE         NUMBER,
  FECHAIDENTIFICACION   DATE,
  USUARIOIDENTIFICACION NUMBER,
  INDTIPOIDEN           CHAR(5),
  IDMUNICIPIOIDEN       CHAR(8),
  P_CONSIGNADOIDEN      NUMBER,
  OBSERVACIONES         VARCHAR2(500),
  NUMSECUENCIAREG       NUMBER not null,
  ESTADOIDEN            CHAR(2),
  CONCESIONARIOZON      CHAR(2),
  REFERENCIA            VARCHAR2(250),
  QUINCENA              CHAR(2),
  FECHALIQ              DATE
)
;
comment on column TRXSINIDENTIFICAR.IDBANCO
  is 'banco';
comment on column TRXSINIDENTIFICAR.CUENTA
  is 'cuenta';
comment on column TRXSINIDENTIFICAR.PERIODO
  is 'periodo';
comment on column TRXSINIDENTIFICAR.NUMEROTRX
  is 'numero de trx';
comment on column TRXSINIDENTIFICAR.FECHATRX
  is 'fecha de transaccion';
comment on column TRXSINIDENTIFICAR.DESCRIPCIONTRX
  is 'descripcion de transaccion';
comment on column TRXSINIDENTIFICAR.VALORTRX
  is 'valor transaccion';
comment on column TRXSINIDENTIFICAR.OFICINAORIGEN
  is 'oficina origen';
comment on column TRXSINIDENTIFICAR.INDTIPO
  is 'indicador tipo';
comment on column TRXSINIDENTIFICAR.IDMUNICIPIO
  is 'divipo propuesto';
comment on column TRXSINIDENTIFICAR.P_CONSIGNADO
  is 'porcentaje consignado';
comment on column TRXSINIDENTIFICAR.FECHACARGUE
  is 'fecha de cargue del registro';
comment on column TRXSINIDENTIFICAR.USUARIOCARGUE
  is 'usuario de cargue del registro';
comment on column TRXSINIDENTIFICAR.FECHAIDENTIFICACION
  is 'fecha de identificacion';
comment on column TRXSINIDENTIFICAR.USUARIOIDENTIFICACION
  is 'usuario que realizo la identificacion';
comment on column TRXSINIDENTIFICAR.INDTIPOIDEN
  is 'indicador tipo identificado';
comment on column TRXSINIDENTIFICAR.IDMUNICIPIOIDEN
  is 'municipio identificado';
comment on column TRXSINIDENTIFICAR.P_CONSIGNADOIDEN
  is 'porcentaje identificado';
comment on column TRXSINIDENTIFICAR.OBSERVACIONES
  is 'observaciones sobre la identificacion';
comment on column TRXSINIDENTIFICAR.NUMSECUENCIAREG
  is 'secuencia de la identificacion';
comment on column TRXSINIDENTIFICAR.ESTADOIDEN
  is 'SI: Sin identificar, ID: Identificado, AN:Anulado';
comment on column TRXSINIDENTIFICAR.CONCESIONARIOZON
  is 'Concesionario zonal';
comment on column TRXSINIDENTIFICAR.REFERENCIA
  is 'Referencia de transaccion';
comment on column TRXSINIDENTIFICAR.QUINCENA
  is 'Quincena del movimiento de avvillas';
comment on column TRXSINIDENTIFICAR.FECHALIQ
  is 'fecha liquidacion';
alter table TRXSINIDENTIFICAR
  add constraint PK_TRXSINIDENTIFICAR primary key (NUMSECUENCIAREG);

prompt Loading TRXSINIDENTIFICAR...
prompt Table is empty
set feedback on
set define on
prompt Done.

spool off
