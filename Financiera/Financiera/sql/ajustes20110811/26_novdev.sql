---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 02/02/2012, 14:25:22 --
---------------------------------------------

spool 26_novdev.log

prompt
prompt Creating table NOVDEVOLUCION
prompt ============================
prompt
create table SIMIT.NOVDEVOLUCION
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
comment on column SIMIT.NOVDEVOLUCION.VCONCESIONARIO
  is 'Valor en polca 3.25';
comment on column SIMIT.NOVDEVOLUCION.VFCM
  is 'Valos en polca 1.25 + 2 = 3.25';
comment on column SIMIT.NOVDEVOLUCION.VFONDOCOBERTURAFCM
  is 'Valor en polca 0.25';
comment on column SIMIT.NOVDEVOLUCION.VFONDOCOBERTURALIQ
  is 'Valor en polca 0.25';
comment on column SIMIT.NOVDEVOLUCION.VEQUILIBRIOECONOMICO
  is 'Valor en polca  simit capital 1.77 + 2 = 3.77';
comment on column SIMIT.NOVDEVOLUCION.VSEVIAL
  is 'Valor sevial 3';
comment on column SIMIT.NOVDEVOLUCION.VFCMPOLCA
  is 'Valor 1.8';
comment on column SIMIT.NOVDEVOLUCION.VMUNICIPIO
  is 'Valor municipio descontado los valores contravencionales, sin incluir impuestos';
comment on column SIMIT.NOVDEVOLUCION.VFCMCONTRAVENCIONAL
  is 'Valor 9.5';
comment on column SIMIT.NOVDEVOLUCION.VCONCONTRAVENCIONAL
  is 'Valor 9.5';
comment on column SIMIT.NOVDEVOLUCION.VPOLCA
  is 'Valor 40.5';
comment on column SIMIT.NOVDEVOLUCION.VIVACONTRCONC
  is 'Iva del 9.5';
comment on column SIMIT.NOVDEVOLUCION.VIVACONTRFCM
  is 'Iva del 9.5';
comment on column SIMIT.NOVDEVOLUCION.VRETECONTR
  is 'Retefuente del 9.5';
comment on column SIMIT.NOVDEVOLUCION.VSEVIAL27
  is 'Valor sevial 2.7';
comment on column SIMIT.NOVDEVOLUCION.VIVASEVIAL27
  is 'Iva del 2.7';
comment on column SIMIT.NOVDEVOLUCION.VIVAFCMPOLCA
  is 'Iva del 1.8';
comment on column SIMIT.NOVDEVOLUCION.FECPAGLIQ
  is 'Fecha original cuando se pago la liquidacion';
comment on column SIMIT.NOVDEVOLUCION.VTIMBRE
  is 'Timbre del  sevial 2.7';
comment on column SIMIT.NOVDEVOLUCION.VRETEF
  is 'Retefuente de sevial 2.7';
comment on column SIMIT.NOVDEVOLUCION.VSEVIALNETO
  is '3 + 2.7 - 1.5%*2.7 - 11%*2.7 + 2.7*16%';
comment on column SIMIT.NOVDEVOLUCION.VFCMPOLCANETO
  is '1.8 + 1.8*16% + 1.5%*2.7 + 11%2.7';
comment on column SIMIT.NOVDEVOLUCION.VFCMCONNETO
  is '9.5 + 9.5*16% + 9.5*11% ';
comment on column SIMIT.NOVDEVOLUCION.VOPECONNETO
  is '9.5 + 9.5*16% - 9.5*11% ';
comment on column SIMIT.NOVDEVOLUCION.VMUNNETO
  is ' -IVA19 + Vadicional';
comment on column SIMIT.NOVDEVOLUCION.VPOLCANETO
  is ' 40.5 - 16%*2.7 - 16%*1.8';
alter table SIMIT.NOVDEVOLUCION
  add constraint PK_NOVDEVOLUCION primary key (TIPONOV, NUMERONOV);
alter table SIMIT.NOVDEVOLUCION
  add constraint FK_NOVDEVBANCO foreign key (IDBANCO)
  references SIMIT.BANCO (IDBANCO);
alter table SIMIT.NOVDEVOLUCION
  add constraint FK_NOVDEVCONCES foreign key (IDCONCESIONARIO)
  references SIMIT.CONCESIONARIO (IDCONCESIONARIO);
alter table SIMIT.NOVDEVOLUCION
  add constraint FK_NOVDEVMUNICIPIO foreign key (IDMUNICIPIO)
  references SIMIT.MUNICIPIO (IDMUNICIPIO);
alter table SIMIT.NOVDEVOLUCION
  add constraint CH_NOVDEVTIPCOM
  check (indtipo in ('SIMIT', 'POLCA'));
alter table SIMIT.NOVDEVOLUCION
  add constraint CH_NOVDEVTIPCTA
  check (tipocuenta IN ('AHO','CTE'));


spool off
