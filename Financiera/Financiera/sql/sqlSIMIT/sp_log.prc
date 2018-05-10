CREATE OR REPLACE PROCEDURE "SP_LOG" (p_usuario varchar2,
                                   p_proceso varchar2,
                                   p_accion  varchar2) is
begin
  insert into log
    (fecha, usuario, proceso, accion)
  values
    (sysdate, p_usuario, p_proceso, p_accion);

end sp_log;
/

