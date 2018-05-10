prompt PL/SQL Developer import file
prompt Created on miércoles, 19 de octubre de 2011 by user
set feedback off
set define off
prompt Dropping NOVDEVOLUCION...
drop table NOVDEVOLUCION cascade constraints;
prompt Creating NOVDEVOLUCION...
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
  INDRETE              CHAR(1)
)
;
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

  
-- Add/modify columns 
alter table BANCO add CTACONTPERIODOANT VARCHAR2(16);
-- Add comments to the columns 
comment on column BANCO.CTACONTPERIODOANT
  is 'Cuenta contable para identificacion de partidas de periodos anteriores';

update BANCO
set CTACONTPERIODOANT = '4815590102';

commit;

-- Add/modify columns 
alter table RECAUDO_LOCAL_LIQUIDACION add IDRECAUDOLOCAL_LIQUIDACION number;
-- Add comments to the columns 
comment on column RECAUDO_LOCAL_LIQUIDACION.IDRECAUDOLOCAL_LIQUIDACION
  is 'REFEREFENCIA PARA CONTABILIZAR';

commit;
 
  
-- Add/modify columns 
alter table CONCESIONARIO add CTA_CONT_PERIOD_ANT VARCHAR2(16);
-- Add comments to the columns 
comment on column CONCESIONARIO.CTA_CONT_PERIOD_ANT
  is 'Cuenta contable para identificacionde periodos anteriores';

update CONCESIONARIO
set CTA_CONT_PERIOD_ANT = '5815930102';
  
commit;

-- Add/modify columns 
alter table RECAUDO_EXTERNO_DISP_TOT add VLRDISP number;
-- Add comments to the columns 
comment on column RECAUDO_EXTERNO_DISP_TOT.VLRDISP
  is 'valor disponible para cobros';

commit;
  
prompt Loading NOVDEVOLUCION...
prompt Table is empty
set feedback on
set define on
prompt Done.
