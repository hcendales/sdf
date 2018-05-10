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
 

BEGIN

--    comando := '/usr/bin/ssh oracle@172.168.100.10 "echo '|| chr(39) || '"' ||  asunto || '"' || chr(39) || ' | mail -s '||chr(39)|| '"' || mensaje || '"' || chr(39)|| ' ' || RECIBE  || '"';
    comando := '/bin/sh /trfavvillas/envioCorreo.sh '||replace(MENSAJE,' ','_')||' '||replace(ASUNTO,' ','_')||' ' || RECIBE  ;
--    comando := '/bin/sh /trfavvillas/envioCorreo.sh "'||chr(39) || MENSAJE || chr(39) || '" ' || replace(ASUNTO,' ','_')||' ' || RECIBE  ;
      
  /*
   select texto
   into comando
   from correo;
*/

    dbms_output.put_line(comando);
    
    salida := Shell_Run(comando);
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

