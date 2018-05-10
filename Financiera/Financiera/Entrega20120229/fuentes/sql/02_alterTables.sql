---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 29/02/2012, 15:37:58 --
---------------------------------------------

spool 02_alterTables.log

-- Add/modify columns 
alter table MVTOAVVILLAS add QUINCENA CHAR(2);
-- Add comments to the columns 
comment on column MVTOAVVILLAS.QUINCENA
  is 'quincena del mvto';

-- Add/modify columns 
alter table MVTOAVVILLAS_TEMP add QUINCENA CHAR(2);

-- Add/modify columns 
alter table RECAUDO_LOCAL_DISP add fec_corte_ini date;
alter table RECAUDO_LOCAL_DISP add fec_corte_fin date;
alter table RECAUDO_LOCAL_DISP add ID_CONCESIONARIO_LIQ CHAR(2);

-- Add comments to the columns 
comment on column RECAUDO_LOCAL_DISP.fec_corte_ini
  is 'fecha corte inicial';
comment on column RECAUDO_LOCAL_DISP.fec_corte_fin
  is 'fecha corte final';
comment on column ID_CONCESIONARIO_LIQ.fec_corte_fin
  is 'Concesionario liquida';

alter table CTA_RECAUDO_FCM add CTA_CONTABLE_IDE VARCHAR2(16);
-- Add comments to the columns 
comment on column CTA_RECAUDO_FCM.CTA_CONTABLE_IDE
  is 'Cuenta contable identificacion';

update  CTA_RECAUDO_FCM
set  CTA_CONTABLE_IDE = 'XXXXXXXXXX';

-- Add/modify columns 
alter table BANCO add CTACONTPERIODOANT VARCHAR2(16);
-- Add comments to the columns 
comment on column BANCO.CTACONTPERIODOANT
  is 'Cuenta contable para identificacion de partidas de periodos anteriores';

update BANCO
set CTACONTPERIODOANT = '4815590102';

-- Add/modify columns 
alter table RECAUDO_LOCAL_LIQUIDACION add IDRECAUDOLOCAL_LIQUIDACION number;
-- Add comments to the columns 
comment on column RECAUDO_LOCAL_LIQUIDACION.IDRECAUDOLOCAL_LIQUIDACION
  is 'REFEREFENCIA PARA CONTABILIZAR';

-- Add/modify columns 
alter table RECAUDO_LOCAL_LIQUIDACION add NIT_CONCESIONARIO CHAR(10);
alter table RECAUDO_LOCAL_LIQUIDACION add NIT_FONDO CHAR(10);
-- Add comments to the columns 
comment on column RECAUDO_LOCAL_LIQUIDACION.NIT_CONCESIONARIO
  is 'NIT CONCESIONARIO';
comment on column RECAUDO_LOCAL_LIQUIDACION.NIT_FONDO
  is 'Nit fondo';


-- Add/modify columns 
alter table CONCESIONARIO add CTA_CONT_PERIOD_ANT VARCHAR2(16);
-- Add comments to the columns 
comment on column CONCESIONARIO.CTA_CONT_PERIOD_ANT
  is 'Cuenta contable para identificacionde periodos anteriores';

  -- Add/modify columns 
alter table CONCESIONARIO add CTA_CONT_PERIOD_ANTFCM VARCHAR2(16);
-- Add comments to the columns 
comment on column CONCESIONARIO.CTA_CONT_PERIOD_ANTFCM
  is 'Cuenta contable para identificacionde periodos anteriores fcm';

update CONCESIONARIO
set CTA_CONT_PERIOD_ANT = '5815930102';

update CONCESIONARIO  
set CTA_CONT_PERIOD_ANTFCM = '5815930101';
  
-- Add/modify columns 
alter table RECAUDO_EXTERNO_DISP_TOT add VLRDISP number;
alter table RECAUDO_EXTERNO_DISP_TOT add DES_IDBANCOREV CHAR(2);
alter table RECAUDO_EXTERNO_DISP_TOT add DES_TIPOCUENTAREV VARCHAR2(3);
alter table RECAUDO_EXTERNO_DISP_TOT add DES_CUENTAREV VARCHAR2(250);
alter table RECAUDO_EXTERNO_DISP_TOT add DES_NITREV VARCHAR2(10);
alter table RECAUDO_EXTERNO_DISP_TOT add REFERENCIATRFORI number;

-- Add comments to the columns 
comment on column RECAUDO_EXTERNO_DISP_TOT.VLRDISP
  is 'valor disponible para cobros';


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
 
spool off
