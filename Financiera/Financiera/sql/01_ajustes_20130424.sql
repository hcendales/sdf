----------------------------------------------
-- Export file for user SIMITCURSO          --
-- Created by SEVEN on 24/04/2013, 11:12:15 --
----------------------------------------------

set define off
spool 01_ajustes_20130424.log

prompt
prompt Creating package PK_DIRECTORIO
prompt ==============================
prompt
create or replace package PK_DIRECTORIO is

  PROCEDURE i_archivo(p_filename varchar2,
                      p_cfile    clob,
                      p_usuario  varchar2,
                      p_error    OUT VARCHAR2);
  PROCEDURE v_archivoTrf(p_uploadid number,
                         p_usuario  varchar2,
                         p_error    OUT VARCHAR2);

  PROCEDURE cargarDir(p_uploadid NUMBER,
                      p_usuario  varchar2,
                      p_error    OUT VARCHAR2);

  PROCEDURE q_directorio(V_DIVIPO  varchar2,
                         v_usuario number,
                         
                         V_NOMSECRETARIA   out VARCHAR2,
                         V_SECRETARIO      out VARCHAR2,
                         V_CELULAR         out VARCHAR2,
                         V_FECHACUMPLEANOS out VARCHAR2,
                         V_ASISTENTE       out VARCHAR2,
                         V_TELASISTENTE    out VARCHAR2,
                         V_DIRECCION       out VARCHAR2,
                         V_INDICATIVO      out VARCHAR2,
                         V_TELEFONO1       out VARCHAR2,
                         V_TELEFONO2       out VARCHAR2,
                         V_TELEFONO3       out VARCHAR2,
                         V_TELEFONO4       out VARCHAR2,
                         V_CORREO          out VARCHAR2,
                         V_NIT             out VARCHAR2,
                         V_CATEGORIA       out VARCHAR2,
                         V_SOFTWARECONTR   out VARCHAR2,
                         V_IDCONCESIONARIO out VARCHAR2,
                         V_TIENECONVENIO   out VARCHAR2,
                         V_FECHACONVENIO   out DATE,
                         
                         v_cod_error out number,
                         v_msg_error out varchar2);

  PROCEDURE u_directorio(V_DIVIPO  varchar2,
                         v_usuario number,
                         
                         V_NOMSECRETARIA   VARCHAR2,
                         V_SECRETARIO      VARCHAR2,
                         V_CELULAR         VARCHAR2,
                         V_FECHACUMPLEANOS VARCHAR2,
                         V_ASISTENTE       VARCHAR2,
                         V_TELASISTENTE    VARCHAR2,
                         V_DIRECCION       VARCHAR2,
                         V_INDICATIVO      VARCHAR2,
                         V_TELEFONO1       VARCHAR2,
                         V_TELEFONO2       VARCHAR2,
                         V_TELEFONO3       VARCHAR2,
                         V_TELEFONO4       VARCHAR2,
                         V_CORREO          VARCHAR2,
                         V_NIT             VARCHAR2,
                         V_CATEGORIA       VARCHAR2,
                         V_SOFTWARECONTR   VARCHAR2,
                         V_TIENECONVENIO   VARCHAR2,
                         V_FECHACONVENIO   DATE,
                         
                         v_cod_error out number,
                         v_msg_error out varchar2);

end PK_DIRECTORIO;
/

prompt
prompt Creating package body PK_DIRECTORIO
prompt ===================================
prompt
create or replace package body PK_DIRECTORIO is

  PROCEDURE i_archivo(p_filename varchar2,
                      p_cfile    clob,
                      p_usuario  varchar2,
                      p_error    OUT VARCHAR2) is
    p_uploadid number;
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');
    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      select seq_uploads.nextval into p_uploadid from dual;
      insert into upload
        (uploadid, filename, cfile, usuario, fecha, valida)
      values
        (p_uploadid, p_filename, p_cfile, p_usuario, sysdate, 0);
      p_error := p_uploadid;
    END IF;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [i_archivo] ' || SQLERRM, p_error);
    
  END i_archivo;

  PROCEDURE v_archivoTrf(p_uploadid number,
                         p_usuario  varchar2,
                         p_error    OUT VARCHAR2) is
  
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');
    IF P_ERROR is null THEN
    
      cargarDir(p_uploadid => p_uploadid,
                p_usuario  => p_usuario,
                p_error    => p_error);
    
    end if;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [v_archivo] ' || SQLERRM, p_error);
  END v_archivoTrf;

  PROCEDURE cargarDir(p_uploadid NUMBER,
                      p_usuario  varchar2,
                      p_error    OUT VARCHAR2) is
  
    v_cfile    clob;
    l_clob_len PLS_INTEGER;
    l_pos      PLS_INTEGER := 1;
    l_amount   BINARY_INTEGER := 32767;
    vBuffer    VARCHAR2(32767);
    v_finlinea varchar(2);
    r          directorio_temp%rowtype;
    reg        directorio%rowtype;
    linea      varchar2(2000);
  
    campo token_list;
  
    i number := 1;
  
    v_registros number;
  
    v_incon    number;
    v_errorMsg varchar2(1000);
  
    v_nombreArchivo varchar2(250);
  
  BEGIN
  
    delete from directorio_temp;
    commit;
  
    select cfile, filename
      into v_cfile, v_nombreArchivo
      from upload
     where uploadid = p_uploadid;
  
    l_clob_len := dbms_lob.getlength(v_cfile);
  
    v_finlinea := chr(13) || chr(10);
  
    l_amount := dbms_lob.instr(v_cfile, v_finlinea, 1, 1);
    IF l_amount < 1 THEN
      v_finlinea := chr(13);
      l_amount   := dbms_lob.instr(v_cfile, v_finlinea, 1, 1);
      IF l_amount < 1 THEN
        v_finlinea := chr(10);
        l_amount   := dbms_lob.instr(v_cfile, v_finlinea, 1, 1);
        IF l_amount < 1 THEN
          p_error := '||Formato desconocido de archivo';
          return;
        end if;
      end if;
    end if;
  
    v_incon := 0;
  
    --Informacion
    WHILE l_pos < l_clob_len - 1 and p_error is null LOOP
      l_amount := dbms_lob.instr(v_cfile, v_finlinea, l_pos + 1, 1);
      IF l_amount > 1 THEN
        l_amount := l_amount - l_pos;
        dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);
      
        linea := vBuffer;
        campo := tokenize(str => linea, delim => ';');
      
        if (campo(1) is null) then
          p_error := 'Error en registro ' || i || '. Formato errado. ' ||
                     '. Datos registro: ' || vBuffer;
          return;
        
        end if;
        if (campo(1) <> 'DEPARTAMENTO') then
          r.divipo          := substr(campo(4), 1, 250);
          r.nomsecretaria   := substr(campo(5), 1, 250);
          r.secretario      := substr(campo(6), 1, 250);
          r.celular         := substr(campo(7), 1, 250);
          r.fechacumpleanos := substr(campo(8), 1, 250);
          r.asistente       := substr(campo(9), 1, 250);
          r.telasistente    := substr(campo(10), 1, 250);
          r.direccion       := substr(campo(11), 1, 250);
          r.indicativo      := substr(campo(12), 1, 250);
          r.telefono1       := substr(campo(13), 1, 250);
          r.telefono2       := substr(campo(14), 1, 250);
          r.telefono3       := substr(campo(15), 1, 250);
          r.telefono4       := substr(campo(16), 1, 250);
          r.correo          := substr(campo(17), 1, 500);
          r.nit             := substr(campo(18), 1, 250);
          R.TIENECONVENIO   := 'N';
          r.fechaconvenio   := NULL;
          insert into directorio_temp values r;
        
        end if;
      
        i := i + 1;
      
      end if;
    
      l_pos := l_pos + l_amount + length(v_finlinea);
    
    END LOOP;
  
    commit;
  
    i := i - 1;
  
    commit;
  
    delete from directorio
     where divipo in (select divipo from directorio_temp);
    commit;
  
    insert into directorio
      select * from directorio_temp;
  
    commit;
  
    if p_error is null then
      p_error := 'Registros leidos: ' || i;
    end if;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [cargarDir] ' || SQLERRM, p_error);
      p_error := 'Registro inconsistente : ' || i || ' Archivo Nro: ' ||
                 p_uploadid || ' .Error: ' || SQLERRM;
    
  end cargarDir;

  PROCEDURE q_directorio(V_DIVIPO  varchar2,
                         v_usuario number,
                         
                         V_NOMSECRETARIA   out VARCHAR2,
                         V_SECRETARIO      out VARCHAR2,
                         V_CELULAR         out VARCHAR2,
                         V_FECHACUMPLEANOS out VARCHAR2,
                         V_ASISTENTE       out VARCHAR2,
                         V_TELASISTENTE    out VARCHAR2,
                         V_DIRECCION       out VARCHAR2,
                         V_INDICATIVO      out VARCHAR2,
                         V_TELEFONO1       out VARCHAR2,
                         V_TELEFONO2       out VARCHAR2,
                         V_TELEFONO3       out VARCHAR2,
                         V_TELEFONO4       out VARCHAR2,
                         V_CORREO          out VARCHAR2,
                         V_NIT             out VARCHAR2,
                         V_CATEGORIA       out VARCHAR2,
                         V_SOFTWARECONTR   out VARCHAR2,
                         V_IDCONCESIONARIO out VARCHAR2,
                         V_TIENECONVENIO   out VARCHAR2,
                         V_FECHACONVENIO   out DATE,
                         
                         v_cod_error out number,
                         v_msg_error out varchar2) as
  
    numReg number;
  BEGIN
  
    select count(*) into numReg from directorio where divipo = v_divipo;
  
    if (numReg = 0) then
      v_cod_error := 0001;
      v_msg_error := 'Informacion NO EXISTE. Favor ingresarla';
      return;
    end if;
  
    select nomsecretaria,
           secretario,
           celular,
           fechacumpleanos,
           asistente,
           telasistente,
           direccion,
           indicativo,
           telefono1,
           telefono2,
           telefono3,
           telefono4,
           correo,
           nit,
           categoria,
           softwarecontr,
           TIENECONVENIO,
           FECHACONVENIO
    
      into v_nomsecretaria,
           v_secretario,
           v_celular,
           v_fechacumpleanos,
           v_asistente,
           v_telasistente,
           v_direccion,
           v_indicativo,
           v_telefono1,
           v_telefono2,
           v_telefono3,
           v_telefono4,
           v_correo,
           v_nit,
           v_categoria,
           v_softwarecontr,
           V_TIENECONVENIO,
           V_FECHACONVENIO
    
      from directorio
     where divipo = v_divipo;
  
    select c.idconcesionario
      into V_IDCONCESIONARIO
      from concesionario c, municipio m
     where m.idmunicipio = V_DIVIPO
       AND M.IDCONCESIONARIO = C.IDCONCESIONARIO;
  
    sp_log(v_usuario, 'q_directorio', v_divipo);
  
    v_cod_error := 0000;
    v_msg_error := 'Registro consultado correctamente';
  
  EXCEPTION
    WHEN OTHERS THEN
      v_cod_error := SQLCODE;
      v_msg_error := SQLERRM;
    
  END q_directorio;

  PROCEDURE u_directorio(V_DIVIPO  varchar2,
                         v_usuario number,
                         
                         V_NOMSECRETARIA   VARCHAR2,
                         V_SECRETARIO      VARCHAR2,
                         V_CELULAR         VARCHAR2,
                         V_FECHACUMPLEANOS VARCHAR2,
                         V_ASISTENTE       VARCHAR2,
                         V_TELASISTENTE    VARCHAR2,
                         V_DIRECCION       VARCHAR2,
                         V_INDICATIVO      VARCHAR2,
                         V_TELEFONO1       VARCHAR2,
                         V_TELEFONO2       VARCHAR2,
                         V_TELEFONO3       VARCHAR2,
                         V_TELEFONO4       VARCHAR2,
                         V_CORREO          VARCHAR2,
                         V_NIT             VARCHAR2,
                         V_CATEGORIA       VARCHAR2,
                         V_SOFTWARECONTR   VARCHAR2,
                         V_TIENECONVENIO   VARCHAR2,
                         V_FECHACONVENIO   DATE,
                         
                         v_cod_error out number,
                         v_msg_error out varchar2) as
  
    numReg number;
  BEGIN
  
    select count(*)
      into numReg
      from rolxperson p, rol r
     where p.personid = v_usuario
       and p.rolid = r.rolid
       and r.enablemod = 1;
  
    if (numReg = 0) then
      v_cod_error := 999;
      v_msg_error := 'Usuario no autorizado para realizar modificaciones';
      return;
    end if;
  
    select count(*) into numReg from directorio where divipo = v_divipo;
  
    if (numReg = 0) then
      insert into directorio
        (divipo,
         nomsecretaria,
         secretario,
         celular,
         fechacumpleanos,
         asistente,
         telasistente,
         direccion,
         indicativo,
         telefono1,
         telefono2,
         telefono3,
         telefono4,
         correo,
         nit,
         categoria,
         softwarecontr,
         TIENECONVENIO,
         FECHACONVENIO)
      values
        (v_divipo,
         v_nomsecretaria,
         v_secretario,
         v_celular,
         v_fechacumpleanos,
         v_asistente,
         v_telasistente,
         v_direccion,
         v_indicativo,
         v_telefono1,
         v_telefono2,
         v_telefono3,
         v_telefono4,
         v_correo,
         v_nit,
         v_categoria,
         v_softwarecontr,
         V_TIENECONVENIO,
         V_FECHACONVENIO);
    
    else
      update directorio
         set nomsecretaria   = v_nomsecretaria,
             secretario      = v_secretario,
             celular         = v_celular,
             fechacumpleanos = v_fechacumpleanos,
             asistente       = v_asistente,
             telasistente    = v_telasistente,
             direccion       = v_direccion,
             indicativo      = v_indicativo,
             telefono1       = v_telefono1,
             telefono2       = v_telefono2,
             telefono3       = v_telefono3,
             telefono4       = v_telefono4,
             correo          = v_correo,
             nit             = v_nit,
             categoria       = v_categoria,
             softwarecontr   = v_softwarecontr,
             TIENECONVENIO   = V_TIENECONVENIO,
             FECHACONVENIO   = V_FECHACONVENIO
       where divipo = v_divipo;
    
    end if;
  
    commit;
  
    sp_log(v_usuario, 'u_directorio', v_divipo);
  
    v_cod_error := 0000;
    v_msg_error := 'Registro actualizado correctamente ';
  
  EXCEPTION
    WHEN OTHERS THEN
      v_cod_error := SQLCODE;
      v_msg_error := SQLERRM;
    
  END u_directorio;

end PK_DIRECTORIO;
/


spool off
