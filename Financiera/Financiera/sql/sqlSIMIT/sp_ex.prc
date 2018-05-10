CREATE OR REPLACE PROCEDURE "SP_EX" (p_sqlcode number,
                                  p_message varchar2,
                                  p_error   OUT VARCHAR2) is
  v_id_errors NUMBER;
begin
  SELECT seq_errors.NEXTVAL INTO v_id_errors FROM dual;

  p_error := p_message;

  insert into errors
    (id_errors, fecha, sqlcode, message)
  values
    (v_id_errors, sysdate, p_sqlcode, p_message);
  COMMIT;

  if (p_sqlcode = -2292) then
    p_error := 'No se puede eliminar registro por que esta referenciado';
  end if;

  if (p_sqlcode = -1) then
    p_error := 'Registro existente';
  end if;

end sp_EX;
/

