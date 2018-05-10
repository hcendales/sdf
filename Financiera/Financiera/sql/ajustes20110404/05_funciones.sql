---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 04/04/2011, 16:19:35 --
---------------------------------------------

spool 05_funciones.log

prompt
prompt Creating function TOKENIZE
prompt ==========================
prompt
create or replace function tokenize (str varchar2, delim char) return token_list as
ret token_list;
target int;
i int;
this_delim int;
last_delim int;
cadena varchar2(100);
cadenaOri varchar2(100);
strFin varchar(1000);

BEGIN

  target := splitter_count(str, '"');
  i := 1;

  if ( target > 1 ) then
  while i <= target
  loop
      this_delim := instr(str, '"', 1, i);
      last_delim := instr(str, '"', 1, i+1);
      cadena := substr(str,this_delim+1,last_delim - this_delim -1);
      cadenaOri := substr(str,this_delim,last_delim - this_delim + 1);

      if (delim <> ',' ) then
         cadena := replace(cadena,',','');
      end if;

      if (delim <> '$' ) then
         cadena := replace(cadena,'$','');
      end if;

      strFin := replace(str,cadenaOri, cadena);

      i := i + 2;

  end loop;

  end if;


  ret := token_list();

  i := 1;
  last_delim := 0;
  target := splitter_count(strFin, delim);
  while i <= target
  loop
    ret.extend();
    this_delim := instr(strFin, delim, 1, i);
    ret(i):= substr(strFin, last_delim + 1, this_delim - last_delim -1);
    i := i + 1;
    last_delim := this_delim;
  end loop;
  ret.extend();
  ret(i):= substr(strFin, last_delim + 1);
  return ret;
end;
/

prompt
prompt Creating procedure SP_ENVIARCORREO
prompt ==================================
prompt
CREATE OR REPLACE PROCEDURE sp_EnviarCorreo(ENVIA IN VARCHAR2,
                                            RECIBE IN VARCHAR2,
                                            COPIA IN VARCHAR2,
                                            OCULTO IN VARCHAR2,
                                            ASUNTO IN VARCHAR2,
                                            MENSAJE IN VARCHAR2,
                                            p_usuario varchar2)

 IS
  v_error  varchar2(300);
  mailhost VARCHAR2(250);
  mail_conn utl_smtp.connection;
  crlf VARCHAR2(2) := CHR(13) || CHR(10);
  mesg VARCHAR2(1000);
  comando varchar(1000);
  salida  varchar(250);
  archivo utl_file.file_type;
  input_buffer varchar2(1000);
  v_envio number;


BEGIN

--    comando := '/usr/bin/ssh oracle@172.168.100.10 "echo '|| chr(39) || '"' ||  asunto || '"' || chr(39) || ' | mail -s '||chr(39)|| '"' || mensaje || '"' || chr(39)|| ' ' || RECIBE  || '"';
--    comando := '/bin/sh /trfavvillas/envioCorreo.sh '||replace(MENSAJE,' ','_')||' '||replace(ASUNTO,' ','_')||' ' || RECIBE  ;
--    comando := '/bin/sh /trfavvillas/envioCorreo.sh "'||chr(39) || MENSAJE || chr(39) || '" ' || replace(ASUNTO,' ','_')||' ' || RECIBE  ;
    comando := '/bin/sh /trfavvillas/envioCorreo.sh&'||MENSAJE||'&'||ASUNTO||'&'||RECIBE;

     IF not (COPIA is null) THEN
       comando := comando ||','||COPIA;
     END IF;

     IF not (OCULTO is null) THEN
       comando := comando ||','||OCULTO;
     END IF;

     select ENVIACORREO
     into v_envio
     from fcm;

     if ( v_envio = 1 ) then
         salida := Shell_Run(comando);
     end if;

/*
    archivo := utl_file.fopen('TRFAVVILLAS', 'envioCorreo.sh.log', 'R');

    salida := '';
    LOOP
        BEGIN
             utl_file.get_line(archivo,input_buffer);
             salida := salida || input_buffer || chr(10);
                 dbms_output.put_line(salida);
        EXCEPTION
             when no_data_found then exit;
        END;
    END LOOP;


    utl_file.fclose(archivo);
*/

/*
  select f.servidorsmtp
  into mailhost
  from fcm f
  where f.nit_fcm = '8000826650';
  mail_conn := utl_smtp.open_connection(mailhost, 25);
  mesg := 'Date: ' || TO_CHAR(SYSDATE, 'dd Mon yy hh24:mi:ss') || crlf ||
          'From: <' || ENVIA || '>' || crlf ||
          'Subject: ' || ASUNTO || crlf ||
          'To: ' || RECIBE || crlf ||
          'CC: ' || COPIA || crlf ||
          'BCc: ' || OCULTO || crlf ||
          '' || crlf || MENSAJE;

  utl_smtp.helo(mail_conn, mailhost);
  utl_smtp.mail(mail_conn, ENVIA);
  utl_smtp.rcpt(mail_conn, RECIBE);
  utl_smtp.rcpt(mail_conn, COPIA);
  utl_smtp.rcpt(mail_conn, OCULTO);
  utl_smtp.data(mail_conn, mesg);
  utl_smtp.quit(mail_conn);
*/

  sp_log(p_usuario,
         'sp_EnviarCorreo',
         substr(RECIBE || '-' || ASUNTO || '-' || MENSAJE || '-' || salida,1,1000));
  commit;
EXCEPTION

  WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [sp_EnviarCorreo] ' || SQLERRM,
            v_error);

END sp_EnviarCorreo;
/


spool off
