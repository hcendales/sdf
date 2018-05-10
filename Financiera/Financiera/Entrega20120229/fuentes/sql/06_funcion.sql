--------------------------------------------
-- Export file for user SIMIT             --
-- Created by user on 01/03/2012, 8:00:56 --
--------------------------------------------

spool 06_funcion.log

prompt
prompt Creating function FN_DAR_PARCONTA
prompt =================================
prompt
create or replace function FN_DAR_PARCONTA(v_parametro varchar2) return varchar2 is
  Result Varchar2(50);
begin

  select parametro
  into Result
  from par_conta
  where idparametro = v_parametro;

  return(Result);

end FN_DAR_PARCONTA;
/


spool off
