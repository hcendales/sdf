---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 27/12/2011, 12:31:26 --
---------------------------------------------

spool 22a_tablas.log

prompt
prompt Creating table MVTOAVVILLAS
prompt ===========================
prompt
create table SIMIT.MVTOAVVILLAS
(
  NUMEROCUENTA     VARCHAR2(16),
  PERIODO          CHAR(6),
  FECHAAPLICACION  DATE,
  FECHATRANSACCION DATE,
  DESCRIPCION      VARCHAR2(250),
  DOCUMENTO        VARCHAR2(20),
  ORIGEN           VARCHAR2(250),
  VALORTOTAL       NUMBER,
  VALOREFECTIVO    NUMBER,
  VALORCHEQUE      NUMBER,
  DEBITOCREDITO    VARCHAR2(5),
  CODIGOTRN        VARCHAR2(50),
  NUMEROTRX        NUMBER,
  QUINCENA         CHAR(2)
)
;
comment on column SIMIT.MVTOAVVILLAS.NUMEROCUENTA
  is 'numero cuenta';
comment on column SIMIT.MVTOAVVILLAS.PERIODO
  is 'fecha del periodo';
comment on column SIMIT.MVTOAVVILLAS.FECHAAPLICACION
  is 'fecha de aplicacion';
comment on column SIMIT.MVTOAVVILLAS.FECHATRANSACCION
  is 'fecha de transaccion';
comment on column SIMIT.MVTOAVVILLAS.DESCRIPCION
  is 'descripcion transaccion';
comment on column SIMIT.MVTOAVVILLAS.DOCUMENTO
  is 'documento de la operacion';
comment on column SIMIT.MVTOAVVILLAS.ORIGEN
  is 'oficina origen de la transaccion';
comment on column SIMIT.MVTOAVVILLAS.VALORTOTAL
  is 'valor total';
comment on column SIMIT.MVTOAVVILLAS.VALOREFECTIVO
  is 'valor efectivo';
comment on column SIMIT.MVTOAVVILLAS.VALORCHEQUE
  is 'valor cheque';
comment on column SIMIT.MVTOAVVILLAS.DEBITOCREDITO
  is 'debito o credito';
comment on column SIMIT.MVTOAVVILLAS.CODIGOTRN
  is 'codigo transaccion';
comment on column SIMIT.MVTOAVVILLAS.NUMEROTRX
  is 'numero de transaccion';
comment on column SIMIT.MVTOAVVILLAS.QUINCENA
  is 'quincena del mvto';

prompt
prompt Creating table MVTOAVVILLAS_TEMP
prompt ================================
prompt
create table SIMIT.MVTOAVVILLAS_TEMP
(
  NUMEROCUENTA     VARCHAR2(16),
  PERIODO          CHAR(6),
  FECHAAPLICACION  DATE,
  FECHATRANSACCION DATE,
  DESCRIPCION      VARCHAR2(250),
  DOCUMENTO        VARCHAR2(20),
  ORIGEN           VARCHAR2(250),
  VALORTOTAL       NUMBER,
  VALOREFECTIVO    NUMBER,
  VALORCHEQUE      NUMBER,
  DEBITOCREDITO    VARCHAR2(5),
  CODIGOTRN        VARCHAR2(50),
  QUINCENA         CHAR(2)
)
;

prompt
prompt Creating table TRXSINIDENTIFICAR
prompt ================================
prompt
create table SIMIT.TRXSINIDENTIFICAR
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
comment on column SIMIT.TRXSINIDENTIFICAR.IDBANCO
  is 'banco';
comment on column SIMIT.TRXSINIDENTIFICAR.CUENTA
  is 'cuenta';
comment on column SIMIT.TRXSINIDENTIFICAR.PERIODO
  is 'periodo';
comment on column SIMIT.TRXSINIDENTIFICAR.NUMEROTRX
  is 'numero de trx';
comment on column SIMIT.TRXSINIDENTIFICAR.FECHATRX
  is 'fecha de transaccion';
comment on column SIMIT.TRXSINIDENTIFICAR.DESCRIPCIONTRX
  is 'descripcion de transaccion';
comment on column SIMIT.TRXSINIDENTIFICAR.VALORTRX
  is 'valor transaccion';
comment on column SIMIT.TRXSINIDENTIFICAR.OFICINAORIGEN
  is 'oficina origen';
comment on column SIMIT.TRXSINIDENTIFICAR.INDTIPO
  is 'indicador tipo';
comment on column SIMIT.TRXSINIDENTIFICAR.IDMUNICIPIO
  is 'divipo propuesto';
comment on column SIMIT.TRXSINIDENTIFICAR.P_CONSIGNADO
  is 'porcentaje consignado';
comment on column SIMIT.TRXSINIDENTIFICAR.FECHACARGUE
  is 'fecha de cargue del registro';
comment on column SIMIT.TRXSINIDENTIFICAR.USUARIOCARGUE
  is 'usuario de cargue del registro';
comment on column SIMIT.TRXSINIDENTIFICAR.FECHAIDENTIFICACION
  is 'fecha de identificacion';
comment on column SIMIT.TRXSINIDENTIFICAR.USUARIOIDENTIFICACION
  is 'usuario que realizo la identificacion';
comment on column SIMIT.TRXSINIDENTIFICAR.INDTIPOIDEN
  is 'indicador tipo identificado';
comment on column SIMIT.TRXSINIDENTIFICAR.IDMUNICIPIOIDEN
  is 'municipio identificado';
comment on column SIMIT.TRXSINIDENTIFICAR.P_CONSIGNADOIDEN
  is 'porcentaje identificado';
comment on column SIMIT.TRXSINIDENTIFICAR.OBSERVACIONES
  is 'observaciones sobre la identificacion';
comment on column SIMIT.TRXSINIDENTIFICAR.NUMSECUENCIAREG
  is 'secuencia de la identificacion';
comment on column SIMIT.TRXSINIDENTIFICAR.ESTADOIDEN
  is 'SI: Sin identificar, ID: Identificado, AN:Anulado';
comment on column SIMIT.TRXSINIDENTIFICAR.CONCESIONARIOZON
  is 'Concesionario zonal';
comment on column SIMIT.TRXSINIDENTIFICAR.REFERENCIA
  is 'Referencia de transaccion';
comment on column SIMIT.TRXSINIDENTIFICAR.QUINCENA
  is 'Quincena del movimiento de avvillas';
comment on column SIMIT.TRXSINIDENTIFICAR.FECHALIQ
  is 'fecha liquidacion';
alter table SIMIT.TRXSINIDENTIFICAR
  add constraint PK_TRXSINIDENTIFICAR primary key (NUMSECUENCIAREG);


spool off
