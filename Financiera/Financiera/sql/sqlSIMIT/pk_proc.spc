create or replace package pk_proc is

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

  PROCEDURE v_archivo(p_tipoCargue      varchar2,
                      p_uploadid        number,
                      p_idbanco         char,
                      p_cta_recaudo_fcm varchar2,
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
PROCEDURE q_NovValidador_fechaE(p_tiponov       varchar2,
                                 p_numeronov     number,
                                 p_usuario       varchar2,
                                 p_estadonov     out varchar2,
                                 p_error         OUT VARCHAR2);
PROCEDURE u_NovValidador_fechaEst(
                        p_tiponov                  varchar2,
                        p_numeronov                number,
                        p_usuario                  varchar2,
                        p_estado                   varchar2,
                        p_error                    OUT VARCHAR2);

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

  PROCEDURE q_Novmunicipio(
                        p_tiponov                  varchar2,
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

  PROCEDURE q_NovmunicipioE(
                        p_tiponov                  varchar2,
                        p_numeronov                number,
                        p_usuario                  varchar2,
                        p_estadonov                out varchar2,
                        p_error                    OUT VARCHAR2);
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
                        p_novedad                  out varchar2
                        );

PROCEDURE u_NovmunicipioEst(
                        p_tiponov                  varchar2,
                        p_numeronov                varchar2,
                        p_usuario                  varchar2,
                        p_estado                   varchar2,
                        p_error                    OUT VARCHAR2);


  PROCEDURE q_NovDiasDispersionE(p_tiponov       varchar2,
                                 p_numeronov     number,
                                 p_usuario       varchar2,
                                 p_estadonov     out varchar2,
                                 p_error         OUT VARCHAR2);

PROCEDURE i_NovDiasDispersion(p_idmunicipio      char,
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


PROCEDURE u_NovDiasDispersionEst(
                        p_tiponov                  varchar2,
                        p_numeronov                number,
                        p_usuario                  varchar2,
                        p_estado                   varchar2,
                        p_error                    OUT VARCHAR2);


  PROCEDURE q_NovterceroE(p_tiponov       varchar2,
                         p_numeronov     number,
                         p_usuario       varchar2,
                         p_estadonov     out varchar2,
                         p_error         OUT VARCHAR2);
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


   PROCEDURE u_NovtercerosEst(
                        p_tiponov                  varchar2,
                        p_numeronov                number,
                        p_usuario                  varchar2,
                        p_estado                   varchar2,
                        p_error                    OUT VARCHAR2);





PROCEDURE i_Novterceros(
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
                      p_tiponov              varchar2,
                      p_fecha_act_ano        number,
                      p_fecha_act_mes        number,
                      p_fecha_act_dia        number,
                      p_firma1               varchar2,
                      p_firma2               varchar2,
                      p_dnsavvillas        varchar2,
                      p_dnsgranbanco       varchar2,
                      p_error                OUT VARCHAR2,
                      p_novedad              OUT varchar2);

  PROCEDURE aprobar_reproceso(p_fec_ini_ano number,
                              p_fec_ini_mes number,
                              p_fec_ini_dia number,
                              p_tipo        varchar2,
                              p_usuario     varchar2,
                              p_error       OUT VARCHAR2);

  PROCEDURE l_recaudo_local(p_fec_ini_ano number,
                            p_fec_ini_mes number,
                            p_fec_ini_dia number,
                            p_fec_fin_ano number,
                            p_fec_fin_mes number,
                            p_fec_fin_dia number,
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
                                     p_usuario varchar2,
                                     p_error   OUT VARCHAR2);

  PROCEDURE dispersa_recaudo_local(p_fec_ini_ano number,
                                   p_fec_ini_mes number,
                                   p_fec_ini_dia number,
                                   p_fec_fin_ano number,
                                   p_fec_fin_mes number,
                                   p_fec_fin_dia number,
                                   p_usuario     varchar2,
                                   p_error       OUT VARCHAR2);

  PROCEDURE causa_gas_recaudo_local(p_fec_ini_ano number,
                                    p_fec_ini_mes number,
                                    p_fec_ini_dia number,
                                    p_fec_fin_ano number,
                                    p_fec_fin_mes number,
                                    p_fec_fin_dia number,
                                    p_usuario     varchar2,
                                    p_error       OUT VARCHAR2);

  PROCEDURE causa_ing_recaudo_local(p_fec_ini_ano number,
                                    p_fec_ini_mes number,
                                    p_fec_ini_dia number,
                                    p_fec_fin_ano number,
                                    p_fec_fin_mes number,
                                    p_fec_fin_dia number,
                                    p_usuario     varchar2,
                                    p_error       OUT VARCHAR2);

  PROCEDURE dispersa_recaudo_externo(p_fec_ini_ano number,
                                     p_fec_ini_mes number,
                                     p_fec_ini_dia number,
                                     p_usuario     varchar2,
                                     p_error       OUT VARCHAR2);

  PROCEDURE causa_gas_recaudo_externo(p_fec_ini_ano number,
                                      p_fec_ini_mes number,
                                      p_fec_ini_dia number,
                                      p_fec_fin_ano number,
                                      p_fec_fin_mes number,
                                      p_fec_fin_dia number,
                                      p_usuario     varchar2,
                                      p_error       OUT VARCHAR2);

  PROCEDURE causa_ing_recaudo_externo(p_fec_ini_ano number,
                                      p_fec_ini_mes number,
                                      p_fec_ini_dia number,
                                      p_fec_fin_ano number,
                                      p_fec_fin_mes number,
                                      p_fec_fin_dia number,
                                      p_usuario     varchar2,
                                      p_error       OUT VARCHAR2);

  PROCEDURE contabiliza_recaudo_externo(p_feccor_ini_ano number,
                                        p_feccor_ini_mes number,
                                        p_feccor_ini_dia number,
                                        p_usuario        varchar2,
                                        p_error          OUT VARCHAR2);

  PROCEDURE contabiliza_pago_externo(p_feccor_ini_ano number,
                                     p_feccor_ini_mes number,
                                     p_feccor_ini_dia number,
                                     p_usuario        varchar2,
                                     p_error          OUT VARCHAR2);

  PROCEDURE generarArchivoAvvillas(p_fecha   date,
                                   p_usuario varchar2,
                                   p_error   OUT VARCHAR2);

  PROCEDURE generarArchivoDavivienda(p_fecha   date,
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

  PROCEDURE verLogEnvioAvvillas(salida OUT VARCHAR2);

  PROCEDURE verLogEnvioDavivienda(salida OUT VARCHAR2);

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
                        
                        
PROCEDURE generarArchivoAvvillas_repro(p_fecha_ini   date,
                                   p_fecha_fin   date,
                                   p_usuario varchar2,
                                   p_error   OUT VARCHAR2);
                                   
PROCEDURE generarArchivoDavivienda_repro(p_fecha_ini   date,
                                     p_fecha_fin   date,                     
                                     p_usuario varchar2,
                                     p_error   OUT VARCHAR2) ;                                                          
                        
end pk_proc;
/

