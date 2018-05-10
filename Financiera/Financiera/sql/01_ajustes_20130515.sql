----------------------------------------------
-- Export file for user SIMIT               --
-- Created by SEVEN on 15/05/2013, 16:19:27 --
----------------------------------------------

set define off
spool 01_ajustes_20130515.log

prompt
prompt Creating package PK_NOVDEV
prompt ==========================
prompt
create or replace package PK_NOVDEV is

  MSG_UPD_OK VARCHAR2(255) := 'Registro Actualizado Correctamente';
  MSG_INS_OK VARCHAR2(255) := 'Registro Insertado Correctamente';
  MSG_DEL_OK VARCHAR2(255) := 'Registro Eliminado Correctamente';

  PROCEDURE i_NovDevolucion(
                            
                            V_TIPOIDENTIFICACION VARCHAR2,
                            V_IDENTIFICACION     NUMBER,
                            V_NOMBRE             VARCHAR2,
                            V_IDBANCO            VARCHAR2,
                            V_TIPOCUENTA         VARCHAR2,
                            V_CUENTA             VARCHAR2,
                            V_CUENTAREC          VARCHAR2,
                            V_IDMUNICIPIO        VARCHAR2,
                            V_IDCONCESIONARIO    VARCHAR2,
                            V_INDTIPO            VARCHAR2,
                            V_DNS                VARCHAR2,
                            V_MOTIVO             VARCHAR2,
                            
                            V_VDEVOLUCION NUMBER,
                            V_VADICIONAL  NUMBER,
                            V_INDIVA      VARCHAR2,
                            V_INDRETE     VARCHAR2,
                            
                            V_VCONCESIONARIO       NUMBER,
                            V_VFCM                 NUMBER,
                            V_VFONDOCOBERTURAFCM   NUMBER,
                            V_VFONDOCOBERTURALIQ   NUMBER,
                            V_VEQUILIBRIOECONOMICO NUMBER,
                            V_VPOLCA               NUMBER,
                            V_VFCMPOLCA            NUMBER,
                            V_VSEVIAL3             NUMBER,
                            V_VSEVIAL27            NUMBER,
                            V_VMUNICIPIO           NUMBER,
                            V_VFCMCONTRAVENCIONAL  NUMBER,
                            V_VCONCONTRAVENCIONAL  NUMBER,
                            V_VTERCERO             NUMBER,
                            V_FECHA_ACT_ANO        NUMBER,
                            V_FECHA_ACT_MES        NUMBER,
                            V_FECHA_ACT_DIA        NUMBER,
                            
                            V_NUMLIQ VARCHAR2,
                            
                            V_TIPOIDENTIFICACION1 VARCHAR2,
                            V_IDENTIFICACION1     NUMBER,
                            
                            V_FECHA_LIQ_ANO NUMBER,
                            V_FECHA_LIQ_MES NUMBER,
                            V_FECHA_LIQ_DIA NUMBER,
                            
                            V_FECHA_COM_ANO NUMBER,
                            V_FECHA_COM_MES NUMBER,
                            V_FECHA_COM_DIA NUMBER,
                            
                            V_USUARIO VARCHAR2,
                            V_ERROR   OUT VARCHAR2,
                            V_NOVEDAD OUT VARCHAR2
                            
                            );

  PROCEDURE q_NovDevolucionSugImp(V_USUARIO              VARCHAR2,
                                  V_CUENTAREC            VARCHAR2,
                                  V_IDMUNICIPIO          VARCHAR2,
                                  V_IDCONCESIONARIO      VARCHAR2,
                                  V_INDTIPO              VARCHAR2,
                                  V_VDEVOLUCION          NUMBER,
                                  V_ADICIONAL            NUMBER,
                                  V_NUMLIQ               VARCHAR2,
                                  V_INDIVA               VARCHAR2,
                                  V_INDRETE              VARCHAR2,
                                  V_FECLIQ               DATE,
                                  V_FECCOM               DATE,
                                  V_VCONCESIONARIO       OUT NUMBER,
                                  V_VFCM                 OUT NUMBER,
                                  V_VFONDOCOBERTURAFCM   OUT NUMBER,
                                  V_VFONDOCOBERTURALIQ   OUT NUMBER,
                                  V_VEQUILIBRIOECONOMICO OUT NUMBER,
                                  V_VPOLCA               OUT NUMBER,
                                  V_VFCMPOLCA            OUT NUMBER,
                                  V_VSEVIAL3             OUT NUMBER,
                                  V_VSEVIAL27            OUT NUMBER,
                                  V_VMUNICIPIO           OUT NUMBER,
                                  V_VFCMCONTRAVENCIONAL  OUT NUMBER,
                                  V_VCONCONTRAVENCIONAL  OUT NUMBER,
                                  V_VTERCERO             OUT NUMBER,
                                  
                                  V_ERROR OUT VARCHAR2);

  PROCEDURE q_NovDevolucion(V_TIPONOV              VARCHAR2,
                            V_NUMERONOV            VARCHAR2,
                            V_USUARIO              VARCHAR2,
                            V_TIPOIDENTIFICACION   OUT VARCHAR2,
                            V_IDENTIFICACION       OUT NUMBER,
                            V_NOMBRE               OUT VARCHAR2,
                            V_IDBANCO              OUT VARCHAR2,
                            V_TIPOCUENTA           OUT VARCHAR2,
                            V_CUENTA               OUT VARCHAR2,
                            V_TIPOIDENTIFICACIONC  OUT VARCHAR2,
                            V_IDENTIFICACIONC      OUT NUMBER,
                            V_DNS                  OUT VARCHAR2,
                            V_CUENTAREC            OUT VARCHAR2,
                            V_IDMUNICIPIO          OUT VARCHAR2,
                            V_IDCONCESIONARIO      OUT VARCHAR2,
                            V_INDTIPO              OUT VARCHAR2,
                            V_NUMLIQUIDACION       OUT VARCHAR2,
                            V_FECLIQ               OUT DATE,
                            V_FECCOM               OUT DATE,
                            V_MOTIVO               OUT VARCHAR2,
                            V_INDIVA               OUT VARCHAR2,
                            V_INDRETE              OUT VARCHAR2,
                            V_VDEVOLUCION          OUT NUMBER,
                            V_VADICIONAL           OUT NUMBER,
                            V_VCONCESIONARIO       OUT NUMBER,
                            V_VFCM                 OUT NUMBER,
                            V_VFONDOCOBERTURAFCM   OUT NUMBER,
                            V_VFONDOCOBERTURALIQ   OUT NUMBER,
                            V_VEQUILIBRIOECONOMICO OUT NUMBER,
                            V_VSEVIAL              OUT NUMBER,
                            V_VPOLCA               OUT NUMBER,
                            V_VFCMPOLCA            OUT NUMBER,
                            V_SEVIAL27             OUT NUMBER,
                            V_VMUNICIPIO           OUT NUMBER,
                            V_VFCMCONTRAVENCIONAL  OUT NUMBER,
                            V_VCONCONTRAVENCIONAL  OUT NUMBER,
                            V_VTERCERO             OUT NUMBER,
                            V_FECHAACT             OUT DATE,
                            V_ERROR                OUT VARCHAR2);

  PROCEDURE u_NovdevolucionEst(p_tiponov   varchar2,
                               p_numeronov varchar2,
                               p_usuario   varchar2,
                               p_estado    varchar2,
                               p_error     OUT VARCHAR2);

  PROCEDURE q_NovDevolucionSug(V_USUARIO              VARCHAR2,
                               V_CUENTAREC            VARCHAR2,
                               V_IDMUNICIPIO          VARCHAR2,
                               V_IDCONCESIONARIO      VARCHAR2,
                               V_INDTIPO              VARCHAR2,
                               V_VDEVOLUCION          NUMBER,
                               V_ADICIONAL            NUMBER,
                               V_NUMLIQ               VARCHAR2,
                               V_INDIVA               VARCHAR2,
                               V_INDRETE              VARCHAR2,
                               V_FECLIQ               DATE,
                               V_VCONCESIONARIO       OUT NUMBER,
                               V_VFCM                 OUT NUMBER,
                               V_VFONDOCOBERTURAFCM   OUT NUMBER,
                               V_VFONDOCOBERTURALIQ   OUT NUMBER,
                               V_VEQUILIBRIOECONOMICO OUT NUMBER,
                               V_VPOLCA               OUT NUMBER,
                               V_VFCMPOLCA            OUT NUMBER,
                               V_VSEVIAL3             OUT NUMBER,
                               V_VSEVIAL27            OUT NUMBER,
                               V_VMUNICIPIO           OUT NUMBER,
                               V_VFCMCONTRAVENCIONAL  OUT NUMBER,
                               V_VCONCONTRAVENCIONAL  OUT NUMBER,
                               V_VTERCERO             OUT NUMBER,
                               V_ERROR                OUT VARCHAR2);

  PROCEDURE contabiliza_devolucion_externo(p_feccor_ini_ano number,
                                           p_feccor_ini_mes number,
                                           p_feccor_ini_dia number,
                                           p_usuario        varchar2,
                                           p_error          OUT VARCHAR2);

  procedure aplicaNovedadesDevolucion(p_fecha date);

  PROCEDURE i_archivoSoporte(p_idnovedad        varchar2,
                             p_filename         varchar2,
                             p_nombreDocumento  varchar2,
                             p_extensionArchivo varchar2,
                             p_bfile            blob,
                             p_usuario          varchar2,
                             p_error            OUT VARCHAR2);

  PROCEDURE q_archivoSoporte(p_id_documento     number,
                             p_usuario          varchar2,
                             p_nombrearchivo    out varchar2,
                             p_nombreDocumento  out varchar2,
                             p_extensionArchivo out varchar2,
                             p_datosarchivo     out blob,
                             p_error            OUT VARCHAR2);

  PROCEDURE d_archivoSoporte(p_id_documento number,
                             p_usuario      varchar2,
                             p_error        OUT VARCHAR2);

end PK_NOVDEV;
/

prompt
prompt Creating package body PK_NOVDEV
prompt ===============================
prompt
create or replace package body PK_NOVDEV is

  PROCEDURE i_NovDevolucion(
                            
                            V_TIPOIDENTIFICACION VARCHAR2,
                            V_IDENTIFICACION     NUMBER,
                            V_NOMBRE             VARCHAR2,
                            V_IDBANCO            VARCHAR2,
                            V_TIPOCUENTA         VARCHAR2,
                            V_CUENTA             VARCHAR2,
                            V_CUENTAREC          VARCHAR2,
                            V_IDMUNICIPIO        VARCHAR2,
                            V_IDCONCESIONARIO    VARCHAR2,
                            V_INDTIPO            VARCHAR2,
                            V_DNS                VARCHAR2,
                            V_MOTIVO             VARCHAR2,
                            
                            V_VDEVOLUCION NUMBER,
                            V_VADICIONAL  NUMBER,
                            V_INDIVA      VARCHAR2,
                            V_INDRETE     VARCHAR2,
                            
                            V_VCONCESIONARIO       NUMBER,
                            V_VFCM                 NUMBER,
                            V_VFONDOCOBERTURAFCM   NUMBER,
                            V_VFONDOCOBERTURALIQ   NUMBER,
                            V_VEQUILIBRIOECONOMICO NUMBER,
                            V_VPOLCA               NUMBER,
                            V_VFCMPOLCA            NUMBER,
                            V_VSEVIAL3             NUMBER,
                            V_VSEVIAL27            NUMBER,
                            V_VMUNICIPIO           NUMBER,
                            V_VFCMCONTRAVENCIONAL  NUMBER,
                            V_VCONCONTRAVENCIONAL  NUMBER,
                            V_VTERCERO             NUMBER,
                            V_FECHA_ACT_ANO        NUMBER,
                            V_FECHA_ACT_MES        NUMBER,
                            V_FECHA_ACT_DIA        NUMBER,
                            
                            V_NUMLIQ VARCHAR2,
                            
                            V_TIPOIDENTIFICACION1 VARCHAR2,
                            V_IDENTIFICACION1     NUMBER,
                            
                            V_FECHA_LIQ_ANO NUMBER,
                            V_FECHA_LIQ_MES NUMBER,
                            V_FECHA_LIQ_DIA NUMBER,
                            
                            V_FECHA_COM_ANO NUMBER,
                            V_FECHA_COM_MES NUMBER,
                            V_FECHA_COM_DIA NUMBER,
                            
                            V_USUARIO VARCHAR2,
                            V_ERROR   OUT VARCHAR2,
                            V_NOVEDAD OUT VARCHAR2
                            
                            ) AS
  
    w_fecha_act date;
    w_fecha_liq date;
    w_fecha_com date;
  
    numNovedad        number;
    m_dias_activacion number;
    min_fecha_act     date;
    correo_usuario    varchar(100);
    correo_fcm        varchar(100);
  
    w_iva              number;
    w_retencion_fuente number;
    w_timbre           number;
  
    v_vIvaContrConc   number;
    v_vIvaContrFcm    number;
    v_retecontr       number;
    v_vIvasevial27    number;
    v_vIvaFcmPolca    number;
    v_vTimbreSevial27 number;
    v_vReteSevial27   number;
  
    v_vSevialNeto   number;
    v_vFcmPolcaNeto number;
    v_vFcmConNeto   number;
    v_vOpeConNeto   number;
    v_vMunNeto      number;
    v_vPolcaNeto    number;
  
    v_vReteContr number;
  
    v_idbancoRec         char(2);
    v_idConcesionarioZon char(2);
  
    numReg number;
  
  BEGIN
  
    select count(*) 
    into numReg
    from novdevolucion 
    where tiponov = '09' and
    numLiquidacion = V_NUMLIQ;
    
    if (numReg > 0 ) then
      V_ERROR := 'Liquidacion ya fue ingresada en otra devolucion';
      return;
    end if;

  
    select count(*) into numReg from fcm where nit_fcm = '8000826650';
  
    if (numReg = 0) then
      V_ERROR := 'Se deben crear paramatros fcm';
      return;
    
    end if;
  
    select iva, retencion_fuente, impuesto_timbre_tercero
      into w_iva, w_retencion_fuente, w_timbre
      from fcm
     where nit_fcm = '8000826650';
  
    select count(*)
      into numReg
      from person
     where idperson = TO_NUMBER(V_USUARIO);
  
    if (numReg = 0) then
      V_ERROR := 'Se deben crear usuario';
      return;
    
    end if;
  
    select mail
      into correo_usuario
      from person
     where idperson = TO_NUMBER(V_USUARIO);
  
    select substr(correo, 0, 100)
      into correo_fcm
      from fcm
     where nit_fcm = '8000826650';
  
    select count(*)
      into numReg
      from cta_recaudo_concesionario
     where cuenta = V_CUENTAREC
       and idconcesionario = V_IDCONCESIONARIO;
  
    if (numReg = 0) then
      V_ERROR := 'Cuenta de recaudo no existe para el concesionario';
      return;
    end if;
  
    select max(idbanco)
      into v_idbancoRec
      from cta_recaudo_concesionario
     where cuenta = V_CUENTAREC;
  
    select idconcesionario
      into v_idConcesionarioZon
      from municipio
     where idmunicipio = V_IDMUNICIPIO;
  
    select TO_DATE(V_FECHA_ACT_ANO || '-' || V_FECHA_ACT_MES || '-' ||
                   V_FECHA_ACT_DIA,
                   'YYYY-MM-DD')
      into w_fecha_act
      from DUAL;
  
    select TO_DATE(V_FECHA_LIQ_ANO || '-' || V_FECHA_LIQ_MES || '-' ||
                   V_FECHA_LIQ_DIA,
                   'YYYY-MM-DD')
      into w_fecha_liq
      from DUAL;
  
    select TO_DATE(V_FECHA_COM_ANO || '-' || V_FECHA_COM_MES || '-' ||
                   V_FECHA_COM_DIA,
                   'YYYY-MM-DD')
      into w_fecha_com
      from DUAL;
  
    select dias_activacion into m_dias_activacion from fcm;
  
    IF m_dias_activacion is null THEN
      V_ERROR := 'Error en parametrización (días activación)';
      return;
    end if;
  
    min_fecha_act := fn_fec_dispersion(to_date(to_char(sysdate,
                                                       'YYYY-MM-DD'),
                                               'YYYY-MM-DD'),
                                       m_dias_activacion,
                                       0,
                                       '99999999');
  
    IF min_fecha_act > w_fecha_act then
      V_ERROR := 'Fecha Activación Inválida: Minima debe ser ' ||
                 to_char(min_fecha_act, 'yyyy-mm-dd');
      return;
    end if;
  
    if w_fecha_act < sysdate then
      V_ERROR := 'Fecha Activación debe ser superior a la del sistema';
      return;
    end if;
  
    select seq_novedad.Nextval into numNovedad from dual;
  
    v_vIvaContrConc   := 0;
    v_vIvaContrFcm    := 0;
    v_vRetecontr      := 0;
    v_vIvasevial27    := 0;
    v_vIvaFcmPolca    := 0;
    v_vTimbreSevial27 := 0;
    v_vReteSevial27   := 0;
  
    v_vSevialNeto   := 0;
    v_vFcmPolcaNeto := 0;
    v_vFcmConNeto   := 0;
    v_vOpeConNeto   := 0;
    v_vMunNeto      := 0;
    v_vPolcaNeto    := 0;
  
    if V_INDIVA = 'S' then
      v_vIvaContrConc   := round(v_vconcontravencional * w_iva / 100, 0);
      v_vIvaContrFcm    := round(v_vfcmcontravencional * w_iva / 100, 0);
      v_vIvasevial27    := round(V_VSEVIAL27 * w_iva / 100, 0);
      v_vIvaFcmPolca    := round(V_VFCMPOLCA * w_iva / 100, 0);
      v_vTimbreSevial27 := round(V_VSEVIAL27 * w_timbre / 100, 0);
      v_vReteSevial27   := round(V_VSEVIAL27 * w_retencion_fuente / 100, 0);
    end if;
  
    if V_INDRETE = 'S' then
      v_vRetecontr := round(v_vconcontravencional * w_retencion_fuente / 100,
                            0);
    end if;
  
   
    
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
       vadicional,
       indiva,
       indrete,
       dnsavvillas,
       tipoidentificacion1,
       identificacion1,
       numLiquidacion,
       vsevial27,
       vIvaContrConc,
       vIvaContrFcm,
       vIvasevial27,
       vIvaFcmPolca,
       vReteContr,
       idbancoRec,
       idConcesionarioZon,
       fecPagLiq,
       vSevialNeto,
       vFcmPolcaNeto,
       vFcmConNeto,
       vOpeConNeto,
       vMunNeto,
       vPolcaNeto,
       vTimbre,
       vRetef,
       vTercero,
       fecCom)
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
       v_vsevial3,
       v_vmunicipio,
       v_vfcmcontravencional,
       v_vconcontravencional,
       '09', --v_tiponov, NOVEDAD DEVOLUCION
       numNovedad, -- numeronov,
       sysdate, --  fechanov,
       V_usuario, -- usuarionov
       'INGRESADA', -- estadonov,
       w_fecha_act, --  fechaact
       v_vadicional,
       v_indiva,
       v_indrete,
       V_DNS,
       v_tipoidentificacion1,
       v_identificacion1,
       V_NUMLIQ,
       V_VSEVIAL27,
       v_vIvaContrConc,
       v_vIvaContrFcm,
       v_vIvasevial27,
       v_vIvaFcmPolca,
       v_vReteContr,
       v_idbancoRec,
       v_idConcesionarioZon,
       w_fecha_liq,
       v_vsevial3 + v_vSevial27 - v_vTimbreSevial27 - v_vReteSevial27 +
       v_vIvasevial27,
       DECODE(v_idconcesionario,
              '05',
              0,
              v_vfcmpolca + v_vIvaFcmPolca + v_vTimbreSevial27 +
              v_vReteSevial27),
       v_vfcmcontravencional + v_vIvaContrFcm + v_vReteContr,
       v_vconcontravencional + v_vIvaContrConc - v_vReteContr,
       v_vmunicipio + v_vadicional - v_vIvaContrFcm - v_vIvaContrConc,
       v_vpolca - v_vIvasevial27 - v_vIvaFcmPolca,
       v_vTimbreSevial27,
       v_vReteSevial27,
       v_vTercero,
       w_fecha_com);
  
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
                            V_TIPOIDENTIFICACIONC  OUT VARCHAR2,
                            V_IDENTIFICACIONC      OUT NUMBER,
                            V_DNS                  OUT VARCHAR2,
                            V_CUENTAREC            OUT VARCHAR2,
                            V_IDMUNICIPIO          OUT VARCHAR2,
                            V_IDCONCESIONARIO      OUT VARCHAR2,
                            V_INDTIPO              OUT VARCHAR2,
                            V_NUMLIQUIDACION       OUT VARCHAR2,
                            V_FECLIQ               OUT DATE,
                            V_FECCOM               OUT DATE,
                            V_MOTIVO               OUT VARCHAR2,
                            V_INDIVA               OUT VARCHAR2,
                            V_INDRETE              OUT VARCHAR2,
                            V_VDEVOLUCION          OUT NUMBER,
                            V_VADICIONAL           OUT NUMBER,
                            V_VCONCESIONARIO       OUT NUMBER,
                            V_VFCM                 OUT NUMBER,
                            V_VFONDOCOBERTURAFCM   OUT NUMBER,
                            V_VFONDOCOBERTURALIQ   OUT NUMBER,
                            V_VEQUILIBRIOECONOMICO OUT NUMBER,
                            V_VSEVIAL              OUT NUMBER,
                            V_VPOLCA               OUT NUMBER,
                            V_VFCMPOLCA            OUT NUMBER,
                            V_SEVIAL27             OUT NUMBER,
                            V_VMUNICIPIO           OUT NUMBER,
                            V_VFCMCONTRAVENCIONAL  OUT NUMBER,
                            V_VCONCONTRAVENCIONAL  OUT NUMBER,
                            V_VTERCERO             OUT NUMBER,
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
           vadicional,
           TIPOIDENTIFICACION1,
           IDENTIFICACION1,
           DNSAVVILLAS,
           NUMLIQUIDACION,
           FECPAGLIQ,
           INDIVA,
           INDRETE,
           VSEVIAL27,
           vTercero,
           fecCom
    
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
           V_VADICIONAL,
           V_TIPOIDENTIFICACIONC,
           V_IDENTIFICACIONC,
           V_DNS,
           V_NUMLIQUIDACION,
           V_FECLIQ,
           V_INDIVA,
           V_INDRETE,
           V_SEVIAL27,
           V_VTERCERO,
           v_fecCom
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

  PROCEDURE q_NovDevolucionSugImp(V_USUARIO              VARCHAR2,
                                  V_CUENTAREC            VARCHAR2,
                                  V_IDMUNICIPIO          VARCHAR2,
                                  V_IDCONCESIONARIO      VARCHAR2,
                                  V_INDTIPO              VARCHAR2,
                                  V_VDEVOLUCION          NUMBER,
                                  V_ADICIONAL            NUMBER,
                                  V_NUMLIQ               VARCHAR2,
                                  V_INDIVA               VARCHAR2,
                                  V_INDRETE              VARCHAR2,
                                  V_FECLIQ               DATE,
                                  V_FECCOM               DATE,
                                  V_VCONCESIONARIO       OUT NUMBER,
                                  V_VFCM                 OUT NUMBER,
                                  V_VFONDOCOBERTURAFCM   OUT NUMBER,
                                  V_VFONDOCOBERTURALIQ   OUT NUMBER,
                                  V_VEQUILIBRIOECONOMICO OUT NUMBER,
                                  V_VPOLCA               OUT NUMBER,
                                  V_VFCMPOLCA            OUT NUMBER,
                                  V_VSEVIAL3             OUT NUMBER,
                                  V_VSEVIAL27            OUT NUMBER,
                                  V_VMUNICIPIO           OUT NUMBER,
                                  V_VFCMCONTRAVENCIONAL  OUT NUMBER,
                                  V_VCONCONTRAVENCIONAL  OUT NUMBER,
                                  V_VTERCERO             OUT NUMBER,
                                  
                                  V_ERROR OUT VARCHAR2) is
  
    V_VALORBASE NUMBER;
    V_NUMREG    NUMBER;
  
    V_VPOLCABASE    NUMBER;
    V_VFCMPOLCABASE NUMBER;
    V_VSEVIALBASE   NUMBER;
    V_SALARIO       NUMBER;
  
    V_VIVA95 number;
    V_VRET95 NUMBER;
  
    V_VIVA27 number;
    V_VIVA18 number;
    V_VRET27 number;
    V_VTIM27 number;
  
    V_INDRETRO NUMBER;
  begin
  
    select count(*)
      into V_NUMREG
      from salario_minimo
     where anho = to_number(to_char(V_FECLIQ, 'yyyy'));
  
    if (v_numreg = 0) then
      v_error := 'Salario Minimo no definido para el año ' ||
                 to_char(v_fecliq, 'yyyy');
      return;
    end if;
  
    select valor
      into v_salario
      from salario_minimo
     where anho = to_number(to_char(v_fecliq, 'yyyy'));
  
    select indretroactividad
      into V_INDRETRO
      from municipio
     where idmunicipio = v_idmunicipio;
  
    v_error := 'OK';
  
    v_vTercero := 0;
  
    if (V_INDTIPO = 'SIMIT') then
    
      V_VALORBASE := ROUND((V_VDEVOLUCION - V_ADICIONAL) * 10 / 100, 2);
    
      if (V_VALORBASE < v_salario and v_indretro = 0) then
        if ((V_VDEVOLUCION - V_ADICIONAL) < v_salario) then
          V_VALORBASE := V_VDEVOLUCION - V_ADICIONAL;
        else
          V_VALORBASE := V_SALARIO;
        end if;
      end if;

      if (V_VALORBASE < v_salario and v_indretro = 1 and V_FECCOM >= to_date('2002-11-08','yyyy-mm-dd') ) then
        if ((V_VDEVOLUCION - V_ADICIONAL) < v_salario) then
          V_VALORBASE := V_VDEVOLUCION - V_ADICIONAL;
        else
          V_VALORBASE := V_SALARIO;
        end if;
      end if;
    
      V_VCONCESIONARIO       := ROUND(V_VALORBASE * 6.5 / 10, 2);
      V_VFCM                 := ROUND(V_VALORBASE * 2.5 / 10, 2);
      V_VFONDOCOBERTURAFCM   := ROUND(V_VALORBASE * 0.5 / 10, 2);
      V_VFONDOCOBERTURALIQ   := ROUND(V_VALORBASE * 0.5 / 10, 2);
      V_VEQUILIBRIOECONOMICO := 0.0;
      V_VFONDOCOBERTURALIQ   := V_VALORBASE - V_VCONCESIONARIO - V_VFCM -
                                V_VFONDOCOBERTURAFCM;
    
      IF (V_IDCONCESIONARIO = '05') THEN
        V_VCONCESIONARIO       := ROUND(V_VALORBASE * 6.45 / 10, 2);
        V_VFCM                 := ROUND(V_VALORBASE * 1.05 / 10, 2);
        V_VFONDOCOBERTURAFCM   := 0.0;
        V_VFONDOCOBERTURALIQ   := 0.0;
        V_VEQUILIBRIOECONOMICO := ROUND(V_VALORBASE * 2.5 / 10, 2);
      
        V_VEQUILIBRIOECONOMICO := V_VALORBASE - V_VCONCESIONARIO - V_VFCM;
      
      END IF;
      
      IF (V_IDCONCESIONARIO = '06') THEN
        V_VCONCESIONARIO       := 0.0;
        V_VFCM                 := V_VALORBASE;
        V_VFONDOCOBERTURAFCM   := 0.0;
        V_VFONDOCOBERTURALIQ   := 0.0;
        V_VEQUILIBRIOECONOMICO := 0.0;
      
      END IF;
      
    
      IF (ABS(V_VFONDOCOBERTURAFCM - V_VFONDOCOBERTURALIQ) = 0.02) THEN
        V_VFONDOCOBERTURAFCM := V_VFONDOCOBERTURAFCM - 0.01;
        V_VFONDOCOBERTURALIQ := V_VFONDOCOBERTURALIQ + 0.01;
      END IF;
    
      V_VMUNICIPIO := V_VDEVOLUCION - V_VALORBASE;
    
      V_VPOLCA    := 0.0;
      V_VFCMPOLCA := 0.0;
      V_VSEVIAL3  := 0.0;
      V_VSEVIAL27 := 0.0;
    
      V_VFCMCONTRAVENCIONAL := 0.0;
      V_VCONCONTRAVENCIONAL := 0.0;
    
      SELECT COUNT(*)
        INTO V_NUMREG
        FROM p_dispersion_municipio
       WHERE idmunicipio = V_IDMUNICIPIO
         AND fcm_contravencional_s > 0;
    
      IF (V_NUMREG > 0) THEN
      
        V_VALORBASE           := V_VDEVOLUCION - V_ADICIONAL - V_VALORBASE;
        V_VFCMCONTRAVENCIONAL := ROUND(V_VALORBASE * 9.5 / 90, 2);
        V_VCONCONTRAVENCIONAL := ROUND(V_VALORBASE * 9.5 / 90, 2);
        V_VMUNICIPIO          := ROUND(V_VALORBASE * 71 / 90, 2);
      
        V_VIVA95 := ROUND(V_VFCMCONTRAVENCIONAL * 16 / 100, 2);
        V_VRET95 := ROUND(V_VFCMCONTRAVENCIONAL * 11 / 100, 2);
      
        V_VFCMCONTRAVENCIONAL := V_VFCMCONTRAVENCIONAL + V_VIVA95 +
                                 V_VRET95;
        V_VCONCONTRAVENCIONAL := V_VCONCONTRAVENCIONAL + V_VIVA95 -
                                 V_VRET95;
        V_VMUNICIPIO          := V_VMUNICIPIO - V_VIVA95 - V_VIVA95;
      
        V_VCONCONTRAVENCIONAL := V_VALORBASE - V_VFCMCONTRAVENCIONAL -
                                 V_VMUNICIPIO;
      
        V_VMUNICIPIO := V_VMUNICIPIO + V_ADICIONAL;
      
      END IF;
    
      if (V_IDMUNICIPIO = '08001000' and
         V_FECCOM < to_date('24/12/2008', 'dd/mm/yyyy')) then
        v_vTercero   := V_VMUNICIPIO;
        V_VMUNICIPIO := 0;
      end if;
    
    end if;
  
    if (V_INDTIPO = 'POLCA') then
    
      V_VALORBASE := ROUND((V_VDEVOLUCION - V_ADICIONAL) * 10 / 100, 2);
    
      if (V_VALORBASE < v_salario and v_indretro = 0) then
        if ((V_VDEVOLUCION - V_ADICIONAL) < v_salario) then
          V_VALORBASE := V_VDEVOLUCION - V_ADICIONAL;
        else
          V_VALORBASE := V_SALARIO;
        end if;
      end if;

      if (V_VALORBASE < v_salario and v_indretro = 1 and V_FECCOM >= to_date('2002-11-08','yyyy-mm-dd') ) then
        if ((V_VDEVOLUCION - V_ADICIONAL) < v_salario) then
          V_VALORBASE := V_VDEVOLUCION - V_ADICIONAL;
        else
          V_VALORBASE := V_SALARIO;
        end if;
      end if;

    
      V_VCONCESIONARIO       := ROUND(V_VALORBASE * 3.25 / 10, 2);
      V_VFCM                 := ROUND(V_VALORBASE * 3.25 / 10, 2);
      V_VFONDOCOBERTURAFCM   := ROUND(V_VALORBASE * 0.25 / 10, 2);
      V_VFONDOCOBERTURALIQ   := ROUND(V_VALORBASE * 0.25 / 10, 2);
      V_VEQUILIBRIOECONOMICO := 0.0;
      V_VSEVIAL3             := ROUND(V_VALORBASE * 3.0 / 10, 2);
    
      V_VFONDOCOBERTURALIQ := V_VALORBASE - V_VCONCESIONARIO - V_VFCM -
                              V_VFONDOCOBERTURAFCM - V_VSEVIAL3;
    
      IF (V_IDCONCESIONARIO = '05') THEN
        V_VCONCESIONARIO       := ROUND(V_VALORBASE * 3.23 / 10, 2);
        V_VFCM                 := 0.0;
        V_VFONDOCOBERTURAFCM   := 0.0;
        V_VFONDOCOBERTURALIQ   := 0.0;
        V_VEQUILIBRIOECONOMICO := ROUND(V_VALORBASE * 3.77 / 10, 2);
        V_VSEVIAL3             := ROUND(V_VALORBASE * 3.0 / 10, 2);
      
        V_VEQUILIBRIOECONOMICO := V_VALORBASE - V_VCONCESIONARIO -
                                  V_VSEVIAL3;
      
      END IF;

      IF (V_IDCONCESIONARIO = '06') THEN
        V_VCONCESIONARIO       := 0.0;
        V_VFCM                 := V_VALORBASE;
        V_VFONDOCOBERTURAFCM   := 0.0;
        V_VFONDOCOBERTURALIQ   := 0.0;
        V_VEQUILIBRIOECONOMICO := 0.0;
        V_VSEVIAL3             := 0.0;
     
      END IF;

    
      IF (ABS(V_VFONDOCOBERTURAFCM - V_VFONDOCOBERTURALIQ) = 0.02) THEN
        V_VFONDOCOBERTURAFCM := V_VFONDOCOBERTURAFCM - 0.01;
        V_VFONDOCOBERTURALIQ := V_VFONDOCOBERTURALIQ + 0.01;
      END IF;
    
      V_VPOLCABASE := ROUND((V_VDEVOLUCION - V_ADICIONAL - V_VALORBASE) / 2,
                            2);
    
      V_VPOLCA    := ROUND(V_VPOLCABASE * 40.5 / 45, 2);
      V_VFCMPOLCA := ROUND(V_VPOLCABASE * 1.8 / 45, 2);
      V_VSEVIAL27 := ROUND(V_VPOLCABASE * 2.7 / 45, 2);
    
      V_VIVA27 := round(V_VSEVIAL27 * 16 / 100, 2);
      V_VIVA18 := round(V_VFCMPOLCA * 16 / 100, 2);
      V_VRET27 := round(V_VSEVIAL27 * 11 / 100, 2);
      V_VTIM27 := round(V_VSEVIAL27 * 1.5 / 100, 2);
    
      V_VPOLCA    := V_VPOLCA - V_VIVA27 - V_VIVA18;
      V_VSEVIAL27 := V_VSEVIAL27 + V_VIVA27 - V_VRET27 - V_VTIM27;
      V_VFCMPOLCA := V_VFCMPOLCA + V_VIVA18 + V_VRET27 + V_VTIM27;
    
      V_VSEVIAL27 := V_VPOLCABASE - V_VPOLCA - V_VFCMPOLCA;
    
      IF (V_IDCONCESIONARIO = '05') THEN
        V_VEQUILIBRIOECONOMICO := V_VEQUILIBRIOECONOMICO + V_VFCMPOLCA;
        V_VFCMPOLCA            := 0;
      END IF;
    
      V_VFCMCONTRAVENCIONAL := 0.0;
      V_VCONCONTRAVENCIONAL := 0.0;
    
      V_VMUNICIPIO := V_VPOLCABASE + V_ADICIONAL;
    
      SELECT COUNT(*)
        INTO V_NUMREG
        FROM p_dispersion_municipio
       WHERE idmunicipio = V_IDMUNICIPIO
         AND fcm_contravencional_s > 0;
    
      IF (V_NUMREG > 0) THEN
      
        V_VALORBASE           := (V_VDEVOLUCION - V_ADICIONAL - V_VALORBASE) / 2;
        V_VFCMCONTRAVENCIONAL := ROUND(V_VALORBASE * 9.5 / 45, 2);
        V_VCONCONTRAVENCIONAL := ROUND(V_VALORBASE * 9.5 / 45, 2);
        V_VMUNICIPIO          := ROUND(V_VALORBASE * 26 / 45, 2);
      
        V_VIVA95 := ROUND(V_VFCMCONTRAVENCIONAL * 16 / 100, 2);
        V_VRET95 := ROUND(V_VFCMCONTRAVENCIONAL * 11 / 100, 2);
      
        V_VFCMCONTRAVENCIONAL := V_VFCMCONTRAVENCIONAL + V_VIVA95 +
                                 V_VRET95;
        V_VCONCONTRAVENCIONAL := V_VCONCONTRAVENCIONAL + V_VIVA95 -
                                 V_VRET95;
        V_VMUNICIPIO          := V_VMUNICIPIO - V_VIVA95 - V_VIVA95;
      
        V_VCONCONTRAVENCIONAL := V_VALORBASE - V_VFCMCONTRAVENCIONAL -
                                 V_VMUNICIPIO;
      
        V_VMUNICIPIO := V_VMUNICIPIO + V_ADICIONAL;
      
      END IF;
    
      if (V_IDMUNICIPIO = '08001000' and
         V_FECCOM < to_date('24/12/2008', 'dd/mm/yyyy')) then
        v_vTercero   := V_VMUNICIPIO;
        V_VMUNICIPIO := 0;
      end if;
    
    end if;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            V_USUARIO || ' [q_NovdevolucionSug] ' || SQLERRM,
            V_ERROR);
    
  END q_NovdevolucionSugImp;

  PROCEDURE q_NovDevolucionSug(V_USUARIO              VARCHAR2,
                               V_CUENTAREC            VARCHAR2,
                               V_IDMUNICIPIO          VARCHAR2,
                               V_IDCONCESIONARIO      VARCHAR2,
                               V_INDTIPO              VARCHAR2,
                               V_VDEVOLUCION          NUMBER,
                               V_ADICIONAL            NUMBER,
                               V_NUMLIQ               VARCHAR2,
                               V_INDIVA               VARCHAR2,
                               V_INDRETE              VARCHAR2,
                               V_FECLIQ               DATE,
                               V_VCONCESIONARIO       OUT NUMBER,
                               V_VFCM                 OUT NUMBER,
                               V_VFONDOCOBERTURAFCM   OUT NUMBER,
                               V_VFONDOCOBERTURALIQ   OUT NUMBER,
                               V_VEQUILIBRIOECONOMICO OUT NUMBER,
                               V_VPOLCA               OUT NUMBER,
                               V_VFCMPOLCA            OUT NUMBER,
                               V_VSEVIAL3             OUT NUMBER,
                               V_VSEVIAL27            OUT NUMBER,
                               V_VMUNICIPIO           OUT NUMBER,
                               V_VFCMCONTRAVENCIONAL  OUT NUMBER,
                               V_VCONCONTRAVENCIONAL  OUT NUMBER,
                               V_VTERCERO             OUT NUMBER,
                               
                               V_ERROR OUT VARCHAR2) is
  
    V_VALORBASE NUMBER;
    V_NUMREG    NUMBER;
  
    V_VPOLCABASE    NUMBER;
    V_VFCMPOLCABASE NUMBER;
    V_VSEVIALBASE   NUMBER;
    V_SALARIO       NUMBER;
  
    V_INDRETRO NUMBER;
  begin
  
    select count(*)
      into V_NUMREG
      from salario_minimo
     where anho = to_number(to_char(V_FECLIQ, 'yyyy'));
  
    if (v_numreg = 0) then
      v_error := 'Salario Minimo no definido para el año ' ||
                 to_char(v_fecliq, 'yyyy');
      return;
    end if;
  
    select valor
      into v_salario
      from salario_minimo
     where anho = to_number(to_char(v_fecliq, 'yyyy'));
  
    select indretroactividad
      into V_INDRETRO
      from municipio
     where idmunicipio = v_idmunicipio;
  
    v_error := 'OK';
  
    v_vTercero := 0;
  
    if (V_INDTIPO = 'SIMIT') then
    
      V_VALORBASE := ROUND((V_VDEVOLUCION - V_ADICIONAL) * 10 / 100, 2);
    
      if (V_VALORBASE < v_salario and v_indretro = 0) then
        if ((V_VDEVOLUCION - V_ADICIONAL) < v_salario) then
          V_VALORBASE := V_VDEVOLUCION - V_ADICIONAL;
        else
          V_VALORBASE := V_SALARIO;
        end if;
      end if;
    
      V_VCONCESIONARIO       := ROUND(V_VALORBASE * 6.5 / 10, 2);
      V_VFCM                 := ROUND(V_VALORBASE * 2.5 / 10, 2);
      V_VFONDOCOBERTURAFCM   := ROUND(V_VALORBASE * 0.5 / 10, 2);
      V_VFONDOCOBERTURALIQ   := ROUND(V_VALORBASE * 0.5 / 10, 2);
      V_VEQUILIBRIOECONOMICO := 0.0;
      V_VFONDOCOBERTURALIQ   := V_VALORBASE - V_VCONCESIONARIO - V_VFCM -
                                V_VFONDOCOBERTURAFCM;
    
      IF (V_IDCONCESIONARIO = '05') THEN
        V_VCONCESIONARIO       := ROUND(V_VALORBASE * 6.45 / 10, 2);
        V_VFCM                 := ROUND(V_VALORBASE * 1.05 / 10, 2);
        V_VFONDOCOBERTURAFCM   := 0.0;
        V_VFONDOCOBERTURALIQ   := 0.0;
        V_VEQUILIBRIOECONOMICO := ROUND(V_VALORBASE * 2.5 / 10, 2);
      
        V_VEQUILIBRIOECONOMICO := V_VALORBASE - V_VCONCESIONARIO - V_VFCM;
      
      END IF;
    
      IF (ABS(V_VFONDOCOBERTURAFCM - V_VFONDOCOBERTURALIQ) = 0.02) THEN
        V_VFONDOCOBERTURAFCM := V_VFONDOCOBERTURAFCM - 0.01;
        V_VFONDOCOBERTURALIQ := V_VFONDOCOBERTURALIQ + 0.01;
      END IF;
    
      V_VMUNICIPIO := V_VDEVOLUCION - V_VALORBASE;
    
      V_VPOLCA    := 0.0;
      V_VFCMPOLCA := 0.0;
      V_VSEVIAL3  := 0.0;
      V_VSEVIAL27 := 0.0;
    
      V_VFCMCONTRAVENCIONAL := 0.0;
      V_VCONCONTRAVENCIONAL := 0.0;
    
      SELECT COUNT(*)
        INTO V_NUMREG
        FROM p_dispersion_municipio
       WHERE idmunicipio = V_IDMUNICIPIO
         AND fcm_contravencional_s > 0;
    
      IF (V_NUMREG > 0) THEN
      
        V_VALORBASE           := V_VDEVOLUCION - V_ADICIONAL - V_VALORBASE;
        V_VFCMCONTRAVENCIONAL := ROUND(V_VALORBASE * 9.5 / 90, 2);
        V_VCONCONTRAVENCIONAL := ROUND(V_VALORBASE * 9.5 / 90, 2);
        V_VMUNICIPIO          := ROUND(V_VALORBASE * 71 / 90, 2);
      
        V_VCONCONTRAVENCIONAL := V_VALORBASE - V_VFCMCONTRAVENCIONAL -
                                 V_VMUNICIPIO;
      
        V_VMUNICIPIO := V_VMUNICIPIO + V_ADICIONAL;
      
      END IF;
    
    end if;
  
    if (V_INDTIPO = 'POLCA') then
    
      V_VALORBASE := ROUND((V_VDEVOLUCION - V_ADICIONAL) * 10 / 100, 2);
    
      if (V_VALORBASE < v_salario and v_indretro = 0) then
        V_VALORBASE := V_SALARIO;
      end if;
    
      V_VCONCESIONARIO       := ROUND(V_VALORBASE * 3.25 / 10, 2);
      V_VFCM                 := ROUND(V_VALORBASE * 3.25 / 10, 2);
      V_VFONDOCOBERTURAFCM   := ROUND(V_VALORBASE * 0.25 / 10, 2);
      V_VFONDOCOBERTURALIQ   := ROUND(V_VALORBASE * 0.25 / 10, 2);
      V_VEQUILIBRIOECONOMICO := 0.0;
      V_VSEVIAL3             := ROUND(V_VALORBASE * 3.0 / 10, 2);
    
      V_VFONDOCOBERTURALIQ := V_VALORBASE - V_VCONCESIONARIO - V_VFCM -
                              V_VFONDOCOBERTURAFCM - V_VSEVIAL3;
    
      IF (V_IDCONCESIONARIO = '05') THEN
        V_VCONCESIONARIO       := ROUND(V_VALORBASE * 3.23 / 10, 2);
        V_VFCM                 := 0.0;
        V_VFONDOCOBERTURAFCM   := 0.0;
        V_VFONDOCOBERTURALIQ   := 0.0;
        V_VEQUILIBRIOECONOMICO := ROUND(V_VALORBASE * 3.77 / 10, 2);
        V_VSEVIAL3             := ROUND(V_VALORBASE * 3.0 / 10, 2);
      
        V_VEQUILIBRIOECONOMICO := V_VALORBASE - V_VCONCESIONARIO -
                                  V_VSEVIAL3;
      
      END IF;
    
      IF (ABS(V_VFONDOCOBERTURAFCM - V_VFONDOCOBERTURALIQ) = 0.02) THEN
        V_VFONDOCOBERTURAFCM := V_VFONDOCOBERTURAFCM - 0.01;
        V_VFONDOCOBERTURALIQ := V_VFONDOCOBERTURALIQ + 0.01;
      END IF;
    
      V_VPOLCABASE := ROUND((V_VDEVOLUCION - V_ADICIONAL - V_VALORBASE) / 2,
                            2);
    
      V_VPOLCA    := ROUND(V_VPOLCABASE * 40.5 / 45, 2);
      V_VFCMPOLCA := ROUND(V_VPOLCABASE * 1.8 / 45, 2);
      V_VSEVIAL27 := ROUND(V_VPOLCABASE * 2.7 / 45, 2);
    
      V_VSEVIAL27 := V_VPOLCABASE - V_VPOLCA - V_VFCMPOLCA;
    
      IF (V_IDCONCESIONARIO = '05') THEN
        V_VEQUILIBRIOECONOMICO := V_VEQUILIBRIOECONOMICO + V_VFCMPOLCA;
        V_VFCMPOLCA            := 0;
      END IF;
    
      V_VFCMCONTRAVENCIONAL := 0.0;
      V_VCONCONTRAVENCIONAL := 0.0;
    
      V_VMUNICIPIO := V_VPOLCABASE + V_ADICIONAL;
    
      SELECT COUNT(*)
        INTO V_NUMREG
        FROM p_dispersion_municipio
       WHERE idmunicipio = V_IDMUNICIPIO
         AND fcm_contravencional_s > 0;
    
      IF (V_NUMREG > 0) THEN
      
        V_VALORBASE           := (V_VDEVOLUCION - V_ADICIONAL - V_VALORBASE) / 2;
        V_VFCMCONTRAVENCIONAL := ROUND(V_VALORBASE * 9.5 / 45, 2);
        V_VCONCONTRAVENCIONAL := ROUND(V_VALORBASE * 9.5 / 45, 2);
        V_VMUNICIPIO          := ROUND(V_VALORBASE * 26 / 45, 2);
      
        V_VCONCONTRAVENCIONAL := V_VALORBASE - V_VFCMCONTRAVENCIONAL -
                                 V_VMUNICIPIO;
      
        V_VMUNICIPIO := V_VMUNICIPIO + V_ADICIONAL;
      
      END IF;
    
    end if;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            V_USUARIO || ' [q_NovdevolucionSug] ' || SQLERRM,
            V_ERROR);
    
  END q_NovdevolucionSug;

  PROCEDURE contabiliza_devolucion_externo(p_feccor_ini_ano number,
                                           p_feccor_ini_mes number,
                                           p_feccor_ini_dia number,
                                           p_usuario        varchar2,
                                           p_error          OUT VARCHAR2) AS
    w_fec_cor_ini date;
    w_registros   number;
  
    w_fec_cor_ini_s char(8);
    w_concepto      varchar(250);
  
    tipoCon char(3);
  
    zt char(2);
    ze char(2);
  
    pfc1 char(4);
    fcm1 char(4);
    cop  char(3);
    c50  char(2);
    c40  char(2);
    c31  char(2);
    c01  char(2);
    c11  char(2);
    c21  char(2);
  
    v5 char(2);
  
    c20111 char(5);
    c20112 char(5);
    c20113 char(5);
    c20114 char(5);
  
    c20211 char(5);
    c20212 char(5);
    c20213 char(5);
    c20214 char(5);
  
    c20121 char(5);
    c20122 char(5);
    c20123 char(5);
    c20124 char(5);
  
    c20221 char(5);
    c20222 char(5);
    c20223 char(5);
    c20224 char(5);
  
    c201213 char(6);
    c202213 char(6);
    c200101 char(6);
  
    c200102 char(6);
    c100761 char(6);
  
    c201111 char(6);
    c201121 char(6);
    c201215 char(6);
    c201221 char(6);
  
    cZ000 char(4);
    cZ002 char(4);
    cZ005 char(4);
  
    c1401020102 char(10);
    c8000826650 char(10);
    c5810900202 char(10);
    c4810900202 char(10);
    c2905901001 char(10);
    c2905901002 char(10);
    c2905901003 char(10);
    c2905901004 char(10);
    c1470909002 char(10);
    c5111110112 char(10);
    c5815930102 char(10);
    c5815930101 char(10);
    c4815590102 char(10);
  
    c1470900601 char(10);
    c2905901005 char(10);
    c2905901009 char(10);
    c1470909003 char(10);
    cYYYYYYYYYY char(10);
  
  BEGIN
    zt := FN_DAR_PARCONTA('ZT');
    ze := FN_DAR_PARCONTA('ZE');
  
    pfc1 := FN_DAR_PARCONTA('PFC1');
    fcm1 := FN_DAR_PARCONTA('FCM1');
    cop  := FN_DAR_PARCONTA('COP');
  
    c50 := FN_DAR_PARCONTA('50');
    c40 := FN_DAR_PARCONTA('40');
    c31 := FN_DAR_PARCONTA('31');
    c01 := FN_DAR_PARCONTA('01');
    c11 := FN_DAR_PARCONTA('11');
    c21 := FN_DAR_PARCONTA('21');
  
    v5 := FN_DAR_PARCONTA('V5');
  
    c20111 := FN_DAR_PARCONTA('20111');
    c20112 := FN_DAR_PARCONTA('20112');
    c20113 := FN_DAR_PARCONTA('20113');
    c20114 := FN_DAR_PARCONTA('20114');
  
    c20211 := FN_DAR_PARCONTA('20211');
    c20212 := FN_DAR_PARCONTA('20212');
    c20213 := FN_DAR_PARCONTA('20213');
    c20214 := FN_DAR_PARCONTA('20214');
  
    c20121 := FN_DAR_PARCONTA('20121');
    c20122 := FN_DAR_PARCONTA('20122');
    c20123 := FN_DAR_PARCONTA('20123');
    c20124 := FN_DAR_PARCONTA('20124');
  
    c20221  := FN_DAR_PARCONTA('20221');
    c20222  := FN_DAR_PARCONTA('20222');
    c20223  := FN_DAR_PARCONTA('20223');
    c20224  := FN_DAR_PARCONTA('20224');
    c200101 := FN_DAR_PARCONTA('200101');
    c200102 := FN_DAR_PARCONTA('200102');
    c202213 := FN_DAR_PARCONTA('202213');
    c201213 := FN_DAR_PARCONTA('201213');
    c201111 := FN_DAR_PARCONTA('201111');
    c201121 := FN_DAR_PARCONTA('201121');
    c201215 := FN_DAR_PARCONTA('201215');
    c201221 := FN_DAR_PARCONTA('201221');
  
    c100761 := FN_DAR_PARCONTA('100761');
  
    cZ000 := FN_DAR_PARCONTA('Z000');
    cZ002 := FN_DAR_PARCONTA('Z002');
    cZ005 := FN_DAR_PARCONTA('Z005');
  
    c1401020102 := FN_DAR_PARCONTA('1401020102');
    c8000826650 := FN_DAR_PARCONTA('8000826650');
  
    c5810900202 := FN_DAR_PARCONTA('5810900202');
    c4810900202 := FN_DAR_PARCONTA('4810900202');
  
    c2905901001 := FN_DAR_PARCONTA('2905901001');
    c2905901002 := FN_DAR_PARCONTA('2905901002');
    c2905901003 := FN_DAR_PARCONTA('2905901003');
    c2905901004 := FN_DAR_PARCONTA('2905901004');
    c1470909002 := FN_DAR_PARCONTA('1470909002');
    c5111110112 := FN_DAR_PARCONTA('5111110112');
    c5815930102 := FN_DAR_PARCONTA('5815930102');
    c5815930101 := FN_DAR_PARCONTA('5815930101');
    c4815590102 := FN_DAR_PARCONTA('4815590102');
  
    c1470900601 := FN_DAR_PARCONTA('1470900601');
    c2905901005 := FN_DAR_PARCONTA('2905901005');
    c2905901009 := FN_DAR_PARCONTA('2905901009');
    c1470909003 := FN_DAR_PARCONTA('1470909003');
    cYYYYYYYYYY := FN_DAR_PARCONTA('YYYYYYYYYY');
  
    tipoCon := 'DEV';
  
    -- Obtiene fecha de cierre en formato ddMMyyyy
    select TO_DATE(p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
                   p_feccor_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_ini
      from DUAL;
  
    select to_char(w_fec_cor_ini, 'ddMMyyyy')
      into w_fec_cor_ini_s
      from DUAL;
  
    -- elimina contabilizacion
    delete recaudo_externo_contabilidad
     where fechaDoc = w_fec_cor_ini_s
       and tipoContable = tipoCon;
  
    -- contabilizar valores de recuado simit
    -- and liquidador no sea simit capital
    -- and acuerdo de pago sea 0
    -- and valor contravencional sea 0
  
    w_concepto := 'DEV REC INGRESO PART CONCESIONARIO CONCESIONARIO  6,5% (6.45%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.cuentarec) as textocabezera,
             c40 as clavecontable,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    b.cuentacontable,
                    c5815930102) as cuenta,
             r.vconcesionario as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    '',
                    c200102) as centrocosto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    c20111 || substr(r.idconcesionario, 2, 1),
                    '') as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.idmunicipio AS asignacion,
             ('DEV REC ING PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    substr(m.nit_m, 0, 9),
                    substr(c.nit_c, 0, 9)) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'DEV REC INGRESO FONDO COB CONCESIONARIO ( 0,5%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c40 as clavecontable,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    b.cuentacontable,
                    c5815930102) as cuenta,
             r.vfondocoberturaliq as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    '',
                    c200102) as centrocosto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    c20112 || substr(r.idconcesionario, 2, 1),
                    '') as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV REC ING FONDO COB ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    substr(m.nit_m, 0, 9),
                    substr(c.nit_c, 0, 9)) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'DEV REC INGRESO EQUILIBRIO ECO ( 2,5%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c40 as clavecontable,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    b.cuentacontable,
                    c5815930101) as cuenta,
             r.vequilibrioeconomico as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    '',
                    c200101) as centrocosto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    c20113 || substr(r.idconcesionario, 2, 1),
                    '') as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV REC ING EQUILIBRIO ECO ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'DEV REC INGRESO FCM ( 2,5% 0R 1,05%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c40 as clavecontable,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    b.cuentacontable,
                    c5815930101) as cuenta,
             r.vfcm as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    '',
                    c200101) as centrocosto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    c20113 || substr(r.idconcesionario, 2, 1),
                    '') as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV REC ING FCM ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'DEV REC INGRESO FONDO COB FCM ( 0,5%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c40 as clavecontable,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    b.cuentacontable,
                    c5815930101) as cuenta,
             r.vfondocoberturafcm as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    '',
                    c200101) as centrocosto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    c20114 || substr(r.idconcesionario, 2, 1),
                    '') as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV REC ING FONDO COB FCM ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'CUENTA PAGO USUARIO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c50 as clavecontable,
             cYYYYYYYYYY as cuenta,
             r.vdevolucion as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV-CXP USUARIO ' ||
             to_char(identificacion, '0000000000000') || ' ' ||
             to_char(numeronov, '0000000000')) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, municipio m
      
       where r.idmunicipio = m.idmunicipio
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'DEV PARTICIPACION MUNICIPIO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c01 as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (ROUND(r.vmunicipio, 0) - ROUND(r.vivacontrfcm, 0) -
             ROUND(r.vivacontrconc, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV PARTICIPACION MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             c1470900601 as cuentadivergente,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechabase,
             cZ005 as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion             r,
             banco                     b,
             municipio                 m,
             concesionario             c,
             cta_recaudo_concesionario cr
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and R.CuentaRec = cr.cuenta
         and r.idbancorec = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.idconcesionario = cr.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'DEV REC GASTO PART CONCESIONARIO REMO (6.5%, 6,45%))';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c50 as clavecontable,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    c.cta_contable_liquidacion,
                    c4815590102) as cuenta,
             r.vconcesionario as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    c200102,
                    '') as centrocosto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    '',
                    c20111 || substr(r.idconcesionario, 2, 1)) as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV REC GASTO PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    substr(C.NIT_C, 0, 9),
                    substr(m.nit_m, 0, 9)) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'DEV REC GASTO FONDO COB CONCESIONARIO ( 0,5%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c50 as clavecontable,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    C.CTA_CONTABLE_FONDO,
                    c4815590102) as cuenta,
             r.vfondocoberturaliq as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    c200102,
                    '') as centrocosto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    '',
                    c20112 || substr(r.idconcesionario, 2, 1)) as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV REC GASTO FONDO COB ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    substr(C.NIT_C, 0, 9),
                    substr(m.nit_m, 0, 9)) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'OTRO ACREEDOR CONCESIONARIO ( 6,5% + 0,5%, 6.45%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c01 as clavecontable,
             substr(C.NIT_C, 0, 9) as cuenta,
             ROUND(R.vconcesionario, 0) + ROUND(R.vfondocoberturaliq, 0) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV OTRO ACREEDOR ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(C.NIT_C, 0, 9) as nittercero,
             c1470900601 as cuentadivergente,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechabase,
             cZ005 as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'CXC 10% AL MUNICIPIO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             (R.NUMLIQUIDACION || 'A') as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c11 as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (ROUND(r.vconcesionario, 0) + ROUND(r.vfcm, 0) +
             ROUND(r.vfondocoberturafcm, 0) +
             ROUND(r.vfondocoberturaliq, 0) +
             ROUND(r.vequilibrioeconomico, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV CXC 10% AL MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             c1401020102 as cuentadivergente,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'CXC 10% AL MUNICIPIO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             (R.NUMLIQUIDACION || 'A') as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c01 as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (ROUND(r.vconcesionario, 0) + ROUND(r.vfcm, 0) +
             ROUND(r.vfondocoberturafcm, 0) +
             ROUND(r.vfondocoberturaliq, 0) +
             ROUND(r.vequilibrioeconomico, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV CXC 10% AL MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             c1401020102 as cuentadivergente,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechabase,
             cZ005 as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'DEV PARTICIPACION CONTRAVENCIONAL concesionario';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c21 as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             ROUND(r.vconcontravencional, 2) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV PART CONTRAVENCIONAL ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             c2905901005 as cuentadivergente,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionarioZon = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'DEV PARTICIPACION IVA CONTRAVENCIONAL concesionario';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c21 as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             ROUND(r.vivacontrconc, 2) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV PART IVA CONTRAVENCIONAL  ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             c2905901009 as cuentadivergente,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechabase,
             cZ005 as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionarioZon = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'DEV PARTICIPACION IVA CONTRAVENCIONAL FCM';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c40 as clavecontable,
             f.ctacon_impuestos as cuenta,
             r.vivacontrfcm as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV PARTICIPACION IVA CONTRAVENCIONAL FCM') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c, fcm f
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionarioZon = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'PARTICIPACION CONTRAVENCIONAL FCM';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c40 as clavecontable,
             f.ctacon_fcm as cuenta,
             vfcmcontravencional as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV PARTICIPACION CONTRAVENCIONAL FCM') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c, fcm f
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionarioZon = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'DEV CRUCE CXC A SIMIT 19% IVA';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             fcm1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c50 as clavecontable,
             c1470909003 as cuenta,
             (ROUND(r.vfcmcontravencional, 0) +
             ROUND(r.vconcontravencional, 0) + ROUND(r.vivacontrconc, 0) +
             ROUND(r.vivacontrfcm, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV CRUCE CXC A SIMIT') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c, fcm f
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionarioZon = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'DEV CRUCE CXP A SIMIT';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             'FCM1' as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c21 as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (ROUND(r.vfcmcontravencional, 0) +
             ROUND(r.vconcontravencional, 0) + ROUND(r.vivacontrconc, 0) +
             ROUND(r.vivacontrfcm, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV CRUCE CXP A SIMIT') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechabase,
             cZ005 as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c, fcm f
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionarioZon = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'DEV REC INGRESO PART CONCESIONARIO CONCESIONARIO  3,25% (3.23%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c40 as clavecontable,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    b.cuentacontable,
                    c5815930102) as cuenta,
             r.vconcesionario as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    '',
                    c200102) as centrobeneficio,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    c20121 || substr(r.idconcesionario, 2, 1),
                    '') as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV REC ING PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    substr(m.nit_m, 0, 9),
                    substr(c.nit_c, 0, 9)) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'POLCA';
  
    w_concepto := 'DEV REC INGRESO FONDO COB CONCESIONARIO ( 0,25%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c40 as clavecontable,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    b.cuentacontable,
                    c5815930102) as cuenta,
             r.vfondocoberturaliq as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    '',
                    c200102) as centrobeneficio,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    c20122 || substr(r.idconcesionario, 2, 1),
                    '') as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV REC ING FONDO COB ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    substr(m.nit_m, 0, 9),
                    substr(c.nit_c, 0, 9)) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'POLCA';
  
    w_concepto := 'DEV REC INGRESO EQUILIBRIO ECO ( 3,77%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c40 as clavecontable,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    b.cuentacontable,
                    c5815930101) as cuenta,
             r.vequilibrioeconomico as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    '',
                    c200101) as centrobeneficio,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    c20123 || substr(r.idconcesionario, 2, 1),
                    '') as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV REC ING EQUILIBRIO ECO ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'POLCA';
  
    w_concepto := 'DEV REC INGRESO FCM ( 3,25% = 1.25 + 2)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c40 as clavecontable,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    b.cuentacontable,
                    c5815930101) as cuenta,
             r.vfcm as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    '',
                    c200101) as centrobeneficio,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    c20123 || substr(r.idconcesionario, 2, 1),
                    '') as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV REC ING FCM ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'POLCA';
  
    w_concepto := 'DEV REC INGRESO FONDO COB FCM ( 0,25%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c40 as clavecontable,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    b.cuentacontable,
                    c5815930101) as cuenta,
             r.vfondocoberturafcm as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    '',
                    c200101) as centrobeneficio,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    c20124 || substr(r.idconcesionario, 2, 1),
                    '') as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV REC ING FONDO COB FCM ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'POLCA';
  
    w_concepto := 'DEV REC INGRESO PART CONCESIONARIO SEVIAL  3,0%';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c40 as clavecontable,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    b.cuentacontable,
                    c5815930102) as cuenta,
             r.vsevial as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    '',
                    c200102) as centrocosto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    c201213,
                    '') as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV REC ING PART CONCES SEVIAL 3.0%') AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    substr(m.nit_m, 0, 9),
                    substr(f.nit_sevial, 0, 9)) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c, fcm f
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and f.nit_fcm = '8000826650'
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'POLCA';
  
    w_concepto := 'CUENTA PAGO USUARIO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c50 as clavecontable,
             cYYYYYYYYYY as cuenta,
             r.vdevolucion as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV-CXP USUARIO ' ||
             to_char(identificacion, '0000000000000') || ' ' ||
             to_char(numeronov, '0000000000')) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion             r,
             banco                     b,
             municipio                 m,
             concesionario             c,
             cta_recaudo_concesionario cr
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and R.CuentaRec = cr.cuenta
         and r.idbancorec = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.idconcesionario = cr.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'POLCA';
  
    w_concepto := 'DEV OTRO ACREEDOR POLCA 39,78';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c01 as clavecontable,
             substr(f.nit_polca, 0, 9) as cuenta,
             (r.vpolca - r.vivasevial27 - r.vivafcmpolca) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV OTRO ACREEDOR POLCA 39,78') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_polca, 0, 9) as nittercero,
             c1470900601 as cuentadivergente,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechabase,
             cZ005 as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c, fcm f
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fechaaplicacion = w_fec_cor_ini
         and r.estadonov = 'ACTIVADA'
         and r.indTipo = 'POLCA';
  
    w_concepto := 'DEV PARTICIPACION MUNICIPIO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c01 as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (ROUND(r.vmunicipio, 0) - ROUND(r.vivacontrfcm, 0) -
             ROUND(r.vivacontrconc, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV PARTICIPACION MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             c1470900601 as cuentadivergente,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechabase,
             cZ005 as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.estadonov = 'ACTIVADA';
  
    w_concepto := 'DEV REC GASTO PART CONCESIONARIO (3.25%, 3,23%))';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c50 as clavecontable,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    c.cta_contable_liquidacion,
                    c4815590102) as cuenta,
             r.vconcesionario as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    c200102,
                    '') as centrocosto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    '',
                    c20121 || substr(r.idconcesionario, 2, 1)) as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV REC GASTO PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    substr(C.NIT_C, 0, 9),
                    substr(m.nit_m, 0, 9)) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.estadonov = 'ACTIVADA';
  
    w_concepto := 'DEV REC GASTO PART CONCESIONARIO sevial (3.0%))';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c50 as clavecontable,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    c.cta_contable_liquidacion,
                    c4815590102) as cuenta,
             r.vsevial as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    c200102,
                    '') as centrocosto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    '',
                    c201213) as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV REC GASTO PART CONCES SEVIAL 3%') AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    substr(f.nit_sevial, 0, 9),
                    substr(c.nit_c, 0, 9)) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c, fcm f
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fechaaplicacion = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.estadonov = 'ACTIVADA';
  
    w_concepto := 'DEV CXP PART SEVIAL 3%';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c01 as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             r.vsevial as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV CXP PART SEVIAL 3%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             c1470900601 as cuentadivergente,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechabase,
             cZ005 as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c, fcm f
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fechaaplicacion = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.estadonov = 'ACTIVADA';
  
    w_concepto := 'DEV REC GASTO FONDO COB CONCESIONARIO ( 0,25%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c50 as clavecontable,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    C.CTA_CONTABLE_FONDO,
                    c4815590102) as cuenta,
             r.vfondocoberturaliq as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    c200102,
                    '') as centrocosto,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    '',
                    c20122 || substr(r.idconcesionario, 2, 1)) as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV REC GASTO FONDO COB ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fecpagliq, 'yyyy'),
                    to_char(w_fec_cor_ini, 'yyyy'),
                    substr(C.NIT_C, 0, 9),
                    substr(m.nit_m, 0, 9)) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.estadonov = 'ACTIVADA';
  
    w_concepto := 'DEV OTRO ACREEDOR CONCESIONARIO ( 3,25% + 0,25%, 3.23% + 0%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c01 as clavecontable,
             substr(C.NIT_C, 0, 9) as cuenta,
             ROUND(R.vconcesionario, 0) + ROUND(R.vfondocoberturaliq, 0) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV OTRO ACREEDOR ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(C.NIT_C, 0, 9) as nittercero,
             c1470900601 as cuentadivergente,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechabase,
             cZ005 as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.estadonov = 'ACTIVADA';
  
    w_concepto := 'PARTICIPACION 2.7%';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c21 as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             r.vsevial27 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV PARTICIPACION SEVIAL 2.7 ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             c2905901001 as cuentadivergente,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c, fcm f
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fechaaplicacion = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.estadonov = 'ACTIVADA';
  
    w_concepto := 'PARTICIPACION IVA 2.7%';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c21 as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             r.vivasevial27 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV PARTICIPACION IVA SEVIAL 2.7 ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             c2905901002 as cuentadivergente,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c, fcm f
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fechaaplicacion = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.estadonov = 'ACTIVADA';
  
    w_concepto := 'DEV PARTICIPACION 1.8%';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c40 as clavecontable,
             c2905901003 as cuenta,
             r.vfcmpolca as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV PARTICIPACION FCM 1.8') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c, fcm f
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fechaaplicacion = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.estadonov = 'ACTIVADA';
  
    w_concepto := 'DEV PARTICIPACION IVA 1.8%';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c40 as clavecontable,
             c2905901004 as cuenta,
             r.vivafcmpolca as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV PARTICIPACION IVA FCM 1.8') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c, fcm f
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fechaaplicacion = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.estadonov = 'ACTIVADA';
  
    w_concepto := 'DEV CXC 10% AL MUNICIPIO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             (R.NUMLIQUIDACION || 'A') as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c11 as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (ROUND(r.vconcesionario, 0) + ROUND(r.vfcm, 0) +
             ROUND(r.vfondocoberturafcm, 0) +
             round(r.vfondocoberturaliq, 0) +
             ROUND(r.vequilibrioeconomico, 0) + round(r.vsevial, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV CXC 10% AL MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             c1401020102 as cuentadivergente,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.estadonov = 'ACTIVADA';
  
    w_concepto := 'DEV CXC 10% AL MUNICIPIO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             (R.NUMLIQUIDACION || 'A') as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c01 as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (ROUND(r.vconcesionario, 0) + ROUND(r.vfcm, 0) +
             ROUND(r.vfondocoberturafcm, 0) +
             round(r.vfondocoberturaliq, 0) +
             ROUND(r.vequilibrioeconomico, 0) + round(r.vsevial, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV CXC 10% AL MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             c1401020102 as cuentadivergente,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechabase,
             cZ005 as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.estadonov = 'ACTIVADA';
  
    w_concepto := 'DEV PARTICIPACION CONTRAVENCIONAL concesionario';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c21 as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             r.vconcontravencional as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV PART CONTRAVENCIONAL ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             c2905901005 as cuentadivergente,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionarioZon = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.estadonov = 'ACTIVADA';
  
    w_concepto := 'IVA PARTICIPACION IVA CONTRAVENCIONAL concesionario';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c21 as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             r.vivacontrconc as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV PART IVA CONTRAVENCIONAL  ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             c2905901009 as cuentadivergente,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionarioZon = c.idconcesionario
         and r.fechaaplicacion = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.estadonov = 'ACTIVADA';
  
    w_concepto := 'DEV PARTICIPACION CONTRAVENCIONAL FCM';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c40 as clavecontable,
             f.ctacon_fcm as cuenta,
             r.vfcmcontravencional as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV PARTICIPACION CONTRAVENCIONAL FCM') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c, fcm f
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionarioZon = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fechaaplicacion = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.estadonov = 'ACTIVADA';
  
    w_concepto := 'DEV PARTICIPACION IVA CONTRAVENCIONAL FCM';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c40 as clavecontable,
             f.ctacon_impuestos as cuenta,
             r.vivacontrfcm as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV PARTICIPACION IVA CONTRAVENCIONAL FCM') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c, fcm f
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionarioZon = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fechaaplicacion = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.estadonov = 'ACTIVADA';
  
    w_concepto := 'DEV CRUCE CXC A SIMIT 19%+IVA';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             fcm1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c50 as clavecontable,
             c1470909003 as cuenta,
             (round(r.vfcmcontravencional, 0) +
             round(r.vconcontravencional, 0) + round(r.vivacontrconc, 0) +
             round(r.vivacontrfcm, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV CRUCE CXC A SIMIT 19+iva') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c, fcm f
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionarioZon = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fechaaplicacion = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.estadonov = 'ACTIVADA';
  
    w_concepto := 'CRUCE CXP A SIMIT';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             fcm1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c21 as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (round(r.vfcmcontravencional, 0) +
             round(r.vconcontravencional, 0) + round(r.vivacontrconc, 0) +
             round(r.vivacontrfcm, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV CRUCE CXP A SIMIT 19+iva') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c, fcm f
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionarioZon = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fechaaplicacion = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.estadonov = 'ACTIVADA';
  
    w_concepto := 'DEV CXC A SIMIT 2.7%+1.8 + IVA';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             fcm1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c50 as clavecontable,
             c1470909002 as cuenta,
             (round(r.vsevial27, 0) + round(r.vivasevial27, 0) +
             round(r.vfcmpolca, 0) + round(r.vivafcmpolca, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV CRUCE CXC A SIMIT 2.7%+1.8%+IVA') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c, fcm f
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionarioZon = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fechaaplicacion = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.estadonov = 'ACTIVADA';
  
    w_concepto := 'DEV CXP A SIMIT 2.7%+1.8 + IVA';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             'FCM1' as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c21 as clavecontable,
             substr(f.nit_polca, 0, 9) as cuenta,
             (round(r.vsevial27, 0) + round(r.vivasevial27, 0) +
             round(r.vfcmpolca, 0) + round(r.vivafcmpolca, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV CRUCE CXP A SIMIT 2.7%+1.8%+IVA') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_polca, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c, fcm f
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionarioZon = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fechaaplicacion = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.estadonov = 'ACTIVADA';
  
    w_concepto := 'DEV GASTOS SEVIAL 2.7%+IVA';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             ze as clasedoc,
             fcm1 as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION || 'S' as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c50 as clavecontable,
             c5111110112 as cuenta,
             (round(r.vsevial27, 0) + round(r.vivasevial27, 0)) as importe,
             v5 as indicadorimpuesto,
             c100761 as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV GASTOS SEVIAL 2,7%+IVA') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c, fcm f
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionarioZon = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fechaaplicacion = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.estadonov = 'ACTIVADA';
  
    w_concepto := 'CXP SEVIAL 2.7%+IVA';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fechaaplicacion, 'ddMMyyyy') as fechadoc,
             'ZE' as clasedoc,
             'FCM1' as sociedad,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechacontable,
             to_char(r.fechaaplicacion, 'MM') as periodo,
             cop as moneda,
             R.NUMLIQUIDACION || 'S' as referencia,
             ('REC ' || to_char(r.fechaaplicacion, 'ddMMyyyy') || ' ' ||
             R.CuentaRec) as textocabezera,
             c21 as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             (round(r.vsevial27, 0) + round(r.vivasevial27, 0)) as importe,
             v5 as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV CXP SEVIAL 2,7%+IVA') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from novdevolucion r, banco b, municipio m, concesionario c, fcm f
       where r.idbancorec = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionarioZon = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fechaaplicacion = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.estadonov = 'ACTIVADA';
  
    update recaudo_externo_contabilidad r
       set r.importe = ROUND(r.importe, 0)
     where r.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
       and tipocontable = tipoCon;
  
    delete recaudo_externo_contabilidad r
     where r.importe = 0
       and r.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
       and tipocontable = tipoCon;
  
    w_concepto := 'AJUSTE PESOS';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(w_fec_cor_ini, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             cop as moneda,
             a.referencia as referencia,
             a.textocabezera as textocabezera,
             (case
               when a.importe > 0 then
                c50
               else
                c40
             end) as clavecontable,
             (case
               when a.importe > 0 then
                c4810900202
               else
                c5810900202
             end) as cuenta,
             (case
               when a.importe > 0 then
                a.importe
               else
                a.importe * -1
             end) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechavalor,
             a.asignacion AS asignacion,
             ('AJUSTE PESOS') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from fcm f,
             (select c.referencia,
                     max(c.textocabezera) as textocabezera,
                     max(c.asignacion) as asignacion,
                     sum(case c.clavecontable
                           when c40 then
                            c.importe
                           when c01 then
                            c.importe
                           when c21 then
                            c.importe
                           else
                            c.importe * -1
                         end) as importe
                from recaudo_externo_contabilidad c
               where c.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and c.sociedad = pfc1
                 and tipocontable = tipoCon
               group by c.referencia) a
       where f.nit_fcm = '8000826650'
         and a.importe <> 0;
  
    w_concepto := 'AJUSTE PESOS';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(w_fec_cor_ini, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             fcm1 as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             cop as moneda,
             a.referencia as referencia,
             a.textocabezera as textocabezera,
             (case
               when a.importe > 0 then
                c50
               else
                c40
             end) as clavecontable,
             (case
               when a.importe > 0 then
                c4810900202
               else
                c5810900202
             end) as cuenta,
             (case
               when a.importe > 0 then
                a.importe
               else
                a.importe * -1
             end) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechavalor,
             a.asignacion AS asignacion,
             ('AJUSTE PESOS') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from fcm f,
             (select c.referencia,
                     max(c.textocabezera) as textocabezera,
                     max(c.asignacion) as asignacion,
                     sum(case c.clavecontable
                           when c40 then
                            c.importe
                           when c01 then
                            c.importe
                           when c21 then
                            c.importe
                           else
                            c.importe * -1
                         end) as importe
                from recaudo_externo_contabilidad c
               where c.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and c.sociedad = fcm1
                 and tipocontable = tipoCon
               group by c.referencia) a
       where f.nit_fcm = '8000826650'
         and a.importe <> 0;
  
    commit;
  
    sp_log(p_usuario,
           'Contabiliza Devolucion',
           p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
           p_feccor_ini_dia);
  
    commit;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [contabiliza_recaudo_externo] ' || SQLERRM,
            p_error);
    
  END contabiliza_devolucion_externo;

  procedure aplicaNovedadesDevolucion(p_fecha date) is
    w_registros number;
    w_vlr_mun   number;
    w_vlr_cob   number;
  
    w_vfcm                 number;
    w_vconcesionario       number;
    w_vfondocoberturaliq   number;
    w_vfondocoberturafcm   number;
    w_vequilibrioeconomico number;
    w_vconcontravencional  number;
    w_vfcmcontravencional  number;
    w_vsevial              number;
    w_vfcmpolca            number;
    w_vpolca               number;
    w_vimpuestosfcm        number;
  
    c_vfcm                 number;
    c_vconcesionario       number;
    c_vfondocoberturaliq   number;
    c_vfondocoberturafcm   number;
    c_vequilibrioeconomico number;
    c_vconcontravencional  number;
    c_vfcmcontravencional  number;
    c_vsevial              number;
    c_vfcmpolca            number;
    c_vpolca               number;
    c_vimpuestosfcm        number;
  
    cursor cobrosPen is
      select tipoidentificacion,
             identificacion,
             nombre,
             idbanco,
             tipocuenta,
             cuenta,
             idconcesionario,
             indtipo,
             idmunicipio,
             motivo,
             vdevolucion,
             vconcesionario,
             vfcm,
             vfondocoberturafcm,
             vfondocoberturaliq,
             vequilibrioeconomico,
             vsevial,
             vfcmpolca,
             vmunicipio,
             vfcmcontravencional,
             vconcontravencional,
             tiponov,
             numeronov,
             fechanov,
             usuarionov,
             usuarioval,
             fechaval,
             fechaact,
             estadonov,
             firma1,
             firma2,
             usuarioanul,
             fechaanul,
             fechaaplicacion,
             vpolca,
             cuentarec,
             dnsgranbanco,
             dnsavvillas,
             indcobro,
             fechacobro,
             referenciatrf,
             observaciones,
             vadicional,
             fechacobro2,
             vivacontrconc,
             vivacontrfcm,
             vretecontr,
             indiva,
             indrete,
             numliquidacion,
             tipoidentificacion1,
             identificacion1,
             idbancorec,
             idconcesionariozon,
             vsevial27,
             vivasevial27,
             vivafcmpolca,
             fecpagliq,
             vtimbre,
             vretef,
             vsevialneto,
             vfcmpolcaneto,
             vfcmconneto,
             vopeconneto,
             vmunneto,
             vpolcaneto
        from novdevolucion
       where estadonov = 'ACTIVADA'
         and fechacobro is null;
  
    cursor cobrosPenCon is
      select tipoidentificacion,
             identificacion,
             nombre,
             idbanco,
             tipocuenta,
             cuenta,
             idconcesionario,
             indtipo,
             idmunicipio,
             motivo,
             vdevolucion,
             vconcesionario,
             vfcm,
             vfondocoberturafcm,
             vfondocoberturaliq,
             vequilibrioeconomico,
             vsevial,
             vfcmpolca,
             vmunicipio,
             vfcmcontravencional,
             vconcontravencional,
             tiponov,
             numeronov,
             fechanov,
             usuarionov,
             usuarioval,
             fechaval,
             fechaact,
             estadonov,
             firma1,
             firma2,
             usuarioanul,
             fechaanul,
             fechaaplicacion,
             vpolca,
             cuentarec,
             dnsgranbanco,
             dnsavvillas,
             indcobro,
             fechacobro,
             referenciatrf,
             observaciones,
             vadicional,
             fechacobro2,
             vivacontrconc,
             vivacontrfcm,
             vretecontr,
             indiva,
             indrete,
             numliquidacion,
             tipoidentificacion1,
             identificacion1,
             idbancorec,
             idconcesionariozon,
             vsevial27,
             vivasevial27,
             vivafcmpolca,
             fecpagliq,
             vtimbre,
             vretef,
             vsevialneto,
             vfcmpolcaneto,
             vfcmconneto,
             vopeconneto,
             vmunneto,
             vpolcaneto
        from novdevolucion
       where estadonov = 'ACTIVADA'
         and not fechacobro is null
         and fechaCobro2 is null;
  
  BEGIN
  
    -- adicionar pagos a usuario ya aprobados
    insert into recaudo_externo_disp_tot
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       des_idbanco,
       des_tipocuenta,
       des_cuenta,
       des_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso,
       valor,
       id_concesionario_pro,
       idmunicipio)
      select p_fecha,
             p_fecha,
             p_fecha,
             idconcesionario,
             30,
             'Pago Usuario Ide:' || identificacion || '. Novedad:' ||
             n.numeronov,
             '',
             '',
             cuentarec,
             '',
             idbanco,
             tipocuenta,
             encriptar(cuenta),
             identificacion,
             indtipo,
             99999999,
             sysdate,
             vdevolucion,
             '',
             idmunicipio
        from novdevolucion n
       where fechaact <= p_fecha
         and estadonov = 'VALIDADA'
         and fechaaplicacion is null;
  
    update novdevolucion
       set (fechaaplicacion, estadonov) =
           (select p_fecha, 'ACTIVADA' from dual)
     where estadonov = 'VALIDADA'
       and fechaact <= p_fecha
       and fechaaplicacion is null;
  
    update recaudo_externo_disp_tot
       set vlrDisp = valor
     where fec_corte_ini = p_fecha;
  
    commit;
  
    -- buscar municipios a los que se les puede cobrar
    FOR regCobro IN cobrosPen LOOP
      -- obtener valor a pagar al municipio
      select sum(valor)
        into w_vlr_mun
        from recaudo_externo_disp_tot r
       where orden = 1
         and r.idmunicipio = regCobro.Idmunicipio
         and r.ori_cuenta = regCobro.Cuentarec
         and r.id_concesionario_liq = regCobro.Idconcesionario
         and r.indtipo = regCobro.Indtipo
         and r.fec_corte_ini = p_fecha;
    
      if regCobro.Idmunicipio = '08001001' then
        select sum(valor)
          into w_vlr_mun
          from recaudo_externo_disp_tot r
         where orden = 1
           and r.idmunicipio = '08001000'
           and r.ori_cuenta = regCobro.Cuentarec
           and r.id_concesionario_liq = regCobro.Idconcesionario
           and r.indtipo = regCobro.Indtipo
           and r.concepto = 'Metrotransito Barranquilla'
           and r.fec_corte_ini = p_fecha;
      
      end if;
    
      if w_vlr_mun is null then
        w_vlr_mun := 0;
      end if;
    
      -- obtener valor de cobros realizados
      select sum(vMunNeto)
        into w_vlr_cob
        from novdevolucion n
       where estadonov = 'ACTIVADA'
         and n.fechacobro = p_fecha
         and n.idmunicipio = regCobro.Idmunicipio
         and n.cuentarec = regCobro.Cuentarec
         and n.idconcesionario = regCobro.Idconcesionario
         and n.indtipo = regCobro.Indtipo;
    
      if w_vlr_cob is null then
        w_vlr_cob := 0;
      end if;
    
      -- si el municipio tiene valores disponibles 
      if (w_vlr_mun - w_vlr_cob) >= (regCobro.vMunNeto) then
      
        -- grabar registo a restar al municipio
        insert into recaudo_externo_disp_tot
          (fec_corte_ini,
           fec_corte_fin,
           fec_dispersion,
           id_concesionario_liq,
           orden,
           concepto,
           ori_idbanco,
           ori_tipocuenta,
           ori_cuenta,
           ori_nit,
           des_idbanco,
           des_tipocuenta,
           des_cuenta,
           des_nit,
           indtipo,
           usuario_proceso,
           fecha_proceso,
           valor,
           id_concesionario_pro,
           idmunicipio)
          select p_fecha,
                 p_fecha,
                 p_fecha,
                 regCobro.Idconcesionario,
                 31,
                 'Vlr Dev ' || regCobro.Idmunicipio || ' ' || m.nombre ||
                 '. Nov:' || n.numeronov,
                 '',
                 '',
                 regCobro.Cuentarec,
                 '',
                 '',
                 '',
                 '',
                 '',
                 indtipo,
                 99999999,
                 sysdate,
                 -1 * (vMunNeto),
                 '',
                 n.idmunicipio
            from novdevolucion n, municipio m
           where numeronov = regCobro.Numeronov
             and n.idmunicipio = m.idmunicipio;
      
        update novdevolucion
           set fechacobro = p_fecha
         where numeronov = regCobro.Numeronov;
      
        if regCobro.Idmunicipio <> '08001001' then
        
          update recaudo_externo_disp_tot r
             set r.vlrdisp = r.vlrdisp - (regCobro.vMunNeto)
           where r.orden = 1
             and r.idmunicipio = regCobro.Idmunicipio
             and r.ori_cuenta = regCobro.Cuentarec
             and r.id_concesionario_liq = regCobro.Idconcesionario
             and r.indtipo = regCobro.Indtipo
             and r.fec_corte_ini = p_fecha;
        else
          update recaudo_externo_disp_tot r
             set r.vlrdisp = r.vlrdisp - (regCobro.vMunNeto)
           where r.orden = 1
             and r.idmunicipio = '08001000'
             and r.ori_cuenta = regCobro.Cuentarec
             and r.id_concesionario_liq = regCobro.Idconcesionario
             and r.indtipo = regCobro.Indtipo
             and r.concepto = 'Metrotransito Barranquilla'
             and r.fec_corte_ini = p_fecha;
        
        end if;
      
      end if;
    
    END LOOP;
  
    commit;
  
    FOR regCobro IN cobrosPenCon LOOP
      -- obtener valor a pagar al concesionario, fcm y polca
      select sum(valor)
        into w_vfcm
        from recaudo_externo_disp_tot r
       where orden = 5
         and r.ori_cuenta = regCobro.Cuentarec
         and r.id_concesionario_liq = regCobro.Idconcesionario
         and r.indtipo = regCobro.Indtipo
         and r.fec_corte_ini = p_fecha;
    
      if w_vfcm is null then
        w_vfcm := 0;
      end if;
    
      select sum(valor)
        into w_vconcesionario
        from recaudo_externo_disp_tot r
       where orden = 7
         and r.ori_cuenta = regCobro.Cuentarec
         and r.id_concesionario_liq = regCobro.Idconcesionario
         and r.indtipo = regCobro.Indtipo
         and r.fec_corte_ini = p_fecha;
    
      if w_vconcesionario is null then
        w_vconcesionario := 0;
      end if;
    
      select sum(valor)
        into w_vfondocoberturaliq
        from recaudo_externo_disp_tot r
       where orden = 8
         and r.ori_cuenta = regCobro.Cuentarec
         and r.id_concesionario_liq = regCobro.Idconcesionario
         and r.indtipo = regCobro.Indtipo
         and r.fec_corte_ini = p_fecha;
    
      if w_vfondocoberturaliq is null then
        w_vfondocoberturaliq := 0;
      end if;
    
      select sum(valor)
        into w_vfondocoberturafcm
        from recaudo_externo_disp_tot r
       where orden = 6
         and r.ori_cuenta = regCobro.Cuentarec
         and r.id_concesionario_liq = regCobro.Idconcesionario
         and r.indtipo = regCobro.Indtipo
         and r.fec_corte_ini = p_fecha;
    
      if w_vfondocoberturafcm is null then
        w_vfondocoberturafcm := 0;
      end if;
    
      select sum(valor)
        into w_vequilibrioeconomico
        from recaudo_externo_disp_tot r
       where orden = 9
         and r.ori_cuenta = regCobro.Cuentarec
         and r.id_concesionario_liq = regCobro.Idconcesionario
         and r.indtipo = regCobro.Indtipo
         and r.fec_corte_ini = p_fecha
         and r.concepto <> 'Impuestos FCM';
    
      if w_vequilibrioeconomico is null then
        w_vequilibrioeconomico := 0;
      end if;
    
      select sum(valor)
        into w_vconcontravencional
        from recaudo_externo_disp_tot r
       where orden = 13
         and r.ori_cuenta = regCobro.Cuentarec
         and r.id_concesionario_liq = regCobro.Idconcesionario
         and r.indtipo = regCobro.Indtipo
         and r.fec_corte_ini = p_fecha;
    
      if w_vconcontravencional is null then
        w_vconcontravencional := 0;
      end if;
    
      select sum(valor)
        into w_vfcmcontravencional
        from recaudo_externo_disp_tot r
       where orden = 14
         and r.ori_cuenta = regCobro.Cuentarec
         and r.id_concesionario_liq = regCobro.Idconcesionario
         and r.indtipo = regCobro.Indtipo
         and r.fec_corte_ini = p_fecha;
    
      if w_vfcmcontravencional is null then
        w_vfcmcontravencional := 0;
      end if;
    
      select sum(valor)
        into w_vsevial
        from recaudo_externo_disp_tot r
       where orden = 10
         and r.ori_cuenta = regCobro.Cuentarec
         and r.id_concesionario_liq = regCobro.Idconcesionario
         and r.indtipo = regCobro.Indtipo
         and r.fec_corte_ini = p_fecha;
    
      if w_vsevial is null then
        w_vsevial := 0;
      end if;
    
      select sum(valor)
        into w_vfcmpolca
        from recaudo_externo_disp_tot r
       where orden = 11
         and r.ori_cuenta = regCobro.Cuentarec
         and r.id_concesionario_liq = regCobro.Idconcesionario
         and r.indtipo = regCobro.Indtipo
         and r.fec_corte_ini = p_fecha;
    
      if w_vfcmpolca is null then
        w_vfcmpolca := 0;
      end if;
    
      IF regCobro.Idconcesionario = '05' THEN
        w_vequilibrioeconomico := w_vequilibrioeconomico + w_vfcmpolca;
        w_vfcmpolca            := 0;
      end if;
    
      select sum(valor)
        into w_vpolca
        from recaudo_externo_disp_tot r
       where orden = 12
         and r.ori_cuenta = regCobro.Cuentarec
         and r.id_concesionario_liq = regCobro.Idconcesionario
         and r.indtipo = regCobro.Indtipo
         and r.fec_corte_ini = p_fecha;
    
      if w_vpolca is null then
        w_vpolca := 0;
      end if;
    
      select sum(valor)
        into w_vimpuestosfcm
        from recaudo_externo_disp_tot r
       where orden = 9
         and r.ori_cuenta = regCobro.Cuentarec
         and r.id_concesionario_liq = regCobro.Idconcesionario
         and r.indtipo = regCobro.Indtipo
         and r.fec_corte_ini = p_fecha
         and r.concepto = 'Impuestos FCM';
    
      if w_vimpuestosfcm is null then
        w_vimpuestosfcm := 0;
      end if;
    
      -- obtener valor de cobros realizados
      select sum(vconcesionario)
        into c_vconcesionario
        from novdevolucion n
       where estadonov = 'ACTIVADA'
         and n.fechacobro2 = p_fecha
         and n.idmunicipio = regCobro.Idmunicipio
         and n.cuentarec = regCobro.Cuentarec
         and n.idconcesionario = regCobro.Idconcesionario
         and n.indtipo = regCobro.Indtipo;
    
      if c_vconcesionario is null then
        c_vconcesionario := 0;
      end if;
    
      select sum(vfcm)
        into c_vfcm
        from novdevolucion n
       where estadonov = 'ACTIVADA'
         and n.fechacobro2 = p_fecha
         and n.idmunicipio = regCobro.Idmunicipio
         and n.cuentarec = regCobro.Cuentarec
         and n.idconcesionario = regCobro.Idconcesionario
         and n.indtipo = regCobro.Indtipo;
    
      if c_vfcm is null then
        c_vfcm := 0;
      end if;
    
      select sum(vfondocoberturafcm)
        into c_vfondocoberturafcm
        from novdevolucion n
       where estadonov = 'ACTIVADA'
         and n.fechacobro2 = p_fecha
         and n.idmunicipio = regCobro.Idmunicipio
         and n.cuentarec = regCobro.Cuentarec
         and n.idconcesionario = regCobro.Idconcesionario
         and n.indtipo = regCobro.Indtipo;
    
      if c_vfondocoberturafcm is null then
        c_vfondocoberturafcm := 0;
      end if;
    
      select sum(vfondocoberturaliq)
        into c_vfondocoberturaliq
        from novdevolucion n
       where estadonov = 'ACTIVADA'
         and n.fechacobro = p_fecha
         and n.idmunicipio = regCobro.Idmunicipio
         and n.cuentarec = regCobro.Cuentarec
         and n.idconcesionario = regCobro.Idconcesionario
         and n.indtipo = regCobro.Indtipo;
    
      if c_vfondocoberturaliq is null then
        c_vfondocoberturaliq := 0;
      end if;
    
      select sum(vequilibrioeconomico)
        into c_vequilibrioeconomico
        from novdevolucion n
       where estadonov = 'ACTIVADA'
         and n.fechacobro2 = p_fecha
         and n.idmunicipio = regCobro.Idmunicipio
         and n.cuentarec = regCobro.Cuentarec
         and n.idconcesionario = regCobro.Idconcesionario
         and n.indtipo = regCobro.Indtipo;
    
      if c_vequilibrioeconomico is null then
        c_vequilibrioeconomico := 0;
      end if;
    
      select sum(vsevialneto)
        into c_vsevial
        from novdevolucion n
       where estadonov = 'ACTIVADA'
         and n.fechacobro2 = p_fecha
         and n.idmunicipio = regCobro.Idmunicipio
         and n.cuentarec = regCobro.Cuentarec
         and n.idconcesionario = regCobro.Idconcesionario
         and n.indtipo = regCobro.Indtipo;
    
      if c_vsevial is null then
        c_vsevial := 0;
      end if;
    
      select sum(vFcmPolcaNeto)
        into c_vfcmpolca
        from novdevolucion n
       where estadonov = 'ACTIVADA'
         and n.fechacobro2 = p_fecha
         and n.idmunicipio = regCobro.Idmunicipio
         and n.cuentarec = regCobro.Cuentarec
         and n.idconcesionario = regCobro.Idconcesionario
         and n.indtipo = regCobro.Indtipo;
    
      if c_vfcmpolca is null then
        c_vfcmpolca := 0;
      end if;
    
      if (regCobro.Idconcesionario = '05') then
        c_vequilibrioeconomico := c_vequilibrioeconomico + c_vfcmpolca;
      end if;
    
      select sum(vFcmConNeto)
        into c_vfcmcontravencional
        from novdevolucion n
       where estadonov = 'ACTIVADA'
         and n.fechacobro2 = p_fecha
         and n.idmunicipio = regCobro.Idmunicipio
         and n.cuentarec = regCobro.Cuentarec
         and n.idconcesionario = regCobro.Idconcesionario
         and n.indtipo = regCobro.Indtipo;
    
      if c_vfcmcontravencional is null then
        c_vfcmcontravencional := 0;
      end if;
    
      select sum(vOpeConNeto)
        into c_vconcontravencional
        from novdevolucion n
       where estadonov = 'ACTIVADA'
         and n.fechacobro2 = p_fecha
         and n.idmunicipio = regCobro.Idmunicipio
         and n.cuentarec = regCobro.Cuentarec
         and n.idconcesionario = regCobro.Idconcesionario
         and n.indtipo = regCobro.Indtipo;
    
      if c_vconcontravencional is null then
        c_vconcontravencional := 0;
      end if;
    
      select sum(vPolcaNeto)
        into c_vpolca
        from novdevolucion n
       where estadonov = 'ACTIVADA'
         and n.fechacobro2 = p_fecha
         and n.idmunicipio = regCobro.Idmunicipio
         and n.cuentarec = regCobro.Cuentarec
         and n.idconcesionario = regCobro.Idconcesionario
         and n.indtipo = regCobro.Indtipo;
    
      if c_vpolca is null then
        c_vpolca := 0;
      end if;
    
      select sum(vivafcmpolca + vtimbre + vretef)
        into c_vimpuestosfcm
        from novdevolucion n
       where estadonov = 'ACTIVADA'
         and n.fechacobro2 = p_fecha
         and n.idmunicipio = regCobro.Idmunicipio
         and n.cuentarec = regCobro.Cuentarec
         and n.idconcesionario = regCobro.Idconcesionario
         and n.indtipo = regCobro.Indtipo
         AND regCobro.Idconcesionario = '05';
    
      if c_vimpuestosfcm is null then
        c_vimpuestosfcm := 0;
      end if;
    
      if (w_vfcm - c_vfcm) >= regCobro.Vfcm and
         (w_vconcesionario - c_vconcesionario) >= regCobro.Vconcesionario and
         (w_vfondocoberturaliq - c_vfondocoberturaliq) >=
         regCobro.Vfondocoberturaliq and
         (w_vfondocoberturafcm - c_vfondocoberturafcm) >=
         regCobro.Vfondocoberturafcm and
         (w_vequilibrioeconomico - c_vequilibrioeconomico) >=
         regCobro.Vequilibrioeconomico and
         (w_vconcontravencional - c_vconcontravencional) >=
         regCobro.vOpeConNeto and
         (w_vfcmcontravencional - c_vfcmcontravencional) >=
         regCobro.VFcmConNeto and
         (w_vsevial - c_vsevial) >= regCobro.vSevialNeto and
         (w_vfcmpolca - c_vfcmpolca) >= regCobro.vFcmPolcaNeto and
         (w_vpolca - c_vpolca) >= regCobro.vPolcaNeto
      
       then
      
        -- grabar registo a restar al vconcesionario
        insert into recaudo_externo_disp_tot
          (fec_corte_ini,
           fec_corte_fin,
           fec_dispersion,
           id_concesionario_liq,
           orden,
           concepto,
           ori_idbanco,
           ori_tipocuenta,
           ori_cuenta,
           ori_nit,
           des_idbanco,
           des_tipocuenta,
           des_cuenta,
           des_nit,
           indtipo,
           usuario_proceso,
           fecha_proceso,
           valor,
           id_concesionario_pro,
           idmunicipio)
          select p_fecha,
                 p_fecha,
                 p_fecha,
                 regCobro.Idconcesionario,
                 32,
                 'Vlr Dev Conc ' || regCobro.Idmunicipio || ' ' || m.nombre ||
                 '.Nov:' || n.numeronov,
                 '',
                 '',
                 regCobro.Cuentarec,
                 '',
                 '',
                 '',
                 '',
                 '',
                 indtipo,
                 99999999,
                 sysdate,
                 -1 * (vconcesionario),
                 '',
                 ''
            from novdevolucion n, municipio m
           where numeronov = regCobro.Numeronov
             and n.idmunicipio = m.idmunicipio;
      
        update recaudo_externo_disp_tot r
           set r.vlrdisp = r.vlrdisp - (regCobro.vconcesionario)
         where r.orden = 7
           and r.ori_cuenta = regCobro.Cuentarec
           and r.id_concesionario_liq = regCobro.Idconcesionario
           and r.indtipo = regCobro.Indtipo
           and r.fec_corte_ini = p_fecha;
      
        -- grabar registo a restar al vfcm
        insert into recaudo_externo_disp_tot
          (fec_corte_ini,
           fec_corte_fin,
           fec_dispersion,
           id_concesionario_liq,
           orden,
           concepto,
           ori_idbanco,
           ori_tipocuenta,
           ori_cuenta,
           ori_nit,
           des_idbanco,
           des_tipocuenta,
           des_cuenta,
           des_nit,
           indtipo,
           usuario_proceso,
           fecha_proceso,
           valor,
           id_concesionario_pro,
           idmunicipio)
          select p_fecha,
                 p_fecha,
                 p_fecha,
                 regCobro.Idconcesionario,
                 33,
                 'Vlr Dev Fcm ' || regCobro.Idmunicipio || ' ' || m.nombre ||
                 '.Nov:' || n.numeronov,
                 '',
                 '',
                 regCobro.Cuentarec,
                 '',
                 '',
                 '',
                 '',
                 '',
                 indtipo,
                 99999999,
                 sysdate,
                 -1 * (vfcm),
                 '',
                 ''
            from novdevolucion n, municipio m
           where numeronov = regCobro.Numeronov
             and n.idmunicipio = m.idmunicipio;
      
        update recaudo_externo_disp_tot r
           set r.vlrdisp = r.vlrdisp - (regCobro.vfcm)
         where r.orden = 5
           and r.ori_cuenta = regCobro.Cuentarec
           and r.id_concesionario_liq = regCobro.Idconcesionario
           and r.indtipo = regCobro.Indtipo
           and r.fec_corte_ini = p_fecha;
      
        -- grabar registo a restar al vfondocoberturafcm
        insert into recaudo_externo_disp_tot
          (fec_corte_ini,
           fec_corte_fin,
           fec_dispersion,
           id_concesionario_liq,
           orden,
           concepto,
           ori_idbanco,
           ori_tipocuenta,
           ori_cuenta,
           ori_nit,
           des_idbanco,
           des_tipocuenta,
           des_cuenta,
           des_nit,
           indtipo,
           usuario_proceso,
           fecha_proceso,
           valor,
           id_concesionario_pro,
           idmunicipio)
          select p_fecha,
                 p_fecha,
                 p_fecha,
                 regCobro.Idconcesionario,
                 34,
                 'Vlr Dev Fond FCM ' || regCobro.Idmunicipio || ' ' ||
                 m.nombre || '. Nov:' || n.numeronov,
                 '',
                 '',
                 regCobro.Cuentarec,
                 '',
                 '',
                 '',
                 '',
                 '',
                 indtipo,
                 99999999,
                 sysdate,
                 -1 * (vfondocoberturafcm),
                 '',
                 ''
            from novdevolucion n, municipio m
           where numeronov = regCobro.Numeronov
             and n.idmunicipio = m.idmunicipio;
      
        update recaudo_externo_disp_tot r
           set r.vlrdisp = r.vlrdisp - (regCobro.vfondocoberturafcm)
         where r.orden = 6
           and r.ori_cuenta = regCobro.Cuentarec
           and r.id_concesionario_liq = regCobro.Idconcesionario
           and r.indtipo = regCobro.Indtipo
           and r.fec_corte_ini = p_fecha;
      
        -- grabar registo a restar al vfondocoberturaliq
        insert into recaudo_externo_disp_tot
          (fec_corte_ini,
           fec_corte_fin,
           fec_dispersion,
           id_concesionario_liq,
           orden,
           concepto,
           ori_idbanco,
           ori_tipocuenta,
           ori_cuenta,
           ori_nit,
           des_idbanco,
           des_tipocuenta,
           des_cuenta,
           des_nit,
           indtipo,
           usuario_proceso,
           fecha_proceso,
           valor,
           id_concesionario_pro,
           idmunicipio)
          select p_fecha,
                 p_fecha,
                 p_fecha,
                 regCobro.Idconcesionario,
                 35,
                 'Vlr Dev Fond Conc ' || regCobro.Idmunicipio || ' ' ||
                 m.nombre || '.Nov:' || n.numeronov,
                 '',
                 '',
                 regCobro.Cuentarec,
                 '',
                 '',
                 '',
                 '',
                 '',
                 indtipo,
                 99999999,
                 sysdate,
                 -1 * (vfondocoberturaliq),
                 '',
                 ''
            from novdevolucion n, municipio m
           where numeronov = regCobro.Numeronov
             and n.idmunicipio = m.idmunicipio;
      
        update recaudo_externo_disp_tot r
           set r.vlrdisp = r.vlrdisp - (regCobro.vfondocoberturaliq)
         where r.orden = 8
           and r.ori_cuenta = regCobro.Cuentarec
           and r.id_concesionario_liq = regCobro.Idconcesionario
           and r.indtipo = regCobro.Indtipo
           and r.fec_corte_ini = p_fecha;
      
        -- grabar registo a restar al vequilibrioeconomico
        insert into recaudo_externo_disp_tot
          (fec_corte_ini,
           fec_corte_fin,
           fec_dispersion,
           id_concesionario_liq,
           orden,
           concepto,
           ori_idbanco,
           ori_tipocuenta,
           ori_cuenta,
           ori_nit,
           des_idbanco,
           des_tipocuenta,
           des_cuenta,
           des_nit,
           indtipo,
           usuario_proceso,
           fecha_proceso,
           valor,
           id_concesionario_pro,
           idmunicipio)
          select p_fecha,
                 p_fecha,
                 p_fecha,
                 regCobro.Idconcesionario,
                 36,
                 'Vlr Dev Equil ' || regCobro.Idmunicipio || ' ' ||
                 m.nombre || '.Nov:' || n.numeronov,
                 '',
                 '',
                 regCobro.Cuentarec,
                 '',
                 '',
                 '',
                 '',
                 '',
                 indtipo,
                 99999999,
                 sysdate,
                 -1 * (vequilibrioeconomico),
                 '',
                 ''
            from novdevolucion n, municipio m
           where numeronov = regCobro.Numeronov
             and n.idmunicipio = m.idmunicipio;
      
        update recaudo_externo_disp_tot r
           set r.vlrdisp = r.vlrdisp - (regCobro.vequilibrioeconomico)
         where r.orden = 9
           and r.ori_cuenta = regCobro.Cuentarec
           and r.id_concesionario_liq = regCobro.Idconcesionario
           and r.indtipo = regCobro.Indtipo
           and r.fec_corte_ini = p_fecha
           and r.concepto <> 'Impuestos FCM';
      
        -- grabar registo a restar al VSEVIAL27+ vsevial3 + impuestos
        insert into recaudo_externo_disp_tot
          (fec_corte_ini,
           fec_corte_fin,
           fec_dispersion,
           id_concesionario_liq,
           orden,
           concepto,
           ori_idbanco,
           ori_tipocuenta,
           ori_cuenta,
           ori_nit,
           des_idbanco,
           des_tipocuenta,
           des_cuenta,
           des_nit,
           indtipo,
           usuario_proceso,
           fecha_proceso,
           valor,
           id_concesionario_pro,
           idmunicipio)
          select p_fecha,
                 p_fecha,
                 p_fecha,
                 regCobro.Idconcesionario,
                 37,
                 'Vlr Dev Polca Sevial ' || regCobro.Idmunicipio || ' ' ||
                 m.nombre || '.Nov:' || n.numeronov,
                 '',
                 '',
                 regCobro.Cuentarec,
                 '',
                 '',
                 '',
                 '',
                 '',
                 indtipo,
                 99999999,
                 sysdate,
                 -1 * n.vSevialNeto,
                 '',
                 ''
            from novdevolucion n, municipio m
           where numeronov = regCobro.Numeronov
             and n.idmunicipio = m.idmunicipio;
      
        update recaudo_externo_disp_tot r
           set r.vlrdisp = r.vlrdisp - regCobro.vSevialNeto
         where r.orden = 10
           and r.ori_cuenta = regCobro.Cuentarec
           and r.id_concesionario_liq = regCobro.Idconcesionario
           and r.indtipo = regCobro.Indtipo
           and r.fec_corte_ini = p_fecha;
      
        -- grabar registo a restar al VFCMPOLCA
        insert into recaudo_externo_disp_tot
          (fec_corte_ini,
           fec_corte_fin,
           fec_dispersion,
           id_concesionario_liq,
           orden,
           concepto,
           ori_idbanco,
           ori_tipocuenta,
           ori_cuenta,
           ori_nit,
           des_idbanco,
           des_tipocuenta,
           des_cuenta,
           des_nit,
           indtipo,
           usuario_proceso,
           fecha_proceso,
           valor,
           id_concesionario_pro,
           idmunicipio)
          select p_fecha,
                 p_fecha,
                 p_fecha,
                 regCobro.Idconcesionario,
                 38,
                 'Vlr Dev Polca FCM ' || regCobro.Idmunicipio || ' ' ||
                 m.nombre || '.Nov:' || n.numeronov,
                 '',
                 '',
                 regCobro.Cuentarec,
                 '',
                 '',
                 '',
                 '',
                 '',
                 indtipo,
                 99999999,
                 sysdate,
                 -1 * n.vFcmPolcaNeto,
                 '',
                 ''
            from novdevolucion n, municipio m
           where numeronov = regCobro.Numeronov
             and n.idmunicipio = m.idmunicipio;
      
        update recaudo_externo_disp_tot r
           set r.vlrdisp = r.vlrdisp - regCobro.vFcmPolcaNeto
         where r.orden = 11
           and r.ori_cuenta = regCobro.Cuentarec
           and r.id_concesionario_liq = regCobro.Idconcesionario
           and r.indtipo = regCobro.Indtipo
           and r.fec_corte_ini = p_fecha;
      
        -- grabar registo a restar al vFcmCon
        insert into recaudo_externo_disp_tot
          (fec_corte_ini,
           fec_corte_fin,
           fec_dispersion,
           id_concesionario_liq,
           orden,
           concepto,
           ori_idbanco,
           ori_tipocuenta,
           ori_cuenta,
           ori_nit,
           des_idbanco,
           des_tipocuenta,
           des_cuenta,
           des_nit,
           indtipo,
           usuario_proceso,
           fecha_proceso,
           valor,
           id_concesionario_pro,
           idmunicipio)
          select p_fecha,
                 p_fecha,
                 p_fecha,
                 regCobro.Idconcesionario,
                 39,
                 'Vlr Dev Contrav FCM ' || regCobro.Idmunicipio || ' ' ||
                 m.nombre || '.Nov:' || n.numeronov,
                 '',
                 '',
                 regCobro.Cuentarec,
                 '',
                 '',
                 '',
                 '',
                 '',
                 indtipo,
                 99999999,
                 sysdate,
                 -1 * n.vFcmConNeto,
                 '',
                 ''
            from novdevolucion n, municipio m
           where numeronov = regCobro.Numeronov
             and n.idmunicipio = m.idmunicipio;
      
        update recaudo_externo_disp_tot r
           set r.vlrdisp = r.vlrdisp - regCobro.vFcmConNeto
         where r.orden = 14
           and r.ori_cuenta = regCobro.Cuentarec
           and r.id_concesionario_liq = regCobro.Idconcesionario
           and r.indtipo = regCobro.Indtipo
           and r.fec_corte_ini = p_fecha;
      
        -- grabar registo a restar al municipio
        insert into recaudo_externo_disp_tot
          (fec_corte_ini,
           fec_corte_fin,
           fec_dispersion,
           id_concesionario_liq,
           orden,
           concepto,
           ori_idbanco,
           ori_tipocuenta,
           ori_cuenta,
           ori_nit,
           des_idbanco,
           des_tipocuenta,
           des_cuenta,
           des_nit,
           indtipo,
           usuario_proceso,
           fecha_proceso,
           valor,
           id_concesionario_pro,
           idmunicipio)
          select p_fecha,
                 p_fecha,
                 p_fecha,
                 regCobro.Idconcesionario,
                 40,
                 'Vlr Dev Contrav Conc ' || regCobro.Idmunicipio || ' ' ||
                 m.nombre || '.Nov:' || n.numeronov,
                 '',
                 '',
                 regCobro.Cuentarec,
                 '',
                 '',
                 '',
                 '',
                 '',
                 indtipo,
                 99999999,
                 sysdate,
                 -1 * n.vOpeConNeto,
                 '',
                 ''
            from novdevolucion n, municipio m
           where numeronov = regCobro.Numeronov
             and n.idmunicipio = m.idmunicipio;
      
        update recaudo_externo_disp_tot r
           set r.vlrdisp = r.vlrdisp - regCobro.vOpeConNeto
         where r.orden = 13
           and r.ori_cuenta = regCobro.Cuentarec
           and r.id_concesionario_liq = regCobro.Idconcesionario
           and r.indtipo = regCobro.Indtipo
           and r.fec_corte_ini = p_fecha;
      
        -- grabar registo a restar al POLCA
        insert into recaudo_externo_disp_tot
          (fec_corte_ini,
           fec_corte_fin,
           fec_dispersion,
           id_concesionario_liq,
           orden,
           concepto,
           ori_idbanco,
           ori_tipocuenta,
           ori_cuenta,
           ori_nit,
           des_idbanco,
           des_tipocuenta,
           des_cuenta,
           des_nit,
           indtipo,
           usuario_proceso,
           fecha_proceso,
           valor,
           id_concesionario_pro,
           idmunicipio)
          select p_fecha,
                 p_fecha,
                 p_fecha,
                 regCobro.Idconcesionario,
                 41,
                 'Vlr Dev POLCA ' || regCobro.Idmunicipio || ' ' ||
                 m.nombre || '.Nov:' || n.numeronov,
                 '',
                 '',
                 regCobro.Cuentarec,
                 '',
                 '',
                 '',
                 '',
                 '',
                 indtipo,
                 99999999,
                 sysdate,
                 -1 * (vPolcaNeto),
                 '',
                 ''
            from novdevolucion n, municipio m
           where numeronov = regCobro.Numeronov
             and n.idmunicipio = m.idmunicipio;
      
        update recaudo_externo_disp_tot r
           set r.vlrdisp = r.vlrdisp - (regCobro.vPolcaNeto)
         where r.orden = 12
           and r.ori_cuenta = regCobro.Cuentarec
           and r.id_concesionario_liq = regCobro.Idconcesionario
           and r.indtipo = regCobro.Indtipo
           and r.fec_corte_ini = p_fecha;
      
        -- grabar registo a restar iMPUESTOS fcm
        insert into recaudo_externo_disp_tot
          (fec_corte_ini,
           fec_corte_fin,
           fec_dispersion,
           id_concesionario_liq,
           orden,
           concepto,
           ori_idbanco,
           ori_tipocuenta,
           ori_cuenta,
           ori_nit,
           des_idbanco,
           des_tipocuenta,
           des_cuenta,
           des_nit,
           indtipo,
           usuario_proceso,
           fecha_proceso,
           valor,
           id_concesionario_pro,
           idmunicipio)
          select p_fecha,
                 p_fecha,
                 p_fecha,
                 regCobro.Idconcesionario,
                 42,
                 'Vlr Dev Impuestos FCM ' || regCobro.Idmunicipio || ' ' ||
                 m.nombre || '.Nov:' || n.numeronov,
                 '',
                 '',
                 regCobro.Cuentarec,
                 '',
                 '',
                 '',
                 '',
                 '',
                 indtipo,
                 99999999,
                 sysdate,
                 decode(n.idconcesionario,
                        '05',
                        -1 * (vivafcmpolca + vtimbre + vretef),
                        0),
                 '',
                 ''
            from novdevolucion n, municipio m
           where numeronov = regCobro.Numeronov
             and n.idmunicipio = m.idmunicipio;
      
        update recaudo_externo_disp_tot r
           set r.vlrdisp = r.vlrdisp - (regCobro.vivafcmpolca +
                           regCobro.vtimbre + regCobro.vretef)
         where r.orden = 9
           and r.ori_cuenta = regCobro.Cuentarec
           and r.id_concesionario_liq = regCobro.Idconcesionario
           and r.indtipo = regCobro.Indtipo
           and r.fec_corte_ini = p_fecha
           and r.concepto = 'Impuestos FCM';
      
        update novdevolucion
           set fechacobro2 = p_fecha
         where numeronov = regCobro.Numeronov;
      
      end if;
    
    END LOOP;
  
    commit;
  
    update recaudo_externo_disp_tot r
       set (r.ori_idbanco, r.ori_tipocuenta, r.ori_nit) =
           (select max(c.idbanco), max(c.tipocuenta), '8000826650'
              from cta_recaudo_concesionario c
             where c.cuenta = r.ori_cuenta
               and c.indtipo = r.indtipo)
     where fec_corte_ini = p_fecha
       and orden >= 30
       and orden <= 42;
  
    update recaudo_externo_disp_tot r
       set r.des_idbanco    = r.ori_idbanco,
           r.des_tipocuenta = r.ori_tipocuenta,
           r.des_cuenta     = encriptar(r.ori_cuenta),
           r.des_nit        = r.ori_nit
     where fec_corte_ini = p_fecha
       and orden >= 31
       and orden <= 42;
  
    delete recaudo_externo_disp_tot
     where fec_corte_ini = p_fecha
       and orden >= 31
       and orden <= 42
       and valor = 0;
  
    update recaudo_externo_disp_tot
       set valor = valor * -1
     where fec_corte_ini = p_fecha
       and orden >= 31
       and orden <= 42;
  
    commit;
  
  END aplicaNovedadesDevolucion;

  PROCEDURE i_archivoSoporte(p_idnovedad        varchar2,
                             p_filename         varchar2,
                             p_nombreDocumento  varchar2,
                             p_extensionArchivo varchar2,
                             p_bfile            blob,
                             p_usuario          varchar2,
                             p_error            OUT VARCHAR2) is
    p_uploadid number;
    extension  varchar2(10);
  
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_param');
  
    if not P_ERROR is null then
      return;
    end if;
  
    select seq_uploads.nextval into p_uploadid from dual;
  
    insert into soportedevolucion
      (numeronov,
       id_documento,
       nombredocumento,
       nombrearchivo,
       extensionarchivo,
       datosarchivo,
       usuariocargue,
       fechacargue)
    values
      (to_number(p_idnovedad),
       p_uploadid,
       p_nombreDocumento,
       p_filename,
       p_extensionArchivo,
       p_bfile,
       p_usuario,
       sysdate);
  
    sp_log(p_usuario, 'pk_novdev.i_archivoSoporte', p_filename);
  
    p_error := MSG_INS_OK;
  
    commit;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [pk_novdev.i_archivoSoporte] ' || SQLERRM,
            p_error);
  END i_archivoSoporte;

  PROCEDURE q_archivoSoporte(p_id_documento     number,
                             p_usuario          varchar2,
                             p_nombrearchivo    out varchar2,
                             p_nombreDocumento  out varchar2,
                             p_extensionArchivo out varchar2,
                             p_datosarchivo     out blob,
                             p_error            OUT VARCHAR2) is
  
    w_registros number;
  
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');
  
    if not P_ERROR is null then
      return;
    end if;
  
    select count(*)
      into w_registros
      from soportedevolucion
     where id_documento = p_id_documento;
  
    IF w_registros = 0 THEN
      p_error := 'Documento no existe';
      RETURN;
    END IF;
  
    select nombredocumento, nombrearchivo, extensionarchivo, datosarchivo
      into p_nombredocumento,
           p_nombrearchivo,
           p_extensionarchivo,
           p_datosarchivo
      from soportedevolucion
     where id_documento = p_id_documento;
  
    sp_log(p_usuario, 'pk_novdev.q_archivoSoporte', p_id_documento);
  
    p_error := 'Consulta OK';
  
    commit;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [pk_novdev.q_archivoSoporte] ' || SQLERRM,
            p_error);
  END q_archivoSoporte;

  PROCEDURE d_archivoSoporte(p_id_documento number,
                             p_usuario      varchar2,
                             p_error        OUT VARCHAR2) is
  
    w_registros number;
  
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');
  
    if not P_ERROR is null then
      return;
    end if;
  
    select count(*)
      into w_registros
      from soportedevolucion
     where id_documento = p_id_documento;
  
    IF w_registros = 0 THEN
      p_error := 'Documento no existe';
      RETURN;
    END IF;
  
    delete soportedevolucion where id_documento = p_id_documento;
  
    sp_log(p_usuario, 'pk_novdev.d_archivoSoporte', p_id_documento);
  
    p_error := MSG_DEL_OK;
  
    commit;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [pk_novdev.q_archivoSoporte] ' || SQLERRM,
            p_error);
  END d_archivoSoporte;

end PK_NOVDEV;
/


spool off
