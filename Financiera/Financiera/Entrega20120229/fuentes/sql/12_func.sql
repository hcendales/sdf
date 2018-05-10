---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 01/03/2012, 12:05:03 --
---------------------------------------------

spool 12_func.log

prompt
prompt Creating function FN_OBT_FECHA_PAGO
prompt ===================================
prompt
create or replace function FN_OBT_FECHA_PAGO(fecDisp date) return date is
  Result Date;
begin

  select max(fechaenvio)
  into Result
  from recaudo_externo_disp_tot
  where fec_dispersion = fecDisp;

  return(Result);

end FN_OBT_FECHA_PAGO;
/


spool off
