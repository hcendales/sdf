---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 01/09/2011, 17:34:03 --
---------------------------------------------

spool 08_pkenvio.log

prompt
prompt Creating package PK_ENVIO
prompt =========================
prompt
create or replace package simit.PK_ENVIO is

  -- Author  : USER
  -- Created : 01/09/2011 16:28:10
  -- Purpose : enviar a bancos
  
PROCEDURE envio_Banco_local(p_fec_ini_ano number,
                        p_fec_ini_mes number,
                        p_fec_ini_dia number,
                        p_idbanco     varchar2,
                        p_usuario     varchar2,
                        p_error       OUT VARCHAR2,
                        p_log         out varchar2);
                        
PROCEDURE verLogEnvioAvvillasLoc(salida OUT VARCHAR2);

PROCEDURE verLogEnvioDaviviendaLoc(salida OUT VARCHAR2);
                         
PROCEDURE generarArchivoAvvillasLoc(p_fecha   date,
                                   p_usuario varchar2,
                                   p_error   OUT VARCHAR2);

PROCEDURE ejecutarScriptAvvillasLoc(p_fecha   date,
                                   p_usuario varchar2,
                                   p_error   OUT VARCHAR2);
                                   
PROCEDURE generarArchivoDaviviendaLoc(p_fecha   date,
                                     p_usuario varchar2,
                                     p_error   OUT VARCHAR2);

PROCEDURE ejecutarScriptDaviviendaLoc(p_fecha   date,
                                     p_usuario varchar2,
                                     p_error   OUT VARCHAR2);
                                     
                                   
end PK_ENVIO;
/

prompt
prompt Creating package body PK_ENVIO
prompt ==============================
prompt
create or replace package body simit.PK_ENVIO is

PROCEDURE envio_Banco_local(p_fec_ini_ano number,
                        p_fec_ini_mes number,
                        p_fec_ini_dia number,
                        p_idbanco     varchar2,
                        p_usuario     varchar2,
                        p_error       OUT VARCHAR2,
                        p_log         out varchar2) as
  
    w_registros number;
    archivo     utl_file.file_type;
    aaaammdd    varchar(8);
    hhmmss      varchar(6);
    p_fecha     date;
  
    cadena   varchar(250);
    numreg   number;
    strValor varchar(250);
    vlrTotal number;
  
    longitud number;
  
  begin
  
    if (not p_usuario = '99999999') THEN
      sp_v_usuario(p_usuario, p_error, 'pk_proc');
    END IF;
  
    IF not P_ERROR is null THEN
      return;
    END IF;
  
    select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                   p_fec_ini_dia,
                   'YYYY-MM-DD')
      into p_fecha
      from DUAL;
  
    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_local_disp_tot
     where fec_dispersion = p_fecha
       and enviadobanco = 1
       and ori_idbanco = p_idbanco;
  
    IF w_registros > 0 THEN
      p_error := 'PROCESO NO EJECUTADO. ARCHIVOS YA ENVIADOS A BANCO. SOLICITAR AUTORIZACION';
      -- ver log envio
      if p_idbanco = '52' then
        verLogEnvioAvvillasLoc(p_log);
      end if;
      if p_idbanco = '51' then
        verLogEnvioDaviviendaLoc(p_log);
      end if;
    
      RETURN;
    END IF;
  
    if p_idbanco = '52' then
      -- generar archivo transferencia avvillas
      generarArchivoAvvillasLoc(p_fecha, p_usuario, p_error);
    
      IF not P_ERROR is null THEN
        return;
      END IF;
    
      -- ejecutar script transferencia davivienda
      ejecutarScriptAvvillasLoc(p_fecha, p_usuario, p_error);
    
      IF not P_ERROR is null THEN
        p_error := 'Error en script avvillas codigo ' ||
                   substr(p_error, 0, 3);
        verLogEnvioAvvillasLoc(p_log);
        return;
      END IF;
      -- ver log envio
      verLogEnvioAvvillasLoc(p_log);
    
      if (instr(p_log, 'Login failed') > 0) then
        p_error := 'Envio Avvillas. Fallo FTP:Login failed';
        return;
      end if;
    
    end if;
  
    if p_idbanco = '51' then
    
      -- generar archivo transferencia avvillas
      generarArchivoDaviviendaLoc(p_fecha, p_usuario, p_error);
    
      IF not P_ERROR is null THEN
        return;
      END IF;
    
      -- ejecutar script transferencia davivienda
      ejecutarScriptDaviviendaLoc(p_fecha, p_usuario, p_error);
    
      IF not P_ERROR is null THEN
        p_error := 'Error en script Davivienda codigo ' ||
                   substr(p_error, 0, 3);
        verLogEnvioDaviviendaLoc(p_log);
        return;
      END IF;
    
      -- ver log envio
      verLogEnvioDaviviendaLoc(p_log);
    
      if (instr(p_log, 'Login failed') > 0) then
        p_error := 'Envio Davivienda. Fallo FTP:Login failed';
        return;
      end if;
    
    end if;
  
    update recaudo_local_disp_tot
       set enviadobanco = 1
     where fec_dispersion = p_fecha
       and ori_idbanco = p_idbanco;
  
    commit;
  
    p_error := 'Archivos enviados a banco OK';
  
    select count(*)
      into w_registros
      from recaudo_local_disp_tot
     where fec_dispersion = p_fecha
       and ori_idbanco = p_idbanco;
  
    IF w_registros = 0 THEN
      p_error := p_error ||
                 '.ADVERTENCIA: NO HAY TRANSFERENCIAS PROGRAMADASPARA LA FECHA DADA';
      RETURN;
    END IF;
  
    sp_log(p_usuario,
           'envio_Banco_loc',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia);
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [envio_Banco_local] ' || SQLERRM, p_error);
    
  end envio_Banco_local;
  
  PROCEDURE verLogEnvioAvvillasLoc(salida OUT VARCHAR2) as
    archivo      utl_file.file_type;
    input_buffer varchar2(1000);
  
  begin
  
    archivo := utl_file.fopen('TRFAVVILLAS', 'envioAvvillasLoc.sh.log', 'R');
  
    salida := '';
    LOOP
      BEGIN
        utl_file.get_line(archivo, input_buffer);
        salida := salida || input_buffer || chr(10);
      EXCEPTION
        when no_data_found then
          exit;
      END;
    END LOOP;
  
    utl_file.fclose(archivo);
  
  EXCEPTION
    WHEN OTHERS THEN
      salida := 'NO FUE POSIBLE LEER LOG envioAvvillasLoc.sh.log: ' || SQLERRM;
    
  end verLogEnvioAvvillasLoc;
  
  PROCEDURE verLogEnvioDaviviendaLoc(salida OUT VARCHAR2) as
    archivo      utl_file.file_type;
    input_buffer varchar2(1000);
  
  begin
  
    archivo := utl_file.fopen('TRFDAVIVIENDA',
                              'envioDaviviendaLoc.sh.log',
                              'R');
  
    salida := '';
    LOOP
      BEGIN
        utl_file.get_line(archivo, input_buffer);
        salida := salida || input_buffer || chr(10);
      EXCEPTION
        when no_data_found then
          exit;
      END;
    END LOOP;
  
    utl_file.fclose(archivo);
  EXCEPTION
    WHEN OTHERS THEN
      salida := 'NO FUE POSIBLE LEER LOG envioDaviviendaLoc.sh.log: ' ||
                SQLERRM;
    
  end verLogEnvioDaviviendaLoc;

PROCEDURE generarArchivoAvvillasLoc(p_fecha   date,
                                   p_usuario varchar2,
                                   p_error   OUT VARCHAR2) as
  
    w_registros number;
    archivo     utl_file.file_type;
    aaaammdd    varchar(8);
    hhmmss      varchar(6);
  
    cadena   varchar(250);
    numreg   number;
    strValor varchar(250);
    vlrTotal number;
  
    longitud number;
  
    CURSOR tabla IS
      select fec_dispersion,
             concepto,
             ori_idbanco,
             ori_tipocuenta,
             ori_cuenta,
             ori_nit,
             des_idbanco,
             des_tipocuenta,
             desencriptar(des_cuenta) as des_cuenta,
             des_nit,
             valor,
             referenciatrf
        from recaudo_local_disp_tot
       where fec_dispersion = p_fecha
         and ori_idbanco = '52';
  
  begin
  
    aaaammdd := to_char(p_fecha, 'yyyymmdd');
    hhmmss   := to_char(sysdate, 'hhmmss');
  
    archivo  := utl_file.fopen('TRFAVVILLAS',
                               'CNJ660D.TRANSFER.' || aaaammdd || '.TXT',
                               'W');
    numreg   := 1;
    vlrTotal := 0;
  
    for registro in tabla loop
      cadena := '1'; -- tipo registro
      cadena := cadena || aaaammdd; -- fecha generacion
    
      strValor := trim(to_char(numreg, '00000000'));
      cadena   := cadena || strValor; -- numero registro
    
      strValor := trim(to_char(registro.referenciatrf, '0000000000000000'));
    
      cadena := cadena || strValor;
      cadena := cadena || '0' || registro.ori_idbanco; -- banco origen
    
      if (registro.ori_tipocuenta = 'AHO') then
        cadena := cadena || '1'; -- tipo cuenta origen
      end if;
    
      if (registro.ori_tipocuenta = 'CTE') then
        cadena := cadena || '2'; -- tipo cuenta origen
      end if;
    
      cadena := cadena || '0000000' || registro.ori_cuenta; -- cuenta origen
    
      strValor := trim(to_char(registro.valor * 100, '000000000000000000'));
      cadena   := cadena || strValor; -- valor
    
      cadena := cadena || '0' || registro.des_idbanco; -- banco destino
    
      if (registro.des_tipocuenta = 'AHO') then
        cadena := cadena || '1'; -- tipo cuenta destino
      end if;
    
      if (registro.des_tipocuenta = 'CTE') then
        cadena := cadena || '2'; -- tipo cuenta destino
      end if;
    
      cadena := cadena || registro.des_cuenta; -- cuenta destino
    
      longitud := LENGTH(registro.des_cuenta);
      longitud := 16 - longitud;
    
      if (longitud > 0) then
        for idx in 1 .. longitud loop
          cadena := cadena || ' ';
        end loop;
      end if;
    
      cadena := cadena || 'N'; -- tipo identificacion destino
      cadena := cadena || '000000' || registro.des_nit; -- identificacion destino
    
      -- mensaje respuesta
      for idx in 1 .. 100 loop
        cadena := cadena || ' ';
      end loop;
    
      cadena := cadena || '999'; -- codigo respuesta
    
      longitud := LENGTH(cadena);
      longitud := 250 - longitud;
    
      -- filler
      for idx in 1 .. longitud loop
        cadena := cadena || '0';
      end loop;
    
      utl_file.put_line(archivo, cadena, true);
      numreg   := numreg + 1;
      vlrTotal := vlrTotal + registro.valor;
    end loop;
  
    cadena := '9'; -- tipo registro
    cadena := cadena || aaaammdd; -- fecha generacion
  
    strValor := trim(to_char(numreg - 1, '00000000'));
    cadena   := cadena || strValor; -- numero registro
  
    strValor := trim(to_char(vlrTotal * 100, '000000000000000000'));
    cadena   := cadena || strValor; -- valor
  
    longitud := LENGTH(cadena);
    longitud := 250 - longitud;
  
    -- filler
    for idx in 1 .. longitud loop
      cadena := cadena || '0';
    end loop;
  
    utl_file.put_line(archivo, cadena, true);
  
    utl_file.fclose(archivo);
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [generarArchivoAvvillasLoc] ' || SQLERRM,
            p_error);
    
  end generarArchivoAvvillasLoc;

PROCEDURE ejecutarScriptAvvillasLoc(p_fecha   date,
                                   p_usuario varchar2,
                                   p_error   OUT VARCHAR2) as
    aaaammdd varchar(8);
    comando  varchar(250);
    salida   varchar(250);
  
  begin
  
    aaaammdd := to_char(p_fecha, 'yyyymmdd');
  
    comando := '/bin/sh /trfavvillas/envioAvvillasLoc.sh ' || aaaammdd;
  
    --salida := Shell_Run(comando);
  
    if (substr(salida, 0, 2) <> '0:') then
      p_error := salida;
      return;
    end if;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [ejecutarScriptAvvillasLoc] ' || SQLERRM,
            p_error);
    
  end ejecutarScriptAvvillasLoc;

PROCEDURE generarArchivoDaviviendaLoc(p_fecha   date,
                                     p_usuario varchar2,
                                     p_error   OUT VARCHAR2) as
  
    w_registros number;
    archivo     utl_file.file_type;
    aaaammdd    varchar(8);
    hhmmss      varchar(6);
  
    cadena   varchar(170);
    numreg   number;
    strValor varchar(250);
    vlrTotal number;
    numTotal number;
  
    longitud number;
  
    CURSOR cuentas is
      select max(tipocuenta) as tipocuenta, cuenta
        from cta_recaudo_fcm t
       where idbanco = '51'
       group by cuenta;
  
  begin
  
    aaaammdd := to_char(p_fecha, 'yyyymmdd');
    hhmmss   := to_char(sysdate, 'hhmmss');
  
    for cta in cuentas loop
    
      select sum(valor)
        into vlrTotal
        from recaudo_local_disp_tot
       where fec_dispersion = p_fecha
         and ori_idbanco = '51'
         and ori_cuenta = cta.cuenta;
    
      select count(*)
        into numTotal
        from recaudo_local_disp_tot
       where fec_dispersion = p_fecha
         and ori_idbanco = '51'
         and ori_cuenta = cta.cuenta;
    
      archivo := utl_file.fopen('TRFDAVIVIENDA',
                                cta.cuenta || '_' || aaaammdd || '.TXT',
                                'W');
    
      --crear header
      cadena := 'RC'; -- tipo reg
      cadena := cadena || '000000' || '8000826650'; --nit empresa
      cadena := cadena || '0000'; --codigo-servicio
      cadena := cadena || '0000'; --codigo-subservicio
    
      strValor := trim(to_char(to_number(cta.cuenta), '0000000000000000'));
      cadena   := cadena || strValor;
    
      -- tipo cuenta origen
      if (cta.tipocuenta = 'AHO') then
        cadena := cadena || 'CA';
      end if;
    
      if (cta.tipocuenta = 'CTE') then
        cadena := cadena || 'CC';
      end if;
    
      -- banco origen
      cadena := cadena || '000051';
    
      -- valor
      if (vlrTotal is null) then
        vlrTotal := 0;
      end if;
    
      strValor := trim(to_char(vlrTotal * 100, '000000000000000000'));
      cadena   := cadena || strValor; -- valor
    
      -- numero registro
      strValor := trim(to_char(numTotal, '000000'));
      cadena   := cadena || strValor; -- valor
    
      cadena := cadena || aaaammdd; -- fecha proceso
    
      cadena := cadena || '000000'; -- hora proceso
      cadena := cadena || '0000'; -- codigo-operador
      cadena := cadena || '9999'; -- respuesta-proceso
    
      cadena := cadena || '00000000'; -- fech-generacion
      cadena := cadena || '000000'; -- hora generacion
      cadena := cadena || '00'; -- ind-inscripcion
      cadena := cadena || '01'; -- tipo-identificacion
      cadena := cadena || '000000000000'; -- numero-cliente
      cadena := cadena || '0000'; -- oficina-rec-emp
      cadena := cadena || '0000000000000000000000000000000000000000'; -- filler
    
      utl_file.put_line(archivo, cadena, true);
      for reg in (select fec_dispersion,
                         concepto,
                         ori_idbanco,
                         ori_tipocuenta,
                         ori_cuenta,
                         ori_nit,
                         des_idbanco,
                         des_tipocuenta,
                         desencriptar(des_cuenta) as des_cuenta,
                         des_nit,
                         valor,
                         referenciatrf
                    from recaudo_local_disp_tot
                   where fec_dispersion = p_fecha
                     and ori_idbanco = '51'
                     and ori_cuenta = cta.cuenta)
      
       loop
        cadena := 'TR000000' || reg.des_nit; -- tipo registro
      
        -- nro referencia
        cadena := cadena || '0000000000000000';
      
        -- cuenta destino
        strValor := trim(to_char(to_number(reg.des_cuenta),
                                 '0000000000000000'));
        cadena   := cadena || strValor;
      
        -- tipo cuenta destino
        if (reg.des_tipocuenta = 'AHO') then
          cadena := cadena || 'CA';
        end if;
      
        if (reg.des_tipocuenta = 'CTE') then
          cadena := cadena || 'CC';
        end if;
      
        if (reg.des_idbanco = '50') then
          cadena := cadena || '000051'; --banco davivienda
        else
          cadena := cadena || '0000' || reg.des_idbanco; --banco destino
        end if;
      
        strValor := trim(to_char(reg.valor * 100, '000000000000000000'));
        cadena   := cadena || strValor; -- valor
      
        cadena := cadena || '000000'; -- numero talon
        cadena := cadena || '01'; -- tipo ide destino
        cadena := cadena || '1'; -- Validar traslados a ACH
        cadena := cadena || '9999'; -- respuesta traslado
        cadena := cadena || '0000000000000000000000000000000000000000'; --mensaje
        cadena := cadena || '000000000000000000'; -- valor acumulado
        cadena := cadena || '00000000'; --fecha a
        cadena := cadena || '0000'; -- oficina-rec-det
        cadena := cadena || '0000'; -- motivo-det
        cadena := cadena || '0000000'; -- filler
      
        utl_file.put_line(archivo, cadena, true);
      
      end loop;
    
      utl_file.fclose(archivo);
    end loop;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [generarArchivoDaviviendaLoc] ' || SQLERRM,
            p_error);
    
  end generarArchivoDaviviendaLoc;  

PROCEDURE ejecutarScriptDaviviendaLoc(p_fecha   date,
                                     p_usuario varchar2,
                                     p_error   OUT VARCHAR2) as
    aaaammdd varchar(8);
    comando  varchar(250);
    salida   varchar(250);
  
  begin
  
    aaaammdd := to_char(p_fecha, 'yyyymmdd');
  
    comando := '/bin/sh /trfdavivienda/envioDaviviendaLoc.sh ' || aaaammdd;
  
    --salida := Shell_Run(comando);
  
    if (substr(salida, 0, 2) <> '0:') then
      p_error := salida;
      return;
    end if;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [ejecutarScriptDaviviendaLoc] ' || SQLERRM,
            p_error);
    
  end ejecutarScriptDaviviendaLoc;
end PK_ENVIO;
/


spool off
