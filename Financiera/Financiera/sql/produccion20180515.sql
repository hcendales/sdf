--------------------------------------------------
-- Export file for user SIMIT                   --
-- Created by Hugo on 15/05/2018, 09:00:14 a.m. --
--------------------------------------------------

set define off
spool produccion20180515.log

prompt
prompt Creating table DEPO_SIN_IDEN_TMP
prompt ================================
prompt
create table SIMIT.DEPO_SIN_IDEN_TMP
(
  idreg            NUMBER,
  idbanco          CHAR(2),
  cuenta           VARCHAR2(16),
  indtipo          CHAR(5),
  fechatransaccion DATE,
  valortotal       NUMBER,
  cuantia          NUMBER,
  numreg           NUMBER
)
;

prompt
prompt Creating table RECAUDO_LOCAL_LIQ_DSI
prompt ====================================
prompt
create table SIMIT.RECAUDO_LOCAL_LIQ_DSI
(
  idrecaudo_local_liq_dsi    NUMBER,
  idbanco                    CHAR(2),
  cta_recaudo                VARCHAR2(16),
  indtipo                    VARCHAR2(5),
  fec_corte                  DATE,
  fec_tran                   DATE,
  oficina_origen             VARCHAR2(250),
  valor_efectivo             NUMBER,
  valor_cheque               NUMBER,
  valor_total                NUMBER,
  nit_m                      VARCHAR2(10),
  idmunicipio                CHAR(8),
  iddepartamento             CHAR(2),
  usuario_proceso            VARCHAR2(20),
  fecha_proceso              DATE,
  ind_proceso                NUMBER,
  indorigen                  CHAR(3),
  idconcesionario            CHAR(2),
  dias_dispersion            NUMBER,
  frec_dispersion            NUMBER,
  fec_dispersion             DATE,
  s_valor_0                  NUMBER default 0,
  s_valor_1                  NUMBER default 0,
  s_valor_2                  NUMBER default 0,
  s_valor_3                  NUMBER default 0,
  s_valor_4                  NUMBER default 0,
  s_valor_5                  NUMBER default 0,
  s_valor_6                  NUMBER default 0,
  p_valor_7                  NUMBER default 0,
  p_valor_8                  NUMBER default 0,
  p_valor_9                  NUMBER default 0,
  p_valor_10                 NUMBER default 0,
  p_valor_11                 NUMBER default 0,
  p_valor_12                 NUMBER default 0,
  p_valor_13                 NUMBER default 0,
  p_valor_14                 NUMBER default 0,
  p_valor_15                 NUMBER default 0,
  p_valor_16                 NUMBER default 0,
  p_valor_17                 NUMBER default 0,
  p_valor_18                 NUMBER default 0,
  p_valor_19                 NUMBER default 0,
  p_valor_20                 NUMBER default 0,
  p_valor_21                 NUMBER default 0,
  p_valor_22                 NUMBER default 0,
  p_valor_23                 NUMBER default 0,
  p_valor_24                 NUMBER default 0,
  p_valor_25                 NUMBER default 0,
  p_valor_26                 NUMBER default 0,
  p_valor_27                 NUMBER default 0,
  p_valor_28                 NUMBER default 0,
  p_consignado               NUMBER,
  idrecaudolocal_liquidacion NUMBER,
  nit_concesionario          CHAR(10),
  nit_fondo                  CHAR(10),
  fondorenovacion            NUMBER,
  fondorenov27               NUMBER,
  fondorenov3                NUMBER,
  fondorenov35               NUMBER,
  fondorenov7                NUMBER,
  periodo                    CHAR(6),
  quincena                   CHAR(2),
  vigencia                   VARCHAR2(500),
  fec_vig_ini                DATE,
  fec_vig_fin                DATE
)
;
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.idrecaudo_local_liq_dsi
  is 'autonumerico';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.idbanco
  is 'banco';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.cta_recaudo
  is 'cuenta recaudo';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.indtipo
  is 'tipo de recuado (SIMIT, POLCA)';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.fec_corte
  is 'fecha de corte';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.fec_tran
  is 'fecha de transaccion';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.oficina_origen
  is 'oficina origen';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.valor_efectivo
  is 'valor efectivo';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.valor_cheque
  is 'valor cheque';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.valor_total
  is 'valor total';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.nit_m
  is 'nit municipio';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.idmunicipio
  is 'municipio';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.iddepartamento
  is 'departamento';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.usuario_proceso
  is 'usuario proceso';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.fecha_proceso
  is 'fecha de proceso';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.ind_proceso
  is 'indicador de proceso';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.indorigen
  is 'indicador origen (REC, AJU)';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.idconcesionario
  is 'concesionario';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.dias_dispersion
  is 'dias de dispersion';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.frec_dispersion
  is 'frecuencia de dispersion';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.fec_dispersion
  is 'fecha de dispersion';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.s_valor_0
  is 'comsion recaudo';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.s_valor_1
  is 'valor simit';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.s_valor_2
  is 'valor concesionario';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.s_valor_3
  is 'valro fondo cobertura concesionario';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.s_valor_4
  is 'valor fondo cobertura simit';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.s_valor_5
  is 'equilibrio economico';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.s_valor_6
  is 'valor neto concesionario';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.p_valor_7
  is 'valor simit pm';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.p_valor_8
  is 'valor concesionario';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.p_valor_9
  is 'valor fondo cobertura concesioanrio';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.p_valor_10
  is 'valor fondo cobertura simit';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.p_valor_11
  is 'equilibrio economico pm';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.p_valor_12
  is 'valor simit pp';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.p_valor_13
  is 'valor sevial ';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.p_valor_14
  is 'equilibrio economico pp';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.p_valor_15
  is 'polca';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.p_valor_16
  is 'fcm';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.p_valor_17
  is 'sevial';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.p_valor_18
  is 'equilibrio economico cp';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.p_valor_19
  is 'iva fcm';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.p_valor_20
  is 'iva sevial';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.p_valor_21
  is 'retencion sevial';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.p_valor_22
  is 'timbre sevial';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.p_valor_23
  is 'timbre fcm';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.p_valor_24
  is 'valor neto sevial';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.p_valor_25
  is 'valor neto concesionario';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.p_valor_26
  is 'valor neto fcm';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.p_valor_27
  is 'valor neto simit';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.p_valor_28
  is 'valor neto equilibrio economico';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.p_consignado
  is 'porcentaje consignado';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.idrecaudolocal_liquidacion
  is 'REFEREFENCIA PARA CONTABILIZAR';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.nit_concesionario
  is 'NIT CONCESIONARIO';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.nit_fondo
  is 'Nit fondo';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.fondorenovacion
  is 'Valor hacia fondo de renovacion';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.fondorenov27
  is 'Valor hacia fondo de renovacion por 27';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.fondorenov3
  is 'Valor hacia fondo de renovacion por 3';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.fondorenov35
  is 'Valor hacia fondo de renovacion por 35';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.fondorenov7
  is 'Valor hacia fondo de renovacion por 7';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.periodo
  is 'Periodo aaaamm';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.quincena
  is 'Quincena 15 o 30';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.vigencia
  is 'Vigencia';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.fec_vig_ini
  is 'Fecha de vigencia inicial';
comment on column SIMIT.RECAUDO_LOCAL_LIQ_DSI.fec_vig_fin
  is 'Fecha de vigencia final';

prompt
prompt Creating sequence SEQ_DEPOS_SIN_IDENT
prompt =====================================
prompt
create sequence SIMIT.SEQ_DEPOS_SIN_IDENT
minvalue 1
maxvalue 9999999999999999999999999999
start with 2741
increment by 1
cache 20;

prompt
prompt Creating view VW_LIQ_POLCA_LOC_DEPOS
prompt ====================================
prompt
create or replace force view simit.vw_liq_polca_loc_depos as
select
       r.indorigen Origen,
       r.indTipo Tipo,
       r.idbanco,
       b.nombre Banco,
       'SIN CONCESIONARIO' Operador,
       '00000000' DIVIPO,
       'SIN MUNICIPIO' Municipio,
       'SIN DPTO' Departamento,
       r.cta_recaudo CuentaRecaudo,
       r.fec_corte FechaCorte,
       r.fec_tran FechaTransaccion,
       r.oficina_origen Oficina,
       r.valor_total VrRecaudo,
       r.fec_dispersion FechaDispersion,
       r.s_valor_0 ComisionRecaudo,
       r.p_valor_7 SimitPM,
       r.p_valor_8 Concesionario,
       r.p_valor_9 FondoConcesionario,
       r.p_valor_10 FondoSimit,
       r.p_valor_11 EquilibrioEconomicoPM,
       r.p_valor_12 SimtPP,
       r.p_valor_13 SevialPP,
       r.p_valor_14 EquilibrioEconomicoPP,
       r.p_valor_15 Polca,
       r.p_valor_16 FcmCP,
       r.p_valor_17 SevialCP,
       r.p_valor_18 EquilibrioEconomicoCP,
       ( r.p_valor_13 + r.p_valor_17 ) Sevial,
       r.p_valor_19 IvaFCM,
       r.p_valor_20 IvaSevial,
       r.p_valor_21 RetencionSevial,
       r.p_valor_22 TimbreSevial,
       r.p_valor_23 TimbreFcm,
       r.p_valor_24 NetoSevial,
       r.p_valor_25 NetoConcesionario,
       r.p_valor_26 NetoFCM,
       r.p_valor_27 NetoSimit,
       r.p_valor_28 NetoEquilibrioEconomico,
       r.ind_proceso,
       r.idrecaudo_local_liq_dsi,
       r.vigencia,
       r.fec_vig_ini,
       r.fec_vig_fin,
       r.p_consignado,
       'M' tipofechacorte

from recaudo_local_liq_dsi r,
     banco b
where b.idbanco = r.idbanco
      and r.indtipo = 'POLCA';

prompt
prompt Creating view VW_LIQ_SIMIT_LOC_DEPOS
prompt ====================================
prompt
create or replace force view simit.vw_liq_simit_loc_depos as
select
       r.indorigen Origen,
       r.indTipo Tipo,
       r.idbanco,
       b.nombre Banco,
       '00' idconcesionario,
       'SIN CONCESIONARIO'  Operador,
       '00000000' DIVIPO,
       'SIN MUNICIPIO' Municipio,
       'SIN DPTO' Departamento,
       r.cta_recaudo CuentaRecaudo,
       r.fec_corte FechaCorte,
       r.fec_tran FechaTransaccion,
       r.oficina_origen Oficina,
       r.valor_total VrRecaudo,
       r.fec_dispersion FechaDispersion,
       r.s_valor_0 ComisionRecaudo,
       r.s_valor_1 Simit,
       r.s_valor_2 Concesionario,
       r.s_valor_3 FondoConcesionario,
       r.s_valor_4 FondoSimit,
       r.s_valor_5 EquilibrioEconomico,
       r.s_valor_6 NetoConcesionario,
       r.ind_proceso,
       r.idrecaudo_local_liq_dsi,
       r.vigencia,
       r.fec_vig_ini,
       r.fec_vig_fin
from recaudo_local_liq_dsi r,
       banco b
where b.idbanco = r.idbanco
       and r.indtipo = 'SIMIT';

prompt
prompt Creating package PK_PROC
prompt ========================
prompt
CREATE OR REPLACE PACKAGE SIMIT."PK_PROC" is

  -- Author  : Ricardo Buitrago Lizarazo
  -- Created : 18/04/2007 10:14:23 a.m.
  -- Purpose :

  -- Public type declarations
  TYPE cursor_t_salida IS REF CURSOR;

  -- Public variable declarations
  v_error   NUMBER := 0;
  v_message VARCHAR2(255);

  MSG_UPD_OK VARCHAR2(255) := 'Registro Actualizado Correctamente';
  MSG_INS_OK VARCHAR2(255) := 'Registro Insertado Correctamente';
  MSG_DEL_OK VARCHAR2(255) := 'Registro Eliminado Correctamente';

  -- Public function and procedure declarations
  PROCEDURE i_archivo(p_filename varchar2,
                      p_cfile    clob,
                      p_usuario  varchar2,
                      p_error    OUT VARCHAR2);

  PROCEDURE v_archivoBin(p_uploadid number,
                         p_usuario  varchar2,
                         p_error    OUT VARCHAR2);

  PROCEDURE i_archivoBin(p_filename varchar2,
                         p_bfile    blob,
                         p_usuario  varchar2,
                         p_error    OUT VARCHAR2);

  PROCEDURE v_archivo(p_tipoCargue      varchar2,
                      p_uploadid        number,
                      p_idbanco         char,
                      p_cta_recaudo_fcm varchar2,
                      p_usuario         varchar2,
                      p_error           OUT VARCHAR2);

  PROCEDURE cargarDeposSinIden(p_uploadid        NUMBER,
                              p_usuario         varchar2,
                              p_error           OUT VARCHAR2);
                              
  PROCEDURE q_NovValidador_fecha(p_tiponov                  varchar2,
                                 p_numeronov                number,
                                 p_usuario                  varchar2,
                                 p_idmunicipio              out char,
                                 p_idvalidador              out char,
                                 p_indTipo                  out char,
                                 p_fecha_ini                out date,
                                 p_fecha_fin                out date,
                                 p_p_municipio              out number,
                                 p_p_fcm_contravencional    out number,
                                 p_p_conces_contravencional out number,
                                 p_p_acuerdopago            out number,
                                 p_nit_tercero1             out varchar2,
                                 p_base_tercero1            out number,
                                 p_ind_base_tercero1        out number,
                                 p_nit_tercero2             out varchar2,
                                 p_base_tercero2            out number,
                                 p_ind_base_tercero2        out number,
                                 p_fechaact                 out date,
                                 p_firma1                   out varchar2,
                                 p_firma2                   out varchar2,
                                 p_estadonov                out varchar2,
                                 p_error                    OUT VARCHAR2);
  PROCEDURE i_NovValidador_fecha(p_idmunicipio              char,
                                 p_idvalidador              char,
                                 p_indTipo                  char,
                                 p_fecha_ini_ano            number,
                                 p_fecha_ini_mes            number,
                                 p_fecha_ini_dia            number,
                                 p_fecha_fin_ano            number,
                                 p_fecha_fin_mes            number,
                                 p_fecha_fin_dia            number,
                                 p_p_municipio              number,
                                 p_p_fcm_contravencional    number,
                                 p_p_conces_contravencional number,
                                 p_p_acuerdopago            number,
                                 p_nit_tercero1             varchar2,
                                 p_base_tercero1            number,
                                 p_ind_base_tercero1        number,
                                 p_nit_tercero2             varchar2,
                                 p_base_tercero2            number,
                                 p_ind_base_tercero2        number,
                                 p_usuario                  varchar2,
                                 p_tiponov                  varchar2,
                                 p_fecha_act_ano            number,
                                 p_fecha_act_mes            number,
                                 p_fecha_act_dia            number,
                                 p_firma1                   varchar2,
                                 p_firma2                   varchar2,
                                 p_error                    OUT VARCHAR2,
                                 p_novedad                  OUT varchar2);
  PROCEDURE q_NovValidador_fechaE(p_tiponov   varchar2,
                                  p_numeronov number,
                                  p_usuario   varchar2,
                                  p_estadonov out varchar2,
                                  p_error     OUT VARCHAR2);
  PROCEDURE u_NovValidador_fechaEst(p_tiponov   varchar2,
                                    p_numeronov number,
                                    p_usuario   varchar2,
                                    p_estado    varchar2,
                                    p_error     OUT VARCHAR2);

  PROCEDURE i_Novmunicipio(p_idmunicipio              varchar2,
                           p_nit_m                    varchar2,
                           p_nombre                   varchar2,
                           p_idconcesionario          varchar2,
                           p_correo                   varchar2,
                           p_indretroactividad        number,
                           p_indliq_s_ext             number,
                           p_indliq_s_local           number,
                           p_indliq_p_ext             number,
                           p_indliq_p_local           number,
                           p_indAcuerdoPago_2002      number,
                           p_idbanco                  varchar2,
                           p_tipocuenta               varchar2,
                           p_cuenta                   varchar2,
                           p_nit_cta                  varchar2,
                           p_municipio_s              number,
                           p_fcm_contravencional_s    number,
                           p_conces_contravencional_s number,
                           p_acuerdopago_s            number,
                           p_municipio_p              number,
                           p_fcm_contravencional_p    number,
                           p_conces_contravencional_p number,
                           p_acuerdopago_p            number,
                           p_usuario                  varchar2,
                           p_fecha_act_ano            number,
                           p_fecha_act_mes            number,
                           p_fecha_act_dia            number,
                           p_firma1                   varchar2,
                           p_firma2                   varchar2,
                           p_dnsAvvillas              varchar2,
                           p_dnsDavivienda            varchar2,
                           p_error                    OUT VARCHAR2,
                           p_novedad                  OUT varchar2

                           );

  PROCEDURE q_Novmunicipio(p_tiponov                  varchar2,
                           p_numeronov                varchar2,
                           p_usuario                  varchar2,
                           p_idmunicipio              out varchar2,
                           p_nit_m                    out varchar2,
                           p_nombre                   out varchar2,
                           p_idconcesionario          out varchar2,
                           p_correo                   out varchar2,
                           p_indretroactividad        out number,
                           p_indliq_s_ext             out number,
                           p_indliq_s_local           out number,
                           p_indliq_p_ext             out number,
                           p_indliq_p_local           out number,
                           p_indAcuerdoPago_2002      out number,
                           p_idbanco                  out varchar2,
                           p_tipocuenta               out varchar2,
                           p_cuenta                   out varchar2,
                           p_nit_cta                  out varchar2,
                           p_municipio_s              out number,
                           p_fcm_contravencional_s    out number,
                           p_conces_contravencional_s out number,
                           p_acuerdopago_s            out number,
                           p_municipio_p              out number,
                           p_fcm_contravencional_p    out number,
                           p_conces_contravencional_p out number,
                           p_acuerdopago_p            out number,
                           p_fechaact                 out date,
                           p_firma1                   out varchar2,
                           p_firma2                   out varchar2,
                           p_estadonov                out varchar2,
                           p_dnsAvvilas               out varchar2,
                           p_dnsGranbanco             out varchar2,
                           p_error                    OUT VARCHAR2);

  PROCEDURE q_NovmunicipioE(p_tiponov   varchar2,
                            p_numeronov number,
                            p_usuario   varchar2,
                            p_estadonov out varchar2,
                            p_error     OUT VARCHAR2);
  PROCEDURE u_Novmunicipio(p_idmunicipio              varchar2,
                           p_nit_m                    varchar2,
                           p_nombre                   varchar2,
                           p_idconcesionario          varchar2,
                           p_correo                   varchar2,
                           p_indretroactividad        number,
                           p_indliq_s_ext             number,
                           p_indliq_s_local           number,
                           p_indliq_p_ext             number,
                           p_indliq_p_local           number,
                           p_indAcuerdoPago_2002      number,
                           p_idbanco                  varchar2,
                           p_tipocuenta               varchar2,
                           p_cuenta                   varchar2,
                           p_nit_cta                  varchar2,
                           p_municipio_s              number,
                           p_fcm_contravencional_s    number,
                           p_conces_contravencional_s number,
                           p_acuerdopago_s            number,
                           p_municipio_p              number,
                           p_fcm_contravencional_p    number,
                           p_conces_contravencional_p number,
                           p_acuerdopago_p            number,
                           p_usuario                  varchar2,
                           p_fecha_act_ano            number,
                           p_fecha_act_mes            number,
                           p_fecha_act_dia            number,
                           p_firma1                   varchar2,
                           p_firma2                   varchar2,
                           p_dnsAvvillas              varchar2,
                           p_dnsDavivienda            varchar2,
                           p_error                    OUT VARCHAR2,
                           p_novedad                  out varchar2);

  PROCEDURE u_NovmunicipioEst(p_tiponov   varchar2,
                              p_numeronov varchar2,
                              p_usuario   varchar2,
                              p_estado    varchar2,
                              p_error     OUT VARCHAR2);

  PROCEDURE q_NovDiasDispersionE(p_tiponov   varchar2,
                                 p_numeronov number,
                                 p_usuario   varchar2,
                                 p_estadonov out varchar2,
                                 p_error     OUT VARCHAR2);

  PROCEDURE i_NovDiasDispersion(p_idmunicipio        char,
                                p_idbanco            char,
                                p_dias_dispersion_se number,
                                p_dias_dispersion_sl number,
                                p_dias_dispersion_pe number,
                                p_dias_dispersion_pl number,
                                p_frec_dispersion_se number,
                                p_frec_dispersion_sl number,
                                p_frec_dispersion_pe number,
                                p_frec_dispersion_pl number,
                                p_usuario            varchar2,
                                p_tiponov            varchar2,
                                p_fecha_act_ano      number,
                                p_fecha_act_mes      number,
                                p_fecha_act_dia      number,
                                p_firma1             varchar2,
                                p_firma2             varchar2,
                                p_nombre             varchar2,
                                p_dnsAvvillas        varchar2,
                                p_dnsGranbanco       varchar2,
                                p_error              OUT VARCHAR2,
                                p_novedad            OUT varchar2);

  PROCEDURE q_NovDiasDispersion(p_tiponov            varchar2,
                                p_numeronov          number,
                                p_usuario            varchar2,
                                p_idmunicipio        out char,
                                p_idbanco            out char,
                                p_dias_dispersion_se out number,
                                p_dias_dispersion_sl out number,
                                p_dias_dispersion_pe out number,
                                p_dias_dispersion_pl out number,
                                p_frec_dispersion_se out number,
                                p_frec_dispersion_sl out number,
                                p_frec_dispersion_pe out number,
                                p_frec_dispersion_pl out number,
                                p_fechaact           out date,
                                p_firma1             out varchar2,
                                p_firma2             out varchar2,
                                p_estadonov          out varchar2,
                                p_error              OUT VARCHAR2);

  PROCEDURE u_NovDiasDispersionEst(p_tiponov   varchar2,
                                   p_numeronov number,
                                   p_usuario   varchar2,
                                   p_estado    varchar2,
                                   p_error     OUT VARCHAR2);

  PROCEDURE q_NovterceroE(p_tiponov   varchar2,
                          p_numeronov number,
                          p_usuario   varchar2,
                          p_estadonov out varchar2,
                          p_error     OUT VARCHAR2);
  PROCEDURE q_Novtercero(p_tiponov       varchar2,
                         p_numeronov     number,
                         p_usuario       varchar2,
                         p_idmunicipio   out varchar2,
                         p_nit_t         out varchar2,
                         p_nombre        out varchar2,
                         p_correoTercero out varchar2,
                         p_idbanco       out varchar2,
                         p_tipocuenta    out varchar2,
                         p_cuenta        out varchar2,
                         p_base_s        out number,
                         p_base_p        out number,
                         p_ind_base      out number,
                         p_num_tercero   out number,
                         p_fechaact      out date,
                         p_firma1        out varchar2,
                         p_firma2        out varchar2,
                         p_estadonov     out varchar2,
                         p_error         OUT VARCHAR2);

  PROCEDURE u_NovtercerosEst(p_tiponov   varchar2,
                             p_numeronov number,
                             p_usuario   varchar2,
                             p_estado    varchar2,
                             p_error     OUT VARCHAR2);

  PROCEDURE i_Novterceros(p_idmunicipio   char,
                          p_nit_t         char,
                          p_nombre        varchar2,
                          p_correoTercero varchar2,
                          p_idbanco       char,
                          p_tipocuenta    char,
                          p_cuenta        varchar2,
                          p_base_s        number,
                          p_base_p        number,
                          p_ind_base      number,
                          p_num_tercero   number,
                          p_usuario       varchar2,
                          p_tiponov       varchar2,
                          p_fecha_act_ano number,
                          p_fecha_act_mes number,
                          p_fecha_act_dia number,
                          p_firma1        varchar2,
                          p_firma2        varchar2,
                          p_dnsavvillas   varchar2,
                          p_dnsgranbanco  varchar2,
                          p_error         OUT VARCHAR2,
                          p_novedad       OUT varchar2);

  PROCEDURE aprobar_reproceso(p_fec_ini_ano number,
                              p_fec_ini_mes number,
                              p_fec_ini_dia number,
                              p_tipo        varchar2,
                              p_motivo      varchar2,
                              p_usuario     varchar2,
                              p_error       OUT VARCHAR2);

  PROCEDURE l_recaudo_local(p_fec_ini_ano number,
                            p_fec_ini_mes number,
                            p_fec_ini_dia number,
                            p_fec_fin_ano number,
                            p_fec_fin_mes number,
                            p_fec_fin_dia number,
                            p_banco       varchar2,
                            p_usuario     varchar2,
                            p_error       OUT VARCHAR2);

  PROCEDURE carga_recaudo_externo(p_feccor_ini_ano number,
                                  p_feccor_ini_mes number,
                                  p_feccor_ini_dia number,
                                  p_feccor_fin_ano number,
                                  p_feccor_fin_mes number,
                                  p_feccor_fin_dia number,
                                  p_usuario        varchar2,
                                  p_error          OUT VARCHAR2);

  PROCEDURE carga_recaudo_externo_batch(p_feccor_ini date,
                                        p_feccor_fin date,
                                        p_usuario    varchar2,
                                        p_error      OUT VARCHAR2);

  PROCEDURE liquida_recaudo_externo(p_feccor_ini_ano number,
                                    p_feccor_ini_mes number,
                                    p_feccor_ini_dia number,
                                    p_usuario        varchar2,
                                    p_error          OUT VARCHAR2);

  PROCEDURE transferir_recaudo_externo(p_fec_ini_ano number,
                                       p_fec_ini_mes number,
                                       p_fec_ini_dia number,
                                       p_usuario     varchar2,
                                       p_error       OUT VARCHAR2);

  /*PROCEDURE transferir_rec_ext_conFecha(p_fec_ini_ano number,
  p_fec_ini_mes number,
  p_fec_ini_dia number,
  p_usuario     varchar2,
  p_error       OUT VARCHAR2);*/

  procedure sp_liquida_recaudo_local(p_fec_ini date,
                                     p_fec_fin date,
                                     p_banco   varchar2,
                                     p_usuario varchar2,
                                     p_error   OUT VARCHAR2);

  PROCEDURE dispersa_recaudo_local(p_fec_ini_ano number,
                                   p_fec_ini_mes number,
                                   p_fec_ini_dia number,
                                   p_fec_fin_ano number,
                                   p_fec_fin_mes number,
                                   p_fec_fin_dia number,
                                   p_banco       varchar2,
                                   p_usuario     varchar2,
                                   p_error       OUT VARCHAR2);

  PROCEDURE dispersa_recaudo_externo(p_fec_ini_ano number,
                                     p_fec_ini_mes number,
                                     p_fec_ini_dia number,
                                     p_usuario     varchar2,
                                     p_error       OUT VARCHAR2);

  PROCEDURE generarArchivoAvvillas(p_fecha   date,
                                   p_usuario varchar2,
                                   p_error   OUT VARCHAR2);

  PROCEDURE generarArchivoDavivienda(p_fecha   date,
                                     p_usuario varchar2,
                                     p_error   OUT VARCHAR2);

  PROCEDURE generarArchivoBogota(p_fecha   date,
                                 p_usuario varchar2,
                                 p_error   OUT VARCHAR2);

  PROCEDURE envio_Banco(p_fec_ini_ano number,
                        p_fec_ini_mes number,
                        p_fec_ini_dia number,
                        p_idbanco     varchar2,
                        p_usuario     varchar2,
                        p_error       OUT VARCHAR2,
                        p_log         out varchar2);

  PROCEDURE generarScriptAvvillas(p_fecha   date,
                                  p_usuario varchar2,
                                  p_error   OUT VARCHAR2);

  PROCEDURE generarScriptDavivienda(p_fecha   date,
                                    p_usuario varchar2,
                                    p_error   OUT VARCHAR2);

  PROCEDURE ejecutarScriptAvvillas(p_fecha   date,
                                   p_usuario varchar2,
                                   p_error   OUT VARCHAR2);

  PROCEDURE ejecutarScriptDavivienda(p_fecha   date,
                                     p_usuario varchar2,
                                     p_error   OUT VARCHAR2);

  PROCEDURE ejecutarScriptBogota(p_fecha   date,
                                 p_usuario varchar2,
                                 p_error   OUT VARCHAR2);

  PROCEDURE verLogEnvioAvvillas(salida OUT VARCHAR2);

  PROCEDURE verLogEnvioDavivienda(salida OUT VARCHAR2);

  PROCEDURE verLogEnvioBogota(salida OUT VARCHAR2);

  procedure aplicaNovedadesMunicipio(p_fecha date);

  procedure aplicaNovedadesDiasMunicipio(p_fecha date);

  procedure aplicaNovedadesTercero(p_fecha date);

  PROCEDURE valida_transferencia(p_fec_ini_ano number,
                                 p_fec_ini_mes number,
                                 p_fec_ini_dia number,
                                 p_usuario     varchar2,
                                 p_error       OUT VARCHAR2);

  PROCEDURE ejecutarDesencripta(p_fecha   date,
                                p_usuario varchar2,
                                p_idbanco varchar2,
                                p_error   OUT VARCHAR2,
                                salida    OUT VARCHAR2);

  PROCEDURE desencripta_Banco(p_fec_ini_ano number,
                              p_fec_ini_mes number,
                              p_fec_ini_dia number,
                              p_idbanco     varchar2,
                              p_usuario     varchar2,
                              p_error       OUT VARCHAR2,
                              p_log         out varchar2);

  PROCEDURE verLogDesencripta(p_idbanco varchar2, salida OUT VARCHAR2);
  PROCEDURE envio_Banco_repro(p_fec_ini_ano number,
                              p_fec_ini_mes number,
                              p_fec_ini_dia number,
                              p_fec_fin_ano number,
                              p_fec_fin_mes number,
                              p_fec_fin_dia number,
                              p_idbanco     varchar2,
                              p_usuario     varchar2,
                              p_error       OUT VARCHAR2,
                              p_log         out varchar2);

  PROCEDURE generarArchivoAvvillas_repro(p_fecha_ini date,
                                         p_fecha_fin date,
                                         p_usuario   varchar2,
                                         p_error     OUT VARCHAR2);

  PROCEDURE generarArchivoDavivienda_repro(p_fecha_ini date,
                                           p_fecha_fin date,
                                           p_usuario   varchar2,
                                           p_error     OUT VARCHAR2);

  PROCEDURE generarArchivoBogota_repro(p_fecha_ini date,
                                       p_fecha_fin date,
                                       p_usuario   varchar2,
                                       p_error     OUT VARCHAR2);

  PROCEDURE i_recaudo_local_ajustes(

                                    p_idbanco       char,
                                    p_cta_recaudo   varchar2,
                                    p_indtipo       char,
                                    p_fec_corte_ano number,
                                    p_fec_corte_mes number,
                                    p_fec_corte_dia number,
                                    p_fec_tran_ano  number,
                                    p_fec_tran_mes  number,
                                    p_fec_tran_dia  number,

                                    p_vig_ini_ano number,
                                    p_vig_ini_mes number,
                                    p_vig_ini_dia number,

                                    p_vig_fin_ano number,
                                    p_vig_fin_mes number,
                                    p_vig_fin_dia number,

                                    p_valor_total number,
                                    p_idmunicipio char,
                                    p_periodo     char,

                                    p_quincena char,

                                    p_p_consignado number,
                                    p_motivo       varchar2,
                                    p_acuerdo      number,
                                    p_usuario      varchar2,
                                    p_error        OUT VARCHAR2);

  PROCEDURE d_recaudo_local_ajustes(p_id_recaudo_local_ajustes number,
                                    p_usuario                  varchar2,
                                    p_error                    OUT VARCHAR2);

  PROCEDURE q_recaudo_local_ajustes(p_id_recaudo_local_ajustes number,
                                    p_idbanco                  out varchar2,
                                    p_cta_recaudo              out varchar2,
                                    p_indtipo                  out varchar2,
                                    p_fec_corte                out date,
                                    p_fec_tran                 out date,
                                    p_valor_total              out number,
                                    p_idmunicipio              out char,
                                    p_periodo                  out varchar2,
                                    p_quincena                 out varchar2,
                                    p_p_consignado             out number,
                                    p_motivo                   out varchar2,
                                    p_vigencia                 out varchar2,
                                    p_fec_vig_ini              out varchar2,
                                    p_fec_vig_fin              out varchar2,
                                    p_acuerdo                  out number,
                                    p_usuario                  varchar2,
                                    p_error OUT VARCHAR2
                                    );
  PROCEDURE i_archivoSoporte(p_id_recaudo_local_ajustes number,
                             p_filename                 varchar2,
                             p_nombreDocumento          varchar2,
                             p_extensionArchivo         varchar2,
                             p_bfile                    blob,
                             p_usuario                  varchar2,
                             p_error                    OUT VARCHAR2);

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

  PROCEDURE cargarExtAvvillas(p_uploadid        NUMBER,
                              p_idbanco         char,
                              p_cta_recaudo_fcm varchar2,
                              p_usuario         varchar2,
                              p_error           OUT VARCHAR2);

  PROCEDURE cargarExtPopular(p_uploadid        NUMBER,
                             p_idbanco         char,
                             p_cta_recaudo_fcm varchar2,
                             p_usuario         varchar2,
                             p_error           OUT VARCHAR2);
  PROCEDURE cargarExtAgrario(p_uploadid        NUMBER,
                             p_idbanco         char,
                             p_cta_recaudo_fcm varchar2,
                             p_usuario         varchar2,
                             p_error           OUT VARCHAR2);
  PROCEDURE cargarExtBancafe(p_uploadid        NUMBER,
                             p_idbanco         char,
                             p_cta_recaudo_fcm varchar2,
                             p_usuario         varchar2,
                             p_error           OUT VARCHAR2);
  PROCEDURE cargarExtDavivienda(p_uploadid        NUMBER,
                                p_idbanco         char,
                                p_cta_recaudo_fcm varchar2,
                                p_usuario         varchar2,
                                p_error           OUT VARCHAR2);

  PROCEDURE cargarMovAvvillas(p_uploadid        NUMBER,
                              p_idbanco         char,
                              p_cta_recaudo_fcm varchar2,
                              p_usuario         varchar2,
                              p_error           OUT VARCHAR2);

  PROCEDURE cargarIdeMasiva(p_uploadid        NUMBER,
                            p_idbanco         char,
                            p_cta_recaudo_fcm varchar2,
                            p_usuario         varchar2,
                            p_error           OUT VARCHAR2);

  PROCEDURE generarArchivoAvvillasLoc(p_fecha   date,
                                      p_usuario varchar2,
                                      p_error   OUT VARCHAR2);

end pk_proc;
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

  PROCEDURE contabiliza_recaudo_local(p_feccor_ini_ano number,
                                      p_feccor_ini_mes number,
                                      p_feccor_ini_dia number,
                                      p_feccor_fin_ano number,
                                      p_feccor_fin_mes number,
                                      p_feccor_fin_dia number,
                                      p_banco          varchar2,
                                      p_usuario        varchar2,
                                      p_error          OUT VARCHAR2);

  PROCEDURE contabiliza_trf_siniden(p_feccor_ini_ano number,
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

  procedure sp_valida_recaudo_local(p_fec_ini date,
                                    p_fec_fin date,
                                    p_usuario varchar2,
                                    p_error   OUT VARCHAR2);

  PROCEDURE i_archivoCon(p_filename  varchar2,
                         p_cfile     clob,
                         p_usuario   varchar2,
                         v_cod_error out number,
                         v_msg_error out varchar2);

  PROCEDURE mod_Trf_sdf(v_idReg     number,
                        v_fecIni    date,
                        v_fecFin    date,
                        v_usuario   number,
                        v_cod_error out number,
                        v_msg_error out varchar2);

  PROCEDURE liquidaDeposSinIdent(p_fec_ini_ano number,
                                 p_fec_ini_mes number,
                                 p_fec_ini_dia number,
                                 p_fec_fin_ano number,
                                 p_fec_fin_mes number,
                                 p_fec_fin_dia number,
                                 p_usuario     varchar2,
                                 p_error       OUT VARCHAR2);

  procedure distribuirDeposSinIden(p_fec_ini date,
                                   p_fec_fin date,
                                   p_usuario varchar2,
                                   p_error   OUT VARCHAR2);

end PK_RECLOC;
/

prompt
prompt Creating package body PK_PROC
prompt =============================
prompt
create or replace package body simit.pk_proc is

  -- Private variable declarations
  v_valida NUMBER;
  PROCEDURE i_archivoBin(p_filename varchar2,
                         p_bfile    blob,
                         p_usuario  varchar2,
                         p_error    OUT VARCHAR2) is
    p_uploadid number;
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');
    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      select seq_uploads.nextval into p_uploadid from dual;
      insert into uploadBin
        (uploadid, filename, bfile, usuario, fecha, valida)
      values
        (p_uploadid, p_filename, p_bfile, p_usuario, sysdate, 0);

      --p_error := p_uploadid;

      v_archivoBin(p_uploadid, p_usuario, p_error);

    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [i_archivoBin] ' || SQLERRM, p_error);
  END i_archivoBin;

  PROCEDURE v_archivoBin(p_uploadid number,
                         p_usuario  varchar2,
                         p_error    OUT VARCHAR2) is

    vblob   BLOB;
    vstart  NUMBER := 1;
    bytelen NUMBER := 32000;
    len     NUMBER;
    my_vr   RAW(32000);
    x       NUMBER;

    nomArchivo VARCHAR2(255);
    l_output   utl_file.file_type;

    directorio varchar2(255);
    ext        varchar2(255);

    comando varchar(250);
    salida  varchar(250);

    archivo      utl_file.file_type;
    input_buffer varchar2(1000);

    V_FECHAPROCESO              DATE;
    NUMEROREGISTRO              NUMBER;
    REFERENCIA                  VARCHAR2(16);
    BANCOORIGEN                 CHAR(2);
    TIPODECUENTAORIGEN          CHAR(3);
    v_NUMERODECUENTAORIGEN      VARCHAR2(16);
    VALORTRANSFERENCIA          NUMBER;
    BANCODESTINO                CHAR(2);
    TIPODECUENTADESTINO         CHAR(3);
    NUMERODECUENTADESTINO       VARCHAR2(16);
    TIPOIDENTIFICACIONDESTINO   CHAR(1);
    NUMEROIDENTIFICACIONDESTINO VARCHAR2(16);
    MENSAJEDERESPUESTA          VARCHAR2(100);
    CODIGODERESPUESTA           VARCHAR2(7);
    FECHACARGUE                 DATE;
    USUARIOCARGUE               NUMBER;

    primero number;

    v_tipoCargue  char(3);
    v_bancoOrigen char(2);

    v_regOk number;

    v_nocruzo number;

    result token_list;

    CURSOR tabla IS
      select fechaproceso,
             numeroregistro,
             referencia,
             bancoorigen,
             tipodecuentaorigen,
             numerodecuentaorigen,
             valortransferencia,
             bancodestino,
             tipodecuentadestino,
             numerodecuentadestino,
             tipoidentificaciondestino,
             numeroidentificaciondestino,
             mensajederespuesta,
             codigoderespuesta,
             fechacargue,
             usuariocargue,
             tipocargue,
             rowid
        from resulproctrf
       where FECHAPROCESO = v_fechaProceso
         and BANCOORIGEN = v_bancoOrigen
         and tipoCargue = v_tipoCargue;

    CURSOR tablaBan IS
      select fechaproceso,
             numeroregistro,
             referencia,
             bancoorigen,
             tipodecuentaorigen,
             numerodecuentaorigen,
             valortransferencia,
             bancodestino,
             tipodecuentadestino,
             numerodecuentadestino,
             tipoidentificaciondestino,
             numeroidentificaciondestino,
             mensajederespuesta,
             codigoderespuesta,
             fechacargue,
             usuariocargue,
             tipocargue,
             rowid
        from resulproctrf
       where FECHAPROCESO = v_fechaProceso
         and BANCOORIGEN = v_bancoOrigen
         and tipoCargue = v_tipoCargue
         and numerodecuentaorigen = v_NUMERODECUENTAORIGEN;

    regCon rowid;

  BEGIN

    sp_v_usuario(p_usuario, p_error, 'pk_proc');
    IF not (P_ERROR is null) THEN
      RETURN;
    END IF;

    -- convertir archivo blob en archivo en sistema operativo
    SELECT COUNT(*)
      INTO v_valida
      FROM uploadBin
     WHERE uploadid = p_uploadid;

    IF (v_valida = 0) THEN
      p_error := 'Archivo no ha sido cargado';
      return;
    END IF;

    SELECT lower(filename)
      INTO nomArchivo
      FROM uploadBin
     WHERE uploadid = p_uploadid;

    -- define output directory
    directorio := 'TRFAVVILLAS';

    if (substr(nomArchivo, 1, 3) = 'cnj') then
      directorio := 'TRFAVVILLAS';
    end if;

    if (substr(nomArchivo, 1, 2) = 'sr') then
      directorio := 'TRFDAVIVIENDA';
    end if;

    if (substr(nomArchivo, 1, 2) = 'rs') then
      directorio := 'TRFDAVIVIENDA';
    end if;

    if (substr(nomArchivo, 1, 2) = 'sm') then
      directorio := 'TRFDAVIVIENDA';
    end if;

    if (substr(nomArchivo, 1, 2) = 'bg') then
      directorio := 'TRFBOGOTA';
    end if;

    l_output := utl_file.fopen(directorio, nomArchivo, 'wb', 32760);

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

    ext := substr(nomArchivo, LENGTH(nomArchivo) - 2, LENGTH(nomArchivo));

    -- desencriptar si esta encriptado
    if (ext = 'pgp' or ext = 'gpg') then

      if (directorio = 'TRFAVVILLAS') then
        comando := '/bin/sh /trfavvillas/desencriptarArchivo.sh ' ||
                   nomArchivo;
      end if;

      if (directorio = 'TRFDAVIVIENDA') then
        comando := '/bin/sh /trfdavivienda/desencriptarArchivo.sh ' ||
                   nomArchivo;
      end if;

      salida := Shell_Run(comando);

      if (substr(salida, 0, 2) <> '0:') then
        p_error := salida;
        return;
      end if;

      nomArchivo := substr(nomArchivo, 1, LENGTH(nomArchivo) - 4);

    end if;

    -- cargar plano a tabla

    archivo := utl_file.fopen(directorio, nomArchivo, 'R');
    primero := 0;

    FECHACARGUE   := sysdate;
    USUARIOCARGUE := to_number(p_usuario);

    LOOP
      BEGIN
        utl_file.get_line(archivo, input_buffer);
      EXCEPTION
        when no_data_found then
          exit;
      END;

      v_regOk := 0;

      if (primero = 0) then

        if (substr(nomArchivo, 1, 7) = 'cnj653d') then
          v_tipoCargue   := 'TRF';
          v_bancoOrigen  := '52';
          v_fechaProceso := to_date(substr(input_buffer, 2, 8), 'yyyymmdd');
        end if;

        if (substr(nomArchivo, 1, 7) = 'cnj306d') then
          v_tipoCargue   := 'ACH';
          v_bancoOrigen  := '52';
          v_fechaProceso := to_date(substr(input_buffer, 2, 8), 'yyyymmdd');
        end if;

        if (substr(nomArchivo, 1, 2) = 'rs') then
          v_tipoCargue   := 'TRF';
          v_bancoOrigen  := '50';
          v_fechaProceso := to_date(substr(input_buffer, 1, 6), 'yymmdd');
        end if;

        if (substr(nomArchivo, 1, 2) = 'sr') then
          v_tipoCargue           := 'ACH';
          v_bancoOrigen          := '50';
          v_fechaProceso         := to_date(substr(nomArchivo, 14, 8),
                                            'yyyymmdd');
          v_NUMERODECUENTAORIGEN := substr(nomArchivo, 4, 9);
        end if;

        if (substr(nomArchivo, 1, 2) = 'sm') then
          v_tipoCargue           := 'ACH';
          v_bancoOrigen          := '50';
          v_fechaProceso         := to_date(substr(nomArchivo, 12, 6),
                                            'yymmdd');
          v_NUMERODECUENTAORIGEN := substr(nomArchivo, 3, 9);
        end if;

        if (substr(nomArchivo, 1, 2) = 'bg') then
          v_tipoCargue           := 'ACH';
          v_bancoOrigen          := '01';
          v_fechaProceso         := to_date(substr(input_buffer, 46, 8),
                                            'yyyymmdd');
          v_NUMERODECUENTAORIGEN := substr(input_buffer, 29, 9);
        end if;

        if (substr(nomArchivo, 1, 2) <> 'sm' and
           substr(nomArchivo, 1, 2) <> 'sr' and
           substr(nomArchivo, 1, 2) <> 'bg') then
          delete resulproctrf
           where FECHAPROCESO = v_fechaProceso
             and BANCOORIGEN = v_bancoOrigen
             and tipoCargue = v_tipoCargue;
        else
          delete resulproctrf
           where FECHAPROCESO = v_fechaProceso
             and BANCOORIGEN = v_bancoOrigen
             and tipoCargue = v_tipoCargue
             and NUMERODECUENTAORIGEN = v_NUMERODECUENTAORIGEN;

        end if;

        commit;

        primero := 1;
      end if;

      -- cargar estructura avvillas - registros de detalle
      if (substr(nomArchivo, 1, 3) = 'cnj') and
         substr(input_buffer, 1, 1) = '1' then

        v_regOk := 1;

        V_FECHAPROCESO     := to_date(substr(input_buffer, 2, 8),
                                      'yyyymmdd');
        NUMEROREGISTRO     := to_number(substr(input_buffer, 10, 8),
                                        '99999999');
        REFERENCIA         := substr(input_buffer, 18, 16);
        BANCOORIGEN        := substr(input_buffer, 35, 2);
        TIPODECUENTAORIGEN := 'AHO';
        if (substr(input_buffer, 37, 1) = '2') then
          TIPODECUENTAORIGEN := 'CTE';
        end if;
        v_NUMERODECUENTAORIGEN := substr(input_buffer, 45, 9);
        VALORTRANSFERENCIA     := to_number(substr(input_buffer, 54, 18),
                                            '999999999999999999');
        VALORTRANSFERENCIA     := VALORTRANSFERENCIA / 100;
        BANCODESTINO           := substr(input_buffer, 73, 2);

        TIPODECUENTADESTINO := 'AHO';
        if (substr(input_buffer, 75, 1) = '2') then
          TIPODECUENTADESTINO := 'CTE';
        end if;

        NUMERODECUENTADESTINO       := trim(substr(input_buffer, 76, 16));
        TIPOIDENTIFICACIONDESTINO   := substr(input_buffer, 92, 1);
        NUMEROIDENTIFICACIONDESTINO := substr(input_buffer, 99, 10);
        MENSAJEDERESPUESTA          := trim(substr(input_buffer, 109, 100));
        CODIGODERESPUESTA           := substr(input_buffer, 209, 3);

      end if;

      -- cargar estructura banco bogota - registros de detalle
      if (substr(nomArchivo, 1, 2) = 'bg') and
         substr(input_buffer, 1, 1) = '2' then

        v_regOk := 1;

        --NUMEROREGISTRO     := to_number(substr(input_buffer, 10, 8),
        --                                '99999999');
        REFERENCIA         := substr(input_buffer, 130, 10);
        BANCOORIGEN        := '01';
        TIPODECUENTAORIGEN := 'AHO';
        VALORTRANSFERENCIA := to_number(substr(input_buffer, 88, 18),
                                        '999999999999999999');
        VALORTRANSFERENCIA := VALORTRANSFERENCIA / 100;
        BANCODESTINO       := substr(input_buffer, 66, 2);

        TIPODECUENTADESTINO := 'AHO';
        if (substr(input_buffer, 45, 2) = '01') then
          TIPODECUENTADESTINO := 'CTE';
        end if;

        NUMERODECUENTADESTINO       := trim(substr(input_buffer, 47, 17));
        TIPOIDENTIFICACIONDESTINO   := substr(input_buffer, 32, 1);
        NUMEROIDENTIFICACIONDESTINO := substr(input_buffer, 34, 11);
        MENSAJEDERESPUESTA          := trim(substr(input_buffer, 143, 30));
        CODIGODERESPUESTA           := substr(input_buffer, 140, 3);

      end if;

      if (substr(nomArchivo, 1, 2) = 'rs') then

        v_regOk := 1;

        V_FECHAPROCESO         := to_date(substr(input_buffer, 1, 6),
                                          'yymmdd');
        NUMEROREGISTRO         := 0;
        REFERENCIA             := '';
        BANCOORIGEN            := '50';
        TIPODECUENTAORIGEN     := 'AHO';
        v_NUMERODECUENTAORIGEN := trim(substr(input_buffer, 21, 16));
        VALORTRANSFERENCIA     := to_number(substr(input_buffer, 53, 18),
                                            '999999999999999999');
        VALORTRANSFERENCIA     := VALORTRANSFERENCIA / 100;
        BANCODESTINO           := '';

        TIPODECUENTADESTINO := '';

        NUMERODECUENTADESTINO       := trim(substr(input_buffer, 37, 16));
        TIPOIDENTIFICACIONDESTINO   := '';
        NUMEROIDENTIFICACIONDESTINO := '';
        MENSAJEDERESPUESTA          := 'RECHAZO EN PREVALIDACION';
        CODIGODERESPUESTA           := substr(input_buffer, 71, 7);
        CODIGODERESPUESTA           := '999';
      end if;
      /*
        if (substr(nomArchivo, 1, 2) = 'sr') then

          v_regOk := 1;

          V_FECHAPROCESO         := to_date(substr(input_buffer, 146, 8),
                                            'yyyymmdd');
          NUMEROREGISTRO         := 0;
          REFERENCIA             := substr(input_buffer, 17, 16);
          BANCOORIGEN            := '50';
          TIPODECUENTAORIGEN     := 'AHO';
          v_NUMERODECUENTAORIGEN := '';
          VALORTRANSFERENCIA     := to_number(substr(input_buffer, 57, 18),
                                              '999999999999999999');
          VALORTRANSFERENCIA     := VALORTRANSFERENCIA / 100;
          BANCODESTINO           := substr(input_buffer, 55, 2);

          TIPODECUENTADESTINO := 'AHO';

          if (substr(input_buffer, 49, 2) <> 'CA') then
            TIPODECUENTADESTINO := 'CTE';
          end if;

          NUMERODECUENTADESTINO       := trim(substr(input_buffer, 33, 16));
          TIPOIDENTIFICACIONDESTINO   := '';
          NUMEROIDENTIFICACIONDESTINO := substr(input_buffer, 8, 10);
          MENSAJEDERESPUESTA          := trim(substr(input_buffer, 88, 40));
          if (MENSAJEDERESPUESTA = '' or MENSAJEDERESPUESTA is null) then
            MENSAJEDERESPUESTA := 'RECHAZO ACH';
          end if;
          CODIGODERESPUESTA := substr(input_buffer, 84, 4);
          CODIGODERESPUESTA := '000';

          if (MENSAJEDERESPUESTA = '' or MENSAJEDERESPUESTA is null) then
            CODIGODERESPUESTA := '999';
          end if;

        end if;
      */

      if (substr(nomArchivo, 1, 2) = 'sr') then

        if (substr(input_buffer, 1, 2) = 'RC') then
          if (v_NUMERODECUENTAORIGEN <> substr(input_buffer, 34, 9)) then
            p_error := 'Cuenta no corresponde a la contenida en el archivo. El archivo contiene la cuenta  ' ||
                       substr(input_buffer, 34, 9);
            utl_file.fclose(archivo);
            return;
          end if;
        end if;

        if (substr(input_buffer, 1, 2) = 'TR') then
          v_regOk := 1;
        end if;

        if (v_regOk = 1) then
          V_FECHAPROCESO     := v_fechaProceso;
          NUMEROREGISTRO     := 0;
          REFERENCIA         := '';
          BANCOORIGEN        := '50';
          TIPODECUENTAORIGEN := 'AHO';
          VALORTRANSFERENCIA := to_number(substr(input_buffer, 59, 18),
                                          '999999999999999999');
          VALORTRANSFERENCIA := VALORTRANSFERENCIA / 100;
          BANCODESTINO       := substr(input_buffer, 57, 2);

          TIPODECUENTADESTINO := 'AHO';

          if (substr(input_buffer, 51, 2) <> 'CA') then
            TIPODECUENTADESTINO := 'CTE';
          end if;

          NUMERODECUENTADESTINO       := substr(input_buffer, 35, 16);
          TIPOIDENTIFICACIONDESTINO   := '';
          NUMEROIDENTIFICACIONDESTINO := substr(input_buffer, 9, 10);
          MENSAJEDERESPUESTA          := trim(substr(input_buffer, 90, 40));
          CODIGODERESPUESTA           := substr(input_buffer, 87, 3);

          if (MENSAJEDERESPUESTA <> 'Pago Exitoso') then
            if CODIGODERESPUESTA = '000' then
              CODIGODERESPUESTA := '999';
            end if;

          end if;

        end if;

      end if;

      if (substr(nomArchivo, 1, 2) = 'sm') then
        -- se esta generando con ;
        result := tokenize(str => input_buffer, delim => ';');

        v_regOk := 1;

        if (result(1) is null) then
          v_regOk := 0;
        end if;

        if (v_regOk = 1 and lower(result(1)) = 'destino') then
          v_regOk := 0;
        end if;

        if (v_regOk = 1 and lower(result(1)) = 'identificacion') then
          v_regOk := 0;
        end if;

        if (v_regOk = 1) then
          V_FECHAPROCESO := to_date(substr(nomArchivo, 12, 6), 'yymmdd');
          NUMEROREGISTRO := 0;

          if (substr(result(5), 1, 1) = '$') then
            if (substr(result(5), LENGTH(result(5)) - 2, 1) = ',') then
              result(5) := replace(result(5), '.', '');
              result(5) := replace(result(5), ',', '.');
              result(5) := replace(result(5), ' ', '');
            else
              if (substr(result(5), LENGTH(result(5)) - 2, 1) = '.') then
                result(5) := replace(result(5), ',', '');
                result(5) := replace(result(5), ' ', '');
              end if;
            end if;

          end if;

          REFERENCIA := '';

          BANCOORIGEN            := '50';
          TIPODECUENTAORIGEN     := 'AHO';
          v_NUMERODECUENTAORIGEN := substr(nomArchivo, 3, 9);
          VALORTRANSFERENCIA     := to_number(result(5),
                                              '$999999999999999999.99');

          BANCODESTINO := '';

          TIPODECUENTADESTINO := '';

          NUMERODECUENTADESTINO       := result(3);
          TIPOIDENTIFICACIONDESTINO   := '';
          NUMEROIDENTIFICACIONDESTINO := result(1);
          MENSAJEDERESPUESTA          := result(6);
          if (instr(lower(result(6)), 'devolucion', 1) > 0 or
             instr(lower(result(6)), 'rechazo', 1) > 0) then
            MENSAJEDERESPUESTA := result(7);
          end if;

          if (instr(lower(result(6)), 'devolucion', 1) > 0 or
             instr(lower(result(6)), 'rechazo', 1) > 0) then
            CODIGODERESPUESTA := '999';
          else
            CODIGODERESPUESTA := '000';
          end if;

        end if;

      end if;

      if (v_regOk = 1) then

        insert into resulproctrf
          (fechaproceso,
           numeroregistro,
           referencia,
           bancoorigen,
           tipodecuentaorigen,
           numerodecuentaorigen,
           valortransferencia,
           bancodestino,
           tipodecuentadestino,
           numerodecuentadestino,
           tipoidentificaciondestino,
           numeroidentificaciondestino,
           mensajederespuesta,
           codigoderespuesta,
           fechacargue,
           usuariocargue,
           tipoCargue)
        values
          (v_fechaproceso,
           numeroregistro,
           referencia,
           bancoorigen,
           tipodecuentaorigen,
           v_numerodecuentaorigen,
           valortransferencia,
           bancodestino,
           tipodecuentadestino,
           numerodecuentadestino,
           tipoidentificaciondestino,
           numeroidentificaciondestino,
           mensajederespuesta,
           codigoderespuesta,
           fechacargue,
           usuariocargue,
           v_tipoCargue);

      end if;

    END LOOP;

    utl_file.fclose(archivo);

    commit;

    -- realiza conciliacion de registros avvillas
    if (v_bancoOrigen = '52') then
      for registro in tabla loop
        -- ubicar registro a conciliar por referencia
        if (registro.referencia <> '0000000000000000') then

          begin
            select rowid
              into regCon
              from recaudo_externo_disp_tot
             where referenciatrf = to_number(registro.referencia);

          EXCEPTION
            WHEN OTHERS THEN
              regCon := null;
          end;
        end if;

        -- ubicar registro por datos
        if (registro.referencia = '0000000000000000') then

          select count(*)
            into v_valida
            from recaudo_externo_disp_tot
           where fec_dispersion <= registro.fechaProceso
             and fec_dispersion >= (registro.fechaProceso - 5)
             and to_number(ori_cuenta) =
                 to_number(registro.numerodecuentaorigen)
             and to_number(simit.desencriptar(des_cuenta)) =
                 to_number(registro.numerodecuentadestino)
             and valor = registro.valortransferencia;

          if (v_valida = 1) then
            select rowid
              into regCon
              from recaudo_externo_disp_tot
             where fec_dispersion <= registro.fechaProceso
               and fec_dispersion >= (registro.fechaProceso - 5)
               and to_number(ori_cuenta) =
                   to_number(registro.numerodecuentaorigen)
               and to_number(simit.desencriptar(des_cuenta)) =
                   to_number(registro.numerodecuentadestino)
               and valor = registro.valortransferencia;
          end if;

          if (v_valida > 1) then
            select max(rowid)
              into regCon
              from recaudo_externo_disp_tot
             where fec_dispersion <= registro.fechaProceso
               and fec_dispersion >= (registro.fechaProceso - 5)
               and to_number(ori_cuenta) =
                   to_number(registro.numerodecuentaorigen)
               and to_number(simit.desencriptar(des_cuenta)) =
                   to_number(registro.numerodecuentadestino)
               and valor = registro.valortransferencia
               and rowid not in
                   (select regcruzo
                      from resulproctrf
                     where FECHAPROCESO = v_fechaProceso
                       and BANCOORIGEN = v_bancoOrigen
                       and tipoCargue = v_tipoCargue
                       and numerodecuentaorigen = v_NUMERODECUENTAORIGEN
                       and regcruzo is not null);

          end if;

          if (v_valida = 0) then
            regCon := null;
          end if;

        end if;

        -- actualizar transferencias rechazadas
        if (regCon is not null and registro.codigoderespuesta <> '000') then

          update recaudo_externo_disp_tot r
             set r.estadotrf        = 'REC',
                 r.fechadevolucion  = registro.fechaproceso,
                 r.motivodevolucion = registro.mensajederespuesta,
                 r.codigodevolucion = registro.codigoderespuesta
           where r.rowid = regCon;

          update resulproctrf
             set regcruzo = regCon
           where rowid = registro.rowid;

        end if;

        -- actualizar transferencias rechazadas
        if (regCon is not null and registro.codigoderespuesta = '000') then
          update resulproctrf
             set regcruzo = regCon
           where rowid = registro.rowid;
        end if;

        -- actualizar transferencias internas exitosas
        if (regCon is not null and registro.codigoderespuesta = '000' and
           registro.bancodestino = '52') then

          update recaudo_externo_disp_tot r
             set r.estadotrf       = 'EXI',
                 r.fechaconfirmada = registro.fechaproceso
           where r.rowid = regCon;

          update resulproctrf
             set regcruzo = regCon
           where rowid = registro.rowid;

        end if;

      -- actualizar transferencias ACH
      /* No es necesario dado que las transferencias ach son aceptadas siempre
                                                                          el estado ENV significa Enviado a Banco pero sin confirmar
                                                                          if (regCon is not null and registro.codigoderespuesta = '000' and
                                                                             registro.bancodestino <> '52') then

                                                                            update recaudo_externo_disp_tot r
                                                                               set r.estadotrf       = 'ACH',
                                                                                   r.fechaEnvioAch = registro.fechaproceso
                                                                             where r.rowid = regCon;

                                                                            update resulproctrf
                                                                               set regcruzo = regCon
                                                                             where rowid = registro.rowid;

                                                                          end if;
                                                                          */

      end loop;

    end if;

    -- realiza conciliacion de registros bancafe
    if (v_bancoOrigen = '50') then

      for registro in tablaBan loop
        -- ubicar registro por datos
        if (registro.referencia = '' or registro.referencia is null) then

          regCon := null;

          select count(*)
            into v_valida
            from recaudo_externo_disp_tot
           where fec_dispersion <= registro.fechaProceso
             and fec_dispersion >= (registro.fechaProceso - 60)
             and to_number(ori_cuenta) =
                 to_number(registro.numerodecuentaorigen)
             and to_number(simit.desencriptar(des_cuenta)) =
                 to_number(registro.numerodecuentadestino)
             and valor = registro.valortransferencia;

          if (v_valida = 1) then
            select rowid
              into regCon
              from recaudo_externo_disp_tot
             where fec_dispersion <= registro.fechaProceso
               and fec_dispersion >= (registro.fechaProceso - 60)
               and to_number(ori_cuenta) =
                   to_number(registro.numerodecuentaorigen)
               and to_number(simit.desencriptar(des_cuenta)) =
                   to_number(registro.numerodecuentadestino)
               and valor = registro.valortransferencia;

          end if; --  if (v_valida = 1) then

          if (v_valida > 1) then
            select max(rowid)
              into regCon
              from recaudo_externo_disp_tot
             where fec_dispersion <= registro.fechaProceso
               and fec_dispersion >= (registro.fechaProceso - 60)
               and to_number(ori_cuenta) =
                   to_number(registro.numerodecuentaorigen)
               and to_number(simit.desencriptar(des_cuenta)) =
                   to_number(registro.numerodecuentadestino)
               and valor = registro.valortransferencia
               and rowid not in
                   (select regcruzo
                      from resulproctrf
                     where FECHAPROCESO = v_fechaProceso
                       and BANCOORIGEN = v_bancoOrigen
                       and tipoCargue = v_tipoCargue
                       and numerodecuentaorigen = v_NUMERODECUENTAORIGEN
                       and regcruzo is not null);

          end if; -- if (v_valida > 1) then

          if (v_valida = 0) then
            regCon := null;
          end if; -- if (v_valida = 0) then

          if (regCon is null) then

            select count(*)
              into v_valida
              from recaudo_externo_disp_tot
             where fec_dispersion <= registro.fechaProceso
               and fec_dispersion >= (registro.fechaProceso - 60)
               and to_number(ori_cuenta) =
                   to_number(registro.numerodecuentaorigen)
               and instr(simit.desencriptar(des_cuenta),
                         substr(registro.numerodecuentadestino, 5, 12)) > 0
               and valor = registro.valortransferencia;

            if (v_valida = 1) then
              select rowid
                into regCon
                from recaudo_externo_disp_tot
               where fec_dispersion <= registro.fechaProceso
                 and fec_dispersion >= (registro.fechaProceso - 60)
                 and to_number(ori_cuenta) =
                     to_number(registro.numerodecuentaorigen)
                 and instr(simit.desencriptar(des_cuenta),
                           substr(registro.numerodecuentadestino, 5, 12)) > 0
                 and valor = registro.valortransferencia;

            end if; -- if (v_valida = 1) then

            if (v_valida > 1) then
              select max(rowid)
                into regCon
                from recaudo_externo_disp_tot
               where fec_dispersion <= registro.fechaProceso
                 and fec_dispersion >= (registro.fechaProceso - 60)
                 and to_number(ori_cuenta) =
                     to_number(registro.numerodecuentaorigen)
                 and instr(simit.desencriptar(des_cuenta),
                           substr(registro.numerodecuentadestino, 5, 12)) > 0
                 and valor = registro.valortransferencia
                 and rowid not in
                     (select regcruzo
                        from resulproctrf
                       where FECHAPROCESO = v_fechaProceso
                         and BANCOORIGEN = v_bancoOrigen
                         and tipoCargue = v_tipoCargue
                         and numerodecuentaorigen = v_NUMERODECUENTAORIGEN
                         and regcruzo is not null);

            end if; -- if (v_valida > 1) then

          end if; -- if (regCon is null ) then

          -- actualizar transferencias rechazadas
          if (regCon is not null and registro.codigoderespuesta <> '000') then

            update recaudo_externo_disp_tot r
               set r.estadotrf        = 'REC',
                   r.fechadevolucion  = registro.fechaproceso,
                   r.motivodevolucion = registro.mensajederespuesta,
                   r.codigodevolucion = registro.codigoderespuesta
             where r.rowid = regCon;

            update resulproctrf
               set regcruzo = regCon
             where rowid = registro.rowid;

          end if; --  if (regCon is not null and registro.codigoderespuesta <> '000') then

          -- actualizar transferencias exitosas
          if (regCon is not null and registro.codigoderespuesta = '000') then

            /*
              update recaudo_externo_disp_tot r
                 set r.estadotrf       = 'EXI',
                     r.fechaconfirmada = registro.fechaproceso
               where r.rowid = regCon;
            */

            update resulproctrf
               set regcruzo = regCon
             where rowid = registro.rowid;

          end if; -- if (regCon is not null and registro.codigoderespuesta = '000') then

        end if; -- if (registro.referencia = '' or registro.referencia is null) then
      end loop;

    end if;

    -- realiza conciliacion de registros bogota
    if (v_bancoOrigen = '01') then
      for registro in tabla loop
        -- ubicar registro a conciliar por referencia
        if (registro.referencia <> '0000000000') then

          begin
            select rowid
              into regCon
              from recaudo_externo_disp_tot
             where referenciatrf = to_number(registro.referencia);

          EXCEPTION
            WHEN OTHERS THEN
              regCon := null;
          end;
        end if;

        -- ubicar registro por datos
        if (registro.referencia = '0000000000') then

          select count(*)
            into v_valida
            from recaudo_externo_disp_tot
           where fec_dispersion <= registro.fechaProceso
             and fec_dispersion >= (registro.fechaProceso - 5)
             and to_number(ori_cuenta) =
                 to_number(registro.numerodecuentaorigen)
             and to_number(simit.desencriptar(des_cuenta)) =
                 to_number(registro.numerodecuentadestino)
             and valor = registro.valortransferencia;

          if (v_valida = 1) then
            select rowid
              into regCon
              from recaudo_externo_disp_tot
             where fec_dispersion <= registro.fechaProceso
               and fec_dispersion >= (registro.fechaProceso - 5)
               and to_number(ori_cuenta) =
                   to_number(registro.numerodecuentaorigen)
               and to_number(simit.desencriptar(des_cuenta)) =
                   to_number(registro.numerodecuentadestino)
               and valor = registro.valortransferencia;
          end if;

          if (v_valida > 1) then
            select max(rowid)
              into regCon
              from recaudo_externo_disp_tot
             where fec_dispersion <= registro.fechaProceso
               and fec_dispersion >= (registro.fechaProceso - 5)
               and to_number(ori_cuenta) =
                   to_number(registro.numerodecuentaorigen)
               and to_number(simit.desencriptar(des_cuenta)) =
                   to_number(registro.numerodecuentadestino)
               and valor = registro.valortransferencia
               and rowid not in
                   (select regcruzo
                      from resulproctrf
                     where FECHAPROCESO = v_fechaProceso
                       and BANCOORIGEN = v_bancoOrigen
                       and tipoCargue = v_tipoCargue
                       and numerodecuentaorigen = v_NUMERODECUENTAORIGEN
                       and regcruzo is not null);

          end if;

          if (v_valida = 0) then
            regCon := null;
          end if;

        end if;

        -- actualizar transferencias rechazadas
        if (regCon is not null and registro.codigoderespuesta <> 'S00') then

          update recaudo_externo_disp_tot r
             set r.estadotrf        = 'REC',
                 r.fechaconfirmada  = null,
                 r.fechadevolucion  = registro.fechaproceso,
                 r.motivodevolucion = registro.mensajederespuesta,
                 r.codigodevolucion = registro.codigoderespuesta
           where r.rowid = regCon;

          update resulproctrf
             set regcruzo = regCon
           where rowid = registro.rowid;

        end if;

        -- actualizar transferencias exitosas
        if (regCon is not null and registro.codigoderespuesta = 'S00') then
          update recaudo_externo_disp_tot r
             set r.estadotrf       = 'EXI',
                 r.fechaconfirmada = registro.fechaproceso
           where r.rowid = regCon;

          update resulproctrf r
             set regcruzo = regCon
           where rowid = registro.rowid;
        end if;

      end loop;

    end if;

    commit;

    if (substr(nomArchivo, 1, 2) <> 'sm' and
       substr(nomArchivo, 1, 2) <> 'sr' and
       substr(nomArchivo, 1, 2) <> 'bg') then

      select count(*)
        into v_valida
        from resulproctrf
       where FECHAPROCESO = v_fechaProceso
         and BANCOORIGEN = v_bancoOrigen
         and tipoCargue = v_tipoCargue;
    else
      select count(*)
        into v_valida
        from resulproctrf
       where FECHAPROCESO = v_fechaProceso
         and BANCOORIGEN = v_bancoOrigen
         and tipoCargue = v_tipoCargue
         and numerodecuentaorigen = v_numerodecuentaorigen;
    end if;

    p_error := 'Cargue exitoso. Registros cargados:' || v_valida;

    if (substr(nomArchivo, 1, 2) <> 'sm' and
       substr(nomArchivo, 1, 2) <> 'sr' and
       substr(nomArchivo, 1, 2) <> 'bg') then

      select count(*)
        into v_nocruzo
        from resulproctrf
       where FECHAPROCESO = v_fechaProceso
         and BANCOORIGEN = v_bancoOrigen
         and tipoCargue = v_tipoCargue
         and regcruzo is not null;
    else
      select count(*)
        into v_nocruzo
        from resulproctrf
       where FECHAPROCESO = v_fechaProceso
         and BANCOORIGEN = v_bancoOrigen
         and tipoCargue = v_tipoCargue
         and numerodecuentaorigen = v_numerodecuentaorigen
         and regcruzo is not null;
    end if;

    p_error := p_error || ' Registros cruzados:' || v_nocruzo;

    if (v_valida <> v_nocruzo) then
      p_error := p_error ||
                 '.ERROR FALTAN REGISTROS POR CRUZAR INFORMAR AL ADMINISTRADOR';
    end if;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [v_archivoBin] ' || SQLERRM, p_error);
  END v_archivoBin;

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

  PROCEDURE v_archivo(p_tipocargue      varchar2,
                      p_uploadid        number,
                      p_idbanco         char,
                      p_cta_recaudo_fcm varchar2,
                      p_usuario         varchar2,
                      p_error           OUT VARCHAR2) is

  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');
    IF P_ERROR is null THEN

      -- Si pasa todas las validaciones
      IF (p_tipocargue = 'REC' and p_idbanco <> '52') THEN
        p_error := 'Formato no soportado';
        return;
      END IF;

      IF (p_tipocargue = 'REC' and p_idbanco = '52') THEN

        p_error := fn_divide_archivo_avvillas(p_uploadid        => p_uploadid,
                                              p_idbanco         => p_idbanco,
                                              p_cta_recaudo_fcm => p_cta_recaudo_fcm,
                                              p_usuario         => p_usuario,
                                              p_error           => p_error);
      END IF;

      IF (p_tipocargue = 'DEP') THEN

        p_error := fn_divide_archivo_dep(p_uploadid        => p_uploadid,
                                         p_idbanco         => p_idbanco,
                                         p_cta_recaudo_fcm => p_cta_recaudo_fcm,
                                         p_usuario         => p_usuario,
                                         p_error           => p_error);
      END IF;

      IF (p_tipocargue = 'DSI') THEN

        cargarDeposSinIden(p_uploadid       => p_uploadid,
                           p_usuario         => p_usuario,
                           p_error           => p_error);
      END IF;

      IF (p_tipocargue = 'SIN') THEN

        p_error := fn_divide_archivo_sin(p_uploadid        => p_uploadid,
                                         p_idbanco         => p_idbanco,
                                         p_cta_recaudo_fcm => p_cta_recaudo_fcm,
                                         p_usuario         => p_usuario,
                                         p_error           => p_error);
      END IF;

      IF (p_tipocargue = 'IDE') THEN

        cargarIdeMasiva(p_uploadid        => p_uploadid,
                        p_idbanco         => p_idbanco,
                        p_cta_recaudo_fcm => p_cta_recaudo_fcm,
                        p_usuario         => p_usuario,
                        p_error           => p_error);

      END IF;

      IF (p_tipocargue = 'EXT') THEN

        if (p_idbanco = '52') then
          cargarExtAvvillas(p_uploadid        => p_uploadid,
                            p_idbanco         => p_idbanco,
                            p_cta_recaudo_fcm => p_cta_recaudo_fcm,
                            p_usuario         => p_usuario,
                            p_error           => p_error);
        end if;

        if (p_idbanco = '02') then
          cargarExtPopular(p_uploadid        => p_uploadid,
                           p_idbanco         => p_idbanco,
                           p_cta_recaudo_fcm => p_cta_recaudo_fcm,
                           p_usuario         => p_usuario,
                           p_error           => p_error);
        end if;

        if (p_idbanco = '40') then
          cargarExtAgrario(p_uploadid        => p_uploadid,
                           p_idbanco         => p_idbanco,
                           p_cta_recaudo_fcm => p_cta_recaudo_fcm,
                           p_usuario         => p_usuario,
                           p_error           => p_error);
        end if;

        if (p_idbanco = '50') then
          cargarExtBancafe(p_uploadid        => p_uploadid,
                           p_idbanco         => p_idbanco,
                           p_cta_recaudo_fcm => p_cta_recaudo_fcm,
                           p_usuario         => p_usuario,
                           p_error           => p_error);
        end if;

        if (p_idbanco = '51') then
          cargarExtDavivienda(p_uploadid        => p_uploadid,
                              p_idbanco         => p_idbanco,
                              p_cta_recaudo_fcm => p_cta_recaudo_fcm,
                              p_usuario         => p_usuario,
                              p_error           => p_error);
        end if;

      END IF;

      IF (p_tipocargue = 'MOV') THEN

        if (p_idbanco = '52') then
          cargarMovAvvillas(p_uploadid        => p_uploadid,
                            p_idbanco         => p_idbanco,
                            p_cta_recaudo_fcm => p_cta_recaudo_fcm,
                            p_usuario         => p_usuario,
                            p_error           => p_error);
        end if;

      end if;

    end if;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [v_archivo] ' || SQLERRM, p_error);
  END v_archivo;

PROCEDURE cargarDeposSinIden(p_uploadid        NUMBER,
                              p_usuario         varchar2,
                              p_error           OUT VARCHAR2) is

    v_cuenta        varchar2(16);
    v_indtipo       char(5);
    v_cfile         clob;
    l_clob_len      PLS_INTEGER;
    l_pos           PLS_INTEGER := 1;
    l_amount        BINARY_INTEGER := 32767;
    v_encabezado    VARCHAR2(500) := 'NUMEROTRX;IDBANCO;CUENTA;INDTIPO;FECHATRX;VALORTRX;P_CONSIGNADO';
    vBuffer         VARCHAR2(32767);
    v_finlinea      varchar(2);
    v_nombreArchivo varchar2(255);
    v_periodo       char(6);
    v_quincena      char(2);
    r               depo_sin_iden_tmp%rowtype;
    linea           varchar2(1000);

    i     number := 1;
    tk    number := 1;
    v_chr NUMBER := 13; -- 1 tipo de Enter

    v_registros number;
    w_registros number;
    v_total     number;

    campo token_list;

    CURSOR tabla IS
      select idbanco,
             cuenta,
             periodo,
             numerotrx,
             fechatrx,
             descripciontrx,
             valortrx,
             oficinaorigen,
             indtipo,
             idmunicipio,
             p_consignado,
             fechacargue,
             usuariocargue,
             fechaidentificacion,
             usuarioidentificacion,
             indtipoiden,
             idmunicipioiden,
             p_consignadoiden,
             observaciones,
             numsecuenciareg,
             estadoiden
        from trxsinidentificar
       where idbanco = '52'
         and cuenta = v_cuenta
         and periodo = v_periodo
         and quincena = v_quincena
         and descripciontrx like 'NC TRANS ACH%';

    v_idMunicipio char(8);
    v_nit         char(9);
    v_reg         number;

  BEGIN

    delete from DEPO_SIN_IDEN_TMP;

/*    v_cuenta  := Substr(p_cta_recaudo_fcm,
                        Instrb(p_cta_recaudo_fcm, '-', 1, 2) + 1,
                        Length(p_cta_recaudo_fcm));
    v_indtipo := Substr(p_cta_recaudo_fcm,
                        1,
                        Instrb(p_cta_recaudo_fcm, '-', 1, 1) - 1);
*/
    select cfile, filename
      into v_cfile, v_nombreArchivo
      from upload
     where uploadid = p_uploadid;

/*    v_periodo  := Substr(v_nombreArchivo, 1, 6);
    v_quincena := Substr(v_nombreArchivo, 7, 2);*/

/*    select count(*)
      into v_registros
      from recaudo_local_liquidacion l
     where l.periodo = v_periodo
       and l.quincena = v_quincena;

    IF v_registros > 0 THEN
      p_error := 'PERIODO/QUINCENA YA LIQUIDADA. SOLICITAR REPROCESO Y CARGAR ARCHIVO NUEVAMENTE';
      RETURN;
    END IF;*/

/*    delete from mvtoavvillas
     where numerocuenta = v_cuenta
       and periodo = v_periodo
       and quincena = v_quincena;

    delete from trxsinidentificar
     where cuenta = v_cuenta
       and periodo = v_periodo
       and quincena = v_quincena
       and ESTADOIDEN <> 'ID'
         and ( descripciontrx in
             (select concepto from conceptosidentificar where idbanco = '52')
            or descripciontrx like 'NC TRANS ACH%' );

    commit;*/

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

  -- leer encabezado
  l_amount := dbms_lob.instr(v_cfile, v_finlinea, l_pos, 1);
  IF l_amount < 1 THEN
    p_error := 'Registro 1  Invalido';
    return;
  else
    l_amount := l_amount - l_pos;
    dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);
    
    if (instr(lower(vBuffer), lower(v_encabezado)) = 0) then
        p_error := 'Encabezado erroneo. encabezado leido: ' ||
                   lower(vBuffer) || '*' || lower(v_encabezado);
        return;
    end if;

  end if;
  

    l_pos := l_pos + l_amount + length(v_finlinea);

    --Informacion
    WHILE l_pos < l_clob_len - 1 and p_error is null LOOP
      l_amount := dbms_lob.instr(v_cfile, v_finlinea, l_pos + 1, 1);
      
      IF l_amount < 1 THEN
        p_error := 'Registro ' || i || ' Invalido';
        return;
      else
        l_amount := l_amount - l_pos;
        dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);

        linea := vBuffer;
        campo := tokenize(str => linea, delim => ';');

        if (campo(1) is null) then
          p_error := 'Error en registro ' || i || '. Formato errado. ' ||
                     '. Datos registro: ' || vBuffer;
          return;

        end if;
        BEGIN
          r.idreg := SEQ_DEPOS_SIN_IDENT.NEXTVAL;
          r.numreg     := to_number(campo(1),'9999999999999999');
          if (campo(2) = '2') then
            r.idbanco    := '02';
          else
            r.idbanco    := campo(2);
          end if;
          
          
          
          if ( campo(2) = '52' ) then
             r.cuenta := '0' || campo(3);
          else
             r.cuenta := campo(3);
          end if;
          
          r.indtipo := campo(4);
          r.fechatransaccion := to_date(campo(5), 'yyyymmdd');
          r.valortotal     := to_number(replace(campo(6),',','.'), '9999999999999999.99');
          r.cuantia := to_number(campo(7),'99');

        EXCEPTION
          WHEN OTHERS THEN
            p_error := 'Error en registro ' || i || '. Mensaje: ' ||
                       SQLERRM || '. Datos registro: ' || vBuffer;
            return;
        END;

      end if;
      l_pos := l_pos + l_amount + length(v_finlinea);
      i     := i + 1;

      insert into DEPO_SIN_IDEN_TMP values r;
    END LOOP;

/*    insert into mvtoavvillas
      (numeroTrx,
       numerocuenta,
       periodo,
       fechaaplicacion,
       fechatransaccion,
       descripcion,
       documento,
       origen,
       valortotal,
       valorefectivo,
       valorcheque,
       debitocredito,
       codigotrn,
       quincena)
      select seq_mvto.nextval,
             numerocuenta,
             periodo,
             fechaaplicacion,
             fechatransaccion,
             descripcion,
             documento,
             origen,
             valortotal,
             valorefectivo,
             valorcheque,
             debitocredito,
             codigotrn,
             quincena
        from mvtoavvillas_temp;

    insert into trxsinidentificar
      (idbanco,
       cuenta,
       periodo,
       numerotrx,
       fechatrx,
       descripciontrx,
       valortrx,
       oficinaorigen,
       indtipo,
       idmunicipio,
       p_consignado,
       fechacargue,
       usuariocargue,
       fechaidentificacion,
       usuarioidentificacion,
       indtipoiden,
       idmunicipioiden,
       p_consignadoiden,
       observaciones,
       numsecuenciareg,
       estadoiden,
       quincena,
       vigencia)
      select '52' as idBanco,
             numerocuenta,
             periodo,
             numeroTrx,
             fechatransaccion,
             descripcion,
             valortotal,
             origen,
             v_indtipo as indTipo,
             '' as idMunicipio,
             decode(v_indtipo, 'SIMIT', 10, 55) as p_consignado,
             sysdate,
             p_usuario,
             null as fechaIde,
             null as usuarioIde,
             null as indtipoiden,
             null as idmunicipioiden,
             null p_consignadoiden,
             null as observaciones,
             seq_ide.nextval as numsecuenciareg,
             'SI' as estadoiden,
             quincena,
             trim(to_char(fechatransaccion, 'yyyy'))
        from mvtoavvillas
       where numerocuenta = v_cuenta
         and periodo = v_periodo
         and quincena = v_quincena
         and not descripcion like '%8000826650%'
         and descripcion in
             (select concepto from conceptosidentificar where idbanco = '52');

    insert into trxsinidentificar
      (idbanco,
       cuenta,
       periodo,
       numerotrx,
       fechatrx,
       descripciontrx,
       valortrx,
       oficinaorigen,
       indtipo,
       idmunicipio,
       p_consignado,
       fechacargue,
       usuariocargue,
       fechaidentificacion,
       usuarioidentificacion,
       indtipoiden,
       idmunicipioiden,
       p_consignadoiden,
       observaciones,
       numsecuenciareg,
       estadoiden,
       quincena,
       vigencia)
      select '52' as idBanco,
             numerocuenta,
             periodo,
             numeroTrx,
             fechatransaccion,
             descripcion,
             valortotal,
             origen,
             v_indtipo as indTipo,
             '' as idMunicipio,
             decode(v_indtipo, 'SIMIT', 10, 55) as p_consignado,
             sysdate,
             p_usuario,
             null as fechaIde,
             null as usuarioIde,
             null as indtipoiden,
             null as idmunicipioiden,
             null p_consignadoiden,
             null as observaciones,
             seq_ide.nextval as numsecuenciareg,
             'SI' as estadoiden,
             quincena,
             trim(to_char(fechatransaccion, 'yyyy'))
        from mvtoavvillas
       where numerocuenta = v_cuenta
         and periodo = v_periodo
         and quincena = v_quincena
         and not descripcion like '%8000826650%'
         and descripcion like 'NC TRANS ACH%';

    for registro in tabla loop
      v_idMunicipio := null;
      if (substr(registro.descripciontrx, 18, 1) = '0') then
        v_nit := substr(registro.descripciontrx, 19, 9);
      else
        v_nit := substr(registro.descripciontrx, 18, 9);
      end if;

      select count(*)
        into v_reg
        from municipio
       where instr(nit_m, v_nit) > 0;

      if (v_reg > 0) then

        select substr(min(idMunicipio), 1, 8)
          into v_idMunicipio
          from municipio
         where instr(nit_m, v_nit) > 0;
      else
        select count(*)
          into v_reg
          from municipio
         where instr(nit_cta, v_nit) > 0;

        if (v_reg > 0) then

          select substr(min(idMunicipio), 1, 8)
            into v_idMunicipio
            from municipio
           where instr(nit_cta, v_nit) > 0;

        end if;
      end if;

      if (v_idMunicipio is not null) then
        update trxsinidentificar
           set idmunicipio = v_idMunicipio
         where numsecuenciareg = registro.numsecuenciareg;

        update trxsinidentificar
           set concesionariozon =
               (select m.idconcesionario
                  from municipio m
                 where m.idmunicipio = v_idMunicipio)
         where numsecuenciareg = registro.numsecuenciareg;

      end if;

    end loop;

    commit;

    update trxsinidentificar t
       set t.vigencia    = trim(to_char(ADD_MONTHS(t.fechatrx, -1), 'yyyy')),
           t.FECHAINICIO = ADD_MONTHS(t.fechatrx, -1),
           t.FECHAFIN    = ADD_MONTHS(t.fechatrx, -1)
     where t.idmunicipio in
           (select d.divipo
              from divipofechacorte d
             where d.tipofechacorte = 'A')
       and t.periodo = v_periodo
       and t.quincena = v_quincena
       and t.cuenta = v_cuenta;

    update trxsinidentificar t
       set t.vigencia    = trim(to_char(t.fechatrx, 'yyyy')),
           t.FECHAINICIO = t.fechatrx,
           t.FECHAFIN    = t.fechatrx
     where t.idmunicipio in
           (select d.divipo
              from divipofechacorte d
             where d.tipofechacorte = 'D')
       and t.periodo = v_periodo
       and t.quincena = v_quincena
       and t.cuenta = v_cuenta;
*/
    commit;

    i := i - 1;
    if p_error is null then
      p_error := 'El archivo se VALIDO exitosamente. Registros: ' || i;
    end if;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [cargarDeposSinIden] ' || SQLERRM,
            p_error);

  end cargarDeposSinIden;
  
 PROCEDURE cargarExtAvvillas(p_uploadid        NUMBER,
                              p_idbanco         char,
                              p_cta_recaudo_fcm varchar2,
                              p_usuario         varchar2,
                              p_error           OUT VARCHAR2) is

    v_cuenta        varchar2(16);
    v_indtipo       char(5);
    v_cfile         clob;
    l_clob_len      PLS_INTEGER;
    l_pos           PLS_INTEGER := 1;
    l_amount        BINARY_INTEGER := 32767;
    v_encabezado    VARCHAR2(500) := 'Fecha de aplicacion,Fecha de transaccion,Descripcion,documento,Origen,Valor Total,Valor Efectivo,Valor Cheque,D- Debito C- Credito,Codigo de Transaccion';
    vBuffer         VARCHAR2(32767);
    v_finlinea      varchar(2);
    v_nombreArchivo varchar2(255);
    v_periodo       char(6);
    v_quincena      char(2);
    r               mvtoavvillas_temp%rowtype;
    linea           varchar2(1000);

    i     number := 1;
    tk    number := 1;
    v_chr NUMBER := 13; -- 1 tipo de Enter

    v_registros number;
    w_registros number;
    v_total     number;

    campo token_list;

    CURSOR tabla IS
      select idbanco,
             cuenta,
             periodo,
             numerotrx,
             fechatrx,
             descripciontrx,
             valortrx,
             oficinaorigen,
             indtipo,
             idmunicipio,
             p_consignado,
             fechacargue,
             usuariocargue,
             fechaidentificacion,
             usuarioidentificacion,
             indtipoiden,
             idmunicipioiden,
             p_consignadoiden,
             observaciones,
             numsecuenciareg,
             estadoiden
        from trxsinidentificar
       where idbanco = '52'
         and cuenta = v_cuenta
         and periodo = v_periodo
         and quincena = v_quincena
         and descripciontrx like 'NC TRANS ACH%';

    v_idMunicipio char(8);
    v_nit         char(9);
    v_reg         number;

  BEGIN

    delete from mvtoAvvillas_temp;

    v_cuenta  := Substr(p_cta_recaudo_fcm,
                        Instrb(p_cta_recaudo_fcm, '-', 1, 2) + 1,
                        Length(p_cta_recaudo_fcm));
    v_indtipo := Substr(p_cta_recaudo_fcm,
                        1,
                        Instrb(p_cta_recaudo_fcm, '-', 1, 1) - 1);

    select cfile, filename
      into v_cfile, v_nombreArchivo
      from upload
     where uploadid = p_uploadid;

    v_periodo  := Substr(v_nombreArchivo, 1, 6);
    v_quincena := Substr(v_nombreArchivo, 7, 2);

    select count(*)
      into v_registros
      from recaudo_local_liquidacion l
     where l.periodo = v_periodo
       and l.quincena = v_quincena;

    IF v_registros > 0 THEN
      p_error := 'PERIODO/QUINCENA YA LIQUIDADA. SOLICITAR REPROCESO Y CARGAR ARCHIVO NUEVAMENTE';
      RETURN;
    END IF;

    delete from mvtoavvillas
     where numerocuenta = v_cuenta
       and periodo = v_periodo
       and quincena = v_quincena;

    delete from trxsinidentificar
     where cuenta = v_cuenta
       and periodo = v_periodo
       and quincena = v_quincena
       and ESTADOIDEN <> 'ID'
         and ( descripciontrx in
             (select concepto from conceptosidentificar where idbanco = '52')
            or descripciontrx like 'NC TRANS ACH%' );

    commit;

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

    --Registro #1
    dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);

    if replace(Substr(vBuffer, 12, 9), ' ', '0') <> v_cuenta then
      p_error := 'Movimiento no corresponde a cuenta seleccionada. Mvto pertenece a la cuenta ' ||
                 replace(Substr(vBuffer, 12, 9), ' ', '0');
      return;
    end if;

    l_pos := l_pos + l_amount + length(v_finlinea) - 1;

    --Registro #2
    l_amount := dbms_lob.instr(v_cfile, v_finlinea, l_pos, 1);
    IF l_amount < 1 THEN
      p_error := 'No existe Encabezado';
      return;
    else
      l_amount := l_amount - l_pos;
      dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);
      if (instr(lower(vBuffer), lower(v_encabezado)) = 0) then
        p_error := 'Encabezado erroneo. encabezado leido: ' ||
                   lower(vBuffer) || '*' || lower(v_encabezado);
        return;
      end if;
    end if;

    l_pos := l_pos + l_amount + length(v_finlinea);

    --Informacion
    WHILE l_pos < l_clob_len - 1 and p_error is null LOOP
      l_amount := dbms_lob.instr(v_cfile, v_finlinea, l_pos + 1, 1);
      IF l_amount < 1 THEN
        p_error := 'Registro ' || i || ' Invalido';
        return;
      else
        l_amount := l_amount - l_pos;
        dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);

        linea := vBuffer;
        campo := tokenize(str => linea, delim => ',');

        if (campo(1) is null) then
          p_error := 'Error en registro ' || i || '. Formato errado. ' ||
                     '. Datos registro: ' || vBuffer;
          return;

        end if;
        BEGIN
          r.numerocuenta     := v_cuenta;
          r.periodo          := v_periodo;
          r.fechaaplicacion  := to_date(campo(1), 'yyyymmdd');
          r.fechatransaccion := to_date(campo(2), 'yyyymmdd');
          r.descripcion      := campo(3);
          r.documento        := campo(4);
          r.origen           := campo(5);
          r.valortotal       := to_number(campo(6), '9999999999999999.99');
          r.valorefectivo    := to_number(campo(7), '9999999999999999.99');
          r.valorcheque      := to_number(campo(8), '9999999999999999.99');
          r.debitocredito    := campo(9);
          r.codigotrn        := campo(10);
          r.quincena         := v_quincena;

        EXCEPTION
          WHEN OTHERS THEN
            p_error := 'Error en registro ' || i || '. Mensaje: ' ||
                       SQLERRM || '. Datos registro: ' || vBuffer;
            return;
        END;

      end if;
      l_pos := l_pos + l_amount + length(v_finlinea);
      i     := i + 1;

      insert into mvtoavvillas_temp values r;
    END LOOP;

    insert into mvtoavvillas
      (numeroTrx,
       numerocuenta,
       periodo,
       fechaaplicacion,
       fechatransaccion,
       descripcion,
       documento,
       origen,
       valortotal,
       valorefectivo,
       valorcheque,
       debitocredito,
       codigotrn,
       quincena)
      select seq_mvto.nextval,
             numerocuenta,
             periodo,
             fechaaplicacion,
             fechatransaccion,
             descripcion,
             documento,
             origen,
             valortotal,
             valorefectivo,
             valorcheque,
             debitocredito,
             codigotrn,
             quincena
        from mvtoavvillas_temp;

    insert into trxsinidentificar
      (idbanco,
       cuenta,
       periodo,
       numerotrx,
       fechatrx,
       descripciontrx,
       valortrx,
       oficinaorigen,
       indtipo,
       idmunicipio,
       p_consignado,
       fechacargue,
       usuariocargue,
       fechaidentificacion,
       usuarioidentificacion,
       indtipoiden,
       idmunicipioiden,
       p_consignadoiden,
       observaciones,
       numsecuenciareg,
       estadoiden,
       quincena,
       vigencia)
      select '52' as idBanco,
             numerocuenta,
             periodo,
             numeroTrx,
             fechatransaccion,
             descripcion,
             valortotal,
             origen,
             v_indtipo as indTipo,
             '' as idMunicipio,
             decode(v_indtipo, 'SIMIT', 10, 55) as p_consignado,
             sysdate,
             p_usuario,
             null as fechaIde,
             null as usuarioIde,
             null as indtipoiden,
             null as idmunicipioiden,
             null p_consignadoiden,
             null as observaciones,
             seq_ide.nextval as numsecuenciareg,
             'SI' as estadoiden,
             quincena,
             trim(to_char(fechatransaccion, 'yyyy'))
        from mvtoavvillas
       where numerocuenta = v_cuenta
         and periodo = v_periodo
         and quincena = v_quincena
         and not descripcion like '%8000826650%'
         and descripcion in
             (select concepto from conceptosidentificar where idbanco = '52');

    insert into trxsinidentificar
      (idbanco,
       cuenta,
       periodo,
       numerotrx,
       fechatrx,
       descripciontrx,
       valortrx,
       oficinaorigen,
       indtipo,
       idmunicipio,
       p_consignado,
       fechacargue,
       usuariocargue,
       fechaidentificacion,
       usuarioidentificacion,
       indtipoiden,
       idmunicipioiden,
       p_consignadoiden,
       observaciones,
       numsecuenciareg,
       estadoiden,
       quincena,
       vigencia)
      select '52' as idBanco,
             numerocuenta,
             periodo,
             numeroTrx,
             fechatransaccion,
             descripcion,
             valortotal,
             origen,
             v_indtipo as indTipo,
             '' as idMunicipio,
             decode(v_indtipo, 'SIMIT', 10, 55) as p_consignado,
             sysdate,
             p_usuario,
             null as fechaIde,
             null as usuarioIde,
             null as indtipoiden,
             null as idmunicipioiden,
             null p_consignadoiden,
             null as observaciones,
             seq_ide.nextval as numsecuenciareg,
             'SI' as estadoiden,
             quincena,
             trim(to_char(fechatransaccion, 'yyyy'))
        from mvtoavvillas
       where numerocuenta = v_cuenta
         and periodo = v_periodo
         and quincena = v_quincena
         and not descripcion like '%8000826650%'
         and descripcion like 'NC TRANS ACH%';

    for registro in tabla loop
      v_idMunicipio := null;
      if (substr(registro.descripciontrx, 18, 1) = '0') then
        v_nit := substr(registro.descripciontrx, 19, 9);
      else
        v_nit := substr(registro.descripciontrx, 18, 9);
      end if;

      select count(*)
        into v_reg
        from municipio
       where instr(nit_m, v_nit) > 0;

      if (v_reg > 0) then

        select substr(min(idMunicipio), 1, 8)
          into v_idMunicipio
          from municipio
         where instr(nit_m, v_nit) > 0;
      else
        select count(*)
          into v_reg
          from municipio
         where instr(nit_cta, v_nit) > 0;

        if (v_reg > 0) then

          select substr(min(idMunicipio), 1, 8)
            into v_idMunicipio
            from municipio
           where instr(nit_cta, v_nit) > 0;

        end if;
      end if;

      if (v_idMunicipio is not null) then
        update trxsinidentificar
           set idmunicipio = v_idMunicipio
         where numsecuenciareg = registro.numsecuenciareg;

        update trxsinidentificar
           set concesionariozon =
               (select m.idconcesionario
                  from municipio m
                 where m.idmunicipio = v_idMunicipio)
         where numsecuenciareg = registro.numsecuenciareg;

      end if;

    end loop;

    commit;

    update trxsinidentificar t
       set t.vigencia    = trim(to_char(ADD_MONTHS(t.fechatrx, -1), 'yyyy')),
           t.FECHAINICIO = ADD_MONTHS(t.fechatrx, -1),
           t.FECHAFIN    = ADD_MONTHS(t.fechatrx, -1)
     where t.idmunicipio in
           (select d.divipo
              from divipofechacorte d
             where d.tipofechacorte = 'A')
       and t.periodo = v_periodo
       and t.quincena = v_quincena
       and t.cuenta = v_cuenta;

    update trxsinidentificar t
       set t.vigencia    = trim(to_char(t.fechatrx, 'yyyy')),
           t.FECHAINICIO = t.fechatrx,
           t.FECHAFIN    = t.fechatrx
     where t.idmunicipio in
           (select d.divipo
              from divipofechacorte d
             where d.tipofechacorte = 'D')
       and t.periodo = v_periodo
       and t.quincena = v_quincena
       and t.cuenta = v_cuenta;

    commit;

    i := i - 1;
    if p_error is null then
      p_error := 'El archivo se VALIDO exitosamente. Registros: ' || i;
    end if;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [cargarExtAvvillas] ' || SQLERRM,
            p_error);

  end cargarExtAvvillas;

PROCEDURE cargarExtPopular(p_uploadid        NUMBER,
                             p_idbanco         char,
                             p_cta_recaudo_fcm varchar2,
                             p_usuario         varchar2,
                             p_error           OUT VARCHAR2) is

    v_cuenta        varchar2(16);
    v_indtipo       char(5);
    v_cfile         clob;
    l_clob_len      PLS_INTEGER;
    l_pos           PLS_INTEGER := 1;
    l_amount        BINARY_INTEGER := 32767;
    v_encabezado    VARCHAR2(500) := 'Fecha de aplicacion,Hora,Fecha de transaccion,Transaccion,Causal,Descripcion,documento,Origen,Valor Total,Valor Efectivo,Valor Cheque,D- Debito C- Credito ';
    vBuffer         VARCHAR2(32767);
    v_finlinea      varchar(2);
    v_nombreArchivo varchar2(255);
    v_periodo       char(6);
    v_quincena      char(2);
    r               mvtopopular_temp%rowtype;
    linea           varchar2(1000);

    i     number := 1;
    tk    number := 1;
    v_chr NUMBER := 13; -- 1 tipo de Enter

    v_registros number;
    w_registros number;
    v_total     number;

    campo token_list;

  BEGIN

    delete from mvtoPopular_temp;

    v_cuenta  := Substr(p_cta_recaudo_fcm,
                        Instrb(p_cta_recaudo_fcm, '-', 1, 2) + 1,
                        Length(p_cta_recaudo_fcm));
    v_indtipo := Substr(p_cta_recaudo_fcm,
                        1,
                        Instrb(p_cta_recaudo_fcm, '-', 1, 1) - 1);

    select cfile, filename
      into v_cfile, v_nombreArchivo
      from upload
     where uploadid = p_uploadid;

    v_periodo  := Substr(v_nombreArchivo, 1, 6);
    v_quincena := Substr(v_nombreArchivo, 7, 2);

    select count(*)
      into v_registros
      from recaudo_local_liquidacion l
     where l.periodo = v_periodo
       and l.quincena = v_quincena;

    IF v_registros > 0 THEN
      p_error := 'PERIODO/QUINCENA YA LIQUIDADA. SOLICITAR REPROCESO Y CARGAR ARCHIVO NUEVAMENTE';
      RETURN;
    END IF;

    delete from mvtopopular
     where numerocuenta = v_cuenta
       and periodo = v_periodo
       and quincena = v_quincena;

    delete from trxsinidentificar
     where cuenta = v_cuenta
      -- and ESTADOIDEN <> 'ID'
       and periodo = v_periodo
       and quincena = v_quincena;

    commit;

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

    --Registro #1
    dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);

    if replace(Substr(vBuffer, 12, 9), ' ', '2200') <> v_cuenta then
      p_error := 'Movimiento no corresponde a cuenta seleccionada. Mvto pertenece a la cuenta ' ||
                 replace(Substr(vBuffer, 12, 9), ' ', '2200');
      return;
    end if;

    l_pos := l_pos + l_amount + length(v_finlinea) - 1;

    --Registro #2
    l_amount := dbms_lob.instr(v_cfile, v_finlinea, l_pos, 1);
    IF l_amount < 1 THEN
      p_error := 'No existe Encabezado';
      return;
    else
      l_amount := l_amount - l_pos;
      dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);
      if (instr(lower(vBuffer), lower(v_encabezado)) = 0) then
        p_error := 'Encabezado erroneo. encabezado leido: ' ||
                   lower(vBuffer) || '*' || lower(v_encabezado);
        return;
      end if;
    end if;

    l_pos := l_pos + l_amount + length(v_finlinea);

    --Informacion
    WHILE l_pos < l_clob_len - 1 and p_error is null LOOP
      l_amount := dbms_lob.instr(v_cfile, v_finlinea, l_pos + 1, 1);
      IF l_amount < 1 THEN
        p_error := 'Registro ' || i || ' Invalido';
        return;
      else
        l_amount := l_amount - l_pos;
        dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);

        linea := vBuffer;
        campo := tokenize(str => linea, delim => ',');

        if (campo(1) is null) then
          p_error := 'Error en registro ' || i || '. Formato errado. ' ||
                     '. Datos registro: ' || vBuffer;
          return;

        end if;

        begin

          r.numerocuenta     := v_cuenta;
          r.periodo          := v_periodo;
          r.fechaaplicacion  := to_date(campo(1), 'yyyymmdd');
          r.hora             := campo(2);
          r.fechatransaccion := to_date(campo(3), 'yyyymmdd');
          r.transaccion      := campo(4);
          r.causal           := campo(5);
          r.descripcion      := campo(6);
          r.documento        := campo(7);
          r.origen           := campo(8);
          r.valortotal       := to_number(campo(9), '9999999999999999.99');
          r.valorefectivo    := to_number(campo(10), '9999999999999999.99');
          r.valorcheque      := to_number(campo(11), '9999999999999999.99');
          r.debitocredito    := campo(12);
          r.quincena         := v_quincena;

        EXCEPTION
          WHEN OTHERS THEN
            p_error := 'Error en registro ' || i || '. Mensaje: ' ||
                       SQLERRM || '. Datos registro: ' || vBuffer;
            return;
        END;

      end if;
      l_pos := l_pos + l_amount + length(v_finlinea);
      i     := i + 1;

      insert into mvtoPopular_temp values r;
    END LOOP;

    insert into mvtopopular
      (numeroTrx,
       numerocuenta,
       periodo,
       fechaaplicacion,
       hora,
       fechatransaccion,
       transaccion,
       causal,
       descripcion,
       documento,
       origen,
       valortotal,
       valorefectivo,
       valorcheque,
       debitocredito,
       quincena)
      select seq_mvto.nextval,
             numerocuenta,
             periodo,
             fechaaplicacion,
             hora,
             fechatransaccion,
             transaccion,
             causal,
             descripcion,
             documento,
             origen,
             valortotal,
             valorefectivo,
             valorcheque,
             debitocredito,
             quincena
        from mvtopopular_temp;

    insert into trxsinidentificar
      (idbanco,
       cuenta,
       periodo,
       numerotrx,
       fechatrx,
       descripciontrx,
       valortrx,
       oficinaorigen,
       fechacargue,
       usuariocargue,
       numsecuenciareg,
       estadoiden,
       indTipo,
       p_Consignado,
       quincena,
       vigencia)
      select '02',
             numerocuenta,
             periodo,
             numeroTrx,
             fechatransaccion,
             descripcion,
             valortotal,
             origen,
             sysdate,
             p_usuario,
             seq_ide.nextval,
             'SI',
             v_indtipo as indTipo,
             decode(v_indtipo, 'SIMIT', 10, 55) as p_consignado,
             quincena,
             trim(to_char(fechatransaccion, 'yyyy'))
        from mvtopopular
       where numerocuenta = v_cuenta
         and periodo = v_periodo
         and quincena = v_quincena
         and descripcion in
             (select concepto from conceptosidentificar where idbanco = '02');

    update trxsinidentificar t
       set t.idmunicipio =
           (select min(idmunicipio)
              from oficinabanco o
             where o.idbanco = '02'
               and instr(o.nombre, t.oficinaorigen) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.quincena = v_quincena;

    update trxsinidentificar t
       set t.idmunicipio =
           (select min(idmunicipio)
              from oficinabanco o
             where o.idbanco = '02'
               and instr(t.oficinaorigen, o.nombre) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.quincena = v_quincena
       and t.idmunicipio is null;

    update trxsinidentificar t
       set t.concesionariozon =
           (select m.idconcesionario
              from municipio m
             where m.idmunicipio = t.idmunicipio)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.quincena = v_quincena
       and t.idmunicipio is not null;

    update trxsinidentificar t
       set t.vigencia    = trim(to_char(ADD_MONTHS(t.fechatrx, -1), 'yyyy')),
           t.FECHAINICIO = ADD_MONTHS(t.fechatrx, -1),
           t.FECHAFIN    = ADD_MONTHS(t.fechatrx, -1)
     where t.idmunicipio in
           (select d.divipo
              from divipofechacorte d
             where d.tipofechacorte = 'A')
       and t.periodo = v_periodo
       and t.quincena = v_quincena
       and t.cuenta = v_cuenta;

    update trxsinidentificar t
       set t.vigencia    = trim(to_char(t.fechatrx, 'yyyy')),
           t.FECHAINICIO = t.fechatrx,
           t.FECHAFIN    = t.fechatrx
     where t.idmunicipio in
           (select d.divipo
              from divipofechacorte d
             where d.tipofechacorte = 'D')
       and t.periodo = v_periodo
       and t.quincena = v_quincena
       and t.cuenta = v_cuenta;

    commit;

    i := i - 1;
    if p_error is null then
      p_error := 'El archivo se VALIDO exitosamente. Registros: ' || i;
    end if;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [cargarExtPopular] ' || SQLERRM,
            p_error);

  end cargarExtPopular;

PROCEDURE cargarExtAgrario(p_uploadid        NUMBER,
                             p_idbanco         char,
                             p_cta_recaudo_fcm varchar2,
                             p_usuario         varchar2,
                             p_error           OUT VARCHAR2) is

    v_cuenta        varchar2(16);
    v_indtipo       char(5);
    v_cfile         clob;
    l_clob_len      PLS_INTEGER;
    l_pos           PLS_INTEGER := 1;
    l_amount        BINARY_INTEGER := 32767;
    v_encabezado    VARCHAR2(500) := 'Fecha;Cod. Trn.;Descripcion Movimiento;Referencia;Debito;Credito;Imp. GMF;Oficina;';
    vBuffer         VARCHAR2(32767);
    v_finlinea      varchar(2);
    v_nombreArchivo varchar2(255);
    v_periodo       char(6);
    v_quincena      char(2);

    r     mvtoAgrario_temp%rowtype;
    linea varchar2(1000);

    i     number := 1;
    tk    number := 1;
    v_chr NUMBER := 13; -- 1 tipo de Enter

    v_registros number;
    w_registros number;
    v_total     number;
    finLinea    boolean;

    campo token_list;

  BEGIN

    delete from mvtoAgrario_temp;

    v_cuenta  := Substr(p_cta_recaudo_fcm,
                        Instrb(p_cta_recaudo_fcm, '-', 1, 2) + 1,
                        Length(p_cta_recaudo_fcm));
    v_indtipo := Substr(p_cta_recaudo_fcm,
                        1,
                        Instrb(p_cta_recaudo_fcm, '-', 1, 1) - 1);

    select cfile, filename
      into v_cfile, v_nombreArchivo
      from upload
     where uploadid = p_uploadid;

    v_periodo  := Substr(v_nombreArchivo, 1, 6);
    v_quincena := Substr(v_nombreArchivo, 7, 2);

    select count(*)
      into v_registros
      from recaudo_local_liquidacion l
     where l.periodo = v_periodo
       and l.quincena = v_quincena;

    IF v_registros > 0 THEN
      p_error := 'PERIODO/QUINCENA YA LIQUIDADA. SOLICITAR REPROCESO Y CARGAR ARCHIVO NUEVAMENTE';
      RETURN;
    END IF;

    delete from mvtoAgrario
     where numerocuenta = v_cuenta
       and periodo = v_periodo
       and quincena = v_quincena;

    delete from trxsinidentificar
     where cuenta = v_cuenta
       and ESTADOIDEN <> 'ID'
       and periodo = v_periodo
       and quincena = v_quincena;

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

    --Registro #1
    dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);

    if (instr(lower(vBuffer), lower(v_encabezado)) = 0) then
      p_error := 'Encabezado erroneo. encabezado leido: ' || lower(vBuffer) || '*' ||
                 lower(v_encabezado);
      return;
    end if;

    l_pos := l_pos + l_amount + length(v_finlinea) - 1;

    --Informacion
    WHILE l_pos < l_clob_len - 1 and p_error is null LOOP
      l_amount := dbms_lob.instr(v_cfile, v_finlinea, l_pos + 1, 1);
      IF l_amount < 1 THEN
        p_error := 'Registro ' || i || ' Invalido';
        return;
      else
        l_amount := l_amount - l_pos;
        dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);

        linea := vBuffer;

        finLinea := false;
        if (linea = ';;;;;;;;') then
          finLinea := true;
        end if;

        campo := tokenize(str => linea, delim => ';');

        if (campo(1) is null and not finLinea) then
          p_error := 'Error en registro ' || i || '. Formato errado. ' ||
                     '. Datos registro: ' || vBuffer;
          return;

        end if;

        if (not finLinea) then
          BEGIN
            r.numerocuenta          := v_cuenta;
            r.periodo               := v_periodo;
            r.fecha                 := to_date(campo(1), 'dd/mm/yyyy');
            r.codigotransaccion     := campo(2);
            r.descripcionmovimiento := campo(3);
            r.referencia            := campo(4);

            if (campo(5) is null) then
              r.debito := 0;
            else
              r.debito := to_number(campo(5), '9999,999,999,999,999.99');
            end if;

            if (campo(6) is null) then
              r.credito := 0;
            else
              r.credito := to_number(campo(6), '9999,999,999,999,999.99');
            end if;

            if (campo(7) is null) then
              r.impuestogmf := 0;
            else
              r.impuestogmf := to_number(campo(7),
                                         '9999,999,999,999,999.99');
            end if;

            r.oficina  := campo(8);
            r.quincena := v_quincena;

          EXCEPTION
            WHEN OTHERS THEN
              p_error := 'Error en registro ' || i || '. Mensaje: ' ||
                         SQLERRM || '. Datos registro: ' || vBuffer;
              return;
          END;

        end if;

      end if;

      l_pos := l_pos + l_amount + length(v_finlinea);

      if (not finLinea) then
        i := i + 1;
        insert into mvtoAgrario_temp values r;
      end if;
    END LOOP;

    insert into mvtoagrario
      (numeroTrx,
       numerocuenta,
       periodo,
       fecha,
       codigotransaccion,
       descripcionmovimiento,
       referencia,
       debito,
       credito,
       impuestogmf,
       oficina,
       quincena)
      select seq_mvto.nextval,
             numerocuenta,
             periodo,
             fecha,
             codigotransaccion,
             descripcionmovimiento,
             referencia,
             debito,
             credito,
             impuestogmf,
             oficina,
             quincena
        from mvtoagrario_temp;

    insert into trxsinidentificar
      (idbanco,
       cuenta,
       periodo,
       numerotrx,
       fechatrx,
       descripciontrx,
       valortrx,
       oficinaorigen,
       fechacargue,
       usuariocargue,
       numsecuenciareg,
       estadoiden,
       indTipo,
       p_consignado,
       quincena,
       vigencia)
      select '40',
             numerocuenta,
             periodo,
             numeroTrx,
             fecha,
             descripcionmovimiento,
             credito,
             oficina,
             sysdate,
             p_usuario,
             seq_ide.nextval,
             'SI',
             v_indtipo as indTipo,
             decode(v_indtipo, 'SIMIT', 10, 55) as p_consignado,
             quincena,
             trim(to_char(fecha, 'yyyy'))
        from mvtoagrario
       where numerocuenta = v_cuenta
         and periodo = v_periodo
         and quincena = v_quincena
         and descripcionmovimiento in
             (select concepto from conceptosidentificar where idbanco = '40');

    update trxsinidentificar t
       set t.idmunicipio =
           (select min(idmunicipio)
              from oficinabanco o
             where o.idbanco = '40'
               and instr(o.nombre, t.oficinaorigen) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and quincena = v_quincena;

    update trxsinidentificar t
       set t.idmunicipio =
           (select min(idmunicipio)
              from oficinabanco o
             where o.idbanco = '40'
               and instr(t.oficinaorigen, o.nombre) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and quincena = v_quincena
       and t.idmunicipio is null;

    update trxsinidentificar t
       set t.concesionariozon =
           (select m.idconcesionario
              from municipio m
             where m.idmunicipio = t.idmunicipio)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and quincena = v_quincena
       and t.idmunicipio is not null;

    update trxsinidentificar t
       set t.vigencia    = trim(to_char(ADD_MONTHS(t.fechatrx, -1), 'yyyy')),
           t.FECHAINICIO = ADD_MONTHS(t.fechatrx, -1),
           t.FECHAFIN    = ADD_MONTHS(t.fechatrx, -1)
     where t.idmunicipio in
           (select d.divipo
              from divipofechacorte d
             where d.tipofechacorte = 'A')
       and t.periodo = v_periodo
       and t.quincena = v_quincena
       and t.cuenta = v_cuenta;

    update trxsinidentificar t
       set t.vigencia    = trim(to_char(t.fechatrx, 'yyyy')),
           t.FECHAINICIO = t.fechatrx,
           t.FECHAFIN    = t.fechatrx
     where t.idmunicipio in
           (select d.divipo
              from divipofechacorte d
             where d.tipofechacorte = 'D')
       and t.periodo = v_periodo
       and t.quincena = v_quincena
       and t.cuenta = v_cuenta;

    commit;

    i := i - 1;
    if p_error is null then
      p_error := 'El archivo se VALIDO exitosamente. Registros: ' || i;
    end if;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [cargarExtAgrario] ' || SQLERRM,
            p_error);

  end cargarExtAgrario;

  PROCEDURE cargarExtBancafe(p_uploadid        NUMBER,
                             p_idbanco         char,
                             p_cta_recaudo_fcm varchar2,
                             p_usuario         varchar2,
                             p_error           OUT VARCHAR2) is

    v_cuenta        varchar2(16);
    v_indtipo       char(5);
    v_cfile         clob;
    l_clob_len      PLS_INTEGER;
    l_pos           PLS_INTEGER := 1;
    l_amount        BINARY_INTEGER := 32767;
    v_encabezado    VARCHAR2(500) := 'Fecha;Cod. Trn.;Descripcion Movimiento;Referencia;Debito;Credito;Imp. GMF;Oficina;';
    vBuffer         VARCHAR2(32767);
    v_finlinea      varchar(2);
    v_nombreArchivo varchar2(255);
    v_periodo       char(6);
    v_quincena      char(2);

    r     mvtoBancafe_temp%rowtype;
    linea varchar2(1000);

    i     number := 1;
    tk    number := 1;
    v_chr NUMBER := 13; -- 1 tipo de Enter

    v_registros number;
    w_registros number;
    v_total     number;
    finLinea    boolean;

    campo token_list;

  BEGIN

    delete from mvtoBancafe_temp;

    v_cuenta  := Substr(p_cta_recaudo_fcm,
                        Instrb(p_cta_recaudo_fcm, '-', 1, 2) + 1,
                        Length(p_cta_recaudo_fcm));
    v_indtipo := Substr(p_cta_recaudo_fcm,
                        1,
                        Instrb(p_cta_recaudo_fcm, '-', 1, 1) - 1);

    select cfile, filename
      into v_cfile, v_nombreArchivo
      from upload
     where uploadid = p_uploadid;

    v_periodo  := Substr(v_nombreArchivo, 1, 6);
    v_quincena := Substr(v_nombreArchivo, 7, 2);

    select count(*)
      into v_registros
      from recaudo_local_liquidacion l
     where l.periodo = v_periodo
       and l.quincena = v_quincena;

    IF v_registros > 0 THEN
      p_error := 'PERIODO/QUINCENA YA LIQUIDADA. SOLICITAR REPROCESO Y CARGAR ARCHIVO NUEVAMENTE';
      RETURN;
    END IF;

    delete from mvtoBancafe
     where numerocuenta = v_cuenta
       and periodo = v_periodo
       and quincena = v_quincena;

    delete from trxsinidentificar
     where cuenta = v_cuenta
       and ESTADOIDEN <> 'ID'
       and periodo = v_periodo
       and quincena = v_quincena;

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

    --Informacion
    WHILE l_pos < l_clob_len - 1 and p_error is null LOOP
      l_amount := dbms_lob.instr(v_cfile, v_finlinea, l_pos + 1, 1);
      IF l_amount < 1 THEN
        p_error := 'Registro ' || i || ' Invalido';
        return;
      else
        l_amount := l_amount - l_pos;
        dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);

        linea := vBuffer;

        BEGIN
          if (v_cuenta <> substr(linea, 20, 9)) then
            p_error := 'Archivo no corresponde a la cuenta. Cuenta del archivo  ' ||
                       substr(linea, 20, 9) || '- Cuenta ingresada: ' ||
                       v_cuenta;
            return;
          end if;

          r.numerocuenta     := v_cuenta;
          r.periodo          := v_periodo;
          r.tipodoc          := substr(linea, 1, 1);
          r.numerodocumento  := substr(linea, 8, 9);
          r.codigoaplicacion := substr(linea, 17, 1);
          r.numerocta        := substr(linea, 20, 9);
          r.fechaproceso     := to_date(substr(linea, 29, 8), 'yyyymmdd');
          r.fechatrx         := to_date(substr(linea, 37, 8), 'yyyymmdd');
          r.codigotrx        := substr(linea, 45, 4);
          r.descripciontrx   := trim(substr(linea, 49, 40)) || ' ' ||
                                substr(linea, 201, 24);
          r.oficinasede      := substr(linea, 89, 5);
          r.oficinareceptora := substr(linea, 94, 5);
          r.nombreoficina    := trim(substr(linea, 99, 20));
          r.nrodocumento     := substr(linea, 119, 11);
          r.tipoespecie      := substr(linea, 130, 2);
          r.valortrx         := to_number(substr(linea, 132, 15),
                                          '999999999999999') / 100;
          r.saldoanterior    := to_number(substr(linea, 147, 15),
                                          '999999999999999') / 10;
          r.tiporecaudo      := substr(linea, 162, 1);
          r.fuentetrx        := '';
          r.codigoiac        := '';
          r.referencia1      := substr(linea, 177, 24);
          r.referencia2      := substr(linea, 201, 24);
          r.secuencia        := substr(linea, 225, 9);
          r.tipotrx          := substr(linea, 234, 1);
          r.quincena         := v_quincena;

        EXCEPTION
          WHEN OTHERS THEN
            p_error := 'Error en registro ' || i || '. Mensaje: ' ||
                       SQLERRM || '. Datos registro: ' || vBuffer;
            return;
        END;

      end if;

      l_pos := l_pos + l_amount + length(v_finlinea);

      i := i + 1;
      insert into mvtoBancafe_temp values r;

    END LOOP;

    insert into mvtobancafe
      (numeroTrx,
       numerocuenta,
       periodo,
       tipodoc,
       numerodocumento,
       codigoaplicacion,
       numerocta,
       fechaproceso,
       fechatrx,
       codigotrx,
       descripciontrx,
       oficinasede,
       oficinareceptora,
       nombreoficina,
       nrodocumento,
       tipoespecie,
       valortrx,
       saldoanterior,
       tiporecaudo,
       fuentetrx,
       codigoiac,
       referencia1,
       referencia2,
       secuencia,
       tipotrx,
       quincena)
      select seq_mvto.nextval,
             numerocuenta,
             periodo,
             tipodoc,
             numerodocumento,
             codigoaplicacion,
             numerocta,
             fechaproceso,
             fechatrx,
             codigotrx,
             descripciontrx,
             oficinasede,
             oficinareceptora,
             nombreoficina,
             nrodocumento,
             tipoespecie,
             valortrx,
             saldoanterior,
             tiporecaudo,
             fuentetrx,
             codigoiac,
             referencia1,
             referencia2,
             secuencia,
             tipotrx,
             quincena
        from mvtobancafe_temp;

    commit;

    insert into trxsinidentificar
      (idbanco,
       cuenta,
       periodo,
       numerotrx,
       fechatrx,
       descripciontrx,
       valortrx,
       oficinaorigen,
       fechacargue,
       usuariocargue,
       numsecuenciareg,
       estadoiden,
       indTipo,
       p_consignado,
       observaciones,
       quincena,
       vigencia)
      select '50',
             numerocuenta,
             periodo,
             numeroTrx,
             fechatrx,
             descripciontrx,
             valortrx,
             nombreoficina,
             sysdate,
             p_usuario,
             seq_ide.nextval,
             'SI',
             v_indtipo as indTipo,
             decode(v_indtipo, 'SIMIT', 10, 55) as p_consignado,
             referencia1 || referencia2,
             quincena,
             trim(to_char(fechatrx, 'yyyy'))
        from mvtobancafe
       where numerocuenta = v_cuenta
         and periodo = v_periodo
         and quincena = v_quincena
         and descripciontrx in
             (select concepto from conceptosidentificar where idbanco = '50');

    update trxsinidentificar t
       set t.idmunicipio =
           (select m.idmunicipio
              from municipio m, mvtobancafe b
             where t.numerotrx = b.numerotrx
               and instr(b.descripciontrx, 'CONSIGNACION CONVENIO') > 0
               and substr(b.referencia2, 22, 3) = '000'
               and m.idmunicipio = substr(b.referencia2, 17, 8))
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.quincena = v_quincena;

    update trxsinidentificar t
       set t.idmunicipio =
           (select min(m.idmunicipio)
              from municipio m, mvtobancafe b
             where t.numerotrx = b.numerotrx
               and instr(b.descripciontrx, 'CONSIGNACION CONVENIO') > 0
               and substr(b.referencia2, 22, 3) <> '000'
               and instr(m.idmunicipio, substr(b.referencia2, 20, 5)) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and quincena = v_quincena
       and t.idmunicipio is null;

    update trxsinidentificar t
       set t.idmunicipio =
           (select min(m.idmunicipio)
              from municipio m, mvtobancafe b
             where t.numerotrx = b.numerotrx
               and instr(b.descripciontrx, 'CONSIGNACION CONVENIO') > 0
               and instr(m.nit_m, substr(b.referencia1, 16, 9)) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.idmunicipio is null;

    update trxsinidentificar t
       set t.idmunicipio =
           (select min(m.idmunicipio)
              from municipio m, mvtobancafe b
             where t.numerotrx = b.numerotrx
               and instr(b.descripciontrx, 'CONSIGNACION CONVENIO') > 0
               and instr(m.nit_m, substr(b.referencia1, 15, 9)) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and quincena = v_quincena
       and t.idmunicipio is null;

    update trxsinidentificar t
       set t.idmunicipio =
           (select min(m.idmunicipio)
              from municipio m, mvtobancafe b
             where t.numerotrx = b.numerotrx
               and instr(b.descripciontrx, 'CONSIGNACION CONVENIO') > 0
               and instr(m.nit_cta, substr(b.referencia1, 16, 9)) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.quincena = v_quincena
       and t.idmunicipio is null;

    update trxsinidentificar t
       set t.idmunicipio =
           (select min(m.idmunicipio)
              from municipio m, mvtobancafe b
             where t.numerotrx = b.numerotrx
               and instr(b.descripciontrx, 'CONSIGNACION CONVENIO') > 0
               and instr(m.nit_cta, substr(b.referencia1, 15, 9)) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.quincena = v_quincena
       and t.idmunicipio is null;

    update trxsinidentificar t
       set t.idmunicipio =
           (select min(idmunicipio)
              from oficinabanco o
             where o.idbanco = '50'
               and instr(t.oficinaorigen, o.nombre) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.quincena = v_quincena
       and t.idmunicipio is null;

    update trxsinidentificar t
       set t.idmunicipio =
           (select min(idmunicipio)
              from oficinabanco o
             where o.idbanco = '50'
               and instr(o.nombre, t.oficinaorigen) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.quincena = v_quincena
       and t.idmunicipio is null;

    update trxsinidentificar t
       set t.concesionariozon =
           (select m.idconcesionario
              from municipio m
             where m.idmunicipio = t.idmunicipio)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.quincena = v_quincena
       and t.idmunicipio is not null;

    update trxsinidentificar t
       set t.vigencia    = trim(to_char(ADD_MONTHS(t.fechatrx, -1), 'yyyy')),
           t.FECHAINICIO = ADD_MONTHS(t.fechatrx, -1),
           t.FECHAFIN    = ADD_MONTHS(t.fechatrx, -1)
     where t.idmunicipio in
           (select d.divipo
              from divipofechacorte d
             where d.tipofechacorte = 'A')
       and t.periodo = v_periodo
       and t.quincena = v_quincena
       and t.cuenta = v_cuenta;

    update trxsinidentificar t
       set t.vigencia    = trim(to_char(t.fechatrx, 'yyyy')),
           t.FECHAINICIO = t.fechatrx,
           t.FECHAFIN    = t.fechatrx
     where t.idmunicipio in
           (select d.divipo
              from divipofechacorte d
             where d.tipofechacorte = 'D')
       and t.periodo = v_periodo
       and t.quincena = v_quincena
       and t.cuenta = v_cuenta;

    commit;

    i := i - 1;
    if p_error is null then
      p_error := 'El archivo se VALIDO exitosamente. Registros: ' || i;
    end if;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [cargarExtBancafe] ' || SQLERRM,
            p_error);

  end cargarExtBancafe;

  PROCEDURE cargarExtDavivienda(p_uploadid        NUMBER,
                                p_idbanco         char,
                                p_cta_recaudo_fcm varchar2,
                                p_usuario         varchar2,
                                p_error           OUT VARCHAR2) is

    v_cuenta        varchar2(16);
    v_indtipo       char(5);
    v_cfile         clob;
    l_clob_len      PLS_INTEGER;
    l_pos           PLS_INTEGER := 1;
    l_amount        BINARY_INTEGER := 32767;
    v_encabezado    VARCHAR2(500) := '';
    vBuffer         VARCHAR2(32767);
    v_finlinea      varchar(2);
    v_nombreArchivo varchar2(255);
    v_periodo       char(6);
    v_quincena      char(2);

    r     mvtoDavivienda_temp%rowtype;
    linea varchar2(1000);

    i     number := 1;
    tk    number := 1;
    v_chr NUMBER := 13; -- 1 tipo de Enter

    v_registros number;
    w_registros number;
    v_total     number;
    finLinea    boolean;

    campo token_list;

  BEGIN

    delete from mvtoDavivienda_temp;

    v_cuenta  := Substr(p_cta_recaudo_fcm,
                        Instrb(p_cta_recaudo_fcm, '-', 1, 2) + 1,
                        Length(p_cta_recaudo_fcm));
    v_indtipo := Substr(p_cta_recaudo_fcm,
                        1,
                        Instrb(p_cta_recaudo_fcm, '-', 1, 1) - 1);

    select cfile, filename
      into v_cfile, v_nombreArchivo
      from upload
     where uploadid = p_uploadid;

    v_periodo  := Substr(v_nombreArchivo, 1, 6);
    v_quincena := Substr(v_nombreArchivo, 7, 2);

    select count(*)
      into v_registros
      from recaudo_local_liquidacion l
     where l.periodo = v_periodo
       and l.quincena = v_quincena;

    IF v_registros > 0 THEN
      p_error := 'PERIODO/QUINCENA YA LIQUIDADA. SOLICITAR REPROCESO Y CARGAR ARCHIVO NUEVAMENTE';
      RETURN;
    END IF;

    delete from mvtoDavivienda
     where numerocuenta = v_cuenta
       and periodo = v_periodo
       and quincena = v_quincena;

    delete from trxsinidentificar
     where cuenta = v_cuenta
       and ESTADOIDEN <> 'ID'
       and periodo = v_periodo
       and quincena = v_quincena;

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

    --Informacion
    WHILE l_pos < l_clob_len - 1 and p_error is null LOOP
      l_amount := dbms_lob.instr(v_cfile, v_finlinea, l_pos + 1, 1);
      IF l_amount < 1 THEN
        p_error := 'Registro ' || i || ' Invalido';
        return;
      else
        l_amount := l_amount - l_pos;
        dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);

        linea := vBuffer;

        BEGIN
          if (v_cuenta <> substr(linea, 20, 9)) then
            p_error := 'Archivo no corresponde a la cuenta. Cuenta del archivo  ' ||
                       substr(linea, 20, 9) || '- Cuenta ingresada: ' ||
                       v_cuenta;
            return;
          end if;

          r.numerocuenta     := v_cuenta;
          r.periodo          := v_periodo;
          r.tipo             := substr(linea, 1, 4);
          r.fechaproceso     := to_date(substr(linea, 5, 8), 'yyyymmdd');
          r.cuenta           := substr(linea, 20, 9);
          r.fechareal        := to_date(substr(linea, 29, 8), 'yyyymmdd');
          r.hora             := substr(linea, 37, 6);
          r.terminal         := substr(linea, 43, 6);
          r.talon            := substr(linea, 49, 8);
          r.valorcheque      := to_number(substr(linea, 57, 19),
                                          'S999999999999999999') / 100;
          r.valortotal       := to_number(substr(linea, 76, 19),
                                          'S999999999999999999') / 100;
          r.valorunidad      := to_number(substr(linea, 95, 19),
                                          'S999999999999999999') / 10000;
          r.oficinarecaudo   := substr(linea, 114, 4);
          r.motivo           := substr(linea, 118, 4);
          r.referencia1      := substr(linea, 122, 16);
          r.referencia2      := substr(linea, 138, 16);
          r.saldoantes       := to_number(substr(linea, 154, 19),
                                          'S999999999999999999') / 100;
          r.indicadorexcento := substr(linea, 173, 2);
          r.valorexcento     := to_number(substr(linea, 175, 19),
                                          'S999999999999999999') / 100;
          r.canal            := substr(linea, 194, 2);
          r.causaldevolucion := substr(linea, 196, 4);
          r.jornada          := substr(linea, 200, 1);
          r.quincena         := v_quincena;

        EXCEPTION
          WHEN OTHERS THEN
            p_error := 'Error en registro ' || i || '. Mensaje: ' ||
                       SQLERRM || '. Datos registro: ' || vBuffer;
            return;
        END;

      end if;

      l_pos := l_pos + l_amount + length(v_finlinea);

      i := i + 1;
      insert into mvtoDavivienda_temp values r;

    END LOOP;

    insert into mvtodavivienda
      (numerocuenta,
       periodo,
       tipo,
       fechaproceso,
       cuenta,
       fechareal,
       hora,
       terminal,
       talon,
       valorcheque,
       valortotal,
       valorunidad,
       oficinarecaudo,
       motivo,
       referencia1,
       referencia2,
       saldoantes,
       indicadorexcento,
       valorexcento,
       canal,
       causaldevolucion,
       jornada,
       numerotrx,
       quincena)
      select numerocuenta,
             periodo,
             tipo,
             fechaproceso,
             cuenta,
             fechareal,
             hora,
             terminal,
             talon,
             valorcheque,
             valortotal,
             valorunidad,
             oficinarecaudo,
             motivo,
             referencia1,
             referencia2,
             saldoantes,
             indicadorexcento,
             valorexcento,
             canal,
             causaldevolucion,
             jornada,
             seq_mvto.nextval,
             quincena
        from mvtodavivienda_temp;

    update mvtodavivienda m
       set m.nombreTipo =
           (select t.descripcion from tipoMvto t where t.tipo = m.tipo)
     where m.numerocuenta = v_cuenta
       and m.periodo = v_periodo
       and m.quincena = v_quincena;

    commit;

    insert into trxsinidentificar
      (idbanco,
       cuenta,
       periodo,
       numerotrx,
       fechatrx,
       descripciontrx,
       valortrx,
       oficinaorigen,
       fechacargue,
       usuariocargue,
       numsecuenciareg,
       estadoiden,
       indTipo,
       p_consignado,
       observaciones,
       quincena,
       vigencia)
      select '51',
             numerocuenta,
             periodo,
             numeroTrx,
             fechaReal,
             nombreTipo,
             valorTotal,
             oficinaRecaudo,
             sysdate,
             p_usuario,
             seq_ide.nextval,
             'SI',
             v_indtipo as indTipo,
             decode(v_indtipo, 'SIMIT', 10, 55) as p_consignado,
             referencia1 || referencia2,
             quincena,
             trim(to_char(fechaReal, 'yyyy'))
        from mvtoDavivienda
       where numerocuenta = v_cuenta
         and periodo = v_periodo
         and quincena = v_quincena
         and tipo in ('0034', '0035', '0036', '0039');

    update trxsinidentificar t
       set t.idmunicipio =
           (select m.idmunicipio
              from municipio m, mvtoDavivienda b
             where t.numerotrx = b.numerotrx
               and m.idmunicipio = substr(b.referencia2, 9, 8))
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.quincena = v_quincena;

    update trxsinidentificar t
       set t.idmunicipio =
           (select min(m.idmunicipio)
              from municipio m, mvtobancafe b
             where t.numerotrx = b.numerotrx
               and instr(m.nit_m, substr(b.referencia1, 7, 9)) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.quincena = v_quincena
       and t.idmunicipio is null;

    update trxsinidentificar t
       set t.concesionariozon =
           (select m.idconcesionario
              from municipio m
             where m.idmunicipio = t.idmunicipio)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.quincena = v_quincena
       and t.idmunicipio is not null;

    update trxsinidentificar t
       set t.vigencia    = trim(to_char(ADD_MONTHS(t.fechatrx, -1), 'yyyy')),
           t.FECHAINICIO = ADD_MONTHS(t.fechatrx, -1),
           t.FECHAFIN    = ADD_MONTHS(t.fechatrx, -1)
     where t.idmunicipio in
           (select d.divipo
              from divipofechacorte d
             where d.tipofechacorte = 'A')
       and t.periodo = v_periodo
       and t.quincena = v_quincena
       and t.cuenta = v_cuenta;

    update trxsinidentificar t
       set t.vigencia    = trim(to_char(t.fechatrx, 'yyyy')),
           t.FECHAINICIO = t.fechatrx,
           t.FECHAFIN    = t.fechatrx
     where t.idmunicipio in
           (select d.divipo
              from divipofechacorte d
             where d.tipofechacorte = 'D')
       and t.periodo = v_periodo
       and t.quincena = v_quincena
       and t.cuenta = v_cuenta;

    commit;

    i := i - 1;
    if p_error is null then
      p_error := 'El archivo se VALIDO exitosamente. Registros: ' || i;
    end if;


  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [cargarExtDavivienda] ' || SQLERRM,
            p_error);

  end cargarExtDavivienda;

  PROCEDURE cargarMovAvvillas(p_uploadid        NUMBER,
                              p_idbanco         char,
                              p_cta_recaudo_fcm varchar2,
                              p_usuario         varchar2,
                              p_error           OUT VARCHAR2) is

    v_cuenta        varchar2(16);
    v_indtipo       char(5);
    v_cfile         clob;
    l_clob_len      PLS_INTEGER;
    l_pos           PLS_INTEGER := 1;
    l_amount        BINARY_INTEGER := 32767;
    v_encabezado    VARCHAR2(500) := 'Fecha de aplicacion,Fecha de transaccion,Descripcion,documento,Origen,Valor Total,Valor Efectivo,Valor Cheque,D- Debito C- Credito,Codigo de Transaccion';
    vBuffer         VARCHAR2(32767);
    v_finlinea      varchar(2);
    v_nombreArchivo varchar2(255);
    v_periodo       char(6);
    v_quincena      char(2);
    r               mvtoavvillas_temp%rowtype;
    linea           varchar2(1000);

    i     number := 1;
    tk    number := 1;
    v_chr NUMBER := 13; -- 1 tipo de Enter

    v_registros number;
    w_registros number;
    v_total     number;

    campo token_list;

    CURSOR tabla IS
      select idbanco,
             cuenta,
             periodo,
             numerotrx,
             fechatrx,
             descripciontrx,
             valortrx,
             oficinaorigen,
             indtipo,
             idmunicipio,
             p_consignado,
             fechacargue,
             usuariocargue,
             fechaidentificacion,
             usuarioidentificacion,
             indtipoiden,
             idmunicipioiden,
             p_consignadoiden,
             observaciones,
             numsecuenciareg,
             estadoiden,
             quincena
        from trxsinidentificar
       where idbanco = '52'
         and cuenta = v_cuenta
         and periodo = v_periodo
         and quincena = v_quincena
         and descripciontrx like 'NC TRANS ACH%';

    v_idMunicipio char(8);
    v_nit         char(9);
    v_reg         number;

  BEGIN

    delete from mvtoAvvillas_temp;

    select cfile, filename
      into v_cfile, v_nombreArchivo
      from upload
     where uploadid = p_uploadid;

    v_periodo  := Substr(v_nombreArchivo, 1, 6);
    v_quincena := Substr(v_nombreArchivo, 7, 2);

    select count(*)
      into v_registros
      from recaudo_local_liquidacion l
     where l.periodo = v_periodo
       and l.quincena = v_quincena;

    IF w_registros > 0 THEN
      p_error := 'PERIODO/QUINCENA YA LIQUIDADA. SOLICITAR REPROCESO Y CARGAR ARCHIVO NUEVAMENTE';
      RETURN;
    END IF;

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

    --Registro #1
    dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);

    /*    if replace(Substr(vBuffer, 12, 9), ' ', '0') <> v_cuenta then
          p_error := 'Movimiento no corresponde a cuenta seleccionada. Mvto pertenece a la cuenta ' ||
                     replace(Substr(vBuffer, 12, 9), ' ', '0');
          return;
        end if;
    */

    v_cuenta := replace(Substr(vBuffer, 12, 9), ' ', '0');

    select indtipo
      into v_indtipo
      from cta_recaudo_fcm
     where cuenta = v_cuenta
       and idbanco = '52';

    delete from mvtoavvillas
     where numerocuenta = v_cuenta
       and periodo = v_periodo
       and quincena = v_quincena;

    delete from trxsinidentificar
     where cuenta = v_cuenta
  --     and ESTADOIDEN <> 'ID'
       and periodo = v_periodo
       and quincena = v_quincena
       and ( descripciontrx in
             (select concepto from conceptosidentificar where idbanco = '52')
            or descripciontrx like 'NC TRANS ACH%' );

    l_pos := l_pos + l_amount + length(v_finlinea) - 1;

    --Registro #2
    l_amount := dbms_lob.instr(v_cfile, v_finlinea, l_pos, 1);
    IF l_amount < 1 THEN
      p_error := 'No existe Encabezado';
      return;
    else
      l_amount := l_amount - l_pos;
      dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);
      if (instr(lower(vBuffer), lower(v_encabezado)) = 0) then
        p_error := 'Encabezado erroneo. encabezado leido: ' ||
                   lower(vBuffer) || '*' || lower(v_encabezado);
        return;
      end if;
    end if;

    l_pos := l_pos + l_amount + length(v_finlinea);

    --Informacion
    WHILE l_pos < l_clob_len - 1 and p_error is null LOOP
      l_amount := dbms_lob.instr(v_cfile, v_finlinea, l_pos + 1, 1);
      IF l_amount < 1 THEN
        p_error := 'Registro ' || i || ' Invalido';
        return;
      else
        l_amount := l_amount - l_pos;
        dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);

        linea := vBuffer;
        campo := tokenize(str => linea, delim => ',');

        if (campo(1) is null) then
          p_error := 'Error en registro ' || i || '. Formato errado. ' ||
                     '. Datos registro: ' || vBuffer;
          return;

        end if;
        BEGIN
          r.numerocuenta     := v_cuenta;
          r.periodo          := v_periodo;
          r.fechaaplicacion  := to_date(campo(1), 'yyyymmdd');
          r.fechatransaccion := to_date(campo(2), 'yyyymmdd');
          r.descripcion      := campo(3);
          r.documento        := campo(4);
          r.origen           := campo(5);
          r.valortotal       := to_number(campo(6), '9999999999999999.99');
          r.valorefectivo    := to_number(campo(7), '9999999999999999.99');
          r.valorcheque      := to_number(campo(8), '9999999999999999.99');
          r.debitocredito    := campo(9);
          r.codigotrn        := campo(10);
          r.quincena         := v_quincena;

        EXCEPTION
          WHEN OTHERS THEN
            p_error := 'Error en registro ' || i || '. Mensaje: ' ||
                       SQLERRM || '. Datos registro: ' || vBuffer;
            return;
        END;

      end if;
      l_pos := l_pos + l_amount + length(v_finlinea);
      i     := i + 1;

      insert into mvtoavvillas_temp values r;
    END LOOP;

    insert into mvtoavvillas
      (numeroTrx,
       numerocuenta,
       periodo,
       fechaaplicacion,
       fechatransaccion,
       descripcion,
       documento,
       origen,
       valortotal,
       valorefectivo,
       valorcheque,
       debitocredito,
       codigotrn,
       quincena)
      select seq_mvto.nextval,
             numerocuenta,
             periodo,
             fechaaplicacion,
             fechatransaccion,
             descripcion,
             documento,
             origen,
             valortotal,
             valorefectivo,
             valorcheque,
             debitocredito,
             codigotrn,
             quincena
        from mvtoavvillas_temp;

    insert into trxsinidentificar
      (idbanco,
       cuenta,
       periodo,
       numerotrx,
       fechatrx,
       descripciontrx,
       valortrx,
       oficinaorigen,
       indtipo,
       idmunicipio,
       p_consignado,
       fechacargue,
       usuariocargue,
       fechaidentificacion,
       usuarioidentificacion,
       indtipoiden,
       idmunicipioiden,
       p_consignadoiden,
       observaciones,
       numsecuenciareg,
       estadoiden,
       quincena,
       vigencia)
      select '52' as idBanco,
             numerocuenta,
             periodo,
             numeroTrx,
             fechatransaccion,
             descripcion,
             valortotal,
             origen,
             v_indtipo as indTipo,
             '' as idMunicipio,
             decode(v_indtipo, 'SIMIT', 10, 55) as p_consignado,
             sysdate,
             p_usuario,
             null as fechaIde,
             null as usuarioIde,
             null as indtipoiden,
             null as idmunicipioiden,
             null p_consignadoiden,
             null as observaciones,
             seq_ide.nextval as numsecuenciareg,
             'SI' as estadoiden,
             quincena,
             trim(to_char(fechatransaccion, 'yyyy'))
        from mvtoavvillas
       where numerocuenta = v_cuenta
         and periodo = v_periodo
         and quincena = v_quincena
         and descripcion in
             (select concepto from conceptosidentificar where idbanco = '52');

    insert into trxsinidentificar
      (idbanco,
       cuenta,
       periodo,
       numerotrx,
       fechatrx,
       descripciontrx,
       valortrx,
       oficinaorigen,
       indtipo,
       idmunicipio,
       p_consignado,
       fechacargue,
       usuariocargue,
       fechaidentificacion,
       usuarioidentificacion,
       indtipoiden,
       idmunicipioiden,
       p_consignadoiden,
       observaciones,
       numsecuenciareg,
       estadoiden,
       quincena,
       vigencia)
      select '52' as idBanco,
             numerocuenta,
             periodo,
             numeroTrx,
             fechatransaccion,
             descripcion,
             valortotal,
             origen,
             v_indtipo as indTipo,
             '' as idMunicipio,
             decode(v_indtipo, 'SIMIT', 10, 55) as p_consignado,
             sysdate,
             p_usuario,
             null as fechaIde,
             null as usuarioIde,
             null as indtipoiden,
             null as idmunicipioiden,
             null p_consignadoiden,
             null as observaciones,
             seq_ide.nextval as numsecuenciareg,
             'SI' as estadoiden,
             quincena,
             trim(to_char(fechatransaccion, 'yyyy'))
        from mvtoavvillas
       where numerocuenta = v_cuenta
         and periodo = v_periodo
         and quincena = v_quincena
         and descripcion like 'NC TRANS ACH%';

    for registro in tabla loop
      v_idMunicipio := null;
      if (substr(registro.descripciontrx, 18, 1) = '0') then
        v_nit := substr(registro.descripciontrx, 19, 9);
      else
        v_nit := substr(registro.descripciontrx, 18, 9);
      end if;

      select count(*)
        into v_reg
        from municipio
       where instr(nit_m, v_nit) > 0;

      if (v_reg > 0) then

        select substr(min(idMunicipio), 1, 8)
          into v_idMunicipio
          from municipio
         where instr(nit_m, v_nit) > 0;
      else
        select count(*)
          into v_reg
          from municipio
         where instr(nit_cta, v_nit) > 0;

        if (v_reg > 0) then

          select substr(min(idMunicipio), 1, 8)
            into v_idMunicipio
            from municipio
           where instr(nit_cta, v_nit) > 0;

        end if;
      end if;

      if (v_idMunicipio is not null) then
        update trxsinidentificar
           set idmunicipio = v_idMunicipio
         where numsecuenciareg = registro.numsecuenciareg;

        update trxsinidentificar
           set concesionariozon =
               (select m.idconcesionario
                  from municipio m
                 where m.idmunicipio = v_idMunicipio)
         where numsecuenciareg = registro.numsecuenciareg;

      end if;

    end loop;

    update trxsinidentificar t
       set t.vigencia    = trim(to_char(ADD_MONTHS(t.fechatrx, -1), 'yyyy')),
           t.FECHAINICIO = ADD_MONTHS(t.fechatrx, -1),
           t.FECHAFIN    = ADD_MONTHS(t.fechatrx, -1)
     where t.idmunicipio in
           (select d.divipo
              from divipofechacorte d
             where d.tipofechacorte = 'A')
       and t.periodo = v_periodo
       and t.quincena = v_quincena
       and t.cuenta = v_cuenta;

    update trxsinidentificar t
       set t.vigencia    = trim(to_char(t.fechatrx, 'yyyy')),
           t.FECHAINICIO = t.fechatrx,
           t.FECHAFIN    = t.fechatrx
     where t.idmunicipio in
           (select d.divipo
              from divipofechacorte d
             where d.tipofechacorte = 'D')
       and t.periodo = v_periodo
       and t.quincena = v_quincena
       and t.cuenta = v_cuenta;

    commit;

    i := i - 1;
    if p_error is null then
      p_error := 'El archivo se VALIDO exitosamente. Registros: ' || i;
    end if;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [cargarMovAvvillas] ' || SQLERRM,
            p_error);

  end cargarMovAvvillas;

  PROCEDURE cargarIdeMasiva(p_uploadid        NUMBER,
                            p_idbanco         char,
                            p_cta_recaudo_fcm varchar2,
                            p_usuario         varchar2,
                            p_error           OUT VARCHAR2) is

    v_cuenta        varchar2(16);
    v_indtipo       char(5);
    v_cfile         clob;
    l_clob_len      PLS_INTEGER;
    l_pos           PLS_INTEGER := 1;
    l_amount        BINARY_INTEGER := 32767;
    v_encabezado    VARCHAR2(500) := 'Concesionario Zonal;Estado ;Periodo;Cuenta;Municipio Propuesto;DIVIPO Propuesto ;Tipo Propuesto;% Propuesto;DIVIPO Asignado ;Municipio Asignado;Tipo Asignado;% Asignado;Valor Transaccion;Banco;Cuenta;Periodo;Fecha Transaccion;Descripcion;Oficina;secuencia';
    vBuffer         VARCHAR2(32767);
    v_finlinea      varchar(2);
    v_nombreArchivo varchar2(255);
    v_periodo       char(6);
    v_quincena      char(2);
    r               idemasivo_temp%rowtype;
    linea           varchar2(1000);

    i     number := 1;
    tk    number := 1;
    v_chr NUMBER := 13; -- 1 tipo de Enter

    v_registros number;
    w_registros number;
    v_total     number;

    campo token_list;

    v_idMunicipio char(8);
    v_nit         char(9);
    v_reg         number;
    v_aplicar     number;
    v_numreg      number;

    v_mensaje varchar2(250);
    v_i       number;
    v_error   number;

    CURSOR tabla IS
      select concesionario,
             estado,
             periodo,
             cuenta,
             municipioprop,
             divipoprop,
             tipoprop,
             porcentajeprop,
             divipoasig,
             municipioasig,
             tipoasig,
             porcentajeasig,
             valortrn,
             banco,
             cuentatrn,
             periodotrn,
             fechatrn,
             descripciontrn,
             oficinatrn,
             secuenciatrn
        from idemasivo_temp;

  BEGIN

    delete from idemasivo_temp;

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

    --Registro #1
    dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);

    /*if (instr(lower(vBuffer), lower(v_encabezado)) = 0) then
        p_error := 'Encabezado erroneo. encabezado leido: ' || lower(vBuffer) || '*' ||
                   lower(v_encabezado);
        return;
      end if;
    */
    l_pos := l_pos + l_amount + length(v_finlinea) - 1;

    --Informacion
    WHILE l_pos < l_clob_len - 1 and p_error is null LOOP
      l_amount := dbms_lob.instr(v_cfile, v_finlinea, l_pos + 1, 1);
      IF l_amount < 1 THEN
        p_error := 'Registro ' || i || ' Invalido';
        return;
      else
        l_amount := l_amount - l_pos;
        dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);

        linea := vBuffer;
        campo := tokenize(str => linea, delim => ',');

        if (campo(1) is null) then

          p_error := 'Error en registro ' || i || '. Formato errado. ' ||
                     '. Datos registro: ' || vBuffer;
          return;

        end if;
        BEGIN
          r.concesionario := campo(1);
          r.estado        := campo(2);
          r.periodo       := campo(3);
          r.cuenta        := campo(4);
          r.municipioprop := campo(5);

          if (substr(campo(6), 1, 1) = '''') then
            r.divipoprop := substr(campo(6), 2, 8);
          else
            r.divipoprop := campo(6);
          end if;

          if (substr(campo(6), 1, 1) = '''') then
            r.divipoasig := substr(campo(6), 2, 8);
          else
            r.divipoasig := campo(6);
          end if;

          r.tipoprop := campo(8);
          r.tipoasig := campo(8);

          r.porcentajeprop := to_number(campo(9), '99.99');
          r.porcentajeasig := to_number(campo(9), '99.99');

          r.valortrn       := campo(10);
          r.banco          := campo(11);
          r.cuentatrn      := campo(12);
          r.periodotrn     := campo(13);
          r.fechatrn       := campo(14);
          r.descripciontrn := campo(15);
          r.oficinatrn     := campo(16);
          r.secuenciatrn   := to_number(campo(17));

        EXCEPTION
          WHEN OTHERS THEN
            p_error := 'Error en registro ' || i || '. Mensaje: ' ||
                       SQLERRM || '. Datos registro: ' || vBuffer;
            return;
        END;

      end if;
      l_pos := l_pos + l_amount + length(v_finlinea);
      i     := i + 1;

      insert into idemasivo_temp values r;
    END LOOP;

    commit;

    v_mensaje := '';
    v_i       := 1;
    v_error   := 0;

    for registro in (select * from idemasivo_temp) loop
      v_aplicar := 1;

      if (not upper(registro.tipoasig) = 'POLCA' and
         not upper(registro.tipoasig) = 'SIMIT') then
        v_aplicar := 0;
        v_mensaje := 'Tipo comparendo errado en registro ' || to_char(v_i);
        v_error   := 1;
      end if;

      if (not registro.porcentajeasig = 10 and
         not registro.porcentajeasig = 45 and
         not registro.porcentajeasig = 55) then
        v_aplicar := 0;
        v_mensaje := 'Porcentaje consignacion errado en registro ' ||
                     to_char(v_i);
        v_error   := 1;
      end if;

      if (upper(registro.tipoasig) = 'SIMIT' and
         registro.porcentajeasig > 10) then
        v_aplicar := 0;
        v_mensaje := 'Porcentaje SIMIT errado en registro ' || to_char(v_i);
        v_error   := 1;
      end if;

      select count(*)
        into v_numreg
        from municipio m
       where m.idmunicipio = registro.divipoasig
         and m.idmunicipio <> '00000000';

      if (v_numreg = 0) then
        v_aplicar := 0;
        v_mensaje := 'Municipio errado en registro ' || to_char(v_i);
        v_error   := 1;
      end if;

      select count(*)
        into v_numreg
        from trxsinidentificar t
       where t.numsecuenciareg = registro.secuenciatrn;

      if (v_numreg = 0) then
        v_aplicar := 0;
        v_mensaje := 'Transaccion identificada no existe, registro ' ||
                     to_char(v_i);
        v_error   := 1;
      end if;

      v_i := v_i + 1;

    end loop;

    if (v_error = 1) then
      p_error := 'Archivo con inconsistencias. No se aplica ningun registro. ' ||
                 v_mensaje;
    else

      for registro in (select * from idemasivo_temp) loop

        update trxsinidentificar t
           set t.indtipoiden           = registro.tipoasig,
               t.idmunicipioiden       = registro.divipoasig,
               t.p_consignadoiden      = registro.porcentajeasig,
               t.observaciones         = 'IDENTIFICADO MASIVAMENTE',
               t.estadoiden            = 'ID',
               t.fechaidentificacion   = sysdate,
               t.usuarioidentificacion = to_number(p_usuario)
         where t.numsecuenciareg = registro.secuenciatrn;

      end loop;
      commit;

    end if;

    i := i - 1;
    if p_error is null then
      p_error := 'El archivo se proceso correctamente. Registros aplicados: ' || i;
    end if;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [cargarIdeMasiva] ' || SQLERRM,
            p_error);

  end cargarIdeMasiva;

  PROCEDURE i_Novmunicipio(p_idmunicipio              varchar2,
                           p_nit_m                    varchar2,
                           p_nombre                   varchar2,
                           p_idconcesionario          varchar2,
                           p_correo                   varchar2,
                           p_indretroactividad        number,
                           p_indliq_s_ext             number,
                           p_indliq_s_local           number,
                           p_indliq_p_ext             number,
                           p_indliq_p_local           number,
                           p_indAcuerdoPago_2002      number,
                           p_idbanco                  varchar2,
                           p_tipocuenta               varchar2,
                           p_cuenta                   varchar2,
                           p_nit_cta                  varchar2,
                           p_municipio_s              number,
                           p_fcm_contravencional_s    number,
                           p_conces_contravencional_s number,
                           p_acuerdopago_s            number,
                           p_municipio_p              number,
                           p_fcm_contravencional_p    number,
                           p_conces_contravencional_p number,
                           p_acuerdopago_p            number,
                           p_usuario                  varchar2,
                           p_fecha_act_ano            number,
                           p_fecha_act_mes            number,
                           p_fecha_act_dia            number,
                           p_firma1                   varchar2,
                           p_firma2                   varchar2,
                           p_dnsAvvillas              varchar2,
                           p_dnsDavivienda            varchar2,
                           p_error                    OUT VARCHAR2,
                           p_novedad                  OUT varchar2

                           ) AS

    w_fecha_act       date;
    numNovedad        number;
    m_dias_activacion number;
    min_fecha_act     date;
    correo_usuario    varchar(100);
    correo_fcm        varchar(100);

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    select mail
      into correo_usuario
      from person
     where idperson = TO_NUMBER(p_usuario);

    select substr(correo, 0, 100)
      into correo_fcm
      from fcm
     where nit_fcm = '8000826650';

    select count(*)
      INTO v_valida
      from departamento t
     where iddepartamento = substr(p_idmunicipio, 1, 2);

    select TO_DATE(p_fecha_act_ano || '-' || p_fecha_act_mes || '-' ||
                   p_fecha_act_dia,
                   'YYYY-MM-DD')
      into w_fecha_act
      from DUAL;

    if (v_valida = 0) then
      p_error := 'Departamento no existe';
      return;
    end if;

    select COUNT(*)
      INTO v_valida
      from municipio t
     where idmunicipio = p_idmunicipio;

    IF v_valida <> 0 THEN
      p_error := 'municipio ya existente';
      return;
    else
      select dias_activacion into m_dias_activacion from fcm;
      IF m_dias_activacion is null THEN
        p_error := 'Error en parametrizaci?n (d?as activaci?n)';
        return;
      ELSE
        min_fecha_act := fn_fec_dispersion(to_date(to_char(sysdate,
                                                           'yyyy-mm-dd'),
                                                   'yyyy-mm-dd'),
                                           m_dias_activacion,
                                           0,
                                           '99999999');
        IF min_fecha_act > w_fecha_act then
          p_error := 'Fecha Activaci?n Inv?lida';
          return;
        ELSE
          select seq_novedad.Nextval into numNovedad from dual;

          insert into novmunicipio
            (idmunicipio,
             nit_m,
             nombre,
             idconcesionario,
             correo,
             indretroactividad,
             idbanco,
             tipocuenta,
             cuenta,
             nit_cta,
             indliq_s_ext,
             indliq_s_local,
             indliq_p_ext,
             indliq_p_local,
             indAcuerdoPago_2002,
             iddepartamento,
             TIPONOV,
             NUMERONOV,
             FECHANOV,
             USUARIONOV,
             FECHAACT,
             ESTADONOV,
             FIRMA1,
             FIRMA2,
             municipio_s,
             fcm_contravencional_s,
             conces_contravencional_s,
             acuerdopago_s,
             municipio_p,
             fcm_contravencional_p,
             conces_contravencional_p,
             acuerdopago_p,
             dnsavvillas,
             dnsgranbanco)
          values
            (p_idmunicipio,
             p_nit_m,
             p_nombre,
             p_idconcesionario,
             p_correo,
             p_indretroactividad,
             p_idbanco,
             p_tipocuenta,
             encriptar(p_cuenta),
             p_nit_cta,
             p_indliq_s_ext,
             p_indliq_s_local,
             p_indliq_p_ext,
             p_indliq_p_local,
             p_indAcuerdoPago_2002,
             substr(p_idmunicipio, 1, 2),
             '01', -- NOVEDAD ADICION MUNICIPIO
             numNovedad,
             sysdate,
             p_usuario,
             w_fecha_act,
             'INGRESADA',
             p_firma1,
             p_firma2,
             p_municipio_s,
             p_fcm_contravencional_s,
             p_conces_contravencional_s,
             p_acuerdopago_s,
             p_municipio_p,
             p_fcm_contravencional_p,
             p_conces_contravencional_p,
             p_acuerdopago_p,
             p_dnsAvvillas,
             p_dnsDavivienda);

          p_error   := MSG_INS_OK;
          p_novedad := '01-' || to_char(numNovedad, '0000000');

          sp_envionotificacion(gruporecibe => 4,
                               grupocopia  => -1,
                               asunto      => 'Notificaci?n de Novedad de Municipio:  ' ||
                                              p_novedad,
                               mensaje     => 'Se ha creado una novedad financiera de municipio. Por favor verificar y dar su visto bueno. NUMERO NOVEDAD ' ||
                                              p_novedad ||
                                              ' . Muchas gracias',
                               p_usuario   => p_usuario);
          commit;
        END IF;
      END IF;
    END IF;

    sp_log(p_usuario,
           'i_Novmunicipio',
           p_idmunicipio || '-' || p_nit_m || '-' || p_nombre || '-' ||
           p_idconcesionario || '-' || p_correo || '-' ||
           p_indretroactividad || '-' || p_idbanco || '-' || p_tipocuenta || '-' ||
           p_cuenta || '-' || p_nit_cta || '-' || p_indliq_s_ext || '-' ||
           p_indliq_s_local || '-' || p_indliq_p_ext || '-' || '-' ||
           p_indAcuerdoPago_2002 || '-' || p_indliq_p_local || '-' ||
           p_municipio_s || '-' || p_fcm_contravencional_s || '-' ||
           p_conces_contravencional_s || '-' || p_acuerdopago_s || '-' ||
           p_municipio_p || '-' || p_fcm_contravencional_p || '-' ||
           p_conces_contravencional_p || '-' || p_acuerdopago_p);

    commit;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [i_Novmunicipio] ' || SQLERRM, p_error);

  END i_Novmunicipio;

  PROCEDURE q_Novmunicipio(p_tiponov                  varchar2,
                           p_numeronov                varchar2,
                           p_usuario                  varchar2,
                           p_idmunicipio              out varchar2,
                           p_nit_m                    out varchar2,
                           p_nombre                   out varchar2,
                           p_idconcesionario          out varchar2,
                           p_correo                   out varchar2,
                           p_indretroactividad        out number,
                           p_indliq_s_ext             out number,
                           p_indliq_s_local           out number,
                           p_indliq_p_ext             out number,
                           p_indliq_p_local           out number,
                           p_indAcuerdoPago_2002      out number,
                           p_idbanco                  out varchar2,
                           p_tipocuenta               out varchar2,
                           p_cuenta                   out varchar2,
                           p_nit_cta                  out varchar2,
                           p_municipio_s              out number,
                           p_fcm_contravencional_s    out number,
                           p_conces_contravencional_s out number,
                           p_acuerdopago_s            out number,
                           p_municipio_p              out number,
                           p_fcm_contravencional_p    out number,
                           p_conces_contravencional_p out number,
                           p_acuerdopago_p            out number,
                           p_fechaact                 out date,
                           p_firma1                   out varchar2,
                           p_firma2                   out varchar2,
                           p_estadonov                out varchar2,
                           p_dnsAvvilas               out varchar2,
                           p_dnsGranbanco             out varchar2,
                           p_error                    OUT VARCHAR2) is
  BEGIN

    -- INICIALIZAR SALIDA
    p_idmunicipio              := '';
    p_nit_m                    := '';
    p_nombre                   := '';
    p_idconcesionario          := '00';
    p_correo                   := '';
    p_indretroactividad        := 0;
    p_indliq_s_ext             := 0;
    p_indliq_s_local           := 0;
    p_indliq_p_ext             := 0;
    p_indliq_p_local           := 0;
    p_indAcuerdoPago_2002      := 0;
    p_idbanco                  := '00';
    p_tipocuenta               := '000';
    p_cuenta                   := '';
    p_nit_cta                  := '';
    p_municipio_s              := 0;
    p_fcm_contravencional_s    := 0;
    p_conces_contravencional_s := 0;
    p_acuerdopago_s            := 0;
    p_municipio_p              := 0;
    p_fcm_contravencional_p    := 0;
    p_conces_contravencional_p := 0;
    p_acuerdopago_p            := 0;
    p_fechaact                 := null;
    p_firma1                   := '';
    p_firma2                   := '';
    p_estadonov                := '';
    p_dnsAvvilas               := '';
    p_dnsGranbanco             := '';

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select idmunicipio,
               nit_m,
               nombre,
               idconcesionario,
               correo,
               indretroactividad,
               idbanco,
               tipocuenta,
               desencriptar(cuenta),
               nit_cta,
               indliq_s_ext,
               indliq_s_local,
               indliq_p_ext,
               indliq_p_local,
               indAcuerdoPago_2002,
               municipio_s,
               fcm_contravencional_s,
               conces_contravencional_s,
               acuerdopago_s,
               municipio_p,
               fcm_contravencional_p,
               conces_contravencional_p,
               acuerdopago_p,
               fechaact,
               firma1,
               firma2,
               estadonov,
               dnsAvvillas,
               dnsGranbanco
          into p_idmunicipio,
               p_nit_m,
               p_nombre,
               p_idconcesionario,
               p_correo,
               p_indretroactividad,
               p_idbanco,
               p_tipocuenta,
               p_cuenta,
               p_nit_cta,
               p_indliq_s_ext,
               p_indliq_s_local,
               p_indliq_p_ext,
               p_indliq_p_local,
               p_indacuerdopago_2002,
               p_municipio_s,
               p_fcm_contravencional_s,
               p_conces_contravencional_s,
               p_acuerdopago_s,
               p_municipio_p,
               p_fcm_contravencional_p,
               p_conces_contravencional_p,
               p_acuerdopago_p,
               p_fechaact,
               p_firma1,
               p_firma2,
               p_estadonov,
               p_dnsAvvilas,
               p_dnsGranbanco
          from Novmunicipio
         where tiponov = p_tiponov
           and numeronov = to_number(p_numeronov);

        p_error := 'Consulta Exitosa';

        sp_log(p_usuario,
               'q_Novmunicipio',
               p_tiponov || '-' || p_numeronov || '-' || p_idmunicipio || '-' ||
               p_nit_m || '-' || p_nombre || '-' || p_idconcesionario || '-' ||
               p_correo || '-' || p_indretroactividad || '-' || p_idbanco || '-' ||
               p_tipocuenta || '-' || p_cuenta || '-' || p_nit_cta || '-' ||
               p_indliq_s_ext || '-' || p_indliq_s_local || '-' ||
               p_indliq_p_ext || '-' || '-' || p_indAcuerdoPago_2002 || '-' ||
               p_indliq_p_local || '-' || p_municipio_s || '-' ||
               p_fcm_contravencional_s || '-' || p_conces_contravencional_s || '-' ||
               p_acuerdopago_s || '-' || p_municipio_p || '-' ||
               p_fcm_contravencional_p || '-' || p_conces_contravencional_p || '-' ||
               p_acuerdopago_p || '-' || p_firma1 || '-' || p_firma2);

        commit;

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';

      END;

    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [q_Novmunicipio] ' || SQLERRM, p_error);
  END q_Novmunicipio;

  PROCEDURE q_NovmunicipioE(p_tiponov   varchar2,
                            p_numeronov number,
                            p_usuario   varchar2,
                            p_estadonov out varchar2,
                            p_error     OUT VARCHAR2) is
  BEGIN

    -- INICIALIZAR SALIDA
    p_estadonov := '';

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select estadonov
          into p_estadonov
          from Novmunicipio
         where tiponov = p_tiponov
           and numeronov = p_numeronov;

        p_error := 'Consulta Exitosa';

        sp_log(p_usuario, 'q_NovmunicipioE', p_estadonov);

        commit;

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';

      END;

    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [q_NovmunicipioE] ' || SQLERRM,
            p_error);
  END q_NovmunicipioE;

  PROCEDURE u_NovmunicipioEst(p_tiponov   varchar2,
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
          from Novmunicipio
         where tiponov = p_tiponov
           and numeronov = to_number(p_numeronov);

        IF estado_act = p_estado THEN
          p_error := 'Novedad ya actualizada';
          return;
        END IF;

        IF p_estado = 'VALIDADA' THEN
          update Novmunicipio
             set estadonov  = p_estado,
                 usuarioval = p_usuario,
                 fechaval   = sysdate
           where tiponov = p_tiponov
             and numeronov = to_number(p_numeronov);
        ELSE
          IF p_estado = 'ANULADA' THEN
            update Novmunicipio
               set estadonov   = p_estado,
                   usuarioanul = p_usuario,
                   fechaanul   = sysdate
             where tiponov = p_tiponov
               and numeronov = to_number(p_numeronov);
          ELSE
            update Novmunicipio
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
             'NOVEDAD MUNICIPIO',
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
             'NOVEDAD MUNICIPIO',
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
                               asunto      => 'Notificaci?n de Novedad de Municipio:  ' ||
                                              p_tiponov || '-' ||
                                              p_numeronov,
                               mensaje     => 'Se ha creado una novedad financiera de municipio. Por favor verificar y dar su visto bueno. NUMERO NOVEDAD ' ||
                                              p_tiponov || '-' ||
                                              p_numeronov ||
                                              ' . Muchas gracias',
                               p_usuario   => p_usuario);

        END IF;

        if (p_estado = 'VOBOSIMIT') THEN
          sp_envionotificacion(gruporecibe => 6,
                               grupocopia  => -1,
                               asunto      => 'Notificaci?n de Novedad de Municipio:  ' ||
                                              p_tiponov || '-' ||
                                              p_numeronov,
                               mensaje     => 'Se ha creado una novedad financiera de municipio. Por favor verificar y dar su visto bueno. NUMERO NOVEDAD ' ||
                                              p_tiponov || '-' ||
                                              p_numeronov ||
                                              ' . Muchas gracias',
                               p_usuario   => p_usuario);

        END IF;

        if (p_estado = 'VALIDADA') THEN
          sp_envionotificacion(gruporecibe => 7,
                               grupocopia  => -1,
                               asunto      => 'Notificaci?n de Novedad de Municipio:  ' ||
                                              p_tiponov || '-' ||
                                              p_numeronov,
                               mensaje     => 'Se ha aprobado una novedad financiera de municipio. Por favor informar a banco novedad. NUMERO NOVEDAD ' ||
                                              p_tiponov || '-' ||
                                              p_numeronov ||
                                              ' . Muchas gracias',
                               p_usuario   => p_usuario);

        END IF;

        if (p_estado = 'ANULADA') THEN
          sp_envionotificacion(gruporecibe => 3,
                               grupocopia  => -1,
                               asunto      => 'Notificaci?n de ANULACION Novedad de Municipio:  ' ||
                                              p_tiponov || '-' ||
                                              p_numeronov,
                               mensaje     => 'Se ha ANULADO una novedad financiera de municipio. Por favor verificar informacion. NUMERO NOVEDAD ' ||
                                              p_tiponov || '-' ||
                                              p_numeronov ||
                                              ' . Muchas gracias',
                               p_usuario   => p_usuario);

        END IF;

        p_error := 'Actualizaci?n Exitosa';

        sp_log(p_usuario,
               'u_NovmunicipioEst',
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
            p_usuario || ' [u_NovmunicipioEst] ' || SQLERRM,
            p_error);
  END u_NovmunicipioEst;

  PROCEDURE u_Novmunicipio(p_idmunicipio              varchar2,
                           p_nit_m                    varchar2,
                           p_nombre                   varchar2,
                           p_idconcesionario          varchar2,
                           p_correo                   varchar2,
                           p_indretroactividad        number,
                           p_indliq_s_ext             number,
                           p_indliq_s_local           number,
                           p_indliq_p_ext             number,
                           p_indliq_p_local           number,
                           p_indAcuerdoPago_2002      number,
                           p_idbanco                  varchar2,
                           p_tipocuenta               varchar2,
                           p_cuenta                   varchar2,
                           p_nit_cta                  varchar2,
                           p_municipio_s              number,
                           p_fcm_contravencional_s    number,
                           p_conces_contravencional_s number,
                           p_acuerdopago_s            number,
                           p_municipio_p              number,
                           p_fcm_contravencional_p    number,
                           p_conces_contravencional_p number,
                           p_acuerdopago_p            number,
                           p_usuario                  varchar2,
                           p_fecha_act_ano            number,
                           p_fecha_act_mes            number,
                           p_fecha_act_dia            number,
                           p_firma1                   varchar2,
                           p_firma2                   varchar2,
                           p_dnsAvvillas              varchar2,
                           p_dnsDavivienda            varchar2,
                           p_error                    OUT VARCHAR2,
                           p_novedad                  OUT varchar2) AS

    w_fecha_act       date;
    numNovedad        number;
    m_dias_activacion number;
    min_fecha_act     date;
    correo_usuario    varchar(100);
    correo_fcm        varchar(100);

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    select mail
      into correo_usuario
      from person
     where idperson = TO_NUMBER(p_usuario);

    select substr(correo, 0, 100)
      into correo_fcm
      from fcm
     where nit_fcm = '8000826650';

    select count(*)
      INTO v_valida
      from departamento t
     where iddepartamento = substr(p_idmunicipio, 1, 2);

    select TO_DATE(p_fecha_act_ano || '-' || p_fecha_act_mes || '-' ||
                   p_fecha_act_dia,
                   'YYYY-MM-DD')
      into w_fecha_act
      from DUAL;

    if (v_valida = 0) then
      p_error := 'Departamento no existe';
      return;
    end if;

    select COUNT(*)
      INTO v_valida
      from municipio t
     where idmunicipio = p_idmunicipio;

    select seq_novedad.Nextval into numNovedad from dual;

    IF v_valida = 0 THEN
      p_error := 'Municipio No existe';
      return;
    else
      select dias_activacion into m_dias_activacion from fcm;
      IF m_dias_activacion is null THEN
        p_error := 'Error en parametrizaci?n (d?as activaci?n)';
        return;
      ELSE
        min_fecha_act := fn_fec_dispersion(sysdate,
                                           m_dias_activacion,
                                           0,
                                           '99999999');
        IF min_fecha_act > w_fecha_act then
          p_error := 'Fecha Activaci?n Inv?lida';
          return;
        ELSE

          insert into novmunicipio
            (idmunicipio,
             nit_m,
             nombre,
             idconcesionario,
             correo,
             indretroactividad,
             idbanco,
             tipocuenta,
             cuenta,
             nit_cta,
             indliq_s_ext,
             indliq_s_local,
             indliq_p_ext,
             indliq_p_local,
             indAcuerdoPago_2002,
             iddepartamento,
             TIPONOV,
             NUMERONOV,
             FECHANOV,
             USUARIONOV,
             FECHAACT,
             ESTADONOV,
             FIRMA1,
             FIRMA2,
             municipio_s,
             fcm_contravencional_s,
             conces_contravencional_s,
             acuerdopago_s,
             municipio_p,
             fcm_contravencional_p,
             conces_contravencional_p,
             acuerdopago_p,
             dnsavvillas,
             dnsgranbanco)
          values
            (p_idmunicipio,
             p_nit_m,
             p_nombre,
             p_idconcesionario,
             p_correo,
             p_indretroactividad,
             p_idbanco,
             p_tipocuenta,
             encriptar(p_cuenta),
             p_nit_cta,
             p_indliq_s_ext,
             p_indliq_s_local,
             p_indliq_p_ext,
             p_indliq_p_local,
             p_indAcuerdoPago_2002,
             substr(p_idmunicipio, 1, 2),
             '02', -- NOVEDAD ADICION MUNICIPIO
             numNovedad,
             sysdate,
             p_usuario,
             w_fecha_act,
             'INGRESADA',
             p_firma1,
             p_firma2,
             p_municipio_s,
             p_fcm_contravencional_s,
             p_conces_contravencional_s,
             p_acuerdopago_s,
             p_municipio_p,
             p_fcm_contravencional_p,
             p_conces_contravencional_p,
             p_acuerdopago_p,
             p_dnsAvvillas,
             p_dnsDavivienda);

          p_error   := MSG_UPD_OK;
          p_novedad := '02-' || to_char(numNovedad, '0000000');

          sp_envionotificacion(gruporecibe => 3,
                               grupocopia  => 2,
                               asunto      => 'Notificaci?n de Novedad de Municipio:  ' ||
                                              p_novedad,
                               mensaje     => 'Se ha creado una novedad financiera de municipio. Por favor verificarla y dar su visto bueno. NUMERO NOVEDAD ' ||
                                              p_novedad ||
                                              ' . Muchas gracias',
                               p_usuario   => p_usuario);

          commit;
        END IF;
      END IF;
    END IF;

    sp_log(p_usuario,
           'u_Novmunicipio',
           p_idmunicipio || '-' || p_nit_m || '-' || p_nombre || '-' ||
           p_idconcesionario || '-' || p_correo || '-' ||
           p_indretroactividad || '-' || p_idbanco || '-' || p_tipocuenta || '-' ||
           p_cuenta || '-' || p_nit_cta || '-' || p_indliq_s_ext || '-' ||
           p_indliq_s_local || '-' || p_indliq_p_ext || '-' || '-' ||
           p_indAcuerdoPago_2002 || '-' || p_indliq_p_local || '-' ||
           p_municipio_s || '-' || p_fcm_contravencional_s || '-' ||
           p_conces_contravencional_s || '-' || p_acuerdopago_s || '-' ||
           p_municipio_p || '-' || p_fcm_contravencional_p || '-' ||
           p_conces_contravencional_p || '-' || p_acuerdopago_p);

    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [u_Novmunicipio] ' || SQLERRM, p_error);

  END u_Novmunicipio;

  PROCEDURE i_Novterceros(p_idmunicipio   char,
                          p_nit_t         char,
                          p_nombre        varchar2,
                          p_correoTercero varchar2,
                          p_idbanco       char,
                          p_tipocuenta    char,
                          p_cuenta        varchar2,
                          p_base_s        number,
                          p_base_p        number,
                          p_ind_base      number,
                          p_num_tercero   number,
                          p_usuario       varchar2,
                          p_tiponov       varchar2,
                          p_fecha_act_ano number,
                          p_fecha_act_mes number,
                          p_fecha_act_dia number,
                          p_firma1        varchar2,
                          p_firma2        varchar2,
                          p_dnsavvillas   varchar2,
                          p_dnsgranbanco  varchar2,
                          p_error         OUT VARCHAR2,
                          p_novedad       OUT varchar2) AS

    w_fecha_act       date;
    numNovedad        number;
    m_dias_activacion number;
    min_fecha_act     date;

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    select TO_DATE(p_fecha_act_ano || '-' || p_fecha_act_mes || '-' ||
                   p_fecha_act_dia,
                   'YYYY-MM-DD')
      into w_fecha_act
      from DUAL;

    select dias_activacion into m_dias_activacion from fcm;
    IF m_dias_activacion is null THEN
      p_error := 'Error en parametrizaci?n (d?as activaci?n)';
      return;
    ELSE
      min_fecha_act := fn_fec_dispersion(sysdate,
                                         m_dias_activacion,
                                         0,
                                         '99999999');
      IF min_fecha_act > w_fecha_act then
        p_error := 'Fecha Activaci?n Inv?lida';
        return;
      ELSE
        select seq_novedad.Nextval into numNovedad from dual;

        insert into novtercero
          (idmunicipio,
           nit_t,
           nombre,
           correoTercero,
           idbanco,
           tipocuenta,
           cuenta,
           base_s,
           base_p,
           ind_base,
           num_tercero,
           tiponov,
           numeronov,
           fechanov,
           usuarionov,
           fechaact,
           firma1,
           firma2,
           estadonov,
           dnsavvillas,
           dnsgranbanco)
        values
          (p_idmunicipio,
           p_nit_t,
           p_nombre,
           p_correoTercero,
           p_idbanco,
           p_tipocuenta,
           encriptar(p_cuenta),
           p_base_s,
           p_base_p,
           p_ind_base,
           p_num_tercero,
           p_tiponov,
           numNovedad,
           sysdate,
           p_usuario,
           w_fecha_act,
           p_firma1,
           p_firma2,
           'INGRESADA',
           p_dnsavvillas,
           p_dnsgranbanco);

        p_error   := MSG_INS_OK;
        p_novedad := p_tiponov || '-' || to_char(numNovedad, '0000000');

        sp_log(p_usuario,
               'i_Novterceros',
               p_idmunicipio || '-' || p_nit_t || '-' || p_nombre || '-' ||
               p_idbanco || '-' || p_tipocuenta || '-' || p_cuenta || '-' ||
               p_base_s || '-' || p_base_p || '-' || p_ind_base || '-' ||
               p_num_tercero || '-' || p_tiponov || '-' || w_fecha_act || '-' ||
               p_firma1 || '-' || p_firma2);
        commit;

        sp_envionotificacion(gruporecibe => 4,
                             grupocopia  => -1,
                             asunto      => 'Notificaci?n de Novedad Tercero:  ' ||
                                            p_novedad,
                             mensaje     => 'Se ha creado una novedad financiera de Tercero. Por favor verificar y dar su visto bueno. NUMERO NOVEDAD ' ||
                                            p_novedad || ' . Muchas gracias',
                             p_usuario   => p_usuario);

      END IF;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [i_Novterceros] ' || SQLERRM, p_error);
  END i_Novterceros;

  PROCEDURE u_NovtercerosEst(p_tiponov   varchar2,
                             p_numeronov number,
                             p_usuario   varchar2,
                             p_estado    varchar2,
                             p_error     OUT VARCHAR2) is

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        IF p_estado = 'VALIDADA' THEN
          update Novtercero
             set estadonov  = p_estado,
                 usuarioval = p_usuario,
                 fechaval   = sysdate
           where tiponov = p_tiponov
             and numeronov = p_numeronov;
        ELSE
          IF p_estado = 'ANULADA' THEN
            update Novtercero
               set estadonov   = p_estado,
                   usuarioanul = p_usuario,
                   fechaanul   = sysdate
             where tiponov = p_tiponov
               and numeronov = p_numeronov;
          ELSE
            update Novtercero
               set estadonov = p_estado
             where tiponov = p_tiponov
               and numeronov = p_numeronov;
          END IF;
        END IF;
        p_error := 'Actualizaci?n Exitosa';

        sp_log(p_usuario,
               'u_NovtercerosEst',
               p_tiponov || '-' || p_numeronov || '-' || p_estado);
        commit;

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';
      END;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [u_NovtercerosEst] ' || SQLERRM,
            p_error);
  END u_NovtercerosEst;

  PROCEDURE q_Novtercero(p_tiponov       varchar2,
                         p_numeronov     number,
                         p_usuario       varchar2,
                         p_idmunicipio   out varchar2,
                         p_nit_t         out varchar2,
                         p_nombre        out varchar2,
                         p_correoTercero out varchar2,
                         p_idbanco       out varchar2,
                         p_tipocuenta    out varchar2,
                         p_cuenta        out varchar2,
                         p_base_s        out number,
                         p_base_p        out number,
                         p_ind_base      out number,
                         p_num_tercero   out number,
                         p_fechaact      out date,
                         p_firma1        out varchar2,
                         p_firma2        out varchar2,
                         p_estadonov     out varchar2,
                         p_error         OUT VARCHAR2) is
  BEGIN

    -- INICIALIZAR SALIDA
    p_nombre        := null;
    p_correoTercero := null;
    p_idbanco       := '00';
    p_tipocuenta    := '000';
    p_cuenta        := null;
    p_base_s        := 0;
    p_base_p        := 0;
    p_ind_base      := 1;
    p_nit_t         := null;
    p_fechaact      := null;
    p_firma1        := '';
    p_firma2        := '';
    p_estadonov     := '';

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select idmunicipio,
               nombre,
               correoTercero,
               idbanco,
               tipocuenta,
               desencriptar(cuenta),
               base_s,
               base_p,
               ind_base,
               num_tercero,
               nit_t,
               fechaact,
               firma1,
               firma2,
               estadonov

          into p_idmunicipio,
               p_nombre,
               p_correoTercero,
               p_idbanco,
               p_tipocuenta,
               p_cuenta,
               p_base_s,
               p_base_p,
               p_ind_base,
               p_num_tercero,
               p_nit_t,
               p_fechaact,
               p_firma1,
               p_firma2,
               p_estadonov
          from novtercero
         where tiponov = p_tiponov
           and numeronov = p_numeronov;

        p_error := 'Consulta Exitosa';

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';
      END;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [q_Novtercero] ' || SQLERRM, p_error);
  END q_Novtercero;

  PROCEDURE q_NovterceroE(p_tiponov   varchar2,
                          p_numeronov number,
                          p_usuario   varchar2,
                          p_estadonov out varchar2,
                          p_error     OUT VARCHAR2) is
  BEGIN

    -- INICIALIZAR SALIDA
    p_estadonov := '';

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select estadonov
          into p_estadonov
          from novtercero
         where tiponov = p_tiponov
           and numeronov = p_numeronov;

        p_error := 'Consulta Exitosa';

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';
      END;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [q_NovterceroE] ' || SQLERRM, p_error);
  END q_NovterceroE;

  PROCEDURE i_NovDiasDispersion(p_idmunicipio        char,
                                p_idbanco            char,
                                p_dias_dispersion_se number,
                                p_dias_dispersion_sl number,
                                p_dias_dispersion_pe number,
                                p_dias_dispersion_pl number,
                                p_frec_dispersion_se number,
                                p_frec_dispersion_sl number,
                                p_frec_dispersion_pe number,
                                p_frec_dispersion_pl number,
                                p_usuario            varchar2,
                                p_tiponov            varchar2,
                                p_fecha_act_ano      number,
                                p_fecha_act_mes      number,
                                p_fecha_act_dia      number,
                                p_firma1             varchar2,
                                p_firma2             varchar2,
                                p_nombre             varchar2,
                                p_dnsAvvillas        varchar2,
                                p_dnsGranbanco       varchar2,
                                p_error              OUT VARCHAR2,
                                p_novedad            OUT varchar2) AS
    w_fecha_act       date;
    numNovedad        number;
    m_dias_activacion number;
    min_fecha_act     date;
    correo_usuario    varchar(100);
    correo_fcm        varchar(100);
    p_nom             varchar2(250);

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    select mail
      into correo_usuario
      from person
     where idperson = TO_NUMBER(p_usuario);

    select substr(correo, 0, 100)
      into correo_fcm
      from fcm
     where nit_fcm = '8000826650';

    IF p_tiponov = '06' THEN
      select COUNT(*)
        INTO v_valida
        from dias_dispersion t
       where idmunicipio = p_idmunicipio
         and idbanco = p_idbanco;

      IF v_valida <> 0 THEN
        p_error := 'Dias Dispersion Ya existe ';
        return;
      END IF;
    ELSE
      select COUNT(*)
        INTO v_valida
        from dias_dispersion t
       where idmunicipio = p_idmunicipio
         and idbanco = p_idbanco;

      IF v_valida = 0 THEN
        p_error := 'Registro dias dispersion no existe';
        return;
      END IF;
    END IF;

    select TO_DATE(p_fecha_act_ano || '-' || p_fecha_act_mes || '-' ||
                   p_fecha_act_dia,
                   'YYYY-MM-DD')
      into w_fecha_act
      from DUAL;

    select dias_activacion into m_dias_activacion from fcm;
    IF m_dias_activacion is null THEN
      p_error := 'Error en parametrizaci?n (d?as activaci?n)';
      return;
    ELSE
      min_fecha_act := fn_fec_dispersion(sysdate,
                                         m_dias_activacion,
                                         0,
                                         '99999999');
      IF min_fecha_act > w_fecha_act then
        p_error := 'Fecha Activaci?n Inv?lida';
        return;
      ELSE
        select seq_novedad.Nextval into numNovedad from dual;

        select COUNT(*)
          INTO v_valida
          from municipio
         where idmunicipio = p_idmunicipio;

        if (v_valida > 0) then

          select nombre
            into p_nom
            from municipio
           where idmunicipio = p_idmunicipio;

        end if;

        if (v_valida = 0) then

          select max(nombre)
            into p_nom
            from novmunicipio
           where idmunicipio = p_idmunicipio;

        end if;

        insert into novdias_dispersion
          (idmunicipio,
           idbanco,
           dias_dispersion_sl,
           frec_dispersion_sl,
           dias_dispersion_pl,
           frec_dispersion_pl,
           dias_dispersion_se,
           frec_dispersion_se,
           dias_dispersion_pe,
           frec_dispersion_pe,
           tiponov,
           numeronov,
           fechanov,
           usuarionov,
           fechaact,
           firma1,
           firma2,
           estadonov,
           dnsavvillas,
           dnsgranbanco,
           nombre)
        values
          (p_idmunicipio,
           p_idbanco,
           p_dias_dispersion_sl,
           p_frec_dispersion_sl,
           p_dias_dispersion_pl,
           p_frec_dispersion_pl,
           p_dias_dispersion_se,
           p_frec_dispersion_se,
           p_dias_dispersion_pe,
           p_frec_dispersion_pe,
           p_tiponov,
           numNovedad,
           sysdate,
           p_usuario,
           w_fecha_act,
           p_firma1,
           p_firma2,
           'INGRESADA',
           p_dnsAvvillas,
           p_dnsGranbanco,
           p_nom);

        select COUNT(*)
          INTO v_valida
          from municipio
         where idmunicipio = p_idmunicipio;

        if (v_valida = 0) then

          insert into municipio
            (idmunicipio, nombre, iddepartamento)
          values
            (p_idmunicipio, p_nom, substr(p_idmunicipio, 0, 2));
        end if;

        sp_log(p_usuario,
               'i_NovDiasDispersion',
               p_idmunicipio || '-' || p_idbanco || '-' ||
               p_dias_dispersion_sl || '-' || p_frec_dispersion_sl || '-' ||
               p_dias_dispersion_pl || '-' || p_frec_dispersion_pl || '-' ||
               p_dias_dispersion_se || '-' || p_frec_dispersion_se || '-' ||
               p_dias_dispersion_pe || '-' || p_frec_dispersion_pe || '-' ||
               p_tiponov || '-' || numNovedad || '-' || p_usuario || '-' ||
               w_fecha_act || '-' || p_firma1 || '-' || p_firma2);
        commit;

        p_error   := MSG_INS_OK;
        p_novedad := p_tiponov || '-' || to_char(numNovedad, '0000000');

        sp_envionotificacion(gruporecibe => 4,
                             grupocopia  => -1,
                             asunto      => 'Notificaci?n de Novedad Dias de Dispersion Municipio:  ' ||
                                            p_novedad,
                             mensaje     => 'Se ha creado una novedad financiera de Dias de Dispersion Municipio. Por favor verificar y dar su visto bueno. NUMERO NOVEDAD ' ||
                                            p_novedad || ' . Muchas gracias',
                             p_usuario   => p_usuario);

      END IF;
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [i_NovDiasDispersion] ' || SQLERRM,
            p_error);

  END i_NovDiasDispersion;

  PROCEDURE q_NovDiasDispersion(p_tiponov            varchar2,
                                p_numeronov          number,
                                p_usuario            varchar2,
                                p_idmunicipio        out char,
                                p_idbanco            out char,
                                p_dias_dispersion_se out number,
                                p_dias_dispersion_sl out number,
                                p_dias_dispersion_pe out number,
                                p_dias_dispersion_pl out number,
                                p_frec_dispersion_se out number,
                                p_frec_dispersion_sl out number,
                                p_frec_dispersion_pe out number,
                                p_frec_dispersion_pl out number,
                                p_fechaact           out date,
                                p_firma1             out varchar2,
                                p_firma2             out varchar2,
                                p_estadonov          out varchar2,
                                p_error              OUT VARCHAR2) IS
  BEGIN

    -- INICIALIZAR SALIDA
    p_dias_dispersion_se := 0;
    p_dias_dispersion_sl := 0;
    p_dias_dispersion_pe := 0;
    p_dias_dispersion_pl := 0;

    p_frec_dispersion_se := 0;
    p_frec_dispersion_sl := 0;
    p_frec_dispersion_pe := 0;
    p_frec_dispersion_pl := 0;
    p_fechaact           := null;
    p_firma1             := '';
    p_firma2             := '';
    p_estadonov          := '';
    p_idmunicipio        := null;
    p_idbanco            := null;

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select idmunicipio,
               idbanco,
               dias_dispersion_sl,
               frec_dispersion_sl,
               dias_dispersion_pl,
               frec_dispersion_pl,
               dias_dispersion_se,
               frec_dispersion_se,
               dias_dispersion_pe,
               frec_dispersion_pe,
               fechaact,
               firma1,
               firma2,
               estadonov
          into p_idmunicipio,
               p_idbanco,
               p_dias_dispersion_sl,
               p_frec_dispersion_sl,
               p_dias_dispersion_pl,
               p_frec_dispersion_pl,
               p_dias_dispersion_se,
               p_frec_dispersion_se,
               p_dias_dispersion_pe,
               p_frec_dispersion_pe,
               p_fechaact,
               p_firma1,
               p_firma2,
               p_estadonov
          from novdias_dispersion
         where tiponov = p_tiponov
           and numeronov = p_numeronov;

        p_error := 'Consulta Exitosa';

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';

      END;

    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [q_NovDiasDispersion] ' || SQLERRM,
            p_error);

  END q_NovDiasDispersion;

  PROCEDURE q_NovDiasDispersionE(p_tiponov   varchar2,
                                 p_numeronov number,
                                 p_usuario   varchar2,
                                 p_estadonov out varchar2,
                                 p_error     OUT VARCHAR2) is
  BEGIN

    -- INICIALIZAR SALIDA
    p_estadonov := '';

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select estadonov
          into p_estadonov
          from novdias_dispersion
         where tiponov = p_tiponov
           and numeronov = p_numeronov;

        p_error := 'Consulta Exitosa';

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';
      END;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [q_NovDiasDispersionE] ' || SQLERRM,
            p_error);
  END q_NovDiasDispersionE;

  PROCEDURE u_NovDiasDispersionEst(p_tiponov   varchar2,
                                   p_numeronov number,
                                   p_usuario   varchar2,
                                   p_estado    varchar2,
                                   p_error     OUT VARCHAR2) is

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        IF p_estado = 'VALIDADA' THEN
          update NovDias_Dispersion
             set estadonov  = p_estado,
                 usuarioval = p_usuario,
                 fechaval   = sysdate
           where tiponov = p_tiponov
             and numeronov = p_numeronov;
        ELSE
          IF p_estado = 'ANULADA' THEN
            update NovDias_Dispersion
               set estadonov   = p_estado,
                   usuarioanul = p_usuario,
                   fechaanul   = sysdate
             where tiponov = p_tiponov
               and numeronov = p_numeronov;
          ELSE
            update NovDias_Dispersion
               set estadonov = p_estado
             where tiponov = p_tiponov
               and numeronov = p_numeronov;
          END IF;
        END IF;
        p_error := 'Actualizaci?n Exitosa';

        sp_log(p_usuario,
               'u_NovDiasDispersionEst',
               p_tiponov || '-' || p_numeronov || '-' || p_estado);
        commit;

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';
      END;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [u_NovDiasDispersionEst] ' || SQLERRM,
            p_error);
  END u_NovDiasDispersionEst;

  PROCEDURE q_NovValidador_fecha(p_tiponov                  varchar2,
                                 p_numeronov                number,
                                 p_usuario                  varchar2,
                                 p_idmunicipio              out char,
                                 p_idvalidador              out char,
                                 p_indTipo                  out char,
                                 p_fecha_ini                out date,
                                 p_fecha_fin                out date,
                                 p_p_municipio              out number,
                                 p_p_fcm_contravencional    out number,
                                 p_p_conces_contravencional out number,
                                 p_p_acuerdopago            out number,
                                 p_nit_tercero1             out varchar2,
                                 p_base_tercero1            out number,
                                 p_ind_base_tercero1        out number,
                                 p_nit_tercero2             out varchar2,
                                 p_base_tercero2            out number,
                                 p_ind_base_tercero2        out number,
                                 p_fechaact                 out date,
                                 p_firma1                   out varchar2,
                                 p_firma2                   out varchar2,
                                 p_estadonov                out varchar2,
                                 p_error                    OUT VARCHAR2) is
  BEGIN

    -- INICIALIZAR SALIDA
    p_idmunicipio              := '';
    p_idvalidador              := '';
    p_indTipo                  := '';
    p_fecha_ini                := null;
    p_fecha_fin                := null;
    p_p_municipio              := 0;
    p_p_fcm_contravencional    := 0;
    p_p_conces_contravencional := 0;
    p_p_acuerdopago            := 0;
    p_nit_tercero1             := '';
    p_base_tercero1            := 0;
    p_ind_base_tercero1        := 1;
    p_nit_tercero2             := '';
    p_base_tercero2            := 0;
    p_ind_base_tercero2        := 1;

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select idmunicipio,
               idvalidador,
               indTipo,
               fecha_ini,
               fecha_fin,
               p_municipio,
               p_fcm_contravencional,
               p_conces_contravencional,
               p_acuerdopago,
               nit_tercero1,
               base_tercero1,
               ind_base_tercero1,
               nit_tercero2,
               base_tercero2,
               ind_base_tercero2,
               fechaact,
               firma1,
               firma2,
               estadonov
          into p_idmunicipio,
               p_idvalidador,
               p_indTipo,
               p_fecha_ini,
               p_fecha_fin,
               p_p_municipio,
               p_p_fcm_contravencional,
               p_p_conces_contravencional,
               p_p_acuerdopago,
               p_nit_tercero1,
               p_base_tercero1,
               p_ind_base_tercero1,
               p_nit_tercero2,
               p_base_tercero2,
               p_ind_base_tercero2,
               p_fechaact,
               p_firma1,
               p_firma2,
               p_estadonov
          from Novvalidador_fecha
         where tiponov = p_tiponov
           and numeronov = p_numeronov;

        p_error := 'Consulta Exitosa';

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';
      END;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [q_NovValidador_fecha] ' || SQLERRM,
            p_error);
  END q_NovValidador_fecha;

  PROCEDURE i_NovValidador_fecha(p_idmunicipio              char,
                                 p_idvalidador              char,
                                 p_indTipo                  char,
                                 p_fecha_ini_ano            number,
                                 p_fecha_ini_mes            number,
                                 p_fecha_ini_dia            number,
                                 p_fecha_fin_ano            number,
                                 p_fecha_fin_mes            number,
                                 p_fecha_fin_dia            number,
                                 p_p_municipio              number,
                                 p_p_fcm_contravencional    number,
                                 p_p_conces_contravencional number,
                                 p_p_acuerdopago            number,
                                 p_nit_tercero1             varchar2,
                                 p_base_tercero1            number,
                                 p_ind_base_tercero1        number,
                                 p_nit_tercero2             varchar2,
                                 p_base_tercero2            number,
                                 p_ind_base_tercero2        number,
                                 p_usuario                  varchar2,
                                 p_tiponov                  varchar2,
                                 p_fecha_act_ano            number,
                                 p_fecha_act_mes            number,
                                 p_fecha_act_dia            number,
                                 p_firma1                   varchar2,
                                 p_firma2                   varchar2,
                                 p_error                    OUT VARCHAR2,
                                 p_novedad                  OUT varchar2) AS

    w_fecha_ini       validador_fecha.fecha_ini%TYPE;
    w_fecha_fin       validador_fecha.fecha_ini%TYPE;
    w_operacion       varchar2(250);
    w_fecha_act       date;
    numNovedad        number;
    m_dias_activacion number;
    min_fecha_act     date;

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    select TO_DATE(p_fecha_ini_ano || '-' || p_fecha_ini_mes || '-' ||
                   p_fecha_ini_dia,
                   'YYYY-MM-DD')
      into w_fecha_ini
      from DUAL;

    select TO_DATE(p_fecha_fin_ano || '-' || p_fecha_fin_mes || '-' ||
                   p_fecha_fin_dia,
                   'YYYY-MM-DD')
      into w_fecha_fin
      from DUAL;

    IF p_tiponov = '09' THEN
      Select COUNT(*)
        INTO v_valida
        from validador_fecha t
       where idMunicipio = p_idmunicipio
         and idValidador = p_idvalidador
         and indTipo = p_indTipo;
      IF v_valida <> 0 THEN
        p_error := 'Validador Ya existente. ';
        return;
      END IF;
    ELSE
      Select COUNT(*)
        INTO v_valida
        from validador_fecha t
       where idMunicipio = p_idmunicipio
         and idValidador = p_idvalidador
         and indTipo = p_indTipo;
      IF v_valida = 0 THEN
        p_error := 'Registro Validador No existe. ';
        return;
      END IF;
    END IF;

    select TO_DATE(p_fecha_act_ano || '-' || p_fecha_act_mes || '-' ||
                   p_fecha_act_dia,
                   'YYYY-MM-DD')
      into w_fecha_act
      from DUAL;

    select dias_activacion into m_dias_activacion from fcm;
    IF m_dias_activacion is null THEN
      p_error := 'Error en parametrizaci?n (d?as activaci?n)';
      return;
    ELSE
      min_fecha_act := fn_fec_dispersion(sysdate,
                                         m_dias_activacion,
                                         0,
                                         '99999999');
      IF min_fecha_act > w_fecha_act then
        p_error := 'Fecha Activaci?n Inv?lida';
        return;
      ELSE
        select seq_novedad.Nextval into numNovedad from dual;

        insert into Novvalidador_fecha
          (idmunicipio,
           idValidador,
           indTipo,
           fecha_ini,
           fecha_fin,
           p_municipio,
           p_fcm_contravencional,
           p_conces_contravencional,
           p_acuerdopago,
           nit_tercero1,
           base_tercero1,
           ind_base_tercero1,
           nit_tercero2,
           base_tercero2,
           ind_base_tercero2,
           tiponov,
           numeronov,
           fechanov,
           usuarionov,
           fechaact,
           firma1,
           firma2,
           estadonov)
        values
          (p_idmunicipio,
           p_idValidador,
           p_indTipo,
           w_fecha_ini,
           w_fecha_fin,
           p_p_municipio,
           p_p_fcm_contravencional,
           p_p_conces_contravencional,
           p_p_acuerdopago,
           p_nit_tercero1,
           p_base_tercero1,
           p_ind_base_tercero1,
           p_nit_tercero2,
           p_base_tercero2,
           p_ind_base_tercero2,
           p_tiponov,
           numNovedad,
           sysdate,
           p_usuario,
           w_fecha_act,
           p_firma1,
           p_firma2,
           'INGRESADA');

        w_operacion := 'i_NovValidador_fecha';

        p_error := MSG_INS_OK;

        p_novedad := p_tiponov || '-' || to_char(numNovedad, '0000000');

        sp_log(p_usuario,
               w_operacion,
               p_idmunicipio || '-' || p_idValidador || '-' || p_indTipo || '-' ||
               p_fecha_ini_ano || '-' || p_fecha_ini_mes || '-' ||
               p_fecha_ini_dia || '-' || p_fecha_fin_ano || '-' ||
               p_fecha_fin_mes || '-' || p_fecha_fin_dia || '-' ||
               p_p_municipio || '-' || p_p_fcm_contravencional || '-' ||
               p_p_conces_contravencional || '-' || p_p_acuerdopago || '-' ||
               p_nit_tercero1 || '-' || p_base_tercero1 || '-' ||
               p_ind_base_tercero1 || '-' || p_nit_tercero2 || '-' ||
               p_base_tercero2 || '-' || p_ind_base_tercero2);

        commit;
      END IF;
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [i_NovValidador_fecha] ' || SQLERRM,
            p_error);

  END i_NovValidador_fecha;

  PROCEDURE q_NovValidador_fechaE(p_tiponov   varchar2,
                                  p_numeronov number,
                                  p_usuario   varchar2,
                                  p_estadonov out varchar2,
                                  p_error     OUT VARCHAR2) is
  BEGIN

    -- INICIALIZAR SALIDA
    p_estadonov := '';

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select estadonov
          into p_estadonov
          from novvalidador_fecha
         where tiponov = p_tiponov
           and numeronov = p_numeronov;
        p_error := 'Consulta Exitosa';

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';
      END;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [q_NovValidador_fechaE] ' || SQLERRM,
            p_error);
  END q_NovValidador_fechaE;

  PROCEDURE u_NovValidador_fechaEst(p_tiponov   varchar2,
                                    p_numeronov number,
                                    p_usuario   varchar2,
                                    p_estado    varchar2,
                                    p_error     OUT VARCHAR2) is

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        IF p_estado = 'VALIDADA' THEN
          update NovValidador_Fecha
             set estadonov  = p_estado,
                 usuarioval = p_usuario,
                 fechaval   = sysdate
           where tiponov = p_tiponov
             and numeronov = p_numeronov;
        ELSE
          IF p_estado = 'ANULADA' THEN
            update NovValidador_Fecha
               set estadonov   = p_estado,
                   usuarioanul = p_usuario,
                   fechaanul   = sysdate
             where tiponov = p_tiponov
               and numeronov = p_numeronov;
          ELSE
            update NovValidador_Fecha
               set estadonov = p_estado
             where tiponov = p_tiponov
               and numeronov = p_numeronov;
          END IF;
        END IF;
        p_error := 'Actualizaci?n Exitosa';

        sp_log(p_usuario,
               'u_NovValidador_fechaEst',
               p_tiponov || '-' || p_numeronov || '-' || p_estado);
        commit;

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';
      END;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [u_NovValidador_fechaEst] ' || SQLERRM,
            p_error);
  END u_NovValidador_fechaEst;

  -- Function and procedure implementations
  PROCEDURE aprobar_reproceso(p_fec_ini_ano number,
                              p_fec_ini_mes number,
                              p_fec_ini_dia number,
                              p_tipo        varchar2,
                              p_motivo      varchar2,
                              p_usuario     varchar2,
                              p_error       OUT VARCHAR2) as

    w_fec_cor_ini date;
    w_fec_cor_fin date;
    w_registros   number;
    descTipo      varchar2(250);

  begin
    -- VALIDACIONES
    if (not p_usuario = '99999999') THEN
      sp_v_usuario(p_usuario, p_error, 'pk_proc');
    END IF;

    IF not P_ERROR is null THEN
      return;
    END IF;

    select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                   p_fec_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_ini
      from DUAL;

    descTipo := '';

    if p_tipo = 'E' then
      begin

        descTipo := 'REPROCESO DISTRIBUCION RECAUDO EXTERNO';

        delete recaudo_externo_causacion
         where fec_corte_ini = w_fec_cor_ini;

        delete recaudo_externo_contabilidad
         where fechadoc = to_char(w_fec_cor_ini, 'yyyyMMdd');

        delete recaudo_externo_disp where fec_corte_ini = w_fec_cor_ini;

        delete recaudo_externo_liquidacion where fec_corte = w_fec_cor_ini;

      end;
    end if;

 /*   if p_tipo = 'L' then
      begin

        descTipo := 'REPROCESO DISTRIBUCION RECAUDO LOCAL';

        delete recaudo_local_causacion where fec_corte_ini = w_fec_cor_ini;

        delete recaudo_local_disp where fec_corte = w_fec_cor_ini;

        delete recaudo_local_liquidacion where fec_corte = w_fec_cor_ini;

        update trxsinidentificar
           set fechaliq = null
         where estadoiden = 'ID'
           and fechaliq = w_fec_cor_ini;

      update recaudo_local
      set FECHALIQ = null
      where fechaliq = w_fec_cor_ini;

      end;
    end if;*/

    if p_tipo = 'T' then
      begin

        descTipo := 'REPROCESO TRANFERENCIA RECAUDO EXTERNO';

        DELETE recaudo_externo_disp_tot
         where fec_dispersion = w_fec_cor_ini;

        update novdevolucion
           set (fechaaplicacion, estadonov) =
               (select null, 'VALIDADA' from dual)
         where estadonov = 'ACTIVADA'
           and fechaaplicacion = w_fec_cor_ini;

        update novdevolucion
           set fechacobro = null
         where fechacobro = w_fec_cor_ini;

        update novdevolucion
           set fechacobro2 = null
         where fechacobro2 = w_fec_cor_ini;

        update recaudo_externo_disp_tot
           set fechareenvio = null
         where indreenvio = 'S'
           and FECHAACTREEENVIO = w_fec_cor_ini
           and fechareenvio = w_fec_cor_ini;

      end;
    end if;

    if p_tipo = 'B' then
      begin

        descTipo := 'REPROCESO ENVIO A BANCO';

        update recaudo_externo_disp_tot
           set enviadobanco = 0
         where fec_corte_ini = w_fec_cor_ini;
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
                                        to_char(w_fec_cor_ini, 'yyyy-MM-dd'),
                         mensaje     => 'El sistema SDF informa que autorizo el ' ||
                                        descTipo || ' del dia ' ||
                                        to_char(w_fec_cor_ini, 'yyyy-MM-dd') ||
                                        '. Por el siguiente motivo ' ||
                                        p_motivo,
                         p_usuario   => p_usuario);

    p_error := 'Aprobacion Correcta : ' || p_fec_ini_ano || '-' ||
               p_fec_ini_mes || '-' || p_fec_ini_dia;

    sp_log(p_usuario,
           'aprobar_reproceso',
           p_tipo || '-' || p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
           p_fec_ini_dia);

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [aprobar_reproceso] ' || SQLERRM,
            p_error);

  end aprobar_reproceso;

  PROCEDURE l_recaudo_local(p_fec_ini_ano number,
                            p_fec_ini_mes number,
                            p_fec_ini_dia number,
                            p_fec_fin_ano number,
                            p_fec_fin_mes number,
                            p_fec_fin_dia number,
                            p_banco       varchar2,
                            p_usuario     varchar2,
                            p_error       OUT VARCHAR2) as

    w_fec_cor_ini date;
    w_fec_cor_fin date;
    w_registros   number;
    w_divipo varchar2(8);
    w_valor varchar2(500);

  begin
    -- VALIDACIONES
 --   sp_v_usuario(p_usuario, p_error, 'pk_proc');

    IF not P_ERROR is null THEN
      return;
    end if;

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

       select count(*)
      into w_registros
      from recaudo_local_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and decode(idbanco, '52', '52', '99') = p_banco;

    if (w_registros > 0) then
      p_error := 'Distribucion ya ejecutada. Solicitar reproceso';
      return;
    end if;

    if (to_char(w_fec_cor_ini, 'yyyymm') <>
       to_char(w_fec_cor_fin, 'yyyymm')) then
      p_error := 'Periodo a distribuir debe ser del mismo mes';
      return;
    end if;

    if (to_char(w_fec_cor_fin, 'dd') <> '15') then
      if (to_char(w_fec_cor_fin, 'yyyymmdd') <>
         to_char(last_day(w_fec_cor_fin), 'yyyymmdd')) then
        p_error := 'Fecha debe ser de fin de mes';
        return;
      end if;
    end if;

    if (to_char(w_fec_cor_ini, 'dd') <> '01' and
       to_char(w_fec_cor_ini, 'dd') <> '16') then
      p_error := 'Fecha inicial debe ser 01 o 16 del mes';
      return;
    end if;

    sp_liquida_recaudo_local(w_fec_cor_ini,
                             w_fec_cor_fin,
                             p_banco,
                             p_usuario,
                             p_error);

  if (p_error <> null ) then
    commit;
    return;
  end if;
   dispersa_recaudo_local(p_fec_ini_ano,
                           p_fec_ini_mes,
                           p_fec_ini_dia,
                           p_fec_fin_ano,
                           p_fec_fin_mes,
                           p_fec_fin_dia,
                           p_banco,
                           p_usuario,
                           p_error);



    pk_recloc.contabiliza_recaudo_local(p_fec_ini_ano,
                                        p_fec_ini_mes,
                                        p_fec_ini_dia,
                                        p_fec_fin_ano,
                                        p_fec_fin_mes,
                                        p_fec_fin_dia,
                                        p_banco,
                                        p_usuario,
                                        p_error);

    select count(*)
    into w_registros
    from recaudo_local_liquidacion r
 where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and decode(idbanco, '52', '52', '99') = p_banco
       and nvl(r.p_valor_7,0) = 0
       and nvl(r.p_valor_12,0) = 0
       and nvl(r.p_valor_15,0) = 0
       and r.indtipo = 'POLCA';

       if (w_registros > 0) then

    select r.idmunicipio, to_char(r.valor_total,'99,999,999,999,999.00')
    into w_divipo, w_valor
    from recaudo_local_liquidacion r
 where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and decode(idbanco, '52', '52', '99') = p_banco
       and nvl(r.p_valor_7,0) = 0
       and nvl(r.p_valor_12,0) = 0
       and nvl(r.p_valor_15,0) = 0
       and r.indtipo = 'POLCA'
       and rownum = 1;



         p_error := 'REGISTROS POLCA CON VIGENCIAS NO PERMITIDAS. FAVOR VALIDAR Y AJUSTAR VIGENCIAS. DIVIPO:' ||
         w_divipo ||
         ' Valor: ' || w_valor ||
         '. Recuerde que los rangos validos de vigencias son:(<= 2015-01-16),(>= 2015-01-17 y <= 2017-04-16), (>= 2017-04-17 y <= 2017-04-24), (>= 2017-04-25). No debe sobrelapar estos rangos' ;

       end if;

       commit;

         EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [l_recaudo_local] ' || SQLERRM,
            p_error);
  END l_recaudo_local;

  procedure sp_liquida_recaudo_local(p_fec_ini date,
                                     p_fec_fin date,
                                     p_banco   varchar2,
                                     p_usuario varchar2,
                                     p_error   OUT VARCHAR2) is
    dd dias_dispersion%rowtype;

    w_registros   number;
    w_idmunicipio char(8);
    w_idbanco     char(2);

    p_simit_s                   number;
    p_concesionario_s           number;
    p_fondo_cob_concesionario_s number;
    p_fondo_cob_simit_s         number;
    p_equilibrio_economico_s    number;
    p_fechaprorroga             date;

    p_simit_pm                   number;
    p_concesionario_pm           number;
    p_fondo_cob_concesionario_pm number;
    p_fondo_cob_simit_pm         number;
    p_equilibrio_economico_pm    number;
    p_simit_pp                   number;
    p_sevial_pp                  number;
    p_equilibrio_economico_pp    number;
    p_polca_cp                   number;
    p_fcm_cp                     number;
    p_sevial_cp                  number;
    p_equilibrio_economico_cp    number;

    CURSOR tConcesionario IS
      select c.idconcesionario from p_dispersion_concesionario c;

  BEGIN

    delete recaudo_local_liquidacion
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and decode(idbanco, '52', '52', '99') = p_banco;

    commit;

    insert into recaudo_local_liquidacion
      (idrecaudo_local_liquidacion,
       idbanco,
       cta_recaudo,
       indtipo,
       fec_corte,
       fec_tran,
       oficina_origen,
       valor_efectivo,
       valor_cheque,
       valor_total,
       nit_m,
       idmunicipio,
       iddepartamento,
       indorigen,
       p_consignado,
       vigencia,
       fec_vig_ini,
       fec_vig_fin)
      select seq_recaudo_local_liquidacion.Nextval,
             idbanco,
             cta_recaudo,
             indtipo,
             fec_corte,
             fec_tran,
             oficina_origen,
             valor_efectivo,
             valor_cheque,
             valor_total,
             nit_m,
             idmunicipio,
             Substr(idmunicipio, 1, 2),
             'REC',
             p_consignado,
             vigencia,
             FEC_VIG_INI,
             FEC_VIG_FIN
        from recaudo_local
       where fec_corte >= p_fec_ini
         and fec_corte <= p_fec_fin
         and decode(idbanco, '52', '52', '99') = p_banco;

    insert into recaudo_local_liquidacion
      (idrecaudo_local_liquidacion,
       idbanco,
       cta_recaudo,
       indtipo,
       fec_corte,
       fec_tran,
       oficina_origen,
       valor_efectivo,
       valor_cheque,
       valor_total,
       nit_m,
       idmunicipio,
       iddepartamento,
       indorigen,
       p_consignado,
       vigencia,
       fec_vig_ini,
       fec_vig_fin)
      select SEQ_RECAUDO_LOCAL_LIQUIDACION.Nextval,
             idbanco,
             cta_recaudo,
             indtipo,
             fec_corte,
             fec_tran,
             null, --oficina_origen
             valor_total, --valor_efectivo
             0, --valor_cheque
             valor_total,
             null, --nit_m
             idmunicipio,
             Substr(idmunicipio, 1, 2),
             decode(nvl(acuerdo,0),1,'ACU', 'AJU'),
             p_consignado,
             vigencia,
             fec_vig_ini,
             fec_vig_fin
        from recaudo_local_ajustes
       where fec_corte >= p_fec_ini
         and fec_corte <= p_fec_fin
         and decode(idbanco, '52', '52', '99') = p_banco;

    IF (to_char(p_fec_fin, 'dd') = '15') then
      insert into recaudo_local_liquidacion
        (idrecaudo_local_liquidacion,
         idbanco,
         cta_recaudo,
         indtipo,
         fec_corte,
         fec_tran,
         oficina_origen,
         valor_efectivo,
         valor_cheque,
         valor_total,
         nit_m,
         idmunicipio,
         iddepartamento,
         indorigen,
         p_consignado,
         idrecaudolocal_liquidacion,
         vigencia,
         fec_vig_ini,
         fec_vig_fin)
        select seq_recaudo_local_liquidacion.Nextval,
               idbanco,
               cuenta,
               indtipoiden,
               p_fec_fin,
               fechatrx,
               oficinaorigen,
               valortrx, --valor_efectivo
               0, -- valor_cheque
               valortrx, -- valor_total
               null, -- nit_m
               idmunicipioiden,
               Substr(idmunicipioiden, 1, 2),
               'IDE',
               p_consignadoiden,
               numsecuenciareg,
               vigencia,
               FECHAINICIO,
               FECHAFIN
          from trxsinidentificar
         where estadoiden = 'ID'
           and fechaliq is null
           and idmunicipioiden <> '00000001'
           and quincena = '15'
           and decode(idbanco, '52', '52', '99') = p_banco;
    else
      insert into recaudo_local_liquidacion
        (idrecaudo_local_liquidacion,
         idbanco,
         cta_recaudo,
         indtipo,
         fec_corte,
         fec_tran,
         oficina_origen,
         valor_efectivo,
         valor_cheque,
         valor_total,
         nit_m,
         idmunicipio,
         iddepartamento,
         indorigen,
         p_consignado,
         idrecaudolocal_liquidacion,
         vigencia,
         fec_vig_ini,
         fec_vig_fin)
        select seq_recaudo_local_liquidacion.Nextval,
               idbanco,
               cuenta,
               indtipoiden,
               p_fec_fin,
               fechatrx,
               oficinaorigen,
               valortrx, --valor_efectivo
               0, -- valor_cheque
               valortrx, -- valor_total
               null, -- nit_m
               idmunicipioiden,
               Substr(idmunicipioiden, 1, 2),
               'IDE',
               p_consignadoiden,
               numsecuenciareg,
               vigencia,
               FECHAINICIO,
               FECHAFIN
          from trxsinidentificar
         where estadoiden = 'ID'
           and fechaliq is null
           and idmunicipioiden <> '00000001'
           and decode(idbanco, '52', '52', '99') = p_banco;

    end if;

    insert into recaudo_local_liquidacion
      (idrecaudo_local_liquidacion,
       idbanco,
       cta_recaudo,
       indtipo,
       fec_corte,
       fec_tran,
       oficina_origen,
       valor_efectivo,
       valor_cheque,
       valor_total,
       nit_m,
       idmunicipio,
       iddepartamento,
       indorigen,
       p_consignado,
       idrecaudolocal_liquidacion,
       vigencia,
       fec_vig_ini,
       fec_vig_fin)
      select seq_recaudo_local_liquidacion.Nextval,
             idbanco,
             cuenta,
             'SIMIT',
             p_fec_fin,
             fec_pago,
             'ACUERDO DE PAGO ANTES DE PRORROGA',
             vlrsimitantesprorroga,
             0, -- VALOR CHEQUE
             vlrsimitantesprorroga,
             '', -- NIT
             divipo,
             SUBSTR(DIVIPO, 1, 2),
             'ACU',
             10,
             idacuerdo,
             vigencia,
             fec_vig_ini,
             fec_vig_fin
        from acuerdopago
       where vlrsimitantesprorroga <> 0
         and estado = 'LI'
         and fechaliq is null
         and decode(idbanco, '52', '52', '99') = p_banco;


    insert into recaudo_local_liquidacion
      (idrecaudo_local_liquidacion,
       idbanco,
       cta_recaudo,
       indtipo,
       fec_corte,
       fec_tran,
       oficina_origen,
       valor_efectivo,
       valor_cheque,
       valor_total,
       nit_m,
       idmunicipio,
       iddepartamento,
       indorigen,
       p_consignado,
       idrecaudolocal_liquidacion,
       vigencia,
       fec_vig_ini,
       fec_vig_fin)
      select seq_recaudo_local_liquidacion.Nextval,
             idbanco,
             cuenta,
             'POLCA',
             p_fec_fin,
             fec_pago,
             'ACUERDO DE PAGO ANTES DE PRORROGA',
             vlrpolcaantesprorroga,
             0, -- VALOR CHEQUE
             vlrpolcaantesprorroga,
             '', -- NIT
             divipo,
             SUBSTR(DIVIPO, 1, 2),
             'ACU',
             porcentaje,
             idacuerdo,
             vigencia,
             fec_vig_ini,
             fec_vig_fin
        from acuerdopago
       where vlrpolcaantesprorroga <> 0
         and estado = 'LI'
         and fechaliq is null
       and decode(idbanco, '52', '52', '99') = p_banco;

    insert into recaudo_local_liquidacion
      (idrecaudo_local_liquidacion,
       idbanco,
       cta_recaudo,
       indtipo,
       fec_corte,
       fec_tran,
       oficina_origen,
       valor_efectivo,
       valor_cheque,
       valor_total,
       nit_m,
       idmunicipio,
       iddepartamento,
       indorigen,
       p_consignado,
       idrecaudolocal_liquidacion,
       vigencia,
       fec_vig_ini,
       fec_vig_fin)
      select seq_recaudo_local_liquidacion.Nextval,
             idbanco,
             cuenta,
             'SIMIT',
             p_fec_fin,
             fec_pago,
             'ACUERDO DE PAGO DESPUES DE PRORROGA',
             vlrsimitdespuesprorroga,
             0, -- VALOR CHEQUE
             vlrsimitdespuesprorroga,
             '', -- NIT
             divipo,
             SUBSTR(DIVIPO, 1, 2),
             'ACU',
             10,
             idacuerdo,
             vigencia,
             fec_vig_ini,
             fec_vig_fin
        from acuerdopago
       where vlrsimitdespuesprorroga <> 0
         and estado = 'LI'
         and fechaliq is null
       and decode(idbanco, '52', '52', '99') = p_banco;

    insert into recaudo_local_liquidacion
      (idrecaudo_local_liquidacion,
       idbanco,
       cta_recaudo,
       indtipo,
       fec_corte,
       fec_tran,
       oficina_origen,
       valor_efectivo,
       valor_cheque,
       valor_total,
       nit_m,
       idmunicipio,
       iddepartamento,
       indorigen,
       p_consignado,
       idrecaudolocal_liquidacion,
       vigencia,
       fec_vig_ini,
       fec_vig_fin)
      select seq_recaudo_local_liquidacion.Nextval,
             idbanco,
             cuenta,
             'POLCA',
             p_fec_fin,
             fec_pago,
             'ACUERDO DE PAGO DESPUES DE PRORROGA',
             vlrpolcadespuesprorroga,
             0, -- VALOR CHEQUE
             vlrpolcadespuesprorroga,
             '', -- NIT
             divipo,
             SUBSTR(DIVIPO, 1, 2),
             'ACU',
             porcentaje,
             idacuerdo,
             vigencia,
             fec_vig_ini,
             fec_vig_fin
        from acuerdopago
       where vlrpolcadespuesprorroga <> 0
         and estado = 'LI'
         and fechaliq is null
       and decode(idbanco, '52', '52', '99') = p_banco;


    commit;

    update recaudo_local_liquidacion
       set idrecaudolocal_liquidacion = idrecaudo_local_liquidacion
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and decode(idbanco, '52', '52', '99') = p_banco
       and idrecaudolocal_liquidacion is null;

    update recaudo_local_liquidacion l
       set (l.idconcesionario, l.ind_proceso) =
           (select m.idconcesionario, m.indliq_s_local
              from municipio m
             where m.idmunicipio = l.idmunicipio)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and l.indtipo = 'SIMIT'
       and decode(idbanco, '52', '52', '99') = p_banco;

    update recaudo_local_liquidacion l
       set (l.idconcesionario, l.ind_proceso) =
           (select m.idconcesionario, m.indliq_p_local

              from municipio m
             where m.idmunicipio = l.idmunicipio)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and l.indtipo = 'POLCA'
       and decode(idbanco, '52', '52', '99') = p_banco;

    /* Se elimina porq no se requiere esta validacion para reacaudo
    local 09/12/15 20:00*/
    -- verifica que todos los municipios esten parametrizados
    select count(*)
      into w_registros
      from recaudo_local_liquidacion
     where idconcesionario is null
       and fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and decode(idbanco, '52', '52', '99') = p_banco;

    IF w_registros > 0 THEN
      select idmunicipio
        into w_idMunicipio
        from recaudo_local_liquidacion
       where idconcesionario is null
         and fec_corte >= p_fec_ini
         and fec_corte <= p_fec_fin
         and decode(idbanco, '52', '52', '99') = p_banco
         and rownum = 1;

      p_error := 'PROCESO NO EJECUTADO. MUNICIPIO SIN PARAMETRIZAR: ' ||
                 w_idMunicipio;
      RETURN;
    END IF;
    /**/
    update recaudo_local_liquidacion l
       set (l.dias_dispersion, l.frec_dispersion) =
           (select dd.dias_dispersion_sl, dd.frec_dispersion_sl
              from dias_dispersion dd
             where dd.idmunicipio = l.idmunicipio
               and dd.idbanco = l.idbanco)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and l.indtipo = 'SIMIT'
       and ind_proceso = 1
       and decode(idbanco, '52', '52', '99') = p_banco;

    update recaudo_local_liquidacion l
       set (l.dias_dispersion, l.frec_dispersion) =
           (select dd.dias_dispersion_pl, dd.frec_dispersion_pl
              from dias_dispersion dd
             where dd.idmunicipio = l.idmunicipio
               and dd.idbanco = l.idbanco)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and l.indtipo = 'POLCA'
       and ind_proceso = 1
       and decode(idbanco, '52', '52', '99') = p_banco;

    -- verifica que todos los municipios tengas fechas de dispersion
    select count(*)
      into w_registros
      from recaudo_local_liquidacion
     where dias_dispersion is null
       and fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and decode(idbanco, '52', '52', '99') = p_banco;

    IF w_registros > 0 THEN
      select idmunicipio, idbanco
        into w_idMunicipio, w_idbanco
        from recaudo_local_liquidacion
       where dias_dispersion is null
         and fec_corte >= p_fec_ini
         and fec_corte <= p_fec_fin
         and ind_proceso = 1
         and rownum = 1
         and decode(idbanco, '52', '52', '99') = p_banco;

      p_error := 'PROCESO NO EJECUTADO. MUNICIPIO SIN DIAS DISPERSION: ' ||
                 w_idMunicipio || ' BANCO: ' || w_idbanco;
      RETURN;
    END IF;

    -- calcula fecha dispersion avvillas 5 dia habil despues de la
    --quincena
    update recaudo_local_liquidacion l
       set l.fec_dispersion = p_fec_fin
       --fn_fec_dispersion(fn_fec_dispersion(l.fec_corte,0,2,p_usuario),4,0,p_usuario)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and decode(idbanco, '52', '52', '99') = p_banco;

       commit;

        select count(*)
      into w_registros
      from recaudo_local_liquidacion
     where fec_dispersion is null
       and fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and decode(idbanco, '52', '52', '99') = p_banco;

     IF w_registros > 0 THEN

      p_error := 'PROCESO NO EJECUTADO. problemas fecha dispersion ' ;
      RETURN;
    END IF;


 --      and idbanco = '52';

    -- calcula fecha dispersion otros bancos a los 20 dias del mes
/*    update recaudo_local_liquidacion l
       set l.fec_dispersion = fn_fec_dispersion(to_date(to_char(fn_fec_dispersion(l.fec_corte,

                                                                                  0,

                                                                                  3,

                                                                                  p_usuario),

                                                                'yyyymm') || '20',
                                                        'yyyymmdd'),
                                                0,
                                                0,
                                                p_usuario)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and decode(idbanco, '52', '52', '99') = p_banco
       and idbanco <> '52';*/

    update recaudo_local_liquidacion l
       set l.s_valor_0 =
           (select c.comision_recaudo * (1 + (fcm.iva / 100))
              from cta_recaudo_fcm c, fcm
             where l.idbanco = c.idbanco
               and l.cta_recaudo = c.cuenta)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and decode(idbanco, '52', '52', '99') = p_banco;

    -- SIMIT

    for conces in tConcesionario loop

      -- porcentajes a la fecha
      select p.simit_s,
             p.concesionario_s,
             p.fondo_cob_concesionario_s,
             p.fondo_cob_simit_s,
             p.equilibrio_economico_s,
             p.fechaprorroga
        into p_simit_s,
             p_concesionario_s,
             p_fondo_cob_concesionario_s,
             p_fondo_cob_simit_s,
             p_equilibrio_economico_s,
             p_fechaprorroga
        from p_dispersion_concesionario p
       where p.idconcesionario = conces.idconcesionario;

      -- si la fecha de prorroga esta vacia mantener liquidacion actual

      if (p_fechaprorroga is null) then
        update recaudo_local_liquidacion l
           set (l.s_valor_1,
                l.s_valor_2,
                l.s_valor_3,
                l.s_valor_4,
                l.s_valor_5) =
               (select l.valor_total * (p_simit_s / 10),
                       l.valor_total * (p_concesionario_s / 10),
                       l.valor_total * (p_fondo_cob_concesionario_s / 10),
                       l.valor_total * (p_fondo_cob_simit_s / 10),
                       l.valor_total * (p_equilibrio_economico_s / 10)
                  from dual)
         where fec_corte >= p_fec_ini
           and fec_corte <= p_fec_fin
           and ind_proceso = 1
           and l.indtipo = 'SIMIT'
           and l.idconcesionario = conces.idConcesionario
           and decode(idbanco, '52', '52', '99') = p_banco;
      else
        -- utilizar porcentajes actuales para
        -- recaudos superiores a la fecha de prorroga
        update recaudo_local_liquidacion l
           set (l.s_valor_1,
                l.s_valor_2,
                l.s_valor_3,
                l.s_valor_4,
                l.s_valor_5) =
               (select l.valor_total * (p_simit_s / 10),
                       l.valor_total * (p_concesionario_s / 10),
                       l.valor_total * (p_fondo_cob_concesionario_s / 10),
                       l.valor_total * (p_fondo_cob_simit_s / 10),
                       l.valor_total * (p_equilibrio_economico_s / 10)
                  from dual)
         where fec_corte >= p_fec_ini
           and fec_corte <= p_fec_fin
           and ind_proceso = 1
           and l.indtipo = 'SIMIT'
           and l.idconcesionario = conces.idConcesionario
           and l.fec_tran >= p_fechaprorroga
           and decode(idbanco, '52', '52', '99') = p_banco;

        -- utilizar porcentajes antes de la prorroga
        -- para recuados anteriores a la fecha de prorroga

        if (conces.idConcesionario = '04' and
           p_fec_ini = to_date('2015-08-01', 'yyyy-mm-dd')) then

          p_simit_s                   := 2.5;
          p_concesionario_s           := 6.5;
          p_fondo_cob_concesionario_s := 0.5;
          p_fondo_cob_simit_s         := 0.5;
          p_equilibrio_economico_s    := 0;
        end if;

        update recaudo_local_liquidacion l
           set (l.s_valor_1,
                l.s_valor_2,
                l.s_valor_3,
                l.s_valor_4,
                l.s_valor_5) =
               (select l.valor_total * (p_simit_s / 10),
                       l.valor_total * (p_concesionario_s / 10),
                       l.valor_total * (p_fondo_cob_concesionario_s / 10),
                       l.valor_total * (p_fondo_cob_simit_s / 10),
                       l.valor_total * (p_equilibrio_economico_s / 10)
                  from dual)
         where fec_corte >= p_fec_ini
           and fec_corte <= p_fec_fin
           and ind_proceso = 1
           and l.indtipo = 'SIMIT'
           and l.idconcesionario = conces.idConcesionario
           and l.fec_tran < p_fechaprorroga
           and decode(idbanco, '52', '52', '99') = p_banco;

      end if;

    end loop; -- fin ciclo1

    -- redondear a dos decimales todos los calculos
    update recaudo_local_liquidacion l
       set l.s_valor_0 = ROUND(l.s_valor_0, 2),
           l.s_valor_1 = ROUND(l.s_valor_1, 2),
           l.s_valor_2 = ROUND(l.s_valor_2, 2),
           l.s_valor_3 = ROUND(l.s_valor_3, 2)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'SIMIT'
       and decode(idbanco, '52', '52', '99') = p_banco;

    -- ajustar decimales para los que tienen fondo cobertura
    update recaudo_local_liquidacion l
       set l.s_valor_4 = l.valor_total - l.s_valor_1 - l.s_valor_2 -
                         l.s_valor_3
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'SIMIT'
       and l.s_valor_5 = 0
       and l.s_valor_4 <> 0
       and decode(idbanco, '52', '52', '99') = p_banco;

    -- ajustar decimales para los que no tienen fondo cobertura
    update recaudo_local_liquidacion l
       set l.s_valor_2 = l.valor_total - l.s_valor_1
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'SIMIT'
       and l.s_valor_5 = 0
       and l.s_valor_4 = 0
       and decode(idbanco, '52', '52', '99') = p_banco;

    -- ajustar para los que tienen equilibrio economicoa
    update recaudo_local_liquidacion l
       set l.s_valor_5 = l.valor_total - l.s_valor_1 - l.s_valor_2 -
                         l.s_valor_3
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'SIMIT'
       and l.s_valor_5 <> 0
       and decode(idbanco, '52', '52', '99') = p_banco;

    -- calcular netos
    update recaudo_local_liquidacion l
       set l.s_valor_6 = l.s_valor_2 - l.s_valor_0
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'SIMIT'
       and decode(idbanco, '52', '52', '99') = p_banco;

    for conces in tConcesionario loop

      -- porcentajes a la fecha
      select p.simit_pm,
             p.concesionario_pm,
             p.fondo_cob_concesionario_pm,
             p.fondo_cob_simit_pm,
             p.equilibrio_economico_pm,
             p.simit_pp,
             p.sevial_pp,
             p.equilibrio_economico_pp,
             p.polca_cp,
             p.fcm_cp,
             p.sevial_cp,
             p.equilibrio_economico_cp,
             p.fechaprorroga
        into p_simit_pm,
             p_concesionario_pm,
             p_fondo_cob_concesionario_pm,
             p_fondo_cob_simit_pm,
             p_equilibrio_economico_pm,
             p_simit_pp,
             p_sevial_pp,
             p_equilibrio_economico_pp,
             p_polca_cp,
             p_fcm_cp,
             p_sevial_cp,
             p_equilibrio_economico_cp,
             p_fechaprorroga
        from p_dispersion_concesionario p
       where p.idconcesionario = conces.idconcesionario;

           -- acuerdo de pago
 /*       update recaudo_local_liquidacion l
           set (l.p_valor_7,
                l.p_valor_8,
                l.p_valor_9,
                l.p_valor_10,
                l.p_valor_11,
                l.p_valor_12,
                l.p_valor_13,
                l.p_valor_14,
                l.p_valor_15,
                l.p_valor_16,
                l.p_valor_17,
                l.p_valor_18) =
               (select l.valor_total * (p_simit_pm / 55),
                       l.valor_total * (p_concesionario_pm / 55),
                       l.valor_total * (p_fondo_cob_concesionario_pm / 55),
                       l.valor_total * (p_fondo_cob_simit_pm / 55),
                       l.valor_total * (p_equilibrio_economico_pm / 55),
                       l.valor_total * (p_simit_pp / 55),
                       l.valor_total * (p_sevial_pp / 55),
                       l.valor_total * (p_equilibrio_economico_pp / 55),
                       l.valor_total * (p_polca_cp / 55),
                       l.valor_total * (p_fcm_cp / 55),
                       l.valor_total * (p_sevial_cp / 55),
                       l.valor_total * (p_equilibrio_economico_cp / 55)
                  from dual)
         where l.fec_corte >= p_fec_ini
           and l.fec_corte <= p_fec_fin
           and l.ind_proceso = 1
           and l.indtipo = 'POLCA'
           and l.idconcesionario = conces.idConcesionario
           and nvl(l.fec_vig_fin,to_date('2016-09-12','yyyy-mm-dd')) >= to_date('2016-09-11','yyyy-mm-dd')
           and l.indorigen = 'ACU'
           and decode(idbanco, '52', '52', '99') = p_banco;

        -- ajusta municipios que solo consignan el 10%
        update recaudo_local_liquidacion l
           set (l.p_valor_7,
                l.p_valor_8,
                l.p_valor_9,
                l.p_valor_10,
                l.p_valor_11,
                l.p_valor_12,
                l.p_valor_13,
                l.p_valor_14,
                l.p_valor_15,
                l.p_valor_16,
                l.p_valor_17,
                l.p_valor_18) =
               (select l.valor_total * (p_simit_pm / 10),
                       l.valor_total * (p_concesionario_pm / 10),
                       l.valor_total * (p_fondo_cob_concesionario_pm / 10),
                       l.valor_total * (p_fondo_cob_simit_pm / 10),
                       l.valor_total * (p_equilibrio_economico_pm / 10),
                       l.valor_total * (p_simit_pp / 10),
                       l.valor_total * (p_sevial_pp / 10),
                       l.valor_total * (p_equilibrio_economico_pp / 10),
                       0.0, --l.valor_total * (p_polca_cp / 55),
                       0.0, -- l.valor_total *(p_fcm_cp / 55),
                       0.0, -- l.valor_total *(p_sevial_cp / 55),
                       0.0 --l.valor_total * (p_equilibrio_economico_cp/ 55)
                  from dual)
         where fec_corte >= p_fec_ini
           and fec_corte <= p_fec_fin
           and ind_proceso = 1
           and p_consignado = 10
           and l.indtipo = 'POLCA'
           and l.indorigen = 'ACU'
           and l.idconcesionario = conces.idConcesionario
           and nvl(l.fec_vig_fin,to_date('2016-09-12','yyyy-mm-dd')) >= to_date('2016-09-11','yyyy-mm-dd')
           and decode(idbanco, '52', '52', '99') = p_banco;

        -- ajusta municipios que solo consignan el 45%
        update recaudo_local_liquidacion l
           set (l.p_valor_7,
                l.p_valor_8,
                l.p_valor_9,
                l.p_valor_10,
                l.p_valor_11,
                l.p_valor_12,
                l.p_valor_13,
                l.p_valor_14,
                l.p_valor_15,
                l.p_valor_16,
                l.p_valor_17,
                l.p_valor_18) =
               (select 0.0, -- l.valor_total * (p_simit_pm / 10),
                       0.0, -- l.valor_total *(p_concesionario_pm / 10),
                       0.0, -- l.valor_total*(p_fondo_cob_concesionario_pm / 10),
                       0.0, -- l.valor_total *(p_fondo_cob_simit_pm /10),
                       0.0, -- l.valor_total *(p_equilibrio_economico_pm/ 10),
                       0.0, -- l.valor_total * (p_simit_pp / 10),
                       0.0, -- l.valor_total *(p_sevial_pp / 10),
                       0.0, -- l.valor_total *(p_equilibrio_economico_pp / 10),
                       l.valor_total * (p_polca_cp / 45),
                       l.valor_total * (p_fcm_cp / 45),
                       l.valor_total * (p_sevial_cp / 45),
                       l.valor_total * (p_equilibrio_economico_cp / 45)
                  from dual)
         where fec_corte >= p_fec_ini
           and fec_corte <= p_fec_fin
           and ind_proceso = 1
           and p_consignado = 45
           and l.indtipo = 'POLCA'
           and l.idconcesionario = conces.idConcesionario
           and nvl(l.fec_vig_fin,to_date('2016-09-12','yyyy-mm-dd')) >= to_date('2016-09-11','yyyy-mm-dd')
           and l.indorigen = 'ACU'
           and decode(idbanco, '52', '52', '99') = p_banco;
  */
-- no es acuerdo y es superios a 2017-04-25
        update recaudo_local_liquidacion l
           set (l.p_valor_7,
                l.p_valor_8,
                l.p_valor_9,
                l.p_valor_10,
                l.p_valor_11,
                l.p_valor_12,
                l.p_valor_13,
                l.p_valor_14,
                l.p_valor_15,
                l.p_valor_16,
                l.p_valor_17,
                l.p_valor_18) =
               (select l.valor_total * (p_simit_pm / 55),
                       l.valor_total * (p_concesionario_pm / 55),
                       l.valor_total * (p_fondo_cob_concesionario_pm / 55),
                       l.valor_total * (p_fondo_cob_simit_pm / 55),
                       l.valor_total * (p_equilibrio_economico_pm / 55),
                       l.valor_total * (p_simit_pp / 55),
                       l.valor_total * (p_sevial_pp / 55),
                       l.valor_total * (p_equilibrio_economico_pp / 55),
                       l.valor_total * (p_polca_cp / 55),
                       l.valor_total * (p_fcm_cp / 55),
                       l.valor_total * (p_sevial_cp / 55),
                       l.valor_total * (p_equilibrio_economico_cp / 55)
                  from dual)
         where l.fec_corte >= p_fec_ini
           and l.fec_corte <= p_fec_fin
           and l.ind_proceso = 1
           and l.indtipo = 'POLCA'
           and l.idconcesionario = conces.idConcesionario
           and l.fec_vig_ini >= to_date('2017-04-25','yyyy-mm-dd')
           and l.indorigen <> 'ACU'
           and decode(idbanco, '52', '52', '99') = p_banco;

        -- ajusta municipios que solo consignan el 10%
        update recaudo_local_liquidacion l
           set (l.p_valor_7,
                l.p_valor_8,
                l.p_valor_9,
                l.p_valor_10,
                l.p_valor_11,
                l.p_valor_12,
                l.p_valor_13,
                l.p_valor_14,
                l.p_valor_15,
                l.p_valor_16,
                l.p_valor_17,
                l.p_valor_18) =
               (select l.valor_total * (p_simit_pm / 10),
                       l.valor_total * (p_concesionario_pm / 10),
                       l.valor_total * (p_fondo_cob_concesionario_pm / 10),
                       l.valor_total * (p_fondo_cob_simit_pm / 10),
                       l.valor_total * (p_equilibrio_economico_pm / 10),
                       l.valor_total * (p_simit_pp / 10),
                       l.valor_total * (p_sevial_pp / 10),
                       l.valor_total * (p_equilibrio_economico_pp / 10),
                       0.0, --l.valor_total * (p_polca_cp / 55),
                       0.0, -- l.valor_total *(p_fcm_cp / 55),
                       0.0, -- l.valor_total *(p_sevial_cp / 55),
                       0.0 --l.valor_total * (p_equilibrio_economico_cp/ 55)
                  from dual)
         where fec_corte >= p_fec_ini
           and fec_corte <= p_fec_fin
           and ind_proceso = 1
           and p_consignado = 10
           and l.indtipo = 'POLCA'
           and l.idconcesionario = conces.idConcesionario
           and l.fec_vig_ini >= to_date('2017-04-25','yyyy-mm-dd')
           and l.indorigen <> 'ACU'
           and decode(idbanco, '52', '52', '99') = p_banco;

        -- ajusta municipios que solo consignan el 45%
        update recaudo_local_liquidacion l
           set (l.p_valor_7,
                l.p_valor_8,
                l.p_valor_9,
                l.p_valor_10,
                l.p_valor_11,
                l.p_valor_12,
                l.p_valor_13,
                l.p_valor_14,
                l.p_valor_15,
                l.p_valor_16,
                l.p_valor_17,
                l.p_valor_18) =
               (select 0.0, -- l.valor_total * (p_simit_pm / 10),
                       0.0, -- l.valor_total *(p_concesionario_pm / 10),
                       0.0, -- l.valor_total*(p_fondo_cob_concesionario_pm / 10),
                       0.0, -- l.valor_total *(p_fondo_cob_simit_pm /10),
                       0.0, -- l.valor_total *(p_equilibrio_economico_pm/ 10),
                       0.0, -- l.valor_total * (p_simit_pp / 10),
                       0.0, -- l.valor_total *(p_sevial_pp / 10),
                       0.0, -- l.valor_total *(p_equilibrio_economico_pp / 10),
                       l.valor_total * (p_polca_cp / 45),
                       l.valor_total * (p_fcm_cp / 45),
                       l.valor_total * (p_sevial_cp / 45),
                       l.valor_total * (p_equilibrio_economico_cp / 45)
                  from dual)
         where fec_corte >= p_fec_ini
           and fec_corte <= p_fec_fin
           and ind_proceso = 1
           and p_consignado = 45
           and l.indtipo = 'POLCA'
           and l.idconcesionario = conces.idConcesionario
           and l.fec_vig_ini >= to_date('2017-04-25','yyyy-mm-dd')
           and l.indorigen <> 'ACU'
           and decode(idbanco, '52', '52', '99') = p_banco;

-- perido de transiccion
        p_simit_pp                   := 2;
        p_sevial_pp                  := 3;

        update recaudo_local_liquidacion l
           set (l.p_valor_7,
                l.p_valor_8,
                l.p_valor_9,
                l.p_valor_10,
                l.p_valor_11,
                l.p_valor_12,
                l.p_valor_13,
                l.p_valor_14,
                l.p_valor_15,
                l.p_valor_16,
                l.p_valor_17,
                l.p_valor_18) =
               (select l.valor_total * (p_simit_pm / 55),
                       l.valor_total * (p_concesionario_pm / 55),
                       l.valor_total * (p_fondo_cob_concesionario_pm / 55),
                       l.valor_total * (p_fondo_cob_simit_pm / 55),
                       l.valor_total * (p_equilibrio_economico_pm / 55),
                       l.valor_total * (p_simit_pp / 55),
                       l.valor_total * (p_sevial_pp / 55),
                       l.valor_total * (p_equilibrio_economico_pp / 55),
                       l.valor_total * (p_polca_cp / 55),
                       l.valor_total * (p_fcm_cp / 55),
                       l.valor_total * (p_sevial_cp / 55),
                       l.valor_total * (p_equilibrio_economico_cp / 55)
                  from dual)
         where l.fec_corte >= p_fec_ini
           and l.fec_corte <= p_fec_fin
           and l.ind_proceso = 1
           and l.indtipo = 'POLCA'
           and l.idconcesionario = conces.idConcesionario
 and (
     ( l.fec_vig_ini >= to_date('2017-04-17','yyyy-mm-dd') and l.fec_vig_fin <= to_date('2017-04-24','yyyy-mm-dd') ) or
     ( l.fec_vig_ini >= to_date('2015-01-17','yyyy-mm-dd') and l.fec_vig_fin <= to_date('2017-04-16','yyyy-mm-dd') ) or
     ( l.fec_vig_fin <= to_date('2015-01-16','yyyy-mm-dd') )
	 )
           and l.indorigen <> 'ACU'
           and decode(idbanco, '52', '52', '99') = p_banco;

        -- ajusta municipios que solo consignan el 10%
        update recaudo_local_liquidacion l
           set (l.p_valor_7,
                l.p_valor_8,
                l.p_valor_9,
                l.p_valor_10,
                l.p_valor_11,
                l.p_valor_12,
                l.p_valor_13,
                l.p_valor_14,
                l.p_valor_15,
                l.p_valor_16,
                l.p_valor_17,
                l.p_valor_18) =
               (select l.valor_total * (p_simit_pm / 10),
                       l.valor_total * (p_concesionario_pm / 10),
                       l.valor_total * (p_fondo_cob_concesionario_pm / 10),
                       l.valor_total * (p_fondo_cob_simit_pm / 10),
                       l.valor_total * (p_equilibrio_economico_pm / 10),
                       l.valor_total * (p_simit_pp / 10),
                       l.valor_total * (p_sevial_pp / 10),
                       l.valor_total * (p_equilibrio_economico_pp / 10),
                       0.0, --l.valor_total * (p_polca_cp / 55),
                       0.0, -- l.valor_total *(p_fcm_cp / 55),
                       0.0, -- l.valor_total *(p_sevial_cp / 55),
                       0.0 --l.valor_total * (p_equilibrio_economico_cp/ 55)
                  from dual)
         where fec_corte >= p_fec_ini
           and fec_corte <= p_fec_fin
           and ind_proceso = 1
           and p_consignado = 10
           and l.indtipo = 'POLCA'
           and l.idconcesionario = conces.idConcesionario
 and (
     ( l.fec_vig_ini >= to_date('2017-04-17','yyyy-mm-dd') and l.fec_vig_fin <= to_date('2017-04-24','yyyy-mm-dd') ) or
     ( l.fec_vig_ini >= to_date('2015-01-17','yyyy-mm-dd') and l.fec_vig_fin <= to_date('2017-04-16','yyyy-mm-dd') ) or
     ( l.fec_vig_fin <= to_date('2015-01-16','yyyy-mm-dd') )
	 )
           and l.indorigen <> 'ACU'
           and decode(idbanco, '52', '52', '99') = p_banco;

        -- ajusta municipios que solo consignan el 45%
        update recaudo_local_liquidacion l
           set (l.p_valor_7,
                l.p_valor_8,
                l.p_valor_9,
                l.p_valor_10,
                l.p_valor_11,
                l.p_valor_12,
                l.p_valor_13,
                l.p_valor_14,
                l.p_valor_15,
                l.p_valor_16,
                l.p_valor_17,
                l.p_valor_18) =
               (select 0.0, -- l.valor_total * (p_simit_pm / 10),
                       0.0, -- l.valor_total *(p_concesionario_pm / 10),
                       0.0, -- l.valor_total*(p_fondo_cob_concesionario_pm / 10),
                       0.0, -- l.valor_total *(p_fondo_cob_simit_pm /10),
                       0.0, -- l.valor_total *(p_equilibrio_economico_pm/ 10),
                       0.0, -- l.valor_total * (p_simit_pp / 10),
                       0.0, -- l.valor_total *(p_sevial_pp / 10),
                       0.0, -- l.valor_total *(p_equilibrio_economico_pp / 10),
                       l.valor_total * (p_polca_cp / 45),
                       l.valor_total * (p_fcm_cp / 45),
                       l.valor_total * (p_sevial_cp / 45),
                       l.valor_total * (p_equilibrio_economico_cp / 45)
                  from dual)
         where fec_corte >= p_fec_ini
           and fec_corte <= p_fec_fin
           and ind_proceso = 1
           and p_consignado = 45
           and l.indtipo = 'POLCA'
           and l.idconcesionario = conces.idConcesionario
 and (
     ( l.fec_vig_ini >= to_date('2017-04-17','yyyy-mm-dd') and l.fec_vig_fin <= to_date('2017-04-24','yyyy-mm-dd') ) or
     ( l.fec_vig_ini >= to_date('2015-01-17','yyyy-mm-dd') and l.fec_vig_fin <= to_date('2017-04-16','yyyy-mm-dd') ) or
     ( l.fec_vig_fin <= to_date('2015-01-16','yyyy-mm-dd') )
	 )
           and l.indorigen <> 'ACU'
           and decode(idbanco, '52', '52', '99') = p_banco;

-- exclusivo para abril
        update recaudo_local_liquidacion l
           set (l.p_valor_7,
                l.p_valor_8,
                l.p_valor_9,
                l.p_valor_10,
                l.p_valor_11,
                l.p_valor_12,
                l.p_valor_13,
                l.p_valor_14,
                l.p_valor_15,
                l.p_valor_16,
                l.p_valor_17,
                l.p_valor_18) =
               (select l.valor_total * (p_simit_pm / 55),
                       l.valor_total * (p_concesionario_pm / 55),
                       l.valor_total * (p_fondo_cob_concesionario_pm / 55),
                       l.valor_total * (p_fondo_cob_simit_pm / 55),
                       l.valor_total * (p_equilibrio_economico_pm / 55),
                       l.valor_total * (p_simit_pp / 55),
                       l.valor_total * (p_sevial_pp / 55),
                       l.valor_total * (p_equilibrio_economico_pp / 55),
                       l.valor_total * (p_polca_cp / 55),
                       l.valor_total * (p_fcm_cp / 55),
                       l.valor_total * (p_sevial_cp / 55),
                       l.valor_total * (p_equilibrio_economico_cp / 55)
                  from dual)
         where l.fec_corte >= p_fec_ini
           and l.fec_corte <= p_fec_fin
           and l.ind_proceso = 1
           and l.indtipo = 'POLCA'
           and l.idconcesionario = conces.idConcesionario
           and l.fec_vig_ini = to_date('2017-04-01','yyyy-mm-dd')
           and l.fec_vig_fin = to_date('2017-04-30','yyyy-mm-dd')
           and l.indorigen <> 'ACU'
           and decode(idbanco, '52', '52', '99') = p_banco;

        -- ajusta municipios que solo consignan el 10%
        update recaudo_local_liquidacion l
           set (l.p_valor_7,
                l.p_valor_8,
                l.p_valor_9,
                l.p_valor_10,
                l.p_valor_11,
                l.p_valor_12,
                l.p_valor_13,
                l.p_valor_14,
                l.p_valor_15,
                l.p_valor_16,
                l.p_valor_17,
                l.p_valor_18) =
               (select l.valor_total * (p_simit_pm / 10),
                       l.valor_total * (p_concesionario_pm / 10),
                       l.valor_total * (p_fondo_cob_concesionario_pm / 10),
                       l.valor_total * (p_fondo_cob_simit_pm / 10),
                       l.valor_total * (p_equilibrio_economico_pm / 10),
                       l.valor_total * (p_simit_pp / 10),
                       l.valor_total * (p_sevial_pp / 10),
                       l.valor_total * (p_equilibrio_economico_pp / 10),
                       0.0, --l.valor_total * (p_polca_cp / 55),
                       0.0, -- l.valor_total *(p_fcm_cp / 55),
                       0.0, -- l.valor_total *(p_sevial_cp / 55),
                       0.0 --l.valor_total * (p_equilibrio_economico_cp/ 55)
                  from dual)
         where fec_corte >= p_fec_ini
           and fec_corte <= p_fec_fin
           and ind_proceso = 1
           and p_consignado = 10
           and l.indtipo = 'POLCA'
           and l.idconcesionario = conces.idConcesionario
           and l.fec_vig_ini = to_date('2017-04-01','yyyy-mm-dd')
           and l.fec_vig_fin = to_date('2017-04-30','yyyy-mm-dd')
           and l.indorigen <> 'ACU'
           and decode(idbanco, '52', '52', '99') = p_banco;


        -- ajusta municipios que solo consignan el 45%
        update recaudo_local_liquidacion l
           set (l.p_valor_7,
                l.p_valor_8,
                l.p_valor_9,
                l.p_valor_10,
                l.p_valor_11,
                l.p_valor_12,
                l.p_valor_13,
                l.p_valor_14,
                l.p_valor_15,
                l.p_valor_16,
                l.p_valor_17,
                l.p_valor_18) =
               (select 0.0, -- l.valor_total * (p_simit_pm / 10),
                       0.0, -- l.valor_total *(p_concesionario_pm / 10),
                       0.0, -- l.valor_total*(p_fondo_cob_concesionario_pm / 10),
                       0.0, -- l.valor_total *(p_fondo_cob_simit_pm /10),
                       0.0, -- l.valor_total *(p_equilibrio_economico_pm/ 10),
                       0.0, -- l.valor_total * (p_simit_pp / 10),
                       0.0, -- l.valor_total *(p_sevial_pp / 10),
                       0.0, -- l.valor_total *(p_equilibrio_economico_pp / 10),
                       l.valor_total * (p_polca_cp / 45),
                       l.valor_total * (p_fcm_cp / 45),
                       l.valor_total * (p_sevial_cp / 45),
                       l.valor_total * (p_equilibrio_economico_cp / 45)
                  from dual)
         where fec_corte >= p_fec_ini
           and fec_corte <= p_fec_fin
           and ind_proceso = 1
           and p_consignado = 45
           and l.indtipo = 'POLCA'
           and l.idconcesionario = conces.idConcesionario
           and l.fec_vig_ini = to_date('2017-04-01','yyyy-mm-dd')
           and l.fec_vig_fin = to_date('2017-04-30','yyyy-mm-dd')
           and l.indorigen <> 'ACU'
           and decode(idbanco, '52', '52', '99') = p_banco;

-- acuerdos de pago <> 20001000 valledupar
        p_simit_pm                   := 1.5;
        p_concesionario_pm           := 3.5;
        p_fondo_cob_concesionario_pm := 0;
        p_fondo_cob_simit_pm         := 0;
        p_equilibrio_economico_pm    := 0;
        p_simit_pp                   := 2;
        p_sevial_pp                  := 3;
        p_equilibrio_economico_pp    := 0;
        p_polca_cp                   := 39.78;
        p_fcm_cp                     := 2.52;
        p_sevial_cp                  := 2.7;
        p_equilibrio_economico_cp    := 0;

 /*  if ( to_char(p_fec_ini,'yyyymmdd') >= '20170501' ) then
        p_simit_pm                   := 1.5;
        p_concesionario_pm           := 3.5;
        p_fondo_cob_concesionario_pm := 0;
        p_fondo_cob_simit_pm         := 0;
        p_equilibrio_economico_pm    := 0;
        p_simit_pp                   := 2.04;
        p_sevial_pp                  := 2.96;
        p_equilibrio_economico_pp    := 0;
        p_polca_cp                   := 39.78;
        p_fcm_cp                     := 2.52;
        p_sevial_cp                  := 2.7;
        p_equilibrio_economico_cp    := 0;
  end if;*/

        update recaudo_local_liquidacion l
           set (l.p_valor_7,
                l.p_valor_8,
                l.p_valor_9,
                l.p_valor_10,
                l.p_valor_11,
                l.p_valor_12,
                l.p_valor_13,
                l.p_valor_14,
                l.p_valor_15,
                l.p_valor_16,
                l.p_valor_17,
                l.p_valor_18) =
               (select l.valor_total * (p_simit_pm / 55),
                       l.valor_total * (p_concesionario_pm / 55),
                       l.valor_total * (p_fondo_cob_concesionario_pm / 55),
                       l.valor_total * (p_fondo_cob_simit_pm / 55),
                       l.valor_total * (p_equilibrio_economico_pm / 55),
                       l.valor_total * (p_simit_pp / 55),
                       l.valor_total * (p_sevial_pp / 55),
                       l.valor_total * (p_equilibrio_economico_pp / 55),
                       l.valor_total * (p_polca_cp / 55),
                       l.valor_total * (p_fcm_cp / 55),
                       l.valor_total * (p_sevial_cp / 55),
                       l.valor_total * (p_equilibrio_economico_cp / 55)
                  from dual)
         where l.fec_corte >= p_fec_ini
           and l.fec_corte <= p_fec_fin
           and l.ind_proceso = 1
           and l.indtipo = 'POLCA'
           and l.idconcesionario = conces.idConcesionario
--           and nvl(l.fec_vig_fin,to_date('2016-09-12','yyyy-mm-dd')) < to_date('2016-09-11','yyyy-mm-dd')
           and l.indorigen = 'ACU'
           and l.idmunicipio <> '20001000'
           and decode(idbanco, '52', '52', '99') = p_banco;

        -- ajusta municipios que solo consignan el 10%
        update recaudo_local_liquidacion l
           set (l.p_valor_7,
                l.p_valor_8,
                l.p_valor_9,
                l.p_valor_10,
                l.p_valor_11,
                l.p_valor_12,
                l.p_valor_13,
                l.p_valor_14,
                l.p_valor_15,
                l.p_valor_16,
                l.p_valor_17,
                l.p_valor_18) =
               (select l.valor_total * (p_simit_pm / 10),
                       l.valor_total * (p_concesionario_pm / 10),
                       l.valor_total * (p_fondo_cob_concesionario_pm / 10),
                       l.valor_total * (p_fondo_cob_simit_pm / 10),
                       l.valor_total * (p_equilibrio_economico_pm / 10),
                       l.valor_total * (p_simit_pp / 10),
                       l.valor_total * (p_sevial_pp / 10),
                       l.valor_total * (p_equilibrio_economico_pp / 10),
                       0.0, --l.valor_total * (p_polca_cp / 55),
                       0.0, -- l.valor_total *(p_fcm_cp / 55),
                       0.0, -- l.valor_total *(p_sevial_cp / 55),
                       0.0 --l.valor_total * (p_equilibrio_economico_cp/ 55)
                  from dual)
         where fec_corte >= p_fec_ini
           and fec_corte <= p_fec_fin
           and ind_proceso = 1
           and p_consignado = 10
           and l.indtipo = 'POLCA'
           and l.idconcesionario = conces.idConcesionario
      --     and nvl(l.fec_vig_fin,to_date('2016-09-12','yyyy-mm-dd')) < to_date('2016-09-11','yyyy-mm-dd')
           and l.indorigen = 'ACU'
           and l.idmunicipio <> '20001000'
           and decode(idbanco, '52', '52', '99') = p_banco;

        -- ajusta municipios que solo consignan el 45%
        update recaudo_local_liquidacion l
           set (l.p_valor_7,
                l.p_valor_8,
                l.p_valor_9,
                l.p_valor_10,
                l.p_valor_11,
                l.p_valor_12,
                l.p_valor_13,
                l.p_valor_14,
                l.p_valor_15,
                l.p_valor_16,
                l.p_valor_17,
                l.p_valor_18) =
               (select 0.0, -- l.valor_total * (p_simit_pm / 10),
                       0.0, -- l.valor_total *(p_concesionario_pm / 10),
                       0.0, -- l.valor_total*(p_fondo_cob_concesionario_pm / 10),
                       0.0, -- l.valor_total *(p_fondo_cob_simit_pm /10),
                       0.0, -- l.valor_total *(p_equilibrio_economico_pm/ 10),
                       0.0, -- l.valor_total * (p_simit_pp / 10),
                       0.0, -- l.valor_total *(p_sevial_pp / 10),
                       0.0, -- l.valor_total *(p_equilibrio_economico_pp / 10),
                       l.valor_total * (p_polca_cp / 45),
                       l.valor_total * (p_fcm_cp / 45),
                       l.valor_total * (p_sevial_cp / 45),
                       l.valor_total * (p_equilibrio_economico_cp / 45)
                  from dual)
         where fec_corte >= p_fec_ini
           and fec_corte <= p_fec_fin
           and ind_proceso = 1
           and p_consignado = 45
           and l.indtipo = 'POLCA'
           and l.idconcesionario = conces.idConcesionario
       --    and nvl(l.fec_vig_fin,to_date('2016-09-12','yyyy-mm-dd')) < to_date('2016-09-11','yyyy-mm-dd')
           and l.indorigen = 'ACU'
           and l.idmunicipio <> '20001000'
           and decode(idbanco, '52', '52', '99') = p_banco;

-- acuerdos de pago de 20001000 valledupar
        p_simit_pm                   := 1.5;
        p_concesionario_pm           := 3.5;
        p_fondo_cob_concesionario_pm := 0;
        p_fondo_cob_simit_pm         := 0;
        p_equilibrio_economico_pm    := 0;
        p_simit_pp                   := 2;
        p_sevial_pp                  := 3;
        p_equilibrio_economico_pp    := 0;
        p_polca_cp                   := 40.5;
        p_fcm_cp                     := 1.8;
        p_sevial_cp                  := 2.7;
        p_equilibrio_economico_cp    := 0;


        update recaudo_local_liquidacion l
           set (l.p_valor_7,
                l.p_valor_8,
                l.p_valor_9,
                l.p_valor_10,
                l.p_valor_11,
                l.p_valor_12,
                l.p_valor_13,
                l.p_valor_14,
                l.p_valor_15,
                l.p_valor_16,
                l.p_valor_17,
                l.p_valor_18) =
               (select l.valor_total * (p_simit_pm / 55),
                       l.valor_total * (p_concesionario_pm / 55),
                       l.valor_total * (p_fondo_cob_concesionario_pm / 55),
                       l.valor_total * (p_fondo_cob_simit_pm / 55),
                       l.valor_total * (p_equilibrio_economico_pm / 55),
                       l.valor_total * (p_simit_pp / 55),
                       l.valor_total * (p_sevial_pp / 55),
                       l.valor_total * (p_equilibrio_economico_pp / 55),
                       l.valor_total * (p_polca_cp / 55),
                       l.valor_total * (p_fcm_cp / 55),
                       l.valor_total * (p_sevial_cp / 55),
                       l.valor_total * (p_equilibrio_economico_cp / 55)
                  from dual)
         where l.fec_corte >= p_fec_ini
           and l.fec_corte <= p_fec_fin
           and l.ind_proceso = 1
           and l.indtipo = 'POLCA'
           and l.idconcesionario = conces.idConcesionario
--           and nvl(l.fec_vig_fin,to_date('2016-09-12','yyyy-mm-dd')) < to_date('2016-09-11','yyyy-mm-dd')
           and l.indorigen = 'ACU'
           and l.idmunicipio = '20001000'
           and decode(idbanco, '52', '52', '99') = p_banco;

        -- ajusta municipios que solo consignan el 10%
        update recaudo_local_liquidacion l
           set (l.p_valor_7,
                l.p_valor_8,
                l.p_valor_9,
                l.p_valor_10,
                l.p_valor_11,
                l.p_valor_12,
                l.p_valor_13,
                l.p_valor_14,
                l.p_valor_15,
                l.p_valor_16,
                l.p_valor_17,
                l.p_valor_18) =
               (select l.valor_total * (p_simit_pm / 10),
                       l.valor_total * (p_concesionario_pm / 10),
                       l.valor_total * (p_fondo_cob_concesionario_pm / 10),
                       l.valor_total * (p_fondo_cob_simit_pm / 10),
                       l.valor_total * (p_equilibrio_economico_pm / 10),
                       l.valor_total * (p_simit_pp / 10),
                       l.valor_total * (p_sevial_pp / 10),
                       l.valor_total * (p_equilibrio_economico_pp / 10),
                       0.0, --l.valor_total * (p_polca_cp / 55),
                       0.0, -- l.valor_total *(p_fcm_cp / 55),
                       0.0, -- l.valor_total *(p_sevial_cp / 55),
                       0.0 --l.valor_total * (p_equilibrio_economico_cp/ 55)
                  from dual)
         where fec_corte >= p_fec_ini
           and fec_corte <= p_fec_fin
           and ind_proceso = 1
           and p_consignado = 10
           and l.indtipo = 'POLCA'
           and l.idconcesionario = conces.idConcesionario
      --     and nvl(l.fec_vig_fin,to_date('2016-09-12','yyyy-mm-dd')) < to_date('2016-09-11','yyyy-mm-dd')
           and l.indorigen = 'ACU'
           and l.idmunicipio = '20001000'
           and decode(idbanco, '52', '52', '99') = p_banco;

        -- ajusta municipios que solo consignan el 45%
        update recaudo_local_liquidacion l
           set (l.p_valor_7,
                l.p_valor_8,
                l.p_valor_9,
                l.p_valor_10,
                l.p_valor_11,
                l.p_valor_12,
                l.p_valor_13,
                l.p_valor_14,
                l.p_valor_15,
                l.p_valor_16,
                l.p_valor_17,
                l.p_valor_18) =
               (select 0.0, -- l.valor_total * (p_simit_pm / 10),
                       0.0, -- l.valor_total *(p_concesionario_pm / 10),
                       0.0, -- l.valor_total*(p_fondo_cob_concesionario_pm / 10),
                       0.0, -- l.valor_total *(p_fondo_cob_simit_pm /10),
                       0.0, -- l.valor_total *(p_equilibrio_economico_pm/ 10),
                       0.0, -- l.valor_total * (p_simit_pp / 10),
                       0.0, -- l.valor_total *(p_sevial_pp / 10),
                       0.0, -- l.valor_total *(p_equilibrio_economico_pp / 10),
                       l.valor_total * (p_polca_cp / 45),
                       l.valor_total * (p_fcm_cp / 45),
                       l.valor_total * (p_sevial_cp / 45),
                       l.valor_total * (p_equilibrio_economico_cp / 45)
                  from dual)
         where fec_corte >= p_fec_ini
           and fec_corte <= p_fec_fin
           and ind_proceso = 1
           and p_consignado = 45
           and l.indtipo = 'POLCA'
           and l.idconcesionario = conces.idConcesionario
       --    and nvl(l.fec_vig_fin,to_date('2016-09-12','yyyy-mm-dd')) < to_date('2016-09-11','yyyy-mm-dd')
           and l.indorigen = 'ACU'
           and l.idmunicipio = '20001000'
           and decode(idbanco, '52', '52', '99') = p_banco;

 -- no es acuerdo Y ES ANTES DE 2016/09/11
 /*
         update recaudo_local_liquidacion l
           set (l.p_valor_7,
                l.p_valor_8,
                l.p_valor_9,
                l.p_valor_10,
                l.p_valor_11,
                l.p_valor_12,
                l.p_valor_13,
                l.p_valor_14,
                l.p_valor_15,
                l.p_valor_16,
                l.p_valor_17,
                l.p_valor_18) =
               (select l.valor_total * (p_simit_pm / 55),
                       l.valor_total * (p_concesionario_pm / 55),
                       l.valor_total * (p_fondo_cob_concesionario_pm / 55),
                       l.valor_total * (p_fondo_cob_simit_pm / 55),
                       l.valor_total * (p_equilibrio_economico_pm / 55),
                       l.valor_total * (p_simit_pp / 55),
                       l.valor_total * (p_sevial_pp / 55),
                       l.valor_total * (p_equilibrio_economico_pp / 55),
                       l.valor_total * (p_polca_cp / 55),
                       l.valor_total * (p_fcm_cp / 55),
                       l.valor_total * (p_sevial_cp / 55),
                       l.valor_total * (p_equilibrio_economico_cp / 55)
                  from dual)
         where l.fec_corte >= p_fec_ini
           and l.fec_corte <= p_fec_fin
           and l.ind_proceso = 1
           and l.indtipo = 'POLCA'
           and l.idconcesionario = conces.idConcesionario
           and l.fec_tran < to_date('2016-09-11','yyyy-mm-dd')
           and l.indorigen <> 'ACU'
           and decode(idbanco, '52', '52', '99') = p_banco;

        -- ajusta municipios que solo consignan el 10%
        update recaudo_local_liquidacion l
           set (l.p_valor_7,
                l.p_valor_8,
                l.p_valor_9,
                l.p_valor_10,
                l.p_valor_11,
                l.p_valor_12,
                l.p_valor_13,
                l.p_valor_14,
                l.p_valor_15,
                l.p_valor_16,
                l.p_valor_17,
                l.p_valor_18) =
               (select l.valor_total * (p_simit_pm / 10),
                       l.valor_total * (p_concesionario_pm / 10),
                       l.valor_total * (p_fondo_cob_concesionario_pm / 10),
                       l.valor_total * (p_fondo_cob_simit_pm / 10),
                       l.valor_total * (p_equilibrio_economico_pm / 10),
                       l.valor_total * (p_simit_pp / 10),
                       l.valor_total * (p_sevial_pp / 10),
                       l.valor_total * (p_equilibrio_economico_pp / 10),
                       0.0, --l.valor_total * (p_polca_cp / 55),
                       0.0, -- l.valor_total *(p_fcm_cp / 55),
                       0.0, -- l.valor_total *(p_sevial_cp / 55),
                       0.0 --l.valor_total * (p_equilibrio_economico_cp/ 55)
                  from dual)
         where fec_corte >= p_fec_ini
           and fec_corte <= p_fec_fin
           and ind_proceso = 1
           and p_consignado = 10
           and l.indtipo = 'POLCA'
           and l.idconcesionario = conces.idConcesionario
           and l.fec_tran < to_date('2016-09-11','yyyy-mm-dd')
           and l.indorigen <> 'ACU'
           and decode(idbanco, '52', '52', '99') = p_banco;

        -- ajusta municipios que solo consignan el 45%
        update recaudo_local_liquidacion l
           set (l.p_valor_7,
                l.p_valor_8,
                l.p_valor_9,
                l.p_valor_10,
                l.p_valor_11,
                l.p_valor_12,
                l.p_valor_13,
                l.p_valor_14,
                l.p_valor_15,
                l.p_valor_16,
                l.p_valor_17,
                l.p_valor_18) =
               (select 0.0, -- l.valor_total * (p_simit_pm / 10),
                       0.0, -- l.valor_total *(p_concesionario_pm / 10),
                       0.0, -- l.valor_total*(p_fondo_cob_concesionario_pm / 10),
                       0.0, -- l.valor_total *(p_fondo_cob_simit_pm /10),
                       0.0, -- l.valor_total *(p_equilibrio_economico_pm/ 10),
                       0.0, -- l.valor_total * (p_simit_pp / 10),
                       0.0, -- l.valor_total *(p_sevial_pp / 10),
                       0.0, -- l.valor_total *(p_equilibrio_economico_pp / 10),
                       l.valor_total * (p_polca_cp / 45),
                       l.valor_total * (p_fcm_cp / 45),
                       l.valor_total * (p_sevial_cp / 45),
                       l.valor_total * (p_equilibrio_economico_cp / 45)
                  from dual)
         where fec_corte >= p_fec_ini
           and fec_corte <= p_fec_fin
           and ind_proceso = 1
           and p_consignado = 45
           and l.indtipo = 'POLCA'
           and l.idconcesionario = conces.idConcesionario
           and l.fec_tran < to_date('2016-09-11','yyyy-mm-dd')
           and l.indorigen <> 'ACU'
           and decode(idbanco, '52', '52', '99') = p_banco;

           */
    end loop; -- fin ciclo1

    commit;

    -- POLCA

    -- redondear a dos decimales todos los calculos
    update recaudo_local_liquidacion l
       set l.p_valor_7  = ROUND(l.p_valor_7, 2),
           l.p_valor_8  = ROUND(l.p_valor_8, 2),
           l.p_valor_9  = ROUND(l.p_valor_9, 2),
           l.p_valor_10 = ROUND(l.p_valor_10, 2),
           l.p_valor_11 = ROUND(l.p_valor_11, 2),
           l.p_valor_12 = ROUND(l.p_valor_12, 2),
           l.p_valor_13 = ROUND(l.p_valor_13, 2),
           l.p_valor_14 = ROUND(l.p_valor_14, 2),
           l.p_valor_15 = ROUND(l.p_valor_15, 2),
           l.p_valor_16 = ROUND(l.p_valor_16, 2),
           l.p_valor_17 = ROUND(l.p_valor_17, 2),
           l.p_valor_18 = ROUND(l.p_valor_18, 2)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA'
       and decode(idbanco, '52', '52', '99') = p_banco;

/*    update recaudo_local_liquidacion l
       set (l.p_valor_19,
            l.p_valor_20,
            l.p_valor_21,
            l.p_valor_22,
            l.p_valor_23) =
           (select l.p_valor_16 * (fcm.iva_fcm / 100),
                   l.p_valor_17 * (fcm.iva / 100),
                   l.p_valor_17 * (fcm.retencion_fuente / 100),
                   l.p_valor_17 * (fcm.impuesto_timbre_tercero / 100),
                   (l.p_valor_16 + l.p_valor_17 + l.p_valor_18) *
                   (fcm.impuesto_timbre_fcm / 100)
              from fcm)
     where l.fec_corte >= p_fec_ini
       and l.fec_corte <= p_fec_fin
       and l.ind_proceso = 1
       and l.indtipo = 'POLCA'
       and nvl(l.fec_vig_fin,to_date('2016-09-12','yyyy-mm-dd')) < to_date('2016-09-11','yyyy-mm-dd')
       and decode(idbanco, '52', '52', '99') = p_banco;*/

    update recaudo_local_liquidacion l
       set (l.p_valor_19,
            l.p_valor_20,
            l.p_valor_21,
            l.p_valor_22,
            l.p_valor_23) =
           (select (l.p_valor_16 * 100 / (100 + fcm.iva_fcm )) * (fcm.iva_fcm / 100),
                   (l.p_valor_17 * 100 / (100 + fcm.iva) ) * (fcm.iva / 100),
                   (l.p_valor_17 * 100 / (100 + fcm.iva) ) * (fcm.retencion_fuente / 100),
                   (l.p_valor_17 * 100 / (100 + fcm.iva) ) * (fcm.impuesto_timbre_tercero / 100),
                   ((l.p_valor_16 * 100 / (100 + fcm.iva_fcm )) + (l.p_valor_17 * 100 / (100 + fcm.iva) ) + l.p_valor_18) *
                   (fcm.impuesto_timbre_fcm / 100)
              from fcm)
     where l.fec_corte >= p_fec_ini
       and l.fec_corte <= p_fec_fin
       and l.ind_proceso = 1
       and l.indtipo = 'POLCA'
       --and nvl(l.fec_vig_fin,to_date('2016-09-12','yyyy-mm-dd')) >= to_date('2016-09-11','yyyy-mm-dd')
       and decode(idbanco, '52', '52', '99') = p_banco;

    -- caluclar netos el iva lo asume polca para vigencias menosres a sep 2016
/*    update recaudo_local_liquidacion l
       set l.p_valor_24 = l.p_valor_17 + l.p_valor_20 -
                          l.p_valor_21 - l.p_valor_22,
           l.p_valor_25 = l.p_valor_8 - l.s_valor_0,
           l.p_valor_26 = l.p_valor_16 + l.p_valor_19 + l.p_valor_21 +
                          l.p_valor_22,
           l.p_valor_27 = l.p_valor_7 + l.p_valor_12,
           l.p_valor_28 = l.p_valor_11 + l.p_valor_14 + l.p_valor_18,
           l.p_valor_15 = l.p_valor_15 - l.p_valor_19 - l.p_valor_20
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA'
       and nvl(l.fec_vig_fin,to_date('2016-09-12','yyyy-mm-dd')) < to_date('2016-09-11','yyyy-mm-dd')
       and decode(idbanco, '52', '52', '99') = p_banco;*/

    -- caluclar netos el iva lo asume fcm y sevial para vigencias mayores a sep 2016

    update recaudo_local_liquidacion l
       set l.p_valor_24 = l.p_valor_17 -
                          l.p_valor_21 - l.p_valor_22,
           l.p_valor_25 = l.p_valor_8 - l.s_valor_0,
           l.p_valor_26 = l.p_valor_16 + l.p_valor_21 +
                          l.p_valor_22,
           l.p_valor_27 = l.p_valor_7 + l.p_valor_12,
           l.p_valor_28 = l.p_valor_11 + l.p_valor_14 + l.p_valor_18,
           l.p_valor_15 = l.p_valor_15
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA'
       --and nvl(l.fec_vig_fin,to_date('2016-09-12','yyyy-mm-dd')) >= to_date('2016-09-11','yyyy-mm-dd')
       and decode(idbanco, '52', '52', '99') = p_banco;

    -- calcular basess del 2,7 y 1.8

    update recaudo_local_liquidacion l
       set l.p_valor_17 = l.p_valor_17 - l.p_valor_20,
           l.p_valor_16 = l.p_valor_16 - l.p_valor_19
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA'
       and decode(idbanco, '52', '52', '99') = p_banco;

    update recaudo_local_liquidacion l
       set l.p_valor_19 = ROUND(l.p_valor_19, 2),
           l.p_valor_20 = ROUND(l.p_valor_20, 2),
           l.p_valor_21 = ROUND(l.p_valor_21, 2),
           l.p_valor_22 = ROUND(l.p_valor_22, 2),
           l.p_valor_23 = ROUND(l.p_valor_23, 2),
           l.p_valor_24 = ROUND(l.p_valor_24, 2),
           l.p_valor_25 = ROUND(l.p_valor_25, 2),
           l.p_valor_26 = ROUND(l.p_valor_26, 2),
           l.p_valor_27 = ROUND(l.p_valor_27, 2),
           l.p_valor_28 = ROUND(l.p_valor_28, 2)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA'
       and decode(idbanco, '52', '52', '99') = p_banco;

    -- actualizar datos del proceso
    update recaudo_local_liquidacion l
       set l.fecha_proceso = sysdate, l.usuario_proceso = p_usuario
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and decode(idbanco, '52', '52', '99') = p_banco;

    -- actualiza nit BANCO Concesionario
    update recaudo_local_liquidacion l
       set l.nit_concesionario =
           (select nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = l.idconcesionario
               and c.idconcepto = 1
               and c.idbancorec = l.idbanco)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and decode(idbanco, '52', '52', '99') = p_banco;

    -- actualiza nit fondo cobertura concesioanrio
    update recaudo_local_liquidacion l
       set l.nit_fondo =
           (select nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = l.idconcesionario
               and c.idconcepto = 2
               and c.idbancorec = l.idbanco)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and decode(idbanco, '52', '52', '99') = p_banco;

    if (to_char(p_fec_fin, 'dd') = '15') then
      update trxsinidentificar
         set fechaliq = p_fec_fin
       where estadoiden = 'ID'
         and fechaliq is null
         and quincena = '15'
         and decode(idbanco, '52', '52', '99') = p_banco;
    else
      update trxsinidentificar
         set fechaliq = p_fec_fin
       where estadoiden = 'ID'
         and fechaliq is null
         and decode(idbanco, '52', '52', '99') = p_banco;
    end if;

    update recaudo_local
    set fechaliq = p_fec_fin
       where fec_corte >= p_fec_ini
         and fec_corte <= p_fec_fin
         and decode(idbanco, '52', '52', '99') = p_banco;

      update acuerdopago
         set fechaliq = p_fec_fin
       where vlrsimitantesprorroga <> 0
         and estado = 'LI'
         and fechaliq is null
         and decode(idbanco, '52', '52', '99') = p_banco;

      update acuerdopago
         set fechaliq = p_fec_fin
       where vlrpolcaantesprorroga <> 0
         and estado = 'LI'
         and fechaliq is null
       and decode(idbanco, '52', '52', '99') = p_banco;

      update acuerdopago
         set fechaliq = p_fec_fin
       where vlrsimitdespuesprorroga <> 0
         and estado = 'LI'
         and fechaliq is null
       and decode(idbanco, '52', '52', '99') = p_banco;

      update acuerdopago
         set fechaliq = p_fec_fin
       where vlrpolcadespuesprorroga <> 0
         and estado = 'LI'
         and fechaliq is null
       and decode(idbanco, '52', '52', '99') = p_banco;

    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [sp_liquida_recaudo_local] ' || SQLERRM,
            p_error);
  end sp_liquida_recaudo_local;

  PROCEDURE carga_recaudo_externo(p_feccor_ini_ano number,
                                  p_feccor_ini_mes number,
                                  p_feccor_ini_dia number,
                                  p_feccor_fin_ano number,
                                  p_feccor_fin_mes number,
                                  p_feccor_fin_dia number,
                                  p_usuario        varchar2,
                                  p_error          OUT VARCHAR2) AS

  begin

    -- Call the procedure
    pk_batch.inicar_proceso_cargue(p_feccor_ini_ano => p_feccor_ini_ano,
                                   p_feccor_ini_mes => p_feccor_ini_mes,
                                   p_feccor_ini_dia => p_feccor_ini_dia,
                                   p_feccor_fin_ano => p_feccor_fin_ano,
                                   p_feccor_fin_mes => p_feccor_fin_mes,
                                   p_feccor_fin_dia => p_feccor_fin_dia,
                                   p_usuario        => p_usuario,
                                   p_error          => p_error);

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [carga_recaudo_externo] ' || SQLERRM,
            p_error);

  END carga_recaudo_externo;

  PROCEDURE carga_recaudo_externo_batch(p_feccor_ini date,
                                        p_feccor_fin date,
                                        p_usuario    varchar2,
                                        p_error      OUT VARCHAR2) AS

    w_fec_cor_ini     recaudo_externo.fec_corte%TYPE;
    w_fec_cor_fin     recaudo_externo.fec_corte%TYPE;
    w_fecha           recaudo_externo.fec_corte%TYPE;
    w_registros       number;
    w_num_liquidacion recaudo_externo.Num_Liquidacion%TYPE;

  BEGIN

    -- pendiente validador fecha, indfecha2002, cruce de informacion
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');
    IF NOT P_ERROR is null THEN
      RETURN;
    END IF;

    w_fec_cor_ini := p_feccor_ini;
    w_fec_cor_fin := p_feccor_fin;

    /*   select TO_DATE(p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
                       p_feccor_ini_dia,
                       'YYYY-MM-DD')
          into w_fec_cor_ini
          from DUAL;

        select TO_DATE(p_feccor_fin_ano || '-' || p_feccor_fin_mes || '-' ||
                       p_feccor_fin_dia,
                       'YYYY-MM-DD')
          into w_fec_cor_fin
          from DUAL;
    */
    sp_log(p_usuario,
           'entro a carga_recaudo_externo_batch',
           to_char(w_fec_cor_ini, 'yyyy-mm-dd') || '-' ||
           to_char(w_fec_cor_fin, 'yyyy-mm-dd'));

    -- Cambio: Abril/30
    -- Validar proceso de liquidacion antes de cargar nuevamente

    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_externo_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    IF w_registros > 0 THEN

      p_error := 'PROCESO NO EJECUTADO. PROCESO YA LIQUIDADO. SOLICITAR AUTORIZACION';
      sp_log(p_usuario,
             p_error,
             to_char(w_fec_cor_ini, 'yyyy-mm-dd') || '-' ||
             to_char(w_fec_cor_fin, 'yyyy-mm-dd'));

      sp_envioNotificacion(grupoRecibe => 8,
                           grupoCopia  => 2,
                           asunto      => 'SDF - Proceso de cargue dia: ' ||
                                          to_char(w_fec_cor_ini,
                                                  'yyyy-MM-dd') || '-' ||
                                          to_char(w_fec_cor_fin,
                                                  'yyyy-mm-dd'),
                           mensaje     => 'El sistema SDF informa que el proceso de cargue NO FUE EXITOSO, del dia ' ||
                                          to_char(w_fec_cor_ini,
                                                  'yyyy-MM-dd') || '-' ||
                                          to_char(w_fec_cor_fin,
                                                  'yyyy-mm-dd') || '.' ||
                                          p_error,
                           p_usuario   => p_usuario);

      RETURN;
    END IF;

    -- elimina liquidaciones y cargues anteriores
    delete recaudo_externo_liquidacion
     where id_recaudo_externo in
           (select id_recaudo_externo
              from recaudo_externo
             where fec_corte >= w_fec_cor_ini
               and fec_corte <= w_fec_cor_fin);

    delete recaudo_externo
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    commit;

    -- inserta recaudo externo cargado por simit
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
       indfecha2002,
       MEDIOIMPOSICION)
      SELECT SEQ_RECAUDO_EXTERNO.NEXTVAL,
             SUBSTR(b.cod_banco, 1, 2) cod_banco,
             --SUBSTR(b.cuenta, 1, 12) cuenta,
             case
               when length(cuenta) = 17 then
                SUBSTR(b.cuenta, 9, 9)
               when length(cuenta) = 9 then
                b.cuenta
               when length(cuenta) = 8 then
                '0' || b.cuenta
               else
                cuenta
             end as cuenta,
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
             '000',
             0,
             '' --MEDIOIMPOSICION
        FROM quipux.simit_recaudo_detalle a, quipux.simit_recaudo b
      /*        FROM quipux.recaudo_det_proyecta a, quipux.recaudo_proyecta b
      */
       where a.id_procedencia_pago in ('2', '11')
         and a.consecutivo_recaudo = b.consecutivo_recaudo
         and b.cod_banco in (50, 51, 52, 01)
         and a.id_estado_recaudo <> 'DV'
            /*and a.codigo_banco in (50,52)*/
         and a.fecha_contable >= w_fec_cor_ini
         and a.fecha_contable <= w_fec_cor_fin;
    w_registros := SQL%ROWCOUNT;

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
       indfecha2002,
       medioImposicion)
      SELECT SEQ_RECAUDO_EXTERNO.NEXTVAL,
             SUBSTR(b.cod_banco, 1, 2) cod_banco,
             --SUBSTR(b.cuenta, 1, 12) cuenta,
             case
               when length(cuenta) = 17 then
                SUBSTR(b.cuenta, 9, 9)
               when length(cuenta) = 9 then
                b.cuenta
               when length(cuenta) = 8 then
                '0' || b.cuenta
               else
                cuenta
             end as cuenta,
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
             '000',
             0,
             '' --MEDIOIMPOSICION
        FROM quipux.simit_recaudo_detalle a,
             quipux.simit_recaudo         b,
             /*        FROM quipux.recaudo_det_proyecta a,
             quipux.recaudo_proyecta b,
             */
             quipux.simit_carga_informacion c
       where a.id_procedencia_pago = '2'
         and a.consecutivo_recaudo = b.consecutivo_recaudo
         and b.cod_banco not in (50, 51, 52, 01)
            /*and a.codigo_banco not in (50,52)*/
         and b.id_proceso_carga = c.id_proceso_carga
         and a.id_estado_recaudo <> 'DV'
         and c.id_tipo_archivo in (4, 8)
         and trunc(c.fecha_carga) >= w_fec_cor_ini
         and trunc(c.fecha_carga) <= w_fec_cor_fin;
    w_registros := SQL%ROWCOUNT;

    commit;

    select count(*)
      into w_registros
      from recaudo_externo
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and valor_total < valor_adicional;

    IF w_registros > 0 THEN

      select num_liquidacion
        into w_num_liquidacion
        from recaudo_externo
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and valor_total < valor_adicional
         and rownum = 1;

      p_error := 'PROCESO NO EJECUTADO. LIQUIDACION ERRADA VTOTAL < VADICIONAL: ' ||
                 w_num_liquidacion;

      delete recaudo_externo
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin;

      commit;

      sp_envioNotificacion(grupoRecibe => 8,
                           grupoCopia  => 2,
                           asunto      => 'SDF - Proceso de cargue dia: ' ||
                                          to_char(w_fec_cor_ini,
                                                  'yyyy-MM-dd') || '-' ||
                                          to_char(w_fec_cor_fin,
                                                  'yyyy-mm-dd'),
                           mensaje     => 'El sistema SDF informa que el proceso de cargue NO FUE EXITOSO, del dia ' ||
                                          to_char(w_fec_cor_ini,
                                                  'yyyy-MM-dd') || '-' ||
                                          to_char(w_fec_cor_fin,
                                                  'yyyy-mm-dd') || '.' ||
                                          p_error,
                           p_usuario   => p_usuario);

      sp_log(p_usuario,
             p_error,
             to_char(w_fec_cor_ini, 'yyyy-mm-dd') || '-' ||
             to_char(w_fec_cor_fin, 'yyyy-mm-dd'));

      return;

    END IF;

    -- INICIO Ajuste Hugo C 10/10/13

    SELECT COUNT(*)
      INTO w_registros
      FROM (select NUM_LIQUIDACION
              from recaudo_externo
             where fec_corte >= w_fec_cor_ini
               and fec_corte <= w_fec_cor_fin
             GROUP BY NUM_LIQUIDACION
            HAVING count(*) > 1);

    IF w_registros > 0 THEN

      SELECT NUM_LIQUIDACION
        INTO w_num_liquidacion
        FROM (select NUM_LIQUIDACION
                from recaudo_externo
               where fec_corte >= w_fec_cor_ini
                 and fec_corte <= w_fec_cor_fin
               GROUP BY NUM_LIQUIDACION
              HAVING count(*) > 1)
       WHERE ROWNUM = 1;

      p_error := 'PROCESO NO EJECUTADO.LIQUIDACION DUPLICADA EN SIMIT: ' ||
                 w_num_liquidacion;

      delete recaudo_externo
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin;

      commit;

      sp_envioNotificacion(grupoRecibe => 8,
                           grupoCopia  => 2,
                           asunto      => 'SDF - Proceso de cargue dia: ' ||
                                          to_char(w_fec_cor_ini,
                                                  'yyyy-MM-dd') || '-' ||
                                          to_char(w_fec_cor_fin,
                                                  'yyyy-mm-dd'),
                           mensaje     => 'El sistema SDF informa que el proceso de cargue NO FUE EXITOSO, del dia ' ||
                                          to_char(w_fec_cor_ini,
                                                  'yyyy-MM-dd') || '-' ||
                                          to_char(w_fec_cor_fin,
                                                  'yyyy-mm-dd') || '.' ||
                                          p_error,
                           p_usuario   => p_usuario);

      sp_log(p_usuario,
             p_error,
             to_char(w_fec_cor_ini, 'yyyy-mm-dd') || '-' ||
             to_char(w_fec_cor_fin, 'yyyy-mm-dd'));

      return;

    END IF;

    -- FIN Ajuste Hugo C 10/10/13

    -- actualiza cuenta de avvillas para completar dato?  update recaudo_externo

    update recaudo_externo
       set cta_recaudo = '0' || cta_recaudo
     where substr(cta_recaudo, 1, 2) = '86'
       and fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    -- actualiza cuenta de bancafe para completar dato
    /*    update recaudo_externo
          set cta_recaudo = '00' || cta_recaudo
        where substr(cta_recaudo, 1, 2) = '18'
          and fec_corte >= w_fec_cor_ini
          and fec_corte <= w_fec_cor_fin;
    */

    -- actualiza banco basado en la cuenta de recaudo
    update recaudo_externo r
       set r.idbanco =
           (select max(c.idbanco)
              from cta_recaudo_concesionario c
             where c.cuenta = r.cta_recaudo)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    -- actualizar fecha de corte avvillas cuando es fin de mes sab, dom o festivo a d
    -- dia habil anterior
    /*
        update recaudo_externo
        set fec_corte = fn_fec_dispersion(fec_corte,-1,0,p_usuario)
        where idBanco = '52'
           and fec_corte >= w_fec_cor_ini
           and fec_corte <= w_fec_cor_fin
           and fec_corte <> fn_fec_dispersion(fec_corte,0,0,p_usuario);
    */

    /*    -- actualiza validador si esta vacio
        update recaudo_externo
           set indfecha2002 = '0'
         where fec_corte >= w_fec_cor_ini
           and fec_corte <= w_fec_cor_fin
           and indfecha2002 is null;
    */

    -- actualiza datos basado en el comparendo
    /*    update recaudo_externo l
       set (l.fec_comparendo, l.tipo_identificacion, l.nombre_infractor, l.apellido_infractor, l.num_comparendo) = (select c.fecha             fec_comparendo,
                                                                                                                           c.id_tipo_documento tipo_identificacion,
                                                                                                                           c.nombre            nombre_infractor,
                                                                                                                           c.apellido          apellido_infractor,
                                                                                                                           c.orden_comparendo  num_comparendo

                                                                                                                      from quipux.simit_det_liquida_comparendo a,
                                                                                                                           quipux.simit_comparendo             c
                                                                                                                     where a.cod_liquidacion =
                                                                                                                           substr(l.num_liquidacion,1,9)
                                                                                                                       and a.orden_comparendo =
                                                                                                                           c.orden_comparendo
                                                                                                                       and c.id_secretaria =
                                                                                                                           l.idmunicipio
                                                                                                                       and c.documento_identidad =
                                                                                                                           l.identificacion
                                                                                                                       and a.id_tipo_documento = c.id_tipo_documento   )

     where l.fec_corte >= w_fec_cor_ini
       and l.fec_corte <= w_fec_cor_fin;


    -- actualiza datos basado en la resolucion

       update recaudo_externo l
          set (l.num_resolucion, l.fec_resolucion, l.tipo_identificacion, l.nombre_infractor, l.apellido_infractor, l.fec_comparendo, l.num_comparendo) = (select c.nro_resolucion   num_resolucion,
                                                                                                                                                                  c.fecha_resolucion fec_resolucion,
                                                                                                                                                                  c.id_tipo_doc      tipo_identificacion,
                                                                                                                                                                  c.nombres          nombre_infractor,
                                                                                                                                                                  c.apellidos        apellido_infractor,
                                                                                                                                                                  c.fecha_comparendo fec_comparendo,
                                                                                                                                                                  c.nro_comparendo   num_comparendo
                                                                                                                                                             from quipux.simit_detalle_liquida b,
                                                                                                                                                                  quipux.simit_resolucion      c
                                                                                                                                                            where l.num_liquidacion =
                                                                                                                                                                  b.cod_liquidacion
                                                                                                                                                              and b.consecutivo_cartera =
                                                                                                                                                                  c.consecutivo_cartera

                                                                                                                                                           )
        where l.fec_corte >= w_fec_cor_ini
          and l.fec_corte <= w_fec_cor_fin;
    */

    delete from datos_liquidacion;

    insert into datos_liquidacion
      (numliquidacion,
       fechacomparendo,
       numerocomparendo,
       fecharesolucion,
       numeroresolucion,
       medioImposicion)
      select SDLC.COD_LIQUIDACION,
             SC.FECHA,
             SC.ORDEN_COMPARENDO,
             null,
             null,
             decode(nvl(COMPARENDOS_ELECTRONICOS, 'N'), 'S', 'F', '')
        from QUIPUX.SIMIT_DET_LIQUIDA_COMPARENDO SDLC,
             QUIPUX.SIMIT_COMPARENDO             SC
       where SDLC.COD_LIQUIDACION in
             (select SUBSTR(r.num_liquidacion, 1, 9)
                from recaudo_externo r
               where r.fec_corte >= w_fec_cor_ini
                 and r.fec_corte <= w_fec_cor_fin)
         and SC.ORDEN_COMPARENDO = sdlc.ORDEN_COMPARENDO
         AND SC.DOCUMENTO_IDENTIDAD = sdlc.id_contraventor;

    insert into datos_liquidacion
      (numliquidacion,
       fechacomparendo,
       numerocomparendo,
       fecharesolucion,
       numeroresolucion,
       medioImposicion)
      select SDL.COD_LIQUIDACION,
             SR.FECHA_COMPARENDO,
             SR.NRO_COMPARENDO,
             sr.fecha_resolucion,
             sr.nro_resolucion,
             decode(nvl(COMPARENDOS_ELECTRONICOS, 'N'), 'S', 'F', '')
        from QUIPUX.SIMIT_RESOLUCION SR, QUIPUX.SIMIT_DETALLE_LIQUIDA SDL
       where SR.CONSECUTIVO_CARTERA = sdl.consecutivo_cartera
         and SDL.COD_LIQUIDACION in
             (select SUBSTR(r.num_liquidacion, 1, 9)
                from recaudo_externo r
               where r.fec_corte >= w_fec_cor_ini
                 and r.fec_corte <= w_fec_cor_fin);

    commit;

    update recaudo_externo r
       set (r.num_comparendo, r.fec_comparendo, r.medioimposicion) =
           (select max(d.numerocomparendo),
                   max(d.fechacomparendo),
                   max(medioImposicion)
              from datos_liquidacion d
             where d.numliquidacion = SUBSTR(r.num_liquidacion, 1, 9))
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    update recaudo_externo r
       set (r.num_comparendo, r.fec_comparendo, r.medioimposicion) =
           (select max(d.numeroresolucion),
                   max(d.fecharesolucion),
                   max(medioImposicion)
              from datos_liquidacion d
             where d.numliquidacion = SUBSTR(r.num_liquidacion, 1, 9))
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and r.num_comparendo = 'NO REPORTADO';

    update recaudo_externo r
       set (r.num_comparendo, r.fec_comparendo, r.medioimposicion) =
           (select max(d.numeroresolucion),
                   max(d.fecharesolucion),
                   max(medioImposicion)
              from datos_liquidacion d
             where d.numliquidacion = SUBSTR(r.num_liquidacion, 1, 9))
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and r.fec_comparendo = to_date('1900-01-01', 'yyyy-mm-dd');

    update recaudo_externo r
       set r.indfecha2002 = 1
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and r.fec_comparendo < to_date('2002-11-08', 'yyyy-mm-dd')
       and r.fec_comparendo is not null
       and r.fec_comparendo <> to_date('1900-01-01', 'yyyy-mm-dd');

    update recaudo_externo r
       set (r.validador_fecha) =
           (select v.idvalidador
              from validador_fecha v
             where v.idmunicipio = r.idmunicipio
               and r.fec_comparendo >= v.fecha_ini
               and r.fec_comparendo <= v.fecha_fin
               and substr(r.num_liquidacion, 8, 1) =
                   decode(V.indtipo, 'SIMIT', 0, 'POLCA', 1))
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    -- actualiza validador si esta vacio
    update recaudo_externo
       set validador_fecha = '000'
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and validador_fecha is null;

    commit;

    /*  w_fecha := w_fec_cor_ini;
      while (w_fecha <= w_fec_cor_fin) loop
        sp_paralelo_temp(p_fecha => w_fecha);
        w_fecha := w_fecha + 1;
      end loop;
    */
    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_externo
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    p_error := 'Recaudo Externo Cargado exitosamente. Registros: ' ||
               w_registros;

    sp_log(p_usuario,
           p_error,
           to_char(w_fec_cor_ini, 'yyyy-mm-dd') || '-' ||
           to_char(w_fec_cor_fin, 'yyyy-mm-dd'));

    sp_envioNotificacion(grupoRecibe => 8,
                         grupoCopia  => 2,
                         asunto      => 'SDF - Proceso de cargue dia: ' ||
                                        to_char(w_fec_cor_ini, 'yyyy-MM-dd') || '-' ||
                                        to_char(w_fec_cor_fin, 'yyyy-mm-dd'),
                         mensaje     => 'El sistema SDF informa que se ha ejecutado el proceso de cargue exitosamente, del dia ' ||
                                        to_char(w_fec_cor_ini, 'yyyy-MM-dd') || '-' ||
                                        to_char(w_fec_cor_fin, 'yyyy-mm-dd') || '.' ||
                                        p_error,
                         p_usuario   => p_usuario);

    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [carga_recaudo_externo] ' || SQLERRM,
            p_error);

  END carga_recaudo_externo_batch;

  PROCEDURE transferir_recaudo_externo(p_fec_ini_ano number,
                                       p_fec_ini_mes number,
                                       p_fec_ini_dia number,
                                       p_usuario     varchar2,
                                       p_error       OUT VARCHAR2) as

    w_fec_trf_ini date;
    w_registros   number;
    p_ajuste      number;
    p_cod_error   number;
    p_msg_error   varchar2(500);

  begin
    -- VALIDACIONES
    if (not p_usuario = '99999999') THEN
      sp_v_usuario(p_usuario, p_error, 'pk_proc');
    END IF;

    IF not P_ERROR is null THEN
      return;
    END IF;

    select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                   p_fec_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_trf_ini
      from DUAL;

    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_externo_disp_tot
     where fec_dispersion = w_fec_trf_ini;

    IF w_registros > 0 THEN
      p_error := 'PROCESO NO EJECUTADO. PROCESO YA TRANSFERIDO. SOLICITAR AUTORIZACION HH';
      RETURN;
    END IF;

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
       idmunicipio,
       vlrdisp)
      select w_fec_trf_ini,
             w_fec_trf_ini,
             w_fec_trf_ini,
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
             p_usuario,
             sysdate,
             sum(valor),
             id_concesionario_pro,
             idmunicipio,
             sum(valor)
        from recaudo_externo_disp
       where fec_dispersion = w_fec_trf_ini
       group by fec_dispersion,
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
                id_concesionario_pro,
                idmunicipio;

    pk_novdev.aplicaNovedadesDevolucion(w_fec_trf_ini);

    update recaudo_externo_disp_tot
       set id_concesionario_pro = '00'
     where fec_corte_ini = w_fec_trf_ini
       and id_concesionario_pro is null;

    update recaudo_externo_disp_tot
       set idmunicipio = '00000000'
     where fec_corte_ini = w_fec_trf_ini
       and idmunicipio is null;

    update recaudo_externo_disp_tot
       set referenciatrf = seq_transferencia.nextval
     where fec_corte_ini = w_fec_trf_ini;

    update recaudo_externo_disp_tot
       set enviadobanco = 0
     where fec_corte_ini = w_fec_trf_ini;

    update recaudo_externo_disp_tot
       set valor = vlrDisp
     where fec_corte_ini = w_fec_trf_ini
       and orden < 30;

    commit;

    for regPol in (select * from trfpolca where fechatrf = w_fec_trf_ini) loop

      if (regPol.Metodotrf = 'P') then
        update recaudo_externo_disp_tot
           set valorOri = valor
         where fec_corte_ini = w_fec_trf_ini
           and orden = 12;

        update recaudo_externo_disp_tot
           set valor = round(valor * regPol.Valor / 100, 2)
         where fec_corte_ini = w_fec_trf_ini
           and orden = 12;

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
           deb_cta_con,
           deb_cen_cos,
           deb_nit_ter,
           cre_cta_con,
           cre_cen_cos,
           cre_nit_ter,
           concepto_con,
           id_concesionario_pro,
           idmunicipio,
           enviadobanco,
           referenciatrf,
           estadotrf,
           fechaenvio,
           fechaconfirmada,
           fechadevolucion,
           motivodevolucion,
           codigodevolucion,
           fechaenvioach,
           vlrdisp,
           des_idbancorev,
           des_tipocuentarev,
           des_cuentarev,
           des_nitrev,
           referenciatrfori,
           fechaactreeenvio,
           fechareenvio,
           indreenvio,
           tiponov1,
           numeronov1,
           usuarionov1,
           tiponov,
           numeronov,
           usuarionov,
           tipo_ide_dest,
           valorori)
          select fec_corte_ini,
                 fec_corte_fin,
                 fec_dispersion,
                 id_concesionario_liq,
                 orden,
                 concepto,
                 ori_idbanco,
                 ori_tipocuenta,
                 ori_cuenta,
                 ori_nit,
                 regPol.Idbanco,
                 regPol.Tipocuenta,
                 regPol.Cuenta,
                 regPol.nit,
                 indtipo,
                 usuario_proceso,
                 fecha_proceso,
                 valor,
                 'NEW',
                 deb_cen_cos,
                 deb_nit_ter,
                 cre_cta_con,
                 cre_cen_cos,
                 cre_nit_ter,
                 concepto_con,
                 id_concesionario_pro,
                 idmunicipio,
                 enviadobanco,
                 referenciatrf,
                 estadotrf,
                 fechaenvio,
                 fechaconfirmada,
                 fechadevolucion,
                 motivodevolucion,
                 codigodevolucion,
                 fechaenvioach,
                 vlrdisp,
                 des_idbancorev,
                 des_tipocuentarev,
                 des_cuentarev,
                 des_nitrev,
                 referenciatrfori,
                 fechaactreeenvio,
                 fechareenvio,
                 indreenvio,
                 tiponov1,
                 numeronov1,
                 usuarionov1,
                 tiponov,
                 numeronov,
                 usuarionov,
                 tipo_ide_dest,
                 valorori
            from recaudo_externo_disp_tot
           where fec_corte_ini = w_fec_trf_ini
             and orden = 12;

        update recaudo_externo_disp_tot
           set valor = ValorOri - Valor
         where fec_corte_ini = w_fec_trf_ini
           and orden = 12
           and deb_cta_con = 'NEW';

      end if;

    end loop;

    -- Carga acuerdo de pago rrealizados para que sean procesados enel recaudo local
    PK_ACUERDO.insertarAcuerdos(w_fec_trf_ini,p_usuario, p_cod_error, p_msg_error);

    PK_CONTA_EXT.contabiliza_pago_externo(p_fec_ini_ano,
                                          p_fec_ini_mes,
                                          p_fec_ini_dia,
                                          p_usuario,
                                          p_error);

    -- inserta reeenvios de devoluciones ach aprobadas
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
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       concepto_con,
       id_concesionario_pro,
       idmunicipio,
       enviadobanco,
       referenciatrf,
       estadotrf,
       fechaenvio,
       fechaconfirmada,
       fechadevolucion,
       motivodevolucion,
       codigodevolucion,
       fechaenvioach,
       vlrdisp,
       fechareenvio,
       indreenvio,
       des_idbancorev,
       des_tipocuentarev,
       des_cuentarev,
       des_nitrev,
       referenciatrfori)
      select w_fec_trf_ini,
             w_fec_trf_ini,
             w_fec_trf_ini,
             id_concesionario_liq,
             orden,
             'REENV-' || concepto,
             ori_idbanco,
             ori_tipocuenta,
             ori_cuenta,
             ori_nit,
             des_idbancorev,
             des_tipocuentarev,
             des_cuentarev,
             des_nitrev,
             indtipo,
             p_usuario,
             sysdate,
             valor,
             deb_cta_con,
             deb_cen_cos,
             deb_nit_ter,
             cre_cta_con,
             cre_cen_cos,
             cre_nit_ter,
             concepto_con,
             id_concesionario_pro,
             idmunicipio,
             0,
             seq_transferencia.nextval,
             '',
             null,
             null,
             null,
             '',
             '',
             null,
             valor,
             null,
             '',
             '',
             '',
             '',
             '',
             referenciatrf
        from recaudo_externo_disp_tot
       where indreenvio = 'S'
         and FECHAACTREEENVIO = w_fec_trf_ini
         and fechareenvio is null;

    commit;

    -- contabiliza reeenvios de devoluciones ach
/*    pk_devolach.contabiliza_reenvio_ach(p_fec_ini_ano,
                                        p_fec_ini_mes,
                                        p_fec_ini_dia,
                                        p_usuario,
                                        p_error);
*/
    update recaudo_externo_disp_tot
       set fechareenvio = w_fec_trf_ini
     where indreenvio = 'S'
       and FECHAACTREEENVIO = w_fec_trf_ini
       and fechareenvio is null;

    IF not P_ERROR is null THEN
      delete recaudo_externo_disp_tot where fec_dispersion = w_fec_trf_ini;
      commit;

      return;
    END IF;

    select max(importe)
      into p_ajuste
      from recaudo_externo_contabilidad
     where textocabezera2 = 'AJUSTE PESOS'
       and fechadoc = to_char(w_fec_trf_ini, 'ddMMyyyy')
       and tipocontable = 'PAG';

/*    PK_NOVDEV.contabiliza_devolucion_externo(p_fec_ini_ano,
                                             p_fec_ini_mes,
                                             p_fec_ini_dia,
                                             p_usuario,
                                             p_error);
*/
    IF not P_ERROR is null THEN
      delete recaudo_externo_disp_tot where fec_dispersion = w_fec_trf_ini;
      commit;

      return;
    END IF;

    -- confirma transferencias ach avvillas pasados 3 dias habiles
    update recaudo_externo_disp_tot r
       set r.estadotrf = 'EXI', r.fechaconfirmada = sysdate
     where --r.ori_idbanco = '52'
    --and r.des_idbanco <> '52'
     (r.estadotrf = 'ENV' or r.estadotrf is null)
    --and r.enviadobanco = 1
     and r.fec_dispersion <= fn_fec_dispersion(w_fec_trf_ini, -3, 0, p_usuario);

    -- obtiene cantidad de registros procesados
    select count(*)
      into w_registros
      from recaudo_externo_disp_tot
     where fec_dispersion = w_fec_trf_ini;

    p_error := 'Transferencia generada OK. Registros: ' || w_registros || ': ' ||
               to_char(w_fec_trf_ini, 'yyyy-mm-dd');

    if (p_ajuste > 5000) then
      p_error := 'Recuado Externo Liquidado OK. POSIBLE ERROR DE CONTABILIDAD. FAVOR VERIFICAR.Registros: ' ||
                 w_registros || ': ' ||
                 to_char(w_fec_trf_ini, 'yyyy-mm-dd');
    end if;

    sp_envioNotificacion(grupoRecibe => 3,
                         grupoCopia  => 2,
                         asunto      => 'SDF - Proceso de transferencia del dia ' ||
                                        to_char(w_fec_trf_ini, 'yyyy-MM-dd'),
                         mensaje     => 'El sistema SDF informa que se ha ejecutado el proceso de transferencia, del dia ' ||
                                        to_char(w_fec_trf_ini, 'yyyy-MM-dd') ||
                                        '. Favor verificar y dar su visto bueno. Se genero el siguiente mensaje en el proceso de transferencia ' ||
                                        p_error,
                         p_usuario   => p_usuario);

    sp_log(p_usuario,
           'transferir_recaudo_externo',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia);

    commit;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [transferir_recaudo_externo] ' || SQLERRM,
            p_error);

  END transferir_recaudo_externo;

  PROCEDURE liquida_recaudo_externo(p_feccor_ini_ano number,
                                    p_feccor_ini_mes number,
                                    p_feccor_ini_dia number,
                                    p_usuario        varchar2,
                                    p_error          OUT VARCHAR2) AS

    w_fec_cor_ini date;
    w_fec_cor_fin date;
    w_registros   number;
    w_registros1  number;

    w_idMunicipio char(8);
    w_fec_corte   date;
    w_cta_recaudo varchar2(500);
    w_mensaje     varchar2(500);
    p_ajuste      number;

    v_cod_error  number;
    v_msg_error  varchar2(500);
    w_vlrRecaudo number;
    w_vlrDisp    number;
    numTer number;

  BEGIN

/*    -- VALIDACIONES
    if (not p_usuario = '99999999') THEN
      sp_v_usuario(p_usuario, p_error, 'pk_proc');
      IF not P_ERROR is null THEN
        return;
      END IF;
    END IF;*/

    select TO_DATE(p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
                   p_feccor_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_ini
      from DUAL;

    select TO_DATE(p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
                   p_feccor_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_fin
      from DUAL;

    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_externo_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

 /*   IF w_registros > 0 THEN
      p_error := 'PROCESO NO EJECUTADO. PROCESO YA LIQUIDADO. SOLICITAR AUTORIZACION';
      RETURN;
    END IF;*/

    pk_techo.validaParametrosTecho(w_fec_cor_ini,
                                   p_usuario,
                                   v_cod_error,
                                   v_msg_error);

    if (v_cod_error <> 0) then
      p_error := 'PROCESO NO EJECUTADO.' || v_msg_error;
      RETURN;
    end if;

    -- obtiene cantidad de registros actualizados

/*    select count(*)
      into w_registros
      from recaudo_externo_disp_tot
     where fec_dispersion > w_fec_cor_ini;

    IF w_registros > 0 THEN
      p_error := 'SE HA REALIZADO YA UN PROCESO DE TRANSFERENCIA SUPERIOR A LA FECHA DE LIQUIDACION. HACER REPROCESO';
      RETURN;
    END IF;*/

    aplicaNovedadesMunicipio(w_fec_cor_fin);
    aplicaNovedadesDiasMunicipio(w_fec_cor_fin);
    aplicaNovedadesTercero(w_fec_cor_fin);

    --aplicaNovedadesTercero(w_fec_cor_fin);
    -- elimina liquidaciones anteriores
    delete recaudo_externo_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    -- inserta liquidaciones a procesar
    insert into recaudo_externo_liquidacion
      (id_recaudo_externo_liquidacion,
       id_recaudo_externo,
       idmunicipio,
       fec_corte,
       usuario_proceso,
       fecha_proceso,
       num_liquidacion,
       id_concesionario_liq,
       indtipo,
       idbanco,
       valor_total,
       valor_adicional,
       validador_fecha,
       indfecha2002,
       cta_recaudo,
       ind_base_ter1,
       ind_base_ter2,
       ind_base_ter3,
       ind_base_ter4,
       por_base_ter1,
       por_base_ter2,
       por_base_ter3,
       por_base_ter4,
       medioImposicion)
      select seq_recaudo_externo_liq.nextval,
             id_recaudo_externo,
             idmunicipio,
             fec_corte,
             p_usuario,
             sysdate,
             num_liquidacion,
             '0' || SUBSTR(num_liquidacion, 9, 1), -- concesionario liquidador
             decode(SUBSTR(num_liquidacion, 8, 1), '1', 'POLCA', 'SIMIT'), -- tipo comparendo
             idbanco,
             valor_total,
             valor_adicional,
             validador_fecha,
             indfecha2002,
             cta_recaudo,
             0, -- ind_base_ter1,
             0, -- ind_base_ter2,
             0, -- ind_base_ter3,
             0, -- ind_base_ter4,
             0, -- por_base_ter1,
             0, -- por_base_ter2,
             0, -- por_base_ter3,
             0, --por_base_ter4
             nvl(MEDIOIMPOSICION, 'T')
        from recaudo_externo
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin;

    -- obtiene concsionario propietario, indicador de proceso y retroactividad
    update recaudo_externo_liquidacion a
       set (a.id_concesionario_pro, a.ind_proceso, a.indretroactividad) =
           (select m.idconcesionario,
                   (case
                     when a.indtipo = 'SIMIT' then
                      m.indliq_s_ext
                     else
                      m.indliq_p_ext
                   end),
                   m.indretroactividad
              from municipio m
             where m.idmunicipio = a.idmunicipio)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin;

    -- verifica que todos los municipios esten parametrizados

    select count(*)
      into w_registros
      from recaudo_externo_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and id_concesionario_pro is null;

    IF w_registros > 0 THEN
      select idMunicipio
        into w_idMunicipio
        from recaudo_externo_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and id_concesionario_pro is null
         and rownum = 1;

      delete recaudo_externo_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin;

      commit;

      p_error := 'PROCESO NO EJECUTADO. MUNICIPIO SIN PARAMETRIZAR: ' ||
                 w_idMunicipio;
      RETURN;
    END IF;

    for regMunTer in (select idmunicipio
                        from tercero_ot
                        where jurisdiccion ='SIMIT'
                       group by idmunicipio) loop


        numTer := 1;
        for regTer in (select * from tercero_ot where idmunicipio = regMunTer.Idmunicipio  and jurisdiccion = 'SIMIT' and medioImposicion = 'F' order by numtercero) loop
          if numTer = 1 then
          update recaudo_externo_liquidacion r
             set ind_base_ter1 = regTer.Baseliquidacion,
                 por_base_ter1 = regTer.Valorbase,
                 nom_ter1      = regTer.Nombre,
                 nit_tercero1  = regTer.Nit_t
           where r.fec_corte >= w_fec_cor_ini
             and r.fec_corte <= w_fec_cor_fin
             and r.idmunicipio = regTer.Idmunicipio
             and r.indtipo = regTer.Jurisdiccion
             and r.medioimposicion = regTer.Medioimposicion;
          end if;

          if numTer = 2 then
          update recaudo_externo_liquidacion r
             set ind_base_ter2 = regTer.Baseliquidacion,
                 por_base_ter2 = regTer.Valorbase,
                 nom_ter2      = regTer.Nombre,
                 nit_tercero2  = regTer.Nit_t
           where r.fec_corte >= w_fec_cor_ini
             and r.fec_corte <= w_fec_cor_fin
             and r.idmunicipio = regTer.Idmunicipio
             and r.indtipo = regTer.Jurisdiccion
             and r.medioimposicion = regTer.Medioimposicion;
          end if;

          if numTer = 3 then
          update recaudo_externo_liquidacion r
             set ind_base_ter3 = regTer.Baseliquidacion,
                 por_base_ter3 = regTer.Valorbase,
                 nom_ter3      = regTer.Nombre,
                 nit_tercero3  = regTer.Nit_t
           where r.fec_corte >= w_fec_cor_ini
             and r.fec_corte <= w_fec_cor_fin
             and r.idmunicipio = regTer.Idmunicipio
             and r.indtipo = regTer.Jurisdiccion
             and r.medioimposicion = regTer.Medioimposicion;
          end if;

          if numTer = 4 then
          update recaudo_externo_liquidacion r
             set ind_base_ter4 = regTer.Baseliquidacion,
                 por_base_ter4 = regTer.Valorbase,
                 nom_ter4      = regTer.Nombre,
                 nit_tercero4  = regTer.Nit_t
           where r.fec_corte >= w_fec_cor_ini
             and r.fec_corte <= w_fec_cor_fin
             and r.idmunicipio = regTer.Idmunicipio
             and r.indtipo = regTer.Jurisdiccion
             and r.medioimposicion = regTer.Medioimposicion;
          end if;

          numTer := numTer + 1;

         end loop;

        numTer := 1;
        for regTer in (select * from tercero_ot where idmunicipio = regMunTer.Idmunicipio and jurisdiccion = 'SIMIT' and medioImposicion <> 'F' order by numtercero) loop
          if numTer = 1 then
          update recaudo_externo_liquidacion r
             set ind_base_ter1 = regTer.Baseliquidacion,
                 por_base_ter1 = regTer.Valorbase,
                 nom_ter1      = regTer.Nombre,
                 nit_tercero1  = regTer.Nit_t
           where r.fec_corte >= w_fec_cor_ini
             and r.fec_corte <= w_fec_cor_fin
             and r.idmunicipio = regTer.Idmunicipio
             and r.medioimposicion <> 'F'
             and r.indtipo = regTer.Jurisdiccion;
          end if;

          if numTer = 2 then
          update recaudo_externo_liquidacion r
             set ind_base_ter2 = regTer.Baseliquidacion,
                 por_base_ter2 = regTer.Valorbase,
                 nom_ter2      = regTer.Nombre,
                 nit_tercero2  = regTer.Nit_t
           where r.fec_corte >= w_fec_cor_ini
             and r.fec_corte <= w_fec_cor_fin
             and r.idmunicipio = regTer.Idmunicipio
             and r.medioimposicion <> 'F'
             and r.indtipo = regTer.Jurisdiccion;
          end if;
          if numTer = 3 then
          update recaudo_externo_liquidacion r
             set ind_base_ter3 = regTer.Baseliquidacion,
                 por_base_ter3 = regTer.Valorbase,
                 nom_ter3      = regTer.Nombre,
                 nit_tercero3  = regTer.Nit_t
           where r.fec_corte >= w_fec_cor_ini
             and r.fec_corte <= w_fec_cor_fin
             and r.medioimposicion <> 'F'
             and r.idmunicipio = regTer.Idmunicipio
             and r.indtipo = regTer.Jurisdiccion;
          end if;
          if numTer = 4 then
          update recaudo_externo_liquidacion r
             set ind_base_ter4 = regTer.Baseliquidacion,
                 por_base_ter4 = regTer.Valorbase,
                 nom_ter4      = regTer.Nombre,
                 nit_tercero4  = regTer.Nit_t
           where r.fec_corte >= w_fec_cor_ini
             and r.fec_corte <= w_fec_cor_fin
             and r.idmunicipio = regTer.Idmunicipio
             and r.medioimposicion <> 'F'
             and r.indtipo = regTer.Jurisdiccion;
          end if;

          numTer := numTer + 1;

        end loop;


    end loop;

  for regMunTer in (select idmunicipio
                        from tercero_ot
                        where jurisdiccion ='POLCA'
                       group by idmunicipio) loop


        numTer := 1;
        for regTer in (select * from tercero_ot where idmunicipio = regMunTer.Idmunicipio and jurisdiccion = 'POLCA' and medioImposicion = 'F' order by numtercero) loop
          if numTer = 1 then
          update recaudo_externo_liquidacion r
             set ind_base_ter1 = regTer.Baseliquidacion,
                 por_base_ter1 = regTer.Valorbase,
                 nom_ter1      = regTer.Nombre,
                 nit_tercero1  = regTer.Nit_t
           where r.fec_corte >= w_fec_cor_ini
             and r.fec_corte <= w_fec_cor_fin
             and r.idmunicipio = regTer.Idmunicipio
             and r.indtipo = regTer.Jurisdiccion
             and r.medioimposicion = regTer.Medioimposicion;
          end if;

          if numTer = 2 then
          update recaudo_externo_liquidacion r
             set ind_base_ter2 = regTer.Baseliquidacion,
                 por_base_ter2 = regTer.Valorbase,
                 nom_ter2      = regTer.Nombre,
                 nit_tercero2  = regTer.Nit_t
           where r.fec_corte >= w_fec_cor_ini
             and r.fec_corte <= w_fec_cor_fin
             and r.idmunicipio = regTer.Idmunicipio
             and r.indtipo = regTer.Jurisdiccion
             and r.medioimposicion = regTer.Medioimposicion;
          end if;

          if numTer = 3 then
          update recaudo_externo_liquidacion r
             set ind_base_ter3 = regTer.Baseliquidacion,
                 por_base_ter3 = regTer.Valorbase,
                 nom_ter3      = regTer.Nombre,
                 nit_tercero3  = regTer.Nit_t
           where r.fec_corte >= w_fec_cor_ini
             and r.fec_corte <= w_fec_cor_fin
             and r.idmunicipio = regTer.Idmunicipio
             and r.indtipo = regTer.Jurisdiccion
             and r.medioimposicion = regTer.Medioimposicion;
          end if;

          if numTer = 4 then
          update recaudo_externo_liquidacion r
             set ind_base_ter4 = regTer.Baseliquidacion,
                 por_base_ter4 = regTer.Valorbase,
                 nom_ter4      = regTer.Nombre,
                 nit_tercero4  = regTer.Nit_t
           where r.fec_corte >= w_fec_cor_ini
             and r.fec_corte <= w_fec_cor_fin
             and r.idmunicipio = regTer.Idmunicipio
             and r.indtipo = regTer.Jurisdiccion
             and r.medioimposicion = regTer.Medioimposicion;
          end if;

          numTer := numTer + 1;

         end loop;

        numTer := 1;
        for regTer in (select * from tercero_ot where idmunicipio = regMunTer.Idmunicipio and jurisdiccion = 'POLCA' and  medioImposicion <> 'F' order by numtercero) loop
          if numTer = 1 then
          update recaudo_externo_liquidacion r
             set ind_base_ter1 = regTer.Baseliquidacion,
                 por_base_ter1 = regTer.Valorbase,
                 nom_ter1      = regTer.Nombre,
                 nit_tercero1  = regTer.Nit_t
           where r.fec_corte >= w_fec_cor_ini
             and r.fec_corte <= w_fec_cor_fin
             and r.idmunicipio = regTer.Idmunicipio
             and r.medioimposicion <> 'F'
             and r.indtipo = regTer.Jurisdiccion;
          end if;

          if numTer = 2 then
          update recaudo_externo_liquidacion r
             set ind_base_ter2 = regTer.Baseliquidacion,
                 por_base_ter2 = regTer.Valorbase,
                 nom_ter2      = regTer.Nombre,
                 nit_tercero2  = regTer.Nit_t
           where r.fec_corte >= w_fec_cor_ini
             and r.fec_corte <= w_fec_cor_fin
             and r.idmunicipio = regTer.Idmunicipio
              and r.medioimposicion <> 'F'
            and r.indtipo = regTer.Jurisdiccion;
          end if;
          if numTer = 3 then
          update recaudo_externo_liquidacion r
             set ind_base_ter3 = regTer.Baseliquidacion,
                 por_base_ter3 = regTer.Valorbase,
                 nom_ter3      = regTer.Nombre,
                 nit_tercero3  = regTer.Nit_t
           where r.fec_corte >= w_fec_cor_ini
             and r.fec_corte <= w_fec_cor_fin
              and r.medioimposicion <> 'F'
            and r.idmunicipio = regTer.Idmunicipio
             and r.indtipo = regTer.Jurisdiccion;
          end if;
          if numTer = 4 then
          update recaudo_externo_liquidacion r
             set ind_base_ter4 = regTer.Baseliquidacion,
                 por_base_ter4 = regTer.Valorbase,
                 nom_ter4      = regTer.Nombre,
                 nit_tercero4  = regTer.Nit_t
           where r.fec_corte >= w_fec_cor_ini
             and r.fec_corte <= w_fec_cor_fin
               and r.medioimposicion <> 'F'
           and r.idmunicipio = regTer.Idmunicipio
             and r.indtipo = regTer.Jurisdiccion;
          end if;

          numTer := numTer + 1;

        end loop;


    end loop;
    commit;


    /*    for regTer in (select * from tercero_ot where numTercero = 1) loop

          if regTer.Medioimposicion = 'F' then
            update recaudo_externo_liquidacion r
               set ind_base_ter1 = regTer.Baseliquidacion,
                   por_base_ter1 = regTer.Valorbase,
                   nom_ter1      = regTer.Nombre,
                   nit_tercero1  = regTer.Nit_t
             where r.fec_corte >= w_fec_cor_ini
               and r.fec_corte <= w_fec_cor_fin
               and r.idmunicipio = regTer.Idmunicipio
               and r.indtipo = regTer.Jurisdiccion
               and r.medioImposicion = 'F';
          end if;

          if regTer.Medioimposicion <> 'F' then
            update recaudo_externo_liquidacion r
               set ind_base_ter1 = regTer.Baseliquidacion,
                   por_base_ter1 = regTer.Valorbase,
                   nom_ter1      = regTer.Nombre,
                   nit_tercero1  = regTer.Nit_t
             where r.fec_corte >= w_fec_cor_ini
               and r.fec_corte <= w_fec_cor_fin
               and r.idmunicipio = regTer.Idmunicipio
               and r.indtipo = regTer.Jurisdiccion
               and r.medioImposicion <> 'F';
          end if;

        end loop;

        for regTer in (select * from tercero_ot where numTercero = 2) loop

          if regTer.Medioimposicion = 'F' then
            update recaudo_externo_liquidacion r
               set ind_base_ter2 = regTer.Baseliquidacion,
                   por_base_ter2 = regTer.Valorbase,
                   nom_ter2      = regTer.Nombre,
                   nit_tercero2  = regTer.Nit_t
             where r.fec_corte >= w_fec_cor_ini
               and r.fec_corte <= w_fec_cor_fin
               and r.idmunicipio = regTer.Idmunicipio
               and r.indtipo = regTer.Jurisdiccion
               and r.medioImposicion = 'F';
          end if;

          if regTer.Medioimposicion <> 'F' then
            update recaudo_externo_liquidacion r
               set ind_base_ter2 = regTer.Baseliquidacion,
                   por_base_ter2 = regTer.Valorbase,
                   nom_ter2      = regTer.Nombre,
                   nit_tercero2  = regTer.Nit_t
             where r.fec_corte >= w_fec_cor_ini
               and r.fec_corte <= w_fec_cor_fin
               and r.idmunicipio = regTer.Idmunicipio
               and r.indtipo = regTer.Jurisdiccion
               and r.medioImposicion <> 'F';
          end if;

        end loop;



        for regTer in (select * from tercero_ot where numTercero = 3) loop

          if regTer.Medioimposicion = 'F' then
            update recaudo_externo_liquidacion r
               set ind_base_ter3 = regTer.Baseliquidacion,
                   por_base_ter3 = regTer.Valorbase,
                   nom_ter3      = regTer.Nombre,
                   nit_tercero3  = regTer.Nit_t
             where r.fec_corte >= w_fec_cor_ini
               and r.fec_corte <= w_fec_cor_fin
               and r.idmunicipio = regTer.Idmunicipio
               and r.indtipo = regTer.Jurisdiccion
               and r.medioImposicion = 'F';
          end if;

          if regTer.Medioimposicion <> 'F' then
            update recaudo_externo_liquidacion r
               set ind_base_ter3 = regTer.Baseliquidacion,
                   por_base_ter3 = regTer.Valorbase,
                   nom_ter3      = regTer.Nombre,
                   nit_tercero3  = regTer.Nit_t
             where r.fec_corte >= w_fec_cor_ini
               and r.fec_corte <= w_fec_cor_fin
               and r.idmunicipio = regTer.Idmunicipio
               and r.indtipo = regTer.Jurisdiccion
               and r.medioImposicion <> 'F';
          end if;

        end loop;

        for regTer in (select * from tercero_ot where numTercero = 4) loop

          if regTer.Medioimposicion = 'F' then
            update recaudo_externo_liquidacion r
               set ind_base_ter4 = regTer.Baseliquidacion,
                   por_base_ter4 = regTer.Valorbase,
                   nom_ter4      = regTer.Nombre,
                   nit_tercero4  = regTer.Nit_t
             where r.fec_corte >= w_fec_cor_ini
               and r.fec_corte <= w_fec_cor_fin
               and r.idmunicipio = regTer.Idmunicipio
               and r.indtipo = regTer.Jurisdiccion
               and r.medioImposicion = 'F';
          end if;

          if regTer.Medioimposicion <> 'F' then
            update recaudo_externo_liquidacion r
               set ind_base_ter4 = regTer.Baseliquidacion,
                   por_base_ter4 = regTer.Valorbase,
                   nom_ter4      = regTer.Nombre,
                   nit_tercero4  = regTer.Nit_t
             where r.fec_corte >= w_fec_cor_ini
               and r.fec_corte <= w_fec_cor_fin
               and r.idmunicipio = regTer.Idmunicipio
               and r.indtipo = regTer.Jurisdiccion
               and r.medioImposicion <> 'F';
          end if;

        end loop;

    */

    /*
        -- actualizar informacion de tercero 1
        update recaudo_externo_liquidacion a
           set (ind_base_ter1, por_base_ter1, nom_ter1) =
               (select ind_base,
                       (case
                         when a.indtipo = 'SIMIT' then
                          base_s
                         else
                          base_p
                       end),
                       nombre
                  from tercero t
                 where a.idmunicipio = t.idmunicipio
                   and num_tercero = 1)
         where a.fec_corte >= w_fec_cor_ini
           and a.fec_corte <= w_fec_cor_fin;

        -- actualizar informacion de tercero 2
        update recaudo_externo_liquidacion a
           set (ind_base_ter2, por_base_ter2, nom_ter2) =
               (select ind_base,
                       (case
                         when a.indtipo = 'SIMIT' then
                          base_s
                         else
                          base_p
                       end),
                       nombre
                  from tercero t
                 where a.idmunicipio = t.idmunicipio
                   and num_tercero = 2)
         where a.fec_corte >= w_fec_cor_ini
           and a.fec_corte <= w_fec_cor_fin;

        -- actualizar informacion de tercero 3

        update recaudo_externo_liquidacion a
           set (ind_base_ter3, por_base_ter3, nom_ter3) =
               (select ind_base,
                       (case
                         when a.indtipo = 'SIMIT' then
                          base_s
                         else
                          base_p
                       end),
                       nombre
                  from tercero t
                 where a.idmunicipio = t.idmunicipio
                   and num_tercero = 3)
         where a.fec_corte >= w_fec_cor_ini
           and a.fec_corte <= w_fec_cor_fin;

        -- actualizar informacion de tercero 4

        update recaudo_externo_liquidacion a
           set (ind_base_ter4, por_base_ter4, nom_ter4) =
               (select ind_base,
                       (case
                         when a.indtipo = 'SIMIT' then
                          base_s
                         else
                          base_p
                       end),
                       nombre
                  from tercero t
                 where a.idmunicipio = t.idmunicipio
                   and num_tercero = 4)
         where a.fec_corte >= w_fec_cor_ini
           and a.fec_corte <= w_fec_cor_fin;
    */
    -- verificar datos vacios de terceros
/*    update recaudo_externo_liquidacion a
       set (ind_base_ter1, por_base_ter1, nom_ter1) =
           (select ind_base,
                   (case
                     when a.indtipo = 'SIMIT' then
                      base_s
                     else
                      base_p
                   end),
                   nombre
              from tercero t
             where a.idmunicipio = t.idmunicipio
               and num_tercero = 1)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin;

    -- actualizar informacion de tercero 2
    update recaudo_externo_liquidacion a
       set (ind_base_ter2, por_base_ter2, nom_ter2) =
           (select ind_base,
                   (case
                     when a.indtipo = 'SIMIT' then
                      base_s
                     else
                      base_p
                   end),
                   nombre
              from tercero t
             where a.idmunicipio = t.idmunicipio
               and num_tercero = 2)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin;

    -- actualizar informacion de tercero 3

    update recaudo_externo_liquidacion a
       set (ind_base_ter3, por_base_ter3, nom_ter3) =
           (select ind_base,
                   (case
                     when a.indtipo = 'SIMIT' then
                      base_s
                     else
                      base_p
                   end),
                   nombre
              from tercero t
             where a.idmunicipio = t.idmunicipio
               and num_tercero = 3)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin;

    -- actualizar informacion de tercero 4

    update recaudo_externo_liquidacion a
       set (ind_base_ter4, por_base_ter4, nom_ter4) =
           (select ind_base,
                   (case
                     when a.indtipo = 'SIMIT' then
                      base_s
                     else
                      base_p
                   end),
                   nombre
              from tercero t
             where a.idmunicipio = t.idmunicipio
               and num_tercero = 4)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin;*/

    -- verificar datos vacios de terceros
    update recaudo_externo_liquidacion a
       set (a.ind_base_ter1, a.por_base_ter1, a.nom_ter1) =
           (select 0, 0, '' from dual)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin
       and a.ind_proceso = 1
       and a.ind_base_ter1 is null;

    update recaudo_externo_liquidacion a
       set (a.ind_base_ter2, a.por_base_ter2, a.nom_ter2) =
           (select 0, 0, '' from dual)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin
       and a.ind_proceso = 1
       and a.ind_base_ter2 is null;

    update recaudo_externo_liquidacion a
       set (a.ind_base_ter3, a.por_base_ter3, a.nom_ter3) =
           (select 0, 0, '' from dual)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin
       and a.ind_proceso = 1
       and a.ind_base_ter3 is null;

    update recaudo_externo_liquidacion a
       set (a.ind_base_ter4, a.por_base_ter4, a.nom_ter4) =
           (select 0, 0, '' from dual)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin
       and a.ind_proceso = 1
       and a.ind_base_ter4 is null;

    -- obtiene fecha de dispersion
    update recaudo_externo_liquidacion l
       set (l.dias_dispersion, l.frec_dispersion) =
           (select (case
                     when l.indtipo = 'SIMIT' then
                      dd.dias_dispersion_se
                     else
                      dd.dias_dispersion_pe
                   end),
                   (case
                     when l.indtipo = 'SIMIT' then
                      dd.frec_dispersion_se
                     else
                      dd.frec_dispersion_pe
                   end)
              from dias_dispersion dd
             where dd.idmunicipio = l.idmunicipio
               and dd.idbanco = l.idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1;

    -- verifica que todos los municipios tengan fecha dispersion
    select count(*)
      into w_registros
      from recaudo_externo_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and dias_dispersion is null
       and ind_proceso = 1;

    IF w_registros > 0 THEN
      select a.idMunicipio || ' ' || b.nombre || ' Banco: ' || a.idbanco
        into w_mensaje
        from recaudo_externo_liquidacion a, municipio b
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and a.dias_dispersion is null
         and a.idmunicipio = b.idmunicipio
         and a.ind_proceso = 1
         and rownum = 1;

      delete recaudo_externo_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin;

      commit;

      p_error := 'PROCESO NO EJECUTADO. MUNICIPIO SIN DIAS DE DISPERSION: ' ||
                 w_mensaje;
      RETURN;
    END IF;

    commit;

    update recaudo_externo_liquidacion l
       set l.fec_dispersion = fn_fec_dispersion(l.fec_corte,
                                                l.dias_dispersion,
                                                l.frec_dispersion,
                                                p_usuario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1;

    -- actualiza salario minimo
    update recaudo_externo_liquidacion l
       set smdlv =
           (select valor
              from salario_minimo
             where anho = to_char(l.fec_corte, 'yyyy'))
     where l.fec_corte >= w_fec_cor_ini
       and l.fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1;

    -- verifica que todos los recaudos tengan salario minimo
    select count(*)
      into w_registros
      from recaudo_externo_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and smdlv is null
       and ind_proceso = 1;

    IF w_registros > 0 THEN
      select to_char(fec_corte, 'yyyy')
        into w_mensaje
        from recaudo_externo_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and smdlv is null
         and ind_proceso = 1
         and rownum = 1;

      delete recaudo_externo_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin;

      commit;

      p_error := 'PROCESO NO EJECUTADO. FECHA CORTE SIN SALARIO MINIMO: ' ||
                 w_mensaje;
      RETURN;
    END IF;

    commit;

    -- calcular comision de recaudo
    update recaudo_externo_liquidacion l
       set l.s_valor_0 =
           (select c.comision_recaudo
              from cta_recaudo_concesionario c
             where l.idbanco = c.idbanco
               and l.indtipo = c.indtipo
               and l.cta_recaudo = c.cuenta
               and l.id_concesionario_liq = c.idconcesionario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1;

    commit;

    -- valida que se tenga comisiones de recaudo
    select count(*)
      into w_registros
      from recaudo_externo_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and s_valor_0 is null
       and ind_proceso = 1;

    IF w_registros > 0 THEN
      select 'Cuenta: ' || cta_recaudo || ' Banco: ' || idbanco ||
             ' Concesionario:' || id_concesionario_liq || ' Tipo:' ||
             indtipo || ' Liquidacion:' || num_liquidacion
        into w_cta_recaudo
        from recaudo_externo_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and s_valor_0 is null
         and ind_proceso = 1
         and rownum = 1;
      /*
            delete recaudo_externo_liquidacion
             where fec_corte >= w_fec_cor_ini
               and fec_corte <= w_fec_cor_fin;
      */
      commit;

      p_error := 'PROCESO NO EJECUTADO. CUENTA RECAUDO NO DEFINIDA: ' ||
                 w_cta_recaudo;
      RETURN;
    END IF;

    select count(*)
      into w_registros
      from recaudo_externo_liquidacion l
     where not l.validador_fecha in
            (select distinct idvalidador from validador_fecha)
       and l.validador_fecha <> '000';

    IF w_registros > 0 THEN

      delete recaudo_externo_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin;

      commit;

      p_error := 'PROCESO NO EJECUTADO. VALIDADOR FECHA NO DEFINIDO';
      RETURN;

    END IF;

    ----------------------------------------- SIMIT -----------------------------------
    -- calcular simit base
    update recaudo_externo_liquidacion l
       set s_valor_1 = valor_total - valor_adicional,
           s_valor_2 =
           (valor_total - valor_adicional) / 10
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    -- ajustar simit base para cumplir ley
    update recaudo_externo_liquidacion l
       set s_valor_2 = (case
                         when s_valor_2 < smdlv and s_valor_1 >= smdlv and
                              indretroactividad = 0 then
                          smdlv
                         when s_valor_2 < smdlv and s_valor_1 < smdlv and
                              indretroactividad = 0 then
                          s_valor_1
                         when s_valor_2 < smdlv and s_valor_1 >= smdlv and
                              indretroactividad = 1 and indfecha2002 = 0 then
                          smdlv
                         when s_valor_2 < smdlv and s_valor_1 < smdlv and
                              indretroactividad = 1 and indfecha2002 = 0 then
                          s_valor_1
                         else
                          s_valor_2
                       end)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    -- calcular valor simit, concesionario liquidador, fondo concesionario, fondo simit, equilibrio, base ot
    update recaudo_externo_liquidacion l
       set (l.s_valor_3,
            l.s_valor_4,
            l.s_valor_5,
            l.s_valor_6,
            l.s_valor_7,
            l.s_valor_8) =
           (select l.s_valor_2 * (p.simit_s / 10),
                   l.s_valor_2 * (p.concesionario_s / 10),
                   l.s_valor_2 * (p.fondo_cob_concesionario_s / 10),
                   l.s_valor_2 * (p.fondo_cob_simit_s / 10),
                   l.s_valor_2 * (p.equilibrio_economico_s / 10),
                   l.s_valor_1 - s_valor_2
              from p_dispersion_concesionario p
             where p.idconcesionario = l.id_concesionario_liq)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    -- calcular base contravencional
    update recaudo_externo_liquidacion l
       set (l.s_valor_9) =
           (select l.s_valor_8 *
                   ((p.fcm_contravencional_s + p.conces_contravencional_s) / 100) / 0.9
              from p_dispersion_municipio p
             where p.idmunicipio = l.idmunicipio)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set (l.s_valor_9) =
           (select l.s_valor_8 *
                   ((v.p_fcm_contravencional + v.p_conces_contravencional) / 100) / 0.9
              from validador_fecha v
             where v.idmunicipio = l.idmunicipio
               and v.idValidador = l.validador_fecha
               and v.indtipo = 'SIMIT')
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.validador_fecha <> '000'
       and l.ind_proceso = 1;

    -- calcular valor operador contravencional
    update recaudo_externo_liquidacion l
       set (l.s_valor_11) =
           (select l.s_valor_8 * ((p.conces_contravencional_s) / 100) / 0.9
              from p_dispersion_municipio p
             where p.idmunicipio = l.idmunicipio)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set (l.s_valor_11) =
           (select l.s_valor_8 * ((v.p_conces_contravencional) / 100) / 0.9
              from validador_fecha v
             where v.idmunicipio = l.idmunicipio
               and v.idValidador = l.validador_fecha
               and v.indtipo = 'SIMIT')
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.validador_fecha <> '000'
       and l.ind_proceso = 1;

    -- calcular valor fcm contravencional
    update recaudo_externo_liquidacion l
       set (l.s_valor_12) = l.s_valor_9 - l.s_valor_11
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    -- calcular acuerdo de pago
    update recaudo_externo_liquidacion l
       set (l.s_valor_10) =
           (select l.s_valor_8 * (p.acuerdopago_s / 100) / 0.9
              from p_dispersion_municipio p
             where p.idmunicipio = l.idmunicipio)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set (l.s_valor_10) =
           (select l.s_valor_8 * ((v.p_acuerdopago) / 100) / 0.9
              from validador_fecha v
             where v.idmunicipio = l.idmunicipio
               and v.idValidador = l.validador_fecha
               and v.indtipo = 'SIMIT')
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.validador_fecha <> '000'
       and l.ind_proceso = 1;

    -- calcula base municipio sin impuestos
    update recaudo_externo_liquidacion l
       set (l.s_valor_13) =
           (l.s_valor_8 - l.s_valor_10 - l.s_valor_11 - l.s_valor_12)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    -- calcula base municipio, iva contravencional, timbre contravencional, retefuente contravencional, reteiva contravencional
    -- este calculo si el valor del municipio es posible descontar el iva

    update recaudo_externo_liquidacion l
       set (l.s_valor_13,
            l.s_valor_14,
            l.s_valor_15,
            l.s_valor_16,
            l.s_valor_17,
            l.s_valor_30) =
           (select l.s_valor_8 - l.s_valor_10 - l.s_valor_11 - l.s_valor_12 -
                   ((l.s_valor_11 + l.s_valor_12) * fcm.iva / 100),
                   (l.s_valor_11 + l.s_valor_12) * (fcm.iva / 100),
                   (l.s_valor_11 + l.s_valor_12) * (0 / 100), -- timbre contravencional en 0.0 debe ser fcm.timbre_contravencional
                   (l.s_valor_11) * (fcm.retencion_fuente / 100),
                   (l.s_valor_11 + l.s_valor_12) * (fcm.iva / 100) *
                   (fcm.reteiva / 100), -- reteiva en 0%
                   (l.s_valor_11) * (0 / 100) -- timbre contravencional concesionario en 0.0 debe ser fcm.impuesto_timbre_tercero
              from fcm) --- Registro Unico
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.s_valor_13 > 0
       and l.ind_proceso = 1;

    -- calcula base municipio, iva contravencional, timbre contravencional, retefuente contravencional, reteiva contravencional
    -- este calculo si el valor del municipio es 0, se descuenta iva del acuerdo de pago

    update recaudo_externo_liquidacion l
       set (l.s_valor_10,
            l.s_valor_14,
            l.s_valor_15,
            l.s_valor_16,
            l.s_valor_17,
            l.s_valor_30) =
           (select l.s_valor_10 -
                   ((l.s_valor_11 + l.s_valor_12) * fcm.iva / 100),
                   (l.s_valor_11 + l.s_valor_12) * (fcm.iva / 100),
                   (l.s_valor_11 + l.s_valor_12) * (0 / 100), -- timbre contravencional en 0.0 debe ser fcm.timbre_contravencional
                   (l.s_valor_11) * (fcm.retencion_fuente / 100),
                   (l.s_valor_11 + l.s_valor_12) * (fcm.iva / 100) *
                   (fcm.reteiva / 100), -- reteiva en 0%
                   (l.s_valor_11) * (0 / 100) -- timbre contravencional concesionario en 0.0 debe ser fcm.impuesto_timbre_tercero
              from fcm) --- Registro Unico
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.s_valor_13 = 0
       and l.ind_proceso = 1;

    -- para terceros con base de liquidacion el recaudo calcular y descontar el valor de ot
    update recaudo_externo_liquidacion l
       set l.s_valor_13 = l.s_valor_13 - (s_valor_1 * por_base_ter1) / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter1 = 3
       and l.s_valor_13 > (s_valor_1 * por_base_ter1) / 100
       and por_base_ter1 > 0
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_13 = l.s_valor_13 - (s_valor_1 * por_base_ter2) / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter2 = 3
       and l.s_valor_13 > (s_valor_1 * por_base_ter2) / 100
       and por_base_ter2 > 0
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_13 = l.s_valor_13 - (s_valor_1 * por_base_ter3) / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter3 = 3
       and l.s_valor_13 > (s_valor_1 * por_base_ter3) / 100
       and por_base_ter3 > 0
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_13 = l.s_valor_13 - (s_valor_1 * por_base_ter4) / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter4 = 3
       and l.s_valor_13 > (s_valor_1 * por_base_ter4) / 100
       and por_base_ter4 > 0
       and l.ind_proceso = 1;

    -- calcula base para cada tercero
    update recaudo_externo_liquidacion l
       set l.s_valor_18 = (case
                            when ind_base_ter1 = 1 then
                             s_valor_8
                            when ind_base_ter1 = 2 then
                             valor_adicional
                            when ind_base_ter1 = 3 then
                             valor_total - valor_adicional
                            when ind_base_ter1 = 4 then
                             s_valor_13
                            else
                             0.0
                          end),
           l.s_valor_20 = (case
                            when ind_base_ter2 = 1 then
                             s_valor_8
                            when ind_base_ter2 = 2 then
                             valor_adicional
                            when ind_base_ter2 = 3 then
                             valor_total - valor_adicional
                            when ind_base_ter2 = 4 then
                             s_valor_13
                            else
                             0.0
                          end),
           l.s_valor_22 = (case
                            when ind_base_ter3 = 1 then
                             s_valor_8
                            when ind_base_ter3 = 2 then
                             valor_adicional
                            when ind_base_ter3 = 3 then
                             valor_total - valor_adicional
                            when ind_base_ter3 = 4 then
                             s_valor_13
                            else
                             0.0
                          end),
           l.s_valor_24 = (case
                            when ind_base_ter1 = 1 then
                             s_valor_8
                            when ind_base_ter3 = 2 then
                             valor_adicional
                            when ind_base_ter3 = 3 then
                             valor_total - valor_adicional
                            when ind_base_ter3 = 4 then
                             s_valor_13
                            else
                             0.0
                          end)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    -- calcula valor para cada tercero
    update recaudo_externo_liquidacion l
       set l.s_valor_19 = l.s_valor_18 * por_base_ter1 / 90
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter1 = 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_21 = l.s_valor_20 * por_base_ter2 / 90
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter2 = 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_23 = l.s_valor_22 * por_base_ter3 / 90
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter3 = 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_25 = l.s_valor_24 * por_base_ter4 / 90
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter4 = 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_19 = l.s_valor_18 * por_base_ter1 / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter1 <> 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_21 = l.s_valor_20 * por_base_ter2 / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter2 <> 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_23 = l.s_valor_22 * por_base_ter3 / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter3 <> 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_25 = l.s_valor_24 * por_base_ter4 / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter4 <> 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set (l.s_valor_13) =
           (select l.s_valor_8 - l.s_valor_10 - l.s_valor_11 - l.s_valor_12 -
                   ((l.s_valor_11 + l.s_valor_12) * fcm.iva / 100) -- reteiva 50%
              from fcm) --- Registro Unico
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    -- verificar que el valor del tercero nosea mayor que el ot
    update recaudo_externo_liquidacion l
       set l.s_valor_19 = l.s_valor_13,
           l.s_valor_20 = 0,
           l.s_valor_21 = 0,
           l.s_valor_22 = 0,
           l.s_valor_23 = 0,
           l.s_valor_24 = 0,
           l.s_valor_25 = 0
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.s_valor_19 > l.s_valor_13
       and ind_base_ter1 = 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_21 = l.s_valor_13 - l.s_valor_19,
           l.s_valor_22 = 0,
           l.s_valor_23 = 0,
           l.s_valor_24 = 0,
           l.s_valor_25 = 0
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.s_valor_21 > (l.s_valor_13 - l.s_valor_19)
       and ind_base_ter1 = 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_23 = l.s_valor_13 - l.s_valor_19 - l.s_valor_21,
           l.s_valor_24 = 0,
           l.s_valor_25 = 0
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.s_valor_23 > (l.s_valor_13 - l.s_valor_19 - l.s_valor_21)
       and ind_base_ter1 = 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_25 = l.s_valor_13 - l.s_valor_19 - l.s_valor_21 -
                          l.s_valor_23
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.s_valor_25 >
           (l.s_valor_13 - l.s_valor_19 - l.s_valor_21 - l.s_valor_23)
       and ind_base_ter1 = 1
       and l.ind_proceso = 1;

    -- calcular valor operador contravencional con impuestos
    update recaudo_externo_liquidacion l
       set (l.s_valor_11) = l.s_valor_11 + l.s_valor_14 / 2 - l.s_valor_30 -
                            l.s_valor_16
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    -- calcular valor fcm contravencional con impuestos
    update recaudo_externo_liquidacion l
       set (l.s_valor_12) = l.s_valor_12 + l.s_valor_14 / 2 + l.s_valor_30 +
                            l.s_valor_16
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    -- ajusta a dos decimales
    update recaudo_externo_liquidacion l
       set l.s_valor_0  = ROUND(l.s_valor_0, 2),
           l.s_valor_1  = ROUND(l.s_valor_1, 2),
           l.s_valor_2  = ROUND(l.s_valor_2, 2),
           l.s_valor_3  = ROUND(l.s_valor_3, 2),
           l.s_valor_4  = ROUND(l.s_valor_4, 2),
           l.s_valor_5  = ROUND(l.s_valor_5, 2),
           l.s_valor_6  = ROUND(l.s_valor_6, 2),
           l.s_valor_7  = ROUND(l.s_valor_7, 2),
           l.s_valor_8  = ROUND(l.s_valor_8, 2),
           l.s_valor_9  = ROUND(l.s_valor_9, 2),
           l.s_valor_10 = ROUND(l.s_valor_10, 2),
           l.s_valor_11 = ROUND(l.s_valor_11, 2),
           l.s_valor_12 = ROUND(l.s_valor_12, 2),
           l.s_valor_13 = ROUND(l.s_valor_13, 2),
           l.s_valor_14 = ROUND(l.s_valor_14, 2),
           l.s_valor_15 = ROUND(l.s_valor_15, 2),
           l.s_valor_16 = ROUND(l.s_valor_16, 2),
           l.s_valor_17 = ROUND(l.s_valor_17, 2),
           l.s_valor_18 = ROUND(l.s_valor_18, 2),
           l.s_valor_19 = ROUND(l.s_valor_19, 2),
           l.s_valor_20 = ROUND(l.s_valor_20, 2),
           l.s_valor_21 = ROUND(l.s_valor_21, 2),
           l.s_valor_22 = ROUND(l.s_valor_22, 2),
           l.s_valor_23 = ROUND(l.s_valor_23, 2),
           l.s_valor_24 = ROUND(l.s_valor_24, 2),
           l.s_valor_25 = ROUND(l.s_valor_25, 2)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    --ajuste simit capital
    update recaudo_externo_capital l
       set s_valor_5 = 0, s_valor_6 = 0, s_valor_4 = s_valor_2 - s_valor_3
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.id_concesionario_liq = '05'
       and l.ind_proceso = 1;

    -- calcula netos
    update recaudo_externo_liquidacion l
       set l.s_valor_26 = l.s_valor_13 - l.s_valor_19 - l.s_valor_21 -
                          l.s_valor_23 - l.s_valor_25 + l.s_valor_17 +
                          l.valor_adicional,
           l.s_valor_27 = l.s_valor_11 + l.s_valor_14 - l.s_valor_15 -
                          l.s_valor_16 - l.s_valor_17,
           l.s_valor_28 = l.s_valor_4 - l.s_valor_0,
           l.s_valor_29 = l.s_valor_12 + l.s_valor_15 + l.s_valor_16
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    -- ajusta decimales

    update recaudo_externo_liquidacion l
       set l.s_valor_6 = (case
                           when l.s_valor_7 = 0.0 then
                            l.valor_total - l.s_valor_3 - l.s_valor_4 -
                            l.s_valor_5 - l.s_valor_10 - l.s_valor_11 -
                            l.s_valor_12 - l.s_valor_26 - l.s_valor_19 -
                            l.s_valor_21 - l.s_valor_23 - l.s_valor_25
                           else
                            l.s_valor_6
                         end),
           l.s_valor_7 = (case
                           when l.s_valor_7 <> 0.0 then
                            l.s_valor_1 - l.s_valor_3 - l.s_valor_4 -
                            l.s_valor_5 - l.s_valor_8
                           else
                            l.s_valor_7
                         end)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    ------------------------------------ POLCA -----------------------------------------------
    -- calcular simit base
    update recaudo_externo_liquidacion l
       set p_valor_1 = valor_total - valor_adicional,
           p_valor_2 =
           (valor_total - valor_adicional) / 10
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- ajustar simit base para cumplir ley
    update recaudo_externo_liquidacion l
       set p_valor_2 = (case
                         when p_valor_2 < smdlv and p_valor_1 >= smdlv and
                              indretroactividad = 0 then
                          smdlv
                         when p_valor_2 < smdlv and p_valor_1 < smdlv and
                              indretroactividad = 0 then
                          p_valor_1
                         when p_valor_2 < smdlv and p_valor_1 >= smdlv and
                              indretroactividad = 1 and indfecha2002 = 0 then
                          smdlv
                         when p_valor_2 < smdlv and p_valor_1 < smdlv and
                              indretroactividad = 1 and indfecha2002 = 0 then
                          p_valor_1
                         else
                          p_valor_2
                       end)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- calcular valor simit, concesionario liquidador, fondo concesionario, fondo simit, equilibrio,  valor simit, sevial, equilibrio, base polca, base ot
    update recaudo_externo_liquidacion l
       set (l.p_valor_3,
            l.p_valor_4,
            l.p_valor_5,
            l.p_valor_6,
            l.p_valor_7,
            l.p_valor_8,
            l.p_valor_9,
            l.p_valor_10,
            l.p_valor_11,
            l.p_valor_21) =
           (select l.p_valor_2 * (p.simit_pm / 10),
                   l.p_valor_2 * (p.concesionario_pm / 10),
                   l.p_valor_2 * (p.fondo_cob_concesionario_pm / 10),
                   l.p_valor_2 * (p.fondo_cob_simit_pm / 10),
                   l.p_valor_2 * (p.equilibrio_economico_pm / 10),
                   l.p_valor_2 * (p.simit_pp / 10),
                   l.p_valor_2 * (p.sevial_pp / 10),
                   l.p_valor_2 * (p.equilibrio_economico_pp / 10),
                   (l.p_valor_1 - l.p_valor_2) / 2,
                   (l.p_valor_1 - l.p_valor_2) / 2
              from p_dispersion_concesionario p
             where p.idconcesionario = l.id_concesionario_liq)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- calcular valor polca, fcm polca, sevial polca y equilibrio polca
    update recaudo_externo_liquidacion l
       set (l.p_valor_12, l.p_valor_13, l.p_valor_14, l.p_valor_15) =
           (select l.p_valor_11 * (p.polca_cp / 45),
                   l.p_valor_11 * (p.fcm_cp / 45),
                   l.p_valor_11 * (p.sevial_cp / 45),
                   l.p_valor_11 * (p.equilibrio_economico_cp / 45)
              from p_dispersion_concesionario p, fcm
             where p.idconcesionario = l.id_concesionario_liq)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- calcular impuestos por convenio polca
    update recaudo_externo_liquidacion l
       set (l.p_valor_16, --iva del 1.8
            l.p_valor_17, -- timbre del 1.8
            l.p_valor_18, -- iva del 2,7
            l.p_valor_19, -- retencion 2,7
            l.p_valor_20) = -- simbre 2,7
           (select ((l.p_valor_13 + l.p_valor_15) * fcm.iva_fcm / (100 + fcm.iva_fcm )),
                   (l.p_valor_13 + l.p_valor_14 + l.p_valor_15) *    fcm.impuesto_timbre_fcm / 100,
                   l.p_valor_14 * fcm.iva / (100 + fcm.iva),
                   (l.p_valor_14 * 100/ (100 + fcm.iva) )* fcm.retencion_fuente / 100,
                   (l.p_valor_14 * 100/ (100 + fcm.iva) )* fcm.impuesto_timbre_tercero / 100
              from fcm)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- calcular VSevial27 con impuestos
    update recaudo_externo_liquidacion l
       set l.p_valor_14 = p_valor_14 - p_valor_20 - p_valor_19 -- - p_valor_18
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;


    /*    -- actualizar Valor FCM con equilibrio pra simit capital
    update recaudo_externo_liquidacion l
       set l.p_valor_13 = l.p_valor_15
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.id_concesionario_liq = 5
       and l.ind_proceso = 1;*/

    -- calcular VFCM18 con impuestos
    update recaudo_externo_liquidacion l
       set l.p_valor_13 = p_valor_13 + p_valor_20 + p_valor_19 -- - p_valor_16
    --  p_valor_13 + p_valor_20 + p_valor_19 + p_valor_16
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;



    -- calcular base contravencional

    update recaudo_externo_liquidacion l
       set (l.p_valor_22) =
           (select l.p_valor_21 *
                   ((p.fcm_contravencional_p + p.conces_contravencional_p) / 100) / 0.45
              from p_dispersion_municipio P
             where l.idmunicipio = p.idmunicipio)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.validador_fecha = '000'
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set (l.p_valor_22) =
           (select l.p_valor_21 *
                   ((v.p_fcm_contravencional + v.p_conces_contravencional) / 100) / 0.45
              from validador_fecha v
             where v.idmunicipio = l.idmunicipio
               and v.idValidador = l.validador_fecha
               and v.indtipo = 'POLCA')
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.validador_fecha <> '000'
       and l.ind_proceso = 1;

    -- calcular valor operador contravencional
    update recaudo_externo_liquidacion l
       set (l.p_valor_24) =
           (select l.p_valor_21 * ((p.conces_contravencional_p) / 100) / 0.45
              from p_dispersion_municipio p
             where p.idmunicipio = l.idmunicipio)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set (l.p_valor_24) =
           (select l.p_valor_21 * ((v.p_conces_contravencional) / 100) / 0.45
              from validador_fecha v
             where v.idmunicipio = l.idmunicipio
               and v.idValidador = l.validador_fecha
               and v.indtipo = 'POLCA')
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.validador_fecha <> '000'
       and l.ind_proceso = 1;

    -- calcular valor fcm contravencional
    update recaudo_externo_liquidacion l
       set (l.p_valor_25) = l.p_valor_22 - l.p_valor_24
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- calcular acuerdo de pago
    update recaudo_externo_liquidacion l
       set (l.p_valor_23) =
           (select (l.p_valor_21) * (p.acuerdopago_p / 100) / 0.45
              from p_dispersion_municipio p
             where p.idmunicipio = l.idmunicipio)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set (l.p_valor_23) =
           (select (l.p_valor_21) * (v.p_acuerdopago / 100) / 0.45
              from validador_fecha v
             where v.idmunicipio = l.idmunicipio
               and v.idValidador = l.validador_fecha
               and v.indtipo = 'POLCA')
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.validador_fecha <> '000'
       and l.ind_proceso = 1;

    /* cambio autorizado por edwin pena 28/may/2008
        -- calcular base contravencional y acuerdo de pago
        update recaudo_externo_liquidacion l
           set (l.p_valor_22, l.p_valor_23) = (select l.p_valor_1 *
                                                      (p.fcm_contravencional_p +
                                                      p.conces_contravencional_p) / 100,
                                                      l.p_valor_1 *
                                                      p.acuerdopago_p / 100
                                                 from p_dispersion_municipio p
                                                where p.idmunicipio =
                                                      l.idmunicipio)
         where fec_corte >= w_fec_cor_ini
           and fec_corte <= w_fec_cor_fin
           and l.indtipo = 'POLCA'
           and l.ind_proceso = 1;

        -- calcula acuerdo pago, contrav concesionario y contrav fcm
        update recaudo_externo_liquidacion l
           set l.p_valor_23 = (case when p_valor_22 <> 0.0 and p_valor_21 <= p_valor_22 then 0.0 else p_valor_23 end),
               l.p_valor_24 = (case when p_valor_22 <> 0.0 and p_valor_21 > p_valor_22 then p_valor_22 / 2 when p_valor_22 <> 0.0 and p_valor_21 <= p_valor_22 then p_valor_21 / 2 else 0.0 end),
               l.p_valor_25 = (case when p_valor_22 <> 0.0 and p_valor_21 > p_valor_22 then p_valor_22 / 2 when p_valor_22 <> 0.0 and p_valor_21 <= p_valor_22 then p_valor_21 / 2 else 0.0 end)
         where fec_corte >= w_fec_cor_ini
           and fec_corte <= w_fec_cor_fin
           and l.indtipo = 'POLCA'
           and l.ind_proceso = 1;

    */

    -- calcula base municipos sin impuestos
    update recaudo_externo_liquidacion l
       set l.p_valor_26 = l.p_valor_21 - p_valor_23 - p_valor_24 -
                          p_valor_25
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- calula base municipio, iva contravencional, timbre contravencional, retefuente contravencional, reteica contravencional
    -- esto si el valor del municipio cubre el iva por contravencional
    update recaudo_externo_liquidacion l
       set (l.p_valor_26,
            l.p_valor_27,
            l.p_valor_28,
            l.p_valor_29,
            l.p_valor_30,
            p_valor_44) =
           (select l.p_valor_21 - l.p_valor_23 - l.p_valor_24 - l.p_valor_25 -
                   ((l.p_valor_24 + l.p_valor_25) * fcm.iva / 100),

                   (l.p_valor_24 + l.p_valor_25) * (fcm.iva / 100),

                   (l.p_valor_24 + l.p_valor_25) * (0 / 100), -- timbre contravencional en 0.0 debe ser fcm.impuesto_timbre_fcm

                   (l.p_valor_24) * (fcm.retencion_fuente / 100),

                   (l.p_valor_24 + l.p_valor_25) * (fcm.iva / 100) *
                   (fcm.reteiva / 100), -- reteiva 50%

                   (l.p_valor_24) * (0 / 100) --timbre concesionario contravencional en 0 debe ser fcm.impuesto_timbre_tercero

              from fcm) --- Registro Unico
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.p_valor_26 > 0
       and l.ind_proceso = 1;

    -- calula base municipio, iva contravencional, timbre contravencional, retefuente contravencional, reteica contravencional
    -- esto si el valor del municipio es o, se descuenta impuestos de acuerdo
    update recaudo_externo_liquidacion l
       set (l.p_valor_23,
            l.p_valor_27,
            l.p_valor_28,
            l.p_valor_29,
            l.p_valor_30,
            p_valor_44) =
           (select l.p_valor_23 -
                   ((l.p_valor_24 + l.p_valor_25) * fcm.iva / 100),

                   (l.p_valor_24 + l.p_valor_25) * (fcm.iva / 100),

                   (l.p_valor_24 + l.p_valor_25) * (0 / 100), -- timbre contravencional en 0.0 debe ser fcm.impuesto_timbre_fcm

                   (l.p_valor_24) * (fcm.retencion_fuente / 100),

                   (l.p_valor_24 + l.p_valor_25) * (fcm.iva / 100) *
                   (fcm.reteiva / 100), -- reteiva 50%

                   (l.p_valor_24) * (0 / 100) --timbre concesionario contravencional en 0 debe ser fcm.impuesto_timbre_tercero

              from fcm) --- Registro Unico
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.p_valor_26 = 0
       and l.ind_proceso = 1;

    -- para terceros con base de liquidacion el recaudo calcular y descontar el valor de ot
    update recaudo_externo_liquidacion l
       set l.p_valor_26 = l.p_valor_26 - (p_valor_1 * por_base_ter1) / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter1 = 3
       and l.p_valor_26 > (p_valor_1 * por_base_ter1) / 100
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.p_valor_26 = l.p_valor_26 - (p_valor_1 * por_base_ter2) / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter2 = 3
       and l.p_valor_26 > (p_valor_1 * por_base_ter2) / 100
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.p_valor_26 = l.p_valor_26 - (p_valor_1 * por_base_ter3) / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter3 = 3
       and l.p_valor_26 > (p_valor_1 * por_base_ter3) / 100
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.p_valor_26 = l.p_valor_26 - (p_valor_1 * por_base_ter4) / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter4 = 3
       and l.p_valor_26 > (p_valor_1 * por_base_ter4) / 100
       and l.ind_proceso = 1;

    -- calcula base para cada tercero
    update recaudo_externo_liquidacion l
       set l.p_valor_31 = (case
                            when ind_base_ter1 = 1 then
                             p_valor_21
                            when ind_base_ter1 = 2 then
                             valor_adicional
                            when ind_base_ter1 = 3 then
                             valor_total - valor_adicional
                            when ind_base_ter1 = 4 then
                             p_valor_26
                            else
                             0.0
                          end),
           l.p_valor_33 = (case
                            when ind_base_ter2 = 1 then
                             p_valor_21
                            when ind_base_ter2 = 2 then
                             valor_adicional
                            when ind_base_ter2 = 3 then
                             valor_total - valor_adicional
                            when ind_base_ter2 = 4 then
                             p_valor_26
                            else
                             0.0
                          end),
           l.p_valor_35 = (case
                            when ind_base_ter3 = 1 then
                             p_valor_21
                            when ind_base_ter3 = 2 then
                             valor_adicional
                            when ind_base_ter3 = 3 then
                             valor_total - valor_adicional
                            when ind_base_ter3 = 4 then
                             p_valor_26
                            else
                             0.0
                          end),
           l.p_valor_37 = (case
                            when ind_base_ter1 = 1 then
                             p_valor_21
                            when ind_base_ter3 = 2 then
                             valor_adicional
                            when ind_base_ter3 = 3 then
                             valor_total - valor_adicional
                            when ind_base_ter3 = 4 then
                             p_valor_26
                            else
                             0.0
                          end)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    commit;

    -- calcula valor para cada tercero
    update recaudo_externo_liquidacion l
       set l.p_valor_32 = l.p_valor_31 * por_base_ter1 / 45
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter1 = 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.p_valor_34 = l.p_valor_33 * por_base_ter2 / 45
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter2 = 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.p_valor_36 = l.p_valor_35 * por_base_ter3 / 45
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter3 = 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.p_valor_38 = l.p_valor_37 * por_base_ter4 / 45
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter4 = 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.p_valor_32 = l.p_valor_31 * por_base_ter1 / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter1 <> 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.p_valor_34 = l.p_valor_33 * por_base_ter2 / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter2 <> 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.p_valor_36 = l.p_valor_35 * por_base_ter3 / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter3 <> 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.p_valor_38 = l.p_valor_37 * por_base_ter4 / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter4 <> 1
       and l.ind_proceso = 1;

    -- calula base municipio
    update recaudo_externo_liquidacion l
       set (l.p_valor_26) =
           (select l.p_valor_21 - l.p_valor_23 - l.p_valor_24 - l.p_valor_25 -
                   ((l.p_valor_24 + l.p_valor_25) * fcm.iva / 100)
              from fcm) --- Registro Unico
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- verificar que no sea mayor al ot
    update recaudo_externo_liquidacion l
       set p_valor_32   = p_valor_26,
           l.p_valor_33 = 0,
           l.p_valor_34 = 0,
           l.p_valor_35 = 0,
           l.p_valor_36 = 0,
           l.p_valor_37 = 0,
           l.p_valor_39 = 0
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and p_valor_32 > p_valor_26
       and ind_base_ter1 = 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set p_valor_34   = p_valor_26 - p_valor_32,
           l.p_valor_35 = 0,
           l.p_valor_36 = 0,
           l.p_valor_37 = 0,
           l.p_valor_39 = 0
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and p_valor_34 > (p_valor_26 - p_valor_32)
       and ind_base_ter1 = 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set p_valor_36   = p_valor_26 - p_valor_32 - p_valor_34,
           l.p_valor_37 = 0,
           l.p_valor_39 = 0
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and p_valor_36 > (p_valor_26 - p_valor_32 - p_valor_34)
       and ind_base_ter1 = 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set p_valor_38 = p_valor_26 - p_valor_32 - p_valor_34 - p_valor_36
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and p_valor_38 > (p_valor_26 - p_valor_32 - p_valor_34 - p_valor_36)
       and ind_base_ter1 = 1
       and l.ind_proceso = 1;

    -- calcular valor operador contravencional con impuestos
    update recaudo_externo_liquidacion l
       set (l.p_valor_24) = l.p_valor_24 + l.p_valor_27 / 2 - l.p_valor_44 -
                            l.p_valor_29
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- calcular valor fcm contravencional con impuestos
    update recaudo_externo_liquidacion l
       set (l.p_valor_25) = l.p_valor_25 + l.p_valor_27 / 2 + l.p_valor_44 +
                            l.p_valor_29
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- ajusta a dos decimales
    update recaudo_externo_liquidacion l
       set l.s_valor_0  = ROUND(l.s_valor_0, 2),
           l.p_valor_1  = ROUND(l.p_valor_1, 2),
           l.p_valor_2  = ROUND(l.p_valor_2, 2),
           l.p_valor_3  = ROUND(l.p_valor_3, 2),
           l.p_valor_4  = ROUND(l.p_valor_4, 2),
           l.p_valor_5  = ROUND(l.p_valor_5, 2),
           l.p_valor_6  = ROUND(l.p_valor_6, 2),
           l.p_valor_7  = ROUND(l.p_valor_7, 2),
           l.p_valor_8  = ROUND(l.p_valor_8, 2),
           l.p_valor_9  = ROUND(l.p_valor_9, 2),
           l.p_valor_10 = ROUND(l.p_valor_10, 2),
           l.p_valor_11 = ROUND(l.p_valor_11, 2),
           l.p_valor_12 = ROUND(l.p_valor_12, 2),
           l.p_valor_13 = ROUND(l.p_valor_13, 2),
           l.p_valor_14 = ROUND(l.p_valor_14, 2),
           l.p_valor_15 = ROUND(l.p_valor_15, 2),
           l.p_valor_16 = ROUND(l.p_valor_16, 2),
           l.p_valor_17 = ROUND(l.p_valor_17, 2),
           l.p_valor_18 = ROUND(l.p_valor_18, 2),
           l.p_valor_19 = ROUND(l.p_valor_19, 2),
           l.p_valor_20 = ROUND(l.p_valor_20, 2),
           l.p_valor_21 = ROUND(l.p_valor_21, 2),
           l.p_valor_22 = ROUND(l.p_valor_22, 2),
           l.p_valor_23 = ROUND(l.p_valor_23, 2),
           l.p_valor_24 = ROUND(l.p_valor_24, 2),
           l.p_valor_25 = ROUND(l.p_valor_25, 2),
           l.p_valor_26 = ROUND(l.p_valor_26, 2),
           l.p_valor_27 = ROUND(l.p_valor_27, 2),
           l.p_valor_28 = ROUND(l.p_valor_28, 2),
           l.p_valor_29 = ROUND(l.p_valor_29, 2),
           l.p_valor_30 = ROUND(l.p_valor_30, 2),
           l.p_valor_31 = ROUND(l.p_valor_31, 2),
           l.p_valor_32 = ROUND(l.p_valor_32, 2),
           l.p_valor_33 = ROUND(l.p_valor_33, 2),
           l.p_valor_34 = ROUND(l.p_valor_34, 2),
           l.p_valor_35 = ROUND(l.p_valor_35, 2),
           l.p_valor_36 = ROUND(l.p_valor_36, 2),
           l.p_valor_37 = ROUND(l.p_valor_37, 2),
           l.p_valor_38 = ROUND(l.p_valor_38, 2)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- calcula netos
    update recaudo_externo_liquidacion l
       set l.p_valor_39 = l.p_valor_26 - l.p_valor_32 - l.p_valor_34 - -- VAlor neto municipio
                          l.p_valor_36 - l.p_valor_38 + l.p_valor_30 +
                          valor_adicional,
           l.p_valor_40 = l.p_valor_24 + l.p_valor_27 - l.p_valor_28 - -- valor oncesionario zonal
                          l.p_valor_29 - l.p_valor_30,
           l.p_valor_41 = l.p_valor_4 - l.s_valor_0, -- valor concesionario liquidador
           l.p_valor_42 = l.p_valor_25 + l.p_valor_28 + l.p_valor_29 + -- valor neto fcm
                          l.p_valor_19 + l.p_valor_20 + l.p_valor_16 +
                          l.p_valor_13,
           l.p_valor_43 = l.p_valor_9 + l.p_valor_14 + l.p_valor_18 -  -- valor neto sevil
                          l.p_valor_19 - l.p_valor_20 -- - l.p_valor_16
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- ajusta decimales hugo 20 sep 2016
    /*    update recaudo_externo_liquidacion l
      set l.p_valor_6 = l.p_valor_1 + l.valor_adicional - l.p_valor_3 -
                        l.p_valor_4 - l.p_valor_5 - l.p_valor_8 -
                        decode(l.id_concesionario_liq, 5, 0, l.p_valor_7) -
                        decode(l.id_concesionario_liq, 5, l.p_valor_7, 0) -
                        l.p_valor_9 - l.p_valor_10 - l.p_valor_13 -
                        l.p_valor_14 - l.p_valor_12 + l.p_valor_18 +
                        l.p_valor_16 - l.p_valor_24 - l.p_valor_25 -
                        l.p_valor_23 - l.p_valor_32 - l.p_valor_34 -
                        l.p_valor_36 - l.p_valor_39
    where fec_corte >= w_fec_cor_ini
      and fec_corte <= w_fec_cor_fin
      and l.indtipo = 'POLCA'
      and l.p_valor_7 = 0.0
      and l.ind_proceso = 1;*/


/*    update recaudo_externo_liquidacion l
       set l.p_valor_13 = l.p_valor_1 + l.valor_adicional - l.p_valor_3 -
                          l.p_valor_4 - l.p_valor_5 - l.p_valor_6 -
                          l.p_valor_8 -
                          decode(l.id_concesionario_liq, 5, 0, l.p_valor_7) -
                          decode(l.id_concesionario_liq, 5, l.p_valor_7, 0) -
                          l.p_valor_9 - l.p_valor_10 - l.p_valor_14 -
                          l.p_valor_12 + l.p_valor_18 - l.p_valor_16 - --aca se resta iva al 4,5
                          l.p_valor_24 - l.p_valor_25 - l.p_valor_23 -
                          l.p_valor_32 - l.p_valor_34 - l.p_valor_36 -
                          l.p_valor_39
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
    --  and l.p_valor_7 <> 0.0
       and l.ind_proceso = 1;*/

    --ajuste simit capital
    update recaudo_externo_capital l
       set p_valor_5 = 0, p_valor_6 = 0, p_valor_4 = p_valor_2 - p_valor_9
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.id_concesionario_liq = '05'
       and l.ind_proceso = 1;

    ------------------------------------------------------------------------------------------

    update recaudo_externo_liquidacion l
       set l.fec_dispersion_con = fn_fec_dispersion(w_fec_cor_ini,
                                                    0,
                                                    3,
                                                    p_usuario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1;

    -- actualiza fecha dispersion municipio a inicio de mes
    -- para municipios no especiales y de recaudo pse
    update recaudo_externo_liquidacion l
       set l.fec_dispersion = fn_fec_dispersion(w_fec_cor_ini,
                                                0,
                                                3,
                                                p_usuario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.cta_recaudo = '059007559'
       and l.idmunicipio not in
           (select distinct idmunicipio
              from dias_dispersion t
             where idbanco = '52'
               and frec_dispersion_se <> 0)
       and l.ind_proceso = 1;

    -- actualiza cuenta municipio
    update recaudo_externo_liquidacion l
       set (l.nit_municipio, l.idbancomun, l.tipocuentamun, l.ctamun) =
           (select m.nit_cta, m.idbanco, m.tipocuenta, m.cuenta
              from municipio m
             where m.idmunicipio = l.idmunicipio)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1;

    -- actualiza nit de metrotransito
    update recaudo_externo_liquidacion l
       set (l.nit_municipio, l.idbancomun, l.tipocuentamun, l.ctamun) =
           (select m.nit_cta, m.idbanco, m.tipocuenta, m.cuenta
              from municipio m
             where m.idmunicipio = '08001001')
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1
       and l.validador_fecha in ('001', '002', '003', '004')
       and l.idmunicipio = '08001000';

    -- actualiza nit de dpat atlantico
    update recaudo_externo_liquidacion l
       set (l.nit_municipio, l.idbancomun, l.tipocuentamun, l.ctamun) =
           (select m.nit_cta, m.idbanco, m.tipocuenta, m.cuenta
              from municipio m
             where m.idmunicipio = '08000000')
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1
       and l.validador_fecha in ('005', '006', '007', '008')
       and l.idmunicipio in ('08573000', '08296000');

    -- actualiza nit BANCO Concesionario
    update recaudo_externo_liquidacion l
       set l.nit_concesionario =
           (select nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = l.id_concesionario_liq
               and c.idconcepto = 1
               and c.idbancorec = l.idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1;

    -- actualiza nit fondo cobertura concesioanrio
    update recaudo_externo_liquidacion l
       set l.nit_fondo =
           (select nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = l.id_concesionario_liq
               and c.idconcepto = 2
               and c.idbancorec = l.idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1;

    -- actualiza nit contravencional
    update recaudo_externo_liquidacion l
       set l.nit_concesionariozon =
           (select nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = l.id_concesionario_pro
               and c.idconcepto = 3
               and c.idbancorec = l.idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1;

/*    update recaudo_externo_liquidacion r
       set (nit_tercero1, nit_tercero2, nit_tercero3, nit_tercero4) =
           (select '0000000000', '0000000000', '0000000000', '0000000000'
              from dual)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and r.ind_proceso = 1;*/

 /*   update recaudo_externo_liquidacion r
       set nit_tercero1 =
           (select nit_t
              from tercero t
             where t.idmunicipio = r.idmunicipio
               and t.num_tercero = 1)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and r.ind_base_ter1 > 0
       and r.ind_proceso = 1;

    update recaudo_externo_liquidacion r
       set nit_tercero2 =
           (select nit_t
              from tercero t
             where t.idmunicipio = r.idmunicipio
               and t.num_tercero = 2)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and r.ind_base_ter2 > 0
       and r.ind_proceso = 1;

    update recaudo_externo_liquidacion r
       set nit_tercero3 =
           (select nit_t
              from tercero t
             where t.idmunicipio = r.idmunicipio
               and t.num_tercero = 3)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and r.ind_base_ter3 > 0
       and r.ind_proceso = 1;

    update recaudo_externo_liquidacion r
       set nit_tercero4 =
           (select nit_t
              from tercero t
             where t.idmunicipio = r.idmunicipio
               and t.num_tercero = 4)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and r.ind_base_ter4 > 0
       and r.ind_proceso = 1;
*/
    update recaudo_externo_liquidacion l
       set l.s_valor_5 = round((l.s_valor_5 + l.s_valor_6) -
                               (l.s_valor_5 + l.s_valor_6) / 2,
                               2),
           l.s_valor_6 =
           (l.s_valor_5 + l.s_valor_6) -
           round((l.s_valor_5 + l.s_valor_6) -
                 (l.s_valor_5 + l.s_valor_6) / 2,
                 2)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and ind_proceso = 1
       and abs(l.s_valor_5 - l.s_valor_6) > 0.01;

    /*  hugo 20 sep
    update recaudo_externo_liquidacion l
         set l.p_valor_5 = round((l.p_valor_5 + l.p_valor_6) -
                                 (l.p_valor_5 + l.p_valor_6) / 2,
                                 2),
             l.p_valor_6 =
             (l.p_valor_5 + l.p_valor_6) -
             round((l.p_valor_5 + l.p_valor_6) -
                   (l.p_valor_5 + l.p_valor_6) / 2,
                   2)
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and abs(l.p_valor_5 - l.p_valor_6) > 0.01;*/

    update recaudo_externo_liquidacion l
       set l.s_valor_5 = l.s_valor_5 - 0.01,
           l.s_valor_6 = l.s_valor_6 + 0.01
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and ind_proceso = 1
       and (l.s_valor_5 - l.s_valor_6) = 0.02;

    update recaudo_externo_liquidacion l
       set l.s_valor_6 = l.s_valor_6 - 0.01,
           l.s_valor_5 = l.s_valor_5 + 0.01
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and ind_proceso = 1
       and (l.s_valor_6 - l.s_valor_5) = 0.02;

    update recaudo_externo_liquidacion l
       set l.s_valor_6 = l.s_valor_5, l.s_valor_5 = l.s_valor_6
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and ind_proceso = 1
       and (l.s_valor_5 - l.s_valor_6) = 0.01;
    /* hugo c 20 sep
    update recaudo_externo_liquidacion l
       set l.p_valor_5 = l.p_valor_5 - 0.01,
           l.p_valor_6 = l.p_valor_6 + 0.01
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and ind_proceso = 1
       and (l.p_valor_5 - l.p_valor_6) = 0.02;

    update recaudo_externo_liquidacion l
       set l.p_valor_6 = l.p_valor_6 - 0.01,
           l.p_valor_5 = l.p_valor_5 + 0.01
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and ind_proceso = 1
       and (l.p_valor_6 - l.p_valor_5) = 0.02;

    update recaudo_externo_liquidacion l
       set l.p_valor_6 = l.p_valor_5, l.p_valor_5 = l.p_valor_6
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and ind_proceso = 1
       and (l.p_valor_5 - l.p_valor_6) = 0.01;*/

    update RECAUDO_EXTERNO_LIQUIDACION r
       set r.s_valor_4 = r.s_valor_4 + r.s_valor_5, r.s_valor_5 = 0
     where fec_corte = w_fec_cor_ini
       and (r.s_valor_5 < 1);

    update RECAUDO_EXTERNO_LIQUIDACION r
       set r.s_valor_4 = r.s_valor_4 + r.s_valor_6, r.s_valor_6 = 0
     where fec_corte = w_fec_cor_ini
       and (r.s_valor_6 < 1);

    /*  hugo 20sep 2016
    update RECAUDO_EXTERNO_LIQUIDACION r
         set r.p_valor_4 = r.p_valor_4 + r.p_valor_5, r.p_valor_5 = 0
       where fec_corte = w_fec_cor_ini
         and (r.p_valor_5 < 1);

      update RECAUDO_EXTERNO_LIQUIDACION r
         set r.p_valor_4 = r.p_valor_4 + r.p_valor_6, r.p_valor_6 = 0
       where fec_corte = w_fec_cor_ini
         and (r.p_valor_6 < 1);*/
    commit;


    pk_techo.aplicatecho_externo(w_fec_cor_ini,
                                 p_usuario,
                                 v_cod_error,
                                 v_msg_error);

    pk_techo.aplicatecho_externoSevial(w_fec_cor_ini,
                                       p_usuario,
                                       v_cod_error,
                                       v_msg_error);

    PK_CONTA_EXT.contabiliza_recaudo_externo(p_feccor_ini_ano,
                                             p_feccor_ini_mes,
                                             p_feccor_ini_dia,
                                             p_usuario,
                                             p_error);

    IF not P_ERROR is null THEN
      -- elimina liquidaciones anteriores
      delete recaudo_externo_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin;

      commit;

      return;
    END IF;

    dispersa_recaudo_externo(p_feccor_ini_ano,
                             p_feccor_ini_mes,
                             p_feccor_ini_dia,
                             p_usuario,
                             p_error);

    IF not P_ERROR is null THEN
      -- elimina liquidaciones anteriores
      delete recaudo_externo_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin;

      return;
    END IF;

    pk_techo.obtieneFondosTecho(w_fec_cor_ini,
                                p_usuario,
                                v_cod_error,
                                v_msg_error);

    select sum(r.valor_total)
      into w_vlrRecaudo
      from recaudo_externo_liquidacion r
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    select sum(d.valor)
      into w_vlrDisp
      from recaudo_externo_disp d
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_ini <= w_fec_cor_fin;

    if (abs(w_vlrRecaudo - w_vlrDisp) > 100) then
      p_error := 'Valor recaudado diferente de valor distribuido. Informar a administrador ' || to_char(w_vlrRecaudo) || ' : '|| to_char(w_vlrDisp);
/*
      delete recaudo_externo_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin;*/

      commit;

      return;
    end if;

    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_externo_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    p_error := 'Recuado Externo Liquidado OK. Registros: ' || w_registros ||
               ' : ' || p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
               p_feccor_ini_dia;

    select max(importe)
      into p_ajuste
      from recaudo_externo_contabilidad
     where textocabezera2 = 'AJUSTE PESOS'
       and fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
       and tipocontable = 'REC';

    if (p_ajuste > 100) then
      p_error := 'Recuado Externo Liquidado OK. POSIBLE ERROR DE CONTABILIDAD. FAVOR VERIFICAR.Registros: ' ||
                 w_registros || ': ' || p_feccor_ini_ano || '-' ||
                 p_feccor_ini_mes || '-' || p_feccor_ini_dia;
    end if;

    sp_envioNotificacion(grupoRecibe => 3,
                         grupoCopia  => 2,
                         asunto      => 'SDF - Proceso de distribucion del dia ' ||
                                        to_char(w_fec_cor_ini, 'yyyy-MM-dd'),
                         mensaje     => 'El sistema SDF informa que se ha ejecutado el proceso de distribucion, del dia ' ||
                                        to_char(w_fec_cor_ini, 'yyyy-MM-dd') ||
                                        '. Favor verificar y dar su visto bueno. Se genero el siguiente mensaje en el proceso de distribucion ' ||
                                        p_error,
                         p_usuario   => p_usuario);

    sp_log(p_usuario,
           'Liquida Recaudo Externo',
           p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
           p_feccor_ini_dia);

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [liquida_recaudo_externo] ' || SQLERRM,
            p_error);

  END liquida_recaudo_externo;

  PROCEDURE dispersa_recaudo_local(p_fec_ini_ano number,
                                   p_fec_ini_mes number,
                                   p_fec_ini_dia number,
                                   p_fec_fin_ano number,
                                   p_fec_fin_mes number,
                                   p_fec_fin_dia number,
                                   p_banco       varchar2,
                                   p_usuario     varchar2,
                                   p_error       OUT VARCHAR2) as

    w_fec_cor_ini date;
    w_fec_cor_fin date;
    /*w_fecmin_cor_ini date;*/
    /*w_fecmax_cor_fin date;*/
    w_registros number;

  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    IF not P_ERROR is null THEN
      return;
    END IF;

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

    delete from recaudo_local_disp
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    -- obtiene valor simit
    insert into recaudo_local_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_fin,
             fec_dispersion,
             idconcesionario,
             1, -- orden
             sum(s_valor_1),
             'Simit', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate
        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'SIMIT'
         and decode(idbanco, '52', '52', '99') = p_banco
       group by idconcesionario, fec_dispersion, idbanco, cta_recaudo;

    -- neto simit por polca
    insert into recaudo_local_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_fin,
             fec_dispersion,
             idconcesionario,
             1, -- orden
             sum(p_valor_27),
             'Simit', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate
        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'POLCA'
         and decode(idbanco, '52', '52', '99') = p_banco
       group by idconcesionario, fec_dispersion, idbanco, cta_recaudo;

    -- obtiene valor concesionario
    insert into recaudo_local_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_fin,
             fec_dispersion,
             idconcesionario,
             2, -- orden
             sum(s_valor_6),
             'Concesionario', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate
        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'SIMIT'
         and decode(idbanco, '52', '52', '99') = p_banco
       group by idconcesionario, fec_dispersion, idbanco, cta_recaudo;

    -- neto concesionario por polca
    insert into recaudo_local_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_fin,
             fec_dispersion,
             idconcesionario,
             2, -- orden
             sum(p_valor_25),
             'Concesionario', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate
        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'POLCA'
         and decode(idbanco, '52', '52', '99') = p_banco
       group by idconcesionario, fec_dispersion, idbanco, cta_recaudo;

    -- obtiene valor fondo cobertura concesionario
    insert into recaudo_local_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_fin,
             fec_dispersion,
             idconcesionario,
             3, -- orden
             sum(s_valor_3),
             'Fondo Cobertura Concesionario', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate
        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'SIMIT'
         and decode(idbanco, '52', '52', '99') = p_banco
       group by idconcesionario, fec_dispersion, idbanco, cta_recaudo;

    -- fondo cobertura concesionario
    insert into recaudo_local_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_fin,
             fec_dispersion,
             idconcesionario,
             3, -- orden
             sum(p_valor_9),
             'Fondo Cobertura Concesionario', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'POLCA'
         and decode(idbanco, '52', '52', '99') = p_banco
       group by idconcesionario, fec_dispersion, idbanco, cta_recaudo;

    -- obtiene valor fondo cobertura simit
    insert into recaudo_local_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_fin,
             fec_dispersion,
             idconcesionario,
             4, -- orden
             sum(s_valor_4),
             'Fondo Cobertura Simit', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'SIMIT'
         and decode(idbanco, '52', '52', '99') = p_banco
       group by idconcesionario, fec_dispersion, idbanco, cta_recaudo;

    -- fondo cobertura simit
    insert into recaudo_local_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_fin,
             fec_dispersion,
             idconcesionario,
             4, -- orden
             sum(p_valor_10),
             'Fondo Cobertura Simit', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'POLCA'
         and decode(idbanco, '52', '52', '99') = p_banco
       group by idconcesionario, fec_dispersion, idbanco, cta_recaudo;

    -- obtiene valor equilibrio economico
    insert into recaudo_local_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_fin,
             fec_dispersion,
             idconcesionario,
             5, -- orden
             sum(s_valor_5),
             'Equilibrio Economico', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'SIMIT'
         and decode(idbanco, '52', '52', '99') = p_banco
       group by idconcesionario, fec_dispersion, idbanco, cta_recaudo;

    -- equilibrio economico
    insert into recaudo_local_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_fin,
             fec_dispersion,
             idconcesionario,
             5, -- orden
             sum(p_valor_28),
             'Equilibrio Economico', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'POLCA'
         and decode(idbanco, '52', '52', '99') = p_banco
       group by idconcesionario, fec_dispersion, idbanco, cta_recaudo;

    -- obtiene valor SEVIAL
    insert into recaudo_local_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_fin,
             fec_dispersion,
             idconcesionario,
             6, -- orden
             sum(p_valor_24),
             'Sevial 2.7%', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'POLCA'
         and decode(idbanco, '52', '52', '99') = p_banco
       group by idconcesionario, fec_dispersion, idbanco, cta_recaudo;

    insert into recaudo_local_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_fin,
             fec_dispersion,
             idconcesionario,
             6, -- orden
             sum(p_valor_13),
             'Sevial 3% Antes de Prorroga', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_local_liquidacion l
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'POLCA'
         and l.fec_vig_fin <= to_date('2015-01-16','yyyy-mm-dd')
         and decode(idbanco, '52', '52', '99') = p_banco
       group by idconcesionario, fec_dispersion, idbanco, cta_recaudo;

    insert into recaudo_local_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_fin,
             fec_dispersion,
             idconcesionario,
             6, -- orden
             sum(p_valor_13),
             'Sevial 3% Inicio Prorroga', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_local_liquidacion l
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'POLCA'
         and l.fec_vig_ini >= to_date('2015-01-17','yyyy-mm-dd') and l.fec_vig_fin <= to_date('2017-04-16','yyyy-mm-dd')
         and decode(idbanco, '52', '52', '99') = p_banco
       group by idconcesionario, fec_dispersion, idbanco, cta_recaudo;

    insert into recaudo_local_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_fin,
             fec_dispersion,
             idconcesionario,
             6, -- orden
             sum(p_valor_13),
             'Sevial 3% Sin Contrato', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_local_liquidacion l
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'POLCA'
         and l.fec_vig_ini >= to_date('2017-04-17','yyyy-mm-dd') and l.fec_vig_fin <= to_date('2017-04-24','yyyy-mm-dd')
         and decode(idbanco, '52', '52', '99') = p_banco
       group by idconcesionario, fec_dispersion, idbanco, cta_recaudo;

    insert into recaudo_local_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_fin,
             fec_dispersion,
             idconcesionario,
             6, -- orden
             sum(p_valor_13),
             'Sevial 2.96% Contrato 2017', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_local_liquidacion l
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'POLCA'
         and l.fec_vig_ini >= to_date('2017-04-25','yyyy-mm-dd')
         and decode(idbanco, '52', '52', '99') = p_banco
       group by idconcesionario, fec_dispersion, idbanco, cta_recaudo;

    -- obtiene valor polca
    insert into recaudo_local_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_fin,
             fec_dispersion,
             idconcesionario,
             7, -- orden
             sum(p_valor_15),
             'Polca', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'POLCA'
         and decode(idbanco, '52', '52', '99') = p_banco
       group by idconcesionario, fec_dispersion, idbanco, cta_recaudo;

    -- obtiene valor FCM polca
    insert into recaudo_local_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_fin,
             fec_dispersion,
             idconcesionario,
             8, -- orden
             sum(p_valor_26),
             'FCM Polca', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'POLCA'
         and decode(idbanco, '52', '52', '99') = p_banco
       group by idconcesionario, fec_dispersion, idbanco, cta_recaudo;

    -- actualiza cuenta SIMIT_DATA simit
    update recaudo_local_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) =
           (select c.cta_disp_s_banco,
                   c.cta_disp_s_tipo_cta,
                   c.cta_disp_s_cta,
                   c.nit_fcm
              from cta_dispersion_fcm c
             where c.nit_fcm = '8000826650'
               and c.idbancorec = r.ori_idbanco)
     where r.fec_corte_ini = w_fec_cor_ini
       and r.fec_corte_fin = w_fec_cor_fin
       and r.indtipo = 'SIMIT'
       and r.concepto = 'Simit'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    update recaudo_local_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) =
           (select c.cta_disp_p_banco,
                   c.cta_disp_p_tipo_cta,
                   c.cta_disp_p_cta,
                   c.nit_fcm
              from cta_dispersion_fcm c
             where c.nit_fcm = '8000826650'
               and c.idbancorec = r.ori_idbanco)
     where r.fec_corte_ini = w_fec_cor_ini
       and r.fec_corte_fin = w_fec_cor_fin
       and r.indtipo = 'POLCA'
       and r.concepto = 'Simit'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    commit;

    -- actualiza informacion SIMIT_DATA FCM Polca
    update recaudo_local_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) =
           (select c.cta_disp_pa_banco,
                   c.cta_disp_pa_tipo_cta,
                   c.cta_disp_pa_cta,
                   c.nit_fcm
              from cta_dispersion_fcm c
             where c.nit_fcm = '8000826650'
               and c.idbancorec = r.ori_idbanco)
     where r.fec_corte_ini = w_fec_cor_ini
       and r.fec_corte_fin = w_fec_cor_fin
       and r.indtipo = 'POLCA'
       and r.concepto = 'FCM Polca'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    -- actualiza cuenta SIMIT_DATA Concesionario
    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.idconcesionario
               and c.idconcepto = 9
               and r.ori_idbanco <> '52'
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and concepto = 'Concesionario'
       and indtipo = 'SIMIT'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.idconcesionario
               and c.idconcepto = 10
               and r.ori_idbanco <> '52'
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and concepto = 'Concesionario'
       and indtipo = 'POLCA'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    update recaudo_local_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) =
           (select c.idbanco, c.tipocuenta, c.cuenta, c.nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.idconcesionario
               and c.idconcepto = 7
               and r.ori_idbanco = '52'
               and c.idbancorec = r.ori_idbanco)
     where r.fec_corte_ini = w_fec_cor_ini
       and r.fec_corte_fin = w_fec_cor_fin
       and r.concepto = 'Concesionario'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.idconcesionario
               and c.idconcepto = 5
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and indtipo = 'POLCA'
       and idconcesionario = '03'
       and concepto = 'Concesionario'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    -- actualiza cuenta SIMIT_DATA Fondo Cobertura
    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.idconcesionario
               and c.idconcepto = 2
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and concepto = 'Fondo Cobertura Concesionario'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    -- actualiza cuenta SIMIT_DATA Fondo Cobertura simit
    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.idconcesionario
               and c.idconcepto = 2
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and concepto = 'Fondo Cobertura Simit'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    -- actualiza cuenta SIMIT_DATA Equilibrio
    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.idconcesionario
               and c.idconcepto = 2
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Equilibrio Economico'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    -- actualiza cuenta SIMIT_DATA Sevial
    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.idconcesionario
               and c.idconcepto = 5
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Sevial 2.7%'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.idconcesionario
               and c.idconcepto = 5
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto in ( 'Sevial 3% Antes de Prorroga', 'Sevial 2.96% Contrato 2017')
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select c.cta_disp_pa_banco,
                   c.cta_disp_pa_tipo_cta,
                   c.cta_disp_pa_cta,
                   c.nit_fcm
              from cta_dispersion_fcm c
             where c.nit_fcm = '8000826650'
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Sevial 3% Sin Contrato'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select c.idbanco,
                   c.tipoCta,
                   c.numCta,
                   c.numIde
              from fondocont c
            )
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Sevial 3% Inicio Prorroga'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    -- actualiza cuenta SIMIT_DATA POLCA
    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.idconcesionario
               and c.idconcepto = 6
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Polca'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    -- actualiza el tipo de cuenta origen
    update recaudo_local_disp r
       set r.ori_tipocuenta =
           (select c.tipocuenta
              from cta_recaudo_fcm c
             where c.cuenta = r.ori_cuenta
               and c.idbanco = r.ori_idbanco)
     where r.fec_corte_ini = w_fec_cor_ini
       and r.fec_corte_fin = w_fec_cor_fin
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    delete from recaudo_local_disp
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and decode(ori_idbanco, '52', '52', '99') = p_banco
       and valor = 0;

    -- ajusta nombre conceptos
    update recaudo_local_disp r
       set r.concepto = 'Liquidacion FCM'
     where r.concepto = 'Simit'
       and fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    update recaudo_local_disp r
       set r.concepto =
           (select 'Fondo Cobertura FCM -' || ' ' || c.nombre
              from concesionario c
             where c.idconcesionario = r.idconcesionario)
     where r.concepto = 'Fondo Cobertura Simit'
       and fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    update recaudo_local_disp r
       set r.concepto =
           (select 'Fondo Cobertura' || ' ' || c.nombre
              from concesionario c
             where c.idconcesionario = r.idconcesionario)
     where r.concepto = 'Fondo Cobertura Concesionario'
       and fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    update recaudo_local_disp r
       set r.concepto =
           (select 'Equilibrio Economico -' || ' ' || c.nombre
              from concesionario c
             where c.idconcesionario = r.idconcesionario)
     where r.concepto = 'Equilibrio Economico'
       and fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    update recaudo_local_disp r
       set r.concepto =
           (select 'POLCA SEVIAL 2.7%'
              from concesionario c
             where c.idconcesionario = r.idconcesionario)
     where r.concepto = 'Sevial 2.7%'
       and fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    update recaudo_local_disp r
       set r.concepto =
           (select 'POLCA SEVIAL 3%'
              from concesionario c
             where c.idconcesionario = r.idconcesionario)
     where r.concepto = 'Sevial 3%'
       and fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    update recaudo_local_disp r
       set r.concepto =
           (select 'POLCA FCM'
              from concesionario c
             where c.idconcesionario = r.idconcesionario)
     where r.concepto = 'FCM Polca'
       and fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    update recaudo_local_disp r
       set r.concepto =
           (select 'Liquidacion POLCA'
              from concesionario c
             where c.idconcesionario = r.idconcesionario)
     where r.concepto = 'Polca'
       and fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

    update recaudo_local_disp r
       set r.concepto =
           (select 'Liquidacion ' || ' ' || c.nombre
              from concesionario c
             where c.idconcesionario = r.idconcesionario)
     where r.concepto = 'Concesionario'
       and fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and decode(ori_idbanco, '52', '52', '99') = p_banco;

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
           'Dispersa Recaudo Local',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia || '-' ||
           p_fec_fin_ano || '-' || p_fec_fin_mes || '-' || p_fec_fin_dia);
    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [dispersa_recaudo_local] ' || SQLERRM,
            p_error);
  END dispersa_recaudo_local;

  PROCEDURE dispersa_recaudo_externo(p_fec_ini_ano number,
                                     p_fec_ini_mes number,
                                     p_fec_ini_dia number,
                                     p_usuario     varchar2,
                                     p_error       OUT VARCHAR2) as

    w_fec_cor_ini    date;
    w_fec_cor_fin    date;
    w_fecmin_cor_ini date;
    w_fecmax_cor_fin date;
    w_registros      number;

  begin
    -- VALIDACIONES
    if (not p_usuario = '99999999') THEN
      sp_v_usuario(p_usuario, p_error, 'pk_proc');
    END IF;

    IF not P_ERROR is null THEN
      return;
    END IF;

    select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                   p_fec_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_ini
      from DUAL;

    select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                   p_fec_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_fin
      from DUAL;

    delete from recaudo_externo_disp
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    commit;

    -- obtiene valor simit
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             5, -- orden
             sum(s_valor_3),
             'Liquidacion SIMIT', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate
        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- neto simit por polca
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             5, -- orden
             sum(p_valor_3 + p_valor_8),
             'Liquidacion SIMIT', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate
        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- obtiene valor concesionario
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             7, -- orden
             sum(s_valor_4),
             'Concesionario', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate
        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- neto concesionario por polca
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             7, -- orden
             sum(p_valor_4),
             'Concesionario', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate
        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- obtiene valor fondo cobertura concesionario
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             8, -- orden
             sum(s_valor_5),
             'Fondo Cobertura Concesionario', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- fondo cobertura concesionario
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             8, -- orden
             sum(p_valor_5),
             'Fondo Cobertura Concesionario', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- obtiene valor fondo cobertura simit
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             6, -- orden
             sum(s_valor_6),
             'Fondo Cobertura SIMIT', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- fondo cobertura simit
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             6, -- orden
             sum(p_valor_6),
             'Fondo Cobertura SIMIT', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- obtiene valor equilibrio economico
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             9, -- orden
             sum(s_valor_7),
             'Equilibrio Economico', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- equilibrio economico
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             9, -- orden
             sum(p_valor_7 + p_valor_10 +
                 decode(id_concesionario_liq, 5, p_valor_15, 0)),
             'Equilibrio Economico', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- equilibrio economico
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             9, -- orden
             sum(decode(id_concesionario_liq, 5, p_valor_13, 0)),
             'Impuestos SIMIT CAPITAL', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- valor del concecionario porpietario
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       id_concesionario_pro,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             id_concesionario_pro,
             13, -- orden
             sum(s_valor_11),
             'Concesionario Contravencional', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                id_concesionario_pro,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- valor del concesionario contravencional (propietario)
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       id_concesionario_pro,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             id_concesionario_pro,
             13, -- orden
             sum(p_valor_24),
             'Concesionario Contravencional', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                id_concesionario_pro,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- valor del fcm contravencional
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             14, -- orden
             sum(s_valor_12),
             'Contravencional FCM', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- valor del fcm contravencional
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             14, -- orden
             sum(p_valor_25),
             'Contravencional FCM', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- 100218

    -- valor del municipio
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             1, -- orden
             sum(s_valor_26),
             'Municipio', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion r
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
         and validador_fecha = '000'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- valor del municipio
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             1, -- orden
             sum(p_valor_39),
             'Municipio', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
         and validador_fecha = '000'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- valor del municipio con validador
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             1, -- orden
             sum(s_valor_26),
             'Validador', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion r
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
         and validador_fecha <> '000'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- valor del municipio
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             2, -- orden
             sum(p_valor_39),
             'Validador', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
         and validador_fecha <> '000'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- 100218

    -- valor del acuerdo pago
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             idmunicipio,
             15, -- orden
             sum(s_valor_10),
             'Acuerdo Pago', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- valor del acuerdo pago
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             idmunicipio,
             15, -- orden
             sum(p_valor_23),
             'Acuerdo Pago', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- valor del tercero 1
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso,
       nomTer )
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             2, -- orden
             sum(s_valor_19),
             'Tercero 1', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate,
             nom_ter1
        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo,
                nom_ter1;

    -- valor del tercero 1
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso,
       nomTer)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             2, -- orden
             sum(p_valor_32),
             'Tercero 1', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate,
             nom_ter1

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo,
                nom_ter1;

    -- valor del tercero 2
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso,
       nomTer)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             3, -- orden
             sum(s_valor_21),
             'Tercero 2', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate,
             nom_Ter2

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo,
                nom_ter2;

    -- valor del tercero 2
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso,
       nomTer)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             3, -- orden
             sum(p_valor_34),
             'Tercero 2', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate,
             nom_Ter2

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo,
                nom_ter2;

    -- valor del tercero 3
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso,
       nomTer )
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             4, -- orden
             sum(s_valor_23),
             'Tercero 3', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate,
             nom_ter3

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo,
                nom_ter3;

    -- valor del tercero 3
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso,
       nomTer )
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             4, -- orden
             sum(p_valor_36),
             'Tercero 3', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate,
             nom_ter3

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo,
                nom_ter3;

    -- valor del tercero 4
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso,
       nomTer )

      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             4, -- orden
             sum(s_valor_25),
             'Tercero 4', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate,
             nom_ter4

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo,
                nom_ter4;

    -- valor del tercero 4
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso,
       nomTer )
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             4, -- orden
             sum(p_valor_38),
             'Tercero 4', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate,
             nom_ter4

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo,
                nom_ter4;



    /*
        -- valor del tercero 1
        insert into recaudo_externo_disp
          (fec_corte_ini,
           fec_corte_fin,
           fec_dispersion,
           id_concesionario_liq,
           idmunicipio,
           orden,
           valor,
           concepto,
           ori_idbanco,
           ori_tipocuenta,
           ori_cuenta,
           ori_nit,
           indtipo,
           usuario_proceso,
           fecha_proceso)
          select w_fec_cor_ini,
                 w_fec_cor_ini,
                 fec_dispersion,
                 id_concesionario_liq,
                 idmunicipio,
                 2, -- orden
                 sum(s_valor_19),
                 'Tercero 1', -- concepto,
                 idbanco,
                 'AHO',
                 cta_recaudo,
                 '8000826650',
                 max(indtipo),
                 p_usuario,
                 sysdate

            from recaudo_externo_liquidacion
           where fec_corte = w_fec_cor_ini
             and ind_proceso = 1
             and indtipo = 'SIMIT'
           group by id_concesionario_liq,
                    idmunicipio,
                    fec_dispersion,
                    idbanco,
                    cta_recaudo;

        -- valor del tercero 1
        insert into recaudo_externo_disp
          (fec_corte_ini,
           fec_corte_fin,
           fec_dispersion,
           id_concesionario_liq,
           idmunicipio,
           orden,
           valor,
           concepto,
           ori_idbanco,
           ori_tipocuenta,
           ori_cuenta,
           ori_nit,
           indtipo,
           usuario_proceso,
           fecha_proceso)
          select w_fec_cor_ini,
                 w_fec_cor_ini,
                 fec_dispersion,
                 id_concesionario_liq,
                 idmunicipio,
                 2, -- orden
                 sum(p_valor_32),
                 'Tercero 1', -- concepto,
                 idbanco,
                 'AHO',
                 cta_recaudo,
                 '8000826650',
                 max(indtipo),
                 p_usuario,
                 sysdate

            from recaudo_externo_liquidacion
           where fec_corte = w_fec_cor_ini
             and ind_proceso = 1
             and indtipo = 'POLCA'
           group by id_concesionario_liq,
                    idmunicipio,
                    fec_dispersion,
                    idbanco,
                    cta_recaudo;

        -- valor del tercero 2
        insert into recaudo_externo_disp
          (fec_corte_ini,
           fec_corte_fin,
           fec_dispersion,
           id_concesionario_liq,
           idmunicipio,
           orden,
           valor,
           concepto,
           ori_idbanco,
           ori_tipocuenta,
           ori_cuenta,
           ori_nit,
           indtipo,
           usuario_proceso,
           fecha_proceso)
          select w_fec_cor_ini,
                 w_fec_cor_ini,
                 fec_dispersion,
                 id_concesionario_liq,
                 idmunicipio,
                 3, -- orden
                 sum(s_valor_21),
                 'Tercero 2', -- concepto,
                 idbanco,
                 'AHO',
                 cta_recaudo,
                 '8000826650',
                 max(indtipo),
                 p_usuario,
                 sysdate

            from recaudo_externo_liquidacion
           where fec_corte = w_fec_cor_ini
             and ind_proceso = 1
             and indtipo = 'SIMIT'
           group by id_concesionario_liq,
                    idmunicipio,
                    fec_dispersion,
                    idbanco,
                    cta_recaudo;

        -- valor del tercero 2
        insert into recaudo_externo_disp
          (fec_corte_ini,
           fec_corte_fin,
           fec_dispersion,
           id_concesionario_liq,
           idmunicipio,
           orden,
           valor,
           concepto,
           ori_idbanco,
           ori_tipocuenta,
           ori_cuenta,
           ori_nit,
           indtipo,
           usuario_proceso,
           fecha_proceso)
          select w_fec_cor_ini,
                 w_fec_cor_ini,
                 fec_dispersion,
                 id_concesionario_liq,
                 idmunicipio,
                 3, -- orden
                 sum(p_valor_34),
                 'Tercero 2', -- concepto,
                 idbanco,
                 'AHO',
                 cta_recaudo,
                 '8000826650',
                 max(indtipo),
                 p_usuario,
                 sysdate

            from recaudo_externo_liquidacion
           where fec_corte = w_fec_cor_ini
             and ind_proceso = 1
             and indtipo = 'POLCA'
           group by id_concesionario_liq,
                    idmunicipio,
                    fec_dispersion,
                    idbanco,
                    cta_recaudo;

        -- valor del tercero 3
        insert into recaudo_externo_disp
          (fec_corte_ini,
           fec_corte_fin,
           fec_dispersion,
           id_concesionario_liq,
           idmunicipio,
           orden,
           valor,
           concepto,
           ori_idbanco,
           ori_tipocuenta,
           ori_cuenta,
           ori_nit,
           indtipo,
           usuario_proceso,
           fecha_proceso)
          select w_fec_cor_ini,
                 w_fec_cor_ini,
                 fec_dispersion,
                 id_concesionario_liq,
                 idmunicipio,
                 4, -- orden
                 sum(s_valor_23),
                 'Tercero 3', -- concepto,
                 idbanco,
                 'AHO',
                 cta_recaudo,
                 '8000826650',
                 max(indtipo),
                 p_usuario,
                 sysdate

            from recaudo_externo_liquidacion
           where fec_corte = w_fec_cor_ini
             and ind_proceso = 1
             and indtipo = 'SIMIT'
           group by id_concesionario_liq,
                    idmunicipio,
                    fec_dispersion,
                    idbanco,
                    cta_recaudo;

        -- valor del tercero 3
        insert into recaudo_externo_disp
          (fec_corte_ini,
           fec_corte_fin,
           fec_dispersion,
           id_concesionario_liq,
           idmunicipio,
           orden,
           valor,
           concepto,
           ori_idbanco,
           ori_tipocuenta,
           ori_cuenta,
           ori_nit,
           indtipo,
           usuario_proceso,
           fecha_proceso)
          select w_fec_cor_ini,
                 w_fec_cor_ini,
                 fec_dispersion,
                 id_concesionario_liq,
                 idmunicipio,
                 4, -- orden
                 sum(p_valor_36),
                 'Tercero 3', -- concepto,
                 idbanco,
                 'AHO',
                 cta_recaudo,
                 '8000826650',
                 max(indtipo),
                 p_usuario,
                 sysdate

            from recaudo_externo_liquidacion
           where fec_corte = w_fec_cor_ini
             and ind_proceso = 1
             and indtipo = 'POLCA'
           group by id_concesionario_liq,
                    idmunicipio,
                    fec_dispersion,
                    idbanco,
                    cta_recaudo;

        -- valor del tercero 4
        insert into recaudo_externo_disp
          (fec_corte_ini,
           fec_corte_fin,
           fec_dispersion,
           id_concesionario_liq,
           idmunicipio,
           orden,
           valor,
           concepto,
           ori_idbanco,
           ori_tipocuenta,
           ori_cuenta,
           ori_nit,
           indtipo,
           usuario_proceso,
           fecha_proceso)
          select w_fec_cor_ini,
                 w_fec_cor_ini,
                 fec_dispersion,
                 id_concesionario_liq,
                 idmunicipio,
                 4, -- orden
                 sum(s_valor_25),
                 'Tercero 4', -- concepto,
                 idbanco,
                 'AHO',
                 cta_recaudo,
                 '8000826650',
                 max(indtipo),
                 p_usuario,
                 sysdate

            from recaudo_externo_liquidacion
           where fec_corte = w_fec_cor_ini
             and ind_proceso = 1
             and indtipo = 'SIMIT'
           group by id_concesionario_liq,
                    idmunicipio,
                    fec_dispersion,
                    idbanco,
                    cta_recaudo;

        -- valor del tercero 4
        insert into recaudo_externo_disp
          (fec_corte_ini,
           fec_corte_fin,
           fec_dispersion,
           id_concesionario_liq,
           idmunicipio,
           orden,
           valor,
           concepto,
           ori_idbanco,
           ori_tipocuenta,
           ori_cuenta,
           ori_nit,
           indtipo,
           usuario_proceso,
           fecha_proceso)
          select w_fec_cor_ini,
                 w_fec_cor_ini,
                 fec_dispersion,
                 id_concesionario_liq,
                 idmunicipio,
                 4, -- orden
                 sum(p_valor_38),
                 'Tercero 4', -- concepto,
                 idbanco,
                 'AHO',
                 cta_recaudo,
                 '8000826650',
                 max(indtipo),
                 p_usuario,
                 sysdate

            from recaudo_externo_liquidacion
           where fec_corte = w_fec_cor_ini
             and ind_proceso = 1
             and indtipo = 'POLCA'
           group by id_concesionario_liq,
                    idmunicipio,
                    fec_dispersion,
                    idbanco,
                    cta_recaudo;
    */
    -- valor de polca sevial
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             19, -- orden
             sum(p_valor_9),
             'SEVIAL 3%', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and fec_corte >= to_date('2017-02-01', 'yyyy-mm-dd')
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             10, -- orden
             sum( p_valor_14),
             'POLCA SEVIAL', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
        and fec_corte >= to_date('2017-02-01', 'yyyy-mm-dd')
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             10, -- orden
             sum( p_valor_9 + p_valor_14),
             'POLCA SEVIAL', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
        and fec_corte < to_date('2017-02-01', 'yyyy-mm-dd')
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- valor de polca fcm
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             11, -- orden
             sum(decode(id_concesionario_liq, 5, 0, p_valor_13)),
             'POLCA FCM', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- valor del polca
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fn_fec_dispersion(w_fec_cor_ini, 0, 1, p_usuario),

             --  to_date('2016-09-19', 'yyyy-mm-dd'), --fec_dispersion_con,
             id_concesionario_liq,
             12, -- orden
             --sum(p_valor_12 - p_valor_18 - p_valor_16),
             sum(p_valor_12),
             'Liquidacion POLCA', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- valor hacia fondo SIMIT
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             r.fec_dispersion_con,
             r.id_concesionario_liq,
             18, -- orden
             sum(r.fondorenovacion),
             'Valor hacia Fondo Renovacion', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion r
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- valor hacia fondo
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             r.fec_dispersion_con,
             r.id_concesionario_liq,
             18, -- orden
             sum(r.fondorenovacion),
             'Valor hacia Fondo Renovacion', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion r
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- valor no dispersados
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso,
       idMunicipio)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             w_fec_cor_ini,
             id_concesionario_liq,
             16, -- orden
             sum(valor_total),
             'Valor no distribuido', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             indtipo,
             p_usuario,
             sysdate,
             idmunicipio

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 0
       group by id_concesionario_liq,
                idbanco,
                cta_recaudo,
                indtipo,
                idmunicipio;

    commit;

    /*
        -- TOTALIZA REGISTROS CON LA MISMA FECHA DE DISPERSION
        -- SE GENERAN VARIOS POR QUE LA FECHA DE DISPERSION ES LA DEL MUNICIIPIO
        -- Y SE CAMBIA A LA FUERZXA POR LA DE ICNICIO DE MES

        insert into recaudo_externo_disp
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
          select w_fec_cor_ini,
                 w_fec_cor_fin,
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
                 p_usuario,
                 sysdate,
                 sum(valor),
                 '',
                 idmunicipio
            from recaudo_externo_disp
            where fec_corte_ini >= w_fec_cor_ini
            and   fec_corte_fin <= w_fec_cor_fin
            and   id_concesionario_pro = '99'
           group by fec_dispersion,
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
                    id_concesionario_pro,
                    idmunicipio;

            delete
            from recaudo_externo_disp
            where fec_corte_ini >= w_fec_cor_ini
            and   fec_corte_fin <= w_fec_cor_fin
            and   id_concesionario_pro = '99';
    */

    -- actualiza cuenta fondo r
    update recaudo_externo_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) =
           (select f.idbanco, f.tipocta, f.numcta, f.numide from fondocont f)
     where r.fec_corte_ini >= w_fec_cor_ini
       and r.fec_corte_fin <= w_fec_cor_fin
       and r.concepto = 'Valor hacia Fondo Renovacion';

    -- actualiza conceptos

    update recaudo_externo_disp r
       set r.concepto =
           (select 'Valor hacia Fondo Renovacion -' || ' ' || c.nombre
              from concesionario c
             where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'Valor hacia Fondo Renovacion'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    -- actualiza cuenta BANCO simit
    update recaudo_externo_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) =
           (select c.cta_disp_s_banco,
                   c.cta_disp_s_tipo_cta,
                   c.cta_disp_s_cta,
                   '8000826650'
              from cta_dispersion_fcm c
             where c.idbancorec = r.ori_idbanco)
     where r.fec_corte_ini >= w_fec_cor_ini
       and r.fec_corte_fin <= w_fec_cor_fin
       and r.indtipo = 'SIMIT'
       and r.concepto = 'Liquidacion SIMIT';

    update recaudo_externo_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) =
           (select c.cta_disp_p_banco,
                   c.cta_disp_p_tipo_cta,
                   c.cta_disp_p_cta,
                   '8000826650'
              from cta_dispersion_fcm c
             where c.idbancorec = r.ori_idbanco)
     where r.fec_corte_ini >= w_fec_cor_ini
       and r.fec_corte_fin <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Liquidacion SIMIT';

    commit;

    -- actualiza cuenta BANCO Concesionario
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.id_concesionario_liq
               and c.idconcepto = 1
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Concesionario'
       and indtipo = 'SIMIT';

    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.id_concesionario_liq
               and c.idconcepto = 8
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Concesionario'
       and indtipo = 'POLCA';

    -- actualiza cuenta BANCO Fondo Cobertura
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.id_concesionario_liq
               and c.idconcepto = 2
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Fondo Cobertura Concesionario';

    -- actualiza cuenta BANCO Fondo Cobertura simit
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.id_concesionario_liq
               and c.idconcepto = 2
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Fondo Cobertura SIMIT';

    -- actualiza cuenta BANCO Equilibrio
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.id_concesionario_liq
               and c.idconcepto = 2
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Equilibrio Economico';

    -- actualiza cuenta Impuestos SIMIT CAPITAL
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select c.cta_disp_pa_banco,
                   c.cta_disp_pa_tipo_cta,
                   c.cta_disp_pa_cta,
                   '8000826650'
              from cta_dispersion_fcm c
             where c.idbancorec = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Impuestos SIMIT CAPITAL';

    -- actualiza cuenta BANCO Municipio
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_cta
              from municipio m
             where m.idmunicipio = r.idmunicipio)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Municipio';

    -- 100929
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_cta
              from municipio m
             where m.idmunicipio = '08001001')
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Validador'
       and r.idmunicipio = '08001000';

    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_cta
              from municipio m
             where m.idmunicipio = '08000000')
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Validador'
       and r.idmunicipio in ('08296000', '08573000');

    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_cta
              from municipio m
             where m.idmunicipio = '08001001')
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Validador'
       and r.idmunicipio = '08001001';

    -- 100929
    -- actualiza cuenta BANCO Tercero 1
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select max(idbanco), max(tipocuenta), max(cuenta), max(nit_t)
              from tercero_ot t
             where t.idmunicipio = r.idmunicipio
               and t.jurisdiccion = r.indtipo
               and t.nombre = r.nomter )
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Tercero 1';


    -- actualiza cuenta BANCO Tercero 2
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select max(idbanco), max(tipocuenta), max(cuenta), max(nit_t)
              from tercero_ot t
             where t.idmunicipio = r.idmunicipio
               and t.jurisdiccion = r.indtipo
               and t.nombre = r.nomter )
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Tercero 2';



    -- actualiza cuenta BANCO Tercero 3
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select max(idbanco), max(tipocuenta), max(cuenta), max(nit_t)
              from tercero_ot t
             where t.idmunicipio = r.idmunicipio
               and t.jurisdiccion = r.indtipo
               and t.nombre = r.nomter )
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Tercero 3';

    -- actualiza cuenta BANCO Tercero 4
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select max(idbanco), max(tipocuenta), max(cuenta), max(nit_t)
              from tercero_ot t
             where t.idmunicipio = r.idmunicipio
               and t.jurisdiccion = r.indtipo
               and t.nombre = r.nomter )
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Tercero 4';



    -- actualiza cuenta BANCO acuerdo de pago
    update recaudo_externo_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) =
           (select c.cta_disp_Ac_banco,
                   c.cta_disp_Ac_tipo_cta,
                   c.cta_disp_Ac_cta,
                   '8000826650'
              from cta_dispersion_fcm c
             where c.idbancorec = r.ori_idbanco)
     where r.fec_corte_ini >= w_fec_cor_ini
       and r.fec_corte_fin <= w_fec_cor_fin
       and r.indtipo = 'SIMIT'
       and r.concepto = 'Acuerdo Pago';

    update recaudo_externo_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) =
           (select c.cta_disp_ac_banco,
                   c.cta_disp_Ac_tipo_cta,
                   c.cta_disp_Ac_cta,
                   '8000826650'
              from cta_dispersion_fcm c
             where c.idbancorec = r.ori_idbanco)
     where r.fec_corte_ini >= w_fec_cor_ini
       and r.fec_corte_fin <= w_fec_cor_fin
       and r.indtipo = 'POLCA'
       and r.concepto = 'Acuerdo Pago';

    -- actualiza cuenta BANCO Concesionario Contravencional
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.id_concesionario_pro
               and c.idconcepto = 3
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Concesionario Contravencional';

    -- actualiza cuenta BANCO Fcm Contravencional
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.id_concesionario_liq
               and c.idconcepto = 4
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Contravencional FCM';

    -- actualiza cuenta BANCO POLCA
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.id_concesionario_liq
               and c.idconcepto = 6
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Liquidacion POLCA';

    -- actualiza cuenta BANCO Sevial
       update recaudo_externo_disp r
           set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
               (select idbanco, tipocuenta, cuenta, nit_c
                  from cta_dispersion_concesionario c
                 where c.idconcesionario = r.id_concesionario_liq
                   and c.idconcepto = 5
                   and c.idbancorec = r.ori_idbanco)
         where fec_corte_ini >= w_fec_cor_ini
           and fec_corte_fin <= w_fec_cor_fin
           and indtipo = 'POLCA'
           and concepto = 'SEVIAL 3%'
            and w_fec_cor_ini >= to_date('2017-04-25','yyyy-mm-dd');

       update recaudo_externo_disp r
       set des_idbanco = r.ori_idbanco,
           des_tipocuenta = 'AHO',
           des_cuenta     = encriptar(r.ori_cuenta),
           des_nit        = r.ori_nit
         where fec_corte_ini >= w_fec_cor_ini
           and fec_corte_fin <= w_fec_cor_fin
           and indtipo = 'POLCA'
           and concepto = 'SEVIAL 3%'
           and w_fec_cor_ini <= to_date('2017-04-24','yyyy-mm-dd');

    -- se pone concepto sevial 3% en la cta origen
    update recaudo_externo_disp r
       set des_idbanco = r.ori_idbanco,

           des_tipocuenta = 'AHO',
           des_cuenta     = encriptar(r.ori_cuenta),
           des_nit        = r.ori_nit

     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'SEVIAL 3%';

    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select c.cta_disp_pa_banco,
                   c.cta_disp_pa_tipo_cta,
                   c.cta_disp_pa_cta,
                   '8000826650'
              from cta_dispersion_fcm c
             where c.idbancorec = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'POLCA SEVIAL';

    -- actualiza cuenta BANCO POLCA FCM
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select c.cta_disp_pa_banco,
                   c.cta_disp_pa_tipo_cta,
                   c.cta_disp_pa_cta,
                   '8000826650'
              from cta_dispersion_fcm c
             where c.idbancorec = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'POLCA FCM';

    -- actualiza el tipo de cuenta origen
    update recaudo_externo_disp r
       set r.ori_tipocuenta =
           (select c.tipocuenta
              from cta_recaudo_concesionario c
             where c.cuenta = r.ori_cuenta
               and c.idconcesionario = r.id_concesionario_liq
               AND r.indtipo = c.indtipo
               and c.idbanco = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set des_idbanco    = ori_idbanco,
           des_tipocuenta = ori_tipocuenta,
           des_cuenta     = ori_cuenta,
           des_nit        = ori_nit
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Valor no distribuido';

    commit;

    -- actualiza conceptos

    update recaudo_externo_disp r
       set r.concepto =
           (select 'Liquidacion FCM'
              from concesionario c
             where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'Liquidacion SIMIT'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto =
           (select 'Fondo Cobertura FCM -' || ' ' || c.nombre
              from concesionario c
             where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'Fondo Cobertura SIMIT'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto =
           (select 'Fondo Cobertura' || ' ' || c.nombre
              from concesionario c
             where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'Fondo Cobertura Concesionario'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto = 'Impuestos FCM'
     where r.concepto = 'Impuestos SIMIT CAPITAL'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto =
           (select 'Equilibrio Economico -' || ' ' || c.nombre
              from concesionario c
             where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'Equilibrio Economico'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto =
           (select 'POLCA SEVIAL'
              from concesionario c
             where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'POLCA SEVIAL'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto =
           (select 'POLCA FCM'
              from concesionario c
             where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'POLCA FCM'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto =
           (select 'Liquidacion POLCA'
              from concesionario c
             where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'Liquidacion POLCA'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto =
           (select 'Liquidacion ' || ' ' || c.nombre
              from concesionario c
             where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'Concesionario'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto =
           (select m.idmunicipio || ' Municipio ' || m.nombre
              from municipio m
             where m.idmunicipio = r.idmunicipio)
     where r.concepto = 'Municipio'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto =
           (select 'No distribuido ' || m.idmunicipio || ' Municipio ' ||
                   m.nombre
              from municipio m
             where m.idmunicipio = r.idmunicipio)
     where r.concepto = 'Valor no distribuido'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    -- 100929

    update recaudo_externo_disp r
       set r.concepto = 'Metrotransito Barranquilla'
     where r.concepto = 'Validador'
       and r.idmunicipio = '08001000'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto = 'Galapa - Dptal Atlantico'
     where r.concepto = 'Validador'
       and r.idmunicipio in ('08296000')
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto = 'Puerto Colombia - Dptal Atlantico'
     where r.concepto = 'Validador'
       and r.idmunicipio in ('08573000')
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto = 'Metrotransito Barranquilla'
     where r.concepto = 'Validador'
       and r.idmunicipio = '08001001'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    -- 100929

    update recaudo_externo_disp r
       set r.concepto =
           (select 'Acuerdo Pago ' || m.idmunicipio || ' ' || m.nombre
              from municipio m
             where m.idmunicipio = r.idmunicipio)
     where r.concepto = 'Acuerdo Pago'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto =
           (select 'Contravencional ' || c.nombre
              from concesionario c
             where c.idconcesionario = r.id_concesionario_pro)
     where r.concepto = 'Concesionario Contravencional'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto            = nomTer
     where r.concepto in ( 'Tercero 1', 'Tercero 2', 'Tercero 3', 'Tercero 4' )
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    commit;

    insert into recaudo_externo_disp
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
      select w_fec_cor_ini,
             w_fec_cor_fin,
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
             p_usuario,
             sysdate,
             sum(valor),
             '',
             '99999999'
        from recaudo_externo_disp
       where fec_corte_ini >= w_fec_cor_ini
         and fec_corte_fin <= w_fec_cor_fin
         and id_concesionario_pro = '98'
       group by fec_dispersion,
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
                id_concesionario_pro;

    delete from recaudo_externo_disp
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and id_concesionario_pro = '98';

    delete from recaudo_externo_disp where valor = 0;

    -- actualiza datos null
    update recaudo_externo_disp r
       set idmunicipio = '99999999'
     where r.fec_corte_ini >= w_fec_cor_ini
       and r.fec_corte_ini <= w_fec_cor_fin
       and idmunicipio is null;

    update recaudo_externo_disp r
       set des_idbanco = ori_idbanco
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_ini <= w_fec_cor_fin
       and des_idbanco is null;

-- temporal para 2017-05-02
update recaudo_externo_disp r
set r.des_idbanco = '52',
 r.des_tipocuenta = 'AHO',
 r.des_cuenta = encriptar('059018846'),
 r.des_nit = '8000826650'
where fec_dispersion = to_date('2017-05-02', 'yyyy-mm-dd')
and r.orden =7
and r.id_concesionario_liq = '04';

    commit;

    sp_log(p_usuario,
           'Dispersa Recaudo Externo',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia);

    commit;

  EXCEPTION
    WHEN OTHERS THEN
      p_error :=  SQLERRM;
      sp_ex(SQLCODE,
            p_usuario || ' [dispersa_recaudo_externo] ' || SQLERRM,
            p_error);
  END dispersa_recaudo_externo;

  PROCEDURE generarArchivoAvvillas(p_fecha   date,
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
             id_concesionario_liq,
             orden,
             concepto,
             ori_idbanco,
             ori_tipocuenta,
             ori_cuenta,
             ori_nit,
             des_idbanco,
             des_tipocuenta,
             desencriptar(des_cuenta) as des_cuenta,
             des_nit,
             indtipo,
             valor,
             idmunicipio,
             referenciatrf,
             nvl(TIPO_IDE_DEST, 'N') tipoIdeDest
        from recaudo_externo_disp_tot
       where fec_dispersion = p_fecha
         and ori_idbanco = '52';

  begin

    aaaammdd := to_char(p_fecha, 'yyyymmdd');
    hhmmss   := to_char(sysdate, 'hhmmss');

    archivo  := utl_file.fopen('TRFAVVILLAS',
                               'CNJ650D.TRANSFER.' || aaaammdd || '.TXT',
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

      if (registro.des_idbanco = '50') then
        cadena := cadena || '051'; -- banco destino
      else
        cadena := cadena || '0' || registro.des_idbanco; -- banco destino
      end if;

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

      cadena := cadena || registro.tipoIdeDest; -- tipo identificacion destino
      cadena := cadena || trim(to_char(to_number(registro.des_nit),
                                       '0000000000000000'));

      --cadena := cadena || '000000' || registro.des_nit; -- identificacion destino

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
            p_usuario || ' [generarArchivoAvvillas] ' || SQLERRM,
            p_error);

  end generarArchivoAvvillas;

  PROCEDURE generarArchivoBancafe(p_fecha   date,
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
        from cta_recaudo_concesionario t
       where idbanco = '50'
         AND CUENTA NOT IN ('186992848', '186992830')
       group by cuenta;

  begin

    aaaammdd := to_char(p_fecha, 'yyyymmdd');
    hhmmss   := to_char(sysdate, 'hhmmss');

    for cta in cuentas loop

      select sum(valor)
        into vlrTotal
        from recaudo_externo_disp_tot
       where fec_dispersion = p_fecha
         and ori_idbanco = '50'
         and ori_cuenta = cta.cuenta;

      select count(*)
        into numTotal
        from recaudo_externo_disp_tot
       where fec_dispersion = p_fecha
         and ori_idbanco = '50'
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
      cadena := cadena || '000050';

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

      cadena := cadena || aaaammdd; -- fech-generacion
      cadena := cadena || '000000'; -- hora generacion
      cadena := cadena || '00'; -- ind-inscripcion
      cadena := cadena || '00'; -- tipo-identificacion
      cadena := cadena || '000000000000'; -- numero-cliente
      cadena := cadena || '0000'; -- oficina-rec-emp
      cadena := cadena || '0000'; -- actu-co
      cadena := cadena || '0'; -- ind-encripcion
      cadena := cadena || '01'; -- long-arch-s
      cadena := cadena || '0000000000000000'; -- cta-empresa-abono
      cadena := cadena || '000000'; -- talon-abono
      cadena := cadena || '00000000000'; -- filler

      utl_file.put_line(archivo, cadena, true);
      for reg in (select fec_dispersion,
                         id_concesionario_liq,
                         orden,
                         concepto,
                         ori_idbanco,
                         ori_tipocuenta,
                         ori_cuenta,
                         ori_nit,
                         des_idbanco,
                         des_tipocuenta,
                         desencriptar(des_cuenta) as des_cuenta,
                         des_nit,
                         indtipo,
                         valor,
                         idmunicipio,
                         referenciatrf
                    from recaudo_externo_disp_tot
                   where fec_dispersion = p_fecha
                     and ori_idbanco = '50'
                     and ori_cuenta = cta.cuenta)

       loop
        cadena := '55000000' || reg.des_nit; -- tipo registro

        -- nro referencia
        strValor := trim(to_char(reg.referenciatrf, '0000000000000000'));
        cadena   := cadena || strValor;

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

        cadena := cadena || '0000' || reg.des_idbanco; --banco destino

        strValor := trim(to_char(reg.valor * 100, '000000000000000000'));
        cadena   := cadena || strValor; -- valor

        cadena := cadena || '000000'; -- numero talon
        cadena := cadena || '03'; -- tipo ide destino
        cadena := cadena || '0'; -- valide ide
        cadena := cadena || '9999'; -- respuesta traslado
        cadena := cadena || '0000000000000000000000000000000000000000'; --mensaje
        cadena := cadena || '000000000000000000'; -- valor acumulado
        cadena := cadena || aaaammdd; --fecha a
        cadena := cadena || '0000'; -- oficina-rec-det
        cadena := cadena || '0000'; -- motivo-det
        cadena := cadena || '0000'; -- nvo-indalt-tarj
        cadena := cadena || '0'; -- indic-emerg
        cadena := cadena || '00'; -- indic-emerg

        utl_file.put_line(archivo, cadena, true);

      end loop;

      utl_file.fclose(archivo);
    end loop;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [generarArchivoAvvillas] ' || SQLERRM,
            p_error);

  end generarArchivoBancafe;

  PROCEDURE generarArchivoDavivienda(p_fecha   date,
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
        from cta_recaudo_concesionario t
       where idbanco = '51'
         AND CUENTA NOT IN ('186992848', '186992830')
       group by cuenta;

  begin

    aaaammdd := to_char(p_fecha, 'yyyymmdd');
    hhmmss   := to_char(sysdate, 'hhmmss');

    for cta in cuentas loop

      select sum(valor)
        into vlrTotal
        from recaudo_externo_disp_tot
       where fec_dispersion = p_fecha
         and ori_idbanco in ('50', '51')
         and valor > 0
         and ori_cuenta = cta.cuenta;

      select count(*)
        into numTotal
        from recaudo_externo_disp_tot
       where fec_dispersion = p_fecha
         and ori_idbanco in ('50', '51')
         and valor > 0
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
                         id_concesionario_liq,
                         orden,
                         concepto,
                         ori_idbanco,
                         ori_tipocuenta,
                         ori_cuenta,
                         ori_nit,
                         des_idbanco,
                         des_tipocuenta,
                         desencriptar(des_cuenta) as des_cuenta,
                         des_nit,
                         indtipo,
                         valor,
                         idmunicipio,
                         referenciatrf
                    from recaudo_externo_disp_tot
                   where fec_dispersion = p_fecha
                     and ori_idbanco in ('50', '51')
                     and valor > 0
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
            p_usuario || ' [generarArchivoDavivienda] ' || SQLERRM,
            p_error);

  end generarArchivoDavivienda;

  PROCEDURE generarArchivoBogota(p_fecha   date,
                                 p_usuario varchar2,
                                 p_error   OUT VARCHAR2) as

    w_registros number;
    archivo     utl_file.file_type;
    aaaammdd    varchar(8);
    aaaammddSis varchar(8);
    hhmmss      varchar(6);

    cadena   varchar(250);
    numreg   number;
    strValor varchar(250);
    vlrTotal number;
    numTotal number;

    longitud number;

    CURSOR cuentas is
      select max(tipocuenta) as tipocuenta, cuenta
        from cta_recaudo_concesionario t
       where idbanco = '01'
       group by cuenta;

  begin

    aaaammdd    := to_char(p_fecha, 'yyyymmdd');
    aaaammddSis := to_char(sysdate, 'yyyymmdd');
    hhmmss      := to_char(sysdate, 'hhmmss');

    for cta in cuentas loop

      select sum(valor)
        into vlrTotal
        from recaudo_externo_disp_tot
       where fec_dispersion = p_fecha
         and ori_idbanco in ('01')
         and valor > 0
         and ori_cuenta = cta.cuenta;

      select count(*)
        into numTotal
        from recaudo_externo_disp_tot
       where fec_dispersion = p_fecha
         and ori_idbanco in ('01')
         and valor > 0
         and ori_cuenta = cta.cuenta;

      if (numTotal > 0) then

        archivo := utl_file.fopen('TRFBOGOTA',
                                  cta.cuenta || '_' || aaaammddSis || '.TXT',
                                  'W');

        --crear header
        cadena   := '1'; -- tipo reg
        cadena   := cadena || aaaammddSis; -- FECHA APLICACION
        cadena   := cadena || '000000000000000000000000'; -- CEROS
        cadena   := cadena || '2'; -- AHORROS
        cadena   := cadena || '000000'; -- CEROS
        strValor := trim(to_char(to_number(cta.cuenta), '00000000000'));
        cadena   := cadena || strValor;
        cadena   := cadena || 'FEDERACION COLOMBIANA  DE MUNICIPIOS    '; -- NOMBRE EMPRESA
        cadena   := cadena || '08000826650'; --nit empresa
        cadena   := cadena || '002'; --TIPO MVTO
        cadena   := cadena || '0001'; --CODIGO CIUDAD
        cadena   := cadena || aaaammddSis; -- FECHA GENERACION
        strValor := trim(to_char(to_number(cta.cuenta), '000000000'));
        cadena   := cadena || SUBSTR(strValor, 1, 3); -- OFICINA CTA
        cadena   := cadena || 'N'; -- TIPO IDENTIFICACION
        strValor := rpad(' ', 48);
        cadena   := cadena || strValor; -- espacios 48
        cadena   := cadena || ' '; -- datos adicionales
        strValor := rpad(' ', 80);
        cadena   := cadena || strValor; -- espacios 80

        utl_file.put_line(archivo, cadena, true);

        numReg := 1;

        for reg in (select fec_dispersion,
                           id_concesionario_liq,
                           orden,
                           FN_LIMPIARCADENA(concepto) as concepto,
                           ori_idbanco,
                           ori_tipocuenta,
                           ori_cuenta,
                           ori_nit,
                           des_idbanco,
                           des_tipocuenta,
                           desencriptar(des_cuenta) as des_cuenta,
                           des_nit,
                           indtipo,
                           valor,
                           idmunicipio,
                           referenciatrf,
                           nvl(TIPO_IDE_DEST, 'N') tipoIdeDest
                      from recaudo_externo_disp_tot
                     where fec_dispersion = p_fecha
                       and ori_idbanco in ('01')
                       and valor > 0
                       and ori_cuenta = cta.cuenta)

         loop

          dbms_output.put_line('Registro ' || to_char(numreg) || ' ' ||
                               reg.concepto);
          numreg := numreg + 1;

          /*      if (numReg > 60 ) then
          dbms_output.put_line('aca');
          end if;
          */

          cadena   := '2'; -- tipo registro
          cadena   := cadena || reg.tipoIdeDest; -- tipo identificacion
          strValor := trim(to_char(to_number(reg.des_nit), '00000000000'));
          cadena   := cadena || strValor; -- nit destino
          strValor := rpad(reg.concepto, 40);
          cadena   := cadena || substr(strValor, 1, 40); -- nombre beneficiario
          cadena   := cadena || '0'; -- cero
          -- tipo cuenta destino
          if (reg.des_tipocuenta = 'AHO') then
            cadena := cadena || '2';
          end if;

          if (reg.des_tipocuenta = 'CTE') then
            cadena := cadena || '1';
          end if;

          -- cuenta destino
          strValor := rpad(reg.des_cuenta, 17);
          cadena   := cadena || substr(strValor, 1, 17);

          -- valor abono
          strValor := trim(to_char(reg.valor * 100, '000000000000000000'));
          cadena   := cadena || strValor; -- valor

          -- forma de pago
          cadena := cadena || 'A';
          cadena := cadena || '000'; -- ceros

          -- banco destino
          if (reg.des_idbanco = '50') then
            cadena := cadena || '051'; --banco davivienda
          else
            cadena := cadena || '0' || reg.des_idbanco; --banco destino
          end if;

          cadena   := cadena || '0001'; --CODIGO CIUDAD
          cadena   := cadena || 'FCM      '; --adenda
          cadena   := cadena || ' '; -- espacio
          strValor := rpad(' ', 70);
          cadena   := cadena || strValor; -- espacios 70
          cadena   := cadena || '0'; -- cero

          -- referencia
          strValor := trim(to_char(reg.referenciatrf, '0000000000'));
          cadena   := cadena || strValor;

          cadena := cadena || 'N'; -- enviar info
          cadena := cadena || '        '; -- espacios 8

          -- couta libranza
          strValor := trim(to_char(0, '000000000000000000'));
          cadena   := cadena || strValor;

          cadena := cadena || '           '; -- espacios 11
          cadena := cadena || '           '; -- espacios 11
          cadena := cadena || 'N'; -- enviar info

          cadena := cadena || '        '; -- espacios 8

          utl_file.put_line(archivo, cadena, true);

        end loop;

        utl_file.fclose(archivo);
      end if;
    end loop;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [generarArchivoBogota] ' || SQLERRM,
            p_error);

  end generarArchivoBogota;

  PROCEDURE envio_Banco(p_fec_ini_ano number,
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
      from recaudo_externo_disp_tot
     where fec_corte_ini = p_fecha
       and enviadobanco = 1
       and ori_idbanco = decode(p_idbanco, '50', '51', p_idbanco);

    IF w_registros > 0 THEN
      p_error := 'PROCESO NO EJECUTADO. ARCHIVOS YA ENVIADOS A BANCO. SOLICITAR AUTORIZACION';
      -- ver log envio
      if p_idbanco = '52' then
        verLogEnvioAvvillas(p_log);
      end if;
      if p_idbanco = '50' then
        verLogEnvioDavivienda(p_log);
      end if;
      if p_idbanco = '51' then
        verLogEnvioDavivienda(p_log);
      end if;
      -- ver log envio
      if p_idbanco = '01' then
        --verLogEnvioBogota(p_log);
        p_log := 'No hay script por ejecutar';
      end if;

      RETURN;
    END IF;

    if p_idbanco = '52' then
      -- generar archivo transferencia avvillas
      generarArchivoAvvillas(p_fecha, p_usuario, p_error);

      IF not P_ERROR is null THEN
        return;
      END IF;

      -- ejecutar script transferencia davivienda
      ejecutarScriptAvvillas(p_fecha, p_usuario, p_error);
      /*
      IF not P_ERROR is null THEN
        p_error := 'Error en script avvillas codigo ' ||
                   substr(p_error, 0, 3);
        verLogEnvioAvvillas(p_log);
        return;
      END IF;*/
      -- ver log envio
      verLogEnvioAvvillas(p_log);
      /*
            if (instr(p_log, 'Login failed') > 0) then
              p_error := 'Envio Avvillas. Fallo FTP:Login failed';
              return;
            end if;
      */
    end if;

    if (p_idbanco = '50') or (p_idbanco = '51') then

      -- generar archivo transferencia avvillas
      generarArchivoDavivienda(p_fecha, p_usuario, p_error);

      IF not P_ERROR is null THEN
        return;
      END IF;

      -- ejecutar script transferencia davivienda
      ejecutarScriptDavivienda(p_fecha, p_usuario, p_error);

      /*    IF not P_ERROR is null THEN
              p_error := 'Error en script Davivienda codigo ' ||
                         substr(p_error, 0, 3);
              verLogEnvioDavivienda(p_log);
              return;
            END IF;
      */
      -- ver log envio
      verLogEnvioDavivienda(p_log);
      /*
            if (instr(p_log, 'Login failed') > 0) then
              p_error := 'Envio Davivienda. Fallo FTP:Login failed';
              return;
            end if;
      */
    end if;

    if (p_idbanco = '01') then

      -- generar archivo transferencia
      generarArchivoBogota(p_fecha, p_usuario, p_error);

      IF not P_ERROR is null THEN
        return;
      END IF;

      -- ejecutar script transferencia
      --ejecutarScriptBogota(p_fecha, p_usuario, p_error);

      /*    IF not P_ERROR is null THEN
              p_error := 'Error en script Davivienda codigo ' ||
                         substr(p_error, 0, 3);
              verLogEnvioDavivienda(p_log);
              return;
            END IF;
      */
      -- ver log envio
      --verLogEnvioBogota(p_log);
      /*
            if (instr(p_log, 'Login failed') > 0) then
              p_error := 'Envio Davivienda. Fallo FTP:Login failed';
              return;
            end if;
      */
      p_log := 'Banco no tiene encripcion';
    end if;
    update recaudo_externo_disp_tot
       set enviadobanco = 1, estadotrf = 'ENV', fechaenvio = sysdate
     where fec_corte_ini = p_fecha
       and ori_idbanco = decode(p_idbanco, '50', '51', p_idbanco);

    commit;

    p_error := 'Archivos enviados a banco OK';

    select count(*)
      into w_registros
      from recaudo_externo_disp_tot
     where fec_corte_ini = p_fecha
       and ori_idbanco = decode(p_idbanco, '50', '51', p_idbanco);

    IF w_registros = 0 THEN
      p_error := p_error ||
                 '.ADVERTENCIA: NO HAY TRANSFERENCIAS PROGRAMADASPARA LA FECHA DADA';
      RETURN;
    END IF;

    sp_log(p_usuario,
           'envio_Banco',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia);

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [envio_Banco] ' || SQLERRM, p_error);

  end envio_Banco;

  PROCEDURE generarScriptAvvillas(p_fecha   date,
                                  p_usuario varchar2,
                                  p_error   OUT VARCHAR2) as
    archivo  utl_file.file_type;
    aaaammdd varchar(8);
    cadena   varchar(250);

  begin

    aaaammdd := to_char(p_fecha, 'yyyymmdd');

    archivo := utl_file.fopen('TRFAVVILLAS', 'envioAvvillas.xx', 'W');

    cadena := 'gpg --batch --encrypt-files -r simitpruebas ' ||
              'CNJ650D.TRANSFER.' || aaaammdd || '.TXT';

    cadena := cadena || ' > logEnvioAvvillas.txt';

    utl_file.put_line(archivo, cadena, true);

    utl_file.fclose(archivo);

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [generarScriptAvvillas] ' || SQLERRM,
            p_error);

  end generarScriptAvvillas;

  PROCEDURE generarScriptDavivienda(p_fecha   date,
                                    p_usuario varchar2,
                                    p_error   OUT VARCHAR2) as
    archivo  utl_file.file_type;
    aaaammdd varchar(8);
    cadena   varchar(250);

    CURSOR cuentas is
      select max(tipocuenta) as tipocuenta, cuenta
        from cta_recaudo_concesionario t
       where idbanco = '51'
       group by cuenta;
    --AND CUENTA NOT IN ('186992848','186992830'); ctascon recaudo especial

  begin

    aaaammdd := to_char(p_fecha, 'yyyymmdd');

    archivo := utl_file.fopen('TRFDAVIVIENDA', 'envioDavivienda.sh', 'W');

    for cta in cuentas loop

      cadena := 'gpg --batch --encrypt-files -r simitpruebas ' ||
                cta.cuenta || '_' || aaaammdd || '.TXT';

      utl_file.put_line(archivo, cadena, true);
    end loop;

    utl_file.fclose(archivo);

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [generarScriptAvvillas] ' || SQLERRM,
            p_error);

  end generarScriptDavivienda;

  PROCEDURE ejecutarScriptAvvillas(p_fecha   date,
                                   p_usuario varchar2,
                                   p_error   OUT VARCHAR2) as
    aaaammdd varchar(8);
    comando  varchar(250);
    salida   varchar(250);

  begin

    aaaammdd := to_char(p_fecha, 'yyyymmdd');

    comando := '/bin/sh /trfavvillas/envioAvvillas2.sh&' || aaaammdd;

    salida := Shell_Run(comando);

    if (substr(salida, 0, 2) <> '0:') then
      p_error := salida;
      return;
    end if;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [ejecutarScriptAvvillas] ' || SQLERRM,
            p_error);

  end ejecutarScriptAvvillas;

  PROCEDURE ejecutarScriptDavivienda(p_fecha   date,
                                     p_usuario varchar2,
                                     p_error   OUT VARCHAR2) as
    aaaammdd varchar(8);
    comando  varchar(250);
    salida   varchar(250);

  begin

    aaaammdd := to_char(p_fecha, 'yyyymmdd');

    comando := '/bin/sh /trfdavivienda/envioDavivienda.sh&' || aaaammdd;

    salida := Shell_Run(comando);

    if (substr(salida, 0, 2) <> '0:') then
      p_error := salida;
      return;
    end if;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [ejecutarScriptDavivienda] ' || SQLERRM,
            p_error);

  end ejecutarScriptDavivienda;

  PROCEDURE ejecutarScriptBogota(p_fecha   date,
                                 p_usuario varchar2,
                                 p_error   OUT VARCHAR2) as
    aaaammdd varchar(8);
    comando  varchar(250);
    salida   varchar(250);

  begin

    aaaammdd := to_char(p_fecha, 'yyyymmdd');

    comando := '/bin/sh /trfbogota/envioBogota.sh&' || aaaammdd;

    salida := Shell_Run(comando);

    if (substr(salida, 0, 2) <> '0:') then
      p_error := salida;
      return;
    end if;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [ejecutarScriptBogota] ' || SQLERRM,
            p_error);

  end ejecutarScriptBogota;

  PROCEDURE verLogEnvioAvvillas(salida OUT VARCHAR2) as
    archivo      utl_file.file_type;
    input_buffer varchar2(1000);

  begin

    archivo := utl_file.fopen('TRFAVVILLAS', 'envioAvvillas.sh.log', 'R');

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
      salida := 'NO FUE POSIBLE LEER LOG envioAvvillas.sh.log: ' || SQLERRM;

  end verLogEnvioAvvillas;

  PROCEDURE verLogEnvioDavivienda(salida OUT VARCHAR2) as
    archivo      utl_file.file_type;
    input_buffer varchar2(1000);

  begin

    archivo := utl_file.fopen('TRFDAVIVIENDA',
                              'envioDavivienda.sh.log',
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
      salida := 'NO FUE POSIBLE LEER LOG envioDavivienda.sh.log: ' ||
                SQLERRM;

  end verLogEnvioDavivienda;

  PROCEDURE verLogEnvioBogota(salida OUT VARCHAR2) as
    archivo      utl_file.file_type;
    input_buffer varchar2(1000);

  begin

    archivo := utl_file.fopen('TRFBOGOTA', 'envioBogota.sh.log', 'R');

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
      salida := 'NO FUE POSIBLE LEER LOG envioBogota.sh.log: ' || SQLERRM;

  end verLogEnvioBogota;

  procedure aplicaNovedadesMunicipio(p_fecha date) is
    w_registros number;
  BEGIN

    -- aplica novedades de adicion

    select count(*)
      into w_registros
      from novmunicipio n
     where n.estadonov = 'VALIDADA'
       and n.fechaact <= p_fecha
       and n.fechaaplicacion is null
       and n.tiponov = '01';

    if (w_registros > 0) then
      /*
      n.idmunicipio,
                       n.nit_m,
                       n.nombre,
                       n.iddepartamento,
                       n.idconcesionario,
                       n.correo,
                       n.indretroactividad,
                       n.idbanco,
                       n.tipocuenta,
                       n.cuenta,
                       n.nit_cta,
                       n.indliq_s_ext,
                       n.indliq_s_local,
                       n.indliq_p_ext,
                       n.indliq_p_local,
                       n.indacuerdopago_2002
                 */

      DECLARE
        CURSOR cnov IS
          Select *
            from novmunicipio n
           where n.estadonov = 'VALIDADA'
             and n.fechaaplicacion is null
             and fechaact <= p_fecha
             and n.tiponov = '01'
           order by n.idmunicipio asc, n.fechanov asc;
        cnov_rec cnov%ROWTYPE;
      BEGIN
        FOR cnov_rec IN cnov LOOP

          select count(*)
            into w_registros
            from municipio
           where idMunicipio = cnov_rec.idmunicipio;

          if (w_registros = 0) then

            insert into municipio
              (idmunicipio,
               nit_m,
               nombre,
               iddepartamento,
               idconcesionario,
               correo,
               indretroactividad,
               idbanco,
               tipocuenta,
               cuenta,
               nit_cta,
               indliq_s_ext,
               indliq_s_local,
               indliq_p_ext,
               indliq_p_local,
               indacuerdopago_2002)
            values
              (cnov_rec.idmunicipio,
               cnov_rec.nit_m,
               cnov_rec.nombre,
               cnov_rec.iddepartamento,
               cnov_rec.idconcesionario,
               cnov_rec.correo,
               cnov_rec.indretroactividad,
               cnov_rec.idbanco,
               cnov_rec.tipocuenta,
               cnov_rec.cuenta,
               cnov_rec.nit_cta,
               cnov_rec.indliq_s_ext,
               cnov_rec.indliq_s_local,
               cnov_rec.indliq_p_ext,
               cnov_rec.indliq_p_local,
               cnov_rec.indacuerdopago_2002);

            insert into p_dispersion_municipio
              (idmunicipio,
               municipio_s,
               fcm_contravencional_s,
               conces_contravencional_s,
               acuerdopago_s,
               municipio_p,
               fcm_contravencional_p,
               conces_contravencional_p,
               acuerdopago_p)
            values
              (cnov_rec.idmunicipio,
               cnov_rec.municipio_s,
               cnov_rec.fcm_contravencional_s,
               cnov_rec.conces_contravencional_s,
               cnov_rec.acuerdopago_s,
               cnov_rec.municipio_p,
               cnov_rec.fcm_contravencional_p,
               cnov_rec.conces_contravencional_p,
               cnov_rec.acuerdopago_p);

            update novmunicipio
               set (fechaaplicacion, estadonov) =
                   (select sysdate, 'ACTIVADA' from dual)
             where estadonov = 'VALIDADA'
               and fechaact <= p_fecha
               and fechaaplicacion is null
               and tiponov = '01'
               and numeronov = cnov_rec.numeronov;

            commit;

          end if;

        END LOOP;
      END;

    end if;

    -- aplica novedades de actualizacion

    select count(*)
      into w_registros
      from novmunicipio n
     where n.estadonov = 'VALIDADA'
       and n.fechaact <= p_fecha
       and n.fechaaplicacion is null
       and n.tiponov = '02';

    if (w_registros > 0) then

      DECLARE
        CURSOR cnov IS
          Select n.idmunicipio,
                 n.nit_m,
                 n.nombre,
                 n.iddepartamento,
                 n.idconcesionario,
                 n.correo,
                 n.indretroactividad,
                 n.idbanco,
                 n.tipocuenta,
                 n.cuenta,
                 n.nit_cta,
                 n.indliq_s_ext,
                 n.indliq_s_local,
                 n.indliq_p_ext,
                 n.indliq_p_local,
                 n.indacuerdopago_2002
            from novmunicipio n
           where n.estadonov = 'VALIDADA'
             and n.fechaaplicacion is null
             and fechaact <= p_fecha
             and n.tiponov = '02'
           order by n.idmunicipio asc, n.fechanov asc;
        cnov_rec cnov%ROWTYPE;
      BEGIN
        FOR cnov_rec IN cnov LOOP
          update municipio
             set idmunicipio         = cnov_rec.idmunicipio,
                 nit_m               = cnov_rec.nit_m,
                 nombre              = cnov_rec.nombre,
                 iddepartamento      = cnov_rec.iddepartamento,
                 idconcesionario     = cnov_rec.idconcesionario,
                 correo              = cnov_rec.correo,
                 indretroactividad   = cnov_rec.indretroactividad,
                 idbanco             = cnov_rec.idbanco,
                 tipocuenta          = cnov_rec.tipocuenta,
                 cuenta              = cnov_rec.cuenta,
                 nit_cta             = cnov_rec.nit_cta,
                 indliq_s_ext        = cnov_rec.indliq_s_ext,
                 indliq_s_local      = cnov_rec.indliq_s_local,
                 indliq_p_ext        = cnov_rec.indliq_p_ext,
                 indliq_p_local      = cnov_rec.indliq_p_local,
                 indacuerdopago_2002 = cnov_rec.indacuerdopago_2002
           where idmunicipio = cnov_rec.idmunicipio;
        END LOOP;
      END;

      DECLARE
        CURSOR cpor IS
          select n.idmunicipio,
                 n.municipio_s,
                 n.fcm_contravencional_s,
                 n.conces_contravencional_s,
                 n.acuerdopago_s,
                 n.municipio_p,
                 n.fcm_contravencional_p,
                 n.conces_contravencional_p,
                 n.acuerdopago_p
            from novmunicipio n
           where n.estadonov = 'VALIDADA'
             and n.fechaact <= p_fecha
             and n.fechaaplicacion is null
             and n.tiponov = '02'
           order by n.idmunicipio asc, n.fechanov asc;

        cnov_por cpor%ROWTYPE;
      BEGIN
        FOR cnov_por IN cpor LOOP
          update p_dispersion_municipio
             set idmunicipio              = cnov_por.idmunicipio,
                 municipio_s              = cnov_por.municipio_s,
                 fcm_contravencional_s    = cnov_por.fcm_contravencional_s,
                 conces_contravencional_s = cnov_por.conces_contravencional_s,
                 acuerdopago_s            = cnov_por.acuerdopago_s,
                 municipio_p              = cnov_por.municipio_p,
                 fcm_contravencional_p    = cnov_por.fcm_contravencional_p,
                 conces_contravencional_p = cnov_por.conces_contravencional_p,
                 acuerdopago_p            = cnov_por.acuerdopago_p
           where idmunicipio = cnov_por.idmunicipio;
        END LOOP;
      END;

      update novmunicipio
         set (fechaaplicacion, estadonov) =
             (select sysdate, 'ACTIVADA' from dual)
       where estadonov = 'VALIDADA'
         and fechaact <= p_fecha
         and fechaaplicacion is null
         and tiponov = '02';

      commit;

    end if;

  END aplicaNovedadesMunicipio;

  procedure aplicaNovedadesDiasMunicipio(p_fecha date) is
    w_registros number;
  BEGIN

    -- aplica novedades de adicion

    select count(*)
      into w_registros
      from novdias_dispersion n
     where n.estadonov = 'VALIDADA'
       and n.fechaact <= p_fecha
       and n.fechaaplicacion is null
       and n.tiponov = '06';

    if (w_registros > 0) then

      insert into dias_dispersion
        (idmunicipio,
         idbanco,
         dias_dispersion_sl,
         frec_dispersion_sl,
         dias_dispersion_pl,
         frec_dispersion_pl,
         dias_dispersion_se,
         frec_dispersion_se,
         dias_dispersion_pe,
         frec_dispersion_pe)

        select idmunicipio,
               idbanco,
               dias_dispersion_sl,
               frec_dispersion_sl,
               dias_dispersion_pl,
               frec_dispersion_pl,
               dias_dispersion_se,
               frec_dispersion_se,
               dias_dispersion_pe,
               frec_dispersion_pe
          from novdias_dispersion
         where estadonov = 'VALIDADA'
           and fechaact <= p_fecha
           and fechaaplicacion is null
           and tiponov = '06';

      update novdias_dispersion
         set (fechaaplicacion, estadonov) =
             (select sysdate, 'ACTIVADA' from dual)
       where estadonov = 'VALIDADA'
         and fechaact <= p_fecha
         and fechaaplicacion is null
         and tiponov = '06';

      commit;

    end if;

    -- aplica novedades de actualizacion

    select count(*)
      into w_registros
      from novdias_dispersion n
     where n.estadonov = 'VALIDADA'
       and n.fechaact <= p_fecha
       and n.fechaaplicacion is null
       and n.tiponov = '07';

    if (w_registros > 0) then

      DECLARE
        CURSOR cnov IS
          select idmunicipio,
                 idbanco,
                 dias_dispersion_sl,
                 frec_dispersion_sl,
                 dias_dispersion_pl,
                 frec_dispersion_pl,
                 dias_dispersion_se,
                 frec_dispersion_se,
                 dias_dispersion_pe,
                 frec_dispersion_pe
            from novdias_dispersion
           where estadonov = 'VALIDADA'
             and fechaaplicacion is null
             and fechaact <= p_fecha
             and tiponov = '07'
           order by idmunicipio asc, fechanov asc;

        cnov_rec cnov%ROWTYPE;

      BEGIN
        FOR cnov_rec IN cnov LOOP

          update dias_dispersion
             set idmunicipio        = cnov_rec.idmunicipio,
                 idbanco            = cnov_rec.idbanco,
                 dias_dispersion_sl = cnov_rec.dias_dispersion_sl,
                 frec_dispersion_sl = cnov_rec.frec_dispersion_sl,
                 dias_dispersion_pl = cnov_rec.dias_dispersion_pl,
                 frec_dispersion_pl = cnov_rec.frec_dispersion_pl,
                 dias_dispersion_se = cnov_rec.dias_dispersion_se,
                 frec_dispersion_se = cnov_rec.frec_dispersion_se,
                 dias_dispersion_pe = cnov_rec.dias_dispersion_pe,
                 frec_dispersion_pe = cnov_rec.frec_dispersion_pe
           where idmunicipio = cnov_rec.idmunicipio;

        END LOOP;
      END;

      update novdias_dispersion
         set (fechaaplicacion, estadonov) =
             (select sysdate, 'ACTIVADA' from dual)
       where estadonov = 'VALIDADA'
         and fechaact <= p_fecha
         and fechaaplicacion is null
         and tiponov = '07';

      commit;

    end if;

    -- aplica novedades de eliminacion

    select count(*)
      into w_registros
      from novdias_dispersion n
     where n.estadonov = 'VALIDADA'
       and n.fechaact <= p_fecha
       and n.fechaaplicacion is null
       and n.tiponov = '08';

    if (w_registros > 0) then

      DECLARE
        CURSOR cnov IS
          select idmunicipio,
                 idbanco,
                 dias_dispersion_sl,
                 frec_dispersion_sl,
                 dias_dispersion_pl,
                 frec_dispersion_pl,
                 dias_dispersion_se,
                 frec_dispersion_se,
                 dias_dispersion_pe,
                 frec_dispersion_pe
            from novdias_dispersion
           where estadonov = 'VALIDADA'
             and fechaaplicacion is null
             and fechaact <= p_fecha
             and tiponov = '08'
           order by idmunicipio asc, fechanov asc;

        cnov_rec cnov%ROWTYPE;

      BEGIN
        FOR cnov_rec IN cnov LOOP

          delete from dias_dispersion
           where idmunicipio = cnov_rec.idmunicipio
             and idbanco = cnov_rec.idbanco;

        END LOOP;
      END;

      update novdias_dispersion
         set (fechaaplicacion, estadonov) =
             (select sysdate, 'ACTIVADA' from dual)
       where estadonov = 'VALIDADA'
         and fechaact <= p_fecha
         and fechaaplicacion is null
         and tiponov = '08';

      commit;

    end if;

  END aplicaNovedadesDiasMunicipio;

  procedure aplicaNovedadesTercero(p_fecha date) is
    w_registros number;
  BEGIN
    -- aplica novedades de eliminacion

    select count(*)
      into w_registros
      from novTercero n
     where n.estadonov = 'VALIDADA'
       and n.fechaact <= p_fecha
       and n.fechaaplicacion is null
       and n.tiponov = '05';

    if (w_registros > 0) then

      DECLARE
        CURSOR cnov IS
          select idmunicipio,
                 nit_t,
                 nombre,
                 idbanco,
                 tipocuenta,
                 cuenta,
                 base_s,
                 base_p,
                 ind_base,
                 num_tercero,
                 correotercero
            from novTercero
           where estadonov = 'VALIDADA'
             and fechaaplicacion is null
             and fechaact <= p_fecha
             and tiponov = '05'
           order by idmunicipio asc, fechanov asc;

        cnov_rec cnov%ROWTYPE;

      BEGIN
        FOR cnov_rec IN cnov LOOP

          delete from tercero
           where idmunicipio = cnov_rec.idmunicipio
             and num_tercero = cnov_rec.num_tercero;

        END LOOP;
      END;

      update novTercero
         set (fechaaplicacion, estadonov) =
             (select sysdate, 'ACTIVADA' from dual)
       where estadonov = 'VALIDADA'
         and fechaact <= p_fecha
         and fechaaplicacion is null
         and tiponov = '05';

      commit;

    end if;

    -- aplica novedades de adicion

    select count(*)
      into w_registros
      from novTercero n
     where n.estadonov = 'VALIDADA'
       and n.fechaact <= p_fecha
       and n.fechaaplicacion is null
       and n.tiponov = '03';

    if (w_registros > 0) then

      DECLARE
        CURSOR cnovAdd IS
          select idmunicipio,
                 nit_t,
                 nombre,
                 idbanco,
                 tipocuenta,
                 cuenta,
                 base_s,
                 base_p,
                 ind_base,
                 num_tercero,
                 correotercero
            from novTercero
           where estadonov = 'VALIDADA'
             and fechaaplicacion is null
             and fechaact <= p_fecha
             and tiponov = '03'
           order by idmunicipio asc, fechanov asc;

        cnov_recAdd cnovAdd%ROWTYPE;

      BEGIN

        FOR cnov_recAdd IN cnovAdd LOOP

          BEGIN

            insert into tercero
              (idmunicipio,
               nit_t,
               nombre,
               idbanco,
               tipocuenta,
               cuenta,
               base_s,
               base_p,
               ind_base,
               num_tercero,
               correotercero)
              select cnov_recAdd.idmunicipio,
                     cnov_recAdd.nit_t,
                     cnov_recAdd.nombre,
                     cnov_recAdd.idbanco,
                     cnov_recAdd.tipocuenta,
                     cnov_recAdd.cuenta,
                     cnov_recAdd.base_s,
                     cnov_recAdd.base_p,
                     cnov_recAdd.ind_base,
                     cnov_recAdd.num_tercero,
                     cnov_recAdd.correotercero
                from dual;

            commit;
          EXCEPTION
            WHEN OTHERS THEN

              update tercero
                 set idmunicipio   = cnov_recAdd.idmunicipio,
                     nit_t         = cnov_recAdd.nit_t,
                     nombre        = cnov_recAdd.nombre,
                     idbanco       = cnov_recAdd.idbanco,
                     tipocuenta    = cnov_recAdd.tipocuenta,
                     cuenta        = cnov_recAdd.cuenta,
                     base_s        = cnov_recAdd.base_s,
                     base_p        = cnov_recAdd.base_p,
                     ind_base      = cnov_recAdd.ind_base,
                     num_tercero   = cnov_recAdd.num_tercero,
                     correotercero = cnov_recAdd.correotercero
               where idmunicipio = cnov_recAdd.idmunicipio
                 and num_tercero = cnov_recAdd.num_tercero;
              commit;

          end;
        END LOOP;

      END;

      update novTercero
         set (fechaaplicacion, estadonov) =
             (select sysdate, 'ACTIVADA' from dual)
       where estadonov = 'VALIDADA'
         and fechaact <= p_fecha
         and fechaaplicacion is null
         and tiponov = '03';

      commit;

    end if;

    -- aplica novedades de actualizacion

    select count(*)
      into w_registros
      from novTercero n
     where n.estadonov = 'VALIDADA'
       and n.fechaact <= p_fecha
       and n.fechaaplicacion is null
       and n.tiponov = '04';

    if (w_registros > 0) then

      DECLARE
        CURSOR cnov IS
          select idmunicipio,
                 nit_t,
                 nombre,
                 idbanco,
                 tipocuenta,
                 cuenta,
                 base_s,
                 base_p,
                 ind_base,
                 num_tercero,
                 correotercero
            from novTercero
           where estadonov = 'VALIDADA'
             and fechaaplicacion is null
             and fechaact <= p_fecha
             and tiponov = '04'
           order by idmunicipio asc, fechanov asc;

        cnov_rec cnov%ROWTYPE;

      BEGIN
        FOR cnov_rec IN cnov LOOP

          update tercero
             set idmunicipio   = cnov_rec.idmunicipio,
                 nit_t         = cnov_rec.nit_t,
                 nombre        = cnov_rec.nombre,
                 idbanco       = cnov_rec.idbanco,
                 tipocuenta    = cnov_rec.tipocuenta,
                 cuenta        = cnov_rec.cuenta,
                 base_s        = cnov_rec.base_s,
                 base_p        = cnov_rec.base_p,
                 ind_base      = cnov_rec.ind_base,
                 num_tercero   = cnov_rec.num_tercero,
                 correotercero = cnov_rec.correotercero
           where idmunicipio = cnov_rec.idmunicipio
             and num_tercero = cnov_rec.num_tercero;

        END LOOP;
      END;

      update novTercero
         set (fechaaplicacion, estadonov) =
             (select sysdate, 'ACTIVADA' from dual)
       where estadonov = 'VALIDADA'
         and fechaact <= p_fecha
         and fechaaplicacion is null
         and tiponov = '04';

      commit;

    end if;

  END aplicaNovedadesTercero;

  PROCEDURE valida_transferencia(p_fec_ini_ano number,
                                 p_fec_ini_mes number,
                                 p_fec_ini_dia number,
                                 p_usuario     varchar2,
                                 p_error       OUT VARCHAR2) as
    w_fec_trf_ini date;
    w_registros   number;

  begin
    -- VALIDACIONES
    if (not p_usuario = '99999999') THEN
      sp_v_usuario(p_usuario, p_error, 'pk_proc');
    END IF;

    IF not P_ERROR is null THEN
      return;
    END IF;

    select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                   p_fec_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_trf_ini
      from DUAL;

    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_externo_disp_tot
     where fec_dispersion = w_fec_trf_ini;

    IF w_registros = 0 THEN
      p_error := 'NO SE HA REALIZADO EL PROCESO DE TRANSFERENCIA DE LA FECHA';
      RETURN;
    END IF;

    p_error := 'OK';

  END valida_transferencia;

  PROCEDURE ejecutarDesencripta(p_fecha   date,
                                p_usuario varchar2,
                                p_idbanco varchar2,
                                p_error   OUT VARCHAR2,
                                salida    OUT VARCHAR2) as
    aaaammdd     varchar(8);
    mmdd         varchar(4);
    aammdd       varchar(6);
    comando      varchar(250);
    archivo      utl_file.file_type;
    input_buffer varchar2(1000);

  begin

    aaaammdd := to_char(p_fecha, 'yyyymmdd');
    mmdd     := to_char(p_fecha, 'mmdd');
    aammdd   := to_char(p_fecha, 'yymmdd');

    if (p_idbanco = '52') then
      comando := 'sh /trfavvillas/desencriptar.sh ' || aaaammdd || ' ' || mmdd;
    else
      comando := 'sh /trfdavivienda/desencriptar.sh ' || aaaammdd || ' ' ||
                 aammdd;
    end if;

    salida := Shell_Run(comando);

    if (substr(salida, 0, 2) <> '0:') then
      p_error := salida;
      return;
    end if;

    p_error := 'DESENCRIPCION CORRECTA';

    verLogDesencripta(p_idbanco, salida);

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [ejecutarDesencripta] ' || SQLERRM,
            p_error);

  end ejecutarDesencripta;

  PROCEDURE desencripta_Banco(p_fec_ini_ano number,
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

    ejecutarDesencripta(p_fecha, p_usuario, p_idbanco, p_error, p_log);

    verLogDesencripta(p_idbanco, p_log);

    p_error := 'Se lanzo proceso OK';

    sp_log(p_usuario,
           'desencripta_Banco',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia);

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [desencripta_Banco] ' || SQLERRM,
            p_error);

  end desencripta_Banco;

  PROCEDURE verLogDesencripta(p_idbanco varchar2, salida OUT VARCHAR2) as
    archivo      utl_file.file_type;
    input_buffer varchar2(1000);

  begin

    if (p_idbanco = '52') then
      archivo := utl_file.fopen('TRFAVVILLAS', 'desencriptar.sh.log', 'R');
    else
      archivo := utl_file.fopen('TRFDAVIVIENDA', 'desencriptar.sh.log', 'R');
    end if;

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
      salida := 'NO FUE POSIBLE LEER LOG desencriptar.sh.log: ' || SQLERRM;

  end verLogDesencripta;

  PROCEDURE envio_Banco_repro(p_fec_ini_ano number,
                              p_fec_ini_mes number,
                              p_fec_ini_dia number,
                              p_fec_fin_ano number,
                              p_fec_fin_mes number,
                              p_fec_fin_dia number,
                              p_idbanco     varchar2,
                              p_usuario     varchar2,
                              p_error       OUT VARCHAR2,
                              p_log         out varchar2) as

    w_registros number;
    archivo     utl_file.file_type;
    aaaammdd    varchar(8);
    hhmmss      varchar(6);
    p_fecha_ini date;
    p_fecha_fin date;

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
      into p_fecha_ini
      from DUAL;

    select TO_DATE(p_fec_fin_ano || '-' || p_fec_fin_mes || '-' ||
                   p_fec_fin_dia,
                   'YYYY-MM-DD')
      into p_fecha_fin
      from DUAL;

    -- obtiene cantidad de registros actualizados
    /*    select count(*)
          into w_registros
          from recaudo_externo_disp_tot
         where (fec_corte_ini >= p_fecha_ini and fec_corte_ini <= p_fecha_fin)
           and enviadobanco = 1
           and ori_idbanco = p_idbanco;

        IF w_registros > 0 THEN
          p_error := 'PROCESO NO EJECUTADO. ARCHIVOS YA ENVIADOS A BANCO. SOLICITAR AUTORIZACION';
          -- ver log envio
          if p_idbanco = '52' then
            verLogEnvioAvvillas(p_log);
          end if;
          if p_idbanco = '50' then
            verLogEnvioDavivienda(p_log);
          end if;

          RETURN;
        END IF;

    */
    if p_idbanco = '52' then
      -- generar archivo transferencia avvillas
      generarArchivoAvvillas_repro(p_fecha_ini,
                                   p_fecha_fin,
                                   p_usuario,
                                   p_error);

      IF not P_ERROR is null THEN
        return;
      END IF;

      -- ejecutar script transferencia avvillas
      ejecutarScriptAvvillas(sysdate, p_usuario, p_error);

      /*IF not P_ERROR is null THEN
        p_error := 'Error en script avvillas codigo ' ||
                   substr(p_error, 0, 3);
        verLogEnvioAvvillas(p_log);
        return;
      END IF;*/

      -- ver log envio
      verLogEnvioAvvillas(p_log);

      /*if (instr(p_log, 'Login failed') > 0) then
        p_error := 'Envio Avvillas. Fallo FTP:Login failed';
        return;
      end if;
      */
    end if;

    if (p_idbanco = '50') or (p_idbanco = '51') then

      -- generar archivo transferencia avvillas
      generarArchivoDavivienda_repro(p_fecha_ini,
                                     p_fecha_fin,
                                     p_usuario,
                                     p_error);

      IF not P_ERROR is null THEN
        return;
      END IF;

      -- ejecutar script transferencia davivienda
      ejecutarScriptDavivienda(sysdate, p_usuario, p_error);

      /*IF not P_ERROR is null THEN
        p_error := 'Error en script Davivienda codigo ' ||
                   substr(p_error, 0, 3);
        verLogEnvioDavivienda(p_log);
        return;
      END IF;*/

      -- ver log envio
      verLogEnvioDavivienda(p_log);
      /*
      if (instr(p_log, 'Login failed') > 0) then
        p_error := 'Envio Davivienda. Fallo FTP:Login failed';
        return;
      end if;
      */
    end if;

    if p_idbanco = '01' then
      -- generar archivo transferencia avvillas
      generarArchivoBogota_repro(p_fecha_ini,
                                 p_fecha_fin,
                                 p_usuario,
                                 p_error);

      IF not P_ERROR is null THEN
        return;
      END IF;

      -- ejecutar script transferencia avvillas
      --ejecutarScriptAvvillas(sysdate, p_usuario, p_error);

      /*IF not P_ERROR is null THEN
        p_error := 'Error en script avvillas codigo ' ||
                   substr(p_error, 0, 3);
        verLogEnvioAvvillas(p_log);
        return;
      END IF;*/

      -- ver log envio
      --verLogEnvioAvvillas(p_log);
      p_log := 'Banco no maneja encripcion';

      /*if (instr(p_log, 'Login failed') > 0) then
        p_error := 'Envio Avvillas. Fallo FTP:Login failed';
        return;
      end if;
      */
    end if;
    update recaudo_externo_disp_tot
       set enviadobanco = 1, estadotrf = 'ENV', fechaenvio = sysdate
     where fec_corte_ini >= p_fecha_ini
       and fec_corte_ini <= p_fecha_fin
       and ori_idbanco = decode(p_idbanco, '50', '51', p_idbanco);

    commit;

    p_error := 'Archivos generados OK';

    select count(*)
      into w_registros
      from recaudo_externo_disp_tot
     where fec_corte_ini >= p_fecha_ini
       and fec_corte_ini <= p_fecha_fin
       and ori_idbanco = decode(p_idbanco, '50', '51', p_idbanco);

    IF w_registros = 0 THEN
      p_error := p_error ||
                 '.ADVERTENCIA: NO HAY TRANSFERENCIAS PROGRAMADASPARA LA FECHA DADA';
      RETURN;
    END IF;

    sp_log(p_usuario,
           'envio_Banco_repro',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia || ':' ||
           p_fec_fin_ano || '-' || p_fec_fin_mes || '-' || p_fec_fin_dia || ':' ||
           p_idbanco);

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [envio_Banco_repro] ' || SQLERRM,
            p_error);

  end envio_Banco_repro;

  PROCEDURE generarArchivoAvvillas_repro(p_fecha_ini date,
                                         p_fecha_fin date,
                                         p_usuario   varchar2,
                                         p_error     OUT VARCHAR2) as

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
             id_concesionario_liq,
             orden,
             concepto,
             ori_idbanco,
             ori_tipocuenta,
             ori_cuenta,
             ori_nit,
             des_idbanco,
             des_tipocuenta,
             desencriptar(des_cuenta) as des_cuenta,
             des_nit,
             indtipo,
             valor,
             idmunicipio,
             referenciatrf,
             nvl(TIPO_IDE_DEST, 'N') tipoIdeDest
        from recaudo_externo_disp_tot
       where (fec_dispersion >= p_fecha_ini and
             fec_dispersion <= p_fecha_fin)
         and ori_idbanco = '52';

  begin

    aaaammdd := to_char(sysdate, 'yyyymmdd');
    hhmmss   := to_char(sysdate, 'hhmmss');

    archivo  := utl_file.fopen('TRFAVVILLAS',
                               'CNJ650D.TRANSFER.' || aaaammdd || '.TXT',
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

      if (registro.des_idbanco = '50') then
        cadena := cadena || '051'; -- banco destino
      else
        cadena := cadena || '0' || registro.des_idbanco; -- banco destino
      end if;

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

      cadena := cadena || registro.tipoIdeDest; -- tipo identificacion destino
      cadena := cadena || trim(to_char(to_number(registro.des_nit),
                                       '0000000000000000'));

      --cadena := cadena || '000000' || registro.des_nit; -- identificacion destino

      /*      cadena := cadena || 'N'; -- tipo identificacion destino
            cadena := cadena || '000000' || registro.des_nit; -- identificacion destino
      */
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
            p_usuario || ' [generarArchivoAvvillas_repro] ' || SQLERRM,
            p_error);

  end generarArchivoAvvillas_repro;

  PROCEDURE generarArchivoBancafe_repro(p_fecha_ini date,
                                        p_fecha_fin date,
                                        p_usuario   varchar2,
                                        p_error     OUT VARCHAR2) as

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
        from cta_recaudo_concesionario t
       where idbanco = '50'
         AND CUENTA NOT IN ('186992848', '186992830')
       group by cuenta;

  begin

    aaaammdd := to_char(sysdate, 'yyyymmdd');
    hhmmss   := to_char(sysdate, 'hhmmss');

    for cta in cuentas loop

      select sum(valor)
        into vlrTotal
        from recaudo_externo_disp_tot
       where fec_dispersion >= p_fecha_ini
         and fec_dispersion <= p_fecha_fin
         and ori_idbanco = '50'
         and ori_cuenta = cta.cuenta;

      select count(*)
        into numTotal
        from recaudo_externo_disp_tot
       where fec_dispersion >= p_fecha_ini
         and fec_dispersion <= p_fecha_fin
         and ori_idbanco = '50'
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
      cadena := cadena || '000050';

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

      cadena := cadena || aaaammdd; -- fech-generacion
      cadena := cadena || '000000'; -- hora generacion
      cadena := cadena || '00'; -- ind-inscripcion
      cadena := cadena || '00'; -- tipo-identificacion
      cadena := cadena || '000000000000'; -- numero-cliente
      cadena := cadena || '0000'; -- oficina-rec-emp
      cadena := cadena || '0000'; -- actu-co
      cadena := cadena || '0'; -- ind-encripcion
      cadena := cadena || '01'; -- long-arch-s
      cadena := cadena || '0000000000000000'; -- cta-empresa-abono
      cadena := cadena || '000000'; -- talon-abono
      cadena := cadena || '00000000000'; -- filler

      utl_file.put_line(archivo, cadena, true);
      for reg in (select fec_dispersion,
                         id_concesionario_liq,
                         orden,
                         concepto,
                         ori_idbanco,
                         ori_tipocuenta,
                         ori_cuenta,
                         ori_nit,
                         des_idbanco,
                         des_tipocuenta,
                         desencriptar(des_cuenta) as des_cuenta,
                         des_nit,
                         indtipo,
                         valor,
                         idmunicipio,
                         referenciatrf
                    from recaudo_externo_disp_tot
                   where fec_dispersion >= p_fecha_ini
                     and fec_dispersion <= p_fecha_fin
                     and ori_idbanco = '50'
                     and ori_cuenta = cta.cuenta)

       loop
        cadena := '55000000' || reg.des_nit; -- tipo registro

        -- nro referencia
        strValor := trim(to_char(reg.referenciatrf, '0000000000000000'));
        cadena   := cadena || strValor;

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

        cadena := cadena || '0000' || reg.des_idbanco; --banco destino

        strValor := trim(to_char(reg.valor * 100, '000000000000000000'));
        cadena   := cadena || strValor; -- valor

        cadena := cadena || '000000'; -- numero talon
        cadena := cadena || '03'; -- tipo ide destino
        cadena := cadena || '0'; -- valide ide
        cadena := cadena || '9999'; -- respuesta traslado
        cadena := cadena || '0000000000000000000000000000000000000000'; --mensaje
        cadena := cadena || '000000000000000000'; -- valor acumulado
        cadena := cadena || aaaammdd; --fecha a
        cadena := cadena || '0000'; -- oficina-rec-det
        cadena := cadena || '0000'; -- motivo-det
        cadena := cadena || '0000'; -- nvo-indalt-tarj
        cadena := cadena || '0'; -- indic-emerg
        cadena := cadena || '00'; -- indic-emerg

        utl_file.put_line(archivo, cadena, true);

      end loop;

      utl_file.fclose(archivo);
    end loop;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [generarArchivoAvvillas] ' || SQLERRM,
            p_error);

  end generarArchivoBancafe_repro;

  PROCEDURE generarArchivoDavivienda_repro(p_fecha_ini date,
                                           p_fecha_fin date,
                                           p_usuario   varchar2,
                                           p_error     OUT VARCHAR2) as

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
        from cta_recaudo_concesionario t
       where idbanco = '51'
         AND CUENTA NOT IN ('186992848', '186992830')
       group by cuenta;

  begin

    aaaammdd := to_char(sysdate, 'yyyymmdd');
    hhmmss   := to_char(sysdate, 'hhmmss');

    for cta in cuentas loop

      select sum(valor)
        into vlrTotal
        from recaudo_externo_disp_tot
       where fec_dispersion >= p_fecha_ini
         and fec_dispersion <= p_fecha_fin
         and ori_idbanco in ('50', '51')
         and ori_cuenta = cta.cuenta;

      select count(*)
        into numTotal
        from recaudo_externo_disp_tot
       where fec_dispersion >= p_fecha_ini
         and fec_dispersion <= p_fecha_fin
         and ori_idbanco in ('50', '51')
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
                         id_concesionario_liq,
                         orden,
                         concepto,
                         ori_idbanco,
                         ori_tipocuenta,
                         ori_cuenta,
                         ori_nit,
                         des_idbanco,
                         des_tipocuenta,
                         desencriptar(des_cuenta) as des_cuenta,
                         des_nit,
                         indtipo,
                         valor,
                         idmunicipio,
                         referenciatrf
                    from recaudo_externo_disp_tot
                   where fec_dispersion >= p_fecha_ini
                     and fec_dispersion <= p_fecha_fin
                     and ori_idbanco in ('50', '51')
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
            p_usuario || ' [generarArchivoAvvillas] ' || SQLERRM,
            p_error);

  end generarArchivoDavivienda_repro;

  PROCEDURE generarArchivoBogota_repro(p_fecha_ini date,
                                       p_fecha_fin date,
                                       p_usuario   varchar2,
                                       p_error     OUT VARCHAR2) as

    w_registros number;
    archivo     utl_file.file_type;

    aaaammddSis varchar(8);
    hhmmss      varchar(6);

    cadena   varchar(250);
    numreg   number;
    strValor varchar(250);
    vlrTotal number;
    numTotal number;

    longitud number;

    CURSOR cuentas is
      select max(tipocuenta) as tipocuenta, cuenta
        from cta_recaudo_concesionario t
       where idbanco = '01'
       group by cuenta;

  begin

    aaaammddSis := to_char(sysdate, 'yyyymmdd');
    hhmmss      := to_char(sysdate, 'hhmmss');

    for cta in cuentas loop

      select sum(valor)
        into vlrTotal
        from recaudo_externo_disp_tot
       where fec_dispersion >= p_fecha_ini
         and fec_dispersion <= p_fecha_fin
         and ori_idbanco in ('01')
         and ori_cuenta = cta.cuenta;

      select count(*)
        into numTotal
        from recaudo_externo_disp_tot
       where fec_dispersion >= p_fecha_ini
         and fec_dispersion <= p_fecha_fin
         and ori_idbanco in ('01')
         and ori_cuenta = cta.cuenta;

      if (numTotal > 0) then

        archivo := utl_file.fopen('TRFBOGOTA',
                                  cta.cuenta || '_' || aaaammddSis || '.TXT',
                                  'W');

        --crear header
        cadena   := '1'; -- tipo reg
        cadena   := cadena || aaaammddSis; -- FECHA APLICACION
        cadena   := cadena || '000000000000000000000000'; -- CEROS
        cadena   := cadena || '2'; -- AHORROS
        cadena   := cadena || '000000'; -- CEROS
        strValor := trim(to_char(to_number(cta.cuenta), '00000000000'));
        cadena   := cadena || strValor;
        cadena   := cadena || 'FEDERACION COLOMBIANA  DE MUNICIPIOS    '; -- NOMBRE EMPRESA
        cadena   := cadena || '08000826650'; --nit empresa
        cadena   := cadena || '002'; --TIPO MVTO
        cadena   := cadena || '0001'; --CODIGO CIUDAD
        cadena   := cadena || aaaammddSis; -- FECHA GENERACION
        strValor := trim(to_char(to_number(cta.cuenta), '000000000'));
        cadena   := cadena || SUBSTR(strValor, 1, 3); -- OFICINA CTA
        cadena   := cadena || 'N'; -- TIPO IDENTIFICACION
        strValor := rpad(' ', 48);
        cadena   := cadena || strValor; -- espacios 48
        cadena   := cadena || ' '; -- datos adicionales
        strValor := rpad(' ', 80);
        cadena   := cadena || strValor; -- espacios 80

        utl_file.put_line(archivo, cadena, true);

        for reg in (select fec_dispersion,
                           id_concesionario_liq,
                           orden,
                           concepto,
                           ori_idbanco,
                           ori_tipocuenta,
                           ori_cuenta,
                           ori_nit,
                           des_idbanco,
                           des_tipocuenta,
                           desencriptar(des_cuenta) as des_cuenta,
                           des_nit,
                           indtipo,
                           valor,
                           idmunicipio,
                           referenciatrf,
                           nvl(TIPO_IDE_DEST, 'N') tipoIdeDest
                      from recaudo_externo_disp_tot
                     where fec_dispersion >= p_fecha_ini
                       and fec_dispersion <= p_fecha_fin
                       and ori_idbanco in ('01')
                       and ori_cuenta = cta.cuenta)

         loop
          cadena   := '2'; -- tipo registro
          cadena   := cadena || reg.tipoIdeDest; -- tipo identificacion
          strValor := trim(to_char(to_number(reg.des_nit), '00000000000'));
          cadena   := cadena || strValor; -- nit destino
          strValor := rpad(reg.concepto, 40);
          cadena   := cadena || substr(strValor, 1, 40); -- nombre beneficiario
          cadena   := cadena || '0'; -- cero
          -- tipo cuenta destino
          if (reg.des_tipocuenta = 'AHO') then
            cadena := cadena || '2';
          end if;

          if (reg.des_tipocuenta = 'CTE') then
            cadena := cadena || '1';
          end if;

          -- cuenta destino
          strValor := rpad(reg.des_cuenta, 17);
          cadena   := cadena || substr(strValor, 1, 17);

          -- valor abono
          strValor := trim(to_char(reg.valor * 100, '000000000000000000'));
          cadena   := cadena || strValor; -- valor

          -- forma de pago
          cadena := cadena || 'A';
          cadena := cadena || '000'; -- ceros

          -- banco destino
          if (reg.des_idbanco = '50') then
            cadena := cadena || '051'; --banco davivienda
          else
            cadena := cadena || '0' || reg.des_idbanco; --banco destino
          end if;

          cadena   := cadena || '0001'; --CODIGO CIUDAD
          cadena   := cadena || 'FCM      '; --adenda
          cadena   := cadena || ' '; -- espacio
          strValor := rpad(' ', 70);
          cadena   := cadena || strValor; -- espacios 70
          cadena   := cadena || '0'; -- cero

          -- referencia
          strValor := trim(to_char(reg.referenciatrf, '0000000000'));
          cadena   := cadena || strValor;

          cadena := cadena || 'N'; -- enviar info
          cadena := cadena || '        '; -- espacios 8

          -- couta libranza
          strValor := trim(to_char(0, '000000000000000000'));
          cadena   := cadena || strValor;

          cadena := cadena || '           '; -- espacios 11
          cadena := cadena || '           '; -- espacios 11
          cadena := cadena || 'N'; -- enviar info

          cadena := cadena || '        '; -- espacios 8

          utl_file.put_line(archivo, cadena, true);

        end loop;

        utl_file.fclose(archivo);
      end if;
    end loop;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [generarArchivoBogotaRepro] ' || SQLERRM,
            p_error);

  end generarArchivoBogota_repro;

PROCEDURE i_recaudo_local_ajustes(

                                    p_idbanco       char,
                                    p_cta_recaudo   varchar2,
                                    p_indtipo       char,
                                    p_fec_corte_ano number,
                                    p_fec_corte_mes number,
                                    p_fec_corte_dia number,
                                    p_fec_tran_ano  number,
                                    p_fec_tran_mes  number,
                                    p_fec_tran_dia  number,

                                    p_vig_ini_ano number,
                                    p_vig_ini_mes number,
                                    p_vig_ini_dia number,

                                    p_vig_fin_ano number,
                                    p_vig_fin_mes number,
                                    p_vig_fin_dia number,

                                    p_valor_total number,
                                    p_idmunicipio char,
                                    p_periodo     char,

                                    p_quincena char,

                                    p_p_consignado number,
                                    p_motivo       varchar2,
                                    p_acuerdo      number,
                                    p_usuario      varchar2,
                                    p_error        OUT VARCHAR2) AS

    w_fecha_cor recaudo_local_ajustes.fec_corte%TYPE;
    w_fecha_tra recaudo_local_ajustes.fec_tran%TYPE;

    w_operacion varchar2(250);

    w_registros number;

    v_fecIni date;
    v_fecFin date;
    anoIni   number;
    anoFin   number;

    strVig varchar2(500);

  BEGIN

    select TO_DATE(p_fec_corte_ano || '-' || p_fec_corte_mes || '-' ||
                   p_fec_corte_dia,
                   'YYYY-MM-DD')
      into w_fecha_cor
      from DUAL;

    select TO_DATE(p_fec_tran_ano || '-' || p_fec_tran_mes || '-' ||
                   p_fec_tran_dia,
                   'YYYY-MM-DD')
      into w_fecha_tra
      from DUAL;

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    select count(*)
      into w_registros
      from recaudo_local_liquidacion l
     where l.periodo = p_periodo
       and l.quincena = p_quincena;

    IF w_registros > 0 THEN
      p_error := 'AJUSTE NO POSIBLE. PERIODO/QUINCENA YA LIQUIDADA. SOLICITAR REPROCESO Y GRABAR AJUSTE';
      RETURN;
    END IF;

    if ( p_fec_corte_dia <= 15 ) then
      if ( p_quincena <> '15') then
      p_error := 'ERROR. QUINCENA DEBE SER 15';
      RETURN;
      end if;
    end if;

    if ( p_fec_corte_dia > 15 ) then
      if ( p_quincena <> '30') then
      p_error := 'ERROR. QUINCENA DEBE SER 30';
      RETURN;
      end if;
    end if;

    select count(*)
      into w_registros
      from cta_recaudo_fcm c
     where c.cuenta = p_cta_recaudo;

    IF w_registros = 0 THEN
      p_error := 'AJUSTE NO POSIBLE. CUENTA DE RECAUDO NO DEFINIDA';
      RETURN;
    END IF;

    select count(*)
      into w_registros
      from cta_recaudo_fcm c
     where c.cuenta = p_cta_recaudo
       AND C.IDBANCO = p_idbanco;

    IF w_registros = 0 THEN
      p_error := 'AJUSTE NO POSIBLE. CUENTA DE RECAUDO NO DEFINIDA PARA EL BANCO';
      RETURN;
    END IF;

    select TO_DATE(p_vig_ini_ano || '-' || p_vig_ini_mes || '-' ||
                   p_vig_ini_dia,
                   'YYYY-MM-DD')
      into v_fecIni
      from DUAL;

    select TO_DATE(p_vig_fin_ano || '-' || p_vig_fin_mes || '-' ||
                   p_vig_fin_dia,
                   'YYYY-MM-DD')
      into v_fecFin
      from DUAL;

    IF v_fecIni > v_fecFin THEN
      p_error := 'FECHAS VIGENCIAS ERRADAS';
      RETURN;
    END IF;

    anoIni := to_number(to_char(v_fecIni, 'yyyy'));
    anoFin := to_number(to_char(v_fecFin, 'yyyy'));

    while anoIni <= anoFin loop
      if anoIni = to_number(to_char(v_fecIni, 'yyyy')) then
        strVig := trim(to_char(anoIni));
      else
        strVig := strVig || '-' || trim(to_char(anoIni));
      end if;
      anoIni := anoIni + 1;
    end loop;

    insert into recaudo_local_ajustes
      (idbanco,
       cta_recaudo,
       indtipo,
       fec_corte,
       fec_tran,
       valor_total,
       idmunicipio,
       periodo,
       id_recaudo_local_ajustes,
       p_consignado,
       motivo,
       quincena,
       vigencia,
       FEC_VIG_INI,
       FEC_VIG_FIN,
       acuerdo)
    values
      (p_idbanco,
       p_cta_recaudo,
       p_indtipo,
       w_fecha_cor,
       w_fecha_tra,
       p_valor_total,
       p_idmunicipio,
       p_periodo,
       SEQ_RECAUDO_LOCAL_AJUSTES.NEXTVAL,
       p_p_consignado,
       p_motivo,
       p_quincena,
       strVig,
       v_fecIni,
       v_fecFin,
       p_acuerdo
       );

    w_operacion := 'i_recaudo_local_ajustes';
    p_error     := 'Ajuste Recaudo Local Agregado Exitosamente. ';

    sp_log(p_usuario,
           w_operacion,
           p_idbanco || '-' || p_cta_recaudo || '-' || p_indtipo || '-' ||
           w_fecha_cor || '-' || w_fecha_tra || '-' || p_valor_total || '-' ||
           p_idmunicipio || '-' || p_periodo);
    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [i_recaudo_local_ajustes] ' || SQLERRM,
            p_error);

  END i_recaudo_local_ajustes;

  PROCEDURE d_recaudo_local_ajustes(p_id_recaudo_local_ajustes number,
                                    p_usuario                  varchar2,
                                    p_error                    OUT VARCHAR2) is

    w_registros   number;
    p_cta_recaudo varchar2(16);
    w_fecha_cor   date;

  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    IF not P_ERROR is null THEN
      return;
    end if;

    SELECT l.cta_recaudo, l.fec_corte
      into p_cta_recaudo, w_fecha_cor
      FROM recaudo_local_ajustes l
     where id_recaudo_local_ajustes = p_id_recaudo_local_ajustes;

    select count(*)
      into w_registros
      from recaudo_local_liquidacion l
     where l.fec_corte = w_fecha_cor
       and l.cta_recaudo = p_cta_recaudo;

    -- Se comentarian las siguientes lineas por solicitud del ing Hugo Cendales el dia 11 febrero de 2015

    IF w_registros > 0 THEN
      p_error := 'AJUSTE NO POSIBLE. CUENTA YA LIQUIDADA PARA ESA FECHA DE CORTE. SOLICITAR AUTORIZACION';
      RETURN;
    END IF;

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      delete recaudo_local_ajustes
       where id_recaudo_local_ajustes = p_id_recaudo_local_ajustes;

      delete soporteajustesrecloc
       where id_recaudo_local_ajustes = p_id_recaudo_local_ajustes;

      sp_log(p_usuario,
             'd_recaudo_local_ajustes',
             p_id_recaudo_local_ajustes);
      commit;

      p_error := 'Ajuste Recaudo Local eliminado Exitosamente. ';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [d_recaudo_local_ajustes] ' || SQLERRM,
            p_error);
  END d_recaudo_local_ajustes;

PROCEDURE q_recaudo_local_ajustes(p_id_recaudo_local_ajustes number,
                                    p_idbanco                  out varchar2,
                                    p_cta_recaudo              out varchar2,
                                    p_indtipo                  out varchar2,
                                    p_fec_corte                out date,
                                    p_fec_tran                 out date,
                                    p_valor_total              out number,
                                    p_idmunicipio              out char,
                                    p_periodo                  out varchar2,
                                    p_quincena                 out varchar2,
                                    p_p_consignado             out number,
                                    p_motivo                   out varchar2,
                                    p_vigencia                 out varchar2,
                                    p_fec_vig_ini              out varchar2,
                                    p_fec_vig_fin              out varchar2,
                                    p_acuerdo                  out number,
                                    p_usuario                  varchar2,
                                    p_error                    OUT VARCHAR2

                                    ) AS

    w_registros number;
  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    IF not P_ERROR is null THEN
      return;
    end if;

    select count(*)
      into w_registros
      from recaudo_local_ajustes l
     where l.id_recaudo_local_ajustes = p_id_recaudo_local_ajustes;

    IF w_registros = 0 THEN
      p_error := 'AJUSTE NO EXISTE';
      RETURN;
    END IF;

    select idbanco,
           cta_recaudo,
           indtipo,
           fec_corte,
           fec_tran,
           valor_total,
           idmunicipio,
           periodo,
           p_consignado,
           motivo,
           quincena,
           vigencia,
           to_char(FEC_VIG_INI,'yyyy-mm-dd'),
           to_char(FEC_VIG_FIN,'yyyy-mm-dd'),
           nvl(acuerdo,0)
      into p_idbanco,
           p_cta_recaudo,
           p_indtipo,
           p_fec_corte,
           p_fec_tran,
           p_valor_total,
           p_idmunicipio,
           p_periodo,
           p_p_consignado,
           p_motivo,
           p_quincena,
           p_vigencia,
           p_fec_vig_ini,
           p_fec_vig_fin,
           p_acuerdo
      from recaudo_local_ajustes
     where id_recaudo_local_ajustes = p_id_recaudo_local_ajustes;

    p_error := 'Consulta OK';

    sp_log(p_usuario,
           'q_recaudo_local_ajustes',
           '' || p_id_recaudo_local_ajustes);
    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [q_recaudo_local_ajustes] ' || SQLERRM,
            p_error);

  END q_recaudo_local_ajustes;

  PROCEDURE i_archivoSoporte(p_id_recaudo_local_ajustes number,
                             p_filename                 varchar2,
                             p_nombreDocumento          varchar2,
                             p_extensionArchivo         varchar2,
                             p_bfile                    blob,
                             p_usuario                  varchar2,
                             p_error                    OUT VARCHAR2) is
    p_uploadid number;
    extension  varchar2(10);

  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    if not P_ERROR is null then
      return;
    end if;

    select seq_uploads.nextval into p_uploadid from dual;

    insert into soporteajustesrecloc
      (id_recaudo_local_ajustes,
       id_documento,
       nombredocumento,
       nombrearchivo,
       extensionarchivo,
       datosarchivo,
       usuariocargue,
       fechacargue)
    values
      (p_id_recaudo_local_ajustes,
       p_uploadid,
       p_nombreDocumento,
       p_filename,
       p_extensionArchivo,
       p_bfile,
       p_usuario,
       sysdate);

    sp_log(p_usuario, 'i_archivoSoporte', p_filename);

    p_error := MSG_INS_OK;

    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [i_archivoSoporte] ' || SQLERRM,
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
      from soporteajustesrecloc
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
      from soporteajustesrecloc
     where id_documento = p_id_documento;

    sp_log(p_usuario, 'q_archivoSoporte', p_id_documento);

    p_error := 'Consulta OK';

    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [q_archivoSoporte] ' || SQLERRM,
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
      from soporteajustesrecloc
     where id_documento = p_id_documento;

    IF w_registros = 0 THEN
      p_error := 'Documento no existe';
      RETURN;
    END IF;

    delete soporteajustesrecloc where id_documento = p_id_documento;

    sp_log(p_usuario, 'd_archivoSoporte', p_id_documento);

    p_error := MSG_DEL_OK;

    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [q_archivoSoporte] ' || SQLERRM,
            p_error);
  END d_archivoSoporte;

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
             id_concesionario_liq,
             orden,
             concepto,
             ori_idbanco,
             ori_tipocuenta,
             ori_cuenta,
             ori_nit,
             des_idbanco,
             des_tipocuenta,
             desencriptar(des_cuenta) as des_cuenta,
             des_nit,
             indtipo,
             valor,
             --idmunicipio,
             referenciatrf,
             'N' tipoIdeDest
        from recaudo_local_disp_tot
       where fec_dispersion = p_fecha
         and ori_idbanco = '52';

  begin

    aaaammdd := to_char(p_fecha, 'yyyymmdd');
    hhmmss   := to_char(sysdate, 'hhmmss');

    archivo  := utl_file.fopen('TRFAVVILLAS',
                               'CNJ650D.TRANSFER.LOCAL' || aaaammdd ||
                               '.TXT',
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

      if (registro.des_idbanco = '50') then
        cadena := cadena || '051'; -- banco destino
      else
        cadena := cadena || '0' || registro.des_idbanco; -- banco destino
      end if;

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

      cadena := cadena || registro.tipoIdeDest; -- tipo identificacion destino
      cadena := cadena || trim(to_char(to_number(registro.des_nit),
                                       '0000000000000000'));

      --cadena := cadena || '000000' || registro.des_nit; -- identificacion destino

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
            p_usuario || ' [generarArchivoAvvillas] ' || SQLERRM,
            p_error);

  end generarArchivoAvvillasLoc;

end pk_proc;
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
    num_reg    number;
    v_idBanco  char(2);
    v_fecCorte date;
    v_day      number;
    v_quincena number;
  
  begin
  
    select count(*)
      into num_reg
      from trxsinidentificar
     where numSecuenciaReg = p_numSecuenciaReg;
  
    if (num_reg = 0) then
      p_error := 'No existe registro ' || to_char(p_numSecuenciaReg);
      return;
    end if;
  
    if (p_idmunicipioiden <> 'SIN MUNICIPIO' AND
       p_idmunicipioiden <> '00000001') then
      select count(*)
        into num_reg
        from municipio m
       where m.idmunicipio = p_idmunicipioiden
         and m.idmunicipio <> '00000000';
    
      if (num_reg = 0) then
        p_error := 'No existe municipio para registro ' ||
                   p_idmunicipioiden || '-' || to_char(p_numSecuenciaReg);
        return;
      end if;
    
    end if;
  
    select count(*)
      into num_reg
      from trxsinidentificar
     where numsecuenciareg = p_numsecuenciareg
       and fechaliq is null;
  
    if (num_reg = 0) then
      p_error := 'Depositos ya liquidados. Debe solicitar reproceso. Numero de registro: ' ||
                 to_char(p_numSecuenciaReg);
      return;
    end if;
  
    select t.idbanco
      into v_idBanco
      from trxsinidentificar t
     where numsecuenciareg = p_numsecuenciareg;
  
    select max(r.fec_corte)
      into v_fecCorte
      from recaudo_local_liquidacion r
     where r.idbanco = v_idBanco;
  
    v_day := extract(day from v_fecCorte);
  
    v_quincena := 15;
    if (v_day <= 15) then
      v_quincena := 30;
    end if;
  
    if (p_idmunicipioiden <> 'SIN MUNICIPIO') then
      update trxsinidentificar
         set fechaidentificacion   = sysdate,
             usuarioidentificacion = to_number(p_usuario),
             indtipoiden           = p_indtipoiden,
             idmunicipioiden       = p_idmunicipioiden,
             p_consignadoiden      = p_p_consignadoiden,
             observaciones         = p_observaciones,
             estadoiden            = 'ID',
             quincena              = v_quincena
       where numsecuenciareg = p_numsecuenciareg;
    else
      update trxsinidentificar
         set fechaidentificacion   = null,
             usuarioidentificacion = null,
             indtipoiden           = null,
             idmunicipioiden       = null,
             p_consignadoiden      = null,
             observaciones         = null,
             fechaliq              = null,
             estadoiden            = 'SI'
       where numsecuenciareg = p_numsecuenciareg;
    end if;
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
           and ori_idbanco = p_banco;
      
        delete recaudo_local_disp
         where fec_corte_ini = w_fec_cor_ini
           and fec_corte_fin = w_fec_cor_fin
           and ori_idbanco = p_banco;
      
        delete recaudo_local_liquidacion
         where fec_corte >= w_fec_cor_ini
           and fec_corte <= w_fec_cor_fin
           and idbanco = p_banco;
      
        update trxsinidentificar
           set fechaliq = null
         where estadoiden = 'ID'
           and fechaliq >= w_fec_cor_ini
           and fechaliq <= w_fec_cor_fin
           and idbanco = p_banco;
      
        update recaudo_local
           set FECHALIQ = null
         where fechaliq = w_fec_cor_fin
           and idbanco = p_banco;
      
        update acuerdopago
           set fechaliq = null
         where vlrsimitantesprorroga <> 0
           and estado = 'LI'
           and fechaliq = w_fec_cor_fin
           and idbanco = p_banco;
      
        update acuerdopago
           set fechaliq = null
         where vlrpolcaantesprorroga <> 0
           and estado = 'LI'
           and fechaliq = w_fec_cor_fin
           and idbanco = p_banco;
      
        update acuerdopago
           set fechaliq = null
         where vlrsimitdespuesprorroga <> 0
           and estado = 'LI'
           and fechaliq = w_fec_cor_fin
           and idbanco = p_banco;
      
        update acuerdopago
           set fechaliq = null
         where vlrpolcadespuesprorroga <> 0
           and estado = 'LI'
           and fechaliq = w_fec_cor_fin
           and idbanco = p_banco;
      
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
  
    p_error := 'Aprobacion Correcta Recaudo local : ' || p_fec_ini_ano || '-' ||
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
       valor,
       indtipo)
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
             sum(valor),
             indtipo
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
                des_nit,
                indtipo;
  
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

  PROCEDURE contabiliza_recaudo_local(p_feccor_ini_ano number,
                                      p_feccor_ini_mes number,
                                      p_feccor_ini_dia number,
                                      p_feccor_fin_ano number,
                                      p_feccor_fin_mes number,
                                      p_feccor_fin_dia number,
                                      p_banco          varchar2,
                                      p_usuario        varchar2,
                                      p_error          OUT VARCHAR2) AS
    w_fec_cor_ini date;
    w_fec_cor_fin date;
    w_registros   number;
  
    w_fec_cor_ini_s char(8);
    w_fec_cor_fin_s char(8);
  
    tipoCon char(3);
  
    w_concepto varchar(250);
  
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
    cop  := 'COP';
  
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
  
    c20221  := '20221';
    c20222  := '20222';
    c20223  := '20223';
    c20224  := '20224';
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
  
    select decode(p_banco, '52', 'LRA', 'LRO') into tipoCon from dual;
  
    -- elimina contabilizacion
    delete recaudo_externo_contabilidad
     where to_date(fechaDoc, 'ddMMyyyy') >= w_fec_cor_ini
       and to_date(fechaDoc, 'ddMMyyyy') <= w_fec_cor_fin
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c50
               else
                c40
             end) as clavecontable,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    b.cuentacontable,
                    (case
                      when r.valor_total > 0 then
                       b.ctacontperiodoant
                      else
                       c.cta_cont_period_ant
                    end)) as cuenta,
             r.s_valor_2 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    '',
                    (case
                      when r.valor_total > 0 then
                       ''
                      else
                       c200102
                    end)) as centrocosto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    c20211 || substr(r.idconcesionario, 2, 1),
                    (case
                      when r.valor_total > 0 then
                       c20211 || substr(r.idconcesionario, 2, 1)
                      else
                       ''
                    end)) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    substr(m.nit_m, 0, 9),
                    (case
                      when r.valor_total > 0 then
                       substr(m.nit_m, 0, 9)
                      else
                       substr(c.nit_c, 0, 9)
                    end)) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                     b,
             municipio                 m,
             concesionario             c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'SIMIT'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c50
               else
                c40
             end) as clavecontable,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    b.cuentacontable,
                    (case
                      when r.valor_total > 0 then
                       b.ctacontperiodoant
                      else
                       c.cta_cont_period_ant
                    end)) as cuenta,
             r.s_valor_3 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    '',
                    (case
                      when r.valor_total > 0 then
                       ''
                      else
                       c200102
                    end)) as centrocosto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    c20212 || substr(r.idconcesionario, 2, 1),
                    (case
                      when r.valor_total > 0 then
                       c20212 || substr(r.idconcesionario, 2, 1)
                      else
                       ''
                    end)) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING FONDO COB ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    substr(m.nit_m, 0, 9),
                    (case
                      when r.valor_total > 0 then
                       substr(m.nit_m, 0, 9)
                      else
                       substr(c.nit_c, 0, 9)
                    end)) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                     b,
             municipio                 m,
             concesionario             c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'SIMIT'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c50
               else
                c40
             end) as clavecontable,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    b.cuentacontable,
                    (case
                      when r.valor_total > 0 then
                       b.ctacontperiodoant
                      else
                       c.cta_cont_period_antfcm
                    end)) as cuenta,
             r.s_valor_1 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    '',
                    (case
                      when r.valor_total > 0 then
                       ''
                      else
                       c200101
                    end)) as centrocosto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    c20213 || substr(r.idconcesionario, 2, 1),
                    (case
                      when r.valor_total > 0 then
                       c20213 || substr(r.idconcesionario, 2, 1)
                      else
                       ''
                    end)) as centrobeneficio,
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
             banco                     b,
             municipio                 m,
             concesionario             c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'SIMIT'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c50
               else
                c40
             end) as clavecontable,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    b.cuentacontable,
                    (case
                      when r.valor_total > 0 then
                       b.ctacontperiodoant
                      else
                       c.cta_cont_period_antfcm
                    end)) as cuenta,
             r.s_valor_4 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    '',
                    (case
                      when r.valor_total > 0 then
                       ''
                      else
                       c200101
                    end)) as centrocosto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    c20214 || substr(r.idconcesionario, 2, 1),
                    (case
                      when r.valor_total > 0 then
                       c20214 || substr(r.idconcesionario, 2, 1)
                      else
                       ''
                    end)) as centrobeneficio,
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
             banco                     b,
             municipio                 m,
             concesionario             c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'SIMIT'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c40
               else
                c50
             end) as clavecontable,
             decode(r.indorigen,
                    'IDE',
                    cr.cta_contable_ide,
                    cr.cta_contable) as cuenta,
             r.valor_total as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             decode(r.indorigen,
                    'IDE',
                    to_char(r.fec_tran, 'ddMMyyyy'),
                    to_char(r.fec_corte, 'ddMMyyyy')) as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             decode(r.indorigen,
                    'IDE',
                    b.nombre || ' ' || r.cta_recaudo || ' ' ||
                    to_char(r.fec_tran, 'ddMMyyyy'),
                    b.nombre || ' ' || r.cta_recaudo) AS textocabezera2,
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
             banco                     b,
             municipio                 m,
             concesionario             c,
             cta_recaudo_fcm           cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'SIMIT'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c40
               else
                c50
             end) as clavecontable,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    c.cta_contable_liquidacion,
                    (case
                      when r.valor_total > 0 then
                       c.cta_cont_period_ant
                      else
                       b.ctacontperiodoant
                    end)) as cuenta,
             r.s_valor_2 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    c200102,
                    (case
                      when r.valor_total > 0 then
                       c200102
                      else
                       ''
                    end)) as centrocosto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    '',
                    (case
                      when r.valor_total > 0 then
                       ''
                      else
                       c20211 || substr(r.idconcesionario, 2, 1)
                    end)) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC GASTO PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    substr(c.nit_c, 0, 9),
                    (case
                      when r.valor_total > 0 then
                       substr(c.nit_c, 0, 9)
                      else
                       substr(m.nit_m, 0, 9)
                    end)) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                     b,
             municipio                 m,
             concesionario             c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'SIMIT'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c40
               else
                c50
             end) as clavecontable,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    c.cta_contable_fondo,
                    (case
                      when r.valor_total > 0 then
                       c.cta_cont_period_ant
                      else
                       b.ctacontperiodoant
                    end)) as cuenta,
             r.s_valor_3 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    c200102,
                    (case
                      when r.valor_total > 0 then
                       c200102
                      else
                       ''
                    end)) as centrocosto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    '',
                    (case
                      when r.valor_total > 0 then
                       ''
                      else
                       c20212 || substr(r.idconcesionario, 2, 1)
                    end)) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC GASTO FONDO COB ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    substr(c.nit_c, 0, 9),
                    (case
                      when r.valor_total > 0 then
                       substr(c.nit_c, 0, 9)
                      else
                       substr(m.nit_m, 0, 9)
                    end)) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                     b,
             municipio                 m,
             concesionario             c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'SIMIT'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c31
               else
                c21
             end) as clavecontable,
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
        from recaudo_local_liquidacion r,
             banco                     b,
             municipio                 m,
             concesionario             c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'SIMIT'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c01
               else
                c11
             end) as clavecontable,
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
             banco                     b,
             municipio                 m,
             concesionario             c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'SIMIT'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c11
               else
                c01
             end) as clavecontable,
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
             banco                     b,
             municipio                 m,
             concesionario             c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'SIMIT'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c50
               else
                c40
             end) as clavecontable,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    b.cuentacontable,
                    (case
                      when r.valor_total > 0 then
                       b.ctacontperiodoant
                      else
                       c.cta_cont_period_ant
                    end)) as cuenta,
             r.p_valor_8 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    '',
                    (case
                      when r.valor_total > 0 then
                       ''
                      else
                       c200102
                    end)) as centrocosto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    c20221 || substr(r.idconcesionario, 2, 1),
                    (case
                      when r.valor_total > 0 then
                       c20221 || substr(r.idconcesionario, 2, 1)
                      else
                       ''
                    end)) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    substr(m.nit_m, 0, 9),
                    (case
                      when r.valor_total > 0 then
                       substr(m.nit_m, 0, 9)
                      else
                       substr(c.nit_c, 0, 9)
                    end)) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                     b,
             municipio                 m,
             concesionario             c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c50
               else
                c40
             end) as clavecontable,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    b.cuentacontable,
                    (case
                      when r.valor_total > 0 then
                       b.ctacontperiodoant
                      else
                       c.cta_cont_period_ant
                    end)) as cuenta,
             r.p_valor_9 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    '',
                    (case
                      when r.valor_total > 0 then
                       ''
                      else
                       c200102
                    end)) as centrocosto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    c20222 || substr(r.idconcesionario, 2, 1),
                    (case
                      when r.valor_total > 0 then
                       c20222 || substr(r.idconcesionario, 2, 1)
                      else
                       ''
                    end)) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING FONDO COB ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    substr(m.nit_m, 0, 9),
                    (case
                      when r.valor_total > 0 then
                       substr(m.nit_m, 0, 9)
                      else
                       substr(c.nit_c, 0, 9)
                    end)) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                     b,
             municipio                 m,
             concesionario             c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c50
               else
                c40
             end) as clavecontable,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    b.cuentacontable,
                    (case
                      when r.valor_total > 0 then
                       b.ctacontperiodoant
                      else
                       c.cta_cont_period_antfcm
                    end)) as cuenta,
             ROUND(r.p_valor_7 + r.p_valor_12, 0) as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    '',
                    (case
                      when r.valor_total > 0 then
                       ''
                      else
                       c200101
                    end)) as centrocosto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    c20223 || substr(r.idconcesionario, 2, 1),
                    (case
                      when r.valor_total > 0 then
                       c20223 || substr(r.idconcesionario, 2, 1)
                      else
                       ''
                    end)) as centrobeneficio,
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
             banco                     b,
             municipio                 m,
             concesionario             c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c50
               else
                c40
             end) as clavecontable,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    b.cuentacontable,
                    (case
                      when r.valor_total > 0 then
                       b.ctacontperiodoant
                      else
                       c.cta_cont_period_antfcm
                    end)) as cuenta,
             r.p_valor_10 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    '',
                    (case
                      when r.valor_total > 0 then
                       ''
                      else
                       c200101
                    end)) as centrocosto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    c20224 || substr(r.idconcesionario, 2, 1),
                    (case
                      when r.valor_total > 0 then
                       c20224 || substr(r.idconcesionario, 2, 1)
                      else
                       ''
                    end)) as centrobeneficio,
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
             banco                     b,
             municipio                 m,
             concesionario             c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c50
               else
                c40
             end) as clavecontable,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    b.cuentacontable,
                    (case
                      when r.valor_total > 0 then
                       b.ctacontperiodoant
                      else
                       c.cta_cont_period_ant
                    end)) as cuenta,
             r.p_valor_13 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    '',
                    (case
                      when r.valor_total > 0 then
                       ''
                      else
                       c200102
                    end)) as centrocosto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    c202213,
                    (case
                      when r.valor_total > 0 then
                       c202213
                      else
                       ''
                    end)) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING PART CONCES SEVIAL 3.0%') AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    substr(m.nit_m, 0, 9),
                    (case
                      when r.valor_total > 0 then
                       substr(m.nit_m, 0, 9)
                      else
                       substr(f.nit_sevial, 0, 9)
                    end)) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                     b,
             municipio                 m,
             concesionario             c,
             fcm                       f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c40
               else
                c50
             end) as clavecontable,
             decode(r.indorigen,
                    'IDE',
                    cr.cta_contable_ide,
                    cr.cta_contable) as cuenta,
             r.valor_total as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             decode(r.indorigen,
                    'IDE',
                    to_char(r.fec_tran, 'ddMMyyyy'),
                    to_char(r.fec_corte, 'ddMMyyyy')) as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             decode(r.indorigen,
                    'IDE',
                    b.nombre || ' ' || r.cta_recaudo || ' ' ||
                    to_char(r.fec_tran, 'ddMMyyyy'),
                    b.nombre || ' ' || r.cta_recaudo) AS textocabezera2,
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
             banco                     b,
             municipio                 m,
             concesionario             c,
             cta_recaudo_fcm           cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c31
               else
                c21
             end) as clavecontable,
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
             banco                     b,
             municipio                 m,
             concesionario             c,
             fcm                       f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c40
               else
                c50
             end) as clavecontable,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    c.cta_contable_liquidacion,
                    (case
                      when r.valor_total > 0 then
                       c.cta_cont_period_ant
                      else
                       b.ctacontperiodoant
                    end)) as cuenta,
             r.p_valor_8 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    c200102,
                    (case
                      when r.valor_total > 0 then
                       c200102
                      else
                       ''
                    end)) as centrocosto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    '',
                    (case
                      when r.valor_total > 0 then
                       ''
                      else
                       c20221 || substr(r.idconcesionario, 2, 1)
                    end)) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC GASTO PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    substr(c.nit_c, 0, 9),
                    (case
                      when r.valor_total > 0 then
                       substr(c.nit_c, 0, 9)
                      else
                       substr(m.nit_m, 0, 9)
                    end)) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                     b,
             municipio                 m,
             concesionario             c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c40
               else
                c50
             end) as clavecontable,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    c.cta_contable_liquidacion,
                    (case
                      when r.valor_total > 0 then
                       c.cta_cont_period_ant
                      else
                       b.ctacontperiodoant
                    end)) as cuenta,
             r.p_valor_13 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    c200102,
                    (case
                      when r.valor_total > 0 then
                       c200102
                      else
                       ''
                    end)) as centrocosto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    '',
                    (case
                      when r.valor_total > 0 then
                       ''
                      else
                       c202213
                    end)) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC GASTO PART CONCES SEVIAL 3%') AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    substr(f.nit_sevial, 0, 9),
                    (case
                      when r.valor_total > 0 then
                       substr(f.nit_sevial, 0, 9)
                      else
                       substr(m.nit_m, 0, 9)
                    end)) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                     b,
             municipio                 m,
             concesionario             c,
             fcm                       f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c31
               else
                c21
             end) as clavecontable,
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
             banco                     b,
             municipio                 m,
             concesionario             c,
             fcm                       f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c40
               else
                c50
             end) as clavecontable,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    c.cta_contable_fondo,
                    (case
                      when r.valor_total > 0 then
                       c.cta_cont_period_ant
                      else
                       b.ctacontperiodoant
                    end)) as cuenta,
             r.p_valor_9 as importe,
             '' as indicadorimpuesto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    c200102,
                    (case
                      when r.valor_total > 0 then
                       c200102
                      else
                       ''
                    end)) as centrocosto,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    '',
                    (case
                      when r.valor_total > 0 then
                       ''
                      else
                       c20222 || substr(r.idconcesionario, 2, 1)
                    end)) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC GASTO FONDO COB ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             decode(to_char(r.fec_corte, 'yyyy'),
                    to_char(r.fec_tran, 'yyyy'),
                    substr(c.nit_c, 0, 9),
                    (case
                      when r.valor_total > 0 then
                       substr(c.nit_c, 0, 9)
                      else
                       substr(m.nit_m, 0, 9)
                    end)) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                     b,
             municipio                 m,
             concesionario             c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c31
               else
                c21
             end) as clavecontable,
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
             banco                     b,
             municipio                 m,
             concesionario             c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c31
               else
                c21
             end) as clavecontable,
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
             banco                     b,
             municipio                 m,
             concesionario             c,
             fcm                       f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c31
               else
                c21
             end) as clavecontable,
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
             banco                     b,
             municipio                 m,
             concesionario             c,
             fcm                       f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c50
               else
                c40
             end) as clavecontable,
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
             banco                     b,
             municipio                 m,
             concesionario             c,
             fcm                       f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c50
               else
                c40
             end) as clavecontable,
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
             banco                     b,
             municipio                 m,
             concesionario             c,
             fcm                       f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             (to_char(r.idrecaudolocal_liquidacion, '0000000000') || 'A') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c01
               else
                c11
             end) as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.p_valor_7 + ROUND(r.p_valor_8, 0) + ROUND(r.p_valor_9, 0) +
             round(r.p_valor_10, 0) + ROUND(r.p_valor_11, 0) +
             r.p_valor_12 + ROUND(r.p_valor_13, 0) +
             ROUND(r.p_valor_14, 0)) as importe,
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
             banco                     b,
             municipio                 m,
             concesionario             c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             (to_char(r.idrecaudolocal_liquidacion, '0000000000') || 'A') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c11
               else
                c01
             end) as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.p_valor_7 + ROUND(r.p_valor_8, 0) + ROUND(r.p_valor_9, 0) +
             round(r.p_valor_10, 0) + ROUND(r.p_valor_11, 0) +
             r.p_valor_12 + ROUND(r.p_valor_13, 0) +
             ROUND(r.p_valor_14, 0)) as importe,
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
             banco                     b,
             municipio                 m,
             concesionario             c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c40
               else
                c50
             end) as clavecontable,
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
             banco                     b,
             municipio                 m,
             concesionario             c,
             fcm                       f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c31
               else
                c21
             end) as clavecontable,
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
             banco                     b,
             municipio                 m,
             concesionario             c,
             fcm                       f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') || 'S' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c40
               else
                c50
             end) as clavecontable,
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
             banco                     b,
             municipio                 m,
             concesionario             c,
             fcm                       f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') || 'S' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c31
               else
                c21
             end) as clavecontable,
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
             banco                     b,
             municipio                 m,
             concesionario             c,
             fcm                       f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.idconcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.indTipo = 'POLCA'
         and decode(r.idbanco, '52', '52', '99') = p_banco;
  
    update recaudo_externo_contabilidad r
       set r.importe = r.importe * -1
     where to_date(fechaDoc, 'ddMMyyyy') >= w_fec_cor_ini
       and to_date(fechaDoc, 'ddMMyyyy') <= w_fec_cor_fin
       and tipoContable = tipoCon
       and r.importe < 0;
  
    update recaudo_externo_contabilidad r
       set r.importe = ROUND(r.importe, 0)
     where to_date(fechaDoc, 'ddMMyyyy') >= w_fec_cor_ini
       and to_date(fechaDoc, 'ddMMyyyy') <= w_fec_cor_fin
       and tipoContable = tipoCon;
  
    delete recaudo_externo_contabilidad r
     where r.importe = 0
       AND to_date(fechaDoc, 'ddMMyyyy') >= w_fec_cor_ini
       and to_date(fechaDoc, 'ddMMyyyy') <= w_fec_cor_fin
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
             substr(a.fechadoc, 3, 2) as periodo,
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
               where to_date(c.fechadoc, 'ddMMyyyy') >= w_fec_cor_ini
                 and to_date(c.fechadoc, 'ddMMyyyy') <= w_fec_cor_fin
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
             substr(a.fechadoc, 3, 2) as periodo,
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
               where to_date(c.fechadoc, 'ddMMyyyy') >= w_fec_cor_ini
                 and to_date(c.fechadoc, 'ddMMyyyy') <= w_fec_cor_fin
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
           p_feccor_ini_dia || p_feccor_fin_ano || '-' || p_feccor_fin_mes || '-' ||
           p_feccor_fin_dia || p_banco);
  
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
    w_fec_cor_ini   date;
    w_fec_cor_ini_s date;
  
    w_registros number;
  
    w_concepto varchar(250);
  
    zt char(2);
    ze char(2);
    zd char(2);
  
    tipoCon char(3);
  
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
  
    aaaa0115 char(8);
  
  BEGIN
  
    zt := 'ZT';
    ze := 'ZE';
    zd := 'ZD';
  
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
  
    c20211 := '20211';
    c20212 := '20212';
    c20213 := '20213';
    c20214 := '20214';
  
    c20221  := '20221';
    c20222  := '20222';
    c20223  := '20223';
    c20224  := '20224';
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') || 'G' as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c21
               else
                c31
             end) as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             round(r.s_valor_6, 0) as importe,
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
             (case
               when r.valor_total > 0 then
                ''
               else
                cz000
             end) as condicionpago,
             substr(r.NIT_CONCESIONARIO, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                     b,
             municipio                 m,
             concesionario             c,
             cta_recaudo_fcm           cr
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') || 'G' as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c21
               else
                c31
             end) as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             round(r.s_valor_3, 0) as importe,
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
             (case
               when r.valor_total > 0 then
                ''
               else
                cz000
             end) as condicionpago,
             substr(r.NIT_FONDO, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                     b,
             municipio                 m,
             concesionario             c,
             cta_recaudo_fcm           cr
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') || 'G' as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c50
               else
                c40
             end) as clavecontable,
             c2905901012 as cuenta,
             round(r.s_valor_3, 0) + round(r.s_valor_6, 0) as importe,
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
             banco                     b,
             municipio                 m,
             concesionario             c,
             cta_recaudo_fcm           cr,
             fcm                       f
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c21
               else
                c31
             end) as clavecontable,
             substr(f.nit_polca, 0, 9) as cuenta,
             round(r.p_valor_15, 0) as importe,
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
             (case
               when r.valor_total > 0 then
                ''
               else
                cz000
             end) as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                     b,
             municipio                 m,
             concesionario             c,
             cta_recaudo_fcm           cr,
             fcm                       f
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c21
               else
                c31
             end) as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             round(r.p_valor_17, 0) as importe,
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
             (case
               when r.valor_total > 0 then
                ''
               else
                cz000
             end) as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                     b,
             municipio                 m,
             concesionario             c,
             cta_recaudo_fcm           cr,
             fcm                       f
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c21
               else
                c31
             end) as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             round(r.p_valor_20, 0) as importe,
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
             (case
               when r.valor_total > 0 then
                ''
               else
                cz000
             end) as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                     b,
             municipio                 m,
             concesionario             c,
             cta_recaudo_fcm           cr,
             fcm                       f
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c40
               else
                c50
             end) as clavecontable,
             c2905901003 as cuenta,
             round(r.p_valor_16, 0) as importe,
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
             banco                     b,
             municipio                 m,
             concesionario             c,
             cta_recaudo_fcm           cr,
             fcm                       f
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c40
               else
                c50
             end) as clavecontable,
             c2905901004 as cuenta,
             round(r.p_valor_19, 0) as importe,
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
             banco                     b,
             municipio                 m,
             concesionario             c,
             cta_recaudo_fcm           cr,
             fcm                       f
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c50
               else
                c40
             end) as clavecontable,
             c2905901012 as cuenta,
             round(r.p_valor_15, 0) + round(r.p_valor_16, 0) +
             round(r.p_valor_17, 0) + round(r.p_valor_19, 0) +
             round(r.p_valor_20, 0) as importe,
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
             banco                     b,
             municipio                 m,
             concesionario             c,
             cta_recaudo_fcm           cr,
             fcm                       f
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') || 'G' as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c21
               else
                c31
             end) as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             round(r.p_valor_13, 0) as importe,
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
             (case
               when r.valor_total > 0 then
                ''
               else
                cz000
             end) as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                     b,
             municipio                 m,
             concesionario             c,
             cta_recaudo_fcm           cr,
             fcm                       f
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') || 'G' as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c21
               else
                c31
             end) as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             round(r.p_valor_25, 0) as importe,
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
             (case
               when r.valor_total > 0 then
                ''
               else
                cz000
             end) as condicionpago,
             substr(r.NIT_CONCESIONARIO, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                     b,
             municipio                 m,
             concesionario             c,
             cta_recaudo_fcm           cr
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') || 'G' as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c21
               else
                c31
             end) as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             round(r.p_valor_9, 0) as importe,
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
             (case
               when r.valor_total > 0 then
                ''
               else
                cz000
             end) as condicionpago,
             substr(r.NIT_FONDO, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_liquidacion r,
             banco                     b,
             municipio                 m,
             concesionario             c,
             cta_recaudo_fcm           cr
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
             to_char(r.idrecaudolocal_liquidacion, '0000000000') || 'G' as referencia,
             ('PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             (case
               when r.valor_total > 0 then
                c50
               else
                c40
             end) as clavecontable,
             c2905901012 as cuenta,
             round(r.p_valor_13, 0) + round(r.p_valor_25, 0) +
             round(r.p_valor_9, 0) as importe,
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
             banco                     b,
             municipio                 m,
             concesionario             c,
             cta_recaudo_fcm           cr,
             fcm                       f
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
        from recaudo_local_disp_tot r, cta_recaudo_fcm cf, concesionario c
       where r.id_concesionario_liq = c.idconcesionario
         and cf.idbanco = r.ori_idbanco
         and cf.cuenta = r.ori_cuenta
         and cf.indtipo = r.indtipo
         and r.fec_dispersion = w_fec_cor_ini
         and r.orden = 2;
  
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
        from recaudo_local_disp_tot r, cta_recaudo_fcm cf, concesionario c
       where r.id_concesionario_liq = c.idconcesionario
         and cf.idbanco = r.ori_idbanco
         and cf.cuenta = r.ori_cuenta
         and cf.indtipo = r.indtipo
         and r.fec_dispersion = w_fec_cor_ini
         and r.orden = 3;
  
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
             substr(r.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_polca, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_disp_tot r,
             cta_recaudo_fcm        cf,
             concesionario          c,
             fcm                    f,
             cta_dispersion_fcm     cd
       where r.id_concesionario_liq = c.idconcesionario
         and cf.idbanco = r.ori_idbanco
         and cf.cuenta = r.ori_cuenta
         and cf.indtipo = r.indtipo
         and r.fec_dispersion = w_fec_cor_ini
         and f.nit_fcm = '8000826650'
         and cd.idbancorec = r.ori_idbanco
         and r.orden = 7;
  
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
             substr(r.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_disp_tot r,
             cta_recaudo_fcm        cf,
             concesionario          c,
             fcm                    f,
             cta_dispersion_fcm     cd
       where r.id_concesionario_liq = c.idconcesionario
         and cf.idbanco = r.ori_idbanco
         and cf.cuenta = r.ori_cuenta
         and cf.indtipo = r.indtipo
         and r.fec_dispersion = w_fec_cor_ini
         and f.nit_fcm = '8000826650'
         and cd.idbancorec = r.ori_idbanco
         and r.orden = 6;
  
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
             substr(r.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_disp_tot r,
             cta_recaudo_fcm        cf,
             concesionario          c,
             fcm                    f,
             cta_dispersion_fcm     cd
       where r.id_concesionario_liq = c.idconcesionario
         and cf.idbanco = r.ori_idbanco
         and cf.cuenta = r.ori_cuenta
         and cf.indtipo = r.indtipo
         and r.fec_dispersion = w_fec_cor_ini
         and f.nit_fcm = '8000826650'
         and cd.idbancorec = r.ori_idbanco
         and r.orden = 8;
  
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
             to_char(r.fec_dispersion, 'ddMMyyyy') as referencia,
             'BAN PAG ' || to_char(r.fec_dispersion, 'ddMMyyyy') as textocabezera,
             c40 as clavecontable,
             c2905901012 as cuenta,
             r.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechavalor,
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
        from recaudo_local_disp_tot r,
             cta_recaudo_fcm        cf,
             concesionario          c,
             fcm                    f
       where r.id_concesionario_liq = c.idconcesionario
         and cf.idbanco = r.ori_idbanco
         and cf.cuenta = r.ori_cuenta
         and cf.indtipo = r.indtipo
         and r.fec_dispersion = w_fec_cor_ini
         and f.nit_fcm = '8000826650'
         and r.orden in (2, 3, 7, 6, 8);
  
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
        from recaudo_local_disp_tot r, cta_recaudo_fcm cf, concesionario c
       where r.id_concesionario_liq = c.idconcesionario
         and cf.idbanco = r.ori_idbanco
         and cf.cuenta = r.ori_cuenta
         and cf.indtipo = r.indtipo
         and r.fec_dispersion = w_fec_cor_ini
         and r.orden = 4;
  
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
             substr('PAGO FONDO COBERTURA FCM ' || c.nombre, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             aaaa0115 as fechabase,
             cz000 as condicionpago,
             substr(r.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_disp_tot r, cta_recaudo_fcm cf, concesionario c
       where r.id_concesionario_liq = c.idconcesionario
         and cf.idbanco = r.ori_idbanco
         and cf.cuenta = r.ori_cuenta
         and cf.indtipo = r.indtipo
         and r.fec_dispersion = w_fec_cor_ini
         and r.orden = 4;
  
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
             substr(r.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_disp_tot r,
             cta_recaudo_fcm        cf,
             concesionario          c,
             fcm                    f
       where r.id_concesionario_liq = c.idconcesionario
         and cf.idbanco = r.ori_idbanco
         and cf.cuenta = r.ori_cuenta
         and cf.indtipo = r.indtipo
         and r.fec_dispersion = w_fec_cor_ini
         and f.nit_fcm = '8000826650'
         and r.orden = 1;
  
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
             substr(r.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             tipoCon as tipocontable
        from recaudo_local_disp_tot r,
             cta_recaudo_fcm        cf,
             concesionario          c,
             fcm                    f,
             cta_dispersion_fcm     cd
       where r.id_concesionario_liq = c.idconcesionario
         and cf.idbanco = r.ori_idbanco
         and cf.cuenta = r.ori_cuenta
         and cf.indtipo = r.indtipo
         and r.fec_dispersion = w_fec_cor_ini
         and f.nit_fcm = '8000826650'
         and cd.idbancorec = r.ori_idbanco
         and r.orden = 1;
  
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
        from (select sum(r.p_valor_17 + r.p_valor_20 - r.p_valor_21 -
                         r.p_valor_22) as valor,
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
             c40 as clavecontable,
             ct.cta_con_pa as cuenta,
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
        from (select sum(r.p_valor_16 + r.p_valor_19 + r.p_valor_21 +
                         r.p_valor_22) as valor,
                     r.idConcesionario as idConcesionario,
                     r.cta_recaudo as cta_recaudo,
                     max(r.fec_dispersion) as fec_dispersion,
                     max(r.nit_concesionario) as nitPago,
                     max(r.idbanco) as idbanco
                from recaudo_local_liquidacion r
               where r.fec_dispersion = w_fec_cor_ini
               group by r.idConcesionario, r.cta_recaudo) s,
             concesionario c,
             fcm f,
             cta_dispersion_fcm ct
       where s.idConcesionario = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and ct.nit_fcm = '8000826650'
         and ct.idbancorec = s.idbanco;
  
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
        from (select sum(r.p_valor_16 + r.p_valor_17 + r.p_valor_19 +
                         r.p_valor_20) as valor,
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
  
    update recaudo_externo_contabilidad r
       set r.importe = ROUND(r.importe, 0)
     where r.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
       and tipocontable = tipoCon;
  
    update recaudo_externo_contabilidad r
       set r.importe = r.importe * -1
     where r.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
       and tipocontable = tipoCon
       and r.importe < 0;
  
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

  PROCEDURE contabiliza_trf_siniden(p_feccor_ini_ano number,
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
  
    w_concepto varchar(250);
  
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
    cop  := 'COP';
  
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
     where to_date(fechaDoc, 'ddMMyyyy') >= w_fec_cor_ini
       and to_date(fechaDoc, 'ddMMyyyy') <= w_fec_cor_fin
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
             to_char(r.numsecuenciareg, '0000000000') as referencia,
             ('REC ' || to_char(r.fechatrx, 'ddMMyyyy') || ' ' || R.cuenta) as textocabezera,
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
        from trxsinidentificar r, banco b, fcm f, cta_recaudo_fcm cr
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
             to_char(r.numsecuenciareg, '0000000000') as referencia,
             ('REC ' || to_char(r.fechatrx, 'ddMMyyyy') || ' ' || R.cuenta) as textocabezera,
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
        from trxsinidentificar r, banco b, fcm f, cta_recaudo_fcm cr
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
           p_feccor_ini_dia || p_feccor_fin_ano || '-' || p_feccor_fin_mes || '-' ||
           p_feccor_fin_dia);
  
    commit;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [contabiliza_trf_siniden] ' || SQLERRM,
            p_error);
    
  END contabiliza_trf_siniden;

  procedure sp_valida_recaudo_local(p_fec_ini date,
                                    p_fec_fin date,
                                    p_usuario varchar2,
                                    p_error   OUT VARCHAR2) is
  
  BEGIN
  
    delete recaudo_local_validacion
    --     where fec_corte >= p_fec_ini
    --       and fec_corte <= p_fec_fin;
    
    commit;
    if (to_char(p_fec_ini, 'dd') <> '01' and
       to_char(p_fec_ini, 'dd') <> '16') then
      p_error := ' Fecha inicial debe ser 01 o 16 ';
      return;
    end if;
  
    if (to_char(p_fec_ini, 'dd') = '01') then
      if (to_char(p_fec_fin, 'dd') <> '15') then
        p_error := ' Fecha final debe ser 15';
        return;
      end if;
    end if;
  
    if (to_char(p_fec_ini, 'dd') = '16') then
      if (to_char(p_fec_fin, 'dd') <> '28' and
         to_char(p_fec_fin, 'dd') <> '29' and
         to_char(p_fec_fin, 'dd') <> '30' and
         to_char(p_fec_fin, 'dd') <> '31') then
        p_error := 'Fecha final debe ser fin de mes';
        return;
      end if;
    end if;
  
    delete recaudo_local_validacion
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin;
  
    insert into recaudo_local_validacion
      (idrecaudo_local_liquidacion,
       idbanco,
       cta_recaudo,
       indtipo,
       fec_corte,
       fec_tran,
       oficina_origen,
       valor_efectivo,
       valor_cheque,
       valor_total,
       nit_m,
       idmunicipio,
       iddepartamento,
       indorigen,
       p_consignado,
       vigencia,
       fec_vig_ini,
       fec_vig_fin)
      select seq_recaudo_local_validacion.Nextval,
             idbanco,
             cta_recaudo,
             indtipo,
             fec_corte,
             fec_tran,
             oficina_origen,
             valor_efectivo,
             valor_cheque,
             valor_total,
             nit_m,
             idmunicipio,
             Substr(idmunicipio, 1, 2),
             'REC',
             decode(indtipo, 'SIMIT', 10, 55),
             vigencia,
             fec_vig_ini,
             fec_vig_fin
        from recaudo_local
       where fec_corte >= p_fec_ini
         and fec_corte <= p_fec_fin;
  
    insert into recaudo_local_validacion
      (idrecaudo_local_liquidacion,
       idbanco,
       cta_recaudo,
       indtipo,
       fec_corte,
       fec_tran,
       oficina_origen,
       valor_efectivo,
       valor_cheque,
       valor_total,
       nit_m,
       idmunicipio,
       iddepartamento,
       indorigen,
       p_consignado,
       vigencia,
       fec_vig_ini,
       fec_vig_fin)
      select SEQ_RECAUDO_LOCAL_validacion.Nextval,
             idbanco,
             cta_recaudo,
             indtipo,
             fec_corte,
             fec_tran,
             null, --oficina_origen
             valor_total, --valor_efectivo
             0, --valor_cheque
             valor_total,
             null, --nit_m
             idmunicipio,
             Substr(idmunicipio, 1, 2),
             DECODE(NVL(ACUERDO, 0), 1, 'ACU', 'AJU'),
             p_consignado,
             vigencia,
             fec_vig_ini,
             fec_vig_fin
        from recaudo_local_ajustes
       where fec_corte >= p_fec_ini
         and fec_corte <= p_fec_fin;
  
    insert into recaudo_local_validacion
      (idrecaudo_local_liquidacion,
       idbanco,
       cta_recaudo,
       indtipo,
       fec_corte,
       fec_tran,
       oficina_origen,
       valor_efectivo,
       valor_cheque,
       valor_total,
       nit_m,
       idmunicipio,
       iddepartamento,
       indorigen,
       p_consignado,
       idrecaudolocal_liquidacion,
       vigencia,
       fec_vig_ini,
       fec_vig_fin)
      select seq_recaudo_local_validacion.Nextval,
             idbanco,
             cuenta,
             indtipoiden,
             p_fec_fin,
             fechatrx,
             oficinaorigen,
             valortrx, --valor_efectivo
             0, -- valor_cheque
             valortrx, -- valor_total
             null, -- nit_m
             idmunicipioiden,
             Substr(idmunicipioiden, 1, 2),
             'IDE',
             p_consignadoiden,
             numsecuenciareg,
             vigencia,
             fechainicio,
             fechafin
        from trxsinidentificar
       where estadoiden = 'ID'
         and (fechaliq is null or
             (fechaliq >= p_fec_ini and fechaliq <= p_fec_fin))
         and idmunicipioiden <> '00000001';
  
    insert into recaudo_local_validacion
      (idrecaudo_local_liquidacion,
       idbanco,
       cta_recaudo,
       indtipo,
       fec_corte,
       fec_tran,
       oficina_origen,
       valor_efectivo,
       valor_cheque,
       valor_total,
       nit_m,
       idmunicipio,
       iddepartamento,
       indorigen,
       p_consignado,
       idrecaudolocal_liquidacion,
       vigencia,
       fec_vig_ini,
       fec_vig_fin)
      select seq_recaudo_local_validacion.Nextval,
             idbanco,
             cuenta,
             'SIMIT',
             p_fec_fin,
             fec_pago,
             'ACUERDO DE PAGO ANTES DE PRORROGA',
             vlrsimitantesprorroga,
             0, -- VALOR CHEQUE
             vlrsimitantesprorroga,
             '', -- NIT
             divipo,
             SUBSTR(DIVIPO, 1, 2),
             'ACU',
             10,
             idacuerdo,
             vigencia,
             fec_vig_ini,
             fec_vig_fin
        from acuerdopago
       where vlrsimitantesprorroga <> 0
         and estado = 'LI'
         and (fechaliq is null or
             (fechaliq >= p_fec_ini and fechaliq <= p_fec_fin));
  
    insert into recaudo_local_validacion
      (idrecaudo_local_liquidacion,
       idbanco,
       cta_recaudo,
       indtipo,
       fec_corte,
       fec_tran,
       oficina_origen,
       valor_efectivo,
       valor_cheque,
       valor_total,
       nit_m,
       idmunicipio,
       iddepartamento,
       indorigen,
       p_consignado,
       idrecaudolocal_liquidacion,
       vigencia,
       fec_vig_ini,
       fec_vig_fin)
      select seq_recaudo_local_validacion.Nextval,
             idbanco,
             cuenta,
             'POLCA',
             p_fec_fin,
             fec_pago,
             'ACUERDO DE PAGO ANTES DE PRORROGA',
             vlrpolcaantesprorroga,
             0, -- VALOR CHEQUE
             vlrpolcaantesprorroga,
             '', -- NIT
             divipo,
             SUBSTR(DIVIPO, 1, 2),
             'ACU',
             porcentaje,
             idacuerdo,
             vigencia,
             fec_vig_ini,
             fec_vig_fin
        from acuerdopago
       where vlrpolcaantesprorroga <> 0
         and estado = 'LI'
         and (fechaliq is null or
             (fechaliq >= p_fec_ini and fechaliq <= p_fec_fin));
  
    insert into recaudo_local_validacion
      (idrecaudo_local_liquidacion,
       idbanco,
       cta_recaudo,
       indtipo,
       fec_corte,
       fec_tran,
       oficina_origen,
       valor_efectivo,
       valor_cheque,
       valor_total,
       nit_m,
       idmunicipio,
       iddepartamento,
       indorigen,
       p_consignado,
       idrecaudolocal_liquidacion,
       vigencia,
       fec_vig_ini,
       fec_vig_fin)
      select seq_recaudo_local_validacion.Nextval,
             idbanco,
             cuenta,
             'SIMIT',
             p_fec_fin,
             fec_pago,
             'ACUERDO DE PAGO DESPUES DE PRORROGA',
             vlrsimitdespuesprorroga,
             0, -- VALOR CHEQUE
             vlrsimitdespuesprorroga,
             '', -- NIT
             divipo,
             SUBSTR(DIVIPO, 1, 2),
             'ACU',
             10,
             idacuerdo,
             vigencia,
             fec_vig_ini,
             fec_vig_fin
        from acuerdopago
       where vlrsimitdespuesprorroga <> 0
         and estado = 'LI'
         and (fechaliq is null or
             (fechaliq >= p_fec_ini and fechaliq <= p_fec_fin));
  
    insert into recaudo_local_validacion
      (idrecaudo_local_liquidacion,
       idbanco,
       cta_recaudo,
       indtipo,
       fec_corte,
       fec_tran,
       oficina_origen,
       valor_efectivo,
       valor_cheque,
       valor_total,
       nit_m,
       idmunicipio,
       iddepartamento,
       indorigen,
       p_consignado,
       idrecaudolocal_liquidacion,
       vigencia,
       fec_vig_ini,
       fec_vig_fin)
      select seq_recaudo_local_validacion.Nextval,
             idbanco,
             cuenta,
             'POLCA',
             p_fec_fin,
             fec_pago,
             'ACUERDO DE PAGO DESPUES DE PRORROGA',
             vlrpolcadespuesprorroga,
             0, -- VALOR CHEQUE
             vlrpolcadespuesprorroga,
             '', -- NIT
             divipo,
             SUBSTR(DIVIPO, 1, 2),
             'ACU',
             porcentaje,
             idacuerdo,
             vigencia,
             fec_vig_ini,
             fec_vig_fin
        from acuerdopago
       where vlrpolcadespuesprorroga <> 0
         and estado = 'LI'
         and (fechaliq is null or
             (fechaliq >= p_fec_ini and fechaliq <= p_fec_fin));
  
    update recaudo_local_validacion l
       set (l.idconcesionario) =
           (select m.idconcesionario
              from municipio m
             where m.idmunicipio = l.idmunicipio)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin;
  
    commit;
  
    p_error := 'VALIDACION CORRECTA';
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [sp_valida_recaudo_local] ' || SQLERRM,
            p_error);
    
  end sp_valida_recaudo_local;

  PROCEDURE i_archivoCon(p_filename  varchar2,
                         p_cfile     clob,
                         p_usuario   varchar2,
                         v_cod_error out number,
                         v_msg_error out varchar2) is
    p_uploadid number;
    r          recaudo_local_temp%rowtype;
  
    campo token_list;
  
    vBuffer     VARCHAR2(32767);
    v_line      number := 2;
    l_amount    BINARY_INTEGER := 32767;
    l_pos       PLS_INTEGER := 1;
    i           number := 1;
    tk          number := 1;
    l_clob_len  PLS_INTEGER;
    v_cfile     CLOB;
    v_chr       NUMBER := 13; -- 1 tipo de Enter
    v_registros number;
    v_total     number;
    v_finlinea  varchar(2);
    w_registros number;
    linea       varchar2(2000);
  
    ctaRec varchar2(50);
  
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, v_msg_error, 'pk_recloc');
  
    if not v_msg_error is null then
      v_cod_error := 0001;
      return;
    end if;
  
    delete from recaudo_local_temp;
  
    select seq_uploads.nextval into p_uploadid from dual;
  
    insert into upload
      (uploadid, filename, cfile, usuario, fecha, valida)
    values
      (p_uploadid, p_filename, p_cfile, p_usuario, sysdate, 0);
  
    select cfile into v_cfile from upload where uploadid = p_uploadid;
  
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
          v_cod_error := 0002;
          v_msg_error := 'Formato Errado';
          return;
        end if;
      end if;
    end if;
  
    l_amount := dbms_lob.instr(v_cfile, v_finlinea, l_pos + 1, 1);
    l_amount := l_amount - l_pos;
    dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);
    l_pos := l_pos + l_amount + length(v_finlinea);
  
    --Informacion
    WHILE l_pos < l_clob_len - 1 LOOP
      l_amount := dbms_lob.instr(v_cfile, v_finlinea, l_pos + 1, 1);
      IF l_amount > 1 THEN
        l_amount := l_amount - l_pos;
        dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);
      
        linea := vBuffer;
        campo := tokenize(str => linea, delim => ';');
      
        if (campo(1) is null) then
          v_cod_error := 0003;
          v_msg_error := 'Formato Errado';
        
          v_msg_error := 'Error en registro ' || i || '. Formato errado. ' ||
                         '. Datos registro: ' || vBuffer;
          return;
        
        end if;
      
        i := i + 1;
      
        select max(cuenta)
          into ctaRec
          from CTA_RECAUDO_FCM t
         where indtipo = 'SIMIT'
           and t.idbanco = trim(campo(1));
      
        r.idbanco        := trim(campo(1));
        r.cta_recaudo    := ctaRec;
        r.indtipo        := trim(campo(3));
        r.fec_corte      := to_date(trim(campo(4)), 'yyyy-mm-dd');
        r.fec_tran       := to_date(trim(campo(5)), 'yyyy-mm-dd');
        r.oficina_origen := null;
        r.valor_efectivo := to_number(replace(trim(campo(6)), ',', '.'),
                                      '9999999999.99');
        r.valor_cheque   := 0.0;
        r.valor_total    := r.valor_efectivo;
        r.nit_m          := null;
        r.idmunicipio    := trim(campo(7));
        r.p_consignado   := to_number(campo(8), '99');
      
        insert into recaudo_local_temp values r;
      
      end if;
    
      l_pos := l_pos + l_amount + length(v_finlinea);
    
    END LOOP;
  
    commit;
  
    delete from recaudo_local_liquidacion where indorigen = 'REM';
  
    insert into recaudo_local_liquidacion
      (idrecaudo_local_liquidacion,
       idbanco,
       cta_recaudo,
       indtipo,
       fec_corte,
       fec_tran,
       oficina_origen,
       valor_efectivo,
       valor_cheque,
       valor_total,
       nit_m,
       idmunicipio,
       iddepartamento,
       usuario_proceso,
       fecha_proceso,
       ind_proceso,
       indorigen,
       idconcesionario,
       dias_dispersion,
       frec_dispersion,
       fec_dispersion,
       s_valor_0,
       s_valor_1,
       s_valor_2,
       s_valor_3,
       s_valor_4,
       s_valor_5,
       s_valor_6,
       p_valor_7,
       p_valor_8,
       p_valor_9,
       p_valor_10,
       p_valor_11,
       p_valor_12,
       p_valor_13,
       p_valor_14,
       p_valor_15,
       p_valor_16,
       p_valor_17,
       p_valor_18,
       p_valor_19,
       p_valor_20,
       p_valor_21,
       p_valor_22,
       p_valor_23,
       p_valor_24,
       p_valor_25,
       p_valor_26,
       p_valor_27,
       p_valor_28,
       p_consignado,
       idrecaudolocal_liquidacion,
       nit_concesionario,
       nit_fondo)
      select seq_recaudo_local_liquidacion.nextval,
             a.idbanco,
             a.cta_recaudo,
             a.indtipo,
             a.fec_corte,
             a.fec_tran,
             a.oficina_origen,
             a.valor_efectivo,
             a.valor_cheque,
             a.valor_total,
             null, --nit_m,
             a.idmunicipio,
             substr(a.idmunicipio, 1, 2) as iddepartamento,
             p_usuario,
             sysdate,
             1, --ind_proceso,
             'REM', --indorigen,
             '01', --idconcesionario,
             0, --dias_dispersion,
             0, --frec_dispersion,
             a.fec_corte, --fec_dispersion,
             0, --s_valor_0,
             0, --s_valor_1,
             0, --s_valor_2,
             0, --s_valor_3,
             0, --s_valor_4,
             0, --s_valor_5,
             0, --s_valor_6,
             0, --p_valor_7,
             0, --p_valor_8,
             0, --p_valor_9,
             0, --p_valor_10,
             0, --p_valor_11,
             0, --p_valor_12,
             0, --p_valor_13,
             0, --p_valor_14,
             0, --p_valor_15,
             0, --p_valor_16,
             0, --p_valor_17,
             0, --p_valor_18,
             0, --p_valor_19,
             0, --p_valor_20,
             0, --p_valor_21,
             0, --p_valor_22,
             0, --p_valor_23,
             0, --p_valor_24,
             0, --p_valor_25,
             0, --p_valor_26,
             0, --p_valor_27,
             0, --p_valor_28,
             a.p_consignado,
             0, --idrecaudolocal_liquidacion,
             '8110367922',
             null --, nit_fondo
        from recaudo_local_temp a;
  
    commit;
  
    v_cod_error := 0;
    v_msg_error := 'Cargue exitoso';
  
  EXCEPTION
    WHEN OTHERS THEN
      v_cod_error := SQLCODE;
      v_msg_error := 'Problemas en linea ' || i || ':' || SQLERRM;
  END i_archivoCon;

  PROCEDURE mod_Trf_sdf(v_idReg     number,
                        v_fecIni    date,
                        v_fecFin    date,
                        v_usuario   number,
                        v_cod_error out number,
                        v_msg_error out varchar2) as
  
    numReg number;
    anoIni number;
    anoFin number;
  
    strVig      varchar2(500);
    v_indOrigen char(3);
  
  BEGIN
  
    select count(*)
      into numReg
      from transferencias_sdf
     where idrecaudo_local_liquidacion = v_idreg;
  
    if (numReg = 0) then
      v_cod_error := 0001;
      v_msg_error := 'Registro NO EXISTE';
      return;
    end if;
  
    anoIni := to_number(to_char(v_fecIni, 'yyyy'));
    anoFin := to_number(to_char(v_fecFin, 'yyyy'));
  
    while anoIni <= anoFin loop
      if anoIni = to_number(to_char(v_fecIni, 'yyyy')) then
        strVig := trim(to_char(anoIni));
      else
        strVig := strVig || '-' || trim(to_char(anoIni));
      end if;
      anoIni := anoIni + 1;
    end loop;
  
    select indorigen
      into v_indOrigen
      from transferencias_sdf
     where idrecaudo_local_liquidacion = v_idreg;
  
    if (v_indOrigen = 'IDE') then
      update trxsinidentificar t
         set t.fechainicio = v_fecIni,
             t.fechafin    = v_fecFin,
             t.vigencia    = strVig
       where numsecuenciareg = v_idreg;
    end if;
  
    if (v_indOrigen = 'REC') then
      update recaudo_local t
         set t.fec_vig_ini = v_fecIni,
             t.fec_vig_fin = v_fecFin,
             t.vigencia    = strVig
       where idreclocal = v_idreg;
    end if;
  
    commit;
  
    sp_log(v_usuario, 'mod_Trf_Sdf', 'Se modifica registro ' || v_idreg);
  
    v_cod_error := 0000;
    v_msg_error := 'Registro modificado correctamente';
  
  EXCEPTION
    WHEN OTHERS THEN
      v_cod_error := SQLCODE;
      v_msg_error := SQLERRM;
    
  END mod_Trf_sdf;

  PROCEDURE liquidaDeposSinIdent(p_fec_ini_ano number,
                                 p_fec_ini_mes number,
                                 p_fec_ini_dia number,
                                 p_fec_fin_ano number,
                                 p_fec_fin_mes number,
                                 p_fec_fin_dia number,
                                 p_usuario     varchar2,
                                 p_error       OUT VARCHAR2) as
  
    w_fec_cor_ini date;
    w_fec_cor_fin date;
    w_registros   number;
    w_divipo      varchar2(8);
    w_valor       varchar2(500);
  
  begin
    -- VALIDACIONES
    --   sp_v_usuario(p_usuario, p_error, 'pk_proc');
  
    IF not P_ERROR is null THEN
      return;
    end if;
  
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
  
/*    select count(*)
      into w_registros
      from RECAUDO_LOCAL_LIQ_DSI
     where fec_tran >= w_fec_cor_ini
       and fec_tran <= w_fec_cor_fin;
  
    if (w_registros > 0) then
      p_error := 'Distribucion ya ejecutada. Solicitar reproceso';
      return;
    end if;*/
  
    distribuirDeposSinIden(w_fec_cor_ini,
                           w_fec_cor_fin,
                           p_usuario,
                           p_error);
  
    if (p_error <> null) then
      commit;
      return;
    end if;
    /*  dispersa_recaudo_local(p_fec_ini_ano,
                              p_fec_ini_mes,
                              p_fec_ini_dia,
                              p_fec_fin_ano,
                              p_fec_fin_mes,
                              p_fec_fin_dia,
                              p_banco,
                              p_usuario,
                              p_error);
    
    
    
       pk_recloc.contabiliza_recaudo_local(p_fec_ini_ano,
                                           p_fec_ini_mes,
                                           p_fec_ini_dia,
                                           p_fec_fin_ano,
                                           p_fec_fin_mes,
                                           p_fec_fin_dia,
                                           p_banco,
                                           p_usuario,
                                           p_error);
    
       select count(*)
       into w_registros
       from recaudo_local_liquidacion r
    where fec_corte >= w_fec_cor_ini
          and fec_corte <= w_fec_cor_fin
          and decode(idbanco, '52', '52', '99') = p_banco
          and nvl(r.p_valor_7,0) = 0
          and nvl(r.p_valor_12,0) = 0
          and nvl(r.p_valor_15,0) = 0
          and r.indtipo = 'POLCA';
    
          if (w_registros > 0) then
    
       select r.idmunicipio, to_char(r.valor_total,'99,999,999,999,999.00')
       into w_divipo, w_valor
       from recaudo_local_liquidacion r
    where fec_corte >= w_fec_cor_ini
          and fec_corte <= w_fec_cor_fin
          and decode(idbanco, '52', '52', '99') = p_banco
          and nvl(r.p_valor_7,0) = 0
          and nvl(r.p_valor_12,0) = 0
          and nvl(r.p_valor_15,0) = 0
          and r.indtipo = 'POLCA'
          and rownum = 1;
    
    
    
            p_error := 'REGISTROS POLCA CON VIGENCIAS NO PERMITIDAS. FAVOR VALIDAR Y AJUSTAR VIGENCIAS. DIVIPO:' ||
            w_divipo ||
            ' Valor: ' || w_valor ||
            '. Recuerde que los rangos validos de vigencias son:(<= 2015-01-16),(>= 2015-01-17 y <= 2017-04-16), (>= 2017-04-17 y <= 2017-04-24), (>= 2017-04-25). No debe sobrelapar estos rangos' ;
    
          end if;*/
  
    commit;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [l_recaudo_local] ' || SQLERRM,
            p_error);
  END liquidaDeposSinIdent;

  procedure distribuirDeposSinIden(p_fec_ini date,
                                   p_fec_fin date,
                                   p_usuario varchar2,
                                   p_error   OUT VARCHAR2) is
    dd dias_dispersion%rowtype;
  
    w_registros   number;
    w_idmunicipio char(8);
    w_idbanco     char(2);
  
    p_simit_s                   number;
    p_concesionario_s           number;
    p_fondo_cob_concesionario_s number;
    p_fondo_cob_simit_s         number;
    p_equilibrio_economico_s    number;
    p_fechaprorroga             date;
  
    p_simit_pm                   number;
    p_concesionario_pm           number;
    p_fondo_cob_concesionario_pm number;
    p_fondo_cob_simit_pm         number;
    p_equilibrio_economico_pm    number;
    p_simit_pp                   number;
    p_sevial_pp                  number;
    p_equilibrio_economico_pp    number;
    p_polca_cp                   number;
    p_fcm_cp                     number;
    p_sevial_cp                  number;
    p_equilibrio_economico_cp    number;
  
    CURSOR tConcesionario IS
      select c.idconcesionario from p_dispersion_concesionario c;
  
  BEGIN
  
    delete recaudo_local_liq_dsi
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin;
  
    commit;
  
    insert into recaudo_local_liq_dsi
      (idrecaudo_local_liq_dsi,
       idrecaudolocal_liquidacion,
       idbanco,
       cta_recaudo,
       indtipo,
       fec_corte,
       fec_tran,
       oficina_origen,
       valor_efectivo,
       valor_cheque,
       valor_total,
       nit_m,
       idmunicipio,
       iddepartamento,
       indorigen,
       p_consignado,
       vigencia,
       fec_vig_ini,
       fec_vig_fin)
      select idreg,
             idReg,
             idbanco,
             cuenta,
             indtipo,
             fechatransaccion,
             fechatransaccion,
             'HISTORICO DEPOS SIN IDENT',
             valorTotal,
             0,
             valorTotal,
             '9999999999',
             '00000000',
             '00',
             'DSI',
             cuantia,
             to_char(fechatransaccion, 'yyyy'),
             null,
             null
        from depo_sin_iden_tmp
       where fechatransaccion >= p_fec_ini
         and fechatransaccion <= p_fec_fin;
  
    commit;
  
    update recaudo_local_liq_dsi l
       set l.fec_dispersion = sysdate()
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin;
  
    commit;
  
    update recaudo_local_liq_dsi l
       set l.s_valor_0 = 0
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin;
  
    update recaudo_local_liq_dsi l
       set (l.s_valor_1, l.s_valor_2, l.s_valor_3, l.s_valor_4, l.s_valor_5) =
           (select l.valor_total * (7 / 10),
                   l.valor_total * (3 / 10),
                   l.valor_total * (0 / 10),
                   l.valor_total * (0 / 10),
                   l.valor_total * (0 / 10)
              from dual)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and l.indtipo = 'SIMIT';
  
    -- redondear a dos decimales todos los calculos
    update recaudo_local_liq_dsi l
       set l.s_valor_1 = ROUND(l.s_valor_1, 2),
           l.s_valor_2 = ROUND(l.s_valor_2, 2)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and l.indtipo = 'SIMIT';
  
    -- ajustar decimales para los que tienen fondo cobertura
    update recaudo_local_liq_dsi l
       set l.s_valor_2 = l.valor_total - l.s_valor_1
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and l.indtipo = 'SIMIT';
  
    -- calcular netos
    update recaudo_local_liq_dsi l
       set l.s_valor_6 = l.s_valor_2 - l.s_valor_0
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and l.indtipo = 'SIMIT';
  
    commit;
  
    -- porcentajes a la fecha
    select p.simit_pm,
           p.concesionario_pm,
           p.fondo_cob_concesionario_pm,
           p.fondo_cob_simit_pm,
           p.equilibrio_economico_pm,
           p.simit_pp,
           p.sevial_pp,
           p.equilibrio_economico_pp,
           p.polca_cp,
           p.fcm_cp,
           p.sevial_cp,
           p.equilibrio_economico_cp,
           p.fechaprorroga
      into p_simit_pm,
           p_concesionario_pm,
           p_fondo_cob_concesionario_pm,
           p_fondo_cob_simit_pm,
           p_equilibrio_economico_pm,
           p_simit_pp,
           p_sevial_pp,
           p_equilibrio_economico_pp,
           p_polca_cp,
           p_fcm_cp,
           p_sevial_cp,
           p_equilibrio_economico_cp,
           p_fechaprorroga
      from p_dispersion_concesionario p
     where p.idconcesionario = '01';
  
    update recaudo_local_liq_dsi l
       set (l.p_valor_7,
            l.p_valor_8,
            l.p_valor_9,
            l.p_valor_10,
            l.p_valor_11) =
           (select l.valor_total * (p_simit_pm / 55),
                   l.valor_total * (p_concesionario_pm / 55),
                   l.valor_total * (p_fondo_cob_concesionario_pm / 55),
                   l.valor_total * (p_fondo_cob_simit_pm / 55),
                   l.valor_total * (p_equilibrio_economico_pm / 55)
              from dual)
     where l.fec_corte >= p_fec_ini
       and l.fec_corte <= p_fec_fin
       and l.p_consignado = 55
       and l.indtipo = 'POLCA';

    update recaudo_local_liq_dsi l
       set (l.p_valor_7,
            l.p_valor_8,
            l.p_valor_9,
            l.p_valor_10,
            l.p_valor_11) =
           (select l.valor_total * (p_simit_pm / 10),
                   l.valor_total * (p_concesionario_pm / 10),
                   l.valor_total * (p_fondo_cob_concesionario_pm / 10),
                   l.valor_total * (p_fondo_cob_simit_pm / 10),
                   l.valor_total * (p_equilibrio_economico_pm / 10)
              from dual)
     where l.fec_corte >= p_fec_ini
       and l.fec_corte <= p_fec_fin
       and l.p_consignado = 10
       and l.indtipo = 'POLCA';
       
    update recaudo_local_liq_dsi l
       set (l.p_valor_7,
            l.p_valor_8,
            l.p_valor_9,
            l.p_valor_10,
            l.p_valor_11) =
           (select l.valor_total * (0 / 45),
                   l.valor_total * (0 / 45),
                   l.valor_total * (0 / 45),
                   l.valor_total * (0 / 45),
                   l.valor_total * (0 / 45)
              from dual)
     where l.fec_corte >= p_fec_ini
       and l.fec_corte <= p_fec_fin
       and l.p_consignado = 45
       and l.indtipo = 'POLCA';
         
    update recaudo_local_liq_dsi l
       set (l.p_valor_15, l.p_valor_16, l.p_valor_17, l.p_valor_18) =
           (select l.valor_total * (p_polca_cp / 55),
                   l.valor_total * (p_fcm_cp / 55),
                   l.valor_total * (p_sevial_cp / 55),
                   l.valor_total * (p_equilibrio_economico_cp / 55)
              from dual)
     where l.fec_corte >= p_fec_ini
       and l.fec_corte <= p_fec_fin
       and l.fec_tran >= to_date('2016-09-11', 'yyyy-mm-dd')
       and l.p_consignado = 55
       and l.indtipo = 'POLCA';

    update recaudo_local_liq_dsi l
       set (l.p_valor_15, l.p_valor_16, l.p_valor_17, l.p_valor_18) =
           (select l.valor_total * (p_polca_cp / 45),
                   l.valor_total * (p_fcm_cp / 45),
                   l.valor_total * (p_sevial_cp / 45),
                   l.valor_total * (p_equilibrio_economico_cp / 45)
              from dual)
     where l.fec_corte >= p_fec_ini
       and l.fec_corte <= p_fec_fin
       and l.fec_tran >= to_date('2016-09-11', 'yyyy-mm-dd')
       and l.p_consignado = 45
       and l.indtipo = 'POLCA';
 
    update recaudo_local_liq_dsi l
       set (l.p_valor_15, l.p_valor_16, l.p_valor_17, l.p_valor_18) =
           (select l.valor_total * (0 / 10),
                   l.valor_total * (0 / 10),
                   l.valor_total * (0 / 10),
                   l.valor_total * (0 / 10)
              from dual)
     where l.fec_corte >= p_fec_ini
       and l.fec_corte <= p_fec_fin
       and l.fec_tran >= to_date('2016-09-11', 'yyyy-mm-dd')
       and l.p_consignado = 10
       and l.indtipo = 'POLCA';
               
    p_polca_cp  := 39.78;
    p_fcm_cp    := 2.088;
    p_sevial_cp := 3.132;
  
    update recaudo_local_liq_dsi l
       set (l.p_valor_15, l.p_valor_16, l.p_valor_17, l.p_valor_18) =
           (select l.valor_total * (p_polca_cp / 55),
                   l.valor_total * (p_fcm_cp / 55),
                   l.valor_total * (p_sevial_cp / 55),
                   l.valor_total * (p_equilibrio_economico_cp / 55)
              from dual)
     where l.fec_corte >= p_fec_ini
       and l.fec_corte <= p_fec_fin
       and l.fec_tran < to_date('2016-09-11', 'yyyy-mm-dd')
       and l.p_consignado = 55
       and l.indtipo = 'POLCA';

    update recaudo_local_liq_dsi l
       set (l.p_valor_15, l.p_valor_16, l.p_valor_17, l.p_valor_18) =
           (select l.valor_total * (p_polca_cp / 45),
                   l.valor_total * (p_fcm_cp / 45),
                   l.valor_total * (p_sevial_cp / 45),
                   l.valor_total * (p_equilibrio_economico_cp / 45)
              from dual)
     where l.fec_corte >= p_fec_ini
       and l.fec_corte <= p_fec_fin
       and l.fec_tran < to_date('2016-09-11', 'yyyy-mm-dd')
       and l.p_consignado = 45
       and l.indtipo = 'POLCA';

    update recaudo_local_liq_dsi l
       set (l.p_valor_15, l.p_valor_16, l.p_valor_17, l.p_valor_18) =
           (select l.valor_total * (0 / 10),
                   l.valor_total * (0 / 10),
                   l.valor_total * (0 / 10),
                   l.valor_total * (0 / 10)
              from dual)
     where l.fec_corte >= p_fec_ini
       and l.fec_corte <= p_fec_fin
       and l.fec_tran < to_date('2016-09-11', 'yyyy-mm-dd')
       and l.p_consignado = 10
       and l.indtipo = 'POLCA';
              
    update recaudo_local_liq_dsi l
       set (l.p_valor_12, l.p_valor_13, l.p_valor_14) =
           (select l.valor_total * (p_simit_pp / 55),
                   l.valor_total * (p_sevial_pp / 55),
                   l.valor_total * (p_equilibrio_economico_pp / 55)
              from dual)
     where l.fec_corte >= p_fec_ini
       and l.fec_corte <= p_fec_fin
       and l.indtipo = 'POLCA'
       and l.p_consignado = 55
       and l.fec_tran >= to_date('2017-04-25', 'yyyy-mm-dd');
  
    update recaudo_local_liq_dsi l
       set (l.p_valor_12, l.p_valor_13, l.p_valor_14) =
           (select l.valor_total * (p_simit_pp / 10),
                   l.valor_total * (p_sevial_pp / 10),
                   l.valor_total * (p_equilibrio_economico_pp / 10)
              from dual)
     where l.fec_corte >= p_fec_ini
       and l.fec_corte <= p_fec_fin
       and l.indtipo = 'POLCA'
       and l.p_consignado = 10
       and l.fec_tran >= to_date('2017-04-25', 'yyyy-mm-dd');

    update recaudo_local_liq_dsi l
       set (l.p_valor_12, l.p_valor_13, l.p_valor_14) =
           (select l.valor_total * (0 / 45),
                   l.valor_total * (0 / 45),
                   l.valor_total * (0 / 45)
              from dual)
     where l.fec_corte >= p_fec_ini
       and l.fec_corte <= p_fec_fin
       and l.indtipo = 'POLCA'
       and l.p_consignado = 45
       and l.fec_tran >= to_date('2017-04-25', 'yyyy-mm-dd');
                
    p_simit_pp  := 2;
    p_sevial_pp := 3;
  
    update recaudo_local_liq_dsi l
       set (l.p_valor_12, l.p_valor_13, l.p_valor_14) =
           (select l.valor_total * (p_simit_pp / 55),
                   l.valor_total * (p_sevial_pp / 55),
                   l.valor_total * (p_equilibrio_economico_pp / 55)
              from dual)
     where l.fec_corte >= p_fec_ini
       and l.fec_corte <= p_fec_fin
       and l.indtipo = 'POLCA'
       and l.p_consignado = 55
       and l.fec_tran < to_date('2017-04-25', 'yyyy-mm-dd');

    update recaudo_local_liq_dsi l
       set (l.p_valor_12, l.p_valor_13, l.p_valor_14) =
           (select l.valor_total * (p_simit_pp / 10),
                   l.valor_total * (p_sevial_pp / 10),
                   l.valor_total * (p_equilibrio_economico_pp / 10)
              from dual)
     where l.fec_corte >= p_fec_ini
       and l.fec_corte <= p_fec_fin
       and l.indtipo = 'POLCA'
       and l.p_consignado = 10
       and l.fec_tran < to_date('2017-04-25', 'yyyy-mm-dd');
 
    update recaudo_local_liq_dsi l
       set (l.p_valor_12, l.p_valor_13, l.p_valor_14) =
           (select l.valor_total * (0 / 10),
                   l.valor_total * (0 / 10),
                   l.valor_total * (0 / 10)
              from dual)
     where l.fec_corte >= p_fec_ini
       and l.fec_corte <= p_fec_fin
       and l.indtipo = 'POLCA'
       and l.p_consignado = 45
       and l.fec_tran < to_date('2017-04-25', 'yyyy-mm-dd');
            
    -- redondear a dos decimales todos los calculos
    update recaudo_local_liq_dsi l
       set l.p_valor_7  = ROUND(l.p_valor_7, 2),
           l.p_valor_8  = ROUND(l.p_valor_8, 2),
           l.p_valor_9  = ROUND(l.p_valor_9, 2),
           l.p_valor_10 = ROUND(l.p_valor_10, 2),
           l.p_valor_11 = ROUND(l.p_valor_11, 2),
           l.p_valor_12 = ROUND(l.p_valor_12, 2),
           l.p_valor_13 = ROUND(l.p_valor_13, 2),
           l.p_valor_14 = ROUND(l.p_valor_14, 2),
           l.p_valor_15 = ROUND(l.p_valor_15, 2),
           l.p_valor_16 = ROUND(l.p_valor_16, 2),
           l.p_valor_17 = ROUND(l.p_valor_17, 2),
           l.p_valor_18 = ROUND(l.p_valor_18, 2)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and l.indtipo = 'POLCA';
  
    update recaudo_local_liq_dsi l
       set (l.p_valor_19,
            l.p_valor_20,
            l.p_valor_21,
            l.p_valor_22,
            l.p_valor_23) =
           (select (l.p_valor_16 * 100 / (100 + fcm.iva_fcm)) *
                   (fcm.iva_fcm / 100),
                   (l.p_valor_17 * 100 / (100 + fcm.iva)) * (fcm.iva / 100),
                   (l.p_valor_17 * 100 / (100 + fcm.iva)) *
                   (fcm.retencion_fuente / 100),
                   (l.p_valor_17 * 100 / (100 + fcm.iva)) *
                   (fcm.impuesto_timbre_tercero / 100),
                   ((l.p_valor_16 * 100 / (100 + fcm.iva_fcm)) +
                   (l.p_valor_17 * 100 / (100 + fcm.iva)) + l.p_valor_18) *
                   (fcm.impuesto_timbre_fcm / 100)
              from fcm)
     where l.fec_corte >= p_fec_ini
       and l.fec_corte <= p_fec_fin
       and l.indtipo = 'POLCA';
  
    update recaudo_local_liq_dsi l
       set l.p_valor_24 = l.p_valor_17 - l.p_valor_21 - l.p_valor_22,
           l.p_valor_25 = l.p_valor_8 - l.s_valor_0,
           l.p_valor_26 = l.p_valor_16 + l.p_valor_21 + l.p_valor_22,
           l.p_valor_27 = l.p_valor_7 + l.p_valor_12,
           l.p_valor_28 = l.p_valor_11 + l.p_valor_14 + l.p_valor_18,
           l.p_valor_15 = l.p_valor_15
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and l.indtipo = 'POLCA';
  
    -- calcular basess del 2,7 y 1.8
  
    update recaudo_local_liq_dsi l
       set l.p_valor_17 = l.p_valor_17 - l.p_valor_20,
           l.p_valor_16 = l.p_valor_16 - l.p_valor_19
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and l.indtipo = 'POLCA';
  
    update recaudo_local_liq_dsi l
       set l.p_valor_19 = ROUND(l.p_valor_19, 2),
           l.p_valor_20 = ROUND(l.p_valor_20, 2),
           l.p_valor_21 = ROUND(l.p_valor_21, 2),
           l.p_valor_22 = ROUND(l.p_valor_22, 2),
           l.p_valor_23 = ROUND(l.p_valor_23, 2),
           l.p_valor_24 = ROUND(l.p_valor_24, 2),
           l.p_valor_25 = ROUND(l.p_valor_25, 2),
           l.p_valor_26 = ROUND(l.p_valor_26, 2),
           l.p_valor_27 = ROUND(l.p_valor_27, 2),
           l.p_valor_28 = ROUND(l.p_valor_28, 2)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and l.indtipo = 'POLCA';
  
    select count(*)
      into w_registros
      from RECAUDO_LOCAL_LIQ_DSI
     where fec_tran >= p_fec_ini
       and fec_tran <= p_fec_fin;
  
    p_error := 'Distribucion depositos sin identificar ejecutada. Registros: ' ||
               to_char(w_registros);
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [sp_liquida_recaudo_local] ' || SQLERRM,
            p_error);
  end distribuirDeposSinIden;

end PK_RECLOC;
/


spool off
