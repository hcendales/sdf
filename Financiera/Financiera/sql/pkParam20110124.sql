---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 24/01/2011, 18:22:15 --
---------------------------------------------

spool pkParam20110124.log

prompt
prompt Creating package PK_PARAM
prompt =========================
prompt
create or replace package simit.pk_param is

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

  PROCEDURE i_fecha_no_habil(p_fecha_ini_ano number,
                             p_fecha_ini_mes number,
                             p_fecha_ini_dia number,
                             p_usuario       varchar2,
                             p_error         OUT VARCHAR2);
  PROCEDURE d_fecha_no_habil(p_fecha   varchar2,
                             p_usuario varchar2,
                             p_error   OUT VARCHAR2);
  PROCEDURE q_fecha_no_habil(p_cursor  OUT SYS_REFCURSOR,
                             p_usuario varchar2,
                             p_error   OUT VARCHAR2);

  PROCEDURE i_salario_minimo(p_anho    number,
                             p_valor   number,
                             p_usuario varchar2,
                             p_error   OUT VARCHAR2);

  PROCEDURE u_salario_minimo(p_anho    number,
                             p_valor   number,
                             p_usuario varchar2,
                             p_error   OUT VARCHAR2);

  PROCEDURE d_salario_minimo(p_anho    number,
                             p_usuario varchar2,
                             p_error   OUT VARCHAR2);
  PROCEDURE q_salario_minimo(p_cursor  OUT SYS_REFCURSOR,
                             p_usuario varchar2,
                             p_error   OUT VARCHAR2);

  PROCEDURE i_concepto(p_idconcepto number,
                       p_nombre     varchar2,
                       p_usuario    varchar2,
                       p_error      OUT VARCHAR2);
  PROCEDURE d_concepto(p_idconcepto number,
                       p_usuario    varchar2,
                       p_error      OUT VARCHAR2);
  PROCEDURE q_concepto(p_cursor  OUT SYS_REFCURSOR,
                       p_usuario varchar2,
                       p_error   OUT VARCHAR2);

  PROCEDURE i_banco(p_idbanco     char,
                    p_nombre      varchar2,
                    p_responsable varchar2,
                    p_cargo       varchar2,
                    p_correo      varchar2,
                    p_telefono    varchar2,
                    p_dirCorres   varchar2,
                    p_usuario     varchar2,
                    p_error       OUT VARCHAR2);

  PROCEDURE u_banco(p_idbanco     char,
                    p_nombre      varchar2,
                    p_responsable varchar2,
                    p_cargo       varchar2,
                    p_correo      varchar2,
                    p_telefono    varchar2,
                    p_dirCorres   varchar2,
                    p_usuario     varchar2,
                    p_error       OUT VARCHAR2);

  PROCEDURE d_banco(p_idbanco char,
                    p_usuario varchar2,
                    p_error   OUT VARCHAR2);

  PROCEDURE q_banco(p_idbanco     char,
                    p_usuario     varchar2,
                    p_nombre      out varchar2,
                    p_responsable out varchar2,
                    p_cargo       out varchar2,
                    p_correo      out varchar2,
                    p_telefono    out varchar2,
                    p_dirCorres   out varchar2,
                    p_error       OUT VARCHAR2);

  PROCEDURE d_concesionario(p_idconcesionario char,
                            p_usuario         varchar2,
                            p_error           OUT VARCHAR2);

  PROCEDURE i_departamento(p_iddepartamento char,
                           p_nombre         varchar2,
                           p_usuario        varchar2,
                           p_error          OUT VARCHAR2);
  PROCEDURE d_departamento(p_iddepartamento char,
                           p_usuario        varchar2,
                           p_error          OUT VARCHAR2);
  PROCEDURE q_departamento(p_cursor  OUT SYS_REFCURSOR,
                           p_usuario varchar2,
                           p_error   OUT VARCHAR2);

  PROCEDURE d_municipio(p_idmunicipio char,
                        p_usuario     varchar2,
                        p_error       OUT VARCHAR2);

  PROCEDURE d_tercero(p_idmunicipio char,
                      p_num_tercero number,
                      p_usuario     varchar2,
                      p_error       OUT VARCHAR2);

  PROCEDURE d_cta_dispersion_concesionario(p_idconcepto      number,
                                           p_idconcesionario char,
                                           p_usuario         varchar2,
                                           p_error           OUT VARCHAR2);

  PROCEDURE i_p_dispersion_concesionario(p_idconcesionario              char,
                                         p_concesionario_s              number,
                                         p_fondo_cob_concesionario_s    number,
                                         p_fondo_cob_simit_s            number,
                                         p_simit_s                      number,
                                         p_equilibrio_economico_s       number,
                                         p_concesionario_pm             number,
                                         p_fondo_cob_concesionario_pm   number,
                                         p_fondo_cob_simit_pm           number,
                                         p_equilibrio_economico_pm      number,
                                         p_simit_pp                     number,
                                         p_sevial_pp                    number,
                                         p_equilibrio_economico_pp      number,
                                         p_polca_cp                     number,
                                         p_fcm_cp                       number,
                                         p_sevial_cp                    number,
                                         p_equilibrio_economico_cp      number,
                                         p_concesionario_s_cc           varchar2,
                                         p_fondo_cob_concesionario_s_cc varchar2,
                                         p_fondo_cob_simit_s_cc         varchar2,
                                         p_simit_s_cc                   varchar2,
                                         p_equilibrio_economico_s_cc    varchar2,
                                         p_concesionario_pm_cc          varchar2,
                                         p_fondo_cob_concesionario_pm_c varchar2,
                                         p_fondo_cob_simit_pm_cc        varchar2,
                                         p_equilibrio_economico_pm_cc   varchar2,
                                         p_simit_pp_cc                  varchar2,
                                         p_sevial_pp_cc                 varchar2,
                                         p_equilibrio_economico_pp_cc   varchar2,
                                         p_polca_cp_cc                  varchar2,
                                         p_fcm_cp_cc                    varchar2,
                                         p_sevial_cp_cc                 varchar2,
                                         p_equilibrio_economico_cp_cc   varchar2,
                                         p_simit_pm                     number,
                                         p_usuario                      varchar2,
                                         p_error                        OUT VARCHAR2);
  PROCEDURE d_p_dispersion_concesionario(p_idconcesionario char,
                                         p_usuario         varchar2,
                                         p_error           OUT VARCHAR2);
  PROCEDURE q_p_dispersion_concesionario(p_cursor  OUT SYS_REFCURSOR,
                                         p_usuario varchar2,
                                         p_error   OUT VARCHAR2);

  PROCEDURE i_p_dispersion_municipio(p_idmunicipio              char,
                                     p_municipio_s              number,
                                     p_fcm_contravencional_s    number,
                                     p_conces_contravencional_s number,
                                     p_acuerdopago_s            number,
                                     p_municipio_p              number,
                                     p_fcm_contravencional_p    number,
                                     p_conces_contravencional_p number,
                                     p_acuerdopago_p            number,
                                     p_usuario                  varchar2,
                                     p_error                    OUT VARCHAR2);
  PROCEDURE d_p_dispersion_municipio(p_idmunicipio char,
                                     p_usuario     varchar2,
                                     p_error       OUT VARCHAR2);
  PROCEDURE q_p_dispersion_municipio(p_cursor  OUT SYS_REFCURSOR,
                                     p_usuario varchar2,
                                     p_error   OUT VARCHAR2);

  PROCEDURE q_validador_fecha(p_idmunicipio              char,
                              p_idvalidador              char,
                              p_indTipo                  char,
                              p_usuario                  varchar2,
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
                              p_error                    OUT VARCHAR2);




  PROCEDURE i_validador_fecha(p_idmunicipio              char,
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
                              p_error                    OUT VARCHAR2);





  PROCEDURE u_validador_fecha(p_idmunicipio              char,
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
                              p_error                    OUT VARCHAR2);

  PROCEDURE d_validador_fecha(p_idmunicipio char,
                              p_idvalidador char,
                              p_indTipo     char,
                              p_usuario     varchar2,
                              p_error       OUT VARCHAR2);

  PROCEDURE i_fcm(p_nit_fcm                  char,
                  p_usuario                  varchar2,
                  p_correo                   varchar2,
                  p_cta_disp_s_banco         char,
                  p_cta_disp_s_tipo_cta      char,
                  p_cta_disp_s_cta           varchar2,
                  p_cta_disp_p_banco         char,
                  p_cta_disp_p_tipo_cta      char,
                  p_cta_disp_p_cta           varchar2,
                  p_iva                      number,
                  p_retencion_fuente         number,
                  p_impuesto_timbre_tercero  number,
                  p_impuesto_timbre_fcm      number,
                  p_director_ejecutivo       varchar,
                  p_director_nacional        varchar,
                  p_contador_general         varchar,
                  p_coordinador_financiero   varchar,
                  p_nit_polca                char,
                  p_nit_sevial               char,
                  p_ctacon_puente            varchar,
                  p_ctacon_fondo_cobertura   varchar,
                  p_ctacon_polca             varchar,
                  p_ctacon_fcm               varchar,
                  p_ctacon_fcma              varchar,
                  p_ctacon_ingreso           varchar,
                  p_ctacon_impuestos         varchar,
                  p_ctacon_puente_ext        varchar,
                  p_reteiva                  number,
                  p_timbre_contravencional   number,
                  p_cta_disp_pa_banco        varchar2,
                  p_cta_disp_pa_tipo_cta     varchar2,
                  p_cta_disp_pa_cta          varchar2,
                  p_m_director_ejecutivo     varchar,
                  p_m_director_nacional      varchar,
                  p_m_contador_general       varchar,
                  p_m_coordinador_financiero varchar,
                  p_dias_activacion          number,
                  p_integrado                number,
                  p_url                      varchar2,
                   p_error                    OUT VARCHAR2);

  PROCEDURE q_fcm(p_nit_fcm                  char,
                  p_usuario                  varchar2,
                  p_correo                   out varchar2,
                  p_cta_disp_s_banco         out varchar2,
                  p_cta_disp_s_tipo_cta      out varchar2,
                  p_cta_disp_s_cta           out varchar2,
                  p_cta_disp_p_banco         out varchar2,
                  p_cta_disp_p_tipo_cta      out varchar2,
                  p_cta_disp_p_cta           out varchar2,
                  p_iva                      out number,
                  p_retencion_fuente         out number,
                  p_impuesto_timbre_tercero  out number,
                  p_impuesto_timbre_fcm      out number,
                  p_director_ejecutivo       out varchar,
                  p_director_nacional        out varchar,
                  p_contador_general         out varchar,
                  p_coordinador_financiero   out varchar,
                  p_nit_polca                out char,
                  p_nit_sevial               out char,
                  p_ctacon_puente            out varchar,
                  p_ctacon_fondo_cobertura   out varchar,
                  p_ctacon_polca             out varchar,
                  p_ctacon_fcm               out varchar,
                  p_ctacon_fcma              out varchar,
                  p_ctacon_ingreso           out varchar,
                  p_ctacon_impuestos         out varchar,
                  p_ctacon_puente_ext        out varchar,
                  p_reteiva                  out number,
                  p_timbre_contravencional   out number,
                  p_cta_disp_pa_banco        out varchar2,
                  p_cta_disp_pa_tipo_cta     out varchar2,
                  p_cta_disp_pa_cta          out varchar2,
                  p_m_director_ejecutivo     out varchar,
                  p_m_director_nacional      out varchar,
                  p_m_contador_general       out varchar,
                  p_m_coordinador_financiero out varchar,
                  p_dias_activacion          out number,
                  p_integrado                out number,
                  p_url                      out varchar2,
                  p_error                    OUT VARCHAR2);

  PROCEDURE q_cta_recaudo_fcm(p_nit_fcm          char,
                              p_idbanco          varchar2,
                              p_indtipo          varchar2,
                              p_usuario          varchar2,
                              p_tipocuenta       out varchar2,
                              p_cuenta           out varchar2,
                              p_comision_recaudo out number,
                              p_comision_ach     out number,
                              p_cta_contable     out varchar2,
                              p_error            OUT VARCHAR2);

  PROCEDURE d_cta_recaudo_fcm(p_nit_fcm char,
                              p_idbanco varchar2,
                              p_indtipo varchar2,
                              p_usuario varchar2,
                              p_error   OUT VARCHAR2);

  PROCEDURE i_cta_recaudo_fcm(p_nit_fcm          char,
                              p_idbanco          varchar2,
                              p_indtipo          varchar2,
                              p_tipocuenta       varchar2,
                              p_cuenta           varchar2,
                              p_comision_recaudo number,
                              p_comision_ach     number,
                              P_cta_contable     varchar2,
                              p_usuario          varchar2,
                              p_error            OUT VARCHAR2);

  PROCEDURE u_cta_recaudo_fcm(p_nit_fcm          char,
                              p_idbanco          varchar2,
                              p_indtipo          varchar2,
                              p_tipocuenta       varchar2,
                              p_cuenta           varchar2,
                              p_comision_recaudo number,
                              p_comision_ach     number,
                              P_cta_contable     varchar2,
                              p_usuario          varchar2,
                              p_error            OUT VARCHAR2);

  PROCEDURE i_municipio(p_idmunicipio              varchar2,
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
                        p_error                    OUT VARCHAR2

                        );



  PROCEDURE q_municipio(p_idmunicipio              varchar2,
                        p_usuario                  varchar2,
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
                        p_error                    OUT VARCHAR2);

  PROCEDURE d_dias_dispersion(p_idmunicipio char,
                              p_idbanco     char,
                              p_usuario     varchar2,
                              p_error       OUT VARCHAR2);

  PROCEDURE i_dias_dispersion(p_idmunicipio char,
                              p_idbanco     char,
                              p_dias_dispersion_se number,
                              p_dias_dispersion_sl number,
                              p_dias_dispersion_pe number,
                              p_dias_dispersion_pl number,
                              p_frec_dispersion_se number,
                              p_frec_dispersion_sl number,
                              p_frec_dispersion_pe number,
                              p_frec_dispersion_pl number,
                              p_usuario varchar2,
                              p_error   OUT VARCHAR2);




  PROCEDURE u_dias_dispersion(

                              p_idmunicipio char,
                              p_idbanco     char,

                              p_dias_dispersion_se number,
                              p_dias_dispersion_sl number,
                              p_dias_dispersion_pe number,
                              p_dias_dispersion_pl number,

                              p_frec_dispersion_se number,
                              p_frec_dispersion_sl number,
                              p_frec_dispersion_pe number,
                              p_frec_dispersion_pl number,

                              p_usuario varchar2,
                              p_error   OUT VARCHAR2);

  PROCEDURE q_dias_dispersion(p_idmunicipio        char,
                              p_idbanco            char,
                              p_usuario            varchar2,
                              p_dias_dispersion_se out number,
                              p_dias_dispersion_sl out number,
                              p_dias_dispersion_pe out number,
                              p_dias_dispersion_pl out number,
                              p_frec_dispersion_se out number,
                              p_frec_dispersion_sl out number,
                              p_frec_dispersion_pe out number,
                              p_frec_dispersion_pl out number,
                              p_error OUT VARCHAR2);



  PROCEDURE i_tercero(

                      p_idmunicipio char,
                      p_nit_t       char,
                      p_nombre      varchar2,
                      p_correoTercero varchar2,
                      p_idbanco     char,
                      p_tipocuenta  char,
                      p_cuenta      varchar2,
                      p_base_s      number,
                      p_base_p      number,
                      p_ind_base    number,
                      p_num_tercero number,
                      p_usuario     varchar2,
                      p_error       OUT VARCHAR2);

  PROCEDURE u_tercero(

                      p_idmunicipio char,
                      p_nit_t       char,
                      p_nombre      varchar2,
                      p_correoTercero varchar2,
                      p_idbanco     char,
                      p_tipocuenta  char,
                      p_cuenta      varchar2,
                      p_base_s      number,
                      p_base_p      number,
                      p_ind_base    number,
                      p_num_tercero number,
                      p_usuario     varchar2,
                      p_error       OUT VARCHAR2);

  PROCEDURE q_tercero(p_idmunicipio char,
                      p_nit_t       out varchar2,
                      p_usuario     varchar2,
                      p_nombre      out varchar2,
                      p_correoTercero out varchar2,
                      p_idbanco     out varchar2,
                      p_tipocuenta  out varchar2,
                      p_cuenta      out varchar2,
                      p_base_s      out number,
                      p_base_p      out number,
                      p_ind_base    out number,
                      p_num_tercero number,
                      p_error       OUT VARCHAR2

                      );



  PROCEDURE i_concesionario(p_idconcesionario           char,
                            p_nit_c                     varchar2,
                            p_nombre                    varchar2,
                            p_correo                    varchar2,
                            p_concesionario_s           number,
                            p_fondo_cob_concesionario_s number,
                            p_fondo_cob_simit_s         number,
                            p_simit_s                   number,
                            p_equilibrio_economico_s    number,

                            p_concesionario_pm           number,
                            p_fondo_cob_concesionario_pm number,
                            p_fondo_cob_simit_pm         number,
                            p_simit_pm                   number,
                            p_equilibrio_economico_pm    number,

                            p_simit_pp                number,
                            p_sevial_pp               number,
                            p_equilibrio_economico_pp number,

                            p_polca_cp                number,
                            p_fcm_cp                  number,
                            p_sevial_cp               number,
                            p_equilibrio_economico_cp number,

                            p_ccLocalConS varchar2,
                            p_ccLocalSimS varchar2,
                            p_ccLocalFonS varchar2,
                            p_ccLocalCobS varchar2,
                            p_ccLocalEquS varchar2,

                            p_ccExtConS varchar2,
                            p_ccExtSimS varchar2,
                            p_ccExtFonS varchar2,
                            p_ccExtCobS varchar2,
                            p_ccExtEquS varchar2,

                            p_ccLocalConP varchar2,
                            p_ccLocalSimP varchar2,
                            p_ccLocalFonP varchar2,
                            p_ccLocalCobP varchar2,
                            p_ccLocalEquP varchar2,

                            p_ccExtConP varchar2,
                            p_ccExtSimP varchar2,
                            p_ccExtFonP varchar2,
                            p_ccExtCobP varchar2,
                            p_ccExtEquP varchar2,

                            p_ccLocalSimPP varchar2,
                            p_ccLocalSevPP varchar2,
                            p_ccLocalEquPP varchar2,

                            p_ccExtSimPP varchar2,
                            p_ccExtSevPP varchar2,
                            p_ccExtEquPP varchar2,

                            p_ccLocalSimCP varchar2,
                            p_ccLocalFcmCP varchar2,
                            p_ccLocalSevCP varchar2,
                            p_ccLocalEquCP varchar2,

                            p_ccExtSimCP varchar2,
                            p_ccExtFcmCP varchar2,
                            p_ccExtSevCP varchar2,
                            p_ccExtEquCP varchar2,

                            p_usuario varchar2,
                            p_error   OUT VARCHAR2);

  PROCEDURE u_concesionario(p_idconcesionario           char,
                            p_nit_c                     varchar2,
                            p_nombre                    varchar2,
                            p_correo                    varchar2,
                            p_concesionario_s           number,
                            p_fondo_cob_concesionario_s number,
                            p_fondo_cob_simit_s         number,
                            p_simit_s                   number,
                            p_equilibrio_economico_s    number,

                            p_concesionario_pm           number,
                            p_fondo_cob_concesionario_pm number,
                            p_fondo_cob_simit_pm         number,
                            p_simit_pm                   number,
                            p_equilibrio_economico_pm    number,

                            p_simit_pp                number,
                            p_sevial_pp               number,
                            p_equilibrio_economico_pp number,

                            p_polca_cp                number,
                            p_fcm_cp                  number,
                            p_sevial_cp               number,
                            p_equilibrio_economico_cp number,

                            p_ccLocalConS varchar2,
                            p_ccLocalSimS varchar2,
                            p_ccLocalFonS varchar2,
                            p_ccLocalCobS varchar2,
                            p_ccLocalEquS varchar2,

                            p_ccExtConS varchar2,
                            p_ccExtSimS varchar2,
                            p_ccExtFonS varchar2,
                            p_ccExtCobS varchar2,
                            p_ccExtEquS varchar2,

                            p_ccLocalConP varchar2,
                            p_ccLocalSimP varchar2,
                            p_ccLocalFonP varchar2,
                            p_ccLocalCobP varchar2,
                            p_ccLocalEquP varchar2,

                            p_ccExtConP varchar2,
                            p_ccExtSimP varchar2,
                            p_ccExtFonP varchar2,
                            p_ccExtCobP varchar2,
                            p_ccExtEquP varchar2,

                            p_ccLocalSimPP varchar2,
                            p_ccLocalSevPP varchar2,
                            p_ccLocalEquPP varchar2,

                            p_ccExtSimPP varchar2,
                            p_ccExtSevPP varchar2,
                            p_ccExtEquPP varchar2,

                            p_ccLocalSimCP varchar2,
                            p_ccLocalFcmCP varchar2,
                            p_ccLocalSevCP varchar2,
                            p_ccLocalEquCP varchar2,

                            p_ccExtSimCP varchar2,
                            p_ccExtFcmCP varchar2,
                            p_ccExtSevCP varchar2,
                            p_ccExtEquCP varchar2,

                            p_usuario varchar2,
                            p_error   OUT VARCHAR2);

  PROCEDURE q_concesionario(p_idconcesionario char,
                            p_usuario         varchar2,
                            p_nit_c           out varchar2,
                            p_nombre          out varchar2,
                            p_correo          out varchar2,

                            p_concesionario_s           out number,
                            p_fondo_cob_concesionario_s out number,
                            p_fondo_cob_simit_s         out number,
                            p_simit_s                   out number,
                            p_equilibrio_economico_s    out number,

                            p_concesionario_pm           out number,
                            p_fondo_cob_concesionario_pm out number,
                            p_fondo_cob_simit_pm         out number,
                            p_simit_pm                   out number,
                            p_equilibrio_economico_pm    out number,

                            p_simit_pp                out number,
                            p_sevial_pp               out number,
                            p_equilibrio_economico_pp out number,

                            p_polca_cp                out number,
                            p_fcm_cp                  out number,
                            p_sevial_cp               out number,
                            p_equilibrio_economico_cp out number,

                            p_ccLocalConS out varchar2,
                            p_ccLocalSimS out varchar2,
                            p_ccLocalFonS out varchar2,
                            p_ccLocalCobS out varchar2,
                            p_ccLocalEquS out varchar2,

                            p_ccExtConS out varchar2,
                            p_ccExtSimS out varchar2,
                            p_ccExtFonS out varchar2,
                            p_ccExtCobS out varchar2,
                            p_ccExtEquS out varchar2,

                            p_ccLocalConP out varchar2,
                            p_ccLocalSimP out varchar2,
                            p_ccLocalFonP out varchar2,
                            p_ccLocalCobP out varchar2,
                            p_ccLocalEquP out varchar2,

                            p_ccExtConP out varchar2,
                            p_ccExtSimP out varchar2,
                            p_ccExtFonP out varchar2,
                            p_ccExtCobP out varchar2,
                            p_ccExtEquP out varchar2,

                            p_ccLocalSimPP out varchar2,
                            p_ccLocalSevPP out varchar2,
                            p_ccLocalEquPP out varchar2,

                            p_ccExtSimPP out varchar2,
                            p_ccExtSevPP out varchar2,
                            p_ccExtEquPP out varchar2,

                            p_ccLocalSimCP out varchar2,
                            p_ccLocalFcmCP out varchar2,
                            p_ccLocalSevCP out varchar2,
                            p_ccLocalEquCP out varchar2,

                            p_ccExtSimCP out varchar2,
                            p_ccExtFcmCP out varchar2,
                            p_ccExtSevCP out varchar2,
                            p_ccExtEquCP out varchar2,

                            p_error OUT VARCHAR2);

  PROCEDURE i_cta_recaudo_concesionario(p_idconcesionario  char,
                                        p_idbanco          char,
                                        p_indtipo          char,
                                        p_tipocuenta       char,
                                        p_cuenta           varchar2,
                                        p_comision_recaudo number,
                                        p_comision_ach     number,
                                        p_cta_contable     varchar2,
                                        p_usuario          varchar2,
                                        p_error            OUT VARCHAR2

                                        );

  PROCEDURE u_cta_recaudo_concesionario(

                                        p_idconcesionario  char,
                                        p_idbanco          char,
                                        p_indtipo          char,
                                        p_tipocuenta       char,
                                        p_cuenta           varchar2,
                                        p_comision_recaudo number,
                                        p_comision_ach     number,
                                        p_cta_contable     varchar2,
                                        p_usuario          varchar2,
                                        p_error            OUT VARCHAR2

                                        );

  PROCEDURE d_cta_recaudo_concesionario(p_idconcesionario char,
                                        p_idbanco         char,
                                        p_indtipo         varchar2,
                                        p_cuenta          varchar2,
                                        p_usuario         varchar2,
                                        p_error           OUT VARCHAR2);

  PROCEDURE q_cta_recaudo_concesionario(p_idconcesionario  char,
                                        p_idbanco          char,
                                        p_indtipo          char,
                                        p_cuenta           varchar2,
                                        p_tipocuenta       out varchar2,
                                        p_comision_recaudo out number,
                                        p_comision_ach     out number,
                                        p_cta_contable     out varchar2,
                                        p_usuario          varchar2,
                                        p_error            OUT VARCHAR2

                                        );

  PROCEDURE i_cta_dispersion_concesionario(p_idconcesionario char,
                                           p_idbancorec      char,
                                           p_liq_idbanco     char,
                                           p_liq_tipocuenta  char,
                                           p_liq_cuenta      varchar2,
                                           p_liq_nit_c       char,

                                           p_fon_idbanco    char,
                                           p_fon_tipocuenta char,
                                           p_fon_cuenta     varchar2,
                                           p_fon_nit_c      char,

                                           p_con_idbanco    char,
                                           p_con_tipocuenta char,
                                           p_con_cuenta     varchar2,
                                           p_con_nit_c      char,

                                           p_fcm_idbanco    char,
                                           p_fcm_tipocuenta char,
                                           p_fcm_cuenta     varchar2,
                                           p_fcm_nit_c      char,

                                           p_sevial_idbanco    char,
                                           p_sevial_tipocuenta char,
                                           p_sevial_cuenta     varchar2,
                                           p_sevial_nit_c      char,

                                           p_polca_idbanco    char,
                                           p_polca_tipocuenta char,
                                           p_polca_cuenta     varchar2,
                                           p_polca_nit_c      char,

                                           p_avv_idbanco    char,
                                           p_avv_tipocuenta char,
                                           p_avv_cuenta     varchar2,
                                           p_avv_nit_c      char,

                                           p_usuario varchar2,
                                           p_error   OUT VARCHAR2);

  PROCEDURE q_cta_dispersion_concesionario(p_idconcesionario char,
                                           p_idbancorec      char,
                                           p_usuario         varchar2,

                                           p_liq_idbanco    out varchar2,
                                           p_liq_tipocuenta out varchar2,
                                           p_liq_cuenta     out varchar2,
                                           p_liq_nit_c      out varchar2,

                                           p_fon_idbanco    out varchar2,
                                           p_fon_tipocuenta out varchar2,
                                           p_fon_cuenta     out varchar2,
                                           p_fon_nit_c      out varchar2,

                                           p_con_idbanco    out varchar2,
                                           p_con_tipocuenta out varchar2,
                                           p_con_cuenta     out varchar2,
                                           p_con_nit_c      out varchar2,

                                           p_fcm_idbanco    out varchar2,
                                           p_fcm_tipocuenta out varchar2,
                                           p_fcm_cuenta     out varchar2,
                                           p_fcm_nit_c      out varchar2,

                                           p_sevial_idbanco    out varchar2,
                                           p_sevial_tipocuenta out varchar2,
                                           p_sevial_cuenta     out varchar2,
                                           p_sevial_nit_c      out varchar2,

                                           p_polca_idbanco    out varchar2,
                                           p_polca_tipocuenta out varchar2,
                                           p_polca_cuenta     out varchar2,
                                           p_polca_nit_c      out varchar2,

                                           p_avv_idbanco    out varchar2,
                                           p_avv_tipocuenta out varchar2,
                                           p_avv_cuenta     out varchar2,
                                           p_avv_nit_c      out varchar2,

                                           p_error OUT VARCHAR2);

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
                                    p_valor_total   number,
                                    p_idmunicipio   char,
                                    p_periodo       char,
                                    p_p_consignado  number,
                                    p_usuario       varchar2,
                                    p_error         OUT VARCHAR2);

  PROCEDURE d_recaudo_local_ajustes(p_id_recaudo_local_ajustes number,
                                    p_usuario                  varchar2,
                                    p_error                    OUT VARCHAR2);

  PROCEDURE u_person(p_idperson     number,
                     p_password_ant varchar,
                     p_password_new varchar,
                     p_usuario      varchar2,
                     p_error        OUT VARCHAR2);

  PROCEDURE u_municipio(p_idmunicipio              varchar2,
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
                        p_error                    OUT VARCHAR2);



  PROCEDURE i_cta_dispersion_fcm           (
                                          P_NIT_FCM	VARCHAR2,
                                          P_IDBANCOREC	CHAR,
                                          P_CTA_DISP_S_BANCO	CHAR,
                                          P_CTA_DISP_S_TIPO_CTA	VARCHAR2,
                                          P_CTA_DISP_S_CTA	VARCHAR2,
                                          P_CTA_DISP_P_BANCO	CHAR,
                                          P_CTA_DISP_P_TIPO_CTA	VARCHAR2,
                                          P_CTA_DISP_P_CTA	VARCHAR2,
                                          P_CTA_DISP_PA_BANCO	CHAR,
                                          P_CTA_DISP_PA_TIPO_CTA	VARCHAR2,
                                          P_CTA_DISP_PA_CTA	VARCHAR2,
                                          P_CTA_DISP_AC_BANCO	CHAR,
                                          P_CTA_DISP_AC_TIPO_CTA	VARCHAR2,
                                          P_CTA_DISP_AC_CTA	VARCHAR2,
                                           p_usuario varchar2,
                                           p_error   OUT VARCHAR2);

  PROCEDURE u_cta_dispersion_fcm           (
                                          P_NIT_FCM	VARCHAR2,
                                          P_IDBANCOREC	CHAR,
                                          P_CTA_DISP_S_BANCO	CHAR,
                                          P_CTA_DISP_S_TIPO_CTA	VARCHAR2,
                                          P_CTA_DISP_S_CTA	VARCHAR2,
                                          P_CTA_DISP_P_BANCO	CHAR,
                                          P_CTA_DISP_P_TIPO_CTA	VARCHAR2,
                                          P_CTA_DISP_P_CTA	VARCHAR2,
                                          P_CTA_DISP_PA_BANCO	CHAR,
                                          P_CTA_DISP_PA_TIPO_CTA	VARCHAR2,
                                          P_CTA_DISP_PA_CTA	VARCHAR2,
                                          P_CTA_DISP_AC_BANCO	CHAR,
                                          P_CTA_DISP_AC_TIPO_CTA	VARCHAR2,
                                          P_CTA_DISP_AC_CTA	VARCHAR2,
                                           p_usuario varchar2,
                                           p_error   OUT VARCHAR2);

  PROCEDURE q_cta_dispersion_fcm           (
                                          P_NIT_FCM	VARCHAR2,
                                          P_IDBANCOREC	CHAR,
                                          P_CTA_DISP_S_BANCO	OUT VARCHAR2,
                                          P_CTA_DISP_S_TIPO_CTA	OUT VARCHAR2,
                                          P_CTA_DISP_S_CTA	OUT VARCHAR2,
                                          P_CTA_DISP_P_BANCO	OUT VARCHAR2,
                                          P_CTA_DISP_P_TIPO_CTA	OUT VARCHAR2,
                                          P_CTA_DISP_P_CTA	OUT VARCHAR2,
                                          P_CTA_DISP_PA_BANCO	OUT VARCHAR2,
                                          P_CTA_DISP_PA_TIPO_CTA	OUT VARCHAR2,
                                          P_CTA_DISP_PA_CTA	OUT VARCHAR2,
                                          P_CTA_DISP_AC_BANCO	OUT VARCHAR2,
                                          P_CTA_DISP_AC_TIPO_CTA	OUT VARCHAR2,
                                          P_CTA_DISP_AC_CTA	OUT VARCHAR2,
                                           p_usuario varchar2,
                                           p_error   OUT VARCHAR2);

  PROCEDURE d_cta_dispersion_fcm           (
                                          P_NIT_FCM	VARCHAR2,
                                          P_IDBANCOREC	CHAR,
                                           p_usuario varchar2,
                                           p_error   OUT VARCHAR2);

    PROCEDURE validarRangoFecha(p_fecha_ini_ano number,
                              p_fecha_ini_mes number,
                              p_fecha_ini_dia number,
                              p_fecha_fin_ano number,
                              p_fecha_fin_mes number,
                              p_fecha_fin_dia number,
                              p_indtipo       char,
                              p_idmunicipio   char,
                              p_idvalidador   char,
                              p_error         OUT VARCHAR2);

PROCEDURE u_NovmunicipioEst(p_tiponov   varchar2,
                              p_numeronov varchar2,
                              p_usuario   varchar2,
                              p_estado    varchar2,
                              p_error     OUT VARCHAR2);

end pk_param;
/

prompt
prompt Creating package body PK_PARAM
prompt ==============================
prompt
create or replace package body simit.pk_param is

  -- Private variable declarations
  v_valida NUMBER;

  -- Function and procedure implementations

  PROCEDURE i_fecha_no_habil(p_fecha_ini_ano number,
                             p_fecha_ini_mes number,
                             p_fecha_ini_dia number,
                             p_usuario       varchar2,
                             p_error         OUT VARCHAR2) is

    p_fecha varchar2(8);

  begin

    select TO_CHAR(TO_DATE(p_fecha_ini_ano || '-' || p_fecha_ini_mes || '-' ||
                           p_fecha_ini_dia,
                           'YYYY-MM-DD'),
                   'YYYYMMDD')
      into p_fecha
      from DUAL;

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
      IF not P_ERROR is null THEN
       return;
    end if;

    select COUNT(*)
      INTO v_valida
      from fecha_no_habil t
     WHERE t.fecha = p_fecha;
    IF v_valida <> 0 THEN
      p_error := 'La fecha ya esta asociada. ';
    END IF;

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      insert into fecha_no_habil (fecha) values (p_fecha);
      sp_log(p_usuario, 'i_fecha_no_habil', p_fecha);
      commit;
      p_error := 'Fecha agregada Exitosamente. ';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [i_fecha_no_habil] ' || SQLERRM,
            p_error);
  END i_fecha_no_habil;

  PROCEDURE d_fecha_no_habil(p_fecha   varchar2,
                             p_usuario varchar2,
                             p_error   OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      delete fecha_no_habil where fecha = p_fecha;
      sp_log(p_usuario, 'd_fecha_no_habil', p_fecha);
      commit;
      p_error := 'Fecha eliminada Exitosamente. ';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [d_fecha_no_habil] ' || SQLERRM,
            p_error);
  END d_fecha_no_habil;

  PROCEDURE q_fecha_no_habil(p_cursor  OUT SYS_REFCURSOR,
                             p_usuario varchar2,
                             p_error   OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      open p_cursor FOR
        select * from fecha_no_habil;
      p_error := 'q_fecha_no_habil';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [q_fecha_no_habil] ' || SQLERRM,
            p_error);
  END q_fecha_no_habil;

  PROCEDURE i_salario_minimo(p_anho    number,
                             p_valor   number,
                             p_usuario varchar2,
                             p_error   OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
    IF not P_ERROR is null THEN
       return;
    end if;

    select COUNT(*)
      INTO v_valida
      from salario_minimo t
     WHERE t.anho = p_anho;

    IF v_valida <> 0 THEN
      p_error := 'El valor ya esta asociado al año. ';
    else
      insert into salario_minimo (anho, valor) values (p_anho, p_valor);
      sp_log(p_usuario, 'i_salario_minimo', p_anho || '-' || p_valor);
      commit;
      p_error := 'Salario Minimo agregado Exitosamente. ';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [i_salario_minimo] ' || SQLERRM,
            p_error);
  END i_salario_minimo;

  PROCEDURE u_salario_minimo(p_anho    number,
                             p_valor   number,
                             p_usuario varchar2,
                             p_error   OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
    IF not P_ERROR is null THEN
       return;
    end if;

    select COUNT(*)
      INTO v_valida
      from salario_minimo t
     WHERE t.anho = p_anho;
    IF v_valida <> 0 THEN
      update salario_minimo
         set anho = p_anho, valor = p_valor
       where anho = p_anho;
      commit;
      p_error := 'Salario Minimo Actualizado Exitosamente. ';
    else
      p_error := 'El año no existe ';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [u_salario_minimo] ' || SQLERRM,
            p_error);
  END u_salario_minimo;

  PROCEDURE d_salario_minimo(p_anho    number,
                             p_usuario varchar2,
                             p_error   OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      delete salario_minimo where anho = p_anho;
      sp_log(p_usuario, 'd_salario_minimo', p_anho);
      commit;
      p_error := 'Salario Minimo eliminado Exitosamente. ';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [d_salario_minimo] ' || SQLERRM,
            p_error);
  END d_salario_minimo;

  PROCEDURE q_salario_minimo(p_cursor  OUT SYS_REFCURSOR,
                             p_usuario varchar2,
                             p_error   OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      open p_cursor FOR
        select * from salario_minimo;
      p_error := 'q_salario_minimo';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [q_salario_minimo] ' || SQLERRM,
            p_error);
  END q_salario_minimo;

  PROCEDURE i_concepto(p_idconcepto number,
                       p_nombre     varchar2,
                       p_usuario    varchar2,
                       p_error      OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
      IF not P_ERROR is null THEN
       return;
    end if;

    select COUNT(*)
      INTO v_valida
      from concepto t
     WHERE idconcepto = p_idconcepto;
    IF v_valida <> 0 THEN
      p_error := 'El valor ya esta asociado . ';
    END IF;

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      insert into concepto
        (idconcepto, nombre)
      values
        (p_idconcepto, p_nombre);
      sp_log(p_usuario, 'i_concepto', p_idconcepto || '-' || p_nombre);
      commit;
      p_error := 'concepto agregado Exitosamente. ';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [i_concepto] ' || SQLERRM, p_error);
  END i_concepto;

  PROCEDURE d_concepto(p_idconcepto number,
                       p_usuario    varchar2,
                       p_error      OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      delete concepto where idconcepto = p_idconcepto;
      sp_log(p_usuario, 'd_concepto', p_idconcepto);
      commit;
      p_error := 'concepto eliminado Exitosamente. ';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [d_concepto] ' || SQLERRM, p_error);
  END d_concepto;

  PROCEDURE q_concepto(p_cursor  OUT SYS_REFCURSOR,
                       p_usuario varchar2,
                       p_error   OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      open p_cursor FOR
        select * from concepto;
      p_error := 'q_concepto';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [q_concepto] ' || SQLERRM, p_error);
  END q_concepto;

  PROCEDURE i_banco(p_idbanco     char,
                    p_nombre      varchar2,
                    p_responsable varchar2,
                    p_cargo       varchar2,
                    p_correo      varchar2,
                    p_telefono    varchar2,
                    p_dirCorres   varchar2,
                    p_usuario     varchar2,
                    p_error       OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF not P_ERROR is null THEN
       return;
    end if;


    select COUNT(*) INTO v_valida from banco t WHERE idbanco = p_idbanco;
    IF v_valida <> 0 THEN
      p_error := 'Banco ya existente';
    else
      insert into banco
        (idbanco, nombre, responsable, cargo, correo, telefono, dirCorres)
      values
        (p_idbanco,
         p_nombre,
         p_responsable,
         p_cargo,
         p_correo,
         p_telefono,
         p_dirCorres);

      p_error := MSG_INS_OK;

      sp_log(p_usuario,
             'i_banco',
             p_idbanco || '-' || p_nombre || '-' || p_responsable || '-' ||
             p_cargo || '-' || p_correo || '-' || p_telefono || '-' ||
             p_dirCorres);
      commit;
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [i_banco] ' || SQLERRM, p_error);
  END i_banco;

  PROCEDURE u_banco(p_idbanco     char,
                    p_nombre      varchar2,
                    p_responsable varchar2,
                    p_cargo       varchar2,
                    p_correo      varchar2,
                    p_telefono    varchar2,
                    p_dirCorres   varchar2,
                    p_usuario     varchar2,
                    p_error       OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF not P_ERROR is null THEN
       return;
    end if;

    select COUNT(*) INTO v_valida from banco t WHERE idbanco = p_idbanco;
    IF v_valida <> 0 THEN
      update banco
         set nombre      = p_nombre,
             responsable = p_responsable,
             cargo       = p_cargo,
             correo      = p_correo,
             telefono    = p_telefono,
             dirCorres   = p_dirCorres
       where idbanco = p_idbanco;
      sp_log(p_usuario,
             'u_banco',
             p_idbanco || '-' || p_nombre || '-' || p_responsable || '-' ||
             p_cargo || '-' || p_correo || '-' || p_telefono || '-' ||
             p_dirCorres);
      commit;
      p_error := MSG_UPD_OK;
    else
      p_error := 'Banco no existe';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [u_banco] ' || SQLERRM, p_error);
  END u_banco;

  PROCEDURE d_banco(p_idbanco char,
                    p_usuario varchar2,
                    p_error   OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      delete banco where idbanco = p_idbanco;
      sp_log(p_usuario, 'd_banco', p_idbanco);
      commit;
      p_error := MSG_DEL_OK;
    END IF;

  EXCEPTION

    WHEN OTHERS THEN
      p_error := SQLERRM;
      sp_ex(SQLCODE, p_usuario || ' [d_banco] ' || SQLERRM, p_error);
  END d_banco;

  PROCEDURE q_banco(p_idbanco     char,
                    p_usuario     varchar2,
                    p_nombre      out varchar2,
                    p_responsable out varchar2,
                    p_cargo       out varchar2,
                    p_correo      out varchar2,
                    p_telefono    out varchar2,
                    p_dirCorres   out varchar2,
                    p_error       OUT VARCHAR2) is
  begin

    p_nombre      := '';
    p_responsable := '';
    p_cargo       := '';
    p_correo      := '';
    p_telefono    := '';

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select nombre, responsable, cargo, correo, telefono, dirCorres
          into p_nombre,
               p_responsable,
               p_cargo,
               p_correo,
               p_telefono,
               p_dirCorres
          from banco
         where idbanco = p_idbanco;

        p_error := 'Consulta Exitosa';
      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';

      END;

    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [q_banco] ' || SQLERRM, p_error);
  END q_banco;

  PROCEDURE d_concesionario(p_idconcesionario char,
                            p_usuario         varchar2,
                            p_error           OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones

      delete p_dispersion_concesionario
       where idconcesionario = p_idconcesionario;

      delete concesionario where idconcesionario = p_idconcesionario;

      sp_log(p_usuario, 'd_concesionario', p_idconcesionario);
      commit;

      p_error := MSG_DEL_OK;
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [d_concesionario] ' || SQLERRM,
            p_error);
  END d_concesionario;

  PROCEDURE i_departamento(p_iddepartamento char,
                           p_nombre         varchar2,
                           p_usuario        varchar2,
                           p_error          OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
      IF not P_ERROR is null THEN
       return;
    end if;

    select COUNT(*)
      INTO v_valida
      from departamento t
     WHERE iddepartamento = p_iddepartamento;
    IF v_valida <> 0 THEN
      p_error := 'El valor ya esta asociado . ';
    END IF;

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      insert into departamento
        (iddepartamento, nombre)
      values
        (p_iddepartamento, p_nombre);
      sp_log(p_usuario,
             'departamento',
             p_iddepartamento || '-' || p_nombre);
      commit;
      p_error := 'departamento agregado Exitosamente. ';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [i_departamento] ' || SQLERRM, p_error);
  END i_departamento;

  PROCEDURE d_departamento(p_iddepartamento char,
                           p_usuario        varchar2,
                           p_error          OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      delete departamento where iddepartamento = p_iddepartamento;
      sp_log(p_usuario, 'd_departamento', p_iddepartamento);
      commit;
      p_error := 'departamento eliminado Exitosamente. ';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [d_departamento] ' || SQLERRM, p_error);
  END d_departamento;

  PROCEDURE q_departamento(p_cursor  OUT SYS_REFCURSOR,
                           p_usuario varchar2,
                           p_error   OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      open p_cursor FOR
        select * from departamento;
      p_error := 'q_departamento';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [q_departamento] ' || SQLERRM, p_error);
  END q_departamento;

  PROCEDURE d_municipio(p_idmunicipio char,
                        p_usuario     varchar2,
                        p_error       OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      delete p_dispersion_municipio where idmunicipio = p_idmunicipio;
      delete municipio where idmunicipio = p_idmunicipio;
      sp_log(p_usuario, 'd_municipio', p_idmunicipio);
      commit;
      p_error := 'municipio eliminado Exitosamente. ';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [d_municipio] ' || SQLERRM, p_error);
  END d_municipio;

  PROCEDURE d_tercero(p_idmunicipio char,
                      p_num_tercero number,
                      p_usuario     varchar2,
                      p_error       OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      delete tercero
       where idmunicipio = p_idmunicipio
         and num_tercero = p_num_tercero;
      sp_log(p_usuario, 'd_tercero', p_idmunicipio || '-' || p_num_tercero);
      commit;
      p_error := 'tercero eliminado Exitosamente. ';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [d_tercero] ' || SQLERRM, p_error);
  END d_tercero;

  PROCEDURE d_cta_dispersion_concesionario(p_idconcepto      number,
                                           p_idconcesionario char,
                                           p_usuario         varchar2,
                                           p_error           OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      delete cta_dispersion_concesionario
       where idconcepto = p_idconcepto
         and idconcesionario = p_idconcesionario;
      sp_log(p_usuario,
             'd_cta_dispersion_concesionario',
             p_idconcepto || '-' || p_idconcesionario);
      commit;
      p_error := 'cta_dispersion_concesionario eliminado Exitosamente. ';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [d_cta_dispersion_concesionario] ' || SQLERRM,
            p_error);
  END d_cta_dispersion_concesionario;

  PROCEDURE i_p_dispersion_concesionario(p_idconcesionario              char,
                                         p_concesionario_s              number,
                                         p_fondo_cob_concesionario_s    number,
                                         p_fondo_cob_simit_s            number,
                                         p_simit_s                      number,
                                         p_equilibrio_economico_s       number,
                                         p_concesionario_pm             number,
                                         p_fondo_cob_concesionario_pm   number,
                                         p_fondo_cob_simit_pm           number,
                                         p_equilibrio_economico_pm      number,
                                         p_simit_pp                     number,
                                         p_sevial_pp                    number,
                                         p_equilibrio_economico_pp      number,
                                         p_polca_cp                     number,
                                         p_fcm_cp                       number,
                                         p_sevial_cp                    number,
                                         p_equilibrio_economico_cp      number,
                                         p_concesionario_s_cc           varchar2,
                                         p_fondo_cob_concesionario_s_cc varchar2,
                                         p_fondo_cob_simit_s_cc         varchar2,
                                         p_simit_s_cc                   varchar2,
                                         p_equilibrio_economico_s_cc    varchar2,
                                         p_concesionario_pm_cc          varchar2,
                                         p_fondo_cob_concesionario_pm_c varchar2,
                                         p_fondo_cob_simit_pm_cc        varchar2,
                                         p_equilibrio_economico_pm_cc   varchar2,
                                         p_simit_pp_cc                  varchar2,
                                         p_sevial_pp_cc                 varchar2,
                                         p_equilibrio_economico_pp_cc   varchar2,
                                         p_polca_cp_cc                  varchar2,
                                         p_fcm_cp_cc                    varchar2,
                                         p_sevial_cp_cc                 varchar2,
                                         p_equilibrio_economico_cp_cc   varchar2,
                                         p_simit_pm                     number,
                                         p_usuario                      varchar2,
                                         p_error                        OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
      IF not P_ERROR is null THEN
       return;
    end if;

    select COUNT(*)
      INTO v_valida
      from p_dispersion_concesionario t
     WHERE idconcesionario = p_idconcesionario;
    IF v_valida <> 0 THEN
      p_error := 'El valor ya esta asociado . ';
    END IF;

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      insert into p_dispersion_concesionario
        (idconcesionario,
         concesionario_s,
         fondo_cob_concesionario_s,
         fondo_cob_simit_s,
         simit_s,
         equilibrio_economico_s,
         concesionario_pm,
         fondo_cob_concesionario_pm,
         fondo_cob_simit_pm,
         equilibrio_economico_pm,
         simit_pp,
         sevial_pp,
         equilibrio_economico_pp,
         polca_cp,
         fcm_cp,
         sevial_cp,
         equilibrio_economico_cp,
         concesionario_s_cc,
         fondo_cob_concesionario_s_cc,
         fondo_cob_simit_s_cc,
         simit_s_cc,
         equilibrio_economico_s_cc,
         concesionario_pm_cc,
         fondo_cob_concesionario_pm_cc,
         fondo_cob_simit_pm_cc,
         equilibrio_economico_pm_cc,
         simit_pp_cc,
         sevial_pp_cc,
         equilibrio_economico_pp_cc,
         polca_cp_cc,
         fcm_cp_cc,
         sevial_cp_cc,
         equilibrio_economico_cp_cc,
         simit_pm)
      values
        (p_idconcesionario,
         p_concesionario_s,
         p_fondo_cob_concesionario_s,
         p_fondo_cob_simit_s,
         p_simit_s,
         p_equilibrio_economico_s,
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
         p_concesionario_s_cc,
         p_fondo_cob_concesionario_s_cc,
         p_fondo_cob_simit_s_cc,
         p_simit_s_cc,
         p_equilibrio_economico_s_cc,
         p_concesionario_pm_cc,
         p_fondo_cob_concesionario_pm_c,
         p_fondo_cob_simit_pm_cc,
         p_equilibrio_economico_pm_cc,
         p_simit_pp_cc,
         p_sevial_pp_cc,
         p_equilibrio_economico_pp_cc,
         p_polca_cp_cc,
         p_fcm_cp_cc,
         p_sevial_cp_cc,
         p_equilibrio_economico_cp_cc,
         p_simit_pm);
      sp_log(p_usuario,
             'i_p_dispersion_concesionario',
             p_idconcesionario || '-' || p_concesionario_s || '-' ||
             p_fondo_cob_concesionario_s || '-' || p_fondo_cob_simit_s || '-' ||
             p_simit_s || '-' || p_equilibrio_economico_s || '-' ||
             p_concesionario_pm || '-' || p_fondo_cob_concesionario_pm || '-' ||
             p_fondo_cob_simit_pm || '-' || p_equilibrio_economico_pm || '-' ||
             p_simit_pp || '-' || p_sevial_pp || '-' ||
             p_equilibrio_economico_pp || '-' || p_polca_cp || '-' ||
             p_fcm_cp || '-' || p_sevial_cp || '-' ||
             p_equilibrio_economico_cp || '-' || p_concesionario_s_cc || '-' ||
             p_fondo_cob_concesionario_s_cc || '-' ||
             p_fondo_cob_simit_s_cc || '-' || p_simit_s_cc || '-' ||
             p_equilibrio_economico_s_cc || '-' || p_concesionario_pm_cc || '-' ||
             p_fondo_cob_concesionario_pm_c || '-' ||
             p_fondo_cob_simit_pm_cc || '-' || p_equilibrio_economico_pm_cc || '-' ||
             p_simit_pp_cc || '-' || p_sevial_pp_cc || '-' ||
             p_equilibrio_economico_pp_cc || '-' || p_polca_cp_cc || '-' ||
             p_fcm_cp_cc || '-' || p_sevial_cp_cc || '-' ||
             p_equilibrio_economico_cp_cc || '-' || p_simit_pm);
      commit;
      p_error := 'p_dispersion_concesionario agregado Exitosamente. ';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [i_p_dispersion_concesionario] ' || SQLERRM,
            p_error);
  END i_p_dispersion_concesionario;

  PROCEDURE d_p_dispersion_concesionario(p_idconcesionario char,
                                         p_usuario         varchar2,
                                         p_error           OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      delete p_dispersion_concesionario
       where idconcesionario = p_idconcesionario;
      sp_log(p_usuario, 'd_p_dispersion_concesionario', p_idconcesionario);
      commit;
      p_error := 'p_dispersion_concesionario eliminado Exitosamente. ';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [d_p_dispersion_concesionario] ' || SQLERRM,
            p_error);
  END d_p_dispersion_concesionario;

  PROCEDURE q_p_dispersion_concesionario(p_cursor  OUT SYS_REFCURSOR,
                                         p_usuario varchar2,
                                         p_error   OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      open p_cursor FOR
        select * from p_dispersion_concesionario;
      p_error := 'q_p_dispersion_concesionario';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [q_p_dispersion_concesionario] ' || SQLERRM,
            p_error);
  END q_p_dispersion_concesionario;

  PROCEDURE i_p_dispersion_municipio(p_idmunicipio              char,
                                     p_municipio_s              number,
                                     p_fcm_contravencional_s    number,
                                     p_conces_contravencional_s number,
                                     p_acuerdopago_s            number,
                                     p_municipio_p              number,
                                     p_fcm_contravencional_p    number,
                                     p_conces_contravencional_p number,
                                     p_acuerdopago_p            number,
                                     p_usuario                  varchar2,
                                     p_error                    OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
      IF not P_ERROR is null THEN
       return;
    end if;

    select COUNT(*)
      INTO v_valida
      from p_dispersion_municipio t
     WHERE idmunicipio = p_idmunicipio;
    IF v_valida <> 0 THEN
      p_error := 'El valor ya esta asociado . ';
    END IF;

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
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
        (p_idmunicipio,
         p_municipio_s,
         p_fcm_contravencional_s,
         p_conces_contravencional_s,
         p_acuerdopago_s,
         p_municipio_p,
         p_fcm_contravencional_p,
         p_conces_contravencional_p,
         p_acuerdopago_p);
      sp_log(p_usuario,
             'i_p_dispersion_municipio',
             p_idmunicipio || '-' || p_municipio_s || '-' ||
             p_fcm_contravencional_s || '-' || p_conces_contravencional_s || '-' ||
             p_acuerdopago_s || '-' || p_municipio_p || '-' ||
             p_fcm_contravencional_p || '-' || p_conces_contravencional_p || '-' ||
             p_acuerdopago_p);
      commit;
      p_error := 'p_dispersion_municipio agregado Exitosamente. ';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [i_p_dispersion_municipio] ' || SQLERRM,
            p_error);
  END i_p_dispersion_municipio;

  PROCEDURE d_p_dispersion_municipio(p_idmunicipio char,
                                     p_usuario     varchar2,
                                     p_error       OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      delete p_dispersion_municipio where idmunicipio = p_idmunicipio;
      sp_log(p_usuario, 'd_p_dispersion_municipio', p_idmunicipio);
      commit;
      p_error := 'p_dispersion_municipio eliminado Exitosamente. ';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [d_p_dispersion_municipio] ' || SQLERRM,
            p_error);
  END d_p_dispersion_municipio;

  PROCEDURE q_p_dispersion_municipio(p_cursor  OUT SYS_REFCURSOR,
                                     p_usuario varchar2,
                                     p_error   OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      open p_cursor FOR
        select * from p_dispersion_municipio;
      p_error := 'q_p_dispersion_municipio';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [q_p_dispersion_municipio] ' || SQLERRM,
            p_error);
  END q_p_dispersion_municipio;

  PROCEDURE q_validador_fecha(p_idmunicipio              char,
                              p_idvalidador              char,
                              p_indTipo                  char,
                              p_usuario                  varchar2,
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
                              p_error                    OUT VARCHAR2

                              ) is
  BEGIN

    -- INICIALIZAR SALIDA
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
    --sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select fecha_ini,
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
               ind_base_tercero2

          into p_fecha_ini,
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
               p_ind_base_tercero2

          from validador_fecha
         where idMunicipio = p_idmunicipio
           and idValidador = p_idvalidador
           and indTipo = p_indTipo;

        p_error := 'Consulta Exitosa';

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';

      END;

    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [q_validador_fecha] ' || SQLERRM,
            p_error);
  END q_validador_fecha;






  PROCEDURE i_validador_fecha(p_idmunicipio              char,
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
                              p_error                    OUT VARCHAR2) AS

    w_fecha_ini validador_fecha.fecha_ini%TYPE;
    w_fecha_fin validador_fecha.fecha_ini%TYPE;
    w_operacion varchar2(250);

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
  IF not P_ERROR is null THEN
       return;
    end if;

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

    select COUNT(*)
      INTO v_valida
      from validador_fecha t
     where idMunicipio = p_idmunicipio
       and idValidador = p_idvalidador
       and indTipo = p_indTipo;

    IF v_valida <> 0 THEN

      p_error := 'Validador Ya existente. ';

    END IF;

    IF v_valida = 0 THEN

      insert into validador_fecha
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
         ind_base_tercero2)
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
         p_ind_base_tercero2

         );
      w_operacion := 'i_validador_fecha';

      p_error := MSG_INS_OK;

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

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [i_validador_fecha] ' || SQLERRM,
            p_error);

  END i_validador_fecha;









  PROCEDURE q_fcm(p_nit_fcm                  char,
                  p_usuario                  varchar2,
                  p_correo                   out varchar2,
                  p_cta_disp_s_banco         out varchar2,
                  p_cta_disp_s_tipo_cta      out varchar2,
                  p_cta_disp_s_cta           out varchar2,
                  p_cta_disp_p_banco         out varchar2,
                  p_cta_disp_p_tipo_cta      out varchar2,
                  p_cta_disp_p_cta           out varchar2,
                  p_iva                      out number,
                  p_retencion_fuente         out number,
                  p_impuesto_timbre_tercero  out number,
                  p_impuesto_timbre_fcm      out number,
                  p_director_ejecutivo       out varchar,
                  p_director_nacional        out varchar,
                  p_contador_general         out varchar,
                  p_coordinador_financiero   out varchar,
                  p_nit_polca                out char,
                  p_nit_sevial               out char,
                  p_ctacon_puente            out varchar,
                  p_ctacon_fondo_cobertura   out varchar,
                  p_ctacon_polca             out varchar,
                  p_ctacon_fcm               out varchar,
                  p_ctacon_fcma              out varchar,
                  p_ctacon_ingreso           out varchar,
                  p_ctacon_impuestos         out varchar,
                  p_ctacon_puente_ext        out varchar,
                  p_reteiva                  out number,
                  p_timbre_contravencional   out number,
                  p_cta_disp_pa_banco        out varchar2,
                  p_cta_disp_pa_tipo_cta     out varchar2,
                  p_cta_disp_pa_cta          out varchar2,
                  p_m_director_ejecutivo     out varchar,
                  p_m_director_nacional      out varchar,
                  p_m_contador_general       out varchar,
                  p_m_coordinador_financiero out varchar,
                  p_dias_activacion          out number,
                  p_integrado                out number,
                  p_url                      out varchar2,
                  p_error                    OUT VARCHAR2) is
  BEGIN

    -- INICIALIZAR SALIDA
    p_correo                   := NULL;
    p_cta_disp_s_banco         := '00';
    p_cta_disp_s_tipo_cta      := '000';
    p_cta_disp_s_cta           := NULL;
    p_cta_disp_p_banco         := '00';
    p_cta_disp_p_tipo_cta      := '000';
    p_cta_disp_p_cta           := NULL;
    p_iva                      := 0;
    p_retencion_fuente         := 0;
    p_impuesto_timbre_tercero  := 0;
    p_impuesto_timbre_fcm      := 0;
    p_director_ejecutivo       := NULL;
    p_m_director_ejecutivo     := NULL;
    p_director_nacional        := NULL;
    p_m_director_nacional      := NULL;
    p_contador_general         := NULL;
    p_m_contador_general       := NULL;
    p_coordinador_financiero   := NULL;
    p_m_coordinador_financiero := NULL;
    p_nit_polca                := NULL;
    p_nit_sevial               := NULL;

    p_ctacon_puente          := NULL;
    p_ctacon_fondo_cobertura := NULL;
    p_ctacon_polca           := NULL;
    p_ctacon_fcm             := NULL;
    p_ctacon_fcma            := NULL;
    p_ctacon_ingreso         := NULL;
    p_ctacon_impuestos       := NULL;
    p_ctacon_puente_ext      := NULL;
    p_reteiva                := 0;
    p_timbre_contravencional := 0;
    p_cta_disp_pa_banco      := '00';
    p_cta_disp_pa_tipo_cta   := '000';
    p_cta_disp_pa_cta        := NULL;
    p_dias_activacion        := 0;
    p_integrado              := 0;
    p_url                    := NULL;

    -- VALIDACIONES
    --sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select correo,
               cta_disp_s_banco,
               cta_disp_s_tipo_cta,
               cta_disp_s_cta,
               cta_disp_p_banco,
               cta_disp_p_tipo_cta,
               cta_disp_p_cta,
               iva,
               retencion_fuente,
               impuesto_timbre_tercero,
               impuesto_timbre_fcm,
               director_ejecutivo,
               director_nacional,
               contador_general,
               coordinador_financiero,
               nit_polca,
               nit_sevial,
               ctacon_puente,
               ctacon_fondo_cobertura,
               ctacon_polca,
               ctacon_fcm,
               ctacon_fcma,
               ctacon_ingreso,
               ctacon_impuestos,
               ctacon_puente_ext,
               reteiva,
               timbre_contravencional,
               cta_disp_pa_banco,
               cta_disp_pa_tipo_cta,
               cta_disp_pa_cta,
               m_director_ejecutivo,
               m_director_nacional,
               m_contador_general,
               m_coordinador_financiero,
               dias_activacion,
               seguridad_integrada,
               url_seguridad
         into p_correo,
               p_cta_disp_s_banco,
               p_cta_disp_s_tipo_cta,
               p_cta_disp_s_cta,
               p_cta_disp_p_banco,
               p_cta_disp_p_tipo_cta,
               p_cta_disp_p_cta,
               p_iva,
               p_retencion_fuente,
               p_impuesto_timbre_tercero,
               p_impuesto_timbre_fcm,
               p_director_ejecutivo,
               p_director_nacional,
               p_contador_general,
               p_coordinador_financiero,
               p_nit_polca,
               p_nit_sevial,
               p_ctacon_puente,
               p_ctacon_fondo_cobertura,
               p_ctacon_polca,
               p_ctacon_fcm,
               p_ctacon_fcma,
               p_ctacon_ingreso,
               p_ctacon_impuestos,
               p_ctacon_puente_ext,
               p_reteiva,
               p_timbre_contravencional,
               p_cta_disp_pa_banco,
               p_cta_disp_pa_tipo_cta,
               p_cta_disp_pa_cta,
               p_m_director_ejecutivo,
               p_m_director_nacional,
               p_m_contador_general,
               p_m_coordinador_financiero,
               p_dias_activacion,
               p_integrado,
               p_url
          from fcm
         where nit_fcm = p_nit_fcm;

        p_error := 'Consulta Exitosa';

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';

      END;

    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [q_fcm] ' || SQLERRM, p_error);
  END q_fcm;

  PROCEDURE i_fcm(p_nit_fcm                  char,
                  p_usuario                  varchar2,
                  p_correo                   varchar2,
                  p_cta_disp_s_banco         char,
                  p_cta_disp_s_tipo_cta      char,
                  p_cta_disp_s_cta           varchar2,
                  p_cta_disp_p_banco         char,
                  p_cta_disp_p_tipo_cta      char,
                  p_cta_disp_p_cta           varchar2,
                  p_iva                      number,
                  p_retencion_fuente         number,
                  p_impuesto_timbre_tercero  number,
                  p_impuesto_timbre_fcm      number,
                  p_director_ejecutivo       varchar,
                  p_director_nacional        varchar,
                  p_contador_general         varchar,
                  p_coordinador_financiero   varchar,
                  p_nit_polca                char,
                  p_nit_sevial               char,
                  p_ctacon_puente            varchar,
                  p_ctacon_fondo_cobertura   varchar,
                  p_ctacon_polca             varchar,
                  p_ctacon_fcm               varchar,
                  p_ctacon_fcma              varchar,
                  p_ctacon_ingreso           varchar,
                  p_ctacon_impuestos         varchar,
                  p_ctacon_puente_ext        varchar,
                  p_reteiva                  number,
                  p_timbre_contravencional   number,
                  p_cta_disp_pa_banco        varchar2,
                  p_cta_disp_pa_tipo_cta     varchar2,
                  p_cta_disp_pa_cta          varchar2,
                  p_m_director_ejecutivo     varchar,
                  p_m_director_nacional      varchar,
                  p_m_contador_general       varchar,
                  p_m_coordinador_financiero varchar,
                  p_dias_activacion          number,
                  p_integrado                number,
                  p_url                      varchar2,
                  p_error                    OUT VARCHAR2) AS

    w_operacion varchar2(250);

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
  IF not P_ERROR is null THEN
       return;
    end if;

    select COUNT(*) INTO v_valida from fcm t where nit_fcm = p_nit_fcm;

    IF v_valida <> 0 THEN
      update fcm
         set correo                   = p_correo,
             cta_disp_s_banco         = p_cta_disp_s_banco,
             cta_disp_s_tipo_cta      = p_cta_disp_s_tipo_cta,
             cta_disp_s_cta           = p_cta_disp_s_cta,
             cta_disp_p_banco         = p_cta_disp_p_banco,
             cta_disp_p_tipo_cta      = p_cta_disp_p_tipo_cta,
             cta_disp_p_cta           = p_cta_disp_p_cta,
             iva                      = p_iva,
             retencion_fuente         = p_retencion_fuente,
             impuesto_timbre_tercero  = p_impuesto_timbre_tercero,
             impuesto_timbre_fcm      = p_impuesto_timbre_fcm,
             director_ejecutivo       = p_director_ejecutivo,
             m_director_ejecutivo     = p_m_director_ejecutivo,
             director_nacional        = p_director_nacional,
             m_director_nacional      = p_m_director_nacional,
             contador_general         = p_contador_general,
             m_contador_general       = p_m_contador_general,
             coordinador_financiero   = p_coordinador_financiero,
             m_coordinador_financiero = p_m_coordinador_financiero,
             nit_polca                = p_nit_polca,
             nit_sevial               = p_nit_sevial,
             ctacon_puente            = p_ctacon_puente,
             ctacon_fondo_cobertura   = p_ctacon_fondo_cobertura,
             ctacon_polca             = p_ctacon_polca,
             ctacon_fcm               = p_ctacon_fcm,
             ctacon_fcma              = p_ctacon_fcma,
             ctacon_ingreso           = p_ctacon_ingreso,
             ctacon_impuestos         = p_ctacon_impuestos,
             ctacon_puente_ext        = p_ctacon_puente_ext,
             reteiva                  = p_reteiva,
             timbre_contravencional   = p_timbre_contravencional,
             cta_disp_pa_banco        = p_cta_disp_pa_banco,
             cta_disp_pa_tipo_cta     = p_cta_disp_pa_tipo_cta,
             cta_disp_pa_cta          = p_cta_disp_pa_cta,
             dias_activacion          = p_dias_activacion,
             seguridad_integrada      = p_integrado,
             url_seguridad            = p_url

       where nit_fcm = p_nit_fcm;

      w_operacion := 'u_fcm';
      p_error     := 'FCM Actualizado Exitosamente. ';

    END IF;

    IF v_valida = 0 THEN
      insert into fcm
        (nit_fcm,
         correo,
         cta_disp_s_banco,
         cta_disp_s_tipo_cta,
         cta_disp_s_cta,
         cta_disp_p_banco,
         cta_disp_p_tipo_cta,
         cta_disp_p_cta,
         iva,
         retencion_fuente,
         impuesto_timbre_tercero,
         impuesto_timbre_fcm,
         director_ejecutivo,
         director_nacional,
         contador_general,
         coordinador_financiero,
         nit_polca,
         nit_sevial,
         ctacon_puente,
         ctacon_fondo_cobertura,
         ctacon_polca,
         ctacon_fcm,
         ctacon_fcma,
         ctacon_ingreso,
         ctacon_impuestos,
         ctacon_puente_ext,
         reteiva,
         timbre_contravencional,
         cta_disp_pa_banco,
         cta_disp_pa_tipo_cta,
         cta_disp_pa_cta,
         m_director_ejecutivo,
         m_director_nacional,
         m_contador_general,
         m_coordinador_financiero,
         dias_activacion,
         seguridad_integrada,
         url_seguridad
         )
      values
        (p_nit_fcm,
         p_correo,
         p_cta_disp_s_banco,
         p_cta_disp_s_tipo_cta,
         p_cta_disp_s_cta,
         p_cta_disp_p_banco,
         p_cta_disp_p_tipo_cta,
         p_cta_disp_p_cta,
         p_iva,
         p_retencion_fuente,
         p_impuesto_timbre_tercero,
         p_impuesto_timbre_fcm,
         p_director_ejecutivo,
         p_director_nacional,
         p_contador_general,
         p_coordinador_financiero,
         p_nit_polca,
         p_nit_sevial,
         p_ctacon_puente,
         p_ctacon_fondo_cobertura,
         p_ctacon_polca,
         p_ctacon_fcm,
         p_ctacon_fcma,
         p_ctacon_ingreso,
         p_ctacon_impuestos,
         p_ctacon_puente_ext,
         p_reteiva,
         p_timbre_contravencional,
         p_cta_disp_pa_banco,
         p_cta_disp_pa_tipo_cta,
         p_cta_disp_pa_cta,
         p_m_director_ejecutivo,
         p_m_director_nacional,
         p_m_contador_general,
         p_m_coordinador_financiero,
         p_dias_activacion,
         p_integrado,
         p_url
         );

      w_operacion := 'i_fcm';
      p_error     := 'FCM Agregado Exitosamente. ';

    END IF;

    sp_log(p_usuario,
           w_operacion,
           p_nit_fcm || '-' || p_nit_fcm || '-' || p_correo || '-' ||
           p_cta_disp_s_banco || '-' || p_cta_disp_s_tipo_cta || '-' ||
           p_cta_disp_s_cta || '-' || p_cta_disp_p_banco || '-' ||
           p_cta_disp_p_tipo_cta || '-' || p_cta_disp_p_cta || '-' || p_iva || '-' ||
           p_retencion_fuente || '-' || p_impuesto_timbre_tercero || '-' ||
           p_impuesto_timbre_fcm || '-' || p_director_ejecutivo || '-' ||
           p_director_nacional || '-' || p_contador_general || '-' ||
           p_coordinador_financiero || '-' || p_nit_polca || '-' ||
           p_nit_sevial || p_integrado || p_url);
    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [i_fcm] ' || SQLERRM, p_error);

  END i_fcm;

  PROCEDURE d_cta_recaudo_fcm(p_nit_fcm char,
                              p_idbanco varchar2,
                              p_indtipo varchar2,
                              p_usuario varchar2,
                              p_error   OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      delete cta_recaudo_fcm
       where nit_fcm = p_nit_fcm
         and idbanco = p_idbanco
         and indtipo = p_indtipo;

      sp_log(p_usuario,
             'd_cta_recaudo_fcm',
             p_nit_fcm || '-' || p_idbanco || '-' || p_indtipo);
      commit;
      p_error := 'Cuenta eliminada Exitosamente. ';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [d_cta_recaudo_fcm] ' || SQLERRM,
            p_error);
  END d_cta_recaudo_fcm;

  PROCEDURE q_cta_recaudo_fcm(p_nit_fcm          char,
                              p_idbanco          varchar2,
                              p_indtipo          varchar2,
                              p_usuario          varchar2,
                              p_tipocuenta       out varchar2,
                              p_cuenta           out varchar2,
                              p_comision_recaudo out number,
                              p_comision_ach     out number,
                              p_cta_contable     out varchar2,
                              p_error            OUT VARCHAR2) is
  BEGIN

    -- INICIALIZAR SALIDA
    p_tipocuenta       := '000';
    p_cuenta           := null;
    p_comision_recaudo := 0;
    p_comision_ach     := 0;
    p_cta_contable     := null;

    -- VALIDACIONES
    --sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select tipocuenta,
               cuenta,
               comision_recaudo,
               comision_ach,
               cta_contable
          into p_tipocuenta,
               p_cuenta,
               p_comision_recaudo,
               p_comision_ach,
               p_cta_contable
          from cta_recaudo_fcm
         where nit_fcm = p_nit_fcm
           and idbanco = p_idbanco
           and indtipo = p_indtipo;

        p_error := 'Consulta Exitosa';

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';

      END;

    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [q_cta_recaudo_fcm] ' || SQLERRM,
            p_error);
  END q_cta_recaudo_fcm;

  PROCEDURE i_cta_recaudo_fcm(p_nit_fcm          char,
                              p_idbanco          varchar2,
                              p_indtipo          varchar2,
                              p_tipocuenta       varchar2,
                              p_cuenta           varchar2,
                              p_comision_recaudo number,
                              p_comision_ach     number,
                              p_cta_contable     varchar2,
                              p_usuario          varchar2,
                              p_error            OUT VARCHAR2) AS

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
  IF not P_ERROR is null THEN
       return;
    end if;

    select COUNT(*)
      INTO v_valida
      from cta_recaudo_fcm t
     where nit_fcm = p_nit_fcm
       and idbanco = p_idbanco
       and indtipo = p_indtipo;

    IF v_valida <> 0 THEN
      p_error := 'Cuenta Recaudo ya existente';
    else
      insert into cta_recaudo_fcm
        (nit_fcm,
         idbanco,
         indtipo,
         tipocuenta,
         cuenta,
         comision_recaudo,
         comision_ach,
         cta_contable)
      values
        (p_nit_fcm,
         p_idbanco,
         p_indtipo,
         p_tipocuenta,
         p_cuenta,
         p_comision_recaudo,
         p_comision_ach,
         p_cta_contable);

      p_error := MSG_INS_OK;

      sp_log(p_usuario,
             'i_cta_recaudo_fcm',
             p_nit_fcm || '-' || p_idbanco || '-' || p_indtipo || '-' ||
             p_tipocuenta || '-' || p_cuenta || '-' || p_comision_recaudo || '-' ||
             p_comision_ach || '-' || p_cta_contable);
      commit;

    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [i_cta_recuado_fcm] ' || SQLERRM,
            p_error);

  END i_cta_recaudo_fcm;

  PROCEDURE u_cta_recaudo_fcm(p_nit_fcm          char,
                              p_idbanco          varchar2,
                              p_indtipo          varchar2,
                              p_tipocuenta       varchar2,
                              p_cuenta           varchar2,
                              p_comision_recaudo number,
                              p_comision_ach     number,
                              p_cta_contable     varchar2,
                              p_usuario          varchar2,
                              p_error            OUT VARCHAR2) AS

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
  IF not P_ERROR is null THEN
       return;
    end if;

    select COUNT(*)
      INTO v_valida
      from cta_recaudo_fcm t
     where nit_fcm = p_nit_fcm
       and idbanco = p_idbanco
       and indtipo = p_indtipo;

    IF v_valida <> 0 THEN
      update cta_recaudo_fcm
         set idbanco          = p_idbanco,
             indtipo          = p_indtipo,
             tipocuenta       = p_tipocuenta,
             cuenta           = p_cuenta,
             comision_recaudo = p_comision_recaudo,
             comision_ach     = p_comision_ach,
             cta_contable     = p_cta_contable
       where nit_fcm = p_nit_fcm
         and idbanco = p_idbanco
         and indtipo = p_indtipo;

      sp_log(p_usuario,
             'u_cta_recaudo_fcm',
             p_nit_fcm || '-' || p_idbanco || '-' || p_indtipo || '-' ||
             p_tipocuenta || '-' || p_cuenta || '-' || p_comision_recaudo || '-' ||
             p_comision_ach || '-' || p_cta_contable);
      commit;
      p_error := MSG_UPD_OK;
    else
      p_error := 'Cuenta Recaudo Local no existe';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [u_cta_recuado_fcm] ' || SQLERRM,
            p_error);
  END u_cta_recaudo_fcm;

  PROCEDURE i_municipio(p_idmunicipio              varchar2,
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
                        p_error                    OUT VARCHAR2

                        ) AS

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
      IF not P_ERROR is null THEN
       return;
    end if;

    select count(*)
      INTO v_valida
      from departamento t
     where iddepartamento = substr(p_idmunicipio, 1, 2);

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
      insert into municipio
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
         iddepartamento)
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
         substr(p_idmunicipio, 1, 2));

      p_error := MSG_INS_OK;

      commit;
    END IF;

    select COUNT(*)
      INTO v_valida
      from p_dispersion_municipio t
     where idmunicipio = p_idmunicipio;

    IF v_valida <> 0 THEN
      p_error := 'municipio ya existente';
    else
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
        (p_idmunicipio,
         p_municipio_s,
         p_fcm_contravencional_s,
         p_conces_contravencional_s,
         p_acuerdopago_s,
         p_municipio_p,
         p_fcm_contravencional_p,
         p_conces_contravencional_p,
         p_acuerdopago_p);

      sp_log(p_usuario,
             'i_municipio',
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

    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [i_municipio] ' || SQLERRM, p_error);

  END i_municipio;











  PROCEDURE q_municipio(p_idmunicipio              varchar2,
                        p_usuario                  varchar2,
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
                        p_error                    OUT VARCHAR2) is
  BEGIN

    -- INICIALIZAR SALIDA
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

    -- VALIDACIONES
    --sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select nit_m,
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
               indAcuerdoPago_2002
          into p_nit_m,
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
               p_indacuerdopago_2002

          from municipio
         where idmunicipio = p_idmunicipio;

        p_error := 'Consulta Exitosa';

        select count(*)
          into v_valida
          from p_dispersion_municipio
         where idmunicipio = p_idmunicipio;

        if v_valida = 0 then
          return;
        end if;

        select municipio_s,
               fcm_contravencional_s,
               conces_contravencional_s,
               acuerdopago_s,
               municipio_p,
               fcm_contravencional_p,
               conces_contravencional_p,
               acuerdopago_p
          into p_municipio_s,
               p_fcm_contravencional_s,
               p_conces_contravencional_s,
               p_acuerdopago_s,
               p_municipio_p,
               p_fcm_contravencional_p,
               p_conces_contravencional_p,
               p_acuerdopago_p

          from p_dispersion_municipio
         where idmunicipio = p_idmunicipio;

        sp_log(p_usuario,
               'q_municipio',
               p_idmunicipio || '-' || p_nit_m || '-' || p_nombre || '-' ||
               p_idconcesionario || '-' || p_correo || '-' ||
               p_indretroactividad || '-' || p_idbanco || '-' ||
               p_tipocuenta || '-' || p_cuenta || '-' || p_nit_cta || '-' ||
               p_indliq_s_ext || '-' || p_indliq_s_local || '-' ||
               p_indliq_p_ext || '-' || '-' || p_indAcuerdoPago_2002 || '-' ||
               p_indliq_p_local || '-' || p_municipio_s || '-' ||
               p_fcm_contravencional_s || '-' || p_conces_contravencional_s || '-' ||
               p_acuerdopago_s || '-' || p_municipio_p || '-' ||
               p_fcm_contravencional_p || '-' || p_conces_contravencional_p || '-' ||
               p_acuerdopago_p);

        commit;

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';

      END;

    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [q_municipio] ' || SQLERRM, p_error);
  END q_municipio;

  PROCEDURE i_dias_dispersion(

                              p_idmunicipio char,
                              p_idbanco     char,

                              p_dias_dispersion_se number,
                              p_dias_dispersion_sl number,
                              p_dias_dispersion_pe number,
                              p_dias_dispersion_pl number,

                              p_frec_dispersion_se number,
                              p_frec_dispersion_sl number,
                              p_frec_dispersion_pe number,
                              p_frec_dispersion_pl number,

                              p_usuario varchar2,
                              p_error   OUT VARCHAR2) AS

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
      IF not P_ERROR is null THEN
       return;
    end if;


    select COUNT(*)
      INTO v_valida
      from dias_dispersion t
     where idmunicipio = p_idmunicipio
       and idbanco = p_idbanco;

    IF v_valida <> 0 THEN
      p_error := 'Dias Dispersion Ya existe ';

    END IF;

    IF v_valida = 0 THEN
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
         p_frec_dispersion_pe

         );
      sp_log(p_usuario,
             'i_dias_dispersion',
             p_idmunicipio || '-' || p_idbanco || '-' ||
             p_dias_dispersion_sl || '-' || p_frec_dispersion_sl || '-' ||
             p_dias_dispersion_pl || '-' || p_frec_dispersion_pl || '-' ||
             p_dias_dispersion_se || '-' || p_frec_dispersion_se || '-' ||
             p_dias_dispersion_pe || '-' || p_frec_dispersion_pe);
      commit;

      p_error := MSG_INS_OK;

    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [i_dias_dispersion] ' || SQLERRM,
            p_error);

  END i_dias_dispersion;







  PROCEDURE u_dias_dispersion(

                              p_idmunicipio char,
                              p_idbanco     char,

                              p_dias_dispersion_se number,
                              p_dias_dispersion_sl number,
                              p_dias_dispersion_pe number,
                              p_dias_dispersion_pl number,

                              p_frec_dispersion_se number,
                              p_frec_dispersion_sl number,
                              p_frec_dispersion_pe number,
                              p_frec_dispersion_pl number,

                              p_usuario varchar2,
                              p_error   OUT VARCHAR2) AS

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
  IF not P_ERROR is null THEN
       return;
    end if;

    select COUNT(*)
      INTO v_valida
      from dias_dispersion t
     where idmunicipio = p_idmunicipio
       and idbanco = p_idbanco;

    IF v_valida <> 0 THEN
      update dias_dispersion
         set dias_dispersion_se = p_dias_dispersion_se,
             dias_dispersion_sl = p_dias_dispersion_sl,
             dias_dispersion_pe = p_dias_dispersion_pe,
             dias_dispersion_pl = p_dias_dispersion_pl,

             frec_dispersion_se = p_frec_dispersion_se,
             frec_dispersion_sl = p_frec_dispersion_sl,
             frec_dispersion_pe = p_frec_dispersion_pe,
             frec_dispersion_pl = p_frec_dispersion_pl
       where idmunicipio = p_idmunicipio
         and idbanco = p_idbanco;

      sp_log(p_usuario,
             'u_dias_dispersion',
             p_idmunicipio || '-' || p_idbanco || '-' ||
             p_dias_dispersion_sl || '-' || p_frec_dispersion_sl || '-' ||
             p_dias_dispersion_pl || '-' || p_frec_dispersion_pl || '-' ||
             p_dias_dispersion_se || '-' || p_frec_dispersion_se || '-' ||
             p_dias_dispersion_pe || '-' || p_frec_dispersion_pe);

      commit;

      p_error := MSG_UPD_OK;

    END IF;

    IF v_valida = 0 THEN
      p_error := 'Registro dias dispersion no existe';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [u_dias_dispersion] ' || SQLERRM,
            p_error);

  END u_dias_dispersion;

  PROCEDURE d_dias_dispersion(p_idmunicipio char,
                              p_idbanco     char,
                              p_usuario     varchar2,
                              p_error       OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      delete dias_dispersion
       where idmunicipio = p_idmunicipio
         and idbanco = p_idbanco;
      sp_log(p_usuario,
             'd_dias_dispersion',
             p_idmunicipio || '-' || p_idbanco);
      commit;
      p_error := MSG_DEL_OK;
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [d_dias_dispersion] ' || SQLERRM,
            p_error);

  END d_dias_dispersion;

  PROCEDURE q_dias_dispersion(p_idmunicipio        char,
                              p_idbanco            char,
                              p_usuario            varchar2,
                              p_dias_dispersion_se out number,
                              p_dias_dispersion_sl out number,
                              p_dias_dispersion_pe out number,
                              p_dias_dispersion_pl out number,

                              p_frec_dispersion_se out number,
                              p_frec_dispersion_sl out number,
                              p_frec_dispersion_pe out number,
                              p_frec_dispersion_pl out number,

                              p_error OUT VARCHAR2) is
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

    -- VALIDACIONES
    -- sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select dias_dispersion_sl,
               frec_dispersion_sl,
               dias_dispersion_pl,
               frec_dispersion_pl,
               dias_dispersion_se,
               frec_dispersion_se,
               dias_dispersion_pe,
               frec_dispersion_pe

          into p_dias_dispersion_sl,
               p_frec_dispersion_sl,
               p_dias_dispersion_pl,
               p_frec_dispersion_pl,
               p_dias_dispersion_se,
               p_frec_dispersion_se,
               p_dias_dispersion_pe,
               p_frec_dispersion_pe

          from dias_dispersion
         where idmunicipio = p_idmunicipio
           and idbanco = p_idbanco;

        p_error := 'Consulta Exitosa';

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';

      END;

    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [q_dias_dispersion] ' || SQLERRM,
            p_error);
  END q_dias_dispersion;




  PROCEDURE i_tercero(

                      p_idmunicipio   char,
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
                      p_error         OUT VARCHAR2) AS

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
      IF not P_ERROR is null THEN
       return;
    end if;


    select COUNT(*)
      INTO v_valida
      from tercero t
     where idmunicipio = p_idmunicipio
       and num_tercero = p_num_tercero;

    IF v_valida <> 0 THEN
      p_error := 'Numero Tercero ya existe';

    END IF;

    select COUNT(*)
      INTO v_valida
      from tercero t
     where idmunicipio = p_idmunicipio
       and nit_t = p_nit_t;

    IF v_valida <> 0 THEN
      p_error := 'Nit Tercero ya existe';
    END IF;

    IF v_valida = 0 THEN
      insert into tercero
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
         num_tercero)
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
         p_num_tercero);

      sp_log(p_usuario,
             'i_tercero',
             p_idmunicipio || '-' || p_nit_t || '-' || p_nombre || '-' ||
             p_idbanco || '-' || p_tipocuenta || '-' || p_cuenta || '-' ||
             p_base_s || '-' || p_base_p || '-' || p_ind_base || '-' ||
             p_num_tercero);
      commit;

      p_error := MSG_INS_OK;

    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [i_tercero] ' || SQLERRM, p_error);

  END i_tercero;




























  PROCEDURE u_tercero(

                      p_idmunicipio   char,
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
                      p_error         OUT VARCHAR2) AS

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
  IF not P_ERROR is null THEN
       return;
    end if;

    select COUNT(*)
      INTO v_valida
      from tercero t
     where idmunicipio = p_idmunicipio
       and num_tercero = p_num_tercero;

    IF v_valida <> 0 THEN
      update tercero
         set nombre        = p_nombre,
             correoTercero = p_correoTercero,
             idbanco       = p_idbanco,
             tipocuenta    = p_tipocuenta,
             cuenta        = encriptar(p_cuenta),
             base_s        = p_base_s,
             base_p        = p_base_p,
             ind_base      = p_ind_base,
             nit_t         = p_nit_t
       where idmunicipio = p_idmunicipio
         and num_tercero = p_num_tercero;

      sp_log(p_usuario,
             'u_tercero',
             p_idmunicipio || '-' || p_nit_t || '-' || p_nombre || '-' ||
             p_idbanco || '-' || p_tipocuenta || '-' || p_cuenta || '-' ||
             p_base_s || '-' || p_base_p || '-' || p_ind_base || '-' ||
             p_num_tercero);
      commit;

      p_error := MSG_UPD_OK;

    END IF;

    IF v_valida = 0 THEN

      p_error := 'Tercero No existe';

    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [u_tercero] ' || SQLERRM, p_error);

  END u_tercero;

  PROCEDURE q_tercero(p_idmunicipio   char,
                      p_nit_t         out varchar2,
                      p_usuario       varchar2,
                      p_nombre        out varchar2,
                      p_correoTercero out varchar2,
                      p_idbanco       out varchar2,
                      p_tipocuenta    out varchar2,
                      p_cuenta        out varchar2,
                      p_base_s        out number,
                      p_base_p        out number,
                      p_ind_base      out number,
                      p_num_tercero   number,
                      p_error         OUT VARCHAR2

                      ) is
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

    -- VALIDACIONES
    --sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select nombre,
               correoTercero,
               idbanco,
               tipocuenta,
               desencriptar(cuenta),
               base_s,
               base_p,
               ind_base,
               nit_t

          into p_nombre,
               p_correoTercero,
               p_idbanco,
               p_tipocuenta,
               p_cuenta,
               p_base_s,
               p_base_p,
               p_ind_base,
               p_nit_t

          from tercero
         where idmunicipio = p_idmunicipio
           and num_tercero = p_num_tercero;

        p_error := 'Consulta Exitosa';

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';

      END;

    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [q_tercero] ' || SQLERRM, p_error);

  END q_tercero;

  PROCEDURE i_concesionario(p_idconcesionario           char,
                            p_nit_c                     varchar2,
                            p_nombre                    varchar2,
                            p_correo                    varchar2,
                            p_concesionario_s           number,
                            p_fondo_cob_concesionario_s number,
                            p_fondo_cob_simit_s         number,
                            p_simit_s                   number,
                            p_equilibrio_economico_s    number,

                            p_concesionario_pm           number,
                            p_fondo_cob_concesionario_pm number,
                            p_fondo_cob_simit_pm         number,
                            p_simit_pm                   number,
                            p_equilibrio_economico_pm    number,

                            p_simit_pp                number,
                            p_sevial_pp               number,
                            p_equilibrio_economico_pp number,

                            p_polca_cp                number,
                            p_fcm_cp                  number,
                            p_sevial_cp               number,
                            p_equilibrio_economico_cp number,

                            p_ccLocalConS varchar2,
                            p_ccLocalSimS varchar2,
                            p_ccLocalFonS varchar2,
                            p_ccLocalCobS varchar2,
                            p_ccLocalEquS varchar2,

                            p_ccExtConS varchar2,
                            p_ccExtSimS varchar2,
                            p_ccExtFonS varchar2,
                            p_ccExtCobS varchar2,
                            p_ccExtEquS varchar2,

                            p_ccLocalConP varchar2,
                            p_ccLocalSimP varchar2,
                            p_ccLocalFonP varchar2,
                            p_ccLocalCobP varchar2,
                            p_ccLocalEquP varchar2,

                            p_ccExtConP varchar2,
                            p_ccExtSimP varchar2,
                            p_ccExtFonP varchar2,
                            p_ccExtCobP varchar2,
                            p_ccExtEquP varchar2,

                            p_ccLocalSimPP varchar2,
                            p_ccLocalSevPP varchar2,
                            p_ccLocalEquPP varchar2,

                            p_ccExtSimPP varchar2,
                            p_ccExtSevPP varchar2,
                            p_ccExtEquPP varchar2,

                            p_ccLocalSimCP varchar2,
                            p_ccLocalFcmCP varchar2,
                            p_ccLocalSevCP varchar2,
                            p_ccLocalEquCP varchar2,

                            p_ccExtSimCP varchar2,
                            p_ccExtFcmCP varchar2,
                            p_ccExtSevCP varchar2,
                            p_ccExtEquCP varchar2,

                            p_usuario varchar2,
                            p_error   OUT VARCHAR2) AS

    w_operacion varchar2(250);

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
  IF not P_ERROR is null THEN
       return;
    end if;

    select COUNT(*)
      INTO v_valida
      from concesionario t
     where idconcesionario = p_idconcesionario;

    IF v_valida <> 0 THEN
      p_error := 'Concesionario ya existe. ';
      return;
    END IF;

    IF v_valida = 0 THEN
      insert into concesionario
        (idconcesionario, nit_c, nombre, correo)
      values
        (p_idconcesionario, p_nit_c, p_nombre, p_correo);

      w_operacion := 'i_concesionario';
      p_error     := MSG_INS_OK;

    END IF;

    select COUNT(*)
      INTO v_valida
      from p_dispersion_concesionario t
     where idconcesionario = p_idconcesionario;

    IF v_valida <> 0 THEN
      update p_dispersion_concesionario
         set concesionario_s           = p_concesionario_s,
             fondo_cob_concesionario_s = p_fondo_cob_concesionario_s,
             fondo_cob_simit_s         = p_fondo_cob_simit_s,
             simit_s                   = p_simit_s,
             equilibrio_economico_s    = p_equilibrio_economico_s,

             concesionario_pm           = p_concesionario_pm,
             fondo_cob_concesionario_pm = p_fondo_cob_concesionario_pm,
             fondo_cob_simit_pm         = p_fondo_cob_simit_pm,
             simit_pm                   = p_simit_pm,
             equilibrio_economico_pm    = p_equilibrio_economico_pm,

             simit_pp                = p_simit_pp,
             sevial_pp               = p_sevial_pp,
             equilibrio_economico_pp = p_equilibrio_economico_pp,

             polca_cp                = p_polca_cp,
             fcm_cp                  = p_fcm_cp,
             sevial_cp               = p_sevial_cp,
             equilibrio_economico_cp = p_equilibrio_economico_cp,

             concesionario_s_cc           = p_ccLocalConS,
             fondo_cob_concesionario_s_cc = p_ccLocalFonS,
             fondo_cob_simit_s_cc         = p_ccLocalCobS,
             simit_s_cc                   = p_ccLocalSimS,
             equilibrio_economico_s_cc    = p_ccLocalEquS,

             concesionario_pm_cc           = p_ccLocalConP,
             fondo_cob_concesionario_pm_cc = p_ccLocalFonP,
             fondo_cob_simit_pm_cc         = p_ccLocalCobP,
             simit_pm_cc                   = p_ccLocalSimP,
             equilibrio_economico_pm_cc    = p_ccLocalEquP,

             simit_pp_cc                = p_ccLocalSimPP,
             sevial_pp_cc               = p_ccLocalSevPP,
             equilibrio_economico_pp_cc = p_ccLocalEquPP,

             polca_cp_cc                = p_ccLocalSimCP,
             fcm_cp_cc                  = p_ccLocalFcmCP,
             sevial_cp_cc               = p_ccLocalSevCP,
             equilibrio_economico_cp_cc = p_ccLocalEquCP,

             CONCESIONARIO_S_CC_EXT = p_ccExtConS,
             FONCOB_CONCES_S_CC_EXT = p_ccExtFonS,
             FONCOB_SIMIT_S_CC_EXT  = p_ccExtCobS,
             SIMIT_S_CC_EXT         = p_ccExtSimS,
             EQUIL_ECON_S_CC_EXT    = p_ccExtEquS,

             CONCESIONARIO_PM_CC_EXT = p_ccExtConP,
             FONCOB_CONCES_PM_CC_EXT = p_ccExtFonP,
             FONCOB_SIMIT_PM_CC_EXT  = p_ccExtCobP,
             SIMIT_PM_CC_EXT         = p_ccExtSimP,
             EQUIL_ECON_PM_CC_EXT    = p_ccExtEquP,

             SIMIT_PP_CC_EXT      = p_ccExtSimPP,
             SEVIAL_PP_CC_EXT     = p_ccExtSevPP,
             EQUIL_ECON_PP_CC_EXT = p_ccExtEquPP,

             POLCA_CP_CC_EXT      = p_ccExtSimCP,
             FCM_CP_CC_EXT        = p_ccExtFcmCP,
             SEVIAL_CP_CC_EXT     = p_ccExtSevCP,
             EQUIL_ECON_CP_CC_EXT = p_ccExtEquCP

       where idconcesionario = p_idconcesionario;

    END IF;

    IF v_valida = 0 THEN
      insert into p_dispersion_concesionario
        (idconcesionario,
         concesionario_s,
         fondo_cob_concesionario_s,
         fondo_cob_simit_s,
         simit_s,
         equilibrio_economico_s,

         concesionario_pm,
         fondo_cob_concesionario_pm,
         fondo_cob_simit_pm,
         simit_pm,
         equilibrio_economico_pm,

         simit_pp,
         sevial_pp,
         equilibrio_economico_pp,

         polca_cp,
         fcm_cp,
         sevial_cp,
         equilibrio_economico_cp,

         concesionario_s_cc,
         fondo_cob_concesionario_s_cc,
         fondo_cob_simit_s_cc,
         simit_s_cc,
         equilibrio_economico_s_cc,

         concesionario_pm_cc,
         fondo_cob_concesionario_pm_cc,
         fondo_cob_simit_pm_cc,
         simit_pm_cc,
         equilibrio_economico_pm_cc,

         simit_pp_cc,
         sevial_pp_cc,
         equilibrio_economico_pp_cc,

         polca_cp_cc,
         fcm_cp_cc,
         sevial_cp_cc,
         equilibrio_economico_cp_cc,

         CONCESIONARIO_S_CC_EXT,
         FONCOB_CONCES_S_CC_EXT,
         FONCOB_SIMIT_S_CC_EXT,
         SIMIT_S_CC_EXT,
         EQUIL_ECON_S_CC_EXT,

         CONCESIONARIO_PM_CC_EXT,
         FONCOB_CONCES_PM_CC_EXT,
         FONCOB_SIMIT_PM_CC_EXT,
         SIMIT_PM_CC_EXT,
         EQUIL_ECON_PM_CC_EXT,

         SIMIT_PP_CC_EXT,
         SEVIAL_PP_CC_EXT,
         EQUIL_ECON_PP_CC_EXT,

         POLCA_CP_CC_EXT,
         FCM_CP_CC_EXT,
         SEVIAL_CP_CC_EXT,
         EQUIL_ECON_CP_CC_EXT

         )
      values
        (p_idconcesionario,
         p_concesionario_s,
         p_fondo_cob_concesionario_s,
         p_fondo_cob_simit_s,
         p_simit_s,
         p_equilibrio_economico_s,

         p_concesionario_pm,
         p_fondo_cob_concesionario_pm,
         p_fondo_cob_simit_pm,
         p_simit_pm,
         p_equilibrio_economico_pm,

         p_simit_pp,
         p_sevial_pp,
         p_equilibrio_economico_pp,

         p_polca_cp,
         p_fcm_cp,
         p_sevial_cp,
         p_equilibrio_economico_cp,

         p_ccLocalConS,
         p_ccLocalFonS,
         p_ccLocalCobS,
         p_ccLocalSimS,
         p_ccLocalEquS,

         p_ccLocalConP,
         p_ccLocalFonP,
         p_ccLocalCobP,
         p_ccLocalSimP,
         p_ccLocalEquP,

         p_ccLocalSimPP,
         p_ccLocalSevPP,
         p_ccLocalEquPP,

         p_ccLocalSimCP,
         p_ccLocalFcmCP,
         p_ccLocalSevCP,
         p_ccLocalEquCP,

         p_ccExtConS,
         p_ccExtFonS,
         p_ccExtCobS,
         p_ccExtSimS,
         p_ccExtEquS,

         p_ccExtConP,
         p_ccExtFonP,
         p_ccExtCobP,
         p_ccExtSimP,
         p_ccExtEquP,

         p_ccExtSimPP,
         p_ccExtSevPP,
         p_ccExtEquPP,

         p_ccExtSimCP,
         p_ccExtFcmCP,
         p_ccExtSevCP,
         p_ccExtEquCP

         );

    END IF;

    sp_log(p_usuario,
           w_operacion,
           p_idconcesionario || '-' || p_nit_c || '-' || p_nombre || '-' ||
           p_correo || '-' || p_concesionario_s || '-' ||
           p_fondo_cob_concesionario_s || '-' || p_fondo_cob_simit_s || '-' ||
           p_simit_s || '-' || p_equilibrio_economico_s || '-' ||

           p_concesionario_pm || '-' || p_fondo_cob_concesionario_pm || '-' ||
           p_fondo_cob_simit_pm || '-' || p_simit_pm || '-' ||
           p_equilibrio_economico_pm || '-' ||

           p_simit_pp || '-' || p_sevial_pp || '-' ||
           p_equilibrio_economico_pp || '-' ||

           p_polca_cp || '-' || p_fcm_cp || '-' || p_sevial_cp || '-' ||
           p_equilibrio_economico_cp

           );
    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [i_concesionario] ' || SQLERRM,
            p_error);

  END i_concesionario;

  PROCEDURE u_concesionario(p_idconcesionario           char,
                            p_nit_c                     varchar2,
                            p_nombre                    varchar2,
                            p_correo                    varchar2,
                            p_concesionario_s           number,
                            p_fondo_cob_concesionario_s number,
                            p_fondo_cob_simit_s         number,
                            p_simit_s                   number,
                            p_equilibrio_economico_s    number,

                            p_concesionario_pm           number,
                            p_fondo_cob_concesionario_pm number,
                            p_fondo_cob_simit_pm         number,
                            p_simit_pm                   number,
                            p_equilibrio_economico_pm    number,

                            p_simit_pp                number,
                            p_sevial_pp               number,
                            p_equilibrio_economico_pp number,

                            p_polca_cp                number,
                            p_fcm_cp                  number,
                            p_sevial_cp               number,
                            p_equilibrio_economico_cp number,

                            p_ccLocalConS varchar2,
                            p_ccLocalSimS varchar2,
                            p_ccLocalFonS varchar2,
                            p_ccLocalCobS varchar2,
                            p_ccLocalEquS varchar2,

                            p_ccExtConS varchar2,
                            p_ccExtSimS varchar2,
                            p_ccExtFonS varchar2,
                            p_ccExtCobS varchar2,
                            p_ccExtEquS varchar2,

                            p_ccLocalConP varchar2,
                            p_ccLocalSimP varchar2,
                            p_ccLocalFonP varchar2,
                            p_ccLocalCobP varchar2,
                            p_ccLocalEquP varchar2,

                            p_ccExtConP varchar2,
                            p_ccExtSimP varchar2,
                            p_ccExtFonP varchar2,
                            p_ccExtCobP varchar2,
                            p_ccExtEquP varchar2,

                            p_ccLocalSimPP varchar2,
                            p_ccLocalSevPP varchar2,
                            p_ccLocalEquPP varchar2,

                            p_ccExtSimPP varchar2,
                            p_ccExtSevPP varchar2,
                            p_ccExtEquPP varchar2,

                            p_ccLocalSimCP varchar2,
                            p_ccLocalFcmCP varchar2,
                            p_ccLocalSevCP varchar2,
                            p_ccLocalEquCP varchar2,

                            p_ccExtSimCP varchar2,
                            p_ccExtFcmCP varchar2,
                            p_ccExtSevCP varchar2,
                            p_ccExtEquCP varchar2,

                            p_usuario varchar2,
                            p_error   OUT VARCHAR2) AS

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
  IF not P_ERROR is null THEN
       return;
    end if;

    select COUNT(*)
      INTO v_valida
      from concesionario t
     where idconcesionario = p_idconcesionario;

    IF v_valida <> 0 THEN
      update concesionario
         set nit_c = p_nit_c, nombre = p_nombre, correo = p_correo
       where idconcesionario = p_idconcesionario;

      p_error := MSG_UPD_OK;

    END IF;

    IF v_valida = 0 THEN
      p_error := 'Concesionario No existe. ';
      return;
    END IF;

    select COUNT(*)
      INTO v_valida
      from p_dispersion_concesionario t
     where idconcesionario = p_idconcesionario;

    IF v_valida <> 0 THEN
      update p_dispersion_concesionario
         set concesionario_s           = p_concesionario_s,
             fondo_cob_concesionario_s = p_fondo_cob_concesionario_s,
             fondo_cob_simit_s         = p_fondo_cob_simit_s,
             simit_s                   = p_simit_s,
             equilibrio_economico_s    = p_equilibrio_economico_s,

             concesionario_pm           = p_concesionario_pm,
             fondo_cob_concesionario_pm = p_fondo_cob_concesionario_pm,
             fondo_cob_simit_pm         = p_fondo_cob_simit_pm,
             simit_pm                   = p_simit_pm,
             equilibrio_economico_pm    = p_equilibrio_economico_pm,

             simit_pp                = p_simit_pp,
             sevial_pp               = p_sevial_pp,
             equilibrio_economico_pp = p_equilibrio_economico_pp,

             polca_cp                = p_polca_cp,
             fcm_cp                  = p_fcm_cp,
             sevial_cp               = p_sevial_cp,
             equilibrio_economico_cp = p_equilibrio_economico_cp,

             concesionario_s_cc           = p_ccLocalConS,
             fondo_cob_concesionario_s_cc = p_ccLocalFonS,
             fondo_cob_simit_s_cc         = p_ccLocalCobS,
             simit_s_cc                   = p_ccLocalSimS,
             equilibrio_economico_s_cc    = p_ccLocalEquS,

             concesionario_pm_cc           = p_ccLocalConP,
             fondo_cob_concesionario_pm_cc = p_ccLocalFonP,
             fondo_cob_simit_pm_cc         = p_ccLocalCobP,
             simit_pm_cc                   = p_ccLocalSimP,
             equilibrio_economico_pm_cc    = p_ccLocalEquP,

             simit_pp_cc                = p_ccLocalSimPP,
             sevial_pp_cc               = p_ccLocalSevPP,
             equilibrio_economico_pp_cc = p_ccLocalEquPP,

             polca_cp_cc                = p_ccLocalSimCP,
             fcm_cp_cc                  = p_ccLocalFcmCP,
             sevial_cp_cc               = p_ccLocalSevCP,
             equilibrio_economico_cp_cc = p_ccLocalEquCP,

             CONCESIONARIO_S_CC_EXT = p_ccExtConS,
             FONCOB_CONCES_S_CC_EXT = p_ccExtFonS,
             FONCOB_SIMIT_S_CC_EXT  = p_ccExtCobS,
             SIMIT_S_CC_EXT         = p_ccExtSimS,
             EQUIL_ECON_S_CC_EXT    = p_ccExtEquS,

             CONCESIONARIO_PM_CC_EXT = p_ccExtConP,
             FONCOB_CONCES_PM_CC_EXT = p_ccExtFonP,
             FONCOB_SIMIT_PM_CC_EXT  = p_ccExtCobP,
             SIMIT_PM_CC_EXT         = p_ccExtSimP,
             EQUIL_ECON_PM_CC_EXT    = p_ccExtEquP,

             SIMIT_PP_CC_EXT      = p_ccExtSimPP,
             SEVIAL_PP_CC_EXT     = p_ccExtSevPP,
             EQUIL_ECON_PP_CC_EXT = p_ccExtEquPP,

             POLCA_CP_CC_EXT      = p_ccExtSimCP,
             FCM_CP_CC_EXT        = p_ccExtFcmCP,
             SEVIAL_CP_CC_EXT     = p_ccExtSevCP,
             EQUIL_ECON_CP_CC_EXT = p_ccExtEquCP

       where idconcesionario = p_idconcesionario;

    END IF;

    IF v_valida = 0 THEN
      insert into p_dispersion_concesionario
        (idconcesionario,
         concesionario_s,
         fondo_cob_concesionario_s,
         fondo_cob_simit_s,
         simit_s,
         equilibrio_economico_s,

         concesionario_pm,
         fondo_cob_concesionario_pm,
         fondo_cob_simit_pm,
         simit_pm,
         equilibrio_economico_pm,

         simit_pp,
         sevial_pp,
         equilibrio_economico_pp,

         polca_cp,
         fcm_cp,
         sevial_cp,
         equilibrio_economico_cp,

         concesionario_s_cc,
         fondo_cob_concesionario_s_cc,
         fondo_cob_simit_s_cc,
         simit_s_cc,
         equilibrio_economico_s_cc,

         concesionario_pm_cc,
         fondo_cob_concesionario_pm_cc,
         fondo_cob_simit_pm_cc,
         simit_pm_cc,
         equilibrio_economico_pm_cc,

         simit_pp_cc,
         sevial_pp_cc,
         equilibrio_economico_pp_cc,

         polca_cp_cc,
         fcm_cp_cc,
         sevial_cp_cc,
         equilibrio_economico_cp_cc,

         CONCESIONARIO_S_CC_EXT,
         FONCOB_CONCES_S_CC_EXT,
         FONCOB_SIMIT_S_CC_EXT,
         SIMIT_S_CC_EXT,
         EQUIL_ECON_S_CC_EXT,

         CONCESIONARIO_PM_CC_EXT,
         FONCOB_CONCES_PM_CC_EXT,
         FONCOB_SIMIT_PM_CC_EXT,
         SIMIT_PM_CC_EXT,
         EQUIL_ECON_PM_CC_EXT,

         SIMIT_PP_CC_EXT,
         SEVIAL_PP_CC_EXT,
         EQUIL_ECON_PP_CC_EXT,

         POLCA_CP_CC_EXT,
         FCM_CP_CC_EXT,
         SEVIAL_CP_CC_EXT,
         EQUIL_ECON_CP_CC_EXT

         )
      values
        (p_idconcesionario,
         p_concesionario_s,
         p_fondo_cob_concesionario_s,
         p_fondo_cob_simit_s,
         p_simit_s,
         p_equilibrio_economico_s,

         p_concesionario_pm,
         p_fondo_cob_concesionario_pm,
         p_fondo_cob_simit_pm,
         p_simit_pm,
         p_equilibrio_economico_pm,

         p_simit_pp,
         p_sevial_pp,
         p_equilibrio_economico_pp,

         p_polca_cp,
         p_fcm_cp,
         p_sevial_cp,
         p_equilibrio_economico_cp,

         p_ccLocalConS,
         p_ccLocalFonS,
         p_ccLocalCobS,
         p_ccLocalSimS,
         p_ccLocalEquS,

         p_ccLocalConP,
         p_ccLocalFonP,
         p_ccLocalCobP,
         p_ccLocalSimP,
         p_ccLocalEquP,

         p_ccLocalSimPP,
         p_ccLocalSevPP,
         p_ccLocalEquPP,

         p_ccLocalSimCP,
         p_ccLocalFcmCP,
         p_ccLocalSevCP,
         p_ccLocalEquCP,

         p_ccExtConS,
         p_ccExtFonS,
         p_ccExtCobS,
         p_ccExtSimS,
         p_ccExtEquS,

         p_ccExtConP,
         p_ccExtFonP,
         p_ccExtCobP,
         p_ccExtSimP,
         p_ccExtEquP,

         p_ccExtSimPP,
         p_ccExtSevPP,
         p_ccExtEquPP,

         p_ccExtSimCP,
         p_ccExtFcmCP,
         p_ccExtSevCP,
         p_ccExtEquCP

         );

    END IF;

    sp_log(p_usuario,
           'u_concesionario',
           p_idconcesionario || '-' || p_nit_c || '-' || p_nombre || '-' ||
           p_correo || '-' || p_concesionario_s || '-' ||
           p_fondo_cob_concesionario_s || '-' || p_fondo_cob_simit_s || '-' ||
           p_simit_s || '-' || p_equilibrio_economico_s || '-' ||

           p_concesionario_pm || '-' || p_fondo_cob_concesionario_pm || '-' ||
           p_fondo_cob_simit_pm || '-' || p_simit_pm || '-' ||
           p_equilibrio_economico_pm || '-' ||

           p_simit_pp || '-' || p_sevial_pp || '-' ||
           p_equilibrio_economico_pp || '-' ||

           p_polca_cp || '-' || p_fcm_cp || '-' || p_sevial_cp || '-' ||
           p_equilibrio_economico_cp

           );
    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [u_concesionario] ' || SQLERRM,
            p_error);

  END u_concesionario;

  PROCEDURE q_concesionario(p_idconcesionario char,
                            p_usuario         varchar2,
                            p_nit_c           out varchar2,
                            p_nombre          out varchar2,
                            p_correo          out varchar2,

                            p_concesionario_s           out number,
                            p_fondo_cob_concesionario_s out number,
                            p_fondo_cob_simit_s         out number,
                            p_simit_s                   out number,
                            p_equilibrio_economico_s    out number,

                            p_concesionario_pm           out number,
                            p_fondo_cob_concesionario_pm out number,
                            p_fondo_cob_simit_pm         out number,
                            p_simit_pm                   out number,
                            p_equilibrio_economico_pm    out number,

                            p_simit_pp                out number,
                            p_sevial_pp               out number,
                            p_equilibrio_economico_pp out number,

                            p_polca_cp                out number,
                            p_fcm_cp                  out number,
                            p_sevial_cp               out number,
                            p_equilibrio_economico_cp out number,

                            p_ccLocalConS out varchar2,
                            p_ccLocalSimS out varchar2,
                            p_ccLocalFonS out varchar2,
                            p_ccLocalCobS out varchar2,
                            p_ccLocalEquS out varchar2,

                            p_ccExtConS out varchar2,
                            p_ccExtSimS out varchar2,
                            p_ccExtFonS out varchar2,
                            p_ccExtCobS out varchar2,
                            p_ccExtEquS out varchar2,

                            p_ccLocalConP out varchar2,
                            p_ccLocalSimP out varchar2,
                            p_ccLocalFonP out varchar2,
                            p_ccLocalCobP out varchar2,
                            p_ccLocalEquP out varchar2,

                            p_ccExtConP out varchar2,
                            p_ccExtSimP out varchar2,
                            p_ccExtFonP out varchar2,
                            p_ccExtCobP out varchar2,
                            p_ccExtEquP out varchar2,

                            p_ccLocalSimPP out varchar2,
                            p_ccLocalSevPP out varchar2,
                            p_ccLocalEquPP out varchar2,

                            p_ccExtSimPP out varchar2,
                            p_ccExtSevPP out varchar2,
                            p_ccExtEquPP out varchar2,

                            p_ccLocalSimCP out varchar2,
                            p_ccLocalFcmCP out varchar2,
                            p_ccLocalSevCP out varchar2,
                            p_ccLocalEquCP out varchar2,

                            p_ccExtSimCP out varchar2,
                            p_ccExtFcmCP out varchar2,
                            p_ccExtSevCP out varchar2,
                            p_ccExtEquCP out varchar2,

                            p_error OUT VARCHAR2) is
    numRegistros number;
  BEGIN

    -- INICIALIZAR SALIDA
    p_nit_c  := null;
    p_nombre := null;
    p_correo := null;

    p_concesionario_s           := 0;
    p_fondo_cob_concesionario_s := 0;
    p_fondo_cob_simit_s         := 0;
    p_simit_s                   := 0;
    p_equilibrio_economico_s    := 0;

    p_concesionario_pm           := 0;
    p_fondo_cob_concesionario_pm := 0;
    p_fondo_cob_simit_pm         := 0;
    p_simit_pm                   := 0;
    p_equilibrio_economico_pm    := 0;

    p_simit_pp                := 0;
    p_sevial_pp               := 0;
    p_equilibrio_economico_pp := 0;

    p_polca_cp                := 0;
    p_fcm_cp                  := 0;
    p_sevial_cp               := 0;
    p_equilibrio_economico_cp := 0;

    p_ccLocalConS := null;
    p_ccLocalSimS := null;
    p_ccLocalFonS := null;
    p_ccLocalCobS := null;
    p_ccLocalEquS := null;

    p_ccExtConS := null;
    p_ccExtSimS := null;
    p_ccExtFonS := null;
    p_ccExtCobS := null;
    p_ccExtEquS := null;

    p_ccLocalConP := null;
    p_ccLocalSimP := null;
    p_ccLocalFonP := null;
    p_ccLocalCobP := null;
    p_ccLocalEquP := null;

    p_ccExtConP := null;
    p_ccExtSimP := null;
    p_ccExtFonP := null;
    p_ccExtCobP := null;
    p_ccExtEquP := null;

    p_ccLocalSimPP := null;
    p_ccLocalSevPP := null;
    p_ccLocalEquPP := null;

    p_ccExtSimPP := null;
    p_ccExtSevPP := null;
    p_ccExtEquPP := null;

    p_ccLocalSimCP := null;
    p_ccLocalFcmCP := null;
    p_ccLocalSevCP := null;
    p_ccLocalEquCP := null;

    p_ccExtSimCP := null;
    p_ccExtFcmCP := null;
    p_ccExtSevCP := null;
    p_ccExtEquCP := null;

    -- VALIDACIONES
    --sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select nit_c, nombre, correo
          into p_nit_c, p_nombre, p_correo
          from concesionario
         where idconcesionario = p_idconcesionario;

        select count(*)
          into numRegistros
          from p_dispersion_concesionario
         where idconcesionario = p_idconcesionario;

        p_error := 'Consulta Exitosa';

        if numRegistros = 0 then
          return;
        end if;

        select concesionario_s,
               fondo_cob_concesionario_s,
               fondo_cob_simit_s,
               simit_s,
               equilibrio_economico_s,

               concesionario_pm,
               fondo_cob_concesionario_pm,
               fondo_cob_simit_pm,
               simit_pm,
               equilibrio_economico_pm,

               simit_pp,
               sevial_pp,
               equilibrio_economico_pp,

               polca_cp,
               fcm_cp,
               sevial_cp,
               equilibrio_economico_cp,

               concesionario_s_cc,
               fondo_cob_concesionario_s_cc,
               fondo_cob_simit_s_cc,
               simit_s_cc,
               equilibrio_economico_s_cc,

               CONCESIONARIO_S_CC_EXT,
               FONCOB_CONCES_S_CC_EXT,
               FONCOB_SIMIT_S_CC_EXT,
               SIMIT_S_CC_EXT,
               EQUIL_ECON_S_CC_EXT,

               concesionario_pm_cc,
               fondo_cob_concesionario_pm_cc,
               fondo_cob_simit_pm_cc,
               simit_pm_cc,
               equilibrio_economico_pm_cc,

               CONCESIONARIO_PM_CC_EXT,
               FONCOB_CONCES_PM_CC_EXT,
               FONCOB_SIMIT_PM_CC_EXT,
               SIMIT_PM_CC_EXT,
               EQUIL_ECON_PM_CC_EXT,

               simit_pp_cc,
               sevial_pp_cc,
               equilibrio_economico_pp_cc,

               SIMIT_PP_CC_EXT,
               SEVIAL_PP_CC_EXT,
               EQUIL_ECON_PP_CC_EXT,

               polca_cp_cc,
               fcm_cp_cc,
               sevial_cp_cc,
               equilibrio_economico_cp_cc,

               POLCA_CP_CC_EXT,
               FCM_CP_CC_EXT,
               SEVIAL_CP_CC_EXT,
               EQUIL_ECON_CP_CC_EXT

          into p_concesionario_s,
               p_fondo_cob_concesionario_s,
               p_fondo_cob_simit_s,
               p_simit_s,
               p_equilibrio_economico_s,

               p_concesionario_pm,
               p_fondo_cob_concesionario_pm,
               p_fondo_cob_simit_pm,
               p_simit_pm,
               p_equilibrio_economico_pm,

               p_simit_pp,
               p_sevial_pp,
               p_equilibrio_economico_pp,

               p_polca_cp,
               p_fcm_cp,
               p_sevial_cp,
               p_equilibrio_economico_cp,

               p_ccLocalConS,
               p_ccLocalFonS,
               p_ccLocalCobS,
               p_ccLocalSimS,
               p_ccLocalEquS,

               p_ccExtConS,
               p_ccExtFonS,
               p_ccExtCobS,
               p_ccExtSimS,
               p_ccExtEquS,

               p_ccLocalConP,
               p_ccLocalFonP,
               p_ccLocalCobP,
               p_ccLocalSimP,
               p_ccLocalEquP,

               p_ccExtConP,
               p_ccExtFonP,
               p_ccExtCobP,
               p_ccExtSimP,
               p_ccExtEquP,

               p_ccLocalSimPP,
               p_ccLocalSevPP,
               p_ccLocalEquPP,

               p_ccExtSimPP,
               p_ccExtSevPP,
               p_ccExtEquPP,

               p_ccLocalSimCP,
               p_ccLocalFcmCP,
               p_ccLocalSevCP,
               p_ccLocalEquCP,

               p_ccExtSimCP,
               p_ccExtFcmCP,
               p_ccExtSevCP,
               p_ccExtEquCP

          from p_dispersion_concesionario
         where idconcesionario = p_idconcesionario;

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';

      END;

    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [q_concesionario] ' || SQLERRM,
            p_error);

  END q_concesionario;

  PROCEDURE i_cta_recaudo_concesionario(p_idconcesionario  char,
                                        p_idbanco          char,
                                        p_indtipo          char,
                                        p_tipocuenta       char,
                                        p_cuenta           varchar2,
                                        p_comision_recaudo number,
                                        p_comision_ach     number,
                                        p_cta_contable     varchar2,
                                        p_usuario          varchar2,
                                        p_error            OUT VARCHAR2

                                        ) as
  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
  IF not P_ERROR is null THEN
       return;
    end if;

    select COUNT(*)
      INTO v_valida
      from cta_recaudo_concesionario t
     where idconcesionario = p_idconcesionario
       and idbanco = p_idbanco
       and indtipo = p_indtipo
       and cuenta = p_cuenta;

    IF v_valida <> 0 THEN
      p_error := 'Cuenta recaudo ya existente';
    else
      insert into cta_recaudo_concesionario
        (idconcesionario,
         idbanco,
         indtipo,
         tipocuenta,
         cuenta,
         comision_recaudo,
         comision_ach,
         cta_contable)
      values
        (p_idconcesionario,
         p_idbanco,
         p_indtipo,
         p_tipocuenta,
         p_cuenta,
         p_comision_recaudo,
         p_comision_ach,
         p_cta_contable);

      p_error := 'Cuenta Recaudo Adicionado Exitosamente. ';

      p_error := MSG_INS_OK;

      sp_log(p_usuario,
             'i_cta_recaudo_concesionario',
             p_idconcesionario || '-' || p_idbanco || '-' || p_indtipo || '-' ||
             p_tipocuenta || '-' || p_cuenta || '-' || p_comision_recaudo || '-' ||
             p_comision_ach || '-' || p_cta_contable);
      commit;

    END IF;

  END i_cta_recaudo_concesionario;

  PROCEDURE u_cta_recaudo_concesionario(

                                        p_idconcesionario  char,
                                        p_idbanco          char,
                                        p_indtipo          char,
                                        p_tipocuenta       char,
                                        p_cuenta           varchar2,
                                        p_comision_recaudo number,
                                        p_comision_ach     number,
                                        p_cta_contable     varchar2,
                                        p_usuario          varchar2,
                                        p_error            OUT VARCHAR2) AS

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
  IF not P_ERROR is null THEN
       return;
    end if;

    select COUNT(*)
      INTO v_valida
      from cta_recaudo_concesionario t
     where idconcesionario = p_idconcesionario
       and idbanco = p_idbanco
       and indtipo = p_indtipo
       and cuenta = p_cuenta;

    IF v_valida <> 0 THEN
      update cta_recaudo_concesionario
         set tipocuenta       = p_tipocuenta,
           --  cuenta           = p_cuenta,
             comision_recaudo = p_comision_recaudo,
             comision_ach     = p_comision_ach,
             cta_contable     = p_cta_contable
       where idconcesionario = p_idconcesionario
         and idbanco = p_idbanco
         and indtipo = p_indtipo
         and cuenta = p_cuenta;

      sp_log(p_usuario,
             'u_cta_recaudo_concesionario',
             p_idconcesionario || '-' || p_idbanco || '-' || p_indtipo || '-' ||
             p_tipocuenta || '-' || p_cuenta || '-' || p_comision_recaudo || '-' ||
             p_comision_ach || '-' || p_cta_contable);
      commit;

      p_error := MSG_UPD_OK;
    else
      p_error := 'Cuenta Recaudo no existe';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [u_cta_recaudo_concesionario] ' || SQLERRM,
            p_error);

  END u_cta_recaudo_concesionario;

  PROCEDURE d_cta_recaudo_concesionario(p_idconcesionario char,
                                        p_idbanco         char,
                                        p_indtipo         varchar2,
                                        p_cuenta          varchar2,
                                        p_usuario         varchar2,
                                        p_error           OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      delete cta_recaudo_concesionario
       where idconcesionario = p_idconcesionario
         and idbanco = p_idbanco
         and indtipo = p_indtipo
         and cuenta = p_cuenta;
      sp_log(p_usuario,
             'd_cta_recaudo_concesionario',
             p_idconcesionario || '-' || p_idbanco || '-' || p_indtipo);
      commit;
      p_error := MSG_DEL_OK;
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [d_cta_recaudo_concesionario] ' || SQLERRM,
            p_error);
  END d_cta_recaudo_concesionario;

  PROCEDURE q_cta_recaudo_concesionario(p_idconcesionario  char,
                                        p_idbanco          char,
                                        p_indtipo          char,
                                        p_cuenta           varchar2,
                                        p_tipocuenta       out varchar2,
                                        p_comision_recaudo out number,
                                        p_comision_ach     out number,
                                        p_cta_contable     out varchar2,
                                        p_usuario          varchar2,
                                        p_error            OUT VARCHAR2

                                        ) is
  BEGIN

    -- INICIALIZAR SALIDA
    p_tipocuenta       := '000';
    p_comision_recaudo := 0;
    p_comision_ach     := 0;
    p_cta_contable     := null;

    -- VALIDACIONES
    --sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select tipocuenta,
               comision_recaudo,
               comision_ach,
               cta_contable
          into p_tipocuenta,
               p_comision_recaudo,
               p_comision_ach,
               p_cta_contable
          from cta_recaudo_concesionario
         where idconcesionario = p_idconcesionario
           and idbanco = p_idbanco
           and indtipo = p_indtipo
           and cuenta = p_cuenta;

        p_error := 'Consulta Exitosa';

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';

      END;

    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [q_cta_recaudo_concesionario] ' || SQLERRM,
            p_error);

  END q_cta_recaudo_concesionario;

  PROCEDURE i_cta_dispersion_concesionario(p_idconcesionario char,
                                           p_idbancorec      char,
                                           p_liq_idbanco     char,
                                           p_liq_tipocuenta  char,
                                           p_liq_cuenta      varchar2,
                                           p_liq_nit_c       char,

                                           p_fon_idbanco    char,
                                           p_fon_tipocuenta char,
                                           p_fon_cuenta     varchar2,
                                           p_fon_nit_c      char,

                                           p_con_idbanco    char,
                                           p_con_tipocuenta char,
                                           p_con_cuenta     varchar2,
                                           p_con_nit_c      char,

                                           p_fcm_idbanco    char,
                                           p_fcm_tipocuenta char,
                                           p_fcm_cuenta     varchar2,
                                           p_fcm_nit_c      char,

                                           p_sevial_idbanco    char,
                                           p_sevial_tipocuenta char,
                                           p_sevial_cuenta     varchar2,
                                           p_sevial_nit_c      char,

                                           p_polca_idbanco    char,
                                           p_polca_tipocuenta char,
                                           p_polca_cuenta     varchar2,
                                           p_polca_nit_c      char,

                                           p_avv_idbanco    char,
                                           p_avv_tipocuenta char,
                                           p_avv_cuenta     varchar2,
                                           p_avv_nit_c      char,

                                           p_usuario varchar2,
                                           p_error   OUT VARCHAR2) AS

    w_operacion varchar2(250);

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
      IF not P_ERROR is null THEN
       return;
    end if;


    -- Cuenta dispersion Liquidacion
    select COUNT(*)
      INTO v_valida
      from cta_dispersion_concesionario t
     where idconcesionario = p_idconcesionario
       and idbancorec = p_idbancorec
       and idConcepto = 1;

    IF v_valida <> 0 THEN
      update cta_dispersion_concesionario
         set idbanco    = p_liq_idbanco,
             nit_c      = p_liq_nit_c,
             tipocuenta = p_liq_tipocuenta,
             cuenta     = encriptar(p_liq_cuenta)
       where idconcesionario = p_idconcesionario
         and idbancorec = p_idbancorec
         and idConcepto = 1;

    END IF;

    IF v_valida = 0 THEN
      insert into cta_dispersion_concesionario
        (idconcepto,
         idconcesionario,
         idbancorec,
         idbanco,
         nit_c,
         tipocuenta,
         cuenta)
      values
        (1,
         p_idconcesionario,
         p_idbancorec,
         p_liq_idbanco,
         p_liq_nit_c,
         p_liq_tipocuenta,
         encriptar(p_liq_cuenta));

    END IF;

    -- Cuenta dispersion Fondo Cobertura
    select COUNT(*)
      INTO v_valida
      from cta_dispersion_concesionario t
     where idconcesionario = p_idconcesionario
       and idbancorec = p_idbancorec
       and idConcepto = 2;

    IF v_valida <> 0 THEN
      update cta_dispersion_concesionario
         set idbanco    = p_fon_idbanco,
             nit_c      = p_fon_nit_c,
             tipocuenta = p_fon_tipocuenta,
             cuenta     = encriptar(p_fon_cuenta)
       where idconcesionario = p_idconcesionario
         and idbancorec = p_idbancorec
         and idConcepto = 2;

    END IF;

    IF v_valida = 0 THEN
      insert into cta_dispersion_concesionario
        (idconcepto,
         idconcesionario,
         idbancorec,
         idbanco,
         nit_c,
         tipocuenta,
         cuenta)
      values
        (2,
         p_idconcesionario,
         p_idbancorec,
         p_fon_idbanco,
         p_fon_nit_c,
         p_fon_tipocuenta,
         encriptar(p_fon_cuenta));

    END IF;

    -- Cuenta dispersion Contravencional concesionario
    select COUNT(*)
      INTO v_valida
      from cta_dispersion_concesionario t
     where idconcesionario = p_idconcesionario
       and idbancorec = p_idbancorec
       and idConcepto = 3;

    IF v_valida <> 0 THEN
      update cta_dispersion_concesionario
         set idbanco    = p_con_idbanco,
             nit_c      = p_con_nit_c,
             tipocuenta = p_con_tipocuenta,
             cuenta     = encriptar(p_con_cuenta)
       where idconcesionario = p_idconcesionario
         and idbancorec = p_idbancorec
         and idConcepto = 3;

    END IF;

    IF v_valida = 0 THEN
      insert into cta_dispersion_concesionario
        (idconcepto,
         idconcesionario,
         idbancorec,
         idbanco,
         nit_c,
         tipocuenta,
         cuenta)
      values
        (3,
         p_idconcesionario,
         p_idbancorec,
         p_con_idbanco,
         p_con_nit_c,
         p_con_tipocuenta,
         encriptar(p_con_cuenta));

    END IF;



    -- Cuenta dispersion Contravencional FCM
    select COUNT(*)
      INTO v_valida
      from cta_dispersion_concesionario t
     where idconcesionario = p_idconcesionario
       and idbancorec = p_idbancorec
       and idConcepto = 4;

    IF v_valida <> 0 THEN
      update cta_dispersion_concesionario
         set idbanco    = p_fcm_idbanco,
             nit_c      = p_fcm_nit_c,
             tipocuenta = p_fcm_tipocuenta,
             cuenta     = encriptar(p_fcm_cuenta)
       where idconcesionario = p_idconcesionario
         and idbancorec = p_idbancorec
         and idConcepto = 4;

    END IF;

    IF v_valida = 0 THEN
      insert into cta_dispersion_concesionario
        (idconcepto,
         idconcesionario,
         idbancorec,
         idbanco,
         nit_c,
         tipocuenta,
         cuenta)
      values
        (4,
         p_idconcesionario,
         p_idbancorec,
         p_fcm_idbanco,
         p_fcm_nit_c,
         p_fcm_tipocuenta,
         encriptar(p_fcm_cuenta));

    END IF;

    -- Cuenta dispersion sevial
    select COUNT(*)
      INTO v_valida
      from cta_dispersion_concesionario t
     where idconcesionario = p_idconcesionario
       and idbancorec = p_idbancorec
       and idConcepto = 5;

    IF v_valida <> 0 THEN
      update cta_dispersion_concesionario
         set idbanco    = p_sevial_idbanco,
             nit_c      = p_sevial_nit_c,
             tipocuenta = p_sevial_tipocuenta,
             cuenta     = encriptar(p_sevial_cuenta)
       where idconcesionario = p_idconcesionario
         and idbancorec = p_idbancorec
         and idConcepto = 5;

    END IF;

    IF v_valida = 0 THEN
      insert into cta_dispersion_concesionario
        (idconcepto,
         idconcesionario,
         idbancorec,
         idbanco,
         nit_c,
         tipocuenta,
         cuenta)
      values
        (5,
         p_idconcesionario,
         p_idbancorec,
         p_sevial_idbanco,
         p_sevial_nit_c,
         p_sevial_tipocuenta,
         encriptar(p_sevial_cuenta));

    END IF;

    -- Cuenta dispersion Polca
    select COUNT(*)
      INTO v_valida
      from cta_dispersion_concesionario t
     where idconcesionario = p_idconcesionario
       and idbancorec = p_idbancorec
       and idConcepto = 6;

    IF v_valida <> 0 THEN
      update cta_dispersion_concesionario
         set idbanco    = p_polca_idbanco,
             nit_c      = p_polca_nit_c,
             tipocuenta = p_polca_tipocuenta,
             cuenta     = encriptar(p_polca_cuenta)
       where idconcesionario = p_idconcesionario
         and idbancorec = p_idbancorec
         and idConcepto = 6;

    END IF;

    IF v_valida = 0 THEN
      insert into cta_dispersion_concesionario
        (idconcepto,
         idconcesionario,
         idbancorec,
         idbanco,
         nit_c,
         tipocuenta,
         cuenta)
      values
        (6,
         p_idconcesionario,
         p_idbancorec,
         p_polca_idbanco,
         p_polca_nit_c,
         p_polca_tipocuenta,
         encriptar(p_polca_cuenta));

    END IF;

    -- Cuenta dispersion Avvillas
    select COUNT(*)
      INTO v_valida
      from cta_dispersion_concesionario t
     where idconcesionario = p_idconcesionario
       and idbancorec = p_idbancorec
       and idConcepto = 7;

    IF v_valida <> 0 THEN
      update cta_dispersion_concesionario
         set idbanco    = p_avv_idbanco,
             nit_c      = p_avv_nit_c,
             tipocuenta = p_avv_tipocuenta,
             cuenta     = encriptar(p_avv_cuenta)
       where idconcesionario = p_idconcesionario
         and idbancorec = p_idbancorec
         and idConcepto = 7;

    END IF;

    IF v_valida = 0 THEN
      insert into cta_dispersion_concesionario
        (idconcepto,
         idconcesionario,
         idbancorec,
         idbanco,
         nit_c,
         tipocuenta,
         cuenta)
      values
        (7,
         p_idconcesionario,
         p_idbancorec,
         p_avv_idbanco,
         p_avv_nit_c,
         p_avv_tipocuenta,
         encriptar(p_avv_cuenta));

    END IF;

    w_operacion := 'i_cta_dispersion_concesionario';

    sp_log(p_usuario,
           w_operacion,
           p_idconcesionario || '-' ||

           p_liq_idbanco || '-' || p_liq_tipocuenta || '-' || p_liq_nit_c || '-' ||
           p_liq_cuenta || '-' ||

           p_fon_idbanco || '-' || p_fon_tipocuenta || '-' || p_fon_nit_c || '-' ||
           p_fon_cuenta || '-' ||

           p_con_idbanco || '-' || p_con_tipocuenta || '-' || p_con_nit_c || '-' ||
           p_con_cuenta || '-' ||

           p_fcm_idbanco || '-' || p_fcm_tipocuenta || '-' || p_fcm_nit_c || '-' ||
           p_fcm_cuenta

           );
    commit;

    p_error := MSG_UPD_OK;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [i_cta_dispersion_concesionario] ' || SQLERRM,
            p_error);

  END i_cta_dispersion_concesionario;

  PROCEDURE q_cta_dispersion_concesionario(p_idconcesionario char,
                                           p_idbancorec      char,

                                           p_usuario varchar2,

                                           p_liq_idbanco    out varchar2,
                                           p_liq_tipocuenta out varchar2,
                                           p_liq_cuenta     out varchar2,
                                           p_liq_nit_c      out varchar2,

                                           p_fon_idbanco    out varchar2,
                                           p_fon_tipocuenta out varchar2,
                                           p_fon_cuenta     out varchar2,
                                           p_fon_nit_c      out varchar2,

                                           p_con_idbanco    out varchar2,
                                           p_con_tipocuenta out varchar2,
                                           p_con_cuenta     out varchar2,
                                           p_con_nit_c      out varchar2,

                                           p_fcm_idbanco    out varchar2,
                                           p_fcm_tipocuenta out varchar2,
                                           p_fcm_cuenta     out varchar2,
                                           p_fcm_nit_c      out varchar2,

                                           p_sevial_idbanco    out varchar2,
                                           p_sevial_tipocuenta out varchar2,
                                           p_sevial_cuenta     out varchar2,
                                           p_sevial_nit_c      out varchar2,

                                           p_polca_idbanco    out varchar2,
                                           p_polca_tipocuenta out varchar2,
                                           p_polca_cuenta     out varchar2,
                                           p_polca_nit_c      out varchar2,

                                           p_avv_idbanco    out varchar2,
                                           p_avv_tipocuenta out varchar2,
                                           p_avv_cuenta     out varchar2,
                                           p_avv_nit_c      out varchar2,

                                           p_error OUT VARCHAR2) AS

  BEGIN
    -- INICIALIZAR SALIDA
    p_liq_idbanco    := '00';
    p_liq_tipocuenta := '000';
    p_liq_cuenta     := null;
    p_liq_nit_c      := null;

    p_fon_idbanco    := '00';
    p_fon_tipocuenta := '000';
    p_fon_cuenta     := null;
    p_fon_nit_c      := null;

    p_con_idbanco    := '00';
    p_con_tipocuenta := '000';
    p_con_cuenta     := null;
    p_con_nit_c      := null;

    p_fcm_idbanco    := '00';
    p_fcm_tipocuenta := '000';
    p_fcm_cuenta     := null;
    p_fcm_nit_c      := null;

    p_sevial_idbanco    := '00';
    p_sevial_tipocuenta := '000';
    p_sevial_cuenta     := null;
    p_sevial_nit_c      := null;

    p_polca_idbanco    := '00';
    p_polca_tipocuenta := '000';
    p_polca_cuenta     := null;
    p_polca_nit_c      := null;

    p_avv_idbanco    := '00';
    p_avv_tipocuenta := '000';
    p_avv_cuenta     := null;
    p_avv_nit_c      := null;

    -- VALIDACIONES
    --sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select idbanco, nit_c, tipocuenta, desencriptar(cuenta)
          into p_liq_idbanco, p_liq_nit_c, p_liq_tipocuenta, p_liq_cuenta
          from cta_dispersion_concesionario
         where idconcesionario = p_idconcesionario
           and idbancorec = p_idbancorec
           and idconcepto = 1;

        select idbanco, nit_c, tipocuenta, desencriptar(cuenta)
          into p_fon_idbanco, p_fon_nit_c, p_fon_tipocuenta, p_fon_cuenta
          from cta_dispersion_concesionario
         where idconcesionario = p_idconcesionario
           and idbancorec = p_idbancorec
           and idconcepto = 2;

        select idbanco, nit_c, tipocuenta, desencriptar(cuenta)
          into p_con_idbanco, p_con_nit_c, p_con_tipocuenta, p_con_cuenta
          from cta_dispersion_concesionario
         where idconcesionario = p_idconcesionario
           and idbancorec = p_idbancorec
           and idconcepto = 3;

        select idbanco, nit_c, tipocuenta, desencriptar(cuenta)
          into p_fcm_idbanco, p_fcm_nit_c, p_fcm_tipocuenta, p_fcm_cuenta
          from cta_dispersion_concesionario
         where idconcesionario = p_idconcesionario
           and idbancorec = p_idbancorec
           and idconcepto = 4;

        select idbanco, nit_c, tipocuenta, desencriptar(cuenta)
          into p_sevial_idbanco,
               p_sevial_nit_c,
               p_sevial_tipocuenta,
               p_sevial_cuenta
          from cta_dispersion_concesionario
         where idconcesionario = p_idconcesionario
           and idbancorec = p_idbancorec
           and idconcepto = 5;

        select idbanco, nit_c, tipocuenta, desencriptar(cuenta)
          into p_polca_idbanco,
               p_polca_nit_c,
               p_polca_tipocuenta,
               p_polca_cuenta
          from cta_dispersion_concesionario
         where idconcesionario = p_idconcesionario
           and idbancorec = p_idbancorec
           and idconcepto = 6;

        select idbanco, nit_c, tipocuenta, desencriptar(cuenta)
          into p_avv_idbanco, p_avv_nit_c, p_avv_tipocuenta, p_avv_cuenta
          from cta_dispersion_concesionario
         where idconcesionario = p_idconcesionario
           and idbancorec = p_idbancorec
           and idconcepto = 7;

        p_error := 'Consulta Exitosa';

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'No existe Cuentas Dispersion Concesionario';
      END;

    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [q_cta_dispersion_concesionario] ' || SQLERRM,
            p_error);

  END q_cta_dispersion_concesionario;

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
                                    p_valor_total   number,
                                    p_idmunicipio   char,
                                    p_periodo       char,
                                    p_p_consignado  number,
                                    p_usuario       varchar2,
                                    p_error         OUT VARCHAR2) AS

    w_fecha_cor recaudo_local_ajustes.fec_corte%TYPE;
    w_fecha_tra recaudo_local_ajustes.fec_tran%TYPE;

    w_operacion varchar2(250);

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
    sp_v_usuario(p_usuario, p_error,'pk_param');

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
       p_consignado)
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
       p_p_consignado);

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
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      delete recaudo_local_ajustes
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

 PROCEDURE u_person(p_idperson     number,
                     p_password_ant varchar,
                     p_password_new varchar,
                     p_usuario      varchar2,
                     p_error        OUT VARCHAR2) is

    cantidad number;
    v_integrada NUMBER;

  BEGIN

    -- VALIDACIONES
    /*sp_v_usuario(p_usuario, p_error,'pk_param');*/

   select COUNT(*) INTO v_valida
   from person p
   WHERE p.idperson = p_usuario;

   if v_valida = 0 then
      p_error := 'USUARIO NO EXISTE EN SDF';
      return;
   end if;

   select f.seguridad_integrada
   into v_integrada
   from fcm f
   where f.nit_fcm = '8000826650';

   if (v_integrada = 1) then
      p_error := 'CAMBIO DE CLAVE DEBE SER EN PAGINA SIMIT';
      return;
   end if;


    if (p_password_ant = p_password_new) then
      p_error := 'Clave invalida, las claves anterior y nueva tienen que ser diferentes';
    end if;

    if (p_error is null) then

      select count(*)
        into cantidad
        from person
       where idperson = p_idperson
         and password = p_password_ant or
             password = TRANSLATE(p_password_ant,'abcdefghijklmnopqrstuvwxyz0123456789', '0z1y2x3w4v5u6t7s8r9qponmlkjihgfedcba');

      if (cantidad = 0) then
        p_error := 'Clave anterior incorrecta';
      else
        update person
           set password = TRANSLATE(p_password_new,'abcdefghijklmnopqrstuvwxyz0123456789', '0z1y2x3w4v5u6t7s8r9qponmlkjihgfedcba')
         where idperson = p_idperson;

        p_error := 'Cambio de clave exitoso';

        sp_log(p_usuario, 'u_person', 'Realizo cambio de clave');

        commit;
      end if;
    end if;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [u_person] ' || SQLERRM, p_error);

  END u_person;


  PROCEDURE d_validador_fecha(p_idmunicipio char,
                              p_idvalidador char,
                              p_indTipo     char,
                              p_usuario     varchar2,
                              p_error       OUT VARCHAR2) is

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      delete validador_fecha
       where idmunicipio = p_idmunicipio
         and idvalidador = p_idvalidador
         and indtipo = p_indtipo;
      sp_log(p_usuario,
             'd_validador_fecha',
             p_idmunicipio || '-' || p_idvalidador || '-' || p_indtipo);
      commit;
      p_error := MSG_DEL_OK;
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [d_validador_fecha] ' || SQLERRM,
            p_error);

  END d_validador_fecha;

  PROCEDURE u_validador_fecha(p_idmunicipio              char,
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
                              p_error                    OUT VARCHAR2) as

    w_fecha_ini validador_fecha.fecha_ini%TYPE;
    w_fecha_fin validador_fecha.fecha_ini%TYPE;
    w_operacion varchar2(250);

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
  IF not P_ERROR is null THEN
       return;
    end if;

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

    select COUNT(*)
      INTO v_valida
      from validador_fecha t
     where idMunicipio = p_idmunicipio
       and idValidador = p_idvalidador
       and indTipo = p_indTipo;

    IF v_valida <> 0 THEN
      update validador_fecha
         set fecha_ini                = w_fecha_ini,
             fecha_fin                = w_fecha_fin,
             p_municipio              = p_p_municipio,
             p_fcm_contravencional    = p_p_fcm_contravencional,
             p_conces_contravencional = p_p_conces_contravencional,
             p_acuerdopago            = p_p_acuerdopago,
             nit_tercero1             = p_nit_tercero1,
             base_tercero1            = p_base_tercero1,
             ind_base_tercero1        = p_ind_base_tercero1,
             nit_tercero2             = p_nit_tercero2,
             base_tercero2            = p_base_tercero2,
             ind_base_tercero2        = p_ind_base_tercero2
       where idMunicipio = p_idmunicipio
         and idValidador = p_idvalidador
         and indTipo = p_indTipo;

      w_operacion := 'u_validador_fecha';
      p_error     := MSG_UPD_OK;

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

    IF v_valida = 0 THEN

      p_error := 'Validador No existe. ';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [u_validador_fecha] ' || SQLERRM,
            p_error);

  END u_validador_fecha;

  PROCEDURE u_municipio(p_idmunicipio              varchar2,
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
                        p_error                    OUT VARCHAR2

                        ) AS

    w_operacion varchar2(250);

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
  IF not P_ERROR is null THEN
       return;
    end if;

    select COUNT(*)
      INTO v_valida
      from municipio t
     where idmunicipio = p_idmunicipio;

    IF v_valida <> 0 THEN
      update municipio
         set nit_m               = p_nit_m,
             nombre              = p_nombre,
             idconcesionario     = p_idconcesionario,
             correo              = p_correo,
             indretroactividad   = p_indretroactividad,
             indliq_s_ext        = p_indliq_s_ext,
             indliq_s_local      = p_indliq_s_local,
             indliq_p_ext        = p_indliq_p_ext,
             indliq_p_local      = p_indliq_p_local,
             indAcuerdoPago_2002 = p_indAcuerdoPago_2002,
             idbanco             = p_idbanco,
             tipocuenta          = p_tipocuenta,
             cuenta              = encriptar(p_cuenta),
             nit_cta             = p_nit_cta

       where idmunicipio = p_idmunicipio;

      commit;
      p_error := MSG_UPD_OK;

    else
      p_error := 'Municipio no existe';
      return;

    END IF;

    select COUNT(*)
      INTO v_valida
      from p_dispersion_municipio t
     where idmunicipio = p_idmunicipio;

    IF v_valida <> 0 THEN
      update p_dispersion_municipio
         set idmunicipio              = p_idmunicipio,
             municipio_s              = p_municipio_s,
             fcm_contravencional_s    = p_fcm_contravencional_s,
             conces_contravencional_s = p_conces_contravencional_s,
             acuerdopago_s            = p_acuerdopago_s,
             municipio_p              = p_municipio_p,
             fcm_contravencional_p    = p_fcm_contravencional_p,
             conces_contravencional_p = p_conces_contravencional_p,
             acuerdopago_p            = p_acuerdopago_p
       where idmunicipio = p_idmunicipio;

      sp_log(p_usuario,
             w_operacion,
             p_idmunicipio || '-' || p_nit_m || '-' || p_nombre || '-' ||
             p_idconcesionario || '-' || p_correo || '-' ||
             p_indretroactividad || '-' || p_idbanco || '-' || p_tipocuenta || '-' ||
             p_cuenta || '-' || p_nit_cta || '-' || p_indliq_s_ext || '-' ||
             p_indliq_s_local || '-' || p_indliq_p_ext || '-' ||
             p_indliq_p_local || '-' || p_municipio_s || '-' ||
             p_indliq_p_local || '-' || p_fcm_contravencional_s || '-' ||
             p_conces_contravencional_s || '-' || p_acuerdopago_s || '-' ||
             p_municipio_p || '-' || p_fcm_contravencional_p || '-' ||
             p_conces_contravencional_p || '-' || p_acuerdopago_p);

      commit;
      p_error := MSG_UPD_OK;

    else
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
        (p_idmunicipio,
         p_municipio_s,
         p_fcm_contravencional_s,
         p_conces_contravencional_s,
         p_acuerdopago_s,
         p_municipio_p,
         p_fcm_contravencional_p,
         p_conces_contravencional_p,
         p_acuerdopago_p);
      --p_error := 'Municipio no existe';
    END IF;

    sp_log(p_usuario,
           'u_municipio',
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
      sp_ex(SQLCODE, p_usuario || ' [u_municipio] ' || SQLERRM, p_error);

  END u_municipio;


  PROCEDURE i_cta_dispersion_fcm(P_NIT_FCM              VARCHAR2,
                                 P_IDBANCOREC           CHAR,
                                 P_CTA_DISP_S_BANCO     CHAR,
                                 P_CTA_DISP_S_TIPO_CTA  VARCHAR2,
                                 P_CTA_DISP_S_CTA       VARCHAR2,
                                 P_CTA_DISP_P_BANCO     CHAR,
                                 P_CTA_DISP_P_TIPO_CTA  VARCHAR2,
                                 P_CTA_DISP_P_CTA       VARCHAR2,
                                 P_CTA_DISP_PA_BANCO    CHAR,
                                 P_CTA_DISP_PA_TIPO_CTA VARCHAR2,
                                 P_CTA_DISP_PA_CTA      VARCHAR2,
                                 P_CTA_DISP_AC_BANCO    CHAR,
                                 P_CTA_DISP_AC_TIPO_CTA VARCHAR2,
                                 P_CTA_DISP_AC_CTA      VARCHAR2,
                                 p_usuario              varchar2,
                                 p_error                OUT VARCHAR2) AS

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
  IF not P_ERROR is null THEN
       return;
    end if;

    -- Cuenta dispersion Liquidacion
    select COUNT(*)
      INTO v_valida
      from cta_dispersion_fcm t
     where nit_fcm = p_nit_fcm
       and idbancorec = p_idbancorec;

    IF v_valida <> 0 THEN
      p_error := 'Datos Banco Recaudador ya existen';
      return;
    END IF;

    IF v_valida = 0 THEN
      insert into cta_dispersion_fcm
        (nit_fcm,
         idbancorec,
         cta_disp_s_banco,
         cta_disp_s_tipo_cta,
         cta_disp_s_cta,
         cta_disp_p_banco,
         cta_disp_p_tipo_cta,
         cta_disp_p_cta,
         cta_disp_pa_banco,
         cta_disp_pa_tipo_cta,
         cta_disp_pa_cta,
         cta_disp_ac_banco,
         cta_disp_ac_tipo_cta,
         cta_disp_ac_cta

         )
      values
        (p_nit_fcm,
         p_idbancorec,
         p_cta_disp_s_banco,
         p_cta_disp_s_tipo_cta,
         encriptar(p_cta_disp_s_cta),
         p_cta_disp_p_banco,
         p_cta_disp_p_tipo_cta,
         encriptar(p_cta_disp_p_cta),
         p_cta_disp_pa_banco,
         p_cta_disp_pa_tipo_cta,
         encriptar(p_cta_disp_pa_cta),
         p_cta_disp_ac_banco,
         p_cta_disp_ac_tipo_cta,
         encriptar(p_cta_disp_ac_cta)

         );

      sp_log(p_usuario,
             'i_cta_dispersion_fcm',
             p_nit_fcm || '-' || p_idbancorec || '-' || p_cta_disp_s_banco || '-' ||
             p_cta_disp_s_tipo_cta || '-' || p_cta_disp_s_cta || '-' ||

             p_cta_disp_p_banco || '-' || p_cta_disp_p_tipo_cta || '-' ||
             p_cta_disp_p_cta || '-' ||

             p_cta_disp_pa_banco || '-' || p_cta_disp_pa_tipo_cta || '-' ||
             p_cta_disp_pa_cta

             );
      commit;

      p_error := MSG_INS_OK;

    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [i_cta_dispersion_fcm] ' || SQLERRM,
            p_error);

  END i_cta_dispersion_fcm;

  PROCEDURE u_cta_dispersion_fcm(P_NIT_FCM              VARCHAR2,
                                 P_IDBANCOREC           CHAR,
                                 P_CTA_DISP_S_BANCO     CHAR,
                                 P_CTA_DISP_S_TIPO_CTA  VARCHAR2,
                                 P_CTA_DISP_S_CTA       VARCHAR2,
                                 P_CTA_DISP_P_BANCO     CHAR,
                                 P_CTA_DISP_P_TIPO_CTA  VARCHAR2,
                                 P_CTA_DISP_P_CTA       VARCHAR2,
                                 P_CTA_DISP_PA_BANCO    CHAR,
                                 P_CTA_DISP_PA_TIPO_CTA VARCHAR2,
                                 P_CTA_DISP_PA_CTA      VARCHAR2,
                                 P_CTA_DISP_AC_BANCO    CHAR,
                                 P_CTA_DISP_AC_TIPO_CTA VARCHAR2,
                                 P_CTA_DISP_AC_CTA      VARCHAR2,
                                 p_usuario              varchar2,
                                 p_error                OUT VARCHAR2) AS

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
  IF not P_ERROR is null THEN
       return;
    end if;

    -- Cuenta dispersion Liquidacion
    select COUNT(*)
      INTO v_valida
      from cta_dispersion_fcm t
     where nit_fcm = p_nit_fcm
       and idbancorec = p_idbancorec;

    IF v_valida <> 0 THEN
      update cta_dispersion_fcm
         set nit_fcm              = p_nit_fcm,
             idbancorec           = p_idbancorec,
             cta_disp_s_banco     = p_cta_disp_s_banco,
             cta_disp_s_tipo_cta  = p_cta_disp_s_tipo_cta,
             cta_disp_s_cta       = encriptar(p_cta_disp_s_cta),
             cta_disp_p_banco     = p_cta_disp_p_banco,
             cta_disp_p_tipo_cta  = p_cta_disp_p_tipo_cta,
             cta_disp_p_cta       = encriptar(p_cta_disp_p_cta),
             cta_disp_pa_banco    = p_cta_disp_pa_banco,
             cta_disp_pa_tipo_cta = p_cta_disp_pa_tipo_cta,
             cta_disp_pa_cta      = encriptar(p_cta_disp_pa_cta),
             cta_disp_ac_banco    = p_cta_disp_ac_banco,
             cta_disp_ac_tipo_cta = p_cta_disp_ac_tipo_cta,
             cta_disp_ac_cta      = encriptar(p_cta_disp_ac_cta)

       where nit_fcm = p_nit_fcm
         and idbancorec = p_idbancorec;

      p_error := MSG_UPD_OK;

      sp_log(p_usuario,
             'u_cta_dispersion_fcm',
             p_nit_fcm || '-' || p_idbancorec || '-' || p_cta_disp_s_banco || '-' ||
             p_cta_disp_s_tipo_cta || '-' || p_cta_disp_s_cta || '-' ||

             p_cta_disp_p_banco || '-' || p_cta_disp_p_tipo_cta || '-' ||
             p_cta_disp_p_cta || '-' ||

             p_cta_disp_pa_banco || '-' || p_cta_disp_pa_tipo_cta || '-' ||
             p_cta_disp_pa_cta

             );
      commit;

    END IF;

    IF v_valida = 0 THEN
      p_error := 'Datos Banco Recaudador no existen';
      return;
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [u_cta_dispersion_fcm] ' || SQLERRM,
            p_error);

  END u_cta_dispersion_fcm;

  PROCEDURE q_cta_dispersion_fcm(P_NIT_FCM              VARCHAR2,
                                 P_IDBANCOREC           CHAR,
                                 P_CTA_DISP_S_BANCO     OUT VARCHAR2,
                                 P_CTA_DISP_S_TIPO_CTA  OUT VARCHAR2,
                                 P_CTA_DISP_S_CTA       OUT VARCHAR2,
                                 P_CTA_DISP_P_BANCO     OUT VARCHAR2,
                                 P_CTA_DISP_P_TIPO_CTA  OUT VARCHAR2,
                                 P_CTA_DISP_P_CTA       OUT VARCHAR2,
                                 P_CTA_DISP_PA_BANCO    OUT VARCHAR2,
                                 P_CTA_DISP_PA_TIPO_CTA OUT VARCHAR2,
                                 P_CTA_DISP_PA_CTA      OUT VARCHAR2,
                                 P_CTA_DISP_AC_BANCO    OUT VARCHAR2,
                                 P_CTA_DISP_AC_TIPO_CTA OUT VARCHAR2,
                                 P_CTA_DISP_AC_CTA      OUT VARCHAR2,
                                 p_usuario              varchar2,
                                 p_error                OUT VARCHAR2) AS

  BEGIN

    -- VALIDACIONES
  --  sp_v_usuario(p_usuario, p_error,'pk_param');
  IF not P_ERROR is null THEN
       return;
    end if;

    -- Cuenta dispersion Liquidacion
    select COUNT(*)
      INTO v_valida
      from cta_dispersion_fcm t
     where nit_fcm = p_nit_fcm
       and idbancorec = p_idbancorec;

    IF v_valida <> 0 THEN
      select cta_disp_s_banco,
             cta_disp_s_tipo_cta,
             desencriptar(cta_disp_s_cta),
             cta_disp_p_banco,
             cta_disp_p_tipo_cta,
             desencriptar(cta_disp_p_cta),
             cta_disp_pa_banco,
             cta_disp_pa_tipo_cta,
             desencriptar(cta_disp_pa_cta),
             cta_disp_ac_banco,
             cta_disp_ac_tipo_cta,
             desencriptar(cta_disp_ac_cta)

        into p_cta_disp_s_banco,
             p_cta_disp_s_tipo_cta,
             p_cta_disp_s_cta,
             p_cta_disp_p_banco,
             p_cta_disp_p_tipo_cta,
             p_cta_disp_p_cta,
             p_cta_disp_pa_banco,
             p_cta_disp_pa_tipo_cta,
             p_cta_disp_pa_cta,
             p_cta_disp_ac_banco,
             p_cta_disp_ac_tipo_cta,
             p_cta_disp_ac_cta

        from cta_dispersion_fcm
       where nit_fcm = p_nit_fcm
         and idbancorec = p_idbancorec;
      p_error := 'Consulta Exitosa';
    END IF;

    IF v_valida = 0 THEN
      p_error := 'Datos Banco Recaudador no existen';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [q_cta_dispersion_fcm] ' || SQLERRM,
            p_error);

  END q_cta_dispersion_fcm;

  PROCEDURE d_cta_dispersion_fcm(P_NIT_FCM    VARCHAR2,
                                 P_IDBANCOREC CHAR,
                                 p_usuario    varchar2,
                                 p_error      OUT VARCHAR2) AS

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_param');
  IF not P_ERROR is null THEN
       return;
    end if;

    -- Cuenta dispersion Liquidacion
    select COUNT(*)
      INTO v_valida
      from cta_dispersion_fcm t
     where nit_fcm = p_nit_fcm
       and idbancorec = p_idbancorec;

    IF v_valida <> 0 THEN
      delete cta_dispersion_fcm
       where nit_fcm = p_nit_fcm
         and idbancorec = p_idbancorec;

      sp_log(p_usuario,
             'd_cta_dispersion_fcm',
             p_nit_fcm || '-' || p_idbancorec);

      commit;

      p_error := MSG_DEL_OK;
    END IF;

    IF v_valida = 0 THEN
      p_error := 'Datos Banco Recaudador no existen';
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [d_cta_dispersion_fcm] ' || SQLERRM,
            p_error);

  END d_cta_dispersion_fcm;



PROCEDURE validarRangoFecha(p_fecha_ini_ano number,
                              p_fecha_ini_mes number,
                              p_fecha_ini_dia number,
                              p_fecha_fin_ano number,
                              p_fecha_fin_mes number,
                              p_fecha_fin_dia number,
                              p_indtipo       char,
                              p_idmunicipio   char,
                              p_idvalidador   char,
                             p_error         OUT VARCHAR2) AS

    w_fecha_ini validador_fecha.fecha_ini%TYPE;
    w_fecha_fin validador_fecha.fecha_fin%TYPE;


    CURSOR validar is
      select idvalidador, fecha_ini, fecha_fin
            from validador_fecha t
            where indtipo = p_indtipo
            and idmunicipio = p_idmunicipio;

      f_ini date;
      f_fin date;
      validador char(3);

  BEGIN

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

    p_error := 'FECHAOK';

    OPEN validar;
    LOOP
        FETCH validar INTO validador, f_ini, f_fin;
        EXIT WHEN validar%NOTFOUND;
          if (validador != p_idvalidador ) then
          IF  ( ( w_fecha_ini >= f_ini ) and (w_fecha_ini <= f_fin) ) OR
              ( ( w_fecha_fin >= f_ini ) and (w_fecha_fin <= f_fin) ) THEN
                 p_error := 'FECHANOK';
          end if;
          END IF;

    END LOOP;
    commit;
    CLOSE validar;

    EXCEPTION
      WHEN OTHERS THEN
        sp_ex(SQLCODE, ' [d_validador_fecha] ' || SQLERRM, p_error);

  END validarRangoFecha;








PROCEDURE u_NovmunicipioEst(p_tiponov   varchar2,
                              p_numeronov varchar2,
                              p_usuario   varchar2,
                              p_estado    varchar2,
                              p_error     OUT VARCHAR2) is

    estado_act varchar2(100);

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_proc');

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
               and numeronov =to_number(p_numeronov);
          END IF;
        END IF;

        IF p_estado = 'ANULADA' THEN
           insert into hist_vobo
              (idvobo, tipo, accion, usuario, fecha, referencia1, referencia2, referencia3, referencia4)
            values
              (seq_vobo.nextval, 'NOVEDAD MUNICIPIO', 'RECHAZADO', p_usuario, sysdate, p_tiponov || '-' || p_numeronov, p_estado, 0, 0);

        ELSE
            insert into hist_vobo
              (idvobo, tipo, accion, usuario, fecha, referencia1, referencia2, referencia3, referencia4)
            values
              (seq_vobo.nextval, 'NOVEDAD MUNICIPIO', 'APROBADO', p_usuario, sysdate, p_tiponov || '-' || p_numeronov, p_estado, 0, 0);
        END IF;

        commit;

        if (p_estado = 'VOBOFINANCIERA' ) THEN
          sp_envionotificacion(
                gruporecibe => 5,
                grupocopia => -1,
                asunto => 'Notificación de Novedad de Municipio:  ' || p_tiponov || '-' || p_numeronov,
                mensaje => 'Se ha creado una novedad financiera de municipio. Por favor verificar y dar su visto bueno. NUMERO NOVEDAD ' || p_tiponov || '-' || p_numeronov || ' . Muchas gracias',
                p_usuario => p_usuario);

        END IF;

        if (p_estado = 'VOBOSIMIT' ) THEN
          sp_envionotificacion(
                gruporecibe => 6,
                grupocopia => -1,
                asunto => 'Notificación de Novedad de Municipio:  ' || p_tiponov || '-' || p_numeronov,
                mensaje => 'Se ha creado una novedad financiera de municipio. Por favor verificar y dar su visto bueno. NUMERO NOVEDAD ' || p_tiponov || '-' || p_numeronov|| ' . Muchas gracias',
                p_usuario => p_usuario);

        END IF;

         if (p_estado = 'VALIDADA' ) THEN
          sp_envionotificacion(
                gruporecibe => 7,
                grupocopia => -1,
                asunto => 'Notificación de Novedad de Municipio:  ' || p_tiponov || '-' || p_numeronov,
                mensaje => 'Se ha aprobado una novedad financiera de municipio. Por favor informar a banco novedad. NUMERO NOVEDAD ' || p_tiponov || '-' || p_numeronov || ' . Muchas gracias',
                p_usuario => p_usuario);

        END IF;

         if (p_estado = 'ANULADA' ) THEN
          sp_envionotificacion(
                gruporecibe => 3,
                grupocopia => -1,
                asunto => 'Notificación de ANULACION Novedad de Municipio:  ' || p_tiponov || '-' || p_numeronov,
                mensaje => 'Se ha ANULADO una novedad financiera de municipio. Por favor verificar informacion. NUMERO NOVEDAD ' || p_tiponov || '-' || p_numeronov || ' . Muchas gracias',
                p_usuario => p_usuario);

        END IF;


        p_error := 'Actualización Exitosa';

        sp_log(p_usuario,
               'u_NovmunicipioEst',
               p_tiponov || '-' || p_numeronov || '-' || p_estado );


        commit;

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO' || p_tiponov ||'-' || p_numeronov ;
      END;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [u_NovmunicipioEst] ' || SQLERRM,
            p_error);
  END u_NovmunicipioEst;
end pk_param;
/


spool off
