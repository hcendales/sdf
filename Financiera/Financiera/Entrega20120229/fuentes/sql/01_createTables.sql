---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 29/02/2012, 15:37:58 --
---------------------------------------------

spool 01_createTables.log

prompt
prompt Creating table DEPARTAMENTAL
prompt ============================
prompt
create table DEPARTAMENTAL
(
  IDDPTAL     CHAR(8) not null,
  IDMUNICIPIO CHAR(8) not null
)
;
comment on column DEPARTAMENTAL.IDDPTAL
  is 'departamental';
comment on column DEPARTAMENTAL.IDMUNICIPIO
  is 'municipio';
alter table DEPARTAMENTAL
  add constraint PK_DPTAL primary key (IDDPTAL, IDMUNICIPIO);

  
prompt
prompt Creating table IDEMASIVO_TEMP
prompt =============================
prompt
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

prompt
prompt Creating table NOVDEVOLUCION
prompt ============================
prompt
create table NOVDEVOLUCION
(
  TIPOIDENTIFICACION   CHAR(1) not null,
  IDENTIFICACION       NUMBER not null,
  NOMBRE               VARCHAR2(50) not null,
  IDBANCO              CHAR(2) not null,
  TIPOCUENTA           VARCHAR2(3) not null,
  CUENTA               VARCHAR2(16) not null,
  IDCONCESIONARIO      CHAR(2) not null,
  INDTIPO              CHAR(5) not null,
  IDMUNICIPIO          CHAR(8) not null,
  MOTIVO               VARCHAR2(50) not null,
  VDEVOLUCION          NUMBER not null,
  VCONCESIONARIO       NUMBER not null,
  VFCM                 NUMBER not null,
  VFONDOCOBERTURAFCM   NUMBER not null,
  VFONDOCOBERTURALIQ   NUMBER not null,
  VEQUILIBRIOECONOMICO NUMBER not null,
  VSEVIAL              NUMBER not null,
  VFCMPOLCA            NUMBER not null,
  VMUNICIPIO           NUMBER not null,
  VFCMCONTRAVENCIONAL  NUMBER not null,
  VCONCONTRAVENCIONAL  NUMBER not null,
  TIPONOV              CHAR(2) not null,
  NUMERONOV            NUMBER not null,
  FECHANOV             DATE not null,
  USUARIONOV           NUMBER not null,
  USUARIOVAL           NUMBER,
  FECHAVAL             DATE,
  FECHAACT             DATE,
  ESTADONOV            VARCHAR2(16),
  FIRMA1               VARCHAR2(250),
  FIRMA2               VARCHAR2(250),
  USUARIOANUL          NUMBER,
  FECHAANUL            DATE,
  FECHAAPLICACION      DATE,
  VPOLCA               NUMBER,
  CUENTAREC            VARCHAR2(16),
  DNSGRANBANCO         VARCHAR2(16),
  DNSAVVILLAS          VARCHAR2(16),
  INDCOBRO             NUMBER,
  FECHACOBRO           DATE,
  REFERENCIATRF        NUMBER,
  OBSERVACIONES        VARCHAR2(250),
  VADICIONAL           NUMBER,
  FECHACOBRO2          DATE,
  VIVACONTRCONC        NUMBER,
  VIVACONTRFCM         NUMBER,
  VRETECONTR           NUMBER,
  INDIVA               CHAR(1),
  INDRETE              CHAR(1),
  NUMLIQUIDACION       VARCHAR2(10),
  TIPOIDENTIFICACION1  CHAR(1),
  IDENTIFICACION1      NUMBER,
  IDBANCOREC           CHAR(2),
  IDCONCESIONARIOZON   CHAR(2),
  VSEVIAL27            NUMBER,
  VIVASEVIAL27         NUMBER,
  VIVAFCMPOLCA         NUMBER,
  FECPAGLIQ            DATE,
  VTIMBRE              NUMBER,
  VRETEF               NUMBER,
  VSEVIALNETO          NUMBER,
  VFCMPOLCANETO        NUMBER,
  VFCMCONNETO          NUMBER,
  VOPECONNETO          NUMBER,
  VMUNNETO             NUMBER,
  VPOLCANETO           NUMBER
)
;
comment on column NOVDEVOLUCION.VCONCESIONARIO
  is 'Valor en polca 3.25';
comment on column NOVDEVOLUCION.VFCM
  is 'Valos en polca 1.25 + 2 = 3.25';
comment on column NOVDEVOLUCION.VFONDOCOBERTURAFCM
  is 'Valor en polca 0.25';
comment on column NOVDEVOLUCION.VFONDOCOBERTURALIQ
  is 'Valor en polca 0.25';
comment on column NOVDEVOLUCION.VEQUILIBRIOECONOMICO
  is 'Valor en polca  simit capital 1.77 + 2 = 3.77';
comment on column NOVDEVOLUCION.VSEVIAL
  is 'Valor sevial 3';
comment on column NOVDEVOLUCION.VFCMPOLCA
  is 'Valor 1.8';
comment on column NOVDEVOLUCION.VMUNICIPIO
  is 'Valor municipio descontado los valores contravencionales, sin incluir impuestos';
comment on column NOVDEVOLUCION.VFCMCONTRAVENCIONAL
  is 'Valor 9.5';
comment on column NOVDEVOLUCION.VCONCONTRAVENCIONAL
  is 'Valor 9.5';
comment on column NOVDEVOLUCION.VPOLCA
  is 'Valor 40.5';
comment on column NOVDEVOLUCION.VIVACONTRCONC
  is 'Iva del 9.5';
comment on column NOVDEVOLUCION.VIVACONTRFCM
  is 'Iva del 9.5';
comment on column NOVDEVOLUCION.VRETECONTR
  is 'Retefuente del 9.5';
comment on column NOVDEVOLUCION.VSEVIAL27
  is 'Valor sevial 2.7';
comment on column NOVDEVOLUCION.VIVASEVIAL27
  is 'Iva del 2.7';
comment on column NOVDEVOLUCION.VIVAFCMPOLCA
  is 'Iva del 1.8';
comment on column NOVDEVOLUCION.FECPAGLIQ
  is 'Fecha original cuando se pago la liquidacion';
comment on column NOVDEVOLUCION.VTIMBRE
  is 'Timbre del  sevial 2.7';
comment on column NOVDEVOLUCION.VRETEF
  is 'Retefuente de sevial 2.7';
comment on column NOVDEVOLUCION.VSEVIALNETO
  is '3 + 2.7 - 1.5%*2.7 - 11%*2.7 + 2.7*16%';
comment on column NOVDEVOLUCION.VFCMPOLCANETO
  is '1.8 + 1.8*16% + 1.5%*2.7 + 11%2.7';
comment on column NOVDEVOLUCION.VFCMCONNETO
  is '9.5 + 9.5*16% + 9.5*11% ';
comment on column NOVDEVOLUCION.VOPECONNETO
  is '9.5 + 9.5*16% - 9.5*11% ';
comment on column NOVDEVOLUCION.VMUNNETO
  is ' -IVA19 + Vadicional';
comment on column NOVDEVOLUCION.VPOLCANETO
  is ' 40.5 - 16%*2.7 - 16%*1.8';
alter table NOVDEVOLUCION
  add constraint PK_NOVDEVOLUCION primary key (TIPONOV, NUMERONOV);
alter table NOVDEVOLUCION
  add constraint FK_NOVDEVBANCO foreign key (IDBANCO)
  references BANCO (IDBANCO);
alter table NOVDEVOLUCION
  add constraint FK_NOVDEVCONCES foreign key (IDCONCESIONARIO)
  references CONCESIONARIO (IDCONCESIONARIO);
alter table NOVDEVOLUCION
  add constraint FK_NOVDEVMUNICIPIO foreign key (IDMUNICIPIO)
  references MUNICIPIO (IDMUNICIPIO);
alter table NOVDEVOLUCION
  add constraint CH_NOVDEVTIPCOM
  check (indtipo in ('SIMIT', 'POLCA'));
alter table NOVDEVOLUCION
  add constraint CH_NOVDEVTIPCTA
  check (tipocuenta IN ('AHO','CTE'));

prompt
prompt Creating table RECAUDO_LOCAL_DISP_TOT
prompt =====================================
prompt
create table RECAUDO_LOCAL_DISP_TOT
(
  FEC_CORTE_INI        DATE,
  FEC_CORTE_FIN        DATE,
  FEC_DISPERSION       DATE,
  CONCEPTO             VARCHAR2(250),
  ORI_IDBANCO          CHAR(2),
  ORI_TIPOCUENTA       VARCHAR2(3),
  ORI_CUENTA           VARCHAR2(16),
  ORI_NIT              VARCHAR2(10),
  DES_IDBANCO          CHAR(2),
  DES_TIPOCUENTA       VARCHAR2(3),
  DES_CUENTA           VARCHAR2(250),
  DES_NIT              VARCHAR2(10),
  VALOR                NUMBER,
  ENVIADOBANCO         NUMBER,
  REFERENCIATRF        NUMBER,
  ESTADOTRF            CHAR(3),
  FECHAENVIO           DATE,
  FECHACONFIRMADA      DATE,
  FECHADEVOLUCION      DATE,
  MOTIVODEVOLUCION     VARCHAR2(100),
  CODIGODEVOLUCION     VARCHAR2(7),
  FECHAENVIOACH        DATE,
  ORDEN                NUMBER,
  ID_CONCESIONARIO_LIQ CHAR(2),
  INDTIPO              CHAR(5)
)
;

prompt
prompt Creating table VISTOBUENO
prompt =========================
prompt
create table VISTOBUENO
(
  FECHAREGISTRO   DATE,
  USUARIOREGISTRO NUMBER,
  TIPORECAUDO     CHAR(1),
  TIPOPROCESO     CHAR(1),
  FECHAINICIO     DATE,
  FECHAFIN        DATE,
  BANCO           CHAR(2),
  OBSERVACIONES   VARCHAR2(500),
  INTERVENTORIA   CHAR(1)
)
;
comment on column VISTOBUENO.FECHAREGISTRO
  is 'Fecha de registro';
comment on column VISTOBUENO.USUARIOREGISTRO
  is 'usuario que dio visto bueno';
comment on column VISTOBUENO.TIPORECAUDO
  is 'tipo de recaudo. L: Local, E:Externo';
comment on column VISTOBUENO.TIPOPROCESO
  is 'tipo de proceso. D:Distribucion T:Transferencia';
comment on column VISTOBUENO.FECHAINICIO
  is 'fecha de inicio';
comment on column VISTOBUENO.FECHAFIN
  is 'fecha de fin';
comment on column VISTOBUENO.BANCO
  is 'banco recaudador';
comment on column VISTOBUENO.OBSERVACIONES
  is 'observaciones';
comment on column VISTOBUENO.INTERVENTORIA
  is 'interventoria que da el visto bueno: S:Simit, P:POLCA';

prompt
prompt Creating table TRXSINIDENTIFICAR
prompt ================================
prompt
drop table TRXSINIDENTIFICAR cascade constraints;
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


spool off
