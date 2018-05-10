----------------------------------------------
-- Export file for user SIMIT               --
-- Created by SEVEN on 19/12/2012, 18:04:59 --
----------------------------------------------

set define off
spool 01_ajusteDesencriptar.log

prompt
prompt Creating package PK_DESENCRIPTAR
prompt ================================
prompt
create or replace package simit.PK_DESENCRIPTAR is


  PROCEDURE i_archivoDesencriptar(p_nombreArchivo varchar2,
                                  p_archivo       blob,
                                  p_banco         varchar2,
                                  p_usuario       varchar2,
                                  p_codRespuesta  out number,
                                  p_error         OUT VARCHAR2,
                                  p_archivoDes  out blob,
                                  p_nomArchivoDes out varchar2
                                   );
 end PK_DESENCRIPTAR;
/

prompt
prompt Creating package body PK_DESENCRIPTAR
prompt =====================================
prompt
create or replace package body simit.PK_DESENCRIPTAR is

  PROCEDURE i_archivoDesencriptar(p_nombreArchivo varchar2,
                                  p_archivo       blob,
                                  p_banco         varchar2,
                                  p_usuario       varchar2,
                                  p_codRespuesta  out number,
                                  p_error         OUT VARCHAR2,
                                  p_archivoDes  out blob,
                                  p_nomArchivoDes out varchar2
                                   ) is
    p_uploadid number;

    vblob   BLOB;
    vstart  NUMBER := 1;
    bytelen NUMBER := 32000;
    len     NUMBER;
    my_vr   RAW(32000);
    x       NUMBER;

    l_output   utl_file.file_type;

    directorio varchar2(255);
    nomArchivo VARCHAR2(255);

    comando varchar(250);
    salida  varchar(250);

  begin
  
    select seq_uploads.nextval into p_uploadid from dual;
  
    insert into uploadBin
      (uploadid, filename, bfile, usuario, fecha, valida)
    values
      (p_uploadid,
       p_nombreArchivo,
       p_archivo,
       p_usuario,
       sysdate,
       to_number(p_banco));
  
    sp_log(p_usuario, 'i_archivoDesencriptar', p_nombreArchivo);
  
    p_error        := 'Cargado ok';
  
      -- define output directory
    directorio := 'TRFAVVILLAS';

    if (p_banco = '51') then
      directorio := 'TRFDAVIVIENDA';
    end if;

    l_output := utl_file.fopen(directorio, p_nombreArchivo, 'wb', 32760);

    vstart  := 1;
    bytelen := 32000;

    -- get length of blob
    SELECT dbms_lob.getlength(bFile)
      INTO len
      FROM uploadBin
     WHERE uploadid = p_uploadid;

    -- save blob length
    x := len;

    -- select blob into variable
    SELECT bfile INTO vblob FROM uploadBin WHERE uploadid = p_uploadid;

    -- if small enough for a single write
    IF len < 32760 THEN
      utl_file.put_raw(l_output, vblob);
      utl_file.fflush(l_output);
    ELSE
      -- write in pieces
      vstart := 1;
      WHILE vstart < len and bytelen > 0 LOOP
        dbms_lob.read(vblob, bytelen, vstart, my_vr);

        utl_file.put_raw(l_output, my_vr);
        utl_file.fflush(l_output);

        -- set the start position for the next cut
        vstart := vstart + bytelen;

        -- set the end position if less than 32000 bytes
        x := x - bytelen;
        IF x < 32000 THEN
          bytelen := x;
        END IF;
      END LOOP;
    END IF;

    utl_file.fclose(l_output);

    p_error := p_error || ' Grabado en directorio ok'; 

    comando := '/bin/sh /trfavvillas/desencriptarArchivo.sh ' ||
                   p_nombreArchivo;

    if (p_banco = '51') then
        comando := '/bin/sh /trfdavivienda/desencriptarArchivo.sh ' ||
                   p_nombreArchivo;
    end if;

    salida := Shell_Run(comando);

    if (substr(salida, 0, 2) <> '0:') then
        p_error := salida;
        return;
    end if;

    p_error := p_error || ' Desencriptado correctamente'; 

    nomArchivo := substr(p_nombreArchivo, 1, LENGTH(p_nombreArchivo) - 4);

    p_nomArchivoDes := nomArchivo;
    
    p_error := p_error || ' Archivo:' || nomArchivo; 
    p_codRespuesta := 0;
    
    commit;
  
  EXCEPTION
    WHEN OTHERS THEN
    sp_ex(SQLCODE,
            p_usuario || ' [i_archivoDesencriptar] ' || SQLERRM,
            p_error);
    p_codRespuesta := SQLCODE;
    p_error        := SQLERRM;
  END i_archivoDesencriptar;

end PK_DESENCRIPTAR;
/


spool off
