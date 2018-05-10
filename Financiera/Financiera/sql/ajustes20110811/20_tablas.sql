spool 20_tablas.log

prompt
prompt Creating table RECAUDO_LOCAL_DISP_TOT
prompt ============================
prompt

drop table SIMIT.RECAUDO_LOCAL_DISP_TOT;


-- Create table
create table SIMIT.RECAUDO_LOCAL_DISP_TOT
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
  ID_CONCESIONARIO_LIQ CHAR(2)
);

-- Add/modify columns 
alter table CTA_RECAUDO_FCM add CTA_CONTABLE_IDE VARCHAR2(16);
-- Add comments to the columns 
comment on column CTA_RECAUDO_FCM.CTA_CONTABLE_IDE
  is 'Cuenta contable para identificacion';


-- Add/modify columns 
alter table CTA_RECAUDO_FCM add CTA_CONTABLE_ING VARCHAR2(16);
-- Add comments to the columns 
comment on column CTA_RECAUDO_FCM.CTA_CONTABLE_ING
  is 'Cuenta contable para identificacion ingreso';

  
update CTA_RECAUDO_FCM  
set 
CTA_CONTABLE_IDE = 'XXXXXXXXXX',
CTA_CONTABLE_ING = 'ZZZZZZZZZZ';

commit;

-- Add/modify columns 
alter table RECAUDO_LOCAL_LIQUIDACION add NIT_CONCESIONARIO1 CHAR(10);
alter table RECAUDO_LOCAL_LIQUIDACION add NIT_FONDO1 CHAR(10);
-- Add comments to the columns 
comment on column RECAUDO_LOCAL_LIQUIDACION.NIT_CONCESIONARIO1
  is 'NIT CONCESIONARIO';
comment on column RECAUDO_LOCAL_LIQUIDACION.NIT_FONDO1
  is 'Nit fondo';

  

spool off

  

