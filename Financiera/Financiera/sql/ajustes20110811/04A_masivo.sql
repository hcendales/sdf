spool 04a_masivo.log
prompt PL/SQL Developer import file
prompt Created on viernes, 12 de agosto de 2011 by user
set feedback off
set define off
prompt Creating IDEMASIVO_TEMP...
create table IDEMASIVO_TEMP
(
  CONCESIONARIO  VARCHAR2(50),
  ESTADO         VARCHAR2(50),
  PERIODO        VARCHAR2(50),
  CUENTA         VARCHAR2(50),
  MUNICIPIOPROP  VARCHAR2(400),
  DIVIPOPROP     VARCHAR2(50),
  TIPOPROP       VARCHAR2(50),
  PORCENTAJEPROP VARCHAR2(50),
  DIVIPOASIG     VARCHAR2(50),
  MUNICIPIOASIG  VARCHAR2(400),
  TIPOASIG       VARCHAR2(50),
  PORCENTAJEASIG NUMBER,
  VALORTRN       VARCHAR2(50),
  BANCO          VARCHAR2(50),
  CUENTATRN      VARCHAR2(50),
  PERIODOTRN     VARCHAR2(50),
  FECHATRN       VARCHAR2(50),
  DESCRIPCIONTRN VARCHAR2(250),
  OFICINATRN     VARCHAR2(250),
  SECUENCIATRN   NUMBER
)
;

prompt Loading IDEMASIVO_TEMP...
prompt Table is empty
set feedback on
set define on
prompt Done.

spool off
