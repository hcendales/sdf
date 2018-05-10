spool 04b_trecloc.log
prompt PL/SQL Developer import file
prompt Created on martes, 16 de agosto de 2011 by user
set feedback off
set define off
prompt Dropping RECAUDO_LOCAL_DISP...
drop table RECAUDO_LOCAL_DISP cascade constraints;
prompt Dropping RECAUDO_LOCAL_DISP_TOT...
drop table RECAUDO_LOCAL_DISP_TOT cascade constraints;
prompt Creating RECAUDO_LOCAL_DISP...
create table RECAUDO_LOCAL_DISP
(
  FEC_CORTE            DATE,
  FEC_DISPERSION       DATE,
  IDCONCESIONARIO      CHAR(2),
  ORDEN                NUMBER,
  CONCEPTO             VARCHAR2(250),
  ORI_IDBANCO          CHAR(2),
  ORI_TIPOCUENTA       VARCHAR2(3),
  ORI_CUENTA           VARCHAR2(16),
  ORI_NIT              VARCHAR2(10),
  DES_IDBANCO          CHAR(2),
  DES_TIPOCUENTA       VARCHAR2(3),
  DES_CUENTA           VARCHAR2(250),
  DES_NIT              VARCHAR2(10),
  INDTIPO              VARCHAR2(5),
  USUARIO_PROCESO      VARCHAR2(20),
  FECHA_PROCESO        DATE,
  VALOR                NUMBER,
  DEB_CTA_CON          VARCHAR2(16),
  DEB_CEN_COS          VARCHAR2(16),
  DEB_NIT_TER          VARCHAR2(16),
  CRE_CTA_CON          VARCHAR2(16),
  CRE_CEN_COS          VARCHAR2(16),
  CRE_NIT_TER          VARCHAR2(16),
  CONCEPTO_CON         VARCHAR2(250),
  FEC_CORTE_INI        DATE,
  FEC_CORTE_FIN        DATE,
  ID_CONCESIONARIO_LIQ CHAR(2)
)
;
comment on column RECAUDO_LOCAL_DISP.FEC_CORTE
  is 'Fecha corte';
comment on column RECAUDO_LOCAL_DISP.FEC_DISPERSION
  is 'fecha dispersion';
comment on column RECAUDO_LOCAL_DISP.IDCONCESIONARIO
  is 'concesionario liquidador';
comment on column RECAUDO_LOCAL_DISP.ORDEN
  is 'orden del comprobante';
comment on column RECAUDO_LOCAL_DISP.CONCEPTO
  is 'concepto contable';
comment on column RECAUDO_LOCAL_DISP.ORI_IDBANCO
  is 'banco origen';
comment on column RECAUDO_LOCAL_DISP.ORI_TIPOCUENTA
  is 'tipo de cuenta (Aho, Cte)';
comment on column RECAUDO_LOCAL_DISP.ORI_CUENTA
  is 'cuenta origen';
comment on column RECAUDO_LOCAL_DISP.ORI_NIT
  is 'nit cuenta origen';
comment on column RECAUDO_LOCAL_DISP.DES_IDBANCO
  is 'banco destino';
comment on column RECAUDO_LOCAL_DISP.DES_TIPOCUENTA
  is 'tipo de cuenta destino';
comment on column RECAUDO_LOCAL_DISP.DES_CUENTA
  is 'cuenta destino';
comment on column RECAUDO_LOCAL_DISP.DES_NIT
  is 'nit destino';
comment on column RECAUDO_LOCAL_DISP.INDTIPO
  is 'tipo de comaprendo (SIMIT, POLCA)';
comment on column RECAUDO_LOCAL_DISP.USUARIO_PROCESO
  is 'usuario proceso';
comment on column RECAUDO_LOCAL_DISP.FECHA_PROCESO
  is 'fecha proceso';
comment on column RECAUDO_LOCAL_DISP.VALOR
  is 'valor';
comment on column RECAUDO_LOCAL_DISP.DEB_CTA_CON
  is 'cuenta contable debito';
comment on column RECAUDO_LOCAL_DISP.DEB_CEN_COS
  is 'centro de costo debito';
comment on column RECAUDO_LOCAL_DISP.DEB_NIT_TER
  is 'nit tercero debito';
comment on column RECAUDO_LOCAL_DISP.CRE_CTA_CON
  is 'cuenta contable credito';
comment on column RECAUDO_LOCAL_DISP.CRE_CEN_COS
  is 'centro de costo credito';
comment on column RECAUDO_LOCAL_DISP.CRE_NIT_TER
  is 'nit tercero credito';
comment on column RECAUDO_LOCAL_DISP.CONCEPTO_CON
  is 'concepto contable';
comment on column RECAUDO_LOCAL_DISP.FEC_CORTE_INI
  is 'fecha corete inciial';
comment on column RECAUDO_LOCAL_DISP.FEC_CORTE_FIN
  is 'fecha corte final';
comment on column RECAUDO_LOCAL_DISP.ID_CONCESIONARIO_LIQ
  is 'concesionario';

prompt Creating RECAUDO_LOCAL_DISP_TOT...
create table RECAUDO_LOCAL_DISP_TOT
(
  FEC_CORTE_INI    DATE,
  FEC_CORTE_FIN    DATE,
  FEC_DISPERSION   DATE,
  CONCEPTO         VARCHAR2(250),
  ORI_IDBANCO      CHAR(2),
  ORI_TIPOCUENTA   VARCHAR2(3),
  ORI_CUENTA       VARCHAR2(16),
  ORI_NIT          VARCHAR2(10),
  DES_IDBANCO      CHAR(2),
  DES_TIPOCUENTA   VARCHAR2(3),
  DES_CUENTA       VARCHAR2(250),
  DES_NIT          VARCHAR2(10),
  VALOR            NUMBER,
  ENVIADOBANCO     NUMBER,
  REFERENCIATRF    NUMBER,
  ESTADOTRF        CHAR(3),
  FECHAENVIO       DATE,
  FECHACONFIRMADA  DATE,
  FECHADEVOLUCION  DATE,
  MOTIVODEVOLUCION VARCHAR2(100),
  CODIGODEVOLUCION VARCHAR2(7),
  FECHAENVIOACH    DATE
)
;

prompt Loading RECAUDO_LOCAL_DISP...
prompt Table is empty
prompt Loading RECAUDO_LOCAL_DISP_TOT...
prompt Table is empty
set feedback on
set define on
prompt Done.

spool off

