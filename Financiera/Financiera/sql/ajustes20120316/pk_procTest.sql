---------------------------------------------
-- Export file for user SIMIT              --
-- Created by SEVEN on 16/03/2012, 7:43:58 --
---------------------------------------------

spool pk_procTest.log

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

  PROCEDURE generarArchivoAvvillas_repro(p_fecha_ini date,
                                         p_fecha_fin date,
                                         p_usuario   varchar2,
                                         p_error     OUT VARCHAR2);

  PROCEDURE generarArchivoDavivienda_repro(p_fecha_ini date,
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
                                    p_valor_total   number,
                                    p_idmunicipio   char,
                                    p_periodo       char,
                                    p_p_consignado  number,
                                    p_motivo        varchar2,
                                    p_usuario       varchar2,
                                    p_error         OUT VARCHAR2);

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
                                    p_p_consignado             out number,
                                    p_motivo                   out varchar2,
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

end pk_proc;
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
      
        if (substr(nomArchivo, 1, 2) <> 'sm' and
           substr(nomArchivo, 1, 2) <> 'sr') then
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
  
    commit;
  
    if (substr(nomArchivo, 1, 2) <> 'sm' and
       substr(nomArchivo, 1, 2) <> 'sr') then
    
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
       substr(nomArchivo, 1, 2) <> 'sr') then
    
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
    
      IF (p_tipocargue = 'SIN') THEN
      
        p_error := fn_divide_archivo_sin(p_uploadid        => p_uploadid,
                                         p_idbanco         => p_idbanco,
                                         p_cta_recaudo_fcm => p_cta_recaudo_fcm,
                                         p_usuario         => p_usuario,
                                         p_error           => p_error);
      END IF;
      
      IF (p_tipocargue = 'IDE') THEN
      
          cargarIdeMasiva  (p_uploadid        => p_uploadid,
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
  
    v_periodo := Substr(v_nombreArchivo, 1, 6);
  
    select count(*)
      into v_registros
      from mvtoavvillas
     where numerocuenta = v_cuenta
       and periodo = v_periodo;
  
    if (v_registros > 0) then
      delete from mvtoavvillas
       where numerocuenta = v_cuenta
         and periodo = v_periodo;
    
      select count(*)
        into v_registros
        from trxsinidentificar
       where cuenta = v_cuenta
         and periodo = v_periodo;
    
      if (v_registros > 0) then
      
        delete from trxsinidentificar
         where cuenta = v_cuenta
           and periodo = v_periodo;
      
      end if;
    
      commit;
    
      --p_error :='Extracto de cuenta ' || v_cuenta || ' del periodo ' || v_periodo || ' ya cargado. Solicitar reproceso' ;
      --return;
    end if;
  
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
       codigotrn)
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
             codigotrn
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
       estadoiden)
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
             'SI' as estadoiden
        from mvtoavvillas
       where numerocuenta = v_cuenta
         and periodo = v_periodo
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
       estadoiden)
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
             'SI' as estadoiden
        from mvtoavvillas
       where numerocuenta = v_cuenta
         and periodo = v_periodo
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
           set concesionariozon = (select m.idconcesionario
                                     from municipio m
                                    where m.idmunicipio = v_idMunicipio)
         where numsecuenciareg = registro.numsecuenciareg;
      
      end if;
    
    end loop;
  
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
  
    v_periodo := Substr(v_nombreArchivo, 1, 6);
  
    select count(*)
      into v_registros
      from mvtopopular
     where numerocuenta = v_cuenta
       and periodo = v_periodo;
  
    if (v_registros > 0) then
      delete from mvtopopular
       where numerocuenta = v_cuenta
         and periodo = v_periodo;
    
      select count(*)
        into v_registros
        from trxsinidentificar
       where cuenta = v_cuenta
         and periodo = v_periodo;
    
      if (v_registros > 0) then
      
        delete from trxsinidentificar
         where cuenta = v_cuenta
           and periodo = v_periodo;
      
      end if;
    
      commit;
    
      --p_error :='Extracto de cuenta ' || v_cuenta || ' del periodo ' || v_periodo || ' ya cargado. Solicitar reproceso' ;
      -- return;
    end if;
  
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
        BEGIN
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
       debitocredito)
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
             debitocredito
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
       p_Consignado)
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
             decode(v_indtipo, 'SIMIT', 10, 55) as p_consignado
        from mvtopopular
       where numerocuenta = v_cuenta
         and periodo = v_periodo
         and descripcion in
             (select concepto from conceptosidentificar where idbanco = '02');
  
    update trxsinidentificar t
       set t.idmunicipio = (select min(idmunicipio)
                              from oficinabanco o
                             where o.idbanco = '02'
                               and instr(o.nombre, t.oficinaorigen) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo;
  
    update trxsinidentificar t
       set t.idmunicipio = (select min(idmunicipio)
                              from oficinabanco o
                             where o.idbanco = '02'
                               and instr(t.oficinaorigen, o.nombre) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.idmunicipio is null;
  
    update trxsinidentificar t
       set t.concesionariozon = (select m.idconcesionario
                                   from municipio m
                                  where m.idmunicipio = t.idmunicipio)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.idmunicipio is not null;
  
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
    r               mvtoAgrario_temp%rowtype;
    linea           varchar2(1000);
  
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
  
    v_periodo := Substr(v_nombreArchivo, 1, 6);
  
    select count(*)
      into v_registros
      from mvtoAgrario
     where numerocuenta = v_cuenta
       and periodo = v_periodo;
  
    if (v_registros > 0) then
      delete from mvtoAgrario
       where numerocuenta = v_cuenta
         and periodo = v_periodo;
    
      select count(*)
        into v_registros
        from trxsinidentificar
       where cuenta = v_cuenta
         and periodo = v_periodo;
    
      if (v_registros > 0) then
      
        delete from trxsinidentificar
         where cuenta = v_cuenta
           and periodo = v_periodo;
      
      end if;
    
      commit;
    
      --p_error :='Extracto de cuenta ' || v_cuenta || ' del periodo ' || v_periodo || ' ya cargado. Solicitar reproceso' ;
      --return;
    end if;
  
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
          
            r.oficina := campo(8);
          
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
       oficina)
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
             oficina
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
       p_consignado)
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
             decode(v_indtipo, 'SIMIT', 10, 55) as p_consignado
        from mvtoagrario
       where numerocuenta = v_cuenta
         and periodo = v_periodo
         and descripcionmovimiento in
             (select concepto from conceptosidentificar where idbanco = '40');
  
    update trxsinidentificar t
       set t.idmunicipio = (select min(idmunicipio)
                              from oficinabanco o
                             where o.idbanco = '40'
                               and instr(o.nombre, t.oficinaorigen) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo;
  
    update trxsinidentificar t
       set t.idmunicipio = (select min(idmunicipio)
                              from oficinabanco o
                             where o.idbanco = '40'
                               and instr(t.oficinaorigen, o.nombre) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.idmunicipio is null;
  
    update trxsinidentificar t
       set t.concesionariozon = (select m.idconcesionario
                                   from municipio m
                                  where m.idmunicipio = t.idmunicipio)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.idmunicipio is not null;
  
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
    r               mvtoBancafe_temp%rowtype;
    linea           varchar2(1000);
  
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
  
    v_periodo := Substr(v_nombreArchivo, 1, 6);
  
    select count(*)
      into v_registros
      from mvtoBancafe
     where numerocuenta = v_cuenta
       and periodo = v_periodo;
  
    if (v_registros > 0) then
      delete from mvtoBancafe
       where numerocuenta = v_cuenta
         and periodo = v_periodo;
    
      select count(*)
        into v_registros
        from trxsinidentificar
       where cuenta = v_cuenta
         and periodo = v_periodo;
    
      if (v_registros > 0) then
      
        delete from trxsinidentificar
         where cuenta = v_cuenta
           and periodo = v_periodo;
      
      end if;
    
      --p_error :='Extracto de cuenta ' || v_cuenta || ' del periodo ' || v_periodo || ' ya cargado. Solicitar reproceso' ;
      --return;
    end if;
  
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
       tipotrx)
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
             tipotrx
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
       observaciones)
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
             referencia1 || referencia2
        from mvtobancafe
       where numerocuenta = v_cuenta
         and periodo = v_periodo
         and descripciontrx in
             (select concepto from conceptosidentificar where idbanco = '50');
  
    update trxsinidentificar t
       set t.idmunicipio = (select m.idmunicipio
                              from municipio m, mvtobancafe b
                             where t.numerotrx = b.numerotrx
                               and instr(b.descripciontrx,
                                         'CONSIGNACION CONVENIO') > 0
                               and substr(b.referencia2, 22, 3) = '000'
                               and m.idmunicipio =
                                   substr(b.referencia2, 17, 8))
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo;
  
    update trxsinidentificar t
       set t.idmunicipio = (select min(m.idmunicipio)
                              from municipio m, mvtobancafe b
                             where t.numerotrx = b.numerotrx
                               and instr(b.descripciontrx,
                                         'CONSIGNACION CONVENIO') > 0
                               and substr(b.referencia2, 22, 3) <> '000'
                               and instr(m.idmunicipio,
                                         substr(b.referencia2, 20, 5)) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.idmunicipio is null;
  
    update trxsinidentificar t
       set t.idmunicipio = (select min(m.idmunicipio)
                              from municipio m, mvtobancafe b
                             where t.numerotrx = b.numerotrx
                               and instr(b.descripciontrx,
                                         'CONSIGNACION CONVENIO') > 0
                               and instr(m.nit_m,
                                         substr(b.referencia1, 16, 9)) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.idmunicipio is null;
  
    update trxsinidentificar t
       set t.idmunicipio = (select min(m.idmunicipio)
                              from municipio m, mvtobancafe b
                             where t.numerotrx = b.numerotrx
                               and instr(b.descripciontrx,
                                         'CONSIGNACION CONVENIO') > 0
                               and instr(m.nit_m,
                                         substr(b.referencia1, 15, 9)) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.idmunicipio is null;
  
    update trxsinidentificar t
       set t.idmunicipio = (select min(m.idmunicipio)
                              from municipio m, mvtobancafe b
                             where t.numerotrx = b.numerotrx
                               and instr(b.descripciontrx,
                                         'CONSIGNACION CONVENIO') > 0
                               and instr(m.nit_cta,
                                         substr(b.referencia1, 16, 9)) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.idmunicipio is null;
  
    update trxsinidentificar t
       set t.idmunicipio = (select min(m.idmunicipio)
                              from municipio m, mvtobancafe b
                             where t.numerotrx = b.numerotrx
                               and instr(b.descripciontrx,
                                         'CONSIGNACION CONVENIO') > 0
                               and instr(m.nit_cta,
                                         substr(b.referencia1, 15, 9)) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.idmunicipio is null;
  
    update trxsinidentificar t
       set t.idmunicipio = (select min(idmunicipio)
                              from oficinabanco o
                             where o.idbanco = '50'
                               and instr(t.oficinaorigen, o.nombre) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.idmunicipio is null;
  
    update trxsinidentificar t
       set t.idmunicipio = (select min(idmunicipio)
                              from oficinabanco o
                             where o.idbanco = '50'
                               and instr(o.nombre, t.oficinaorigen) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.idmunicipio is null;
  
    update trxsinidentificar t
       set t.concesionariozon = (select m.idconcesionario
                                   from municipio m
                                  where m.idmunicipio = t.idmunicipio)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.idmunicipio is not null;
  
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
    r               mvtoDavivienda_temp%rowtype;
    linea           varchar2(1000);
  
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
  
    v_periodo := Substr(v_nombreArchivo, 1, 6);
  
    select count(*)
      into v_registros
      from mvtoDavivienda
     where numerocuenta = v_cuenta
       and periodo = v_periodo;
  
    if (v_registros > 0) then
      delete from mvtoDavivienda
       where numerocuenta = v_cuenta
         and periodo = v_periodo;
    
      select count(*)
        into v_registros
        from trxsinidentificar
       where cuenta = v_cuenta
         and periodo = v_periodo;
    
      if (v_registros > 0) then
      
        delete from trxsinidentificar
         where cuenta = v_cuenta
           and periodo = v_periodo;
      
      end if;
    
      --p_error :='Extracto de cuenta ' || v_cuenta || ' del periodo ' || v_periodo || ' ya cargado. Solicitar reproceso' ;
      --return;
    end if;
  
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
       numerotrx)
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
             seq_mvto.nextval
        from mvtodavivienda_temp;
  
    update mvtodavivienda m
       set m.nombreTipo = (select t.descripcion
                             from tipoMvto t
                            where t.tipo = m.tipo)
     where m.numerocuenta = v_cuenta
       and m.periodo = v_periodo;
  
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
       observaciones)
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
             referencia1 || referencia2
        from mvtoDavivienda
       where numerocuenta = v_cuenta
         and periodo = v_periodo
         and tipo in ('0034', '0035', '0036', '0039');
  
    update trxsinidentificar t
       set t.idmunicipio = (select m.idmunicipio
                              from municipio m, mvtoDavivienda b
                             where t.numerotrx = b.numerotrx
                               and m.idmunicipio =
                                   substr(b.referencia2, 9, 8))
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo;
  
    update trxsinidentificar t
       set t.idmunicipio = (select min(m.idmunicipio)
                              from municipio m, mvtobancafe b
                             where t.numerotrx = b.numerotrx
                               and instr(m.nit_m, substr(b.referencia1, 7, 9)) > 0)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.idmunicipio is null;
  
    update trxsinidentificar t
       set t.concesionariozon = (select m.idconcesionario
                                   from municipio m
                                  where m.idmunicipio = t.idmunicipio)
     where t.cuenta = v_cuenta
       and t.periodo = v_periodo
       and t.idmunicipio is not null;
  
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
      from mvtoavvillas
     where numerocuenta = v_cuenta
       and periodo = v_periodo
       and quincena = v_quincena;
  
    if (v_registros > 0) then
      delete from mvtoavvillas
       where numerocuenta = v_cuenta
         and periodo = v_periodo
         and quincena = v_quincena;
    
      select count(*)
        into v_registros
        from trxsinidentificar
       where cuenta = v_cuenta
         and periodo = v_periodo
         and quincena = v_quincena;
    
      if (v_registros > 0) then
      
        delete from trxsinidentificar
         where cuenta = v_cuenta
           and periodo = v_periodo
           and quincena = v_quincena;
      
      end if;
    
      commit;
    
      --p_error :='Extracto de cuenta ' || v_cuenta || ' del periodo ' || v_periodo || ' ya cargado. Solicitar reproceso' ;
      --return;
    end if;
  
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
       quincena)
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
             quincena
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
       quincena)
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
             quincena
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
           set concesionariozon = (select m.idconcesionario
                                     from municipio m
                                    where m.idmunicipio = v_idMunicipio)
         where numsecuenciareg = registro.numsecuenciareg;
      
      end if;
    
    end loop;
  
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
  v_i number;
  v_error number;
    
   CURSOR tabla IS
      select concesionario, estado, periodo, cuenta, municipioprop, divipoprop, tipoprop, porcentajeprop, divipoasig, municipioasig, tipoasig, porcentajeasig, valortrn, banco, cuentatrn, periodotrn, fechatrn, descripciontrn, oficinatrn, secuenciatrn from idemasivo_temp;
      
         
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
          r.concesionario    := campo(1);
          r.estado    := campo(2);
          r.periodo    := campo(3);
          r.cuenta    := campo(4);
          r.municipioprop    := campo(5);
      
          if (substr(campo(6),1,1) = '''' ) then
             r.divipoprop    := substr(campo(6),2,8);
          else
              r.divipoprop    := campo(6);
          end if;
      
          if (substr(campo(6),1,1) = '''' ) then
             r.divipoasig    := substr(campo(6),2,8);
          else
              r.divipoasig    := campo(6);
          end if;
      
          r.tipoprop    := campo(8);
          r.tipoasig    := campo(8);
          
          r.porcentajeprop    := to_number(campo(9),'99.99');
          r.porcentajeasig    := to_number(campo(9),'99.99');
          
          r.valortrn    := campo(10);
          r.banco    := campo(11);
          r.cuentatrn    := campo(12);
          r.periodotrn    := campo(13);
          r.fechatrn    := campo(14);
          r.descripciontrn    := campo(15);
          r.oficinatrn    := campo(16);
          r.secuenciatrn    := to_number(campo(17));
          
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
    v_i := 1;
    v_error := 0;
    
    for registro in (select * from idemasivo_temp) loop
      v_aplicar := 1;
      
      if ( not upper(registro.tipoasig)  = 'POLCA' and
           not upper(registro.tipoasig)  = 'SIMIT' ) then
           v_aplicar := 0;
           v_mensaje := 'Tipo comparendo errado en registro ' || to_char(v_i);
           v_error := 1;
      end if;
      
      if (not registro.porcentajeasig = 10 and
          not registro.porcentajeasig = 45 and
          not registro.porcentajeasig = 55 ) then
          v_aplicar := 0;
          v_mensaje := 'Porcentaje consignacion errado en registro ' || to_char(v_i);
           v_error := 1;
      end if;
      
      if ( upper(registro.tipoasig)  = 'SIMIT' and registro.porcentajeasig > 10 ) then
         v_aplicar := 0;
         v_mensaje := 'Porcentaje SIMIT errado en registro ' || to_char(v_i);
           v_error := 1;
      end if;
      
      select count(*)
      into v_numreg 
      from municipio m
      where m.idmunicipio = registro.divipoasig
      and m.idmunicipio <> '00000000';
      
      if (v_numreg = 0 ) then
         v_aplicar := 0;
         v_mensaje := 'Municipio errado en registro ' || to_char(v_i);
           v_error := 1;
      end if;
      
      select count(*) 
      into v_numreg
      from  trxsinidentificar t
      where t.numsecuenciareg = registro.secuenciatrn;
      
      if (v_numreg = 0 ) then
         v_aplicar := 0;
          v_mensaje := 'Transaccion identificada no existe, registro ' || to_char(v_i);
           v_error := 1;
      end if;
        
     v_i := v_i + 1;
            
    end loop;

    if (v_error = 1 ) then
       p_error := 'Archivo con inconsistencias. No se aplica ningun registro. ' || v_mensaje;
    else   
 
    for registro in (select * from idemasivo_temp) loop
         
         update trxsinidentificar t
         set t.indtipoiden = registro.tipoasig,
         t.idmunicipioiden = registro.divipoasig,
         t.p_consignadoiden = registro.porcentajeasig,
         t.observaciones = 'IDENTIFICADO MASIVAMENTE',
         t.estadoiden = 'ID',
         t.fechaidentificacion = sysdate,
         t.usuarioidentificacion =to_number( p_usuario )
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
        p_error := 'Error en parametrizaci�n (d�as activaci�n)';
        return;
      ELSE
        min_fecha_act := fn_fec_dispersion(to_date(to_char(sysdate,
                                                           'yyyy-mm-dd'),
                                                   'yyyy-mm-dd'),
                                           m_dias_activacion,
                                           0,
                                           '99999999');
        IF min_fecha_act > w_fecha_act then
          p_error := 'Fecha Activaci�n Inv�lida';
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
                               asunto      => 'Notificaci�n de Novedad de Municipio:  ' ||
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
                               asunto      => 'Notificaci�n de Novedad de Municipio:  ' ||
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
                               asunto      => 'Notificaci�n de Novedad de Municipio:  ' ||
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
                               asunto      => 'Notificaci�n de Novedad de Municipio:  ' ||
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
                               asunto      => 'Notificaci�n de ANULACION Novedad de Municipio:  ' ||
                                              p_tiponov || '-' ||
                                              p_numeronov,
                               mensaje     => 'Se ha ANULADO una novedad financiera de municipio. Por favor verificar informacion. NUMERO NOVEDAD ' ||
                                              p_tiponov || '-' ||
                                              p_numeronov ||
                                              ' . Muchas gracias',
                               p_usuario   => p_usuario);
        
        END IF;
      
        p_error := 'Actualizaci�n Exitosa';
      
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
        p_error := 'Error en parametrizaci�n (d�as activaci�n)';
        return;
      ELSE
        min_fecha_act := fn_fec_dispersion(sysdate,
                                           m_dias_activacion,
                                           0,
                                           '99999999');
        IF min_fecha_act > w_fecha_act then
          p_error := 'Fecha Activaci�n Inv�lida';
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
                               asunto      => 'Notificaci�n de Novedad de Municipio:  ' ||
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
      p_error := 'Error en parametrizaci�n (d�as activaci�n)';
      return;
    ELSE
      min_fecha_act := fn_fec_dispersion(sysdate,
                                         m_dias_activacion,
                                         0,
                                         '99999999');
      IF min_fecha_act > w_fecha_act then
        p_error := 'Fecha Activaci�n Inv�lida';
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
                             asunto      => 'Notificaci�n de Novedad Tercero:  ' ||
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
        p_error := 'Actualizaci�n Exitosa';
      
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
      p_error := 'Error en parametrizaci�n (d�as activaci�n)';
      return;
    ELSE
      min_fecha_act := fn_fec_dispersion(sysdate,
                                         m_dias_activacion,
                                         0,
                                         '99999999');
      IF min_fecha_act > w_fecha_act then
        p_error := 'Fecha Activaci�n Inv�lida';
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
                             asunto      => 'Notificaci�n de Novedad Dias de Dispersion Municipio:  ' ||
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
        p_error := 'Actualizaci�n Exitosa';
      
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
      p_error := 'Error en parametrizaci�n (d�as activaci�n)';
      return;
    ELSE
      min_fecha_act := fn_fec_dispersion(sysdate,
                                         m_dias_activacion,
                                         0,
                                         '99999999');
      IF min_fecha_act > w_fecha_act then
        p_error := 'Fecha Activaci�n Inv�lida';
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
        p_error := 'Actualizaci�n Exitosa';
      
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
  
    if p_tipo = 'L' then
      begin
      
        descTipo := 'REPROCESO DISTRIBUCION RECAUDO LOCAL';
      
        delete recaudo_local_causacion where fec_corte_ini = w_fec_cor_ini;
      
        delete recaudo_local_disp where fec_corte = w_fec_cor_ini;
      
        delete recaudo_local_liquidacion where fec_corte = w_fec_cor_ini;
      
        update trxsinidentificar
           set fechaliq = null
         where estadoiden = 'ID'
           and fechaliq = w_fec_cor_ini;
      
      end;
    end if;
  
    if p_tipo = 'T' then
      begin
      
        descTipo := 'REPROCESO TRANFERENCIA RECAUDO EXTERNO';
      
        DELETE recaudo_externo_disp_tot
         where fec_dispersion = w_fec_cor_ini;
        
        update novdevolucion
         set (fechaaplicacion, estadonov) = (select null, 'VALIDADA'
                                             from dual)
       where estadonov = 'ACTIVADA'
       and fechaaplicacion = w_fec_cor_ini;
       
        update novdevolucion
           set fechacobro = null
        where  fechacobro = w_fec_cor_ini;
     
        update novdevolucion
           set fechacobro2 = null
        where  fechacobro2 = w_fec_cor_ini;
        
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
  
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');
  
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
    
  
    sp_liquida_recaudo_local(w_fec_cor_ini,
                             w_fec_cor_fin,
                             p_banco,
                             p_usuario,
                             p_error);
  
    IF not P_ERROR is null THEN
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
  
  BEGIN
  
    delete recaudo_local_liquidacion
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
       p_consignado)
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
             p_consignado
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
       p_consignado)
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
             'AJU',
             p_consignado
        from recaudo_local_ajustes
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
       idrecaudolocal_liquidacion)
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
             numsecuenciareg
        from trxsinidentificar
       where estadoiden = 'ID'
         and fechaliq is null
         and idmunicipioiden <> '00000001'
         and decode(idbanco, '52', '52', '99') = p_banco;
         
    update recaudo_local_liquidacion
    set idrecaudolocal_liquidacion = idrecaudo_local_liquidacion   
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and decode(idbanco, '52', '52', '99') = p_banco
       and idrecaudolocal_liquidacion is null;      
  
    update recaudo_local_liquidacion l
       set (l.idconcesionario, l.ind_proceso) = (select m.idconcesionario,
                                                        m.indliq_s_local
                                                   from municipio m
                                                  where m.idmunicipio =
                                                        l.idmunicipio)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and l.indtipo = 'SIMIT'
       and decode(idbanco, '52', '52', '99') = p_banco;
  
    update recaudo_local_liquidacion l
       set (l.idconcesionario, l.ind_proceso) = (select m.idconcesionario,
                                                        m.indliq_p_local
                                                 
                                                   from municipio m
                                                  where m.idmunicipio =
                                                        l.idmunicipio)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and l.indtipo = 'POLCA'
       and decode(idbanco, '52', '52', '99') = p_banco;
  
    /* Se elimina porq no se requiere esta validacion para reacaudo local 09/12/15 20:00*/
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
       set (l.dias_dispersion, l.frec_dispersion) = (select dd.dias_dispersion_sl,
                                                            dd.frec_dispersion_sl
                                                       from dias_dispersion dd
                                                      where dd.idmunicipio =
                                                            l.idmunicipio
                                                        and dd.idbanco =
                                                            l.idbanco)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and l.indtipo = 'SIMIT'
       and ind_proceso = 1
       and decode(idbanco, '52', '52', '99') = p_banco;
  
    update recaudo_local_liquidacion l
       set (l.dias_dispersion, l.frec_dispersion) = (select dd.dias_dispersion_pl,
                                                            dd.frec_dispersion_pl
                                                       from dias_dispersion dd
                                                      where dd.idmunicipio =
                                                            l.idmunicipio
                                                        and dd.idbanco =
                                                            l.idbanco)
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
  

-- calcula fecha dispersion avvillas 5 dia habil despues de la quincena
    update recaudo_local_liquidacion l
       set l.fec_dispersion = fn_fec_dispersion( fn_fec_dispersion(l.fec_corte,
                                                0,
                                                2,
                                                p_usuario),4,0,p_usuario )
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and decode(idbanco, '52', '52', '99') = p_banco 
       and idbanco = '52';
       
-- calcula fecha dispersion otros bancos a los 20 dias del mes
    update recaudo_local_liquidacion l
       set l.fec_dispersion = fn_fec_dispersion(to_date ( to_char(fn_fec_dispersion(l.fec_corte,0,3,p_usuario),'yyyymm') || '20','yyyymmdd'),
                                                0,
                                                0,
                                                p_usuario )
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and decode(idbanco, '52', '52', '99') = p_banco 
       and idbanco <> '52';
       


    update recaudo_local_liquidacion l
       set l.s_valor_0 = (select c.comision_recaudo * (1 + (fcm.iva / 100))
                            from cta_recaudo_fcm c, fcm
                           where l.idbanco = c.idbanco
                             and l.cta_recaudo = c.cuenta)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and decode(idbanco, '52', '52', '99') = p_banco;
  
    -- SIMIT
  
    update recaudo_local_liquidacion l
       set (l.s_valor_1, l.s_valor_2, l.s_valor_3, l.s_valor_4, l.s_valor_5) = (select l.valor_total *
                                                                                       (p.simit_s / 10),
                                                                                       l.valor_total *
                                                                                       (p.concesionario_s / 10),
                                                                                       l.valor_total *
                                                                                       (p.fondo_cob_concesionario_s / 10),
                                                                                       l.valor_total *
                                                                                       (p.fondo_cob_simit_s / 10),
                                                                                       l.valor_total *
                                                                                       (p.equilibrio_economico_s / 10)
                                                                                  from p_dispersion_concesionario p
                                                                                 where l.idconcesionario =
                                                                                       p.idconcesionario)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'SIMIT'
       and decode(idbanco, '52', '52', '99') = p_banco;
  
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
  
    -- ajustar decimales
    update recaudo_local_liquidacion l
       set l.s_valor_4 = l.valor_total - l.s_valor_1 - l.s_valor_2 -
                         l.s_valor_3
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'SIMIT'
       and l.s_valor_5 = 0
       and decode(idbanco, '52', '52', '99') = p_banco;
  
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
  
    -- POLCA
    update recaudo_local_liquidacion l
       set (l.p_valor_7, l.p_valor_8, l.p_valor_9, l.p_valor_10, l.p_valor_11, l.p_valor_12, l.p_valor_13, l.p_valor_14, l.p_valor_15, l.p_valor_16, l.p_valor_17, l.p_valor_18) = (select l.valor_total *
                                                                                                                                                                                           (p.simit_pm / 55),
                                                                                                                                                                                           l.valor_total *
                                                                                                                                                                                           (p.concesionario_pm / 55),
                                                                                                                                                                                           l.valor_total *
                                                                                                                                                                                           (p.fondo_cob_concesionario_pm / 55),
                                                                                                                                                                                           l.valor_total *
                                                                                                                                                                                           (p.fondo_cob_simit_pm / 55),
                                                                                                                                                                                           l.valor_total *
                                                                                                                                                                                           (p.equilibrio_economico_pm / 55),
                                                                                                                                                                                           l.valor_total *
                                                                                                                                                                                           (p.simit_pp / 55),
                                                                                                                                                                                           l.valor_total *
                                                                                                                                                                                           (p.sevial_pp / 55),
                                                                                                                                                                                           l.valor_total *
                                                                                                                                                                                           (p.equilibrio_economico_pp / 55),
                                                                                                                                                                                           l.valor_total *
                                                                                                                                                                                           (p.polca_cp / 55),
                                                                                                                                                                                           l.valor_total *
                                                                                                                                                                                           (p.fcm_cp / 55),
                                                                                                                                                                                           l.valor_total *
                                                                                                                                                                                           (p.sevial_cp / 55),
                                                                                                                                                                                           l.valor_total *
                                                                                                                                                                                           (p.equilibrio_economico_cp / 55)
                                                                                                                                                                                    
                                                                                                                                                                                      from p_dispersion_concesionario p,
                                                                                                                                                                                           fcm
                                                                                                                                                                                     where l.idconcesionario =
                                                                                                                                                                                           p.idconcesionario)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA'
       and decode(idbanco, '52', '52', '99') = p_banco;
  
    -- ajusta municipios que solo consignan el 10%
    update recaudo_local_liquidacion l
       set (l.p_valor_7, l.p_valor_8, l.p_valor_9, l.p_valor_10, l.p_valor_11, l.p_valor_12, l.p_valor_13, l.p_valor_14, l.p_valor_15, l.p_valor_16, l.p_valor_17, l.p_valor_18) = (select l.valor_total *
                                                                                                                                                                                           (p.simit_pm / 10),
                                                                                                                                                                                           l.valor_total *
                                                                                                                                                                                           (p.concesionario_pm / 10),
                                                                                                                                                                                           l.valor_total *
                                                                                                                                                                                           (p.fondo_cob_concesionario_pm / 10),
                                                                                                                                                                                           l.valor_total *
                                                                                                                                                                                           (p.fondo_cob_simit_pm / 10),
                                                                                                                                                                                           l.valor_total *
                                                                                                                                                                                           (p.equilibrio_economico_pm / 10),
                                                                                                                                                                                           l.valor_total *
                                                                                                                                                                                           (p.simit_pp / 10),
                                                                                                                                                                                           l.valor_total *
                                                                                                                                                                                           (p.sevial_pp / 10),
                                                                                                                                                                                           l.valor_total *
                                                                                                                                                                                           (p.equilibrio_economico_pp / 10),
                                                                                                                                                                                           0.0, --l.valor_total * (p.polca_cp / 55),
                                                                                                                                                                                           0.0, -- l.valor_total *(p.fcm_cp / 55),
                                                                                                                                                                                           0.0, -- l.valor_total *(p.sevial_cp / 55),
                                                                                                                                                                                           0.0 --l.valor_total * (p.equilibrio_economico_cp / 55)
                                                                                                                                                                                      from p_dispersion_concesionario p,
                                                                                                                                                                                           fcm
                                                                                                                                                                                     where l.idconcesionario =
                                                                                                                                                                                           p.idconcesionario)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and p_consignado = 10
       and l.indtipo = 'POLCA'
       and decode(idbanco, '52', '52', '99') = p_banco;
  
    -- ajusta municipios que solo consignan el 45%
    update recaudo_local_liquidacion l
       set (l.p_valor_7, l.p_valor_8, l.p_valor_9, l.p_valor_10, l.p_valor_11, l.p_valor_12, l.p_valor_13, l.p_valor_14, l.p_valor_15, l.p_valor_16, l.p_valor_17, l.p_valor_18) = (select 0.0, -- l.valor_total * (p.simit_pm / 10),
                                                                                                                                                                                           0.0, -- l.valor_total *(p.concesionario_pm / 10) ,
                                                                                                                                                                                           0.0, -- l.valor_total *(p.fondo_cob_concesionario_pm / 10),
                                                                                                                                                                                           0.0, -- l.valor_total *(p.fondo_cob_simit_pm / 10),
                                                                                                                                                                                           0.0, -- l.valor_total *(p.equilibrio_economico_pm / 10),
                                                                                                                                                                                           0.0, -- l.valor_total * (p.simit_pp / 10),
                                                                                                                                                                                           0.0, -- l.valor_total *(p.sevial_pp / 10),
                                                                                                                                                                                           0.0, -- l.valor_total * (p.equilibrio_economico_pp / 10),
                                                                                                                                                                                           l.valor_total *
                                                                                                                                                                                           (p.polca_cp / 45),
                                                                                                                                                                                           l.valor_total *
                                                                                                                                                                                           (p.fcm_cp / 45),
                                                                                                                                                                                           l.valor_total *
                                                                                                                                                                                           (p.sevial_cp / 45),
                                                                                                                                                                                           l.valor_total *
                                                                                                                                                                                           (p.equilibrio_economico_cp / 45)
                                                                                                                                                                                      from p_dispersion_concesionario p,
                                                                                                                                                                                           fcm
                                                                                                                                                                                     where l.idconcesionario =
                                                                                                                                                                                           p.idconcesionario)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and p_consignado = 45
       and l.indtipo = 'POLCA'
       and decode(idbanco, '52', '52', '99') = p_banco;
  
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
  
    update recaudo_local_liquidacion l
       set l.p_valor_9 = l.valor_total - l.p_valor_7 - l.p_valor_8 -
                         l.p_valor_10 - l.p_valor_11 - l.p_valor_12 -
                         l.p_valor_13 - l.p_valor_14 - l.p_valor_15 -
                         l.p_valor_16 - l.p_valor_17 - l.p_valor_18
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA'
       and decode(idbanco, '52', '52', '99') = p_banco;
  
    update recaudo_local_liquidacion l
       set l.p_valor_10 = ROUND((l.p_valor_9 + l.p_valor_10) / 2, 2)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA'
       and decode(idbanco, '52', '52', '99') = p_banco;
  
    update recaudo_local_liquidacion l
       set l.p_valor_9 = l.valor_total - l.p_valor_7 - l.p_valor_8 -
                         l.p_valor_10 - l.p_valor_11 - l.p_valor_12 -
                         l.p_valor_13 - l.p_valor_14 - l.p_valor_15 -
                         l.p_valor_16 - l.p_valor_17 - l.p_valor_18
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA'
       and decode(idbanco, '52', '52', '99') = p_banco;
  
    update recaudo_local_liquidacion l
       set (l.p_valor_19, l.p_valor_20, l.p_valor_21, l.p_valor_22, l.p_valor_23) = (select l.p_valor_16 *
                                                                                            (fcm.iva / 100),
                                                                                            l.p_valor_17 *
                                                                                            (fcm.iva / 100),
                                                                                            l.p_valor_17 *
                                                                                            (fcm.retencion_fuente / 100),
                                                                                            l.p_valor_17 *
                                                                                            (fcm.impuesto_timbre_tercero / 100),
                                                                                            (l.p_valor_16 +
                                                                                            l.p_valor_17 +
                                                                                            l.p_valor_18) *
                                                                                            (fcm.impuesto_timbre_fcm / 100)
                                                                                       from fcm)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA'
       and decode(idbanco, '52', '52', '99') = p_banco;
  
    -- caluclar netos
    update recaudo_local_liquidacion l
       set l.p_valor_24 = l.p_valor_13 + l.p_valor_17 + l.p_valor_20 -
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
  
    update recaudo_local_liquidacion l
       set l.p_valor_9 = l.valor_total - l.p_valor_27 - l.p_valor_10 -
                         l.p_valor_25 - l.p_valor_13 - l.p_valor_17 -
                         l.p_valor_20 - l.p_valor_16 - l.p_valor_19 -
                         l.p_valor_15
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA'
       and decode(idbanco, '52', '52', '99') = p_banco;
  
    update recaudo_local_liquidacion l
       set l.p_valor_10 = ROUND((l.p_valor_9 + l.p_valor_10) / 2, 2)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA'
       and decode(idbanco, '52', '52', '99') = p_banco;
  
    update recaudo_local_liquidacion l
       set l.p_valor_9 = l.valor_total - l.p_valor_27 - l.p_valor_10 -
                         l.p_valor_25 - l.p_valor_13 - l.p_valor_17 -
                         l.p_valor_20 - l.p_valor_16 - l.p_valor_19 -
                         l.p_valor_15
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA'
       and decode(idbanco, '52', '52', '99') = p_banco;
  
    -- actualizar diferencias en el Fon Cobertura de 0.02 para ajustar
    update recaudo_local_liquidacion l
       set l.s_valor_3 = l.s_valor_3 - 0.01,
           l.s_valor_4 = l.s_valor_4 + 0.01
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and (l.s_valor_3 - l.s_valor_4) = 0.02
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
       set l.nit_concesionario = (select nit_c
                                    from cta_dispersion_concesionario c
                                   where c.idconcesionario =
                                         l.idconcesionario
                                     and c.idconcepto = 1
                                     and c.idbancorec = l.idbanco)
   where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and decode(idbanco, '52', '52', '99') = p_banco;
  
    -- actualiza nit fondo cobertura concesioanrio
    update recaudo_local_liquidacion l
       set l.nit_fondo = (select nit_c
                            from cta_dispersion_concesionario c
                           where c.idconcesionario = l.idconcesionario
                             and c.idconcepto = 2
                             and c.idbancorec = l.idbanco)
  where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and decode(idbanco, '52', '52', '99') = p_banco;
  

    update trxsinidentificar
       set fechaliq = p_fec_fin
     where estadoiden = 'ID'
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
        FROM quipux.recaudo_det_proyecta a, quipux.recaudo_proyecta b
       where a.id_procedencia_pago in ('2', '11')
         and a.consecutivo_recaudo = b.consecutivo_recaudo
         and b.cod_banco in (50, 51, 52)
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
        FROM quipux.recaudo_det_proyecta a,
             quipux.recaudo_proyecta b,
             quipux.simit_carga_informacion c
       where a.id_procedencia_pago = '2'
         and a.consecutivo_recaudo = b.consecutivo_recaudo
         and b.cod_banco not in (50, 51, 52)
            /*and a.codigo_banco not in (50,52)*/
         and b.id_proceso_carga = c.id_proceso_carga
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
    
      return;
    
    END IF;
  
    -- FIN Ajuste Hugo C 10/10/13
  
    -- actualiza cuenta de avvillas para completar dato�  update recaudo_externo
  
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
       set r.idbanco = (select max(c.idbanco)
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
  
    -- actualiza validador si esta vacio
    update recaudo_externo
       set validador_fecha = '000'
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and validador_fecha is null;
  
    -- actualiza validador si esta vacio
    update recaudo_externo
       set indfecha2002 = '0'
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indfecha2002 is null;
  
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
  
    w_fecha := w_fec_cor_ini;
    while (w_fecha <= w_fec_cor_fin) loop
      sp_paralelo_temp(p_fecha => w_fecha);
      w_fecha := w_fecha + 1;
    end loop;
  
    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_externo
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;
    commit;
  
    p_error := 'Recaudo Externo Cargado exitosamente. Registros: ' ||
               w_registros;
  
    sp_log(p_usuario,
           'Carga Recaudo Externo',
           p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
           p_feccor_ini_dia || '-' || p_feccor_fin_ano || '-' ||
           p_feccor_fin_mes || '-' || p_feccor_fin_dia);
  
    commit;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [carga_recaudo_externo] ' || SQLERRM,
            p_error);
    
  END carga_recaudo_externo;

  PROCEDURE transferir_recaudo_externo(p_fec_ini_ano number,
                                       p_fec_ini_mes number,
                                       p_fec_ini_dia number,
                                       p_usuario     varchar2,
                                       p_error       OUT VARCHAR2) as
  
    w_fec_trf_ini date;
    w_registros   number;
    p_ajuste      number;
  
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
      p_error := 'PROCESO NO EJECUTADO. PROCESO YA TRANSFERIDO. SOLICITAR AUTORIZACION';
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
    
    PK_CONTA_EXT.contabiliza_pago_externo(p_fec_ini_ano,
                             p_fec_ini_mes,
                             p_fec_ini_dia,
                             p_usuario,
                             p_error);

    -- inserta reeenvios de devoluciones ach aprobadas
    insert into recaudo_externo_disp_tot
       (fec_corte_ini, fec_corte_fin, fec_dispersion, id_concesionario_liq, orden, concepto, ori_idbanco, ori_tipocuenta, ori_cuenta, ori_nit, des_idbanco, des_tipocuenta, des_cuenta, des_nit, indtipo, usuario_proceso, fecha_proceso, valor, deb_cta_con, deb_cen_cos, deb_nit_ter, cre_cta_con, cre_cen_cos, cre_nit_ter, concepto_con, id_concesionario_pro, idmunicipio, enviadobanco, referenciatrf, estadotrf, fechaenvio, fechaconfirmada, fechadevolucion, motivodevolucion, codigodevolucion, fechaenvioach, vlrdisp, fechareenvio, indreenvio, des_idbancorev, des_tipocuentarev, des_cuentarev, des_nitrev, referenciatrfori)
    select w_fec_trf_ini, w_fec_trf_ini, w_fec_trf_ini, id_concesionario_liq, orden, 'REENV-' || concepto , ori_idbanco, ori_tipocuenta, ori_cuenta, ori_nit, des_idbancorev, des_tipocuentarev, des_cuentarev, des_nitrev, indtipo, p_usuario, sysdate, valor, deb_cta_con, deb_cen_cos, deb_nit_ter, cre_cta_con, cre_cen_cos, cre_nit_ter, concepto_con, id_concesionario_pro, idmunicipio, 0, seq_transferencia.nextval, '', null, null, null, '', '', null, valor, null, '', '', '', '', '', referenciatrf from recaudo_externo_disp_tot
    where indreenvio = 'S'
    and FECHAACTREEENVIO = w_fec_trf_ini
    and fechareenvio is null;
    
    commit;

    -- contabiliza reeenvios de devoluciones ach
    pk_devolach.contabiliza_reenvio_ach(p_fec_ini_ano,
                             p_fec_ini_mes,
                             p_fec_ini_dia,
                             p_usuario,
                             p_error);
    
    
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
  
   PK_NOVDEV.contabiliza_devolucion_externo(p_fec_ini_ano,
                                p_fec_ini_mes,
                                p_fec_ini_dia,
                                p_usuario,
                                p_error);
  
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
  
  BEGIN
  
    -- VALIDACIONES
    if (not p_usuario = '99999999') THEN
      sp_v_usuario(p_usuario, p_error, 'pk_proc');
      IF not P_ERROR is null THEN
        return;
      END IF;
    END IF;
  
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
  
    IF w_registros > 0 THEN
      p_error := 'PROCESO NO EJECUTADO. PROCESO YA LIQUIDADO. SOLICITAR AUTORIZACION';
      RETURN;
    END IF;
  
    -- obtiene cantidad de registros actualizados
    /*
    select count(*)
      into w_registros
      from recaudo_externo_disp_tot
     where fec_dispersion > w_fec_cor_ini;
    
    IF w_registros > 0 THEN
      p_error := 'SE HA REALIZADO YA UN PROCESO DE TRANSFERENCIA SUPERIOR A LA FECHA DE LIQUIDACION. SOLICITAR APROBACION ';
      RETURN;
    END IF;
    
    */
  
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
       por_base_ter4)
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
             0 --por_base_ter4
        from recaudo_externo
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin;
  
    -- obtiene concsionario propietario, indicador de proceso y retroactividad
    update recaudo_externo_liquidacion a
       set (a.id_concesionario_pro, a.ind_proceso, a.indretroactividad) = (select m.idconcesionario,
                                                                                  (case
                                                                                    when a.indtipo =
                                                                                         'SIMIT' then
                                                                                     m.indliq_s_ext
                                                                                    else
                                                                                     m.indliq_p_ext
                                                                                  end),
                                                                                  m.indretroactividad
                                                                             from municipio m
                                                                            where m.idmunicipio =
                                                                                  a.idmunicipio)
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
  
    -- actualizar informacion de tercero 1
    update recaudo_externo_liquidacion a
       set (ind_base_ter1, por_base_ter1, nom_ter1) = (select ind_base,
                                                              (case
                                                                when a.indtipo =
                                                                     'SIMIT' then
                                                                 base_s
                                                                else
                                                                 base_p
                                                              end),
                                                              nombre
                                                         from tercero t
                                                        where a.idmunicipio =
                                                              t.idmunicipio
                                                          and num_tercero = 1)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin;
  
    -- actualizar informacion de tercero 2
    update recaudo_externo_liquidacion a
       set (ind_base_ter2, por_base_ter2, nom_ter2) = (select ind_base,
                                                              (case
                                                                when a.indtipo =
                                                                     'SIMIT' then
                                                                 base_s
                                                                else
                                                                 base_p
                                                              end),
                                                              nombre
                                                         from tercero t
                                                        where a.idmunicipio =
                                                              t.idmunicipio
                                                          and num_tercero = 2)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin;
  
    -- actualizar informacion de tercero 3
  
    update recaudo_externo_liquidacion a
       set (ind_base_ter3, por_base_ter3, nom_ter3) = (select ind_base,
                                                              (case
                                                                when a.indtipo =
                                                                     'SIMIT' then
                                                                 base_s
                                                                else
                                                                 base_p
                                                              end),
                                                              nombre
                                                         from tercero t
                                                        where a.idmunicipio =
                                                              t.idmunicipio
                                                          and num_tercero = 3)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin;
  
    -- actualizar informacion de tercero 4
  
    update recaudo_externo_liquidacion a
       set (ind_base_ter4, por_base_ter4, nom_ter4) = (select ind_base,
                                                              (case
                                                                when a.indtipo =
                                                                     'SIMIT' then
                                                                 base_s
                                                                else
                                                                 base_p
                                                              end),
                                                              nombre
                                                         from tercero t
                                                        where a.idmunicipio =
                                                              t.idmunicipio
                                                          and num_tercero = 4)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin;
  
    -- verificar datos vacios de terceros
    update recaudo_externo_liquidacion a
       set (a.ind_base_ter1, a.por_base_ter1, a.nom_ter1) = (select 0, 0, ''
                                                               from dual)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin
       and a.ind_proceso = 1
       and a.ind_base_ter1 is null;
  
    update recaudo_externo_liquidacion a
       set (a.ind_base_ter2, a.por_base_ter2, a.nom_ter2) = (select 0, 0, ''
                                                               from dual)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin
       and a.ind_proceso = 1
       and a.ind_base_ter2 is null;
  
    update recaudo_externo_liquidacion a
       set (a.ind_base_ter3, a.por_base_ter3, a.nom_ter3) = (select 0, 0, ''
                                                               from dual)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin
       and a.ind_proceso = 1
       and a.ind_base_ter3 is null;
  
    update recaudo_externo_liquidacion a
       set (a.ind_base_ter4, a.por_base_ter4, a.nom_ter4) = (select 0, 0, ''
                                                               from dual)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin
       and a.ind_proceso = 1
       and a.ind_base_ter4 is null;
  
    -- obtiene fecha de dispersion
    update recaudo_externo_liquidacion l
       set (l.dias_dispersion, l.frec_dispersion) = (select (case
                                                              when l.indtipo =
                                                                   'SIMIT' then
                                                               dd.dias_dispersion_se
                                                              else
                                                               dd.dias_dispersion_pe
                                                            end),
                                                            (case
                                                              when l.indtipo =
                                                                   'SIMIT' then
                                                               dd.frec_dispersion_se
                                                              else
                                                               dd.frec_dispersion_pe
                                                            end)
                                                       from dias_dispersion dd
                                                      where dd.idmunicipio =
                                                            l.idmunicipio
                                                        and dd.idbanco =
                                                            l.idbanco)
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
       set smdlv = (select valor
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
  
    -- calcular comision de recaudo
    update recaudo_externo_liquidacion l
       set l.s_valor_0 = (select c.comision_recaudo
                            from cta_recaudo_concesionario c
                           where l.idbanco = c.idbanco
                             and l.indtipo = c.indtipo
                             and l.cta_recaudo = c.cuenta
                             and l.id_concesionario_liq = c.idconcesionario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1;
  
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
    
      delete recaudo_externo_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin;
    
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
           s_valor_2 = (valor_total - valor_adicional) / 10
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;
  
    -- ajustar simit base para cumplir ley
    update recaudo_externo_liquidacion l
       set s_valor_2 = (case when s_valor_2 < smdlv and s_valor_1 >= smdlv and indretroactividad = 0 then smdlv when s_valor_2 < smdlv and s_valor_1 < smdlv and indretroactividad = 0 then s_valor_1 when s_valor_2 < smdlv and s_valor_1 >= smdlv and indretroactividad = 1 and indfecha2002 = 0 then smdlv when s_valor_2 < smdlv and s_valor_1 < smdlv and indretroactividad = 1 and indfecha2002 = 0 then s_valor_1 else s_valor_2 end)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;
  
    -- calcular valor simit, concesionario liquidador, fondo concesionario, fondo simit, equilibrio, base ot
    update recaudo_externo_liquidacion l
       set (l.s_valor_3, l.s_valor_4, l.s_valor_5, l.s_valor_6, l.s_valor_7, l.s_valor_8) = (select l.s_valor_2 *
                                                                                                    (p.simit_s / 10),
                                                                                                    l.s_valor_2 *
                                                                                                    (p.concesionario_s / 10),
                                                                                                    l.s_valor_2 *
                                                                                                    (p.fondo_cob_concesionario_s / 10),
                                                                                                    l.s_valor_2 *
                                                                                                    (p.fondo_cob_simit_s / 10),
                                                                                                    l.s_valor_2 *
                                                                                                    (p.equilibrio_economico_s / 10),
                                                                                                    l.s_valor_1 -
                                                                                                    s_valor_2
                                                                                               from p_dispersion_concesionario p
                                                                                              where p.idconcesionario =
                                                                                                    l.id_concesionario_liq)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;
  
    -- calcular base contravencional
    update recaudo_externo_liquidacion l
       set (l.s_valor_9) = (select l.s_valor_8 *
                                   ((p.fcm_contravencional_s +
                                   p.conces_contravencional_s) / 100) / 0.9
                              from p_dispersion_municipio p
                             where p.idmunicipio = l.idmunicipio)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;
  
    update recaudo_externo_liquidacion l
       set (l.s_valor_9) = (select l.s_valor_8 *
                                   ((v.p_fcm_contravencional +
                                   v.p_conces_contravencional) / 100) / 0.9
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
       set (l.s_valor_11) = (select l.s_valor_8 *
                                    ((p.conces_contravencional_s) / 100) / 0.9
                               from p_dispersion_municipio p
                              where p.idmunicipio = l.idmunicipio)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;
  
    update recaudo_externo_liquidacion l
       set (l.s_valor_11) = (select l.s_valor_8 *
                                    ((v.p_conces_contravencional) / 100) / 0.9
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
       set (l.s_valor_10) = (select l.s_valor_8 * (p.acuerdopago_s / 100) / 0.9
                               from p_dispersion_municipio p
                              where p.idmunicipio = l.idmunicipio)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;
  
    update recaudo_externo_liquidacion l
       set (l.s_valor_10) = (select l.s_valor_8 * ((v.p_acuerdopago) / 100) / 0.9
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
       set (l.s_valor_13) = (l.s_valor_8 - l.s_valor_10 - l.s_valor_11 -
                            l.s_valor_12)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;
  
    -- calcula base municipio, iva contravencional, timbre contravencional, retefuente contravencional, reteiva contravencional
    -- este calculo si el valor del municipio es posible descontar el iva
  
    update recaudo_externo_liquidacion l
       set (l.s_valor_13, l.s_valor_14, l.s_valor_15, l.s_valor_16, l.s_valor_17, l.s_valor_30) = (select l.s_valor_8 -
                                                                                                          l.s_valor_10 -
                                                                                                          l.s_valor_11 -
                                                                                                          l.s_valor_12 -
                                                                                                          ((l.s_valor_11 +
                                                                                                          l.s_valor_12) *
                                                                                                          fcm.iva / 100),
                                                                                                          (l.s_valor_11 +
                                                                                                          l.s_valor_12) *
                                                                                                          (fcm.iva / 100),
                                                                                                          (l.s_valor_11 +
                                                                                                          l.s_valor_12) *
                                                                                                          (0 / 100), -- timbre contravencional en 0.0 debe ser fcm.timbre_contravencional
                                                                                                          (l.s_valor_11) *
                                                                                                          (fcm.retencion_fuente / 100),
                                                                                                          (l.s_valor_11 +
                                                                                                          l.s_valor_12) *
                                                                                                          (fcm.iva / 100) *
                                                                                                          (fcm.reteiva / 100), -- reteiva en 0%
                                                                                                          (l.s_valor_11) *
                                                                                                          (0 / 100) -- timbre contravencional concesionario en 0.0 debe ser fcm.impuesto_timbre_tercero
                                                                                                     from fcm) --- Registro Unico
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.s_valor_13 > 0
       and l.ind_proceso = 1;
  
    -- calcula base municipio, iva contravencional, timbre contravencional, retefuente contravencional, reteiva contravencional
    -- este calculo si el valor del municipio es 0, se descuenta iva del acuerdo de pago
  
    update recaudo_externo_liquidacion l
       set (l.s_valor_10, l.s_valor_14, l.s_valor_15, l.s_valor_16, l.s_valor_17, l.s_valor_30) = (select l.s_valor_10 -
                                                                                                          ((l.s_valor_11 +
                                                                                                          l.s_valor_12) *
                                                                                                          fcm.iva / 100),
                                                                                                          (l.s_valor_11 +
                                                                                                          l.s_valor_12) *
                                                                                                          (fcm.iva / 100),
                                                                                                          (l.s_valor_11 +
                                                                                                          l.s_valor_12) *
                                                                                                          (0 / 100), -- timbre contravencional en 0.0 debe ser fcm.timbre_contravencional
                                                                                                          (l.s_valor_11) *
                                                                                                          (fcm.retencion_fuente / 100),
                                                                                                          (l.s_valor_11 +
                                                                                                          l.s_valor_12) *
                                                                                                          (fcm.iva / 100) *
                                                                                                          (fcm.reteiva / 100), -- reteiva en 0%
                                                                                                          (l.s_valor_11) *
                                                                                                          (0 / 100) -- timbre contravencional concesionario en 0.0 debe ser fcm.impuesto_timbre_tercero
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
       set l.s_valor_18 = (case when ind_base_ter1 = 1 then s_valor_8 when ind_base_ter1 = 2 then valor_adicional when ind_base_ter1 = 3 then valor_total - valor_adicional when ind_base_ter1 = 4 then s_valor_13 else 0.0 end),
           l.s_valor_20 = (case when ind_base_ter2 = 1 then s_valor_8 when ind_base_ter2 = 2 then valor_adicional when ind_base_ter2 = 3 then valor_total - valor_adicional when ind_base_ter2 = 4 then s_valor_13 else 0.0 end),
           l.s_valor_22 = (case when ind_base_ter3 = 1 then s_valor_8 when ind_base_ter3 = 2 then valor_adicional when ind_base_ter3 = 3 then valor_total - valor_adicional when ind_base_ter3 = 4 then s_valor_13 else 0.0 end),
           l.s_valor_24 = (case when ind_base_ter1 = 1 then s_valor_8 when ind_base_ter3 = 2 then valor_adicional when ind_base_ter3 = 3 then valor_total - valor_adicional when ind_base_ter3 = 4 then s_valor_13 else 0.0 end)
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
       set (l.s_valor_13) = (select l.s_valor_8 - l.s_valor_10 - l.s_valor_11 -
                                    l.s_valor_12 -
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
       set l.s_valor_6 = (case when l.s_valor_7 = 0.0 then l.valor_total - l.s_valor_3 - l.s_valor_4 - l.s_valor_5 - l.s_valor_10 - l.s_valor_11 - l.s_valor_12 - l.s_valor_26 - l.s_valor_19 - l.s_valor_21 - l.s_valor_23 - l.s_valor_25 else l.s_valor_6 end),
           l.s_valor_7 = (case when l.s_valor_7 <> 0.0 then l.s_valor_1 - l.s_valor_3 - l.s_valor_4 - l.s_valor_5 - l.s_valor_8 else l.s_valor_7 end)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;
  
    ------------------------------------ POLCA -----------------------------------------------
    -- calcular simit base
    update recaudo_externo_liquidacion l
       set p_valor_1 = valor_total - valor_adicional,
           p_valor_2 = (valor_total - valor_adicional) / 10
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;
  
    -- ajustar simit base para cumplir ley
    update recaudo_externo_liquidacion l
       set p_valor_2 = (case when p_valor_2 < smdlv and p_valor_1 >= smdlv and indretroactividad = 0 then smdlv when p_valor_2 < smdlv and p_valor_1 < smdlv and indretroactividad = 0 then p_valor_1 when p_valor_2 < smdlv and p_valor_1 >= smdlv and indretroactividad = 1 and indfecha2002 = 0 then smdlv when p_valor_2 < smdlv and p_valor_1 < smdlv and indretroactividad = 1 and indfecha2002 = 0 then p_valor_1 else p_valor_2 end)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;
  
    -- calcular valor simit, concesionario liquidador, fondo concesionario, fondo simit, equilibrio,  valor simit, sevial, equilibrio, base polca, base ot
    update recaudo_externo_liquidacion l
       set (l.p_valor_3, l.p_valor_4, l.p_valor_5, l.p_valor_6, l.p_valor_7, l.p_valor_8, l.p_valor_9, l.p_valor_10, l.p_valor_11, l.p_valor_21) = (select l.p_valor_2 *
                                                                                                                                                           (p.simit_pm / 10),
                                                                                                                                                           l.p_valor_2 *
                                                                                                                                                           (p.concesionario_pm / 10),
                                                                                                                                                           l.p_valor_2 *
                                                                                                                                                           (p.fondo_cob_concesionario_pm / 10),
                                                                                                                                                           l.p_valor_2 *
                                                                                                                                                           (p.fondo_cob_simit_pm / 10),
                                                                                                                                                           l.p_valor_2 *
                                                                                                                                                           (p.equilibrio_economico_pm / 10),
                                                                                                                                                           l.p_valor_2 *
                                                                                                                                                           (p.simit_pp / 10),
                                                                                                                                                           l.p_valor_2 *
                                                                                                                                                           (p.sevial_pp / 10),
                                                                                                                                                           l.p_valor_2 *
                                                                                                                                                           (p.equilibrio_economico_pp / 10),
                                                                                                                                                           (l.p_valor_1 -
                                                                                                                                                           l.p_valor_2) / 2,
                                                                                                                                                           (l.p_valor_1 -
                                                                                                                                                           l.p_valor_2) / 2
                                                                                                                                                      from p_dispersion_concesionario p
                                                                                                                                                     where p.idconcesionario =
                                                                                                                                                           l.id_concesionario_liq)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;
  
    -- calcular valor polca, fcm polca, sevial polca y equilibrio polca
    update recaudo_externo_liquidacion l
       set (l.p_valor_12, l.p_valor_13, l.p_valor_14, l.p_valor_15) = (select l.p_valor_11 *
                                                                              (p.polca_cp / 45),
                                                                              l.p_valor_11 *
                                                                              (p.fcm_cp / 45),
                                                                              l.p_valor_11 *
                                                                              (p.sevial_cp / 45),
                                                                              l.p_valor_11 *
                                                                              (p.equilibrio_economico_cp / 45)
                                                                         from p_dispersion_concesionario p,
                                                                              fcm
                                                                        where p.idconcesionario =
                                                                              l.id_concesionario_liq)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;
  
    -- calcular impuestos por convenio polca
    update recaudo_externo_liquidacion l
       set (l.p_valor_16, l.p_valor_17, l.p_valor_18, l.p_valor_19, l.p_valor_20) = (select (l.p_valor_13 +
                                                                                            l.p_valor_15) *
                                                                                            fcm.iva / 100,
                                                                                            (l.p_valor_13 +
                                                                                            l.p_valor_14 +
                                                                                            l.p_valor_15) *
                                                                                            fcm.impuesto_timbre_fcm / 100,
                                                                                            l.p_valor_14 *
                                                                                            fcm.iva / 100,
                                                                                            l.p_valor_14 *
                                                                                            fcm.retencion_fuente / 100,
                                                                                            l.p_valor_14 *
                                                                                            fcm.impuesto_timbre_tercero / 100
                                                                                       from fcm)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;
  
    -- calcular VSevial27 con impuestos
    update recaudo_externo_liquidacion l
       set l.p_valor_14 = p_valor_14 - p_valor_20 - p_valor_19 + p_valor_18
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;
  
    -- actualizar Valor FCM con equilibrio pra simit capital
    update recaudo_externo_liquidacion l
       set l.p_valor_13 = l.p_valor_15
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.id_concesionario_liq = 5
       and l.ind_proceso = 1;
  
    -- calcular VFCM18 con impuestos
    update recaudo_externo_liquidacion l
       set l.p_valor_13 = p_valor_13 + p_valor_20 + p_valor_19 + p_valor_16
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;
  
    -- calcular base contravencional
  
    update recaudo_externo_liquidacion l
       set (l.p_valor_22) = (select l.p_valor_21 *
                                    ((p.fcm_contravencional_p +
                                    p.conces_contravencional_p) / 100) / 0.45
                               from p_dispersion_municipio P
                              where l.idmunicipio = p.idmunicipio)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.validador_fecha = '000'
       and l.ind_proceso = 1;
  
    update recaudo_externo_liquidacion l
       set (l.p_valor_22) = (select l.p_valor_21 *
                                    ((v.p_fcm_contravencional +
                                    v.p_conces_contravencional) / 100) / 0.45
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
       set (l.p_valor_24) = (select l.p_valor_21 *
                                    ((p.conces_contravencional_p) / 100) / 0.45
                               from p_dispersion_municipio p
                              where p.idmunicipio = l.idmunicipio)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;
  
    update recaudo_externo_liquidacion l
       set (l.p_valor_24) = (select l.p_valor_21 *
                                    ((v.p_conces_contravencional) / 100) / 0.45
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
       set (l.p_valor_23) = (select (l.p_valor_21) * (p.acuerdopago_p / 100) / 0.45
                               from p_dispersion_municipio p
                              where p.idmunicipio = l.idmunicipio)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;
  
    update recaudo_externo_liquidacion l
       set (l.p_valor_23) = (select (l.p_valor_21) * (v.p_acuerdopago / 100) / 0.45
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
       set (l.p_valor_26, l.p_valor_27, l.p_valor_28, l.p_valor_29, l.p_valor_30, p_valor_44) = (select l.p_valor_21 -
                                                                                                        l.p_valor_23 -
                                                                                                        l.p_valor_24 -
                                                                                                        l.p_valor_25 -
                                                                                                        ((l.p_valor_24 +
                                                                                                        l.p_valor_25) *
                                                                                                        fcm.iva / 100),
                                                                                                        
                                                                                                        (l.p_valor_24 +
                                                                                                        l.p_valor_25) *
                                                                                                        (fcm.iva / 100),
                                                                                                        
                                                                                                        (l.p_valor_24 +
                                                                                                        l.p_valor_25) *
                                                                                                        (0 / 100), -- timbre contravencional en 0.0 debe ser fcm.impuesto_timbre_fcm
                                                                                                        
                                                                                                        (l.p_valor_24) *
                                                                                                        (fcm.retencion_fuente / 100),
                                                                                                        
                                                                                                        (l.p_valor_24 +
                                                                                                        l.p_valor_25) *
                                                                                                        (fcm.iva / 100) *
                                                                                                        (fcm.reteiva / 100), -- reteiva 50%
                                                                                                        
                                                                                                        (l.p_valor_24) *
                                                                                                        (0 / 100) --timbre concesionario contravencional en 0 debe ser fcm.impuesto_timbre_tercero
                                                                                                 
                                                                                                   from fcm) --- Registro Unico
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.p_valor_26 > 0
       and l.ind_proceso = 1;
  
    -- calula base municipio, iva contravencional, timbre contravencional, retefuente contravencional, reteica contravencional
    -- esto si el valor del municipio es o, se descuenta impuestos de acuerdo
    update recaudo_externo_liquidacion l
       set (l.p_valor_23, l.p_valor_27, l.p_valor_28, l.p_valor_29, l.p_valor_30, p_valor_44) = (select l.p_valor_23 -
                                                                                                        ((l.p_valor_24 +
                                                                                                        l.p_valor_25) *
                                                                                                        fcm.iva / 100),
                                                                                                        
                                                                                                        (l.p_valor_24 +
                                                                                                        l.p_valor_25) *
                                                                                                        (fcm.iva / 100),
                                                                                                        
                                                                                                        (l.p_valor_24 +
                                                                                                        l.p_valor_25) *
                                                                                                        (0 / 100), -- timbre contravencional en 0.0 debe ser fcm.impuesto_timbre_fcm
                                                                                                        
                                                                                                        (l.p_valor_24) *
                                                                                                        (fcm.retencion_fuente / 100),
                                                                                                        
                                                                                                        (l.p_valor_24 +
                                                                                                        l.p_valor_25) *
                                                                                                        (fcm.iva / 100) *
                                                                                                        (fcm.reteiva / 100), -- reteiva 50%
                                                                                                        
                                                                                                        (l.p_valor_24) *
                                                                                                        (0 / 100) --timbre concesionario contravencional en 0 debe ser fcm.impuesto_timbre_tercero
                                                                                                 
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
       set l.p_valor_31 = (case when ind_base_ter1 = 1 then p_valor_21 when ind_base_ter1 = 2 then valor_adicional when ind_base_ter1 = 3 then valor_total - valor_adicional when ind_base_ter1 = 4 then p_valor_26 else 0.0 end),
           l.p_valor_33 = (case when ind_base_ter2 = 1 then p_valor_21 when ind_base_ter2 = 2 then valor_adicional when ind_base_ter2 = 3 then valor_total - valor_adicional when ind_base_ter2 = 4 then p_valor_26 else 0.0 end),
           l.p_valor_35 = (case when ind_base_ter3 = 1 then p_valor_21 when ind_base_ter3 = 2 then valor_adicional when ind_base_ter3 = 3 then valor_total - valor_adicional when ind_base_ter3 = 4 then p_valor_26 else 0.0 end),
           l.p_valor_37 = (case when ind_base_ter1 = 1 then p_valor_21 when ind_base_ter3 = 2 then valor_adicional when ind_base_ter3 = 3 then valor_total - valor_adicional when ind_base_ter3 = 4 then p_valor_26 else 0.0 end)
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
       set (l.p_valor_26) = (select l.p_valor_21 - l.p_valor_23 -
                                    l.p_valor_24 - l.p_valor_25 -
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
       set l.p_valor_39 = l.p_valor_26 - l.p_valor_32 - l.p_valor_34 -
                          l.p_valor_36 - l.p_valor_38 + l.p_valor_30 +
                          valor_adicional,
           l.p_valor_40 = l.p_valor_24 + l.p_valor_27 - l.p_valor_28 -
                          l.p_valor_29 - l.p_valor_30,
           l.p_valor_41 = l.p_valor_4 - l.s_valor_0,
           l.p_valor_42 = l.p_valor_25 + l.p_valor_28 + l.p_valor_29 +
                          l.p_valor_19 + l.p_valor_20 + l.p_valor_16 +
                          l.p_valor_13,
           l.p_valor_43 = l.p_valor_9 + l.p_valor_14 + l.p_valor_18 -
                          l.p_valor_19 - l.p_valor_20 - l.p_valor_16
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;
  
    -- ajusta decimales
    update recaudo_externo_liquidacion l
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
       and l.ind_proceso = 1;
  
    update recaudo_externo_liquidacion l
       set l.p_valor_13 = l.p_valor_1 + l.valor_adicional - l.p_valor_3 -
                          l.p_valor_4 - l.p_valor_5 - l.p_valor_6 -
                          l.p_valor_8 -
                          decode(l.id_concesionario_liq, 5, 0, l.p_valor_7) -
                          decode(l.id_concesionario_liq, 5, l.p_valor_7, 0) -
                          l.p_valor_9 - l.p_valor_10 - l.p_valor_14 -
                          l.p_valor_12 + l.p_valor_18 + l.p_valor_16 -
                          l.p_valor_24 - l.p_valor_25 - l.p_valor_23 -
                          l.p_valor_32 - l.p_valor_34 - l.p_valor_36 -
                          l.p_valor_39
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.p_valor_7 <> 0.0
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
       set (l.nit_municipio, l.idbancomun, l.tipocuentamun, l.ctamun) = (select m.nit_cta,
                                                                                m.idbanco,
                                                                                m.tipocuenta,
                                                                                m.cuenta
                                                                           from municipio m
                                                                          where m.idmunicipio =
                                                                                l.idmunicipio)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1;
  
    -- actualiza nit de metrotransito
    update recaudo_externo_liquidacion l
       set (l.nit_municipio, l.idbancomun, l.tipocuentamun, l.ctamun) = (select m.nit_cta,
                                                                                m.idbanco,
                                                                                m.tipocuenta,
                                                                                m.cuenta
                                                                           from municipio m
                                                                          where m.idmunicipio =
                                                                                '08001001')
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1
       and l.validador_fecha in ('001', '002', '003', '004')
       and l.idmunicipio = '08001000';
  
    -- actualiza nit de dpat atlantico
    update recaudo_externo_liquidacion l
       set (l.nit_municipio, l.idbancomun, l.tipocuentamun, l.ctamun) = (select m.nit_cta,
                                                                                m.idbanco,
                                                                                m.tipocuenta,
                                                                                m.cuenta
                                                                           from municipio m
                                                                          where m.idmunicipio =
                                                                                '08000000')
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1
       and l.validador_fecha in ('005', '006', '007', '008')
       and l.idmunicipio in ('08573000', '08296000');
  
    -- actualiza nit BANCO Concesionario
    update recaudo_externo_liquidacion l
       set l.nit_concesionario = (select nit_c
                                    from cta_dispersion_concesionario c
                                   where c.idconcesionario =
                                         l.id_concesionario_liq
                                     and c.idconcepto = 1
                                     and c.idbancorec = l.idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1;
  
    -- actualiza nit fondo cobertura concesioanrio
    update recaudo_externo_liquidacion l
       set l.nit_fondo = (select nit_c
                            from cta_dispersion_concesionario c
                           where c.idconcesionario = l.id_concesionario_liq
                             and c.idconcepto = 2
                             and c.idbancorec = l.idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1;
  
    -- actualiza nit contravencional
    update recaudo_externo_liquidacion l
       set l.nit_concesionariozon = (select nit_c
                                       from cta_dispersion_concesionario c
                                      where c.idconcesionario =
                                            l.id_concesionario_pro
                                        and c.idconcepto = 3
                                        and c.idbancorec = l.idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1;
  
    update recaudo_externo_liquidacion r
       set (nit_tercero1, nit_tercero2, nit_tercero3, nit_tercero4) = (select '0000000000',
                                                                              '0000000000',
                                                                              '0000000000',
                                                                              '0000000000'
                                                                         from dual)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and r.ind_proceso = 1;
  
    update recaudo_externo_liquidacion r
       set nit_tercero1 = (select nit_t
                             from tercero t
                            where t.idmunicipio = r.idmunicipio
                              and t.num_tercero = 1)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and r.ind_base_ter1 > 0
       and r.ind_proceso = 1;
  
    update recaudo_externo_liquidacion r
       set nit_tercero2 = (select nit_t
                             from tercero t
                            where t.idmunicipio = r.idmunicipio
                              and t.num_tercero = 2)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and r.ind_base_ter2 > 0
       and r.ind_proceso = 1;
  
    update recaudo_externo_liquidacion r
       set nit_tercero3 = (select nit_t
                             from tercero t
                            where t.idmunicipio = r.idmunicipio
                              and t.num_tercero = 3)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and r.ind_base_ter3 > 0
       and r.ind_proceso = 1;
  
    update recaudo_externo_liquidacion r
       set nit_tercero4 = (select nit_t
                             from tercero t
                            where t.idmunicipio = r.idmunicipio
                              and t.num_tercero = 4)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and r.ind_base_ter4 > 0
       and r.ind_proceso = 1;
  
    update recaudo_externo_liquidacion l
       set l.s_valor_5 = round((l.s_valor_5 + l.s_valor_6) -
                               (l.s_valor_5 + l.s_valor_6) / 2,
                               2),
           l.s_valor_6 = (l.s_valor_5 + l.s_valor_6) -
                         round((l.s_valor_5 + l.s_valor_6) -
                               (l.s_valor_5 + l.s_valor_6) / 2,
                               2)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and ind_proceso = 1
       and abs(l.s_valor_5 - l.s_valor_6) > 0.01;
  
    update recaudo_externo_liquidacion l
       set l.p_valor_5 = round((l.p_valor_5 + l.p_valor_6) -
                               (l.p_valor_5 + l.p_valor_6) / 2,
                               2),
           l.p_valor_6 = (l.p_valor_5 + l.p_valor_6) -
                         round((l.p_valor_5 + l.p_valor_6) -
                               (l.p_valor_5 + l.p_valor_6) / 2,
                               2)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and ind_proceso = 1
       and abs(l.p_valor_5 - l.p_valor_6) > 0.01;
  
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
       and (l.p_valor_5 - l.p_valor_6) = 0.01;
  
    commit;
  
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
       group by 
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;
  
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
       group by 
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;
  
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
       group by 
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;
  
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
       group by 
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;
  
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
       group by 
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;
  
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
       group by 
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;
  
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
       group by
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;
  
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
       group by 
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;
  
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
       group by 
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;
  
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
       group by
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;
  
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
             'Sevial', -- concepto,
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
       group by
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;
  
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
       group by 
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;
  
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
       group by 
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;
  
    -- actualiza cuenta financiera simit
    update recaudo_local_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) = (select c.cta_disp_s_banco,
                                                                                c.cta_disp_s_tipo_cta,
                                                                                c.cta_disp_s_cta,
                                                                                c.nit_fcm
                                                                           from cta_dispersion_fcm c
                                                                          where c.nit_fcm =
                                                                                '8000826650'
                                                                            and c.idbancorec =
                                                                                r.ori_idbanco)
     where r.fec_corte_ini = w_fec_cor_ini
       and r.fec_corte_fin = w_fec_cor_fin
       and r.indtipo = 'SIMIT'
       and r.concepto = 'Simit'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;
  
    update recaudo_local_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) = (select c.cta_disp_p_banco,
                                                                                c.cta_disp_p_tipo_cta,
                                                                                c.cta_disp_p_cta,
                                                                                c.nit_fcm
                                                                           from cta_dispersion_fcm c
                                                                          where c.nit_fcm =
                                                                                '8000826650'
                                                                            and c.idbancorec =
                                                                                r.ori_idbanco)
     where r.fec_corte_ini = w_fec_cor_ini
       and r.fec_corte_fin = w_fec_cor_fin
       and r.indtipo = 'POLCA'
       and r.concepto = 'Simit'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;
  
    commit;
  
  
 
    -- actualiza informacion financiera FCM Polca
    update recaudo_local_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) = (select c.cta_disp_pa_banco,
                                                                                c.cta_disp_pa_tipo_cta,
                                                                                c.cta_disp_pa_cta,
                                                                                c.nit_fcm
                                                                           from cta_dispersion_fcm c
                                                                          where c.nit_fcm =
                                                                                '8000826650'
                                                                            and c.idbancorec =
                                                                                r.ori_idbanco)
     where r.fec_corte_ini = w_fec_cor_ini
       and r.fec_corte_fin = w_fec_cor_fin
       and r.indtipo = 'POLCA'
       and r.concepto = 'FCM Polca'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;
  
  
    -- actualiza cuenta financiera Concesionario
    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_c
                                                                   from cta_dispersion_concesionario c
                                                                  where c.idconcesionario =
                                                                        r.idconcesionario
                                                                    and c.idconcepto = 9
                                                                    and r.ori_idbanco <> '52'
                                                                    and c.idbancorec =
                                                                        r.ori_idbanco)
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and concepto = 'Concesionario'
       and indtipo = 'SIMIT'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;
  
    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_c
                                                                   from cta_dispersion_concesionario c
                                                                  where c.idconcesionario =
                                                                        r.idconcesionario
                                                                    and c.idconcepto = 10
                                                                    and r.ori_idbanco <> '52'
                                                                    and c.idbancorec =
                                                                        r.ori_idbanco)
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and concepto = 'Concesionario'
       and indtipo = 'POLCA'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;
  
    update recaudo_local_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) = (select c.idbanco,
                                                                                c.tipocuenta,
                                                                                c.cuenta,
                                                                                c.nit_c
                                                                           from cta_dispersion_concesionario c
                                                                          where c.idconcesionario =
                                                                                r.idconcesionario
                                                                            and c.idconcepto = 7
                                                                            and r.ori_idbanco = '52'
                                                                            and c.idbancorec =
                                                                                r.ori_idbanco)
     where r.fec_corte_ini = w_fec_cor_ini
       and r.fec_corte_fin = w_fec_cor_fin
       and r.concepto = 'Concesionario'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;
  
    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_c
                                                                   from cta_dispersion_concesionario c
                                                                  where c.idconcesionario =
                                                                        r.idconcesionario
                                                                    and c.idconcepto = 5
                                                                    and c.idbancorec =
                                                                        r.ori_idbanco)
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and indtipo = 'POLCA'
       and idconcesionario = '03'
       and concepto = 'Concesionario'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;
  
    -- actualiza cuenta financiera Fondo Cobertura
    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_c
                                                                   from cta_dispersion_concesionario c
                                                                  where c.idconcesionario =
                                                                        r.idconcesionario
                                                                    and c.idconcepto = 2
                                                                    and c.idbancorec =
                                                                        r.ori_idbanco)
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and concepto = 'Fondo Cobertura Concesionario'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;
  
  
    -- actualiza cuenta financiera Fondo Cobertura simit
    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_c
                                                                   from cta_dispersion_concesionario c
                                                                  where c.idconcesionario =
                                                                        r.idconcesionario
                                                                    and c.idconcepto = 2
                                                                    and c.idbancorec =
                                                                        r.ori_idbanco)
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and concepto = 'Fondo Cobertura Simit'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;
  
  
    -- actualiza cuenta financiera Equilibrio
    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_c
                                                                   from cta_dispersion_concesionario c
                                                                  where c.idconcesionario =
                                                                        r.idconcesionario
                                                                    and c.idconcepto = 2
                                                                    and c.idbancorec =
                                                                        r.ori_idbanco)
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Equilibrio Economico'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;
  
  
    -- actualiza cuenta financiera Sevial
    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_c
                                                                   from cta_dispersion_concesionario c
                                                                  where c.idconcesionario =
                                                                        r.idconcesionario
                                                                    and c.idconcepto = 5
                                                                    and c.idbancorec =
                                                                        r.ori_idbanco)
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Sevial'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;
  
  
    -- actualiza cuenta financiera POLCA
    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_c
                                                                   from cta_dispersion_concesionario c
                                                                  where c.idconcesionario =
                                                                        r.idconcesionario
                                                                    and c.idconcepto = 6
                                                                    and c.idbancorec =
                                                                        r.ori_idbanco)
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Polca'
       and decode(ori_idbanco, '52', '52', '99') = p_banco;
  
  
    -- actualiza el tipo de cuenta origen
    update recaudo_local_disp r
       set r.ori_tipocuenta = (select c.tipocuenta
                                 from cta_recaudo_fcm c
                                where c.cuenta = r.ori_cuenta
                                  and c.idbanco = r.ori_idbanco)
     where r.fec_corte_ini = w_fec_cor_ini
       and r.fec_corte_fin = w_fec_cor_fin
       and decode(ori_idbanco, '52', '52', '99') = p_banco;
  
     delete from  recaudo_local_disp
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
       set r.concepto = (select 'Fondo Cobertura FCM -' || ' ' || c.nombre
                           from concesionario c
                          where c.idconcesionario = r.idconcesionario)
     where r.concepto = 'Fondo Cobertura Simit'
       and fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and decode(ori_idbanco, '52', '52', '99') = p_banco;
   
    update recaudo_local_disp r
       set r.concepto = (select 'Fondo Cobertura' || ' ' || c.nombre
                           from concesionario c
                          where c.idconcesionario = r.idconcesionario)
     where r.concepto = 'Fondo Cobertura Concesionario'
       and fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and decode(ori_idbanco, '52', '52', '99') = p_banco;
 
  
    update recaudo_local_disp r
       set r.concepto = (select 'Equilibrio Economico -' || ' ' || c.nombre
                           from concesionario c
                          where c.idconcesionario = r.idconcesionario)
     where r.concepto = 'Equilibrio Economico'
      and fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and decode(ori_idbanco, '52', '52', '99') = p_banco;
 
  
    update recaudo_local_disp r
       set r.concepto = (select 'POLCA SEVIAL'
                           from concesionario c
                          where c.idconcesionario = r.idconcesionario)
     where r.concepto = 'Sevial'
       and fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and decode(ori_idbanco, '52', '52', '99') = p_banco;
 
  
    update recaudo_local_disp r
       set r.concepto = (select 'POLCA FCM'
                           from concesionario c
                          where c.idconcesionario = r.idconcesionario)
     where r.concepto = 'FCM Polca'
        and fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and decode(ori_idbanco, '52', '52', '99') = p_banco;
  
    update recaudo_local_disp r
       set r.concepto = (select 'Liquidacion POLCA'
                           from concesionario c
                          where c.idconcesionario = r.idconcesionario)
     where r.concepto = 'Polca'
        and fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and decode(ori_idbanco, '52', '52', '99') = p_banco;
   
    update recaudo_local_disp r
       set r.concepto = (select 'Liquidacion ' || ' ' || c.nombre
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
             sum(decode(id_concesionario_liq, 5, p_valor_13 - p_valor_15, 0)),
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
             fec_dispersion,
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
                fec_dispersion,
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
             fec_dispersion,
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
             10, -- orden
             sum(p_valor_9 + p_valor_14),
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
             fec_dispersion_con,
             id_concesionario_liq,
             12, -- orden
             sum(p_valor_12 - p_valor_18 - p_valor_16),
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
  
    -- actualiza cuenta BANCO simit
    update recaudo_externo_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) = (select c.cta_disp_s_banco,
                                                                                c.cta_disp_s_tipo_cta,
                                                                                c.cta_disp_s_cta,
                                                                                '8000826650'
                                                                           from cta_dispersion_fcm c
                                                                          where c.idbancorec =
                                                                                r.ori_idbanco)
     where r.fec_corte_ini >= w_fec_cor_ini
       and r.fec_corte_fin <= w_fec_cor_fin
       and r.indtipo = 'SIMIT'
       and r.concepto = 'Liquidacion SIMIT';
  
    update recaudo_externo_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) = (select c.cta_disp_p_banco,
                                                                                c.cta_disp_p_tipo_cta,
                                                                                c.cta_disp_p_cta,
                                                                                '8000826650'
                                                                           from cta_dispersion_fcm c
                                                                          where c.idbancorec =
                                                                                r.ori_idbanco)
     where r.fec_corte_ini >= w_fec_cor_ini
       and r.fec_corte_fin <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Liquidacion SIMIT';
  
    commit;
  
    -- actualiza cuenta BANCO Concesionario
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_c
                                                                   from cta_dispersion_concesionario c
                                                                  where c.idconcesionario =
                                                                        r.id_concesionario_liq
                                                                    and c.idconcepto = 1
                                                                    and c.idbancorec =
                                                                        r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Concesionario'
       and indtipo = 'SIMIT';
  
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_c
                                                                   from cta_dispersion_concesionario c
                                                                  where c.idconcesionario =
                                                                        r.id_concesionario_liq
                                                                    and c.idconcepto = 8
                                                                    and c.idbancorec =
                                                                        r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Concesionario'
       and indtipo = 'POLCA';
  
    -- actualiza cuenta BANCO Fondo Cobertura
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_c
                                                                   from cta_dispersion_concesionario c
                                                                  where c.idconcesionario =
                                                                        r.id_concesionario_liq
                                                                    and c.idconcepto = 2
                                                                    and c.idbancorec =
                                                                        r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Fondo Cobertura Concesionario';
  
    -- actualiza cuenta BANCO Fondo Cobertura simit
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_c
                                                                   from cta_dispersion_concesionario c
                                                                  where c.idconcesionario =
                                                                        r.id_concesionario_liq
                                                                    and c.idconcepto = 2
                                                                    and c.idbancorec =
                                                                        r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Fondo Cobertura SIMIT';
  
    -- actualiza cuenta BANCO Equilibrio
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_c
                                                                   from cta_dispersion_concesionario c
                                                                  where c.idconcesionario =
                                                                        r.id_concesionario_liq
                                                                    and c.idconcepto = 2
                                                                    and c.idbancorec =
                                                                        r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Equilibrio Economico';
  
    -- actualiza cuenta Impuestos SIMIT CAPITAL
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select c.cta_disp_pa_banco,
                                                                        c.cta_disp_pa_tipo_cta,
                                                                        c.cta_disp_pa_cta,
                                                                        '8000826650'
                                                                   from cta_dispersion_fcm c
                                                                  where c.idbancorec =
                                                                        r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Impuestos SIMIT CAPITAL';
  
    -- actualiza cuenta BANCO Municipio
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_cta
                                                                   from municipio m
                                                                  where m.idmunicipio =
                                                                        r.idmunicipio)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Municipio';
  
    -- 100929
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_cta
                                                                   from municipio m
                                                                  where m.idmunicipio =
                                                                        '08001001')
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Validador'
       and r.idmunicipio = '08001000';
  
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_cta
                                                                   from municipio m
                                                                  where m.idmunicipio =
                                                                        '08000000')
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Validador'
       and r.idmunicipio in ('08296000', '08573000');
  
    -- 100929
  
    -- actualiza cuenta BANCO Tercero 1
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_t
                                                                   from tercero t
                                                                  where t.idmunicipio =
                                                                        r.idmunicipio
                                                                    and num_tercero = 1)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Tercero 1';
  
    -- actualiza cuenta BANCO Tercero 2
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_t
                                                                   from tercero t
                                                                  where t.idmunicipio =
                                                                        r.idmunicipio
                                                                    and num_tercero = 2)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Tercero 2';
  
    -- actualiza cuenta BANCO Tercero 3
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_t
                                                                   from tercero t
                                                                  where t.idmunicipio =
                                                                        r.idmunicipio
                                                                    and num_tercero = 1)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Tercero 3';
  
    -- actualiza cuenta BANCO Tercero 4
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_t
                                                                   from tercero t
                                                                  where t.idmunicipio =
                                                                        r.idmunicipio
                                                                    and num_tercero = 4)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Tercero 4';
  
    -- actualiza cuenta BANCO acuerdo de pago
    update recaudo_externo_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) = (select c.cta_disp_Ac_banco,
                                                                                c.cta_disp_Ac_tipo_cta,
                                                                                c.cta_disp_Ac_cta,
                                                                                '8000826650'
                                                                           from cta_dispersion_fcm c
                                                                          where c.idbancorec =
                                                                                r.ori_idbanco)
     where r.fec_corte_ini >= w_fec_cor_ini
       and r.fec_corte_fin <= w_fec_cor_fin
       and r.indtipo = 'SIMIT'
       and r.concepto = 'Acuerdo Pago';
  
    update recaudo_externo_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) = (select c.cta_disp_ac_banco,
                                                                                c.cta_disp_Ac_tipo_cta,
                                                                                c.cta_disp_Ac_cta,
                                                                                '8000826650'
                                                                           from cta_dispersion_fcm c
                                                                          where c.idbancorec =
                                                                                r.ori_idbanco)
     where r.fec_corte_ini >= w_fec_cor_ini
       and r.fec_corte_fin <= w_fec_cor_fin
       and r.indtipo = 'POLCA'
       and r.concepto = 'Acuerdo Pago';
  
    -- actualiza cuenta BANCO Concesionario Contravencional
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_c
                                                                   from cta_dispersion_concesionario c
                                                                  where c.idconcesionario =
                                                                        r.id_concesionario_pro
                                                                    and c.idconcepto = 3
                                                                    and c.idbancorec =
                                                                        r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Concesionario Contravencional';
  
    -- actualiza cuenta BANCO Fcm Contravencional
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_c
                                                                   from cta_dispersion_concesionario c
                                                                  where c.idconcesionario =
                                                                        r.id_concesionario_liq
                                                                    and c.idconcepto = 4
                                                                    and c.idbancorec =
                                                                        r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Contravencional FCM';
  
    -- actualiza cuenta BANCO POLCA
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_c
                                                                   from cta_dispersion_concesionario c
                                                                  where c.idconcesionario =
                                                                        r.id_concesionario_liq
                                                                    and c.idconcepto = 6
                                                                    and c.idbancorec =
                                                                        r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Liquidacion POLCA';
  
    -- actualiza cuenta BANCO Sevial
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_c
                                                                   from cta_dispersion_concesionario c
                                                                  where c.idconcesionario =
                                                                        r.id_concesionario_liq
                                                                    and c.idconcepto = 5
                                                                    and c.idbancorec =
                                                                        r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'POLCA SEVIAL';
  
    -- actualiza cuenta BANCO POLCA FCM
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select c.cta_disp_pa_banco,
                                                                        c.cta_disp_pa_tipo_cta,
                                                                        c.cta_disp_pa_cta,
                                                                        '8000826650'
                                                                   from cta_dispersion_fcm c
                                                                  where c.idbancorec =
                                                                        r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'POLCA FCM';
  
    -- actualiza el tipo de cuenta origen
    update recaudo_externo_disp r
       set r.ori_tipocuenta = (select c.tipocuenta
                                 from cta_recaudo_concesionario c
                                where c.cuenta = r.ori_cuenta
                                  and c.idconcesionario =
                                      r.id_concesionario_liq
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
       set r.concepto = (select 'Liquidacion FCM'
                           from concesionario c
                          where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'Liquidacion SIMIT'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;
  
    update recaudo_externo_disp r
       set r.concepto = (select 'Fondo Cobertura FCM -' || ' ' || c.nombre
                           from concesionario c
                          where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'Fondo Cobertura SIMIT'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;
  
    update recaudo_externo_disp r
       set r.concepto = (select 'Fondo Cobertura' || ' ' || c.nombre
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
       set r.concepto = (select 'Equilibrio Economico -' || ' ' || c.nombre
                           from concesionario c
                          where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'Equilibrio Economico'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;
  
    update recaudo_externo_disp r
       set r.concepto = (select 'POLCA SEVIAL'
                           from concesionario c
                          where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'POLCA SEVIAL'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;
  
    update recaudo_externo_disp r
       set r.concepto = (select 'POLCA FCM'
                           from concesionario c
                          where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'POLCA FCM'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;
  
    update recaudo_externo_disp r
       set r.concepto = (select 'Liquidacion POLCA'
                           from concesionario c
                          where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'Liquidacion POLCA'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;
  
    update recaudo_externo_disp r
       set r.concepto = (select 'Liquidacion ' || ' ' || c.nombre
                           from concesionario c
                          where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'Concesionario'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;
  
    update recaudo_externo_disp r
       set r.concepto = (select m.idmunicipio || ' Municipio ' || m.nombre
                           from municipio m
                          where m.idmunicipio = r.idmunicipio)
     where r.concepto = 'Municipio'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;
  
    update recaudo_externo_disp r
       set r.concepto = (select 'No distribuido ' || m.idmunicipio ||
                                ' Municipio ' || m.nombre
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
  
    -- 100929
  
    update recaudo_externo_disp r
       set r.concepto = (select 'Acuerdo Pago ' || m.idmunicipio || ' ' ||
                                m.nombre
                           from municipio m
                          where m.idmunicipio = r.idmunicipio)
     where r.concepto = 'Acuerdo Pago'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;
  
    update recaudo_externo_disp r
       set r.concepto = (select 'Contravencional ' || c.nombre
                           from concesionario c
                          where c.idconcesionario = r.id_concesionario_pro)
     where r.concepto = 'Concesionario Contravencional'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;
  
    update recaudo_externo_disp r
       set r.concepto             = (select t.nombre
                                       from tercero t
                                      where t.idmunicipio = r.idmunicipio
                                        and t.num_tercero = 1),
           r.id_concesionario_pro = '98'
     where r.concepto = 'Tercero 1'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;
  
    update recaudo_externo_disp r
       set r.concepto             = (select t.nombre
                                       from tercero t
                                      where t.idmunicipio = r.idmunicipio
                                        and t.num_tercero = 2),
           r.id_concesionario_pro = '98'
     where r.concepto = 'Tercero 2'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;
  
    update recaudo_externo_disp r
       set r.concepto             = (select t.nombre
                                       from tercero t
                                      where t.idmunicipio = r.idmunicipio
                                        and t.num_tercero = 3),
           r.id_concesionario_pro = '98'
     where r.concepto = 'Tercero 3'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;
  
    update recaudo_externo_disp r
       set r.concepto             = (select t.nombre
                                       from tercero t
                                      where t.idmunicipio = r.idmunicipio
                                        and t.num_tercero = 4),
           r.id_concesionario_pro = '98'
     where r.concepto = 'Tercero 4'
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
  
    commit;
  
    sp_log(p_usuario,
           'Dispersa Recaudo Externo',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia);
  
    commit;
  
  EXCEPTION
    WHEN OTHERS THEN
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
             referenciatrf
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
    
      if ( registro.des_idbanco = '50' ) then
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
         and ori_cuenta = cta.cuenta;
    
      select count(*)
        into numTotal
        from recaudo_externo_disp_tot
       where fec_dispersion = p_fecha
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
                   where fec_dispersion = p_fecha
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
            p_usuario || ' [generarArchivoDavivienda] ' || SQLERRM,
            p_error);
    
  end generarArchivoDavivienda;

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
       and ori_idbanco = decode(p_idbanco,'50','51',p_idbanco);
  
    IF w_registros > 0 THEN
      p_error := 'PROCESO NO EJECUTADO. ARCHIVOS YA ENVIADOS A BANCO. SOLICITAR AUTORIZACION';
      -- ver log envio
      if p_idbanco = '52' then
        verLogEnvioAvvillas(p_log);
      end if;
      if p_idbanco = '50' then
        verLogEnvioDavivienda(p_log);
      end if;
      if p_idbanco = '51'  then
        verLogEnvioDavivienda(p_log);
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
  
   if ( p_idbanco = '50' ) or ( p_idbanco = '51' ) then
    
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
  
   update recaudo_externo_disp_tot
       set enviadobanco = 1,
       estadotrf = 'ENV',
       fechaenvio = sysdate
     where fec_corte_ini = p_fecha
       and ori_idbanco = decode(p_idbanco,'50','51',p_idbanco);

    commit;

    p_error := 'Archivos enviados a banco OK';

    select count(*)
      into w_registros
      from recaudo_externo_disp_tot
     where fec_corte_ini = p_fecha
       and ori_idbanco = decode(p_idbanco,'50','51',p_idbanco);
  
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
    
      delete from municipio
       where idmunicipio in (select idmunicipio
                               from novmunicipio
                              where estadonov = 'VALIDADA'
                                and fechaact <= p_fecha
                                and fechaaplicacion is null
                                and tiponov = '01');
    
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
        select idmunicipio,
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
               indacuerdopago_2002
          from novmunicipio
         where estadonov = 'VALIDADA'
           and fechaact <= p_fecha
           and fechaaplicacion is null
           and tiponov = '01';
    
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
        select idmunicipio,
               municipio_s,
               fcm_contravencional_s,
               conces_contravencional_s,
               acuerdopago_s,
               municipio_p,
               fcm_contravencional_p,
               conces_contravencional_p,
               acuerdopago_p
          from novmunicipio
         where estadonov = 'VALIDADA'
           and fechaact <= p_fecha
           and fechaaplicacion is null
           and tiponov = '01';
    
      update novmunicipio
         set (fechaaplicacion, estadonov) = (select sysdate, 'ACTIVADA'
                                               from dual)
       where estadonov = 'VALIDADA'
         and fechaact <= p_fecha
         and fechaaplicacion is null
         and tiponov = '01';
    
      commit;
    
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
         set (fechaaplicacion, estadonov) = (select sysdate, 'ACTIVADA'
                                               from dual)
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
         set (fechaaplicacion, estadonov) = (select sysdate, 'ACTIVADA'
                                               from dual)
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
         set (fechaaplicacion, estadonov) = (select sysdate, 'ACTIVADA'
                                               from dual)
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
         set (fechaaplicacion, estadonov) = (select sysdate, 'ACTIVADA'
                                               from dual)
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
  
    -- aplica novedades de adicion
  
    select count(*)
      into w_registros
      from novTercero n
     where n.estadonov = 'VALIDADA'
       and n.fechaact <= p_fecha
       and n.fechaaplicacion is null
       and n.tiponov = '03';
  
    if (w_registros > 0) then
    
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
           and fechaact <= p_fecha
           and fechaaplicacion is null
           and tiponov = '03';
    
      update novTercero
         set (fechaaplicacion, estadonov) = (select sysdate, 'ACTIVADA'
                                               from dual)
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
         set (fechaaplicacion, estadonov) = (select sysdate, 'ACTIVADA'
                                               from dual)
       where estadonov = 'VALIDADA'
         and fechaact <= p_fecha
         and fechaaplicacion is null
         and tiponov = '04';
    
      commit;
    
    end if;
  
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
         set (fechaaplicacion, estadonov) = (select sysdate, 'ACTIVADA'
                                               from dual)
       where estadonov = 'VALIDADA'
         and fechaact <= p_fecha
         and fechaaplicacion is null
         and tiponov = '05';
    
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
  
    if ( p_idbanco = '50' ) or ( p_idbanco = '51' ) then
    
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
  
    update recaudo_externo_disp_tot
       set enviadobanco = 1,
       estadotrf = 'ENV',
       fechaenvio = sysdate
     where fec_corte_ini >= p_fecha_ini
       and fec_corte_ini <= p_fecha_fin
       and ori_idbanco = decode(p_idbanco,'50','51',p_idbanco);

    commit;

    p_error := 'Archivos generados OK';

    select count(*)
      into w_registros
      from recaudo_externo_disp_tot
     where fec_corte_ini >= p_fecha_ini
       and fec_corte_ini <= p_fecha_fin
       and ori_idbanco = decode(p_idbanco,'50','51',p_idbanco);
  
    IF w_registros = 0 THEN
      p_error := p_error ||
                 '.ADVERTENCIA: NO HAY TRANSFERENCIAS PROGRAMADASPARA LA FECHA DADA';
      RETURN;
    END IF;
  
    sp_log(p_usuario,
           'envio_Banco_repro',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia || ':' ||
           p_fec_fin_ano || '-' || p_fec_fin_mes || '-' || p_fec_fin_dia);
  
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
             referenciatrf
        from recaudo_externo_disp_tot
       where fec_dispersion >= p_fecha_ini
         and fec_dispersion <= p_fecha_fin
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
    
     if ( registro.des_idbanco = '50' ) then
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
                                    p_motivo        varchar2,
                                    p_usuario       varchar2,
                                    p_error         OUT VARCHAR2) AS
  
    w_fecha_cor recaudo_local_ajustes.fec_corte%TYPE;
    w_fecha_tra recaudo_local_ajustes.fec_tran%TYPE;
  
    w_operacion varchar2(250);
  
    w_registros number;
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
     where l.fec_corte = w_fecha_cor
       and l.cta_recaudo = p_cta_recaudo;
  
    IF w_registros > 0 THEN
      p_error := 'AJUSTE NO POSIBLE. CUENTA YA LIQUIDADA PARA ESA FECHA DE CORTE. SOLICITAR AUTORIZACION';
      RETURN;
    END IF;
  
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
       motivo)
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
       p_motivo);
  
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
                                    p_p_consignado             out number,
                                    p_motivo                   out varchar2,
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
           motivo
      into p_idbanco,
           p_cta_recaudo,
           p_indtipo,
           p_fec_corte,
           p_fec_tran,
           p_valor_total,
           p_idmunicipio,
           p_periodo,
           p_p_consignado,
           p_motivo
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

end pk_proc;
/


spool off
