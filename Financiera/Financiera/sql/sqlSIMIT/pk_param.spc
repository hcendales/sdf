create or replace package pk_param is

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

