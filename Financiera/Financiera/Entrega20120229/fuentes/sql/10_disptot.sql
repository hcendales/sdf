-- Add/modify columns 
alter table RECAUDO_EXTERNO_DISP_TOT add FECHAACTREEENVIO date;
alter table RECAUDO_EXTERNO_DISP_TOT add FECHAREENVIO date;
alter table RECAUDO_EXTERNO_DISP_TOT add INDREENVIO CHAR(1);
-- Add comments to the columns 
comment on column RECAUDO_EXTERNO_DISP_TOT.FECHAACTREEENVIO
  is 'fecha en la que se activa el reenvio';
comment on column RECAUDO_EXTERNO_DISP_TOT.FECHAREENVIO
  is 'fecha de reeenvio';
comment on column RECAUDO_EXTERNO_DISP_TOT.INDREENVIO
  is 'indicador de reenvio';
