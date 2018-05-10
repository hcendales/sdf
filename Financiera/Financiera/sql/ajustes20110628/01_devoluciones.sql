--------------------------------------------
-- Export file for user SIMIT             --
-- Created by user on 28/06/2011, 8:08:59 --
--------------------------------------------

spool 01_devoluciones.log
prompt Dropping NOVDEVOLUCION...
drop table NOVDEVOLUCION cascade constraints;
prompt
prompt Creating table NOVDEVOLUCION
prompt ============================
prompt
create table NOVDEVOLUCION
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
  VADICIONAL           NUMBER
)
;
alter table NOVDEVOLUCION
  add constraint PK_NOVDEVOLUCION primary key (TIPONOV, NUMERONOV);
alter table NOVDEVOLUCION
  add constraint FK_NOVDEVBANCO foreign key (IDBANCO)
  references BANCO (IDBANCO);
alter table NOVDEVOLUCION
  add constraint FK_NOVDEVCONCES foreign key (IDCONCESIONARIO)
  references CONCESIONARIO (IDCONCESIONARIO);
alter table NOVDEVOLUCION
  add constraint FK_NOVDEVMUNICIPIO foreign key (IDMUNICIPIO)
  references MUNICIPIO (IDMUNICIPIO);
alter table NOVDEVOLUCION
  add constraint CH_NOVDEVTIPCOM
  check (indtipo in ('SIMIT', 'POLCA'));
alter table NOVDEVOLUCION
  add constraint CH_NOVDEVTIPCTA
  check (tipocuenta IN ('AHO','CTE'));

prompt
prompt Creating function FN_OBT_FECHA_PAGO
prompt ===================================
prompt
create or replace function FN_OBT_FECHA_PAGO(fecDisp date) return date is
  Result Date;
begin

  select max(fechaenvio)
  into Result
  from recaudo_externo_disp_tot
  where fec_dispersion = fecDisp;

  return(Result);

end FN_OBT_FECHA_PAGO;
/

prompt
prompt Creating view VW_DISTOTDETALLADO
prompt ================================
prompt
create or replace view vw_distotdetallado as
select l."ID_RECAUDO_EXTERNO_LIQUIDACION",l."ID_RECAUDO_EXTERNO",l."ID_CONCESIONARIO_PRO",l."ID_CONCESIONARIO_LIQ",l."INDTIPO",l."USUARIO_PROCESO",l."FECHA_PROCESO",l."IDMUNICIPIO",l."FEC_CORTE",l."IND_PROCESO",l."NUM_LIQUIDACION",l."DIAS_DISPERSION",l."FREC_DISPERSION",l."FEC_DISPERSION",l."IDBANCO",l."SMDLV",l."INDRETROACTIVIDAD",l."VALOR_TOTAL",l."VALOR_ADICIONAL",l."VALIDADOR_FECHA",l."INDFECHA2002",l."S_VALOR_0",l."S_VALOR_1",l."S_VALOR_2",l."S_VALOR_3",l."S_VALOR_4",l."S_VALOR_5",l."S_VALOR_6",l."S_VALOR_7",l."S_VALOR_8",l."S_VALOR_9",l."S_VALOR_10",l."S_VALOR_11",l."S_VALOR_12",l."S_VALOR_13",l."S_VALOR_14",l."S_VALOR_15",l."S_VALOR_16",l."S_VALOR_17",l."S_VALOR_18",l."S_VALOR_19",l."S_VALOR_20",l."S_VALOR_21",l."S_VALOR_22",l."S_VALOR_23",l."S_VALOR_24",l."S_VALOR_25",l."S_VALOR_26",l."S_VALOR_27",l."S_VALOR_28",l."CTA_RECAUDO",l."IND_BASE_TER1",l."IND_BASE_TER2",l."IND_BASE_TER3",l."IND_BASE_TER4",l."POR_BASE_TER1",l."POR_BASE_TER2",l."POR_BASE_TER3",
l."POR_BASE_TER4",l."S_VALOR_29",l."NOM_TER1",l."NOM_TER2",l."NOM_TER3",l."NOM_TER4",l."P_VALOR_1",l."P_VALOR_2",l."P_VALOR_3",l."P_VALOR_4",l."P_VALOR_5",l."P_VALOR_6",l."P_VALOR_7",l."P_VALOR_8",l."P_VALOR_9",l."P_VALOR_10",l."P_VALOR_11",l."P_VALOR_12",l."P_VALOR_13",l."P_VALOR_14",l."P_VALOR_15",l."P_VALOR_16",l."P_VALOR_17",l."P_VALOR_18",l."P_VALOR_19",l."P_VALOR_20",l."P_VALOR_21",l."P_VALOR_22",l."P_VALOR_23",l."P_VALOR_24",l."P_VALOR_25",l."P_VALOR_26",l."P_VALOR_27",l."P_VALOR_28",l."P_VALOR_29",l."P_VALOR_30",l."P_VALOR_31",l."P_VALOR_32",l."P_VALOR_33",l."P_VALOR_34",l."P_VALOR_35",l."P_VALOR_36",l."P_VALOR_37",l."P_VALOR_38",l."P_VALOR_39",l."P_VALOR_40",l."P_VALOR_41",l."P_VALOR_42",l."P_VALOR_43",l."S_VALOR_30",l."P_VALOR_44",l."FEC_DISPERSION_CON",l."NIT_MUNICIPIO",l."NIT_TERCERO1",l."NIT_TERCERO2",l."NIT_TERCERO3",l."NIT_TERCERO4",l."NIT_CONCESIONARIO",l."NIT_FONDO",l."NIT_CONCESIONARIOZON",
b.nombre as nomBanco,
c.nombre as nomConcesionario,
m.nombre as nomMunicipio,
(s_valor_26 + p_valor_39) as v_municipio,
(s_valor_19 + p_valor_32) as VTercero1,
(s_valor_21 + p_valor_34) as VTercero2,
r.identificacion,
r.num_comparendo,
l.idbancomun bancoMun,
bm.nombre nomBancoMun,
desencriptar(l.ctamun) as ctaMunicipio,
l.tipocuentamun as tipoctaMun,
fn_obt_fecha_pago(l.FEC_DISPERSION) as fechaPago,
r.fec_tran as fechaRecaudo
from
recaudo_externo_liquidacion l, banco b, concesionario c, municipio m, recaudo_externo r ,
banco bm
where l.idbanco = b.idbanco and l.ID_CONCESIONARIO_LIQ = c.idconcesionario and l.idmunicipio = m.idmunicipio and l.id_recaudo_externo = r.id_recaudo_externo
and l.idbancomun = bm.idbanco;
/

prompt
prompt Creating package PK_NOVDEV
prompt ==========================
prompt
create or replace package PK_NOVDEV is

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
prompt Creating package PK_REPROCESO
prompt =============================
prompt
create or replace package pk_reproceso is

  -- Author  : HUGO CENDALES P 
  -- Created : 24/06/2011 9:07:32
  -- Purpose : manejo de reprocesos de liquidacion

PROCEDURE carga_recaudo_externo_repro( 
                                        p_idbanco        varchar2,
                                        p_feccor_ini_ano number,
                                        p_feccor_ini_mes number,
                                        p_feccor_ini_dia number,
                                        p_feccor_fin_ano number,
                                        p_feccor_fin_mes number,
                                        p_feccor_fin_dia number,
                                        V_USUARIO        VARCHAR2,
                                        p_error          OUT VARCHAR2);
                                        
  PROCEDURE e_Reproceso(V_IDBANCO           VARCHAR2,
                        V_FECHA_COR_INI_ANO NUMBER,
                        V_FECHA_COR_INI_MES NUMBER,
                        V_FECHA_COR_INI_DIA NUMBER,
                        V_FECHA_COR_FIN_ANO NUMBER,
                        V_FECHA_COR_FIN_MES NUMBER,
                        V_FECHA_COR_FIN_DIA NUMBER,
                        V_USUARIO           VARCHAR2,
                        V_ERROR             OUT VARCHAR2,
                        V_LOG               OUT VARCHAR2);
end pk_reproceso;
/

prompt
prompt Creating package body PK_NOVDEV
prompt ===============================
prompt
create or replace package body PK_NOVDEV is
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

prompt
prompt Creating package body PK_REPROCESO
prompt ==================================
prompt
create or replace package body pk_reproceso is

  PROCEDURE carga_recaudo_externo_repro( 
                                        p_idbanco        varchar2,
                                        p_feccor_ini_ano number,
                                        p_feccor_ini_mes number,
                                        p_feccor_ini_dia number,
                                        p_feccor_fin_ano number,
                                        p_feccor_fin_mes number,
                                        p_feccor_fin_dia number,
                                        V_USUARIO        VARCHAR2,
                                        p_error          OUT VARCHAR2) AS
  
    w_fec_cor_ini     recaudo_externo.fec_corte%TYPE;
    w_fec_cor_fin     recaudo_externo.fec_corte%TYPE;
  
  BEGIN
  
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
  
    delete recaudo_externo
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and idbanco = p_idbanco;
  
    commit;
    
    if (p_idbanco = '50' or p_idbanco = '51' or p_idbanco = '52' ) then
        insert into recaudo_externo
          (id_recaudo_externo,
           idbanco,
           cta_recaudo,
           fec_corte,
           fec_tran,
           valor_efectivo,
           valor_cheque,
           valor_total,
           num_liquidacion,
           identificacion,
           idmunicipio,
           valor_adicional,
           iddepartamento,
           validador_fecha,
           indfecha2002)
          SELECT SEQ_RECAUDO_EXTERNO.NEXTVAL,
                 SUBSTR(b.cod_banco, 1, 2) cod_banco,
                 SUBSTR(b.cuenta, 1, 12) cuenta,
                 trunc(a.fecha_contable),
                 trunc(a.fecha_transaccion),
                 a.total_recaudo,
                 0,
                 a.total_recaudo,
                 SUBSTR(a.numero_referencia, 1, 10) numero_referencia,
                 a.identificacion,
                 SUBSTR(a.id_secretaria_origen, 1, 8) id_secretaria_origen,
                 a.valor_adicional,
                 SUBSTR(a.id_secretaria_origen, 1, 2) iddepartamento,
                 SUBSTR(a.validador_fecha, 1, 3),
                 a.indicador_fecha
            FROM quipux.simit_recaudo_detalle a, quipux.simit_recaudo b
           where a.id_procedencia_pago in ('2', '11')
             and a.consecutivo_recaudo = b.consecutivo_recaudo
             and b.cod_banco = p_idbanco
             and a.fecha_contable >= w_fec_cor_ini
             and a.fecha_contable <= w_fec_cor_fin;
    end if;
    
    if not (p_idbanco = '50' or p_idbanco = '51' or p_idbanco = '52') then
    
        insert into recaudo_externo
          (id_recaudo_externo,
           idbanco,
           cta_recaudo,
           fec_corte,
           fec_tran,
           valor_efectivo,
           valor_cheque,
           valor_total,
           num_liquidacion,
           identificacion,
           idmunicipio,
           valor_adicional,
           iddepartamento,
           validador_fecha,
           indfecha2002)
          SELECT SEQ_RECAUDO_EXTERNO.NEXTVAL,
                 SUBSTR(b.cod_banco, 1, 2) cod_banco,
                 SUBSTR(b.cuenta, 1, 12) cuenta,
                 trunc(c.fecha_carga),
                 trunc(a.fecha_transaccion),
                 a.total_recaudo,
                 0,
                 a.total_recaudo,
                 SUBSTR(a.numero_referencia, 1, 10) numero_referencia,
                 a.identificacion,
                 SUBSTR(a.id_secretaria_origen, 1, 8) id_secretaria_origen,
                 a.valor_adicional,
                 SUBSTR(a.id_secretaria_origen, 1, 2) iddepartamento,
                 SUBSTR(a.validador_fecha, 1, 3),
                 a.indicador_fecha
            FROM quipux.simit_recaudo_detalle   a,
                 quipux.simit_recaudo           b,
                 quipux.simit_carga_informacion c
           where a.id_procedencia_pago = '2'
             and a.consecutivo_recaudo = b.consecutivo_recaudo
             and b.cod_banco = p_idbanco
             and b.id_proceso_carga = c.id_proceso_carga
             and c.id_tipo_archivo in (4, 8)
             and trunc(c.fecha_carga) >= w_fec_cor_ini
             and trunc(c.fecha_carga) <= w_fec_cor_fin;
    
    end if;
    
    commit;
    
    -- actualiza cuenta de avvillas para completar datoñ  update recaudo_externo
  
    update recaudo_externo
       set cta_recaudo = '0' || cta_recaudo
     where substr(cta_recaudo, 1, 2) = '86'
       and fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and idbanco = p_idbanco;
  
    -- actualiza banco basado en la cuenta de recaudo
    update recaudo_externo r
       set r.idbanco = (select max(c.idbanco)
                          from cta_recaudo_concesionario c
                         where c.cuenta = r.cta_recaudo)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and idbanco = p_idbanco;
  
    -- actualiza validador si esta vacio
    update recaudo_externo
       set validador_fecha = '000'
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and validador_fecha is null
       and idbanco = p_idbanco;
  
    -- actualiza validador si esta vacio
    update recaudo_externo
       set indfecha2002 = '0'
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indfecha2002 is null
       and idbanco = p_idbanco;
  
    commit;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            V_USUARIO || ' [pk_reproceso.carga_recaudo_externo] ' ||
            SQLERRM,
            p_error);
    
  END carga_recaudo_externo_repro;

  PROCEDURE e_Reproceso(V_IDBANCO           VARCHAR2,
                        V_FECHA_COR_INI_ANO NUMBER,
                        V_FECHA_COR_INI_MES NUMBER,
                        V_FECHA_COR_INI_DIA NUMBER,
                        V_FECHA_COR_FIN_ANO NUMBER,
                        V_FECHA_COR_FIN_MES NUMBER,
                        V_FECHA_COR_FIN_DIA NUMBER,
                        V_USUARIO           VARCHAR2,
                        V_ERROR             OUT VARCHAR2,
                        V_LOG               OUT VARCHAR2) AS
  
    w_fecha_ini date;
    w_fecha_fin date;
    w_fecha_tra date;
    ano         number;
    mes         number;
    dia         number;
    
    v_finlinea VARCHAR2(2);
    v_numreg number;
    
    
    CURSOR tabla IS
     select distinct fec_dispersion
              from recaudo_externo_disp
             where fec_corte_ini >= w_fecha_ini
               and fec_corte_ini <= w_fecha_fin
               and ori_idbanco = V_IDBANCO;

    
  begin
     v_finlinea := chr(13) || chr(10);
   
     V_LOG := 'SE INICIA REPROCESO ' || v_finlinea;
     
  
    -- obtener fecha inicial y final del reproceso
    select TO_DATE(V_FECHA_COR_INI_ANO || '-' || V_FECHA_COR_INI_MES || '-' ||
                   V_FECHA_COR_INI_DIA,
                   'YYYY-MM-DD')
      into w_fecha_ini
      from DUAL;
  
    select TO_DATE(V_FECHA_COR_FIN_ANO || '-' || V_FECHA_COR_FIN_MES || '-' ||
                   V_FECHA_COR_FIN_DIA,
                   'YYYY-MM-DD')
      into w_fecha_fin
      from DUAL;
  
    -- verificar fecha dummy
    if (w_fecha_fin > sysdate + 365) then
      V_ERROR := 'Reproceso demasiado atras. Se debe ajustar proceso ';
      return;
    end if;
    
    -- verificar que no se tenga recaudo cargado para fecha dummy
    select count(*)
    into v_numreg
    from recaudo_externo
     where fec_corte >= w_fecha_ini + 365
       and fec_corte <= w_fecha_fin + 365;
 
    if (v_numreg > 0 ) then
      V_ERROR := 'Reproceso no posible. Ajsutar procedimiento. Aumentar fecha dummy ';
      return;
    end if;
    
  
    -- No mandar correos en el reproceso
    UPDATE FCM SET ENVIACORREO = 0;
    Commit;
  
    -- Cargar nuevamente recaudo para las fechas para el banco dado
    carga_recaudo_externo_repro(V_IDBANCO,
                                V_FECHA_COR_INI_ANO,
                                V_FECHA_COR_INI_MES,
                                V_FECHA_COR_INI_DIA,
                                V_FECHA_COR_FIN_ANO,
                                V_FECHA_COR_FIN_MES,
                                V_FECHA_COR_FIN_DIA,
                                V_USUARIO,
                                V_ERROR);
                                
                              
                                
    -- verificar error 
    if (v_error is not null) then
      return;
    end if;
  
    V_LOG := V_LOG || 'SE REPROCESO CARGUE OK ' || v_finlinea;

    -- borrar transferencias programadas generadas en la fecha de corte y del banco 
    delete from recaudo_externo_disp_tot
     where fec_dispersion in
           (select distinct fec_dispersion
              from recaudo_externo_disp
             where fec_corte_ini >= w_fecha_ini
               and fec_corte_ini <= w_fecha_fin
               and ori_idbanco = V_IDBANCO)
       and ori_idbanco = V_IDBANCO;
  
    -- borrar liquidaciones que se van a reprocesar 
    delete from recaudo_externo_liquidacion t
     where t.idbanco = V_IDBANCO
       and t.fec_corte >= w_fecha_ini
       and t.fec_corte <= w_fecha_fin;
       
    -- borar transferencias a realizar
    delete recaudo_externo_disp
     where fec_corte_ini >= w_fecha_ini
       and fec_corte_ini <= w_fecha_fin
       and ori_idbanco = V_IDBANCO;
  
    commit;

    V_LOG := V_LOG || 'SE ELIMINO INFORMACION OK ' || v_finlinea;
    
    -- duplicar recaudo con fecha de corte a un año para 
    -- ejecutar liquidacion sin afectar procesos actuales
    -- a la fecha de corte se le suma 365 dias
    insert into recaudo_externo
      (id_recaudo_externo,
       idbanco,
       cta_recaudo,
       fec_corte,
       fec_tran,
       oficina_origen,
       valor_efectivo,
       valor_cheque,
       valor_total,
       idmunicipio,
       valor_adicional,
       validador_fecha,
       indfecha2002,
       num_liquidacion,
       tipo_identificacion,
       identificacion,
       nombre_infractor,
       apellido_infractor,
       num_comparendo,
       fec_comparendo,
       num_resolucion,
       fec_resolucion,
       iddepartamento)
      select seq_recaudo_externo.nextval,
             idbanco,
             cta_recaudo,
             fec_corte + 365,
             fec_tran,
             oficina_origen,
             valor_efectivo,
             valor_cheque,
             valor_total,
             idmunicipio,
             valor_adicional,
             validador_fecha,
             indfecha2002,
             num_liquidacion,
             tipo_identificacion,
             identificacion,
             nombre_infractor,
             apellido_infractor,
             num_comparendo,
             fec_comparendo,
             num_resolucion,
             fec_resolucion,
             iddepartamento
        from recaudo_externo
       where idbanco = V_IDBANCO
         and fec_corte >= w_fecha_ini
         and fec_corte <= w_fecha_fin;
  
    commit;
  
    -- liquidar recaudos a reprocesar, los que tienen fecha dummy
    -- se liquida dia a dia 
    w_fecha_tra := w_fecha_ini + 365;
  
    while w_fecha_tra <= (w_fecha_fin + 365) loop
    
      V_ERROR := null;
    
      ano := to_number(to_char(w_fecha_tra, 'yyyy'));
      mes := to_number(to_char(w_fecha_tra, 'mm'));
      dia := to_number(to_char(w_fecha_tra, 'dd'));
    
      pk_proc.liquida_recaudo_externo(ano, mes, dia, V_USUARIO, V_ERROR);
   
      V_LOG := V_LOG || 'SE LIQUIDO : ' || TO_CHAR(w_fecha_tra,'yyyymmdd') || ':' || V_ERROR || v_finlinea;
    
      w_fecha_tra := w_fecha_tra + 1;
    
    end loop;
  
    V_ERROR := null;
    
    -- actualiza registros de liquidacion generados con fechas correctas
    update recaudo_externo_liquidacion
       set fec_corte          = fec_corte - 365,
           fec_dispersion     = fn_fec_dispersion(fec_dispersion - 365,0,0,V_USUARIO),
           fec_dispersion_con = fn_fec_dispersion(fec_dispersion_con - 365,0,0,V_USUARIO)
     where fec_corte >= w_fecha_ini
       and fec_corte <= w_fecha_fin
       and idbanco = V_IDBANCO;
  
    commit;
  
    -- actualiza registros de transferencia generados con fechas correctas
  
    update recaudo_externo_disp
       set fec_corte_ini  = fec_corte_ini - 365,
           fec_corte_fin  = fec_corte_fin - 365,
           fec_dispersion = fn_fec_dispersion( fec_dispersion - 3650,0,0,V_USUARIO)
     where fec_corte_ini >= w_fecha_ini + 365
       and fec_corte_fin <= w_fecha_fin + 365
       and ori_idbanco = V_IDBANCO;
  
    -- elimina registros duplicados para hacer el reproceso
    delete from recaudo_externo t
     where t.idbanco = V_IDBANCO
       and t.fec_corte = w_fecha_ini + 365
       and t.fec_corte = w_fecha_ini + 365;
    
    -- actualiza numero de recaudo externo asociado
    update recaudo_externo_liquidacion l
       set l.id_recaudo_externo = (select r.id_recaudo_externo
                                     from recaudo_externo r
                                    where r.num_liquidacion =
                                          l.num_liquidacion
                                      and r.idbanco = V_IDBANCO
                                      and r.fec_corte >= w_fecha_ini
                                      and r.fec_corte <= w_fecha_fin)
    
     where l.idbanco = V_IDBANCO
       and l.fec_corte >= w_fecha_ini
       and l.fec_corte <= w_fecha_fin;
  
    commit;
  
    V_LOG := V_LOG || 'SE AJUSTO INFORMACION OK ' || v_finlinea;
  
    -- reprocesa contabilidad
    w_fecha_tra := w_fecha_ini;
  
    while w_fecha_tra <= w_fecha_fin loop
    
      V_ERROR := null;
    
      ano := to_number(to_char(w_fecha_tra, 'yyyy'));
      mes := to_number(to_char(w_fecha_tra, 'mm'));
      dia := to_number(to_char(w_fecha_tra, 'dd'));
    
      pk_proc.contabiliza_recaudo_externo(ano,
                                          mes,
                                          dia,
                                          V_USUARIO,
                                          V_ERROR);
      
      V_LOG := V_LOG || 'SE CONTABILIZO  : ' || TO_CHAR(w_fecha_tra,'yyyymmdd') || ':' || V_ERROR || v_finlinea;
 
      dbms_output.put_line(V_ERROR);
    
      w_fecha_tra := w_fecha_tra + 1;
    
    end loop;
  
    V_ERROR := null;
  
    -- reprocesa transferencias generadas
    for registro in tabla loop
    
       w_fecha_tra := registro.fec_dispersion;
       V_ERROR := null;
       
       ano := to_number(to_char(registro.fec_dispersion, 'yyyy'));
      mes := to_number(to_char(registro.fec_dispersion, 'mm'));
      dia := to_number(to_char(registro.fec_dispersion, 'dd'));
  
       pk_proc.transferir_recaudo_externo(ano,mes,dia,V_USUARIO,V_ERROR);
       V_LOG := V_LOG || 'SE TRANSFIERE  : ' || TO_CHAR(w_fecha_tra,'yyyymmdd') || ':' || V_ERROR || v_finlinea;
       dbms_output.put_line(V_ERROR);
 
    end loop; 
  
    -- activar correos
    
    UPDATE FCM SET ENVIACORREO = 1;
    
    COMMIT;
 
    V_ERROR := 'Reproceso ok';
    
    V_LOG := V_LOG || 'REPROCESOCOMPLETADO ' || v_finlinea;
 
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            V_USUARIO || ' [pk_reproceso.e_Reproceso] ' || SQLERRM,
            V_ERROR);
    
  END e_Reproceso;

end pk_reproceso;
/


spool off
