---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 11/11/2011, 18:10:57 --
---------------------------------------------

spool 19_pkdevol.log

prompt
prompt Creating table NOVDEVOLUCION
prompt ============================
prompt

-- Add/modify columns 
alter table CONCESIONARIO add CTA_CONT_PERIOD_ANTFCM VARCHAR2(16);
-- Add comments to the columns 
comment on column CONCESIONARIO.CTA_CONT_PERIOD_ANTFCM
  is 'Cuenta contable para identificacionde periodos anteriores fcm';

update CONCESIONARIO  
set CTA_CONT_PERIOD_ANTFCM = '5815930101';

commit;


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
  IDENTIFICACION1      NUMBER
)
;
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
                            V_DNS                  VARCHAR2,
                            V_MOTIVO               VARCHAR2,
                            
                            V_VDEVOLUCION          NUMBER,
                            V_VADICIONAL           NUMBER,
                            V_INDIVA               VARCHAR2,
                            V_INDRETE              VARCHAR2,
                         
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
                            
                            V_NUMLIQ               VARCHAR2,
                            
                            V_TIPOIDENTIFICACION1   VARCHAR2,
                            V_IDENTIFICACION1       NUMBER,
                        
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
                            V_VSEVIAL              OUT NUMBER,
                            V_VMUNICIPIO           OUT NUMBER,
                            V_VFCMCONTRAVENCIONAL  OUT NUMBER,
                            V_VCONCONTRAVENCIONAL  OUT NUMBER,
                            V_ERROR                OUT VARCHAR2);

end PK_NOVDEV;
/

prompt
prompt Creating package PK_RECLOC
prompt ==========================
prompt
create or replace package simit.PK_RECLOC is

  PROCEDURE q_concesFunc(p_usuario          varchar2,
                         p_idConcesionario  out varchar2,
                         p_nomConcesionario out varchar2,
                         p_error            out varchar2);

  PROCEDURE u_deposito(p_usuario          varchar2,
                       p_numSecuenciaReg  number,
                       p_indtipoiden      varchar2,
                       p_idmunicipioiden  varchar2,
                       p_p_consignadoiden number,
                       p_observaciones    varchar2,
                       p_error            out varchar2);

  PROCEDURE aprobar_reproceso(p_fec_ini_ano number,
                              p_fec_ini_mes number,
                              p_fec_ini_dia number,
                              p_fec_fin_ano number,
                              p_fec_fin_mes number,
                              p_fec_fin_dia number,
                              
                              p_tipo    varchar2,
                              p_motivo  varchar2,
                              p_banco   varchar2,
                              p_usuario varchar2,
                              p_error   OUT VARCHAR2);

  PROCEDURE transferir_recaudo_local(p_fec_ini_ano number,
                                     p_fec_ini_mes number,
                                     p_fec_ini_dia number,
                                     p_usuario     varchar2,
                                     p_error       OUT VARCHAR2);

PROCEDURE contabiliza_recaudo_local    (p_feccor_ini_ano number,
                                        p_feccor_ini_mes number,
                                        p_feccor_ini_dia number,
                                        p_feccor_fin_ano number,
                                        p_feccor_fin_mes number,
                                        p_feccor_fin_dia number,
                                        p_banco varchar2,
                                        p_usuario        varchar2,
                                        p_error          OUT VARCHAR2);
                                        
PROCEDURE contabiliza_trf_siniden      (p_feccor_ini_ano number,
                                        p_feccor_ini_mes number,
                                        p_feccor_ini_dia number,
                                        p_feccor_fin_ano number,
                                        p_feccor_fin_mes number,
                                        p_feccor_fin_dia number,
                                        p_usuario        varchar2,
                                        p_error          OUT VARCHAR2);
                                        
PROCEDURE contabiliza_pago_local(p_feccor_ini_ano number,
                                     p_feccor_ini_mes number,
                                     p_feccor_ini_dia number,
                                     p_usuario        varchar2,
                                     p_error          OUT VARCHAR2);                                        
                                        
                                        
end PK_RECLOC;
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
                            V_DNS                  VARCHAR2,
                            V_MOTIVO               VARCHAR2,
                            
                            V_VDEVOLUCION          NUMBER,
                            V_VADICIONAL           NUMBER,
                            V_INDIVA               VARCHAR2,
                            V_INDRETE              VARCHAR2,
                         
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
                            
                            V_NUMLIQ               VARCHAR2,
                            
                            V_TIPOIDENTIFICACION1   VARCHAR2,
                            V_IDENTIFICACION1       NUMBER,
                        
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
    
    w_iva number;
    w_retencion_fuente number;
      

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(V_USUARIO, V_ERROR, 'pk_proc');

    select iva, retencion_fuente
    into w_iva, w_retencion_fuente
    from fcm
    where nit_fcm = '8000826650';
    
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
       vadicional,
       vivacontrconc,
       vivacontrfcm,
       vretecontr,
       indiva,
       indrete,
       dnsavvillas,
       tipoidentificacion1,
       identificacion1,
       numLiquidacion
       )
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
       v_vadicional,
       0,
       0,
       0,
       v_indiva,
       v_indrete,
       V_DNS,
       v_tipoidentificacion1,
       v_identificacion1,
       V_NUMLIQ
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

prompt
prompt Creating package body PK_RECLOC
prompt ===============================
prompt
create or replace package body simit.PK_RECLOC is

  PROCEDURE q_concesFunc(p_usuario          varchar2,
                         p_idConcesionario  out varchar2,
                         p_nomConcesionario out varchar2,
                         p_error            out varchar2) is
    num_reg number;
  begin
  
    p_idCOncesionario  := '00';
    p_nomConcesionario := '';
  
    select count(*)
      into num_reg
      from person
     where idperson = to_number(p_usuario);
  
    if (num_reg = 0) then
      p_idCOncesionario  := '00';
      p_nomConcesionario := 'FUNCIONARIO EXISTE';
      return;
    end if;
  
    select count(*)
      into num_reg
      from funcionarios_concesionario
     where idperson = to_number(p_usuario);
  
    if (num_reg = 0) then
      p_idCOncesionario  := '00';
      p_nomConcesionario := 'FUNCIONARIO NO CONCESIONARIO';
      return;
    end if;
  
    select idConcesionario
      into p_idCOncesionario
      from funcionarios_concesionario
     where idperson = to_number(p_usuario);
  
    select count(*)
      into num_reg
      from concesionario
     where idconcesionario = p_idCOncesionario;
  
    if (num_reg = 0) then
      p_idCOncesionario  := '00';
      p_nomConcesionario := 'CONCESIONARIO FUNCIONARIO NO EXISTE';
      return;
    end if;
  
    select nombre
      into p_nomConcesionario
      from concesionario
     where idconcesionario = p_idCOncesionario;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [q_concesFunc] ' || SQLERRM, p_error);
  END q_concesFunc;

  PROCEDURE u_deposito(p_usuario          varchar2,
                       p_numSecuenciaReg  number,
                       p_indtipoiden      varchar2,
                       p_idmunicipioiden  varchar2,
                       p_p_consignadoiden number,
                       p_observaciones    varchar2,
                       p_error            out varchar2) is
    num_reg number;
  begin
  
    select count(*)
      into num_reg
      from trxsinidentificar
     where numSecuenciaReg = p_numSecuenciaReg;
  
    if (num_reg = 0) then
      p_error := 'No existe registro ' || to_char(p_numSecuenciaReg);
      return;
    end if;
  
    update trxsinidentificar
       set fechaidentificacion   = sysdate,
           usuarioidentificacion = to_number(p_usuario),
           indtipoiden           = p_indtipoiden,
           idmunicipioiden       = p_idmunicipioiden,
           p_consignadoiden      = p_p_consignadoiden,
           observaciones         = p_observaciones,
           estadoiden            = 'ID'
     where numsecuenciareg = p_numsecuenciareg;
  
    commit;
  
    p_error := PK_PROC.MSG_UPD_OK;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [u_deposito] ' || SQLERRM, p_error);
  END u_deposito;

  PROCEDURE aprobar_reproceso(p_fec_ini_ano number,
                              p_fec_ini_mes number,
                              p_fec_ini_dia number,
                              p_fec_fin_ano number,
                              p_fec_fin_mes number,
                              p_fec_fin_dia number,
                              
                              p_tipo    varchar2,
                              p_motivo  varchar2,
                              p_banco   varchar2,
                              p_usuario varchar2,
                              
                              p_error OUT VARCHAR2) as
  
    w_fec_cor_ini date;
    w_fec_cor_fin date;
    w_registros   number;
    descTipo      varchar2(250);
  
  begin
  
    select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                   p_fec_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_ini
      from DUAL;
  
    select TO_DATE(p_fec_fin_ano || '-' || p_fec_fin_mes || '-' ||
                   p_fec_fin_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_fin
      from DUAL;
  
    descTipo := '';
  
    if p_tipo = 'L' then
      begin
      
        descTipo := 'REPROCESO DISTRIBUCION RECAUDO LOCAL';
      
        delete recaudo_local_causacion
         where fec_corte_ini >= w_fec_cor_ini
           and fec_corte_ini <= w_fec_cor_fin
           and decode(ori_idbanco, '52', '52', '99') = p_banco;
      
        delete recaudo_local_disp
         where fec_corte_ini = w_fec_cor_ini
           and fec_corte_fin = w_fec_cor_fin
           and decode(ori_idbanco, '52', '52', '99') = p_banco;
      
        delete recaudo_local_liquidacion
         where fec_corte >= w_fec_cor_ini
           and fec_corte <= w_fec_cor_fin
           and decode(idbanco, '52', '52', '99') = p_banco;
      
        update trxsinidentificar
           set fechaliq = null
         where estadoiden = 'ID'
           and fechaliq >= w_fec_cor_ini
           and fechaliq <= w_fec_cor_fin
           and decode(idbanco, '52', '52', '99') = p_banco;
      
      end;
    
    end if;
  
    if p_tipo = 'T' then
      begin
      
        descTipo := 'REPROCESO TRANSFERIR RECAUDO LOCAL';
      
        DELETE from recaudo_local_disp_tot
         where fec_dispersion = w_fec_cor_ini;
      
      end;
    
    end if;
  
    insert into reproceso
      (fechareg, fecha, tipo, usuario, motivo)
    values
      (sysdate, w_fec_cor_ini, p_tipo, p_usuario, p_motivo);
  
    commit;
  
    sp_envioNotificacion(grupoRecibe => 3,
                         grupoCopia  => 2,
                         asunto      => 'SDF - Notificacion ' || descTipo ||
                                        ' del dia ' ||
                                        to_char(w_fec_cor_ini, 'yyyy-MM-dd') ||
                                        ' al dia ' ||
                                        to_char(w_fec_cor_fin, 'yyyy-MM-dd'),
                         mensaje     => 'El sistema SDF informa que autorizo el ' ||
                                        descTipo || ' del dia ' ||
                                        to_char(w_fec_cor_ini, 'yyyy-MM-dd') ||
                                        ' al dia ' ||
                                        to_char(w_fec_cor_fin, 'yyyy-MM-dd') ||
                                        '. Por el siguiente motivo ' ||
                                        p_motivo,
                         p_usuario   => p_usuario);
  
    p_error := 'Aprobacion Correcta : ' || p_fec_ini_ano || '-' ||
               p_fec_ini_mes || '-' || p_fec_ini_dia || 'a ' ||
               p_fec_fin_ano || '-' || p_fec_fin_mes || '-' ||
               p_fec_fin_dia;
  
    sp_log(p_usuario,
           'aprobar_reproceso',
           p_tipo || '-' || p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
           p_fec_ini_dia || ' a ' || p_fec_fin_ano || '-' || p_fec_fin_mes || '-' ||
           p_fec_fin_dia);
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [aprobar_reproceso] ' || SQLERRM,
            p_error);
    
  end aprobar_reproceso;

  PROCEDURE transferir_recaudo_local(p_fec_ini_ano number,
                                     p_fec_ini_mes number,
                                     p_fec_ini_dia number,
                                     p_usuario     varchar2,
                                     p_error       OUT VARCHAR2) as
  
    w_fec_trf_ini date;
    w_registros   number;
    p_ajuste      number;
  
  begin
    -- VALIDACIONES
  
    select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                   p_fec_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_trf_ini
      from DUAL;
  
    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_local_disp_tot
     where fec_dispersion = w_fec_trf_ini;
  
    IF w_registros > 0 THEN
      p_error := 'PROCESO NO EJECUTADO. PROCESO YA TRANSFERIDO. SOLICITAR AUTORIZACION';
      RETURN;
    END IF;
  
    insert into recaudo_local_disp_tot
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
       valor)
      select w_fec_trf_ini,
             w_fec_trf_ini,
             w_fec_trf_ini,
             idconcesionario,
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
             sum(valor)
        from recaudo_local_disp
       where fec_dispersion = w_fec_trf_ini
       group by fec_dispersion,
                idconcesionario,
                orden, 
                concepto,
                ori_idbanco,
                ori_tipocuenta,
                ori_cuenta,
                ori_nit,
                des_idbanco,
                des_tipocuenta,
                des_cuenta,
                des_nit;
  
    update recaudo_local_disp_tot
       set referenciatrf = seq_transferencia.nextval
     where fec_corte_ini = w_fec_trf_ini;
  
    update recaudo_local_disp_tot
       set enviadobanco = 0
     where fec_corte_ini = w_fec_trf_ini;
  
   -- confirma transferencias ach avvillas pasados 3 dias habiles
    update recaudo_local_disp_tot r
       set r.estadotrf = 'EXI', r.fechaconfirmada = sysdate
     where (r.estadotrf = 'ENV' or r.estadotrf is null)
       and r.fec_dispersion <=
           fn_fec_dispersion(w_fec_trf_ini, -3, 0, p_usuario);
  
    commit;
  
  
    contabiliza_pago_local(p_fec_ini_ano,
                             p_fec_ini_mes,
                             p_fec_ini_dia,
                             p_usuario,
                             p_error);
  
   
    -- obtiene cantidad de registros procesados
    select count(*)
      into w_registros
      from recaudo_local_disp_tot
     where fec_dispersion = w_fec_trf_ini;
  
    p_error := 'Transferencia generada OK. Registros: ' || w_registros || ': ' ||
               to_char(w_fec_trf_ini, 'yyyy-mm-dd');
  
    sp_envioNotificacion(grupoRecibe => 3,
                         grupoCopia  => 2,
                         asunto      => 'SDF - Proceso de transferencia RECAUDO LOCAL  del dia ' ||
                                        to_char(w_fec_trf_ini, 'yyyy-MM-dd'),
                         mensaje     => 'El sistema SDF informa que se ha ejecutado el proceso de transferencia RECAUDO LOCAL, del dia ' ||
                                        to_char(w_fec_trf_ini, 'yyyy-MM-dd') ||
                                        '. Favor verificar y dar su visto bueno. Se genero el siguiente mensaje en el proceso de transferencia ' ||
                                        p_error,
                         p_usuario   => p_usuario);
  
    sp_log(p_usuario,
           'transferir_recaudo_local',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia);
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [transferir_recaudo_local] ' || SQLERRM,
            p_error);
    
  END transferir_recaudo_local;
  
PROCEDURE contabiliza_recaudo_local    (p_feccor_ini_ano number,
                                        p_feccor_ini_mes number,
                                        p_feccor_ini_dia number,
                                        p_feccor_fin_ano number,
                                        p_feccor_fin_mes number,
                                        p_feccor_fin_dia number,
                                        p_banco varchar2,
                                        p_usuario        varchar2,
                                        p_error          OUT VARCHAR2) AS
    w_fec_cor_ini date;
    w_fec_cor_fin date;
    w_registros   number;
  
    w_fec_cor_ini_s char(8);
    w_fec_cor_fin_s char(8);
        
    tipoCon char(3);
    
    w_concepto      varchar(250);
  
    zt char(2);
    ze char(2);
    
    pfc1 char(4);
    fcm1 char(4);
    cop char(3);
    c50 char(2);
    c40 char(2);
    c31 char(2);
    c01 char(2);
    c11 char(2);
    c21 char(2);
    
    v5 char(2);

    c20211 char(5);
    c20212 char(5);
    c20213 char(5);
    c20214 char(5);

    c20221 char(5);
    c20222 char(5);
    c20223 char(5);
    c20224 char(5);
    
    c202213 char(6);
    c200101 char(6);

    c200102 char(6);
    c100761 char(6);
    
    cZ000 char(4);
    cZ002 char(4);
    
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
    
   
  BEGIN
  
    zt := 'ZT';
    ze := 'ZE';
    
    pfc1 := 'PFC1';
    fcm1 := 'FCM1';
    cop := 'COP';
    
    c50 := '50';
    c40 := '40';
    c31 := '31';
    c01 := '01';
    c11 := '11';
    c21 := '21';
    
    v5 := 'V5';
    
    
    c20211 := '20211';
    c20212 := '20212';
    c20213 := '20213';
    c20214 := '20214';

    c20221 := '20221';
    c20222 := '20222';
    c20223 := '20223';
    c20224 := '20224';
    c200101 := '200101';
    c200102 := '200102';
    c202213 := '202213';
    c100761 := '100761';
    
    cZ000 := 'Z000';
    cZ002 := 'Z002';
    
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
    
    
    -- Obtiene fecha de cierre en formato ddMMyyyy
    select TO_DATE(p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
                   p_feccor_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_ini
      from DUAL;

    select TO_DATE(p_feccor_fin_ano || '-' || p_feccor_fin_mes || '-' ||
                   p_feccor_fin_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_fin
      from DUAL;
  
    select to_char(w_fec_cor_ini, 'ddMMyyyy')
      into w_fec_cor_ini_s
      from DUAL;

    select to_char(w_fec_cor_fin, 'ddMMyyyy')
      into w_fec_cor_fin_s
      from DUAL;
      
   select decode(p_banco,'52','LRA','LRO') 
   into tipoCon 
   from dual;   
  
    -- elimina contabilizacion
    delete recaudo_externo_contabilidad
     where to_date(fechaDoc,'ddMMyyyy') >= w_fec_cor_ini and
       to_date(fechaDoc,'ddMMyyyy') <= w_fec_cor_fin 
       and tipoContable = tipoCon;
  
 
    w_concepto := 'REC INGRESO PART CONCESIONARIO CONCESIONARIO 65%';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' || R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c50 else c40 end) as clavecontable,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), b.cuentacontable, (  case when r.valor_total > 0 then b.ctacontperiodoant else c.cta_cont_period_ant end ) )  as cuenta,
             r.s_valor_2 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), '' , (case when r.valor_total > 0 then '' else c200102 end )  ) as centrocosto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), c20211 || substr(r.idconcesionario, 2, 1), (case when r.valor_total > 0 then c20211 || substr(r.idconcesionario, 2, 1) else '' end )  ) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), substr(m.nit_m, 0, 9) , (case when r.valor_total > 0 then substr(m.nit_m, 0, 9) else substr(c.nit_c, 0, 9) end )  ) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion      r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'SIMIT'
         and decode(r.idbanco,'52','52','99') = p_banco;
  
  
    w_concepto := 'REC INGRESO FONDO COB CONCESIONARIO 5%';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c50 else c40 end) as clavecontable,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), b.cuentacontable, (  case when r.valor_total > 0 then b.ctacontperiodoant else c.cta_cont_period_ant end ) )  as cuenta,
             r.s_valor_3 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), '' , (case when r.valor_total > 0 then '' else c200102 end )  ) as centrocosto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), c20212 || substr(r.idconcesionario, 2, 1), (case when r.valor_total > 0 then c20212 || substr(r.idconcesionario, 2, 1) else '' end ) ) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING FONDO COB ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), substr(m.nit_m, 0, 9) , (case when r.valor_total > 0 then substr(m.nit_m, 0, 9) else substr(c.nit_c, 0, 9) end )  ) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'SIMIT'
         and decode(r.idbanco,'52','52','99') = p_banco;
  
    w_concepto := 'REC INGRESO FCM 25%';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c50 else c40 end) as clavecontable,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), b.cuentacontable, (  case when r.valor_total > 0 then b.ctacontperiodoant else c.cta_cont_period_antfcm end ) )  as cuenta,
             r.s_valor_1 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), '' , (case when r.valor_total > 0 then '' else c200101 end )  ) as centrocosto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), c20213 || substr(r.idconcesionario, 2, 1), (case when r.valor_total > 0 then c20213 || substr(r.idconcesionario, 2, 1) else '' end )  ) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING FCM ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion      r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
        and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'SIMIT'
         and decode(r.idbanco,'52','52','99') = p_banco;
  
    w_concepto := 'REC INGRESO FONDO COB FCM 5%';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c50 else c40 end) as clavecontable,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), b.cuentacontable, (  case when r.valor_total > 0 then b.ctacontperiodoant else c.cta_cont_period_antfcm end ) )  as cuenta,
             r.s_valor_4 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), '' , (case when r.valor_total > 0 then '' else c200101 end )  ) as centrocosto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), c20214 || substr(r.idconcesionario, 2, 1), (case when r.valor_total > 0 then c20214 || substr(r.idconcesionario, 2, 1) else '' end )  ) as centrobeneficio,
            to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING FONDO COB FCM ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'SIMIT'
         and decode(r.idbanco,'52','52','99') = p_banco;
  
    w_concepto := 'NOMBRE BANCO CTA REC';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c40 else c50 end) as clavecontable,
             decode(r.indorigen,'IDE',cr.cta_contable_ide,
                                      cr.cta_contable) as cuenta,
             r.valor_total as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             decode(r.indorigen,'IDE',to_char(r.fec_tran, 'ddMMyyyy'),
                                to_char(r.fec_corte, 'ddMMyyyy') ) as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             decode(r.indorigen,'IDE', b.nombre || ' ' || r.cta_recaudo || ' ' || to_char(r.fec_tran, 'ddMMyyyy') ,
                                       b.nombre || ' ' || r.cta_recaudo ) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion      r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_fcm                cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'SIMIT'
         and decode(r.idbanco,'52','52','99') = p_banco;


    w_concepto := 'REC GASTO PART CONCESIONARIO 65%';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c40 else c50 end) as clavecontable,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), c.cta_contable_liquidacion, (  case when r.valor_total > 0 then c.cta_cont_period_ant else b.ctacontperiodoant end ) )  as cuenta,
             r.s_valor_2 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), c200102, (  case when r.valor_total > 0 then c200102 else '' end ) )  as centrocosto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), '', (  case when r.valor_total > 0 then '' else c20211 || substr(r.idconcesionario, 2, 1)  end ) )  as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC GASTO PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), substr(c.nit_c, 0, 9) , (case when r.valor_total > 0 then substr(c.nit_c, 0, 9) else substr(m.nit_m, 0, 9) end )  ) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion      r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'SIMIT'
         and decode(r.idbanco,'52','52','99') = p_banco;
  
    w_concepto := 'REC GASTO FONDO COB CONCESIONARIO 5%';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c40 else c50 end) as clavecontable,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), c.cta_contable_fondo, (  case when r.valor_total > 0 then c.cta_cont_period_ant else b.ctacontperiodoant end ) )  as cuenta,
             r.s_valor_3 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), c200102, (  case when r.valor_total > 0 then c200102 else '' end ) )  as centrocosto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), '', (  case when r.valor_total > 0 then '' else c20212 || substr(r.idconcesionario, 2, 1)  end ) )  as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC GASTO FONDO COB ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), substr(c.nit_c, 0, 9) , (case when r.valor_total > 0 then substr(c.nit_c, 0, 9) else substr(m.nit_m, 0, 9) end )  ) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion      r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'SIMIT'
         and decode(r.idbanco,'52','52','99') = p_banco;
  
    w_concepto := 'OTRO ACREEDOR CONCESIONARIO 65% + 5%';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c31 else c21 end) as clavecontable,
             substr(C.NIT_C, 0, 9) as cuenta,
             ROUND(R.s_valor_2, 0) + ROUND(R.s_valor_3, 0) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('OTRO ACREEDOR ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(C.NIT_C, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             cZ000 as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion      r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'SIMIT'
         and decode(r.idbanco,'52','52','99') = p_banco;
  
      w_concepto := 'CXC 100% AL MUNICIPIO';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c01 else c11 end) as clavecontable,
            substr(m.nit_m, 0, 9) as cuenta,
             r.valor_total as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CXC 100% AL MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             c1401020102 as cuentadivergente,
             to_char(r.fec_corte, 'ddMMyyyy') as fechabase,
             cz000 as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'SIMIT'
         and decode(r.idbanco,'52','52','99') = p_banco;
  
    w_concepto := 'CXC 100% AL MUNICIPIO';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c11 else c01 end) as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             r.valor_total as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CXC 100% AL MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             c1401020102 as cuentadivergente,
             to_char(r.fec_corte, 'ddMMyyyy') as fechabase,
             cz000 as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'SIMIT'
         and decode(r.idbanco,'52','52','99') = p_banco;
  
  
    w_concepto := 'REC INGRESO PART CONCESIONARIO CONCESIONARIO  3,25%';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c50 else c40 end) as clavecontable,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), b.cuentacontable, (  case when r.valor_total > 0 then b.ctacontperiodoant else c.cta_cont_period_ant end ) )  as cuenta,
             r.p_valor_8 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), '', (  case when r.valor_total > 0 then '' else c200102 end ) )  as centrocosto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), c20221 || substr(r.idconcesionario, 2, 1), (case when r.valor_total > 0 then c20221 || substr(r.idconcesionario, 2, 1) else '' end )  ) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), substr(m.nit_m, 0, 9) , (case when r.valor_total > 0 then substr(m.nit_m, 0, 9) else substr(c.nit_c, 0, 9) end )  ) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco,'52','52','99') = p_banco;

    w_concepto := 'REC INGRESO FONDO COB CONCESIONARIO 0,25%';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c50 else c40 end) as clavecontable,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), b.cuentacontable, (  case when r.valor_total > 0 then b.ctacontperiodoant else c.cta_cont_period_ant end ) )  as cuenta,
             r.p_valor_9 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), '', (  case when r.valor_total > 0 then '' else c200102 end ) )  as centrocosto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), c20222 || substr(r.idconcesionario, 2, 1), (case when r.valor_total > 0 then c20222 || substr(r.idconcesionario, 2, 1) else '' end )  ) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING FONDO COB ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), substr(m.nit_m, 0, 9) , (case when r.valor_total > 0 then substr(m.nit_m, 0, 9) else substr(c.nit_c, 0, 9) end )  ) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion      r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco,'52','52','99') = p_banco;
  
  
    w_concepto := 'REC INGRESO FCM 3,25%';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c50 else c40 end) as clavecontable,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), b.cuentacontable, (  case when r.valor_total > 0 then b.ctacontperiodoant else c.cta_cont_period_antfcm end ) )  as cuenta,
             ROUND( r.p_valor_7 + r.p_valor_12, 0) as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), '', (  case when r.valor_total > 0 then '' else c200101 end ) )  as centrocosto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), c20223 || substr(r.idconcesionario, 2, 1), (case when r.valor_total > 0 then c20223 || substr(r.idconcesionario, 2, 1) else '' end )  ) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING FCM ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco,'52','52','99') = p_banco;
  
    w_concepto := 'REC INGRESO FONDO COB FCM ( 0,25%)';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c50 else c40 end) as clavecontable,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), b.cuentacontable, (  case when r.valor_total > 0 then b.ctacontperiodoant else c.cta_cont_period_antfcm end ) )  as cuenta,
             r.p_valor_10 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), '', (  case when r.valor_total > 0 then '' else c200101 end ) )  as centrocosto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), c20224 || substr(r.idconcesionario, 2, 1), (case when r.valor_total > 0 then c20224 || substr(r.idconcesionario, 2, 1) else '' end )  ) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING FONDO COB FCM ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion      r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco,'52','52','99') = p_banco;
   
    w_concepto := 'REC INGRESO PART CONCESIONARIO SEVIAL  3,0%';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c50 else c40 end) as clavecontable,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), b.cuentacontable, (  case when r.valor_total > 0 then b.ctacontperiodoant else c.cta_cont_period_ant end ) )  as cuenta,
             r.p_valor_13 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), '', (  case when r.valor_total > 0 then '' else c200102 end ) )  as centrocosto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), c202213 , (case when r.valor_total > 0 then c202213 else '' end )  ) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING PART CONCES SEVIAL 3.0%') AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), substr(m.nit_m, 0, 9) , (case when r.valor_total > 0 then substr(m.nit_m, 0, 9) else substr(f.nit_sevial, 0, 9) end )  ) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco,'52','52','99') = p_banco;
    
    w_concepto := 'NOMBRE BANCO CTA REC';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c40 else c50 end) as clavecontable,
             decode(r.indorigen,'IDE',cr.cta_contable_ide,
                                      cr.cta_contable) as cuenta,
             r.valor_total as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             decode(r.indorigen,'IDE',to_char(r.fec_tran, 'ddMMyyyy'),
                                      to_char(r.fec_corte, 'ddMMyyyy') ) as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             decode(r.indorigen,'IDE', b.nombre || ' ' || r.cta_recaudo || ' ' || to_char(r.fec_tran, 'ddMMyyyy') ,
                                       b.nombre || ' ' || r.cta_recaudo ) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipocon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_fcm                cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco,'52','52','99') = p_banco;
    
    w_concepto := 'OTRO ACREEDOR POLCA 39,78';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c31 else c21 end) as clavecontable,
             substr(f.nit_polca, 0, 9) as cuenta,
             r.p_valor_15 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('OTRO ACREEDOR POLCA 39,78') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_polca, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             cZ000 as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco,'52','52','99') = p_banco;
    
    
    w_concepto := 'REC GASTO PART CONCESIONARIO 3.25%';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c40 else c50 end) as clavecontable,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), c.cta_contable_liquidacion, (  case when r.valor_total > 0 then c.cta_cont_period_ant else b.ctacontperiodoant end ) )  as cuenta,
             r.p_valor_8 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), c200102, (  case when r.valor_total > 0 then c200102 else '' end ) )  as centrocosto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), '' , (case when r.valor_total > 0 then '' else c20221 || substr(r.idconcesionario, 2, 1) end )  ) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC GASTO PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), substr(c.nit_c, 0, 9) , (case when r.valor_total > 0 then substr(c.nit_c, 0, 9) else substr(m.nit_m, 0, 9) end )  ) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco,'52','52','99') = p_banco;
    
    w_concepto := 'REC GASTO PART CONCESIONARIO sevial (3.0%))';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000')  || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c40 else c50 end) as clavecontable,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), c.cta_contable_liquidacion, (  case when r.valor_total > 0 then c.cta_cont_period_ant else b.ctacontperiodoant end ) )  as cuenta,
             r.p_valor_13 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), c200102, (  case when r.valor_total > 0 then c200102 else '' end ) )  as centrocosto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), '' , (case when r.valor_total > 0 then '' else c202213 end )  ) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC GASTO PART CONCES SEVIAL 3%') AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), substr(f.nit_sevial, 0, 9) , (case when r.valor_total > 0 then substr(f.nit_sevial, 0, 9) else substr(m.nit_m, 0, 9) end )  ) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco,'52','52','99') = p_banco;
     
    w_concepto := 'CXP PART SEVIAL 3%';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000')  || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c31 else c21 end) as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             r.p_valor_13 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CXP PART SEVIAL 3%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             cZ000 as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco,'52','52','99') = p_banco;
          
    w_concepto := 'REC GASTO FONDO COB CONCESIONARIO ( 0,25%)';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c40 else c50 end) as clavecontable,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), c.cta_contable_fondo, (  case when r.valor_total > 0 then c.cta_cont_period_ant else b.ctacontperiodoant end ) )  as cuenta,
             r.p_valor_9 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), c200102, (  case when r.valor_total > 0 then c200102 else '' end ) )  as centrocosto,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), '' , (case when r.valor_total > 0 then '' else c20222 || substr(r.idconcesionario, 2, 1) end )  ) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC GASTO FONDO COB ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), substr(c.nit_c, 0, 9) , (case when r.valor_total > 0 then substr(c.nit_c, 0, 9) else substr(m.nit_m, 0, 9) end )  ) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco,'52','52','99') = p_banco;
         
     w_concepto := 'OTRO ACREEDOR CONCESIONARIO 3,25% + 0,25%';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c31 else c21 end) as clavecontable,
             substr(C.NIT_C, 0, 9) as cuenta,
             ROUND(R.p_valor_8, 0) + ROUND(R.p_valor_9, 0) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('OTRO ACREEDOR ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(C.NIT_C, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             cZ000 as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco,'52','52','99') = p_banco;
  
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c31 else c21 end) as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             r.p_valor_17 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION SEVIAL 2.7 ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             c2905901001 as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             cZ000 as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco,'52','52','99') = p_banco;
  
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c31 else c21 end) as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             r.p_valor_20 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION IVA SEVIAL 2.7 ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             c2905901002 as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             cZ000 as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco,'52','52','99') = p_banco;
    
    w_concepto := 'PARTICIPACION 1.8%';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
              to_char(r.idrecaudolocal_liquidacion,'0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c50 else c40 end) as clavecontable,
             c2905901003 as cuenta,
             r.p_valor_16 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION FCM 1.8') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco,'52','52','99') = p_banco;
     
    w_concepto := 'PARTICIPACION IVA 1.8%';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
              to_char(r.idrecaudolocal_liquidacion,'0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c50 else c40 end) as clavecontable,
             c2905901004 as cuenta,
             r.p_valor_19 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION IVA FCM 1.8') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco,'52','52','99') = p_banco;
     
  
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             (to_char(r.idrecaudolocal_liquidacion,'0000000000') || 'A') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c01 else c11 end) as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.p_valor_7 + ROUND(r.p_valor_8, 0) +
             ROUND(r.p_valor_9, 0) + round(r.p_valor_10, 0) +
             ROUND(r.p_valor_11, 0) + r.p_valor_12 +
             ROUND(r.p_valor_13, 0) + ROUND(r.p_valor_14, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CXC 10% AL MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             c1401020102 as cuentadivergente,
             to_char(r.fec_corte, 'ddMMyyyy') as fechabase,
             cZ000 as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco,'52','52','99') = p_banco;
  
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             (to_char(r.idrecaudolocal_liquidacion,'0000000000') || 'A') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c11 else c01 end) as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.p_valor_7 + ROUND(r.p_valor_8, 0) +
             ROUND(r.p_valor_9, 0) + round(r.p_valor_10, 0) +
             ROUND(r.p_valor_11, 0) + r.p_valor_12 +
             ROUND(r.p_valor_13, 0) + ROUND(r.p_valor_14, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CXC 10% AL MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             c1401020102 as cuentadivergente,
             to_char(r.fec_corte, 'ddMMyyyy') as fechabase,
             cZ000 as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco,'52','52','99') = p_banco;
  
  
    w_concepto := 'CXC A SIMIT 2.7%+1.8 + IVA';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             fcm1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c40 else c50 end) as clavecontable,
             c1470909002 as cuenta,
             
             -- 2.7 + IVA + 1.8 + IVA
             ROUND(round(r.p_valor_16, 0) + round(r.p_valor_19, 0) +
                    round(r.p_valor_17, 0) + round(r.p_valor_20, 0),
                    0) as importe,
             
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CRUCE CXC A SIMIT 2.7%+1.8%+IVA') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco,'52','52','99') = p_banco;

    w_concepto := 'CXP A SIMIT 2.7%+1.8 + IVA';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             fcm1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c31 else c21 end) as clavecontable,
             substr(f.nit_polca, 0, 9) as cuenta,
             
               -- 2.7 + IVA + 1.8 + IVA
             ROUND(round(r.p_valor_16, 0) + round(r.p_valor_19, 0) +
                    round(r.p_valor_17, 0) + round(r.p_valor_20, 0),
                    0) as importe,
             
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CRUCE CXP A SIMIT 2.7%+1.8%+IVA') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_polca, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_corte, 'ddMMyyyy') as fechabase,
             cZ002 as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco,'52','52','99') = p_banco;

  
    w_concepto := 'GASTOS SEVIAL 2.7%+IVA';
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             ze as clasedoc,
             fcm1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') || 'S' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c40 else c50 end) as clavecontable,
               c5111110112 as cuenta,
             
             (r.p_valor_17 + r.p_valor_20) as importe,
             
             v5 as indicadorimpuesto,
             c100761 as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('GASTOS SEVIAL 2,7%+IVA') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco,'52','52','99') = p_banco;

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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             ze as clasedoc,
             fcm1 as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             cop as moneda,
             to_char(r.idrecaudolocal_liquidacion,'0000000000') || 'S' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c31 else c21 end) as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             (r.p_valor_17 + r.p_valor_20) as importe,
             v5 as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CXP SEVIAL 2,7%+IVA') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             cZ000 as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco,'52','52','99') = p_banco;

     update recaudo_externo_contabilidad r
       set r.importe = r.importe * - 1
     where to_date(fechaDoc,'ddMMyyyy') >= w_fec_cor_ini and
       to_date(fechaDoc,'ddMMyyyy') <= w_fec_cor_fin 
       and tipoContable = tipoCon
       and  r.importe < 0;
 
    update recaudo_externo_contabilidad r
       set r.importe = ROUND(r.importe, 0)
     where to_date(fechaDoc,'ddMMyyyy') >= w_fec_cor_ini and
       to_date(fechaDoc,'ddMMyyyy') <= w_fec_cor_fin 
       and tipoContable = tipoCon;
       
    delete recaudo_externo_contabilidad r
     where r.importe = 0
     AND to_date(fechaDoc,'ddMMyyyy') >= w_fec_cor_ini and
       to_date(fechaDoc,'ddMMyyyy') <= w_fec_cor_fin 
       and tipoContable = tipoCon;
 
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
      select a.fechadoc as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             a.fechadoc as fechacontable,
             substr(a.fechadoc,3,2) as periodo,
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
             a.fechadoc as fechavalor,
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
                     max(c.fechadoc) as fechadoc,
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
               where to_date(c.fechadoc,'ddMMyyyy') >= w_fec_cor_ini
                 and to_date(c.fechadoc,'ddMMyyyy') <= w_fec_cor_fin
                 and c.sociedad = pfc1
                 and tipocontable = tipoCon
               group by c.referencia) a
       where f.nit_fcm = c8000826650
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
      select a.fechadoc as fechadoc,
             zt as clasedoc,
             fcm1 as sociedad,
             a.fechaDoc as fechacontable,
             substr(a.fechadoc,3,2) as periodo,
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
             to_char(a.fechadoc, 'ddMMyyyy') as fechavalor,
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
                     max(c.fechadoc) as fechadoc,
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
               where to_date(c.fechadoc,'ddMMyyyy') >= w_fec_cor_ini
                 and to_date(c.fechadoc,'ddMMyyyy') <= w_fec_cor_fin
                 and c.sociedad = fcm1
                 and tipocontable = tipoCon
               group by c.referencia) a
       where f.nit_fcm = c8000826650
         and a.importe <> 0;
  
    commit;
    
        -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_local_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and decode(idbanco, '52', '52', '99') = p_banco;
  
    p_error := 'Distribucion recaudo local OK. Registros procesados: ' ||
               w_registros;
  
    sp_log(p_usuario,
           'Contabiliza Recaudo local',
           p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
           p_feccor_ini_dia ||
           p_feccor_fin_ano || '-' || p_feccor_fin_mes || '-' ||
           p_feccor_fin_dia || 
           p_banco);
  
    commit;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [contabiliza_recaudo_local] ' || SQLERRM,
            p_error);
    
  END contabiliza_recaudo_local;

PROCEDURE contabiliza_pago_local(p_feccor_ini_ano number,
                                     p_feccor_ini_mes number,
                                     p_feccor_ini_dia number,
                                     p_usuario        varchar2,
                                     p_error          OUT VARCHAR2) AS
    w_fec_cor_ini date;
    w_fec_cor_ini_s date;
    
    w_registros   number;
  
    w_concepto      varchar(250);
   
    zt char(2);
    ze char(2);
    zd char(2);
    
    tipoCon char(3);
    
    pfc1 char(4);
    fcm1 char(4);
    cop char(3);
    c50 char(2);
    c40 char(2);
    c31 char(2);
    c01 char(2);
    c11 char(2);
    c21 char(2);
    
    v5 char(2);

    c20211 char(5);
    c20212 char(5);
    c20213 char(5);
    c20214 char(5);

    c20221 char(5);
    c20222 char(5);
    c20223 char(5);
    c20224 char(5);
    
    c202213 char(6);
    c200101 char(6);

    c200102 char(6);
    c100761 char(6);
    
    cZ000 char(4);
    cZ002 char(4);
    
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
    c2905901012 char(10);
    c2905901007 char(10);
    c1470901106 char(10);
    

    aaaa0115        char(8);

  
  BEGIN
  
  
    zt := 'ZT';
    ze := 'ZE';
    zd := 'ZD';
    
    pfc1 := 'PFC1';
    fcm1 := 'FCM1';
    cop := 'COP';
    
    c50 := '50';
    c40 := '40';
    c31 := '31';
    c01 := '01';
    c11 := '11';
    c21 := '21';
    
    v5 := 'V5';
    
    
    c20211 := '20211';
    c20212 := '20212';
    c20213 := '20213';
    c20214 := '20214';

    c20221 := '20221';
    c20222 := '20222';
    c20223 := '20223';
    c20224 := '20224';
    c200101 := '200101';
    c200102 := '200102';
    c202213 := '202213';
    c100761 := '100761';
    
    cZ000 := 'Z000';
    cZ002 := 'Z002';
    
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
    c2905901012 := '2905901012';
    c2905901007 := '2905901007';
    c1470901106 := '1470901106';

     tipoCon := 'PAL';

   
    -- Obtiene fecha de cierre en formato ddMMyyyy
    select TO_DATE(p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
                   p_feccor_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_ini
      from DUAL;
  
    select to_char(w_fec_cor_ini, 'ddMMyyyy')
      into w_fec_cor_ini_s
      from DUAL;

    aaaa0115 := '1501' || trim(to_char(p_feccor_ini_ano + 1));
  
    -- elimina contabilizacion
    delete recaudo_externo_contabilidad
     where fechaDoc = w_fec_cor_ini_s
       and tipoContable = tipoCon;
  
  
     w_concepto := 'PAGO PART CONCES nomConcesioanrio';
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
      select to_char(r.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             R.idrecaudolocal_liquidacion || 'G' as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' || R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c21 else c31 end) as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             (r.s_valor_6) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             (case when r.valor_total > 0 then '' else cz000 end) as condicionpago,
             substr(r.NIT_CONCESIONARIO, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_fcm                cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'PAGO PART FONDO CONCES nomConcesioanrio';
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
      select to_char(r.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             R.Idrecaudolocal_Liquidacion || 'G' as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c21 else c31 end) as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             (r.s_valor_3) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PART FONDO CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             (case when r.valor_total > 0 then '' else cz000 end) as condicionpago,
             substr(r.NIT_FONDO, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_fcm                cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'REG CTA PTE PAS DISP BCO';
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
      select to_char(r.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             R.Idrecaudolocal_Liquidacion || 'G' as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c50 else c40 end) as clavecontable,
             c2905901012 as cuenta,
             round(r.s_valor_3,0) + round(r.s_valor_6) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REG CTA PTE PAS DISP ' || B.NOMBRE) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_fcm                cr,
             fcm f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'SIMIT'
         and f.nit_fcm = '8000826650';

    w_concepto := 'DISP OTRO ACR POLCA 39.78';
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
      select to_char(r.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             R.idrecaudolocal_liquidacion as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c21 else c31 end) as clavecontable,
             substr(f.nit_polca, 0, 9) as cuenta,
             r.p_valor_15 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DISP OTRO ACR POLCA 39.78%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_polca, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             (case when r.valor_total > 0 then '' else cz000 end) as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_fcm                cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and f.nit_fcm = '8000826650'
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'PAGO PARTICIPACION SEVIAL 2.7%';
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
      select to_char(r.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             R.idrecaudolocal_liquidacion as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c21 else c31 end) as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             r.p_valor_17 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DISP PART SEVIAL 2.7%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             c2905901001 as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             (case when r.valor_total > 0 then '' else cz000 end) as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_fcm                cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and f.nit_fcm = '8000826650'
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'DISP IVA PAR 2.7% SEVIAL';
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
      select to_char(r.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             R.idrecaudolocal_liquidacion as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c21 else c31 end) as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             r.p_valor_20 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DISP IVA PAR SEVIAL 2.7%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             c2905901002 as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             (case when r.valor_total > 0 then '' else cz000 end) as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_fcm                cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and f.nit_fcm = '8000826650'
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'DISP PAR 1.8% FCM';
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
      select to_char(r.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             R.idrecaudolocal_liquidacion as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c40 else c50 end)  as clavecontable,
             c2905901003 as cuenta,
             r.p_valor_16 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DSIP PAR 1.8% FCM') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_fcm                cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and f.nit_fcm = '8000826650'
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'DISP IVA PAR 1.8% FCM';
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
      select to_char(r.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             R.idrecaudolocal_liquidacion as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c40 else c50 end)  as clavecontable,
             c2905901004 as cuenta,
             r.p_valor_19 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DISP IVA PAR 1,8% FCM') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_fcm                cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and f.nit_fcm = '8000826650'
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'REG CTA PTE PAS DISP BCO';
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
      select to_char(r.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             R.idrecaudolocal_liquidacion as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c50 else c40 end) as clavecontable,
             c2905901012 as cuenta,
             round(r.p_valor_15,0)+ round(r.p_valor_16,0) + round(r.p_valor_17,0) + round(r.p_valor_19,0) + round(r.p_valor_20) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REG CTA PTE PAS DISP BCO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_fcm                cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and f.nit_fcm = '8000826650'
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'POLCA';

  
    w_concepto := 'DISP PAR 3% SEVIAL';
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
      select to_char(r.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             R.idrecaudolocal_liquidacion || 'G' as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c21 else c31 end)  as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             r.p_valor_13 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DISP PAR 3% SEVIAL') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             (case when r.valor_total > 0 then '' else cz000 end) as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_fcm                cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and f.nit_fcm = '8000826650'
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'POLCA';
    
    w_concepto := 'DISP REC POLCA PART CONCES nomConcesioanrio';
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
      select to_char(r.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             R.idrecaudolocal_liquidacion || 'G' as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c21 else c31 end) as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             r.p_valor_25 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DISP REC POLCA PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             (case when r.valor_total > 0 then '' else cz000 end) as condicionpago,
             substr(r.NIT_CONCESIONARIO, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_fcm      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'DISP REC POLCA PART OPER FDO';
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
      select to_char(r.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             R.Idrecaudolocal_Liquidacion || 'G' as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c21 else c31 end) as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             r.p_valor_9 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('DISP REC POLCA PART OPER FDO ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             (case when r.valor_total > 0 then '' else cz000 end) as condicionpago,
             substr(r.NIT_FONDO, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_fcm      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'REG CTA PTE PAS DISP BCO';
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
      select to_char(r.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             R.Idrecaudolocal_Liquidacion || 'G' as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case when r.valor_total > 0 then c50 else c40 end) as clavecontable,
             c2905901012 as cuenta,
             round(r.p_valor_8,0) + round(r.p_valor_9,0) + round(r.p_valor_13,0) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REG CTA PTE PAS DISP BCO ' || b.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_fcm                cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.fec_dispersion = w_fec_cor_ini
         and f.nit_fcm = '8000826650'
         and r.indTipo = 'POLCA';
 
    -- Contabiliza pago realizado por el banco
  
    w_concepto := 'pago concesioanrio';
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
      select to_char(r.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             to_char(r.fec_dispersion, 'ddMMyyyy') as referencia,
             'BAN PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') as textocabezera,
             c50 as clavecontable,
             cf.cta_contable_ing as cuenta,
             r.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             substr(r.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(r.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_externo_disp_tot r, cta_recaudo_fcm cf, concesionario c
        where r.id_concesionario_liq = c.idconcesionario and
        cf.idbanco = r.ori_idbanco and
        cf.cuenta = r.ori_cuenta and
        cf.indtipo = r.indtipo and
        r.fec_dispersion = w_fec_cor_ini and
        r.orden = 2;
        
        
    w_concepto := 'pago fond concesioanrio';
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
      select to_char(r.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             to_char(r.fec_dispersion, 'ddMMyyyy') as referencia,
             'BAN PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') as textocabezera,
             c50 as clavecontable,
             cf.cta_contable_ing as cuenta,
             r.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             substr(r.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(r.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_externo_disp_tot r, cta_recaudo_fcm cf, concesionario c
        where r.id_concesionario_liq = c.idconcesionario and
        cf.idbanco = r.ori_idbanco and
        cf.cuenta = r.ori_cuenta and
        cf.indtipo = r.indtipo and
        r.fec_dispersion = w_fec_cor_ini and
        r.orden = 3;
          
     w_concepto := 'pago fond cobertura fcm';
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
      select to_char(r.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             to_char(r.fec_dispersion, 'ddMMyyyy') as referencia,
             'BAN PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') as textocabezera,
             c50 as clavecontable,
             cf.cta_contable_ing as cuenta,
             r.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             substr(r.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(r.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_externo_disp_tot r, cta_recaudo_fcm cf, concesionario c
        where r.id_concesionario_liq = c.idconcesionario and
        cf.idbanco = r.ori_idbanco and
        cf.cuenta = r.ori_cuenta and
        cf.indtipo = r.indtipo and
        r.fec_dispersion = w_fec_cor_ini and
        r.orden = 4;
 
     w_concepto := 'PAGO fond cobertura fcm';
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
      select to_char(r.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             to_char(r.fec_dispersion, 'ddMMyyyy') as referencia,
             'BAN PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') as textocabezera,
             c01 as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             r.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             substr('PAGO FONDO COBERTURA FCM ' || c.nombre ,50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             aaaa0115 as fechabase,
             cz000 as condicionpago,
             substr(r.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_externo_disp_tot r, cta_recaudo_fcm cf, concesionario c
        where r.id_concesionario_liq = c.idconcesionario and
        cf.idbanco = r.ori_idbanco and
        cf.cuenta = r.ori_cuenta and
        cf.indtipo = r.indtipo and
        r.fec_dispersion = w_fec_cor_ini and
        r.orden = 4;  
 
    w_concepto := 'REG CTA PTE PAS DISP BCO';
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
      select to_char(s.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             c40 as clavecontable,
             c2905901012 as cuenta,
             s.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             ('REG CTA PTE PAS DISP BCO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from (select sum(r.s_valor_2 + r.s_valor_3 + r.p_valor_8 + r.p_valor_9) as valor,
                     idconcesionario,
                     cta_recaudo,
                     max(r.fec_dispersion) as fec_dispersion
                from recaudo_local_liquidacion r
               where r.fec_dispersion = w_fec_cor_ini
               group by r.idconcesionario, r.cta_recaudo) s,
             concesionario c,
             fcm f
       where s.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650';
 
 
      w_concepto := 'Liquidacion fcm';
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
      select to_char(r.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             to_char(r.fec_dispersion, 'ddMMyyyy') as referencia,
             'BAN PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') as textocabezera,
             c50 as clavecontable,
             cf.cta_contable_ing as cuenta,
             r.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             substr(r.concepto ,50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_externo_disp_tot r, cta_recaudo_fcm cf, concesionario c, fcm f
        where r.id_concesionario_liq = c.idconcesionario and
        cf.idbanco = r.ori_idbanco and
        cf.cuenta = r.ori_cuenta and
        cf.indtipo = r.indtipo and
        r.fec_dispersion = w_fec_cor_ini and
        f.nit_fcm = '8000826650' and
        r.orden = 1;  
 
 
       w_concepto := 'Liquidacion fcm';
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
      select to_char(r.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             to_char(r.fec_dispersion, 'ddMMyyyy') as referencia,
             'BAN PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') as textocabezera,
             c40 as clavecontable,
             cd.cta_con_s as cuenta,
             r.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             substr(r.concepto ,50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_externo_disp_tot r, cta_recaudo_fcm cf, concesionario c, fcm f, cta_dispersion_fcm cd
        where r.id_concesionario_liq = c.idconcesionario and
        cf.idbanco = r.ori_idbanco and
        cf.cuenta = r.ori_cuenta and
        cf.indtipo = r.indtipo and
        r.fec_dispersion = w_fec_cor_ini and
        f.nit_fcm = '8000826650' and
        cd.idbancorec = r.ori_idbanco and
        r.orden = 1;  
 
      w_concepto := 'Liquidacion polca';
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
      select to_char(r.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             to_char(r.fec_dispersion, 'ddMMyyyy') as referencia,
             'BAN PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') as textocabezera,
             c50 as clavecontable,
             cf.cta_contable_ing as cuenta,
             r.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_polca, 0, 9) AS asignacion,
             substr(r.concepto ,50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_polca, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_externo_disp_tot r, cta_recaudo_fcm cf, concesionario c, fcm f, cta_dispersion_fcm cd
        where r.id_concesionario_liq = c.idconcesionario and
        cf.idbanco = r.ori_idbanco and
        cf.cuenta = r.ori_cuenta and
        cf.indtipo = r.indtipo and
        r.fec_dispersion = w_fec_cor_ini and
        f.nit_fcm = '8000826650' and
        cd.idbancorec = r.ori_idbanco and
        r.orden = 7;  
        
      w_concepto := 'Liquidacion Sevial';
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
      select to_char(r.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             to_char(r.fec_dispersion, 'ddMMyyyy') as referencia,
             'BAN PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') as textocabezera,
             c50 as clavecontable,
             cf.cta_contable_ing as cuenta,
             r.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_sevial, 0, 9) AS asignacion,
             substr(r.concepto ,50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_externo_disp_tot r, cta_recaudo_fcm cf, concesionario c, fcm f, cta_dispersion_fcm cd
        where r.id_concesionario_liq = c.idconcesionario and
        cf.idbanco = r.ori_idbanco and
        cf.cuenta = r.ori_cuenta and
        cf.indtipo = r.indtipo and
        r.fec_dispersion = w_fec_cor_ini and
        f.nit_fcm = '8000826650' and
        cd.idbancorec = r.ori_idbanco and
        r.orden = 6;  


      w_concepto := 'Fcm Polca';
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
      select to_char(r.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             to_char(r.fec_dispersion, 'ddMMyyyy') as referencia,
             'BAN PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') as textocabezera,
             c50 as clavecontable,
             cf.cta_contable_ing as cuenta,
             r.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             substr(r.concepto ,50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_externo_disp_tot r, cta_recaudo_fcm cf, concesionario c, fcm f, cta_dispersion_fcm cd
        where r.id_concesionario_liq = c.idconcesionario and
        cf.idbanco = r.ori_idbanco and
        cf.cuenta = r.ori_cuenta and
        cf.indtipo = r.indtipo and
        r.fec_dispersion = w_fec_cor_ini and
        f.nit_fcm = '8000826650' and
        cd.idbancorec = r.ori_idbanco and
        r.orden =8;

    w_concepto := 'RETENCIONES DE SEVIAL DEL 2.7%';
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
      select to_char(s.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             c50 as clavecontable,
             c2905901007 as cuenta,
             s.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_sevial, 0, 9) AS asignacion,
             ('RETENCIONES DE SEVIAL DEL 2,7%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from (select sum(r.p_valor_21 + r.p_valor_22) as valor,
                     max(r.fec_dispersion) as fec_dispersion,
                     idconcesionario,
                     cta_recaudo
                from recaudo_local_liquidacion r
               where r.fec_dispersion = w_fec_cor_ini
               group by r.idconcesionario, r.cta_recaudo) s,
             concesionario c,
             fcm f
       where s.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650';
                   

    w_concepto := 'RETENCIONES DE SEVIAL DEL 2.7%';
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
      select to_char(s.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             c40 as clavecontable,
             c2905901007 as cuenta,
             s.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_sevial, 0, 9) AS asignacion,
             ('PAG RETENCIONES DE SEVIAL DEL 2,7%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from (select sum(r.p_valor_21 + r.p_valor_22) as valor,
                     max(r.fec_dispersion) as fec_dispersion,
                     idconcesionario,
                     cta_recaudo
                from recaudo_local_liquidacion r
               where r.fec_dispersion = w_fec_cor_ini
               group by r.idconcesionario, r.cta_recaudo) s,
             concesionario c,
             fcm f
       where s.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650';
         
    w_concepto := 'CRUCE CXC A SIMIT 2,7% + 1,8% + IVA';
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
      select to_char(s.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             fcm1 as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             c50 as clavecontable,
             c1470909002 as cuenta,
             s.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             ('CRUCE CXC A SIMIT 2,7% + 1,8% + IVA') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from (select sum(r.p_valor_16 + r.p_valor_17+r.p_valor_19 +r.p_valor_20) as valor,
                     idconcesionario,
                     cta_recaudo,
                     max(r.fec_dispersion) as fec_dispersion
                from recaudo_local_liquidacion r
               where r.fec_dispersion = w_fec_cor_ini
               group by r.idconcesionario, r.cta_recaudo) s,
             concesionario c,
             fcm f
       where s.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650';
  
   
    w_concepto := 'VALOR SEVIAL 2,7 CON IMPUESTOS';
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
      select to_char(s.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             fcm1 as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             c21 as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             s.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_sevial, 0, 9) AS asignacion,
             ('VALOR SEVIAL 2,7 CON IMPUESTOS') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from (select sum(r.p_valor_17 + r.p_valor_20 -
                          r.p_valor_21 - r.p_valor_22) as valor,
                     r.idconcesionario,
                     r.cta_recaudo as cta_recaudo,
                     max(r.fec_dispersion) as fec_dispersion,
                     max(r.nit_concesionario) as nitPago
                from recaudo_local_liquidacion r
               where r.fec_dispersion = w_fec_cor_ini
               group by r.idConcesionario, r.cta_recaudo) s,
             concesionario c,
             fcm f
       where s.idConcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650';
 
 
     w_concepto := 'TRANF FCM 1.8% REC POLCA CON IMPUESTOS';
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
      select to_char(s.fec_dispersion, 'ddMMyyyy') as fechadoc,
             zd as clasedoc,
             fcm1 as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             cop as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             c21 as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             s.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_sevial, 0, 9) AS asignacion,
             ('TRANF FCM 1.8% REC POLCA CON IMPUESTOS') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from (select sum(r.p_valor_16 + r.p_valor_19 +
                          r.p_valor_21 + r.p_valor_22) as valor,
                     r.idConcesionario as idConcesionario,
                     r.cta_recaudo as cta_recaudo,
                     max(r.fec_dispersion) as fec_dispersion,
                     max(r.nit_concesionario) as nitPago
                from recaudo_local_liquidacion r
               where r.fec_dispersion = w_fec_cor_ini
               group by r.idConcesionario, r.cta_recaudo) s,
             concesionario c,
             fcm f
       where s.idConcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650';
         
    update recaudo_externo_contabilidad r
       set r.importe = ROUND(r.importe, 0)
     where r.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
       and tipocontable = tipoCon;
  
    delete recaudo_externo_contabilidad r
     where r.importe = 0
       and r.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
       and tipocontable = tipoCon;
  
    update recaudo_externo_contabilidad r
       set r.receptoralternativo = ''
     where r.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
       and tipocontable = tipoCon
       and substr(r.nittercero, 0, 9) = substr(r.receptoralternativo, 0, 9);
  
     w_concepto := 'AJUSTE PESOS DETALLE pfc1';
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
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             cop as moneda,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(w_fec_cor_ini, 'ddMMyyyy'), 0, 25) as textocabezera,
             (case
               when a.importe < 0 then
                c50
               else
                c40
             end) as clavecontable,
             (case
               when a.importe < 0 then
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
             substr(f.nit_fcm, 0, 9) AS asignacion,
             ('AJUSTE PESOS') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from fcm f,
             (select max(c.textocabezera) as textocabezera,
                     sum(case c.clavecontable
                           when c40 then
                            c.importe
                           else
                            c.importe * -1
                         end) as importe
                from recaudo_externo_contabilidad c
               where c.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and c.sociedad = pfc1
                 and c.tipocontable = tipoCon
                 and c.cuenta = c2905901012) a
       where f.nit_fcm = '8000826650'
         and a.importe <> 0;
  
    w_concepto := 'AJUSTE PESOS deatlle pfc1';
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
             zd as clasedoc,
             pfc1 as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             cop as moneda,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(w_fec_cor_ini, 'ddMMyyyy'), 0, 25) as textocabezera,
             (case
               when a.importe < 0 then
                c40
               else
                c50
             end) as clavecontable,
             c2905901012 as cuenta,
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
             substr(f.nit_fcm, 0, 9) AS asignacion,
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
             (select max(c.textocabezera) as textocabezera,
                     sum(case c.clavecontable
                           when c40 then
                            c.importe
                           else
                            c.importe * -1
                         end) as importe
                from recaudo_externo_contabilidad c
               where c.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and c.sociedad = pfc1
                 and c.tipocontable = tipoCon
                 and c.cuenta = c2905901012) a
       where f.nit_fcm = '8000826650'
         and a.importe <> 0;
  
  
    w_concepto := 'AJUSTE PESOS fcm1 ';
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
             zd as clasedoc,
             fcm1 as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             cop as moneda,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(w_fec_cor_ini, 'ddMMyyyy'), 0, 25) as textocabezera,
             (case
               when a.importe > 0 then
                c50
               else
                c40
             end) as clavecontable,
             c1470901106 as cuenta,
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
             substr(f.nit_fcm, 0, 9) AS asignacion,
             ('AJUSTE PESOS') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from fcm f,
             (select sum(case c.clavecontable
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
           'Contabiliza Pago Rec Local',
           p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
           p_feccor_ini_dia);
  
    commit;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [contabiliza_pago_local] ' || SQLERRM,
            p_error);
    
  END contabiliza_pago_local;



PROCEDURE contabiliza_trf_siniden      (p_feccor_ini_ano number,
                                        p_feccor_ini_mes number,
                                        p_feccor_ini_dia number,
                                        p_feccor_fin_ano number,
                                        p_feccor_fin_mes number,
                                        p_feccor_fin_dia number,
                                        p_usuario        varchar2,
                                        p_error          OUT VARCHAR2) AS
    w_fec_cor_ini date;
    w_fec_cor_fin date;
    w_registros   number;
  
    w_fec_cor_ini_s char(8);
    w_fec_cor_fin_s char(8);
        
    tipoCon char(3);
    
    w_concepto      varchar(250);
  
    zt char(2);
    ze char(2);
    
    pfc1 char(4);
    fcm1 char(4);
    cop char(3);
    c50 char(2);
    c40 char(2);
    c31 char(2);
    c01 char(2);
    c11 char(2);
    c21 char(2);
    
    v5 char(2);

    c20211 char(5);
    c20212 char(5);
    c20213 char(5);
    c20214 char(5);

    c20221 char(5);
    c20222 char(5);
    c20223 char(5);
    c20224 char(5);
    
    c202213 char(6);


    c200102 char(6);
    c100761 char(6);
    
    cZ000 char(4);
    cZ002 char(4);
    
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
    
   
  BEGIN
  
    zt := 'ZT';
    ze := 'ZE';
    
    pfc1 := 'PFC1';
    fcm1 := 'FCM1';
    cop := 'COP';
    
    c50 := '50';
    c40 := '40';
    c31 := '31';
    c01 := '01';
    c11 := '11';
    c21 := '21';
    
    v5 := 'V5';
    
    
    c20211 := '20211';
    c20212 := '20212';
    c20213 := '20213';
    c20214 := '20214';

    c20221 := '20221';
    c20222 := '20222';
    c20223 := '20223';
    c20224 := '20224';
    
    c200102 := '200102';
    c202213 := '202213';
    c100761 := '100761';
    
    cZ000 := 'Z000';
    cZ002 := 'Z002';
    
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
    
    
    -- Obtiene fecha de cierre en formato ddMMyyyy
    select TO_DATE(p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
                   p_feccor_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_ini
      from DUAL;

    select TO_DATE(p_feccor_fin_ano || '-' || p_feccor_fin_mes || '-' ||
                   p_feccor_fin_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_fin
      from DUAL;
  
    select to_char(w_fec_cor_ini, 'ddMMyyyy')
      into w_fec_cor_ini_s
      from DUAL;

    select to_char(w_fec_cor_fin, 'ddMMyyyy')
      into w_fec_cor_fin_s
      from DUAL;
      
   tipoCon := 'TSI';
    
 
    -- elimina contabilizacion
    delete recaudo_externo_contabilidad
     where to_date(fechaDoc,'ddMMyyyy') >= w_fec_cor_ini and
       to_date(fechaDoc,'ddMMyyyy') <= w_fec_cor_fin 
       and tipoContable = tipoCon;
  
 
    w_concepto := 'NOMBRE BANCO CTA REC';
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
      select to_char(r.fechatrx, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechatrx, 'ddMMyyyy') as fechacontable,
             to_char(r.fechatrx, 'MM') as periodo,
             cop as moneda,
             to_char(r.numsecuenciareg,'0000000000') as referencia,
             ('REC ' || to_char(r.fechatrx, 'ddMMyyyy') || ' ' ||
             R.cuenta) as textocabezera,
             c40 as clavecontable,
             cr.cta_contable as cuenta,
             r.valortrx as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechatrx, 'ddMMyyyy') as fechavalor,
             to_char(r.fechatrx, 'ddMMyyyy') AS asignacion,
             b.nombre || ' ' || r.cuenta AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipocon as tipocontable
        from trxsinidentificar              r,
             banco                          b,
             fcm                            f,
             cta_recaudo_fcm                cr
       where r.idbanco = b.idbanco
         and r.fechatrx >= w_fec_cor_ini
         and r.fechatrx <= w_fec_cor_fin
         and r.estadoiden = 'SI'
         and cr.idbanco = r.idbanco
         and cr.cuenta = r.cuenta;
         

    w_concepto := 'NOMBRE BANCO CTA REC';
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
      select to_char(r.fechatrx, 'ddMMyyyy') as fechadoc,
             zt as clasedoc,
             pfc1 as sociedad,
             to_char(r.fechatrx, 'ddMMyyyy') as fechacontable,
             to_char(r.fechatrx, 'MM') as periodo,
             cop as moneda,
             to_char(r.numsecuenciareg,'0000000000') as referencia,
             ('REC ' || to_char(r.fechatrx, 'ddMMyyyy') || ' ' ||
             R.cuenta) as textocabezera,
             c50 as clavecontable,
             cr.cta_contable_ide as cuenta,
             r.valortrx as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fechatrx, 'ddMMyyyy') as fechavalor,
             to_char(r.fechatrx, 'ddMMyyyy') AS asignacion,
             b.nombre || ' ' || r.cuenta AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipocon as tipocontable
        from trxsinidentificar              r,
             banco                          b,
             fcm                            f,
             cta_recaudo_fcm                cr
       where r.idbanco = b.idbanco
         and r.idbanco = cr.idbanco        
         and r.cuenta = cr.cuenta
         and r.fechatrx >= w_fec_cor_ini
         and r.fechatrx <= w_fec_cor_fin
         and r.estadoiden = 'SI';
         
    commit;     
  
    select count(*)
    into w_registros
    from trxsinidentificar r
    where r.fechatrx >= w_fec_cor_ini
         and r.fechatrx <= w_fec_cor_fin
         and r.estadoiden = 'SI';
  
    p_error := 'Contabilidad Transacciones sin identificar OK. Registros procesados: ' ||
               w_registros;
  
    sp_log(p_usuario,
           'contabiliza_trf_siniden',
           p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
           p_feccor_ini_dia ||
           p_feccor_fin_ano || '-' || p_feccor_fin_mes || '-' ||
           p_feccor_fin_dia );
  
    commit;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [contabiliza_trf_siniden] ' || SQLERRM,
            p_error);
    
  END contabiliza_trf_siniden;
  
end PK_RECLOC;
/


spool off
