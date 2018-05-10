CREATE OR REPLACE PROCEDURE "SP_V_USUARIO" (p_usuario varchar2, p_error OUT VARCHAR2, p_modulo VARCHAR2) is
  v_valida    NUMBER;
  w_usuario  number;
begin
  w_usuario := TO_NUMBER(p_usuario);

   select COUNT(*) INTO v_valida from person p WHERE p.idperson = w_usuario;

   IF v_valida = 0 THEN
     p_error := 'El usuario no existe';
     return;
  end if;

   If upper(p_modulo) = 'PK_PROC' THEN 
     RETURN;
     END IF;
     
   select COUNT(*) INTO v_valida
   from rolxperson rp, rol r
   WHERE rp.personid = w_usuario
     and rp.rolid = r.rolid
     and r.enablemod = 1;
     
     
  IF v_valida = 0 THEN
     p_error := 'El usuario no puede realizar la accion';
     return;
  end if;



end sp_v_usuario;
/

