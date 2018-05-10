---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 21/09/2011, 15:55:40 --
---------------------------------------------

spool 12_pkdev.log

prompt
prompt Creating package PK_NOVDEV
prompt ==========================
prompt
create or replace package simit.PK_NOVDEV is

  MSG_UPD_OK VARCHAR2(255) := 'Registro Actualizado Correctamente';
  MSG_INS_OK VARCHAR2(255) := 'Registro Insertado Correctamente';
  MSG_DEL_OK VARCHAR2(255) := 'Registro Eliminado Correctamente';

  PROCEDURE i_NovDevolucion(
                            
                            V_TIPOIDENTIFICACION   VARCHAR2,
                            V_IDENTIFICACION       NUMBER,
                            V_NOMBRE               VARCHAR2,
                            V_IDBANCO              VARCHAR2,
                            V_TIPOCUENTA           VARCHAR2,
                            V_CUENTA               VARCHAR2,
                            V_CUENTAREC            VARCHAR2,
                            V_IDMUNICIPIO          VARCHAR2,
                            V_IDCONCESIONARIO      VARCHAR2,
                            V_INDTIPO              VARCHAR2,
                            V_MOTIVO               VARCHAR2,
                            V_VDEVOLUCION          NUMBER,
                            V_VADICIONAL           NUMBER,
                            V_VCONCESIONARIO       NUMBER,
                            V_VFCM                 NUMBER,
                            V_VFONDOCOBERTURAFCM   NUMBER,
                            V_VFONDOCOBERTURALIQ   NUMBER,
                            V_VEQUILIBRIOECONOMICO NUMBER,
                            V_VPOLCA               NUMBER,
                            V_VFCMPOLCA            NUMBER,
                            V_VSEVIAL              NUMBER,
                            V_VMUNICIPIO           NUMBER,
                            V_VFCMCONTRAVENCIONAL  NUMBER,
                            V_VCONCONTRAVENCIONAL  NUMBER,
                            V_FECHA_ACT_ANO        NUMBER,
                            V_FECHA_ACT_MES        NUMBER,
                            V_FECHA_ACT_DIA        NUMBER,
                            V_USUARIO              VARCHAR2,
                            V_ERROR                OUT VARCHAR2,
                            V_NOVEDAD              OUT VARCHAR2
                            
                            );

  PROCEDURE q_NovDevolucion(V_TIPONOV              VARCHAR2,
                            V_NUMERONOV            VARCHAR2,
                            V_USUARIO              VARCHAR2,
                            V_TIPOIDENTIFICACION   OUT VARCHAR2,
                            V_IDENTIFICACION       OUT NUMBER,
                            V_NOMBRE               OUT VARCHAR2,
                            V_IDBANCO              OUT VARCHAR2,
                            V_TIPOCUENTA           OUT VARCHAR2,
                            V_CUENTA               OUT VARCHAR2,
                            V_CUENTAREC            OUT VARCHAR2,
                            V_IDMUNICIPIO          OUT VARCHAR2,
                            V_IDCONCESIONARIO      OUT VARCHAR2,
                            V_INDTIPO              OUT VARCHAR2,
                            V_MOTIVO               OUT VARCHAR2,
                            V_VDEVOLUCION          OUT NUMBER,
                            V_VADICIONAL           OUT NUMBER,
                            V_VCONCESIONARIO       OUT NUMBER,
                            V_VFCM                 OUT NUMBER,
                            V_VFONDOCOBERTURAFCM   OUT NUMBER,
                            V_VFONDOCOBERTURALIQ   OUT NUMBER,
                            V_VEQUILIBRIOECONOMICO OUT NUMBER,
                            V_VPOLCA               OUT NUMBER,
                            V_VFCMPOLCA            OUT NUMBER,
                            V_VSEVIAL              OUT NUMBER,
                            V_VMUNICIPIO           OUT NUMBER,
                            V_VFCMCONTRAVENCIONAL  OUT NUMBER,
                            V_VCONCONTRAVENCIONAL  OUT NUMBER,
                            V_FECHAACT             OUT DATE,
                            V_ERROR                OUT VARCHAR2);

  PROCEDURE u_NovdevolucionEst(p_tiponov   varchar2,
                               p_numeronov varchar2,
                               p_usuario   varchar2,
                               p_estado    varchar2,
                               p_error     OUT VARCHAR2);

  PROCEDURE q_NovDevolucionSug( 
                            V_USUARIO              VARCHAR2,
                            V_CUENTAREC            VARCHAR2,
                            V_IDMUNICIPIO          VARCHAR2,
                            V_IDCONCESIONARIO      VARCHAR2,
                            V_INDTIPO              VARCHAR2,
                            V_VDEVOLUCION          NUMBER,
                            V_ADICIONAL            NUMBER,
                            V_VCONCESIONARIO       OUT NUMBER,
                            V_VFCM                 OUT NUMBER,
                            V_VFONDOCOBERTURAFCM   OUT NUMBER,
                            V_VFONDOCOBERTURALIQ   OUT NUMBER,
                            V_VEQUILIBRIOECONOMICO OUT NUMBER,
                            V_VPOLCA               OUT NUMBER,
                            V_VFCMPOLCA            OUT NUMBER,
                            V_VSEVIAL              OUT NUMBER,
                            V_VMUNICIPIO           OUT NUMBER,
                            V_VFCMCONTRAVENCIONAL  OUT NUMBER,
                            V_VCONCONTRAVENCIONAL  OUT NUMBER,
                            V_ERROR                OUT VARCHAR2);

end PK_NOVDEV;
/

prompt
prompt Creating package body PK_NOVDEV
prompt ===============================
prompt
create or replace package body simit.PK_NOVDEV is
  PROCEDURE i_NovDevolucion(
                            
                            V_TIPOIDENTIFICACION   VARCHAR2,
                            V_IDENTIFICACION       NUMBER,
                            V_NOMBRE               VARCHAR2,
                            V_IDBANCO              VARCHAR2,
                            V_TIPOCUENTA           VARCHAR2,
                            V_CUENTA               VARCHAR2,
                            V_CUENTAREC            VARCHAR2,
                            V_IDMUNICIPIO          VARCHAR2,
                            V_IDCONCESIONARIO      VARCHAR2,
                            V_INDTIPO              VARCHAR2,
                            V_MOTIVO               VARCHAR2,
                            V_VDEVOLUCION          NUMBER,
                            V_VADICIONAL           NUMBER,
                            V_VCONCESIONARIO       NUMBER,
                            V_VFCM                 NUMBER,
                            V_VFONDOCOBERTURAFCM   NUMBER,
                            V_VFONDOCOBERTURALIQ   NUMBER,
                            V_VEQUILIBRIOECONOMICO NUMBER,
                            V_VPOLCA               NUMBER,
                            V_VFCMPOLCA            NUMBER,
                            V_VSEVIAL              NUMBER,
                            V_VMUNICIPIO           NUMBER,
                            V_VFCMCONTRAVENCIONAL  NUMBER,
                            V_VCONCONTRAVENCIONAL  NUMBER,
                            V_FECHA_ACT_ANO        NUMBER,
                            V_FECHA_ACT_MES        NUMBER,
                            V_FECHA_ACT_DIA        NUMBER,
                            V_USUARIO              VARCHAR2,
                            V_ERROR                OUT VARCHAR2,
                            V_NOVEDAD              OUT VARCHAR2
                            
                            ) AS
  
    w_fecha_act       date;
    numNovedad        number;
    m_dias_activacion number;
    min_fecha_act     date;
    correo_usuario    varchar(100);
    correo_fcm        varchar(100);
  
  BEGIN
  
    -- VALIDACIONES
    sp_v_usuario(V_USUARIO, V_ERROR, 'pk_proc');
  
    select mail
      into correo_usuario
      from person
     where idperson = TO_NUMBER(V_USUARIO);
  
    select substr(correo, 0, 100)
      into correo_fcm
      from fcm
     where nit_fcm = '8000826650';
  
    select TO_DATE(V_FECHA_ACT_ANO || '-' || V_FECHA_ACT_MES || '-' ||
                   V_FECHA_ACT_MES,
                   'YYYY-MM-DD')
      into w_fecha_act
      from DUAL;
  
    select dias_activacion into m_dias_activacion from fcm;
  
    IF m_dias_activacion is null THEN
      V_ERROR := 'Error en parametrización (días activación)';
      return;
    end if;
  
    min_fecha_act := fn_fec_dispersion(to_date(to_char(sysdate,
                                                       'yyyy-mm-dd'),
                                               'yyyy-mm-dd'),
                                       m_dias_activacion,
                                       0,
                                       '99999999');
  
    IF min_fecha_act > w_fecha_act then
      V_ERROR := 'Fecha Activación Inválida';
    end if;
  
    select seq_novedad.Nextval into numNovedad from dual;
  
    insert into novdevolucion
      (tipoidentificacion,
       identificacion,
       nombre,
       idbanco,
       tipocuenta,
       cuenta,
       cuentaRec,
       idmunicipio,
       idconcesionario,
       indtipo,
       motivo,
       vdevolucion,
       vconcesionario,
       vfcm,
       vfondocoberturafcm,
       vfondocoberturaliq,
       vequilibrioeconomico,
       vpolca,
       vfcmpolca,
       vsevial,
       vmunicipio,
       vfcmcontravencional,
       vconcontravencional,
       tiponov,
       numeronov,
       fechanov,
       usuarionov,
       estadonov,
       fechaact,
       vadicional)
    values
      (v_tipoidentificacion,
       v_identificacion,
       v_nombre,
       v_idbanco,
       v_tipocuenta,
       v_cuenta,
       v_cuentaRec,
       v_idmunicipio,
       v_idconcesionario,
       v_indtipo,
       v_motivo,
       v_vdevolucion,
       v_vconcesionario,
       v_vfcm,
       v_vfondocoberturafcm,
       v_vfondocoberturaliq,
       v_vequilibrioeconomico,
       v_vpolca,
       v_vfcmpolca,
       v_vsevial,
       v_vmunicipio,
       v_vfcmcontravencional,
       v_vconcontravencional,
       '09', --v_tiponov, NOVEDAD DEVOLUCION
       numNovedad, -- numeronov, 
       sysdate, --  fechanov, 
       V_usuario, -- usuarionov
       'INGRESADA', -- estadonov, 
       w_fecha_act, --  fechaact
       v_vadicional
       );
  
    V_ERROR   := MSG_INS_OK;
    V_NOVEDAD := '09-' || to_char(numNovedad, '0000000');
  
    sp_envionotificacion(gruporecibe => 4,
                         grupocopia  => -1,
                         asunto      => 'Notificación de Novedad de Devolucion:  ' ||
                                        V_NOVEDAD,
                         mensaje     => 'Se ha creado una novedad de devolucion. Por favor verificar y dar su visto bueno. NUMERO NOVEDAD ' ||
                                        V_NOVEDAD || ' . Muchas gracias',
                         p_usuario   => V_USUARIO);
    commit;
  
    sp_log(V_USUARIO, 'i_NovDevolucion', V_NOVEDAD);
  
    commit;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            V_USUARIO || ' [i_NovDevolucion] ' || SQLERRM,
            V_ERROR);
    
  END i_NovDevolucion;

  PROCEDURE q_NovDevolucion(V_TIPONOV              VARCHAR2,
                            V_NUMERONOV            VARCHAR2,
                            V_USUARIO              VARCHAR2,
                            V_TIPOIDENTIFICACION   OUT VARCHAR2,
                            V_IDENTIFICACION       OUT NUMBER,
                            V_NOMBRE               OUT VARCHAR2,
                            V_IDBANCO              OUT VARCHAR2,
                            V_TIPOCUENTA           OUT VARCHAR2,
                            V_CUENTA               OUT VARCHAR2,
                            V_CUENTAREC            OUT VARCHAR2,
                            V_IDMUNICIPIO          OUT VARCHAR2,
                            V_IDCONCESIONARIO      OUT VARCHAR2,
                            V_INDTIPO              OUT VARCHAR2,
                            V_MOTIVO               OUT VARCHAR2,
                            V_VDEVOLUCION          OUT NUMBER,
                            V_VADICIONAL           OUT NUMBER,
                            V_VCONCESIONARIO       OUT NUMBER,
                            V_VFCM                 OUT NUMBER,
                            V_VFONDOCOBERTURAFCM   OUT NUMBER,
                            V_VFONDOCOBERTURALIQ   OUT NUMBER,
                            V_VEQUILIBRIOECONOMICO OUT NUMBER,
                            V_VPOLCA               OUT NUMBER,
                            V_VFCMPOLCA            OUT NUMBER,
                            V_VSEVIAL              OUT NUMBER,
                            V_VMUNICIPIO           OUT NUMBER,
                            V_VFCMCONTRAVENCIONAL  OUT NUMBER,
                            V_VCONCONTRAVENCIONAL  OUT NUMBER,
                            V_FECHAACT             OUT DATE,
                            V_ERROR                OUT VARCHAR2) as
  
    numReg number;
  BEGIN
  
    -- VALIDACIONES
    sp_v_usuario(V_USUARIO, V_ERROR, 'pk_proc');
  
    IF not V_ERROR is null THEN
      return;
    end if;
  
    select count(*)
      into numReg
      from novdevolucion
     where tiponov = v_tiponov
       and numeronov = v_numeronov;
  
    if (numreg = 0) then
      V_ERROR := 'Novedad no existe';
      return;
    end if;
  
    select tipoidentificacion,
           identificacion,
           nombre,
           idbanco,
           tipocuenta,
           cuenta,
           idmunicipio,
           idconcesionario,
           indtipo,
           motivo,
           vdevolucion,
           vconcesionario,
           vfcm,
           vfondocoberturafcm,
           vfondocoberturaliq,
           vequilibrioeconomico,
           vpolca,
           vfcmpolca,
           vsevial,
           vmunicipio,
           vfcmcontravencional,
           vconcontravencional,
           cuentarec,
           fechaAct,
           vadicional
      into v_tipoidentificacion,
           v_identificacion,
           v_nombre,
           v_idbanco,
           v_tipocuenta,
           v_cuenta,
           v_idmunicipio,
           v_idconcesionario,
           v_indtipo,
           v_motivo,
           v_vdevolucion,
           v_vconcesionario,
           v_vfcm,
           v_vfondocoberturafcm,
           v_vfondocoberturaliq,
           v_vequilibrioeconomico,
           v_vpolca,
           v_vfcmpolca,
           v_vsevial,
           v_vmunicipio,
           v_vfcmcontravencional,
           v_vconcontravencional,
           v_cuentarec,
           v_fechaAct,
           V_VADICIONAL
      from novdevolucion
     where tiponov = v_tiponov
       and numeronov = v_numeronov;
  
    v_error := 'Consulta Exitosa';
  
    sp_log(V_USUARIO, 'q_NovDevolucion', V_NUMERONOV);
  
    commit;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            V_USUARIO || ' [q_NovDevolucion] ' || SQLERRM,
            V_ERROR);
    
  END q_NovDevolucion;

  PROCEDURE u_NovdevolucionEst(p_tiponov   varchar2,
                               p_numeronov varchar2,
                               p_usuario   varchar2,
                               p_estado    varchar2,
                               p_error     OUT VARCHAR2) is
  
    estado_act varchar2(100);
  
  BEGIN
  
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');
  
    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select TRIM(UPPER(estadonov))
          into estado_act
          from Novdevolucion
         where tiponov = p_tiponov
           and numeronov = to_number(p_numeronov);
      
        IF estado_act = p_estado THEN
          p_error := 'Novedad ya actualizada';
          return;
        END IF;
      
        IF p_estado = 'VALIDADA' THEN
          update Novdevolucion
             set estadonov  = p_estado,
                 usuarioval = p_usuario,
                 fechaval   = sysdate
           where tiponov = p_tiponov
             and numeronov = to_number(p_numeronov);
        ELSE
          IF p_estado = 'ANULADA' THEN
            update Novdevolucion
               set estadonov   = p_estado,
                   usuarioanul = p_usuario,
                   fechaanul   = sysdate
             where tiponov = p_tiponov
               and numeronov = to_number(p_numeronov);
          ELSE
            update Novdevolucion
               set estadonov = p_estado
             where tiponov = p_tiponov
               and numeronov = to_number(p_numeronov);
          END IF;
        END IF;
      
        IF p_estado = 'ANULADA' THEN
          insert into hist_vobo
            (idvobo,
             tipo,
             accion,
             usuario,
             fecha,
             referencia1,
             referencia2,
             referencia3,
             referencia4)
          values
            (seq_vobo.nextval,
             'NOVEDAD DEVOLUCION',
             'RECHAZADO',
             p_usuario,
             sysdate,
             p_tiponov || '-' || p_numeronov,
             p_estado,
             0,
             0);
        
        ELSE
          insert into hist_vobo
            (idvobo,
             tipo,
             accion,
             usuario,
             fecha,
             referencia1,
             referencia2,
             referencia3,
             referencia4)
          values
            (seq_vobo.nextval,
             'NOVEDAD DEVOLUCION',
             'APROBADO',
             p_usuario,
             sysdate,
             p_tiponov || '-' || p_numeronov,
             p_estado,
             0,
             0);
        END IF;
      
        commit;
      
        if (p_estado = 'VOBOFINANCIERA') THEN
          sp_envionotificacion(gruporecibe => 5,
                               grupocopia  => -1,
                               asunto      => 'Notificación de Novedad de Devolucion:  ' ||
                                              p_tiponov || '-' ||
                                              p_numeronov,
                               mensaje     => 'Se ha creado una novedad de devolucion. Por favor verificar y dar su visto bueno. NUMERO NOVEDAD ' ||
                                              p_tiponov || '-' ||
                                              p_numeronov ||
                                              ' . Muchas gracias',
                               p_usuario   => p_usuario);
        
        END IF;
      
        if (p_estado = 'VOBOSIMIT') THEN
          sp_envionotificacion(gruporecibe => 6,
                               grupocopia  => -1,
                               asunto      => 'Notificación de Novedad de Devolucion:  ' ||
                                              p_tiponov || '-' ||
                                              p_numeronov,
                               mensaje     => 'Se ha creado una novedad de Devolucion. Por favor verificar y dar su visto bueno. NUMERO NOVEDAD ' ||
                                              p_tiponov || '-' ||
                                              p_numeronov ||
                                              ' . Muchas gracias',
                               p_usuario   => p_usuario);
        
        END IF;
      
        if (p_estado = 'VALIDADA') THEN
          sp_envionotificacion(gruporecibe => 7,
                               grupocopia  => -1,
                               asunto      => 'Notificación de Novedad de Devolucion:  ' ||
                                              p_tiponov || '-' ||
                                              p_numeronov,
                               mensaje     => 'Se ha aprobado una novedad de Devolucion. Por favor informar a banco novedad. NUMERO NOVEDAD ' ||
                                              p_tiponov || '-' ||
                                              p_numeronov ||
                                              ' . Muchas gracias',
                               p_usuario   => p_usuario);
        
        END IF;
      
        if (p_estado = 'ANULADA') THEN
          sp_envionotificacion(gruporecibe => 3,
                               grupocopia  => -1,
                               asunto      => 'Notificación de ANULACION Novedad de Devolucion:  ' ||
                                              p_tiponov || '-' ||
                                              p_numeronov,
                               mensaje     => 'Se ha ANULADO una novedad de Devolucion. Por favor verificar informacion. NUMERO NOVEDAD ' ||
                                              p_tiponov || '-' ||
                                              p_numeronov ||
                                              ' . Muchas gracias',
                               p_usuario   => p_usuario);
        
        END IF;
      
        p_error := 'Actualización Exitosa';
      
        sp_log(p_usuario,
               'u_NovdevolucionEst',
               p_tiponov || '-' || p_numeronov || '-' || p_estado);
      
        commit;
      
      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO' || p_tiponov || '-' ||
                     p_numeronov;
      END;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [u_NovdevolucionEst] ' || SQLERRM,
            p_error);
    
  END u_NovdevolucionEst;

  PROCEDURE q_NovDevolucionSug( 
                            V_USUARIO              VARCHAR2,
                            V_CUENTAREC            VARCHAR2,
                            V_IDMUNICIPIO          VARCHAR2,
                            V_IDCONCESIONARIO      VARCHAR2,
                            V_INDTIPO              VARCHAR2,
                            V_VDEVOLUCION          NUMBER,
                            V_ADICIONAL            NUMBER,
                            V_VCONCESIONARIO       OUT NUMBER,
                            V_VFCM                 OUT NUMBER,
                            V_VFONDOCOBERTURAFCM   OUT NUMBER,
                            V_VFONDOCOBERTURALIQ   OUT NUMBER,
                            V_VEQUILIBRIOECONOMICO OUT NUMBER,
                            V_VPOLCA               OUT NUMBER,
                            V_VFCMPOLCA            OUT NUMBER,
                            V_VSEVIAL              OUT NUMBER,
                            V_VMUNICIPIO           OUT NUMBER,
                            V_VFCMCONTRAVENCIONAL  OUT NUMBER,
                            V_VCONCONTRAVENCIONAL  OUT NUMBER,
                            V_ERROR                OUT VARCHAR2) is
                            
   V_VALORBASE NUMBER;                         
   V_NUMREG NUMBER;
   
   V_VPOLCABASE NUMBER;
   V_VFCMPOLCABASE NUMBER;
   V_VSEVIALBASE NUMBER;

 
begin

 v_error := 'OK';
 
 if (V_INDTIPO = 'SIMIT' ) then
 
     V_VALORBASE := ROUND(( V_VDEVOLUCION - V_ADICIONAL)  * 10 / 100,2);
     V_VCONCESIONARIO := ROUND(V_VALORBASE * 6.5 / 10,2);
     V_VFCM := ROUND(V_VALORBASE * 2.5 / 10,2);
     V_VFONDOCOBERTURAFCM := ROUND(V_VALORBASE * 0.5 / 10,2);
     V_VFONDOCOBERTURALIQ := ROUND(V_VALORBASE * 0.5 / 10,2);
     V_VEQUILIBRIOECONOMICO := 0.0;
     V_VFONDOCOBERTURALIQ := V_VALORBASE - V_VCONCESIONARIO - V_VFCM - V_VFONDOCOBERTURAFCM;
     
     IF ( V_IDCONCESIONARIO = '05') THEN
         V_VCONCESIONARIO := ROUND(V_VALORBASE * 6.45 / 10,2);
         V_VFCM := ROUND(V_VALORBASE * 1.05 / 10,2);
         V_VFONDOCOBERTURAFCM := 0.0;
         V_VFONDOCOBERTURALIQ := 0.0;
         V_VEQUILIBRIOECONOMICO := ROUND(V_VALORBASE * 2.5 / 10,2);
         
         V_VEQUILIBRIOECONOMICO := V_VALORBASE - V_VCONCESIONARIO - V_VFCM;
         
     END IF;    
     
     IF (ABS(V_VFONDOCOBERTURAFCM -  V_VFONDOCOBERTURALIQ ) = 0.02 ) THEN
        V_VFONDOCOBERTURAFCM := V_VFONDOCOBERTURAFCM - 0.01;
        V_VFONDOCOBERTURALIQ := V_VFONDOCOBERTURALIQ + 0.01;
     END IF;
      
     V_VMUNICIPIO := V_VDEVOLUCION - V_VALORBASE;
     
     V_VPOLCA := 0.0;
     V_VFCMPOLCA := 0.0;
     V_VSEVIAL := 0.0;
     
     V_VFCMCONTRAVENCIONAL := 0.0;
     V_VCONCONTRAVENCIONAL := 0.0;
     
     SELECT COUNT(*) 
     INTO V_NUMREG
     FROM p_dispersion_municipio
     WHERE idmunicipio = V_IDMUNICIPIO
     AND fcm_contravencional_s > 0;
     
     IF (V_NUMREG > 0 ) THEN
 
        V_VALORBASE := V_VDEVOLUCION - V_ADICIONAL - V_VALORBASE ;
        V_VFCMCONTRAVENCIONAL := ROUND(V_VALORBASE* 9.5 / 90 ,2);
        V_VCONCONTRAVENCIONAL := ROUND(V_VALORBASE* 9.5 / 90 ,2);
        V_VMUNICIPIO := ROUND(V_VALORBASE* 71 / 90 ,2);
        
        /*
        -- calculo impuestos
        V_VCONCONTRAVENCIONAL := V_VCONCONTRAVENCIONAL - ROUND( V_VCONCONTRAVENCIONAL * 0.16, 2 ) + ROUND(V_VCONCONTRAVENCIONAL * 0.11,2);
        V_VFCMCONTRAVENCIONAL := V_VFCMCONTRAVENCIONAL - ROUND( V_VFCMCONTRAVENCIONAL * 0.16, 2 ) - ROUND(V_VFCMCONTRAVENCIONAL * 0.11,2);
 
        V_VMUNICIPIO := V_VMUNICIPIO + ROUND( ROUND(V_VALORBASE*9.5 / 90 ,2) * 0.16, 2 ) + ROUND( ROUND(V_VALORBASE*9.5 / 90 ,2) * 0.16, 2 );        
        */
        
        V_VMUNICIPIO := V_VMUNICIPIO + V_ADICIONAL;
        
     END IF;
     
 end if;
 
 if (V_INDTIPO = 'POLCA' ) then
 
     V_VALORBASE := ROUND(( V_VDEVOLUCION - V_ADICIONAL)  * 10 / 100,2);
     V_VCONCESIONARIO := ROUND(V_VALORBASE * 3.25 / 10,2);
     V_VFCM := ROUND(V_VALORBASE * 1.25 / 10,2);
     V_VFONDOCOBERTURAFCM := ROUND(V_VALORBASE * 0.25 / 10,2);
     V_VFONDOCOBERTURALIQ := ROUND(V_VALORBASE * 0.25 / 10,2);
     V_VEQUILIBRIOECONOMICO := 0.0;
     V_VFCMPOLCA := ROUND(V_VALORBASE * 2.0 / 10,2);
     V_VSEVIAL := ROUND(V_VALORBASE * 3.0 / 10,2);
     
     
     V_VFONDOCOBERTURALIQ := V_VALORBASE - V_VCONCESIONARIO - V_VFCM - V_VFONDOCOBERTURAFCM - V_VFCMPOLCA - V_VSEVIAL;
     
     IF ( V_IDCONCESIONARIO = '05') THEN
        V_VCONCESIONARIO := ROUND(V_VALORBASE * 3.23 / 10,2);
        V_VFCM := 0.0;
        V_VFONDOCOBERTURAFCM := 0.0;
        V_VFONDOCOBERTURALIQ := 0.0;
        V_VEQUILIBRIOECONOMICO := ROUND(V_VALORBASE * 3.77 / 10,2);
        V_VFCMPOLCA := 0.0;
        V_VSEVIAL := ROUND(V_VALORBASE * 3.0 / 10,2);
   
        V_VEQUILIBRIOECONOMICO := V_VALORBASE - V_VCONCESIONARIO - V_VSEVIAL;
         
     END IF;    
     
     IF (ABS(V_VFONDOCOBERTURAFCM -  V_VFONDOCOBERTURALIQ ) = 0.02 ) THEN
        V_VFONDOCOBERTURAFCM := V_VFONDOCOBERTURAFCM - 0.01;
        V_VFONDOCOBERTURALIQ := V_VFONDOCOBERTURALIQ + 0.01;
     END IF;
     
     V_VPOLCABASE := ROUND(( V_VDEVOLUCION - V_ADICIONAL - ROUND(( V_VDEVOLUCION - V_ADICIONAL)  * 0.1,2) ) / 2, 2) ;
     
      
     V_VPOLCA :=  ROUND(V_VPOLCABASE*40.5/45,2) ;
     V_VFCMPOLCA :=  V_VFCMPOLCA + ROUND(V_VPOLCABASE*1.8/45,2) ;
     V_VSEVIAL :=  V_VSEVIAL + ROUND(V_VPOLCABASE*2.7/45,2) ;
     
     /*
     --calculo de impuestos
     V_VPOLCA := V_VPOLCA + ROUND(V_VSEVIALBASE *0.16,2 ) + ROUND(V_VFCMPOLCABASE *0.16,2 );
     V_VSEVIAL := V_VSEVIAL + V_VSEVIALBASE + ROUND((V_VSEVIALBASE *0.015),2) + ROUND((V_VSEVIALBASE * 0.11 ),2) - ROUND((V_VSEVIALBASE * 0.16),2);
     V_VFCMPOLCA := V_VPOLCABASE - V_VPOLCA - V_VSEVIAL + V_VFCMPOLCA;
     */ 
     
     V_VFCMCONTRAVENCIONAL := 0.0;
     V_VCONCONTRAVENCIONAL := 0.0;
     
     V_VMUNICIPIO := V_VPOLCABASE + V_ADICIONAL ;
     
     SELECT COUNT(*) 
     INTO V_NUMREG
     FROM p_dispersion_municipio
     WHERE idmunicipio = V_IDMUNICIPIO
     AND fcm_contravencional_s > 0;
     
     IF (V_NUMREG > 0 ) THEN
 
        V_VALORBASE := ( V_VDEVOLUCION - V_ADICIONAL - V_VALORBASE ) / 2 ;
        V_VFCMCONTRAVENCIONAL := ROUND(V_VALORBASE* 9.5 / 45 ,2);
        V_VCONCONTRAVENCIONAL := ROUND(V_VALORBASE* 9.5 / 45 ,2);
        V_VMUNICIPIO := ROUND(V_VALORBASE* 26 / 45 ,2);
        
        /*
        --CALCULO DE IMPUESTOS 
        V_VCONCONTRAVENCIONAL := V_VCONCONTRAVENCIONAL - ROUND( V_VCONCONTRAVENCIONAL * 0.16, 2 ) + ROUND(V_VCONCONTRAVENCIONAL * 0.11,2);
        V_VFCMCONTRAVENCIONAL := V_VFCMCONTRAVENCIONAL - ROUND( V_VFCMCONTRAVENCIONAL * 0.16, 2 ) - ROUND(V_VFCMCONTRAVENCIONAL * 0.11,2);
        V_VMUNICIPIO := V_VMUNICIPIO + ROUND( ROUND(V_VALORBASE*9.5 / 45 ,2) * 0.16, 2 ) + ROUND( ROUND(V_VALORBASE*9.5 / 45 ,2) * 0.16, 2 );        
        */
        
        V_VMUNICIPIO := V_VMUNICIPIO + V_ADICIONAL;
        
     END IF;
     
 end if;
  
 EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            V_USUARIO || ' [q_NovdevolucionSug] ' || SQLERRM,
            V_ERROR);
    
  END q_NovdevolucionSug;
                            
end PK_NOVDEV;
/


spool off
