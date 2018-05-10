-- Add/modify columns 
alter table RECAUDO_EXTERNO_CONTABILIDAD add IDCONCESIONARIOZON CHAR(2);
alter table RECAUDO_EXTERNO_CONTABILIDAD add CUENTAREC VARCHAR2(16);
-- Add comments to the columns 
comment on column RECAUDO_EXTERNO_CONTABILIDAD.IDCONCESIONARIOZON
  is 'Concecionario liq o zonal';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.CUENTAREC
  is 'cuenta de recaudo';