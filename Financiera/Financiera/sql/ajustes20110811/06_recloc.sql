-- Add/modify columns 
alter table RECAUDO_LOCAL_DISP add fec_corte_ini date;
alter table RECAUDO_LOCAL_DISP add fec_corte_fin date;
-- Add comments to the columns 
comment on column RECAUDO_LOCAL_DISP.fec_corte_ini
  is 'fecha corete inciial';
comment on column RECAUDO_LOCAL_DISP.fec_corte_fin
  is 'fecha corte final';
