spool 20_tablas.log


-- Add/modify columns 
alter table RECAUDO_LOCAL_LIQUIDACION add NIT_CONCESIONARIO CHAR(10);
alter table RECAUDO_LOCAL_LIQUIDACION add NIT_FONDO CHAR(10);
-- Add comments to the columns 
comment on column RECAUDO_LOCAL_LIQUIDACION.NIT_CONCESIONARIO
  is 'NIT CONCESIONARIO';
comment on column RECAUDO_LOCAL_LIQUIDACION.NIT_FONDO
  is 'Nit fondo';

spool off

  

