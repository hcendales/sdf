create or replace procedure sp_envioNotificacion(grupoRecibe in number,
                                            grupoCopia IN number,
                                            asunto in VARCHAR2,
                                            mensaje in VARCHAR2,
                                            p_usuario varchar2) is

correoRecibe varchar2(250);
correoCopia varchar2(250);
correoOculto varchar2(250);
correoSdf varchar2(250);
v_error   NUMBER := 0;

begin


    select g.correo
    into correoRecibe
    from grupo_correo g
    where g.idgrupo = grupoRecibe;

    if (grupoCopia > 0 ) then
      select g.correo
      into correoCopia
      from grupo_correo g
      where g.idgrupo = grupoCopia;
    end if;

    select g.correo
    into correoOculto
    from grupo_correo g
    where g.idgrupo = 1;

    select g.correo
    into correoSdf
    from grupo_correo g
    where g.idgrupo = 0;

    if (grupoCopia = -1 ) then
       select mail
       into correoCopia
       from person
       where idperson = p_usuario;
    end if;

-- 79938127 [liquida_recaudo_externo] ORA-06502: PL/SQL: numeric or value error: character to number conversion error ORA-06512: at "SIMIT.SP_ENVIARCORREO", line 57 ORA-29278: SMTP transient error: 421 Service not available 
    sp_enviarcorreo(envia => correoSdf,
                recibe => 'ricardo.buitrago@fcm.org.co',--correoRecibe,
                copia => correoCopia,
                oculto => correoOculto,
                asunto => asunto,
                mensaje => mensaje,
                p_usuario => p_usuario);

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [sp_envioNotificacion] ' || SQLERRM,
            v_error); 


end sp_envioNotificacion;
/

