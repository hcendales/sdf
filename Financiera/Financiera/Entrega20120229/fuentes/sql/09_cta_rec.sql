-- Add/modify columns 
alter table CTA_RECAUDO_CONCESIONARIO add CTA_CONTABLE_DEV VARCHAR2(16);
-- Add comments to the columns 
comment on column CTA_RECAUDO_CONCESIONARIO.CTA_CONTABLE_DEV
  is 'cuenta contable dev';
  
update cta_recaudo_concesionario
set CTA_CONTABLE_DEV = substr(CTA_CONTABLE_ING,1,8) || '04';

commit;

  
  