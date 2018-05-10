--------------------------------------------
-- Export file for user SIMIT             --
-- Created by user on 13/12/2011, 7:18:20 --
--------------------------------------------

spool 22_novdev.log

prompt
prompt Creating table NOVDEVOLUCION
prompt ============================
prompt
drop table SIMIT.NOVDEVOLUCION;


create table SIMIT.NOVDEVOLUCION
(
  TIPOIDENTIFICACION   CHAR(1) not null,
  IDENTIFICACION       NUMBER not null,
  NOMBRE               VARCHAR2(50) not null,
  IDBANCO              CHAR(2) not null,
  TIPOCUENTA           VARCHAR2(3) not null,
  CUENTA               VARCHAR2(16) not null,
  IDCONCESIONARIO      CHAR(2) not null,
  INDTIPO              CHAR(5) not null,
  IDMUNICIPIO          CHAR(8) not null,
  MOTIVO               VARCHAR2(50) not null,
  VDEVOLUCION          NUMBER not null,
  VCONCESIONARIO       NUMBER not null,
  VFCM                 NUMBER not null,
  VFONDOCOBERTURAFCM   NUMBER not null,
  VFONDOCOBERTURALIQ   NUMBER not null,
  VEQUILIBRIOECONOMICO NUMBER not null,
  VSEVIAL              NUMBER not null,
  VFCMPOLCA            NUMBER not null,
  VMUNICIPIO           NUMBER not null,
  VFCMCONTRAVENCIONAL  NUMBER not null,
  VCONCONTRAVENCIONAL  NUMBER not null,
  TIPONOV              CHAR(2) not null,
  NUMERONOV            NUMBER not null,
  FECHANOV             DATE not null,
  USUARIONOV           NUMBER not null,
  USUARIOVAL           NUMBER,
  FECHAVAL             DATE,
  FECHAACT             DATE,
  ESTADONOV            VARCHAR2(16),
  FIRMA1               VARCHAR2(250),
  FIRMA2               VARCHAR2(250),
  USUARIOANUL          NUMBER,
  FECHAANUL            DATE,
  FECHAAPLICACION      DATE,
  VPOLCA               NUMBER,
  CUENTAREC            VARCHAR2(16),
  DNSGRANBANCO         VARCHAR2(16),
  DNSAVVILLAS          VARCHAR2(16),
  INDCOBRO             NUMBER,
  FECHACOBRO           DATE,
  REFERENCIATRF        NUMBER,
  OBSERVACIONES        VARCHAR2(250),
  VADICIONAL           NUMBER,
  FECHACOBRO2          DATE,
  VIVACONTRCONC        NUMBER,
  VIVACONTRFCM         NUMBER,
  VRETECONTR           NUMBER,
  INDIVA               CHAR(1),
  INDRETE              CHAR(1),
  NUMLIQUIDACION       VARCHAR2(10),
  TIPOIDENTIFICACION1  CHAR(1),
  IDENTIFICACION1      NUMBER,
  IDBANCOREC           CHAR(2),
  IDCONCESIONARIOZON   CHAR(2),
  VSEVIAL27            NUMBER,
  VIVASEVIAL27         NUMBER,
  VIVAFCMPOLCA         NUMBER
)
;
comment on column SIMIT.NOVDEVOLUCION.VCONCESIONARIO
  is 'Valor en polca 3.25';
comment on column SIMIT.NOVDEVOLUCION.VFCM
  is 'Valos en polca 1.25 + 2 = 3.25';
comment on column SIMIT.NOVDEVOLUCION.VFONDOCOBERTURAFCM
  is 'Valor en polca 0.25';
comment on column SIMIT.NOVDEVOLUCION.VFONDOCOBERTURALIQ
  is 'Valor en polca 0.25';
comment on column SIMIT.NOVDEVOLUCION.VEQUILIBRIOECONOMICO
  is 'Valor en polca  simit capital 1.77 + 2 = 3.77';
comment on column SIMIT.NOVDEVOLUCION.VSEVIAL
  is 'Valor sevial 3';
comment on column SIMIT.NOVDEVOLUCION.VFCMPOLCA
  is 'Valor 1.8';
comment on column SIMIT.NOVDEVOLUCION.VMUNICIPIO
  is 'Valor municipio descontado los valores contravencionales, sin incluir impuestos';
comment on column SIMIT.NOVDEVOLUCION.VFCMCONTRAVENCIONAL
  is 'Valor 9.5';
comment on column SIMIT.NOVDEVOLUCION.VCONCONTRAVENCIONAL
  is 'Valor 9.5';
comment on column SIMIT.NOVDEVOLUCION.VPOLCA
  is 'Valor 40.5';
comment on column SIMIT.NOVDEVOLUCION.VIVACONTRCONC
  is 'Iva del 9.5';
comment on column SIMIT.NOVDEVOLUCION.VIVACONTRFCM
  is 'Iva del 9.5';
comment on column SIMIT.NOVDEVOLUCION.VSEVIAL27
  is 'Valor sevial 2.7';
comment on column SIMIT.NOVDEVOLUCION.VIVASEVIAL27
  is 'Iva del 2.7';
comment on column SIMIT.NOVDEVOLUCION.VIVAFCMPOLCA
  is 'Iva del 1.8';
alter table SIMIT.NOVDEVOLUCION
  add constraint PK_NOVDEVOLUCION primary key (TIPONOV, NUMERONOV);
alter table SIMIT.NOVDEVOLUCION
  add constraint FK_NOVDEVBANCO foreign key (IDBANCO)
  references SIMIT.BANCO (IDBANCO);
alter table SIMIT.NOVDEVOLUCION
  add constraint FK_NOVDEVCONCES foreign key (IDCONCESIONARIO)
  references SIMIT.CONCESIONARIO (IDCONCESIONARIO);
alter table SIMIT.NOVDEVOLUCION
  add constraint FK_NOVDEVMUNICIPIO foreign key (IDMUNICIPIO)
  references SIMIT.MUNICIPIO (IDMUNICIPIO);
alter table SIMIT.NOVDEVOLUCION
  add constraint CH_NOVDEVTIPCOM
  check (indtipo in ('SIMIT', 'POLCA'));
alter table SIMIT.NOVDEVOLUCION
  add constraint CH_NOVDEVTIPCTA
  check (tipocuenta IN ('AHO','CTE'));

prompt
prompt Creating package PK_NOVDEV
prompt ==========================
prompt
create or replace package simit.PK_NOVDEV is

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
                            V_FECHA_ACT_ANO        NUMBER,
                            V_FECHA_ACT_MES        NUMBER,
                            V_FECHA_ACT_DIA        NUMBER,
                            
                            V_NUMLIQ VARCHAR2,
                            
                            V_TIPOIDENTIFICACION1 VARCHAR2,
                            V_IDENTIFICACION1     NUMBER,
                            
                            V_USUARIO VARCHAR2,
                            V_ERROR   OUT VARCHAR2,
                            V_NOVEDAD OUT VARCHAR2
                            
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
                               V_ERROR                OUT VARCHAR2);

  PROCEDURE contabiliza_devolucion_externo(p_feccor_ini_ano number,
                                           p_feccor_ini_mes number,
                                           p_feccor_ini_dia number,
                                           p_usuario        varchar2,
                                           p_error          OUT VARCHAR2);

end PK_NOVDEV;
/

prompt
prompt Creating package body PK_NOVDEV
prompt ===============================
prompt
create or replace package body simit.PK_NOVDEV is
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
                            V_FECHA_ACT_ANO        NUMBER,
                            V_FECHA_ACT_MES        NUMBER,
                            V_FECHA_ACT_DIA        NUMBER,
                            
                            V_NUMLIQ VARCHAR2,
                            
                            V_TIPOIDENTIFICACION1 VARCHAR2,
                            V_IDENTIFICACION1     NUMBER,
                            
                            V_USUARIO VARCHAR2,
                            V_ERROR   OUT VARCHAR2,
                            V_NOVEDAD OUT VARCHAR2
                            
                            ) AS
  
    w_fecha_act       date;
    numNovedad        number;
    m_dias_activacion number;
    min_fecha_act     date;
    correo_usuario    varchar(100);
    correo_fcm        varchar(100);
  
    w_iva              number;
    w_retencion_fuente number;
  
    v_vIvaContrConc number;
    v_vIvaContrFcm  number;
    v_retecontr     number;
    v_vIvasevial27  number;
    v_vIvaFcmPolca  number;
  
    v_vReteContr number;
  
    v_idbancoRec         char(2);
    v_idConcesionarioZon char(2);
  
    numReg number;
  
  BEGIN
  
    select count(*) into numReg from fcm where nit_fcm = '8000826650';
  
    if (numReg = 0) then
      V_ERROR := 'Se deben crear paramatros fcm';
      return;
    
    end if;
  
    select iva, retencion_fuente
      into w_iva, w_retencion_fuente
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
      return;
    end if;
  
    if w_fecha_act < sysdate then
      V_ERROR := 'Fecha Activación debe ser superior a la del sistema';
      return;
    end if;
  
    select seq_novedad.Nextval into numNovedad from dual;
  
    v_vIvaContrConc := 0;
    v_vIvaContrFcm  := 0;
    v_vRetecontr    := 0;
    v_vIvasevial27  := 0;
    v_vIvaFcmPolca  := 0;
  
    if V_INDIVA = 'S' then
      v_vIvaContrConc := round(v_vconcontravencional * w_iva / 100, 0);
      v_vIvaContrFcm  := round(v_vfcmcontravencional * w_iva / 100, 0);
      v_vIvasevial27  := round(V_VSEVIAL27 * w_iva / 100, 0);
      v_vIvaFcmPolca  := round(V_VFCMPOLCA * w_iva / 100, 0);
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
       idConcesionarioZon)
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
       v_idConcesionarioZon);
  
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
                               V_ERROR                OUT VARCHAR2) is
  
    V_VALORBASE NUMBER;
    V_NUMREG    NUMBER;
  
    V_VPOLCABASE    NUMBER;
    V_VFCMPOLCABASE NUMBER;
    V_VSEVIALBASE   NUMBER;
  
  begin
  
    v_error := 'OK';
  
    if (V_INDTIPO = 'SIMIT') then
    
      V_VALORBASE            := ROUND((V_VDEVOLUCION - V_ADICIONAL) * 10 / 100,
                                      2);
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
    
      V_VALORBASE            := ROUND((V_VDEVOLUCION - V_ADICIONAL) * 10 / 100,
                                      2);
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
        V_VFCMPOLCA            := 0.0;
        V_VSEVIAL3             := ROUND(V_VALORBASE * 3.0 / 10, 2);
      
        V_VEQUILIBRIOECONOMICO := V_VALORBASE - V_VCONCESIONARIO -
                                  V_VSEVIAL3;
      
      END IF;
    
      IF (ABS(V_VFONDOCOBERTURAFCM - V_VFONDOCOBERTURALIQ) = 0.02) THEN
        V_VFONDOCOBERTURAFCM := V_VFONDOCOBERTURAFCM - 0.01;
        V_VFONDOCOBERTURALIQ := V_VFONDOCOBERTURALIQ + 0.01;
      END IF;
    
      V_VPOLCABASE := ROUND((V_VDEVOLUCION - V_ADICIONAL -
                            ROUND((V_VDEVOLUCION - V_ADICIONAL) * 0.1, 2)) / 2,
                            2);
    
      V_VPOLCA    := ROUND(V_VPOLCABASE * 40.5 / 45, 2);
      V_VFCMPOLCA := ROUND(V_VPOLCABASE * 1.8 / 45, 2);
      V_VSEVIAL27 := ROUND(V_VPOLCABASE * 2.7 / 45, 2);
    
      V_VSEVIAL27 := V_VPOLCABASE - V_VPOLCA - V_VFCMPOLCA;
    
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
  
    c1470900601 char(10);
    c2905901005 char(10);
    c2905901009 char(10);
    c1470909003 char(10);
    cYYYYYYYYYY char(10);
  
  BEGIN
    zt := 'ZT';
    ze := 'ZE';
  
    pfc1 := 'PFC1';
    fcm1 := 'FCM1';
    cop  := 'COP';
  
    c50 := '50';
    c40 := '40';
    c31 := '31';
    c01 := '01';
    c11 := '11';
    c21 := '21';
  
    v5 := 'V5';
  
    c20111 := '20111';
    c20112 := '20112';
    c20113 := '20113';
    c20114 := '20114';
  
    c20211 := '20211';
    c20212 := '20212';
    c20213 := '20213';
    c20214 := '20214';
  
    c20121 := '20121';
    c20122 := '20122';
    c20123 := '20123';
    c20124 := '20124';
  
    c20221  := '20221';
    c20222  := '20222';
    c20223  := '20223';
    c20224  := '20224';
    c200101 := '200101';
    c200102 := '200102';
    c202213 := '202213';
    c201213 := '201213';
  
    c100761 := '100761';
  
    cZ000 := 'Z000';
    cZ002 := 'Z002';
    cZ005 := 'Z005';
  
    c1401020102 := '1401020102';
    c8000826650 := '8000826650';
  
    c5810900202 := '5810900202';
    c4810900202 := '4810900202';
  
    c2905901001 := '2905901001';
    c2905901002 := '2905901002';
    c2905901003 := '2905901003';
    c2905901004 := '2905901004';
    c1470909002 := '1470909002';
    c5111110112 := '5111110112';
  
    c1470900601 := '1470900601';
    c2905901005 := '2905901005';
    c2905901009 := '2905901009';
    c1470909003 := '1470909003';
    cYYYYYYYYYY := 'YYYYYYYYYY';
  
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
             b.cuentacontable as cuenta,
             r.vconcesionario as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             c20111 || substr(r.idconcesionario, 2, 1) as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.idmunicipio AS asignacion,
             ('DEV REC ING PART CONCES ' || c.nombre) AS textocabezera2,
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
             b.cuentacontable as cuenta,
             r.vfondocoberturaliq as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             c20112 || substr(r.idconcesionario, 2, 1) as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV REC ING FONDO COB ' || c.nombre) AS textocabezera2,
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
             b.cuentacontable as cuenta,
             r.vequilibrioeconomico as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             c20113 || substr(r.idconcesionario, 2, 1) as centrobeneficio,
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
             b.cuentacontable as cuenta,
             r.vfcm as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             c20113 || substr(r.idconcesionario, 2, 1) as centrobeneficio,
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
             b.cuentacontable as cuenta,
             r.vfondocoberturafcm as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             c20114 || substr(r.idconcesionario, 2, 1) as centrobeneficio,
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
             c.cta_contable_liquidacion as cuenta,
             r.vconcesionario as importe,
             '' as indicadorimpuesto,
             c200102 as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV REC GASTO PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(C.NIT_C, 0, 9) as nittercero,
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
             C.CTA_CONTABLE_FONDO as cuenta,
             r.vfondocoberturaliq as importe,
             '' as indicadorimpuesto,
             c200102 as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DEV REC GASTO FONDO COB ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(C.NIT_C, 0, 9) as nittercero,
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
             f.ctacon_fcm as cuenta,
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
             f.ctacon_impuestos as cuenta,
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
               b.cuentacontable as cuenta,
               r.vconcesionario as importe,
               '' as indicadorimpuesto,
               '' as centrocosto,
               c20121 || substr(r.idconcesionario, 2, 1) as centrobeneficio,
               to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
               R.IDMUNICIPIO AS asignacion,
               ('DEV REC ING PART CONCES ' || c.nombre) AS textocabezera2,
               'SIMIT' AS segmento,
               substr(m.nit_m, 0, 9) as nittercero,
               '' as cuentadivergente,
               '' as fechabase,
               '' as condicionpago,
               '' as receptoralternativo,
               sysdate as fechageneracion,
               to_number(p_usuario) as idperson,
               tipoCon as tipocontable
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c
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
               b.cuentacontable as cuenta,
               r.vfondocoberturaliq as importe,
               '' as indicadorimpuesto,
               '' as centrocosto,
               c20122 || substr(r.idconcesionario, 2, 1) as centrobeneficio,
               to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
               R.IDMUNICIPIO AS asignacion,
               ('DEV REC ING FONDO COB ' || c.nombre) AS textocabezera2,
               'SIMIT' AS segmento,
               substr(m.nit_m, 0, 9) as nittercero,
               '' as cuentadivergente,
               '' as fechabase,
               '' as condicionpago,
               '' as receptoralternativo,
               sysdate as fechageneracion,
               to_number(p_usuario) as idperson,
               tipoCon as tipocontable
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c
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
               b.cuentacontable as cuenta,
               r.vequilibrioeconomico as importe,
               '' as indicadorimpuesto,
               '' as centrocosto,
               c20123 || substr(r.idconcesionario, 2, 1) as centrobeneficio,
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
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c
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
               b.cuentacontable as cuenta,
               r.vfcm as importe,
               '' as indicadorimpuesto,
               '' as centrocosto,
               c20123 || substr(r.idconcesionario, 2, 1) as centrobeneficio,
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
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c
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
               b.cuentacontable as cuenta,
               r.vfondocoberturafcm as importe,
               '' as indicadorimpuesto,
               '' as centrocosto,
               c20124 || substr(r.idconcesionario, 2, 1) as centrobeneficio,
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
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c
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
               b.cuentacontable as cuenta,
               r.vsevial as importe,
               '' as indicadorimpuesto,
               '' as centrocosto,
               c201213 as centrobeneficio,
               to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
               R.IDMUNICIPIO AS asignacion,
               ('DEV REC ING PART CONCES SEVIAL 3.0%') AS textocabezera2,
               'SIMIT' AS segmento,
               substr(m.nit_m, 0, 9) as nittercero,
               '' as cuentadivergente,
               '' as fechabase,
               '' as condicionpago,
               '' as receptoralternativo,
               sysdate as fechageneracion,
               to_number(p_usuario) as idperson,
               tipoCon as tipocontable
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c
         where r.idbancorec = b.idbanco
           and r.idmunicipio = m.idmunicipio
           and r.idconcesionario = c.idconcesionario
           and r.fechaaplicacion = w_fec_cor_ini
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
                ('DEV-CXP USUARIO ' || to_char(identificacion,'0000000000000') || ' ' || to_char(numeronov,'0000000000') ) AS textocabezera2,
                'SIMIT' AS segmento,
                substr(m.nit_m, 0, 9) as nittercero,
                '' as cuentadivergente,
                '' as fechabase,
                '' as condicionpago,
                '' as receptoralternativo,
                sysdate as fechageneracion,
                to_number(p_usuario) as idperson,
                tipoCon as tipocontable
           from novdevolucion r,
                banco                          b,
                municipio                      m,
                concesionario                  c,
                cta_recaudo_concesionario      cr
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
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c,
               fcm                            f
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
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c
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
               c.cta_contable_liquidacion as cuenta,
               r.vconcesionario as importe,
               '' as indicadorimpuesto,
               c200102 as centrocosto,
               '' as centrobeneficio,
               to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
               R.IDMUNICIPIO AS asignacion,
               ('DEV REC GASTO PART CONCES ' || c.nombre) AS textocabezera2,
               'SIMIT' AS segmento,
               substr(C.NIT_C, 0, 9) as nittercero,
               '' as cuentadivergente,
               '' as fechabase,
               '' as condicionpago,
               '' as receptoralternativo,
               sysdate as fechageneracion,
               to_number(p_usuario) as idperson,
               tipoCon as tipocontable
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c
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
               c.cta_contable_liquidacion as cuenta,
               r.vsevial as importe,
               '' as indicadorimpuesto,
               c200102 as centrocosto,
               '' as centrobeneficio,
               to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
               R.IDMUNICIPIO AS asignacion,
               ('DEV REC GASTO PART CONCES SEVIAL 3%') AS textocabezera2,
               'SIMIT' AS segmento,
               substr(f.nit_sevial, 0, 9) as nittercero,
               '' as cuentadivergente,
               '' as fechabase,
               '' as condicionpago,
               '' as receptoralternativo,
               sysdate as fechageneracion,
               to_number(p_usuario) as idperson,
               tipoCon as tipocontable
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c,
               fcm                            f
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
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c,
               fcm                            f
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
               C.CTA_CONTABLE_FONDO as cuenta,
               r.vfondocoberturaliq as importe,
               '' as indicadorimpuesto,
               c200102 as centrocosto,
               '' as centrobeneficio,
               to_char(r.fechaaplicacion, 'ddMMyyyy') as fechavalor,
               R.IDMUNICIPIO AS asignacion,
               ('DEV REC GASTO FONDO COB ' || c.nombre) AS textocabezera2,
               'SIMIT' AS segmento,
               substr(C.NIT_C, 0, 9) as nittercero,
               '' as cuentadivergente,
               '' as fechabase,
               '' as condicionpago,
               '' as receptoralternativo,
               sysdate as fechageneracion,
               to_number(p_usuario) as idperson,
               tipoCon as tipocontable
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c
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
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c
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
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c,
               fcm                            f
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
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c,
               fcm                            f
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
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c,
               fcm                            f
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
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c,
               fcm                            f
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
               ROUND(r.vfondocoberturafcm, 0) + round(r.vfondocoberturaliq, 0) +
               ROUND(r.vequilibrioeconomico, 0) + round(r.vsevial, 0) 
               ) as importe,
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
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c
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
               ROUND(r.vfondocoberturafcm, 0) + round(r.vfondocoberturaliq, 0) +
               ROUND(r.vequilibrioeconomico, 0) + round(r.vsevial, 0) 
               ) as importe,
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
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c
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
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c
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
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c
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
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c,
               fcm                            f
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
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c,
               fcm                            f
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
               1470909003 as cuenta,
               (round(r.vfcmcontravencional,0) + round(r.vconcontravencional,0) + round(r.vivacontrconc,0) + round(r.vivacontrfcm,0)) as importe,
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
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c,
               fcm                            f
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
               (round(r.vfcmcontravencional,0) + round(r.vconcontravencional,0) + round(r.vivacontrconc,0) + round(r.vivacontrfcm,0)) as importe,
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
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c,
               fcm                            f
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
               ( round(r.vsevial27,0) + round(r.vivasevial27,0) + round(r.vfcmpolca,0) + round(r.vivafcmpolca,0) ) as importe,
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
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c,
               fcm                            f
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
               ( round(r.vsevial27,0) + round(r.vivasevial27,0) + round(r.vfcmpolca,0) + round(r.vivafcmpolca,0) ) as importe,
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
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c,
               fcm                            f
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
               ( round(r.vsevial27,0) + round(r.vivasevial27,0) ) as importe,
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
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c,
               fcm                            f
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
              ( round(r.vsevial27,0) + round(r.vivasevial27,0) ) as importe,
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
          from novdevolucion r,
               banco                          b,
               municipio                      m,
               concesionario                  c,
               fcm                            f
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

end PK_NOVDEV;
/


spool off
