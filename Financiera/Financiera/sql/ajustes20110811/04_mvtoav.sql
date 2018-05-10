spool 04_mvtoav.log

prompt PL/SQL Developer import file
prompt Created on jueves, 11 de agosto de 2011 by user
set feedback off
set define off
prompt Dropping MVTOAVVILLAS...
drop table MVTOAVVILLAS cascade constraints;
prompt Dropping MVTOAVVILLAS_TEMP...
drop table MVTOAVVILLAS_TEMP cascade constraints;
prompt Creating MVTOAVVILLAS...
create table MVTOAVVILLAS
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
comment on column MVTOAVVILLAS.NUMEROCUENTA
  is 'numero cuenta';
comment on column MVTOAVVILLAS.PERIODO
  is 'fecha del periodo';
comment on column MVTOAVVILLAS.FECHAAPLICACION
  is 'fecha de aplicacion';
comment on column MVTOAVVILLAS.FECHATRANSACCION
  is 'fecha de transaccion';
comment on column MVTOAVVILLAS.DESCRIPCION
  is 'descripcion transaccion';
comment on column MVTOAVVILLAS.DOCUMENTO
  is 'documento de la operacion';
comment on column MVTOAVVILLAS.ORIGEN
  is 'oficina origen de la transaccion';
comment on column MVTOAVVILLAS.VALORTOTAL
  is 'valor total';
comment on column MVTOAVVILLAS.VALOREFECTIVO
  is 'valor efectivo';
comment on column MVTOAVVILLAS.VALORCHEQUE
  is 'valor cheque';
comment on column MVTOAVVILLAS.DEBITOCREDITO
  is 'debito o credito';
comment on column MVTOAVVILLAS.CODIGOTRN
  is 'codigo transaccion';
comment on column MVTOAVVILLAS.NUMEROTRX
  is 'numero de transaccion';
comment on column MVTOAVVILLAS.QUINCENA
  is 'quincena del mvto';

prompt Creating MVTOAVVILLAS_TEMP...
create table MVTOAVVILLAS_TEMP
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

prompt Loading MVTOAVVILLAS...
prompt Table is empty
prompt Loading MVTOAVVILLAS_TEMP...
prompt Table is empty
set feedback on
set define on
prompt Done.

spool off
