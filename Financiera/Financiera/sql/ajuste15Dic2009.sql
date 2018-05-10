-------------------------------------------------------
-- Export file for user SIMIT                        --
-- Created by cendalesh on 15/12/2009, 10:09:12 a.m. --
-------------------------------------------------------

spool ajuste15Dic2009.log

prompt
prompt Creating package body PK_PROC
prompt =============================
prompt
create or replace package body pk_proc is

  -- Private variable declarations
  /*v_valida NUMBER;*/

  -- Function and procedure implementations
  PROCEDURE l_recaudo_local(p_fec_ini_ano number,
                            p_fec_ini_mes number,
                            p_fec_ini_dia number,
                            p_fec_fin_ano number,
                            p_fec_fin_mes number,
                            p_fec_fin_dia number,
                            p_usuario     varchar2,
                            p_error       OUT VARCHAR2) as

    w_fec_cor_ini date;
    w_fec_cor_fin date;

  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error);
    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
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

      sp_liquida_recaudo_local(w_fec_cor_ini,
                               w_fec_cor_fin,
                               p_usuario,
                               p_error);

    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [l_recaudo_local] ' || SQLERRM,
            p_error);
  END l_recaudo_local;

  procedure sp_liquida_recaudo_local(p_fec_ini date,
                                     p_fec_fin date,
                                     p_usuario varchar2,
                                     p_error   OUT VARCHAR2) is
    dd dias_dispersion%rowtype;

    w_registros   number;
    w_idmunicipio char(8);
    w_idbanco     char(2);

  BEGIN

    delete recaudo_local_liquidacion
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin;

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
         and fec_corte <= p_fec_fin;

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
         and fec_corte <= p_fec_fin;

    update recaudo_local_liquidacion l
       set (l.idconcesionario, l.ind_proceso) = (select m.idconcesionario,
                                                        m.indliq_s_local
                                                   from municipio m
                                                  where m.idmunicipio =
                                                        l.idmunicipio)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and l.indtipo = 'SIMIT';

    update recaudo_local_liquidacion l
       set (l.idconcesionario, l.ind_proceso) = (select m.idconcesionario,
                                                        m.indliq_p_local

                                                   from municipio m
                                                  where m.idmunicipio =
                                                        l.idmunicipio)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and l.indtipo = 'POLCA';

    -- verifica que todos los municipios esten parametrizados
    select count(*)
      into w_registros
      from recaudo_local_liquidacion
     where idconcesionario is null
       and fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin;

    IF w_registros > 0 THEN
      select idmunicipio
        into w_idMunicipio
        from recaudo_local_liquidacion
       where idconcesionario is null
         and fec_corte >= p_fec_ini
         and fec_corte <= p_fec_fin
         and rownum = 1;

      p_error := 'PROCESO NO EJECUTADO. MUNICIPIO SIN PARAMETRIZAR: ' ||
                 w_idMunicipio;
      RETURN;
    END IF;

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
       and ind_proceso = 1;

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
       and ind_proceso = 1;

    -- verifica que todos los municipios tengas fechas de dispersion
    select count(*)
      into w_registros
      from recaudo_local_liquidacion
     where dias_dispersion is null
       and fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1;

    IF w_registros > 0 THEN
      select idmunicipio, idbanco
        into w_idMunicipio, w_idbanco
        from recaudo_local_liquidacion
       where dias_dispersion is null
         and fec_corte >= p_fec_ini
         and fec_corte <= p_fec_fin
         and ind_proceso = 1
         and rownum = 1;

      p_error := 'PROCESO NO EJECUTADO. MUNICIPIO SIN DIAS DISPERSION: ' ||
                 w_idMunicipio || ' BANCO: ' || w_idbanco;
      RETURN;
    END IF;

    update recaudo_local_liquidacion l
       set l.fec_dispersion = fn_fec_dispersion(l.fec_corte,
                                                l.dias_dispersion,
                                                l.frec_dispersion,
                                                p_usuario)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1;

    update recaudo_local_liquidacion l
       set l.s_valor_0 = (select c.comision_recaudo * (1 + (fcm.iva / 100))
                            from cta_recaudo_fcm c, fcm
                           where l.idbanco = c.idbanco
                             and l.cta_recaudo = c.cuenta)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1;

    -- SIMIT

    update recaudo_local_liquidacion l
       set (l.s_valor_1, l.s_valor_2, l.s_valor_3, l.s_valor_4, l.s_valor_5) = (select l.valor_total * (p.simit_s / 10),
                                                                                       l.valor_total * (p.concesionario_s / 10),
                                                                                       l.valor_total * (p.fondo_cob_concesionario_s / 10),
                                                                                       l.valor_total * (p.fondo_cob_simit_s / 10),
                                                                                       l.valor_total * (p.equilibrio_economico_s / 10)
                                                                                  from p_dispersion_concesionario p
                                                                                 where l.idconcesionario =
                                                                                       p.idconcesionario)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'SIMIT';

    -- redondear a dos decimales todos los calculos
    update recaudo_local_liquidacion l
       set l.s_valor_0 = ROUND(l.s_valor_0, 2),
           l.s_valor_1 = ROUND(l.s_valor_1, 2),
           l.s_valor_2 = ROUND(l.s_valor_2, 2),
           l.s_valor_3 = ROUND(l.s_valor_3, 2)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'SIMIT';

    -- ajustar decimales
    update recaudo_local_liquidacion l
       set l.s_valor_4 = l.valor_total - l.s_valor_1 - l.s_valor_2 -
                         l.s_valor_3
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'SIMIT'
       and l.s_valor_5 = 0;

    update recaudo_local_liquidacion l
       set l.s_valor_5 = l.valor_total - l.s_valor_1 - l.s_valor_2 -
                         l.s_valor_3
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'SIMIT'
       and l.s_valor_5 <> 0;

    -- calcular netos
    update recaudo_local_liquidacion l
       set l.s_valor_6 = l.s_valor_2 - l.s_valor_0
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'SIMIT';

    -- POLCA
    update recaudo_local_liquidacion l
       set (l.p_valor_7, l.p_valor_8, l.p_valor_9, l.p_valor_10, l.p_valor_11, l.p_valor_12, l.p_valor_13, l.p_valor_14, l.p_valor_15, l.p_valor_16, l.p_valor_17, l.p_valor_18) = (select l.valor_total * (p.simit_pm / 55),
                                                                                                                                                                                           l.valor_total * (p.concesionario_pm / 55),
                                                                                                                                                                                           l.valor_total * (p.fondo_cob_concesionario_pm / 55),
                                                                                                                                                                                           l.valor_total * (p.fondo_cob_simit_pm / 55),
                                                                                                                                                                                           l.valor_total * (p.equilibrio_economico_pm / 55),
                                                                                                                                                                                           l.valor_total * (p.simit_pp / 55),
                                                                                                                                                                                           l.valor_total * (p.sevial_pp / 55),
                                                                                                                                                                                           l.valor_total * (p.equilibrio_economico_pp / 55),
                                                                                                                                                                                           l.valor_total * (p.polca_cp / 55),
                                                                                                                                                                                           l.valor_total * (p.fcm_cp / 55),
                                                                                                                                                                                           l.valor_total * (p.sevial_cp /  55),
                                                                                                                                                                                           l.valor_total * (p.equilibrio_economico_cp / 55)

                                                                                                                                                                                     from p_dispersion_concesionario p,
                                                                                                                                                                                           fcm
                                                                                                                                                                                     where l.idconcesionario =
                                                                                                                                                                                           p.idconcesionario)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA';

    -- ajusta municipios que solo consignan el 10%
    update recaudo_local_liquidacion l
       set (l.p_valor_7, l.p_valor_8, l.p_valor_9, l.p_valor_10, l.p_valor_11, l.p_valor_12, l.p_valor_13, l.p_valor_14, l.p_valor_15, l.p_valor_16, l.p_valor_17, l.p_valor_18) = (select l.valor_total * (p.simit_pm / 10),
                                                                                                                                                                                           l.valor_total * (p.concesionario_pm / 10),
                                                                                                                                                                                           l.valor_total * (p.fondo_cob_concesionario_pm / 10),
                                                                                                                                                                                           l.valor_total * (p.fondo_cob_simit_pm / 10),
                                                                                                                                                                                           l.valor_total * (p.equilibrio_economico_pm / 10),
                                                                                                                                                                                           l.valor_total * (p.simit_pp / 10),
                                                                                                                                                                                           l.valor_total *  (p.sevial_pp / 10),
                                                                                                                                                                                           l.valor_total *  (p.equilibrio_economico_pp / 10),
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
       and l.indtipo = 'POLCA';

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
                                                                                                                                                                                           l.valor_total * (p.polca_cp / 45),
                                                                                                                                                                                           l.valor_total * (p.fcm_cp / 45),
                                                                                                                                                                                           l.valor_total * (p.sevial_cp / 45),
                                                                                                                                                                                           l.valor_total * (p.equilibrio_economico_cp / 45)
                                                                                                                                                                                           from p_dispersion_concesionario p,
                                                                                                                                                                                           fcm
                                                                                                                                                                                     where l.idconcesionario =
                                                                                                                                                                                           p.idconcesionario)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and p_consignado = 45
       and l.indtipo = 'POLCA';

    update recaudo_local_liquidacion l
       set (l.p_valor_19, l.p_valor_20, l.p_valor_21, l.p_valor_22, l.p_valor_23) = (select l.p_valor_16 * (fcm.iva / 100),
                                                                                            l.p_valor_17 * (fcm.iva / 100),
                                                                                            l.p_valor_17 * (fcm.retencion_fuente / 100),
                                                                                            l.p_valor_17 * (fcm.impuesto_timbre_tercero / 100),
                                                                                            (l.p_valor_16 +  l.p_valor_17 + l.p_valor_18) * (fcm.impuesto_timbre_fcm / 100)
                                                                                      from fcm)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA';

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
           l.p_valor_18 = ROUND(l.p_valor_18, 2),
           l.p_valor_19 = ROUND(l.p_valor_19, 2),
           l.p_valor_20 = ROUND(l.p_valor_20, 2),
           l.p_valor_21 = ROUND(l.p_valor_21, 2),
           l.p_valor_22 = ROUND(l.p_valor_22, 2),
           l.p_valor_23 = ROUND(l.p_valor_23, 2)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA';

    -- caluclar netos
    update recaudo_local_liquidacion l
       set l.p_valor_24 = l.p_valor_13 + l.p_valor_17 + l.p_valor_20 - l.p_valor_21 - l.p_valor_22,
           l.p_valor_25 = l.p_valor_8 - l.s_valor_0,
           l.p_valor_26 = l.p_valor_16 + l.p_valor_19 + l.p_valor_21 + l.p_valor_22,
           l.p_valor_27 = l.p_valor_7 + l.p_valor_12,
           l.p_valor_28 = l.p_valor_11 + l.p_valor_14 + l.p_valor_18,
           l.p_valor_15 = l.p_valor_15 - l.p_valor_19 - l.p_valor_20
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA';


    -- ajustar decimales
/*    update recaudo_local_liquidacion l
       set l.p_valor_10 = l.valor_total - l.p_valor_7 - l.p_valor_8 -
                          l.p_valor_9 - - l.p_valor_11 - l.p_valor_12 - l.p_valor_13 -
                          l.p_valor_14 - l.p_valor_15 - l.p_valor_16 -
                          l.p_valor_17 - l.p_valor_18

     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA'
       and l.p_valor_11 = 0;


    update recaudo_local_liquidacion l
       set l.p_valor_11 = l.valor_total - l.p_valor_7 - l.p_valor_8 -
                          l.p_valor_9 - l.p_valor_12 - l.p_valor_13 -
                          l.p_valor_14 - l.p_valor_15 - l.p_valor_16 -
                          l.p_valor_17 - l.p_valor_18

     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA'
       and l.p_valor_11 <> 0;

  */

    -- actualizar datos del proceso
    update recaudo_local_liquidacion l
       set l.fecha_proceso = sysdate, l.usuario_proceso = p_usuario
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1;

    commit;

    IF p_error IS NULL THEN

      -- obtiene cantidad de registros actualizados
      select count(*)
        into w_registros
        from recaudo_local_liquidacion
       where fec_corte >= p_fec_ini
         and fec_corte <= p_fec_fin;

      p_error := 'OK ' || w_registros;

    END IF;
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

    w_fec_cor_ini recaudo_externo.fec_corte%TYPE;
    w_fec_cor_fin recaudo_externo.fec_corte%TYPE;
    w_registros   number;

  BEGIN

    -- pendiente validador fecha, indfecha2002, cruce de informacion
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error);
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
             SUBSTR(b.cuenta,1,12) cuenta,
             a.fecha_contable,
             a.fecha_transaccion,
             a.total_recaudo,
             0,
             a.total_recaudo,
             SUBSTR(a.numero_referencia, 1, 10) numero_referencia,
             a.identificacion,
             SUBSTR(a.id_secretaria_origen, 1, 8) id_secretaria_origen,
             a.valor_adicional,
             SUBSTR(a.id_secretaria_origen, 1, 2) iddepartamento,
             SUBSTR(a.validador_fecha, 1, 3) ,
             a.indicador_fecha
        FROM quipux.simit_recaudo_detalle a, quipux.simit_recaudo b
       where a.id_procedencia_pago = '2'
         and a.consecutivo_recaudo = b.consecutivo_recaudo
         and a.fecha_contable >= w_fec_cor_ini
         and a.fecha_contable <= w_fec_cor_fin;

    -- actualiza cuenta de avvillas para completar dato
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
       set r.idbanco = (select max(c.idbanco) from cta_recaudo_concesionario c where c.cuenta = r.cta_recaudo )
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;


   -- actualiza validador si esta vacio
    update recaudo_externo
       set validador_fecha = '000'
     where
       fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and validador_fecha is null;

   -- actualiza validador si esta vacio
    update recaudo_externo
       set indfecha2002 = '0'
     where
       fec_corte >= w_fec_cor_ini
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

    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_externo
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;
    commit;

    sp_paralelo_temp;  -- temporal para paralelo

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

  PROCEDURE liquida_recaudo_externo(p_feccor_ini_ano number,
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
    w_registros1  number;

    w_idMunicipio char(8);
    w_fec_corte   date;
    w_cta_recaudo varchar2(500);
    w_mensaje varchar2(500);

  BEGIN

    -- VALIDACIONES
    if (not p_usuario = '99999999' )  THEN
      sp_v_usuario(p_usuario, p_error);
      IF not P_ERROR is null THEN
        return;
      END IF;
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

    --aplicaNovedadesMunicipio(w_fec_cor_fin);
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
       and dias_dispersion is null;

    IF w_registros > 0 THEN
      select a.idMunicipio || ' ' || b.nombre ||' Banco: ' || a.idbanco
        into w_mensaje
        from recaudo_externo_liquidacion a, municipio b
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and a.dias_dispersion is null
         and a.idmunicipio = b.idmunicipio
         and rownum = 1;

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
       and smdlv is null;

    IF w_registros > 0 THEN
      select to_char(fec_corte, 'yyyy')
        into w_mensaje
        from recaudo_externo_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and smdlv is null
         and rownum = 1;

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
       and s_valor_0 is null;

    IF w_registros > 0 THEN
      select 'Cuenta: ' || cta_recaudo || ' Banco: ' || idbanco || ' Concesionario:' || id_concesionario_liq || ' Tipo:' ||
             indtipo || ' Liquidacion:' || num_liquidacion
        into w_cta_recaudo
        from recaudo_externo_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and s_valor_0 is null
         and rownum = 1;

      p_error := 'PROCESO NO EJECUTADO. CUENTA RECAUDO NO DEFINIDA: ' ||
                 w_cta_recaudo ;
      RETURN;
    END IF;


    select count(*)
    into w_registros
    from recaudo_externo_liquidacion l, validador_fecha v
    where l.idmunicipio = v.idmunicipio
    and l.validador_fecha = v.idvalidador
    and v.indtipo = 'SIMIT'
    and l.indtipo = 'SIMIT'
    and l.validador_fecha <> '000';

   select count(*)
    into w_registros1
    from recaudo_externo_liquidacion l
    where l.indtipo = 'SIMIT'
    and l.validador_fecha <> '000';

    w_registros1 := w_registros1 - w_registros;

   IF w_registros1 > 0 THEN

      p_error := 'PROCESO NO EJECUTADO. VALIDADOR SIMIT NO DEFINIDO';
      RETURN;

   END IF;

    select count(*)
    into w_registros
    from recaudo_externo_liquidacion l, validador_fecha v
    where l.idmunicipio = v.idmunicipio
    and l.validador_fecha = v.idvalidador
    and v.indtipo = 'POLCA'
    and l.indtipo = 'POLCA'
    and l.validador_fecha <> '000';

   select count(*)
    into w_registros1
    from recaudo_externo_liquidacion l
    where l.indtipo = 'POLCA'
    and l.validador_fecha <> '000';

    w_registros1 := w_registros1 - w_registros;

   IF w_registros1 > 0 THEN

      p_error := 'PROCESO NO EJECUTADO. VALIDADOR POLCA NO DEFINIDO';
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
       set (l.s_valor_10) = (select l.s_valor_8 *
                                   ((v.p_acuerdopago) / 100) / 0.9
                              from validador_fecha v
                             where v.idmunicipio = l.idmunicipio
                             and v.idValidador = l.validador_fecha
                             and v.indtipo = 'SIMIT'
                              )
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.validador_fecha <> '000'
       and l.ind_proceso = 1;


    -- calcula base municipio sin impuestos
    update recaudo_externo_liquidacion l
       set (l.s_valor_13) = (l.s_valor_8 - l.s_valor_10 - l.s_valor_11 - l.s_valor_12 )
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
       set (l.s_valor_10, l.s_valor_14, l.s_valor_15, l.s_valor_16, l.s_valor_17, l.s_valor_30) = (select
                                                                                            l.s_valor_10 -
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
       and l.s_valor_21 > ( l.s_valor_13 - l.s_valor_19 )
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
     set l.s_valor_23 = l.s_valor_13 - l.s_valor_19 - l.s_valor_21,
         l.s_valor_24 = 0,
         l.s_valor_25 = 0
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.s_valor_23 > ( l.s_valor_13 - l.s_valor_19 - l.s_valor_21 )
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
     set l.s_valor_25 = l.s_valor_13 - l.s_valor_19 - l.s_valor_21 - l.s_valor_23
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.s_valor_25 > ( l.s_valor_13 - l.s_valor_19 - l.s_valor_21 - l.s_valor_23 )
       and l.ind_proceso = 1;

    -- calcular valor operador contravencional con impuestos
    update recaudo_externo_liquidacion l
       set (l.s_valor_11) = l.s_valor_11 + l.s_valor_14/2 - l.s_valor_30 - l.s_valor_16
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    -- calcular valor fcm contravencional con impuestos
    update recaudo_externo_liquidacion l
       set (l.s_valor_12) = l.s_valor_12 + l.s_valor_14/2 + l.s_valor_30 + l.s_valor_16
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
       set (l.p_valor_12, l.p_valor_13, l.p_valor_14, l.p_valor_15) = (select l.p_valor_11 * (p.polca_cp / 45),
                                                                              l.p_valor_11 * (p.fcm_cp / 45 ),
                                                                              l.p_valor_11 * (p.sevial_cp /  45),
                                                                              l.p_valor_11 * (p.equilibrio_economico_cp / 45)
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
     set  l.p_valor_13 = l.p_valor_15
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
                             where l.idmunicipio = p.idmunicipio
                             )
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
                                   (( v.p_conces_contravencional) / 100) / 0.45
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
       set l.p_valor_26 = l.p_valor_21 - p_valor_23 - p_valor_24 - p_valor_25
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- calula base municipio, iva contravencional, timbre contravencional, retefuente contravencional, reteica contravencional
    -- esto si el valor del municipio cubre el iva por contravencional
    update recaudo_externo_liquidacion l
       set (l.p_valor_26, l.p_valor_27, l.p_valor_28, l.p_valor_29, l.p_valor_30, p_valor_44 ) = (select l.p_valor_21 -
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
       set (l.p_valor_23, l.p_valor_27, l.p_valor_28, l.p_valor_29, l.p_valor_30, p_valor_44 ) = (select l.p_valor_23 -
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
     set p_valor_32 = p_valor_26,
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
       and l.ind_proceso = 1;

     update recaudo_externo_liquidacion l
     set p_valor_34 = p_valor_26 - p_valor_32,
         l.p_valor_35 = 0,
         l.p_valor_36 = 0,
         l.p_valor_37 = 0,
         l.p_valor_39 = 0
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and p_valor_34 > ( p_valor_26 - p_valor_32 )
       and l.ind_proceso = 1;

     update recaudo_externo_liquidacion l
     set p_valor_36 = p_valor_26  - p_valor_32 - p_valor_34,
        l.p_valor_37 = 0,
        l.p_valor_39 = 0
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and p_valor_36 > ( p_valor_26  - p_valor_32 - p_valor_34 )
       and l.ind_proceso = 1;

     update recaudo_externo_liquidacion l
     set p_valor_38 = p_valor_26  - p_valor_32 - p_valor_34 - p_valor_36
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and p_valor_38 > ( p_valor_26  - p_valor_32 - p_valor_34 - p_valor_36 )
       and l.ind_proceso = 1;


    -- calcular valor operador contravencional con impuestos
    update recaudo_externo_liquidacion l
       set (l.p_valor_24) = l.p_valor_24 + l.p_valor_27/2 - l.p_valor_44 - l.p_valor_29
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- calcular valor fcm contravencional con impuestos
    update recaudo_externo_liquidacion l
       set (l.p_valor_25) = l.p_valor_25 + l.p_valor_27/2 + l.p_valor_44 + l.p_valor_29
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
       set l.p_valor_6 = l.p_valor_1 + l.valor_adicional - l.p_valor_3 - l.p_valor_4 - l.p_valor_5 - l.p_valor_8 - decode(l.id_concesionario_liq,5, 0, l.p_valor_7 ) - decode(l.id_concesionario_liq,5, l.p_valor_7,  0 ) - l.p_valor_9 - l.p_valor_10 - l.p_valor_13 - l.p_valor_14 - l.p_valor_12 + l.p_valor_18 + l.p_valor_16 - l.p_valor_24 - l.p_valor_25 - l.p_valor_23 - l.p_valor_32 - l.p_valor_34 - l.p_valor_36 - l.p_valor_39
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.p_valor_7 = 0.0
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.p_valor_13 = l.p_valor_1  + l.valor_adicional - l.p_valor_3 - l.p_valor_4 - l.p_valor_5 - l.p_valor_6 - l.p_valor_8 - decode(l.id_concesionario_liq,5, 0, l.p_valor_7 ) - decode(l.id_concesionario_liq,5, l.p_valor_7,  0 ) - l.p_valor_9 - l.p_valor_10 - l.p_valor_14 - l.p_valor_12 + l.p_valor_18 + l.p_valor_16 - l.p_valor_24 - l.p_valor_25 - l.p_valor_23 - l.p_valor_32 - l.p_valor_34 - l.p_valor_36 - l.p_valor_39
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.p_valor_7 <> 0.0
       and l.ind_proceso = 1;

    ------------------------------------------------------------------------------------------
    commit;


    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_externo_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    p_error := 'Recuado Externo Liquidado OK. Registros: ' ||
               w_registros;

    sp_log(p_usuario,
           'Liquida Recaudo Externo',
           p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
           p_feccor_ini_dia || '-' || p_feccor_fin_ano || '-' ||
           p_feccor_fin_mes || '-' || p_feccor_fin_dia);

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
                                   p_usuario     varchar2,
                                   p_error       OUT VARCHAR2) as

    w_fec_cor_ini date;
    w_fec_cor_fin date;
    /*w_fecmin_cor_ini date;*/
    /*w_fecmax_cor_fin date;*/
    w_registros number;

  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error);

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
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    -- obtiene valor simit
    insert into recaudo_local_disp
      (fec_corte,
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
      select fec_corte,
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
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- neto simit por polca
    insert into recaudo_local_disp
      (fec_corte,
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
      select fec_corte,
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
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- obtiene valor concesionario
    insert into recaudo_local_disp
      (fec_corte,
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
      select fec_corte,
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
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- neto concesionario por polca
    insert into recaudo_local_disp
      (fec_corte,
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
      select fec_corte,
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
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- obtiene valor fondo cobertura concesionario
    insert into recaudo_local_disp
      (fec_corte,
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
      select fec_corte,
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
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- fondo cobertura concesionario
    insert into recaudo_local_disp
      (fec_corte,
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
      select fec_corte,
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
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- obtiene valor fondo cobertura simit
    insert into recaudo_local_disp
      (fec_corte,
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
      select fec_corte,
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
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- fondo cobertura simit
    insert into recaudo_local_disp
      (fec_corte,
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
      select fec_corte,
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
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- obtiene valor equilibrio economico
    insert into recaudo_local_disp
      (fec_corte,
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
      select fec_corte,
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
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- equilibrio economico
    insert into recaudo_local_disp
      (fec_corte,
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
      select fec_corte,
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
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- obtiene valor SEVIAL
    insert into recaudo_local_disp
      (fec_corte,
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
      select fec_corte,
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
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- obtiene valor SEVIAL
    insert into recaudo_local_disp
      (fec_corte,
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
      select fec_corte,
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
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- obtiene valor FCM
    insert into recaudo_local_disp
      (fec_corte,
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
      select fec_corte,
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
       group by fec_corte,
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
                                                                   where c.nit_fcm = '8000826650'and
                                                                   c.idbancorec = r.ori_idbanco)
     where r.fec_corte >= w_fec_cor_ini
       and r.fec_corte <= w_fec_cor_fin
       and r.indtipo = 'SIMIT'
       and r.concepto = 'Simit';

    update recaudo_local_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) = (select c.cta_disp_p_banco,
                                                                        c.cta_disp_p_tipo_cta,
                                                                        c.cta_disp_p_cta,
                                                                        c.nit_fcm
                                                                   from cta_dispersion_fcm c
                                                                   where c.nit_fcm = '8000826650'and
                                                                   c.idbancorec = r.ori_idbanco)
     where r.fec_corte >= w_fec_cor_ini
       and r.fec_corte <= w_fec_cor_fin
       and r.indtipo = 'POLCA'
       and r.concepto = 'Simit';

    commit;

    -- actualiza cuenta contable simit
    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select ctacon_fcm,
                                                                           '',
                                                                           '',
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' LOCAL ' ||
                                                                           b.nombre ||
                                                                           ' FCM (2.5%)'
                                                                      from fcm   f,
                                                                           banco b
                                                                     where r.ori_idbanco =
                                                                           b.idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Simit';

    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select ctacon_fcm,
                                                                           '',
                                                                           '',
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' LOCAL ' ||
                                                                           b.nombre ||
                                                                           ' FCM (3.25%)'
                                                                      from fcm   f,
                                                                           banco b
                                                                     where r.ori_idbanco =
                                                                           b.idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Simit';

    commit;

    -- actualiza informacion financiera FCM Polca
    update recaudo_local_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) = (select c.cta_disp_pa_banco,
                                                                        c.cta_disp_pa_tipo_cta,
                                                                        c.cta_disp_pa_cta,
                                                                        c.nit_fcm
                                                                   from cta_dispersion_fcm c
                                                                   where c.nit_fcm = '8000826650'and
                                                                   c.idbancorec = r.ori_idbanco )
     where r.fec_corte >= w_fec_cor_ini
       and r.fec_corte <= w_fec_cor_fin
       and r.indtipo = 'POLCA'
       and r.concepto = 'FCM Polca';

    -- actualiza cuenta contable FCM POLCA
    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select ctacon_fcma,
                                                                           '',
                                                                           '',
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' LOCAL ' ||
                                                                           b.nombre ||
                                                                           ' FCM (1.8%)'
                                                                      from fcm   f,
                                                                           banco b
                                                                     where r.ori_idbanco =
                                                                           b.idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'FCM Polca';

    -- actualiza cuenta financiera Concesionario
    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_c
                                                                   from cta_dispersion_concesionario c
                                                                  where c.idconcesionario =
                                                                        r.idconcesionario
                                                                    and c.idconcepto = 1
                                                                    and r.ori_idbanco <> '52'
                                                                    and c.idbancorec = r.ori_idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and concepto = 'Concesionario';

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
                                                                    and c.idbancorec = r.ori_idbanco)
     where r.fec_corte >= w_fec_cor_ini
       and r.fec_corte <= w_fec_cor_fin
       and r.concepto = 'Concesionario';

    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_c
                                                                   from cta_dispersion_concesionario c
                                                                  where c.idconcesionario =
                                                                        r.idconcesionario
                                                                    and c.idconcepto = 5
                                                                    and c.idbancorec = r.ori_idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and idconcesionario = '03'
       and concepto = 'Concesionario';

    -- actualiza informacion contable concesionario
    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_puente,
                                                                           p.concesionario_s_cc,
                                                                           c.nit_c,
                                                                           ('RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' LOCAL ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' (6.5%)')
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.idconcesionario =
                                                                           p.idconcesionario
                                                                       and r.idconcesionario =
                                                                           c.idconcesionario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Concesionario';

    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_puente,
                                                                           p.concesionario_pm_cc,
                                                                           c.nit_c,
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' LOCAL ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' (3.25%)'
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.idconcesionario =
                                                                           p.idconcesionario
                                                                       and r.idconcesionario =
                                                                           c.idconcesionario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Concesionario';

    commit;
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
                                                                    and c.idbancorec = r.ori_idbanco )
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and concepto = 'Fondo Cobertura Concesionario';

    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_puente,
                                                                           p.fondo_cob_concesionario_s_cc,
                                                                           c.nit_c,
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' LOCAL ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' Fondo Cobertura (1.0%)'
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.idconcesionario =
                                                                           p.idconcesionario
                                                                       and r.idconcesionario =
                                                                           c.idconcesionario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Fondo Cobertura Concesionario';

    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_puente,
                                                                           p.fondo_cob_concesionario_pm_cc,
                                                                           c.nit_c,
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' LOCAL ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' Fondo Cobertura (0.5%)'
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.idconcesionario =
                                                                           p.idconcesionario
                                                                       and r.idconcesionario =
                                                                           c.idconcesionario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Fondo Cobertura Concesionario';

    commit;

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
                                                                    and c.idbancorec = r.ori_idbanco )
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and concepto = 'Fondo Cobertura Simit';

    -- actualiza cuenta contable fondo cobertura simir
    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_fondo_cobertura,
                                                                           p.fondo_cob_simit_s_cc,
                                                                           c.nit_c,
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' LOCAL ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' Fondo Cobertura (1.0%)'
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.idconcesionario =
                                                                           p.idconcesionario
                                                                       and r.idconcesionario =
                                                                           c.idconcesionario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Fondo Cobertura Simit';

    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_fondo_cobertura,
                                                                           p.fondo_cob_simit_pm_cc,
                                                                           c.nit_c,
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' LOCAL ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' Fondo Cobertura (1.0%)'
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.idconcesionario =
                                                                           p.idconcesionario
                                                                       and r.idconcesionario =
                                                                           c.idconcesionario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Fondo Cobertura Simit';

    commit;

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
                                                                    and c.idbancorec = r.ori_idbanco )
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Equilibrio Economico';

    -- actualiza cuenta contable Equilibrio
    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_puente,
                                                                           p.equilibrio_economico_s_cc,
                                                                           c.nit_c,
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' LOCAL ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' Equilibrio (2.5%)'
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.idconcesionario =
                                                                           p.idconcesionario
                                                                       and r.idconcesionario =
                                                                           c.idconcesionario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Equilibrio Economico';

    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_puente,
                                                                           p.equilibrio_economico_s_cc,
                                                                           c.nit_c,
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' LOCAL ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' Equilibrio (2.5%)'
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.idconcesionario =
                                                                           p.idconcesionario
                                                                       and r.idconcesionario =
                                                                           c.idconcesionario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Equilibrio Economico';

    COMMIT;

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
                                                                    and c.idbancorec = r.ori_idbanco )
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Sevial';

    -- actualiza cuenta contable sevial
    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_puente,
                                                                           p.sevial_pp_cc,
                                                                           '8301123291',
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' LOCAL ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' Sevial (5.7%)'
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.idconcesionario =
                                                                           p.idconcesionario
                                                                       and r.idconcesionario =
                                                                           c.idconcesionario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Sevial';

    COMMIT;

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
                                                                    and c.idbancorec = r.ori_idbanco )
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Polca';

    -- actualiza cuenta contable Polca
    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_polca,
                                                                           '',
                                                                           '',
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' LOCAL ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' (39.78%)'
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.idconcesionario =
                                                                           p.idconcesionario
                                                                       and r.idconcesionario =
                                                                           c.idconcesionario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Polca';

    -- actualiza el tipo de cuenta origen
    update recaudo_local_disp r
       set r.ori_tipocuenta = (select c.tipocuenta
                                 from cta_recaudo_fcm c
                                where c.cuenta = r.ori_cuenta)
     where r.fec_corte >= w_fec_cor_ini
       and r.fec_corte <= w_fec_cor_fin;

    -- actualiza cuenta contable partida credito
    update recaudo_local_disp r
       set (cre_cta_con, cre_cen_cos, cre_nit_ter) = (select c.cta_contable,
                                                             '',
                                                             ''
                                                        from cta_recaudo_fcm c
                                                       where c.nit_fcm =
                                                             '8000826650'
                                                         and c.idbanco =
                                                             r.ori_idbanco
                                                         and c.indtipo =
                                                             r.indtipo
                                                         and c.tipocuenta =
                                                             r.ori_tipocuenta
                                                         and c.cuenta =
                                                             r.ori_cuenta)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    COMMIT;

    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_local_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    p_error := 'OK ' ||
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

  PROCEDURE causa_gas_recaudo_local(p_fec_ini_ano number,
                                    p_fec_ini_mes number,
                                    p_fec_ini_dia number,
                                    p_fec_fin_ano number,
                                    p_fec_fin_mes number,
                                    p_fec_fin_dia number,
                                    p_usuario     varchar2,
                                    p_error       OUT VARCHAR2) as

    w_fec_cor_ini date;
    w_fec_cor_fin date;
    /*w_fecmin_cor_ini date;*/
    /*w_fecmax_cor_fin date;*/
    w_registros number;
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error);

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

    delete from recaudo_local_causacion
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and operacion = 'GASTO';

    COMMIT;

    -- obtener partidas vlr neto concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             null,
             sum(s_valor_6),
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_puente),
             max(p.concesionario_s_cc),
             max(c.nit_c),
             1, -- orden
             'Por Pagar Recaudo ' || max(indtipo) || ' Local ' ||
             max(c.nombre) || ' (6.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr neto concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             null, -- valor debito
             sum(p_valor_25), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_puente),
             max(p.concesionario_pm_cc),
             max(c.nit_c),
             1, -- orden
             'Por Pagar Recaudo ' || max(indtipo) || ' Local ' ||
             max(c.nombre) || ' (3.25%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas fondo cobertura concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             null,
             sum(s_valor_3),
             '',
             '',
             '',
             max(f.ctacon_puente),
             max(p.fondo_cob_concesionario_s_cc),
             max(c.nit_c),
             2, -- orden
             'Por Pagar Fondo Cobertura Conces ' || max(indtipo) ||
             ' Local ' || max(c.nombre) || ' (0.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas fondo cobertura concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             null,
             sum(p_valor_9),
             '',
             '',
             '',
             max(f.ctacon_puente),
             max(p.fondo_cob_concesionario_pm_cc),
             max(c.nit_c),
             2, -- orden
             'Por Pagar Fondo Cobertura Conces ' || max(indtipo) ||
             ' Local ' || max(c.nombre) || ' (0.25%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas debito vlr neto concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             sum(s_valor_6),
             null,
             max(p.ctacon_gas), -- cuenta debito
             max(p.concesionario_pm_cc), -- centro debito
             max(c.nit_c), -- nit debito
             '',
             '',
             '',
             3, -- orden
             'Gasto Recaudo ' || max(indtipo) || ' Local ' || max(c.nombre) ||
             ' (6.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas debito vlr neto concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             sum(p_valor_25),
             null,
             max(p.ctacon_gas), -- cuenta debito
             max(p.concesionario_pm_cc), -- centro debito
             max(c.nit_c), -- nit debito
             '',
             '',
             '',
             3, -- orden
             'Gasto Recaudo ' || max(indtipo) || ' Local ' || max(c.nombre) ||
             ' (3.25%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas fondo cobertura concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             sum(s_valor_3),
             null,
             max(p.ctacon_gas), -- cuenta debito
             max(p.fondo_cob_concesionario_s_cc),
             max(c.nit_c), -- nit debito
             '',
             '',
             '',
             4, -- orden
             'Gasto Fondo Cobertura Conces ' || max(indtipo) || ' Local ' ||
             max(c.nombre) || ' (0.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas fondo cobertura concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             sum(p_valor_9),
             null,
             max(p.ctacon_gas), -- cuenta debito
             max(p.fondo_cob_concesionario_pm_cc),
             max(c.nit_c), -- nit debito
             '',
             '',
             '',
             4, -- orden
             'Gasto Fondo Cobertura Conces ' || max(indtipo) || ' Local ' ||
             max(c.nombre) || ' (0.25%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas sevial
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario,
             sum(p_valor_13), -- valor debito
             null, -- valor credito
             max(p.ctacon_gas), -- cuenta debito
             max(p.sevial_pp_cc),
             '8301123291', -- nit debito
             '',
             '',
             '',
             5, -- orden
             'Gasto Sevial ' || max(indtipo) || ' Local ' || ' (3.05%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_local_liquidacion r, p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.idconcesionario = p.idconcesionario
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas sevial
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario,
             null, -- valor debito
             sum(p_valor_13), -- valor credito
             '', -- cuenta credito
             '', -- cc credito
             '', -- nit credito
             max(f.ctacon_puente), -- cuenta debito
             max(p.sevial_pp_cc),
             '8301123291', -- nit debito
             6, -- orden
             'Gasto Sevial ' || max(indtipo) || ' Local ' || ' (3.05%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_local_liquidacion  r,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.idconcesionario = p.idconcesionario
       group by r.idbanco, r.cta_recaudo;

    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_local_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and ind_proceso = 1;

    p_error := 'OK ' ||
               w_registros;

    sp_log(p_usuario,
           'Cuasacion Gasto Recaudo Local',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia || '-' ||
           p_fec_fin_ano || '-' || p_fec_fin_mes || '-' || p_fec_fin_dia);

    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [causa_gas_recaudo_local] ' || SQLERRM,
            p_error);
  END causa_gas_recaudo_local;

  PROCEDURE causa_ing_recaudo_local(p_fec_ini_ano number,
                                    p_fec_ini_mes number,
                                    p_fec_ini_dia number,
                                    p_fec_fin_ano number,
                                    p_fec_fin_mes number,
                                    p_fec_fin_dia number,
                                    p_usuario     varchar2,
                                    p_error       OUT VARCHAR2) as

    w_fec_cor_ini date;
    w_fec_cor_fin date;
    /*w_fecmin_cor_ini date;*/
    /*w_fecmax_cor_fin date;*/
    w_registros number;
  begin

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error);

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

    delete from recaudo_local_causacion
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and operacion = 'INGRESO';

    COMMIT;

    -- obtener partidas vlr recaudo
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             sum(valor_total), -- valor debito
             null, -- valor credito
             max(c.cta_contable), -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             '', -- cuenta credito
             '', -- cc credito
             '', -- nit credito
             1, -- orden
             'Ingreso Recaudo ' || max(r.indtipo) || ' Local ' ||
             max(b.nombre),
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion r, cta_recaudo_fcm c, banco b
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.idbanco = b.idbanco
         and r.cta_recaudo = c.cuenta
         and r.idbanco = c.idbanco
         and c.nit_fcm = '8000826650'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr recaudo
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             sum(valor_total), -- valor debito
             null, -- valor credito
             max(c.cta_contable), -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             '', -- cuenta credito
             '', -- cc credito
             '', -- nit credito
             1, -- orden
             'Ingreso Recaudo ' || max(r.indtipo) || ' Local ' ||
             max(b.nombre),
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion r, cta_recaudo_fcm c, banco b
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.idbanco = b.idbanco
         and r.cta_recaudo = c.cuenta
         and r.idbanco = c.idbanco
         and c.nit_fcm = '8000826650'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr neto concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             null, -- valor debito
             sum(s_valor_6), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(p.ctacon_ing),
             max(p.concesionario_s_cc),
             max(c.nit_c),
             2, -- orden
             'Ingreso Concesionario Recaudo ' || max(r.indtipo) ||
             ' Local ' || max(c.nombre) || ' (6.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr neto concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             null, -- valor debito
             sum(p_valor_25), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(p.ctacon_ing),
             max(p.concesionario_pm_cc),
             max(c.nit_c),
             2, -- orden
             'Ingreso Concesionario Recaudo ' || max(r.indtipo) ||
             ' Local ' || max(c.nombre) || ' (3.25%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr fondo cobertura concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             null, -- valor debito
             sum(s_valor_3), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(p.ctacon_ing),
             max(p.fondo_cob_concesionario_s_cc),
             max(c.nit_c),
             3, -- orden
             'Ingreso Fondo Concesionario Recaudo ' || max(r.indtipo) ||
             ' Local ' || max(c.nombre) || ' (0.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr fondo cobertura concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             null, -- valor debito
             sum(p_valor_9), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(p.ctacon_ing),
             max(p.fondo_cob_concesionario_pm_cc),
             max(c.nit_c),
             3, -- orden
             'Ingreso Fondo Concesionario Recaudo ' || max(r.indtipo) ||
             ' Local ' || max(c.nombre) || ' (0.25%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr fondo cobertura fcm
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(s_valor_4), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_ingreso),
             max(p.fondo_cob_simit_s_cc),
             max(f.nit_fcm),
             4, -- orden
             'Ingreso Fondo FCM Recaudo ' || max(r.indtipo) ||
             ' Local  (0.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and p.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr fondo cobertura fcm
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(p_valor_10), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_ingreso),
             max(p.fondo_cob_simit_pm_cc),
             max(f.nit_fcm),
             4, -- orden
             'Ingreso Fondo FCM Recaudo ' || max(r.indtipo) ||
             ' Local  (0.25%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and p.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr simit
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(s_valor_1), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_ingreso),
             max(p.simit_s_cc),
             max(f.nit_fcm),
             5, -- orden
             'Ingreso FCM Recaudo ' || max(r.indtipo) || ' Local  (2.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and p.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr simit
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(p_valor_27), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_ingreso),
             max(p.simit_pm_cc),
             max(f.nit_fcm),
             5, -- orden
             'Ingreso FCM Recaudo ' || max(r.indtipo) || ' Local  (3.25%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and p.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- falta: neto polca, 1,8, 2,7 impuestos, sevial

    -- obtener partidas vlr polca
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(p_valor_15), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_polca),
             '',
             max(f.nit_polca),
             6, -- orden
             'Ingreso Polca ' || max(r.indtipo) || ' Local  (39.78%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion r, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr sevial 2.7
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(p_valor_17), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_impuestos),
             max(p.sevial_cp_cc),
             max(f.nit_sevial),
             7, -- orden
             'Ingreso Sevial ' || max(r.indtipo) || ' Local  (2.7%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and p.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr sevial 3.0
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(p_valor_13), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(p.ctacon_ing),
             max(p.sevial_pp_cc),
             max(f.nit_sevial),
             7, -- orden
             'Ingreso Sevial ' || max(r.indtipo) || ' Local  (3.0%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and p.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr fcm 1.8
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(p_valor_16), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_impuestos),
             max(p.fcm_cp_cc),
             max(f.nit_fcm),
             8, -- orden
             'Ingreso FCM ' || max(r.indtipo) || ' Local  (1.8%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and p.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlriva 2.7
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(p_valor_20), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_impuestos),
             max(p.sevial_cp_cc),
             max(f.nit_sevial),
             9, -- orden
             'Ingreso IVA ' || max(r.indtipo) || ' Local  (2.7%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and p.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlriva 1.8
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(p_valor_19), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_impuestos),
             max(p.fcm_cp_cc),
             max(f.nit_fcm),
             10, -- orden
             'Ingreso IVA ' || max(r.indtipo) || ' Local  (1.8%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and p.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlriva impuesto timbre
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(p_valor_23), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_impuestos),
             '',
             max(f.nit_fcm),
             11, -- orden
             'Ingreso Impuesto Timbre ' || max(r.indtipo) ||
             ' Local (0.75%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion r, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlriva impuesto timbre
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             sum(p_valor_23), -- valor debito
             null, -- valor credito
             max(f.ctacon_impuestos),
             '',
             max(f.nit_fcm),
             '', -- cuenta credito
             '', -- centro credito
             '', -- nit credito
             12, -- orden
             'Ingreso Impuesto Timbre ' || max(r.indtipo) ||
             ' Local (0.75%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion r, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
       group by r.idbanco, r.cta_recaudo;

    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_local_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and ind_proceso = 1;

    p_error := 'OK ' ||
               w_registros;

    sp_log(p_usuario,
           'Cuasacion Ingreso Recaudo Local',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia || '-' ||
           p_fec_fin_ano || '-' || p_fec_fin_mes || '-' || p_fec_fin_dia);

    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [causa_ing_recaudo_local] ' || SQLERRM,
            p_error);
  END causa_ing_recaudo_local;

  PROCEDURE dispersa_recaudo_externo(p_fec_ini_ano number,
                                     p_fec_ini_mes number,
                                     p_fec_ini_dia number,
                                     p_fec_fin_ano number,
                                     p_fec_fin_mes number,
                                     p_fec_fin_dia number,
                                     p_usuario     varchar2,
                                     p_error       OUT VARCHAR2) as

    w_fec_cor_ini    date;
    w_fec_cor_fin    date;
    w_fecmin_cor_ini date;
    w_fecmax_cor_fin date;
    w_registros      number;

  begin
    -- VALIDACIONES
    if (not p_usuario = '99999999' )  THEN
        sp_v_usuario(p_usuario, p_error);
    END IF;

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
             fec_dispersion,
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
       group by id_concesionario_liq, fec_dispersion, idbanco, cta_recaudo;


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
             fec_dispersion,
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
       group by id_concesionario_liq, fec_dispersion, idbanco, cta_recaudo;

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
             fec_dispersion,
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
       group by id_concesionario_liq, fec_dispersion, idbanco, cta_recaudo;

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
             fec_dispersion,
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
       group by id_concesionario_liq, fec_dispersion, idbanco, cta_recaudo;

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
             fec_dispersion,
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
       group by id_concesionario_liq, fec_dispersion, idbanco, cta_recaudo;

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
             fec_dispersion,
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
       group by id_concesionario_liq, fec_dispersion, idbanco, cta_recaudo;

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
             fec_dispersion,
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
       group by id_concesionario_liq, fec_dispersion, idbanco, cta_recaudo;

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
             fec_dispersion,
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
       group by id_concesionario_liq, fec_dispersion, idbanco, cta_recaudo;

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
             fec_dispersion,
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
       group by id_concesionario_liq, fec_dispersion, idbanco, cta_recaudo;

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
             fec_dispersion,
             id_concesionario_liq,
             9, -- orden
             sum(p_valor_7 + p_valor_10 + decode(id_concesionario_liq,5, p_valor_15,  0 )),
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
       group by id_concesionario_liq, fec_dispersion, idbanco, cta_recaudo;

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
             fec_dispersion,
             id_concesionario_liq,
             9, -- orden
             sum(decode(id_concesionario_liq,5, p_valor_13 - p_valor_15,  0 )),
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
       group by id_concesionario_liq, fec_dispersion, idbanco, cta_recaudo;

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
             fec_dispersion,
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
                fec_dispersion,
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
             fec_dispersion,
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
                fec_dispersion,
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
             fec_dispersion,
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
       group by id_concesionario_liq, fec_dispersion, idbanco, cta_recaudo;

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
             fec_dispersion,
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
       group by id_concesionario_liq, fec_dispersion, idbanco, cta_recaudo;

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

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
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
             fec_dispersion,
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
       group by id_concesionario_liq, fec_dispersion, idbanco, cta_recaudo;

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
             fec_dispersion,
             id_concesionario_liq,
             11, -- orden
             sum(decode(id_concesionario_liq,5, 0,p_valor_13 )),
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
       group by id_concesionario_liq, fec_dispersion, idbanco, cta_recaudo;

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
             fec_dispersion,
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
       group by id_concesionario_liq, fec_dispersion, idbanco, cta_recaudo;
       
       
       -- ajustar fecha de dispersion para inicio de mes
       update recaudo_externo_disp r
       set r.fec_dispersion =  fn_fec_dispersion(w_fec_cor_ini,
                                                0,
                                                3,
                                                p_usuario)  
    where r.fec_corte_ini >= w_fec_cor_ini
       and r.fec_corte_fin <= w_fec_cor_fin
       and r.concepto not in ( 'Liquidacion SIMIT', 
                               'Contravencional FCM', 
                               'Municipio', 
                               'Acuerdo Pago', 
                               'Tercero 1',
                               'Tercero 2', 
                               'Tercero 3', 
                               'Tercero 4', 
                               'POLCA FCM');
       

    -- actualiza cuenta BANCO simit
    update recaudo_externo_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) = (select c.cta_disp_s_banco,
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
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) = (select c.cta_disp_p_banco,
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
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_c
                                                                   from cta_dispersion_concesionario c
                                                                  where c.idconcesionario =
                                                                        r.id_concesionario_liq
                                                                    and c.idconcepto = 1
                                                                    and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Concesionario';


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
                                                                    and c.idbancorec = r.ori_idbanco )
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
                                                                    and c.idbancorec = r.ori_idbanco)
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
                                                                    and c.idbancorec = r.ori_idbanco                                                                     )
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
                                                                   where c.idbancorec = r.ori_idbanco )
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
                                                                   where c.idbancorec = r.ori_idbanco )
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
                                                                   where c.idbancorec = r.ori_idbanco)
     where r.fec_corte_ini >= w_fec_cor_ini
       and r.fec_corte_fin <= w_fec_cor_fin
       and r.indtipo = 'POLCA'
       and r.concepto = 'Acuerdo Pago';

    commit;


    -- actualiza cuenta BANCO Concesionario Contravencional
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) = (select idbanco,
                                                                        tipocuenta,
                                                                        cuenta,
                                                                        nit_c
                                                                   from cta_dispersion_concesionario c
                                                                  where c.idconcesionario = r.id_concesionario_pro
                                                                    and c.idconcepto = 3
                                                                    and c.idbancorec = r.ori_idbanco)
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
                                                                  where c.idconcesionario = r.id_concesionario_liq
                                                                    and c.idconcepto = 4
                                                                    and c.idbancorec = r.ori_idbanco)
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
                                                                    and c.idbancorec = r.ori_idbanco )
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
                                                                    and c.idbancorec = r.ori_idbanco )
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
                                                                   where c.idbancorec = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'POLCA FCM';


    -- actualiza el tipo de cuenta origen
    update recaudo_externo_disp r
       set r.ori_tipocuenta = (select c.tipocuenta
                                 from cta_recaudo_concesionario c
                                where c.cuenta = r.ori_cuenta
                                and   c.idconcesionario = r.id_concesionario_liq )
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

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
       set r.concepto = (select m.idmunicipio || ' Municipio ' ||  m.nombre
                           from municipio m
                          where m.idmunicipio = r.idmunicipio)
     where r.concepto = 'Municipio'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto = (select 'Acuerdo Pago ' || m.idmunicipio || ' ' || m.nombre
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
       set r.concepto = (select t.nombre
                           from tercero t
                          where t.idmunicipio = r.idmunicipio
                            and t.num_tercero = 1)
     where r.concepto = 'Tercero 1'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto = (select t.nombre
                           from tercero t
                          where t.idmunicipio = r.idmunicipio
                            and t.num_tercero = 2)
     where r.concepto = 'Tercero 2'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto = (select t.nombre
                           from tercero t
                          where t.idmunicipio = r.idmunicipio
                            and t.num_tercero = 3)
     where r.concepto = 'Tercero 3'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto = (select t.nombre
                           from tercero t
                          where t.idmunicipio = r.idmunicipio
                            and t.num_tercero = 4)
     where r.concepto = 'Tercero 4'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

-- crear valor de tercero totalizado
insert into recaudo_externo_disp
  (
  fec_corte_ini,
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
  concepto_con)
select        min(fec_corte_ini),
              min(fec_corte_fin),
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
              max(usuario_proceso),
              max(fecha_proceso),
              sum(valor),
              max(deb_cta_con),
              max(deb_cen_cos),
              max(deb_nit_ter),
              max(cre_cta_con),
              max(cre_cen_cos),
              max(cre_nit_ter),
              max(concepto_con)
        from recaudo_externo_disp
       where fec_corte_ini = w_fec_cor_ini
         and orden in (2,3,4)
       group by
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
              indtipo;

      delete
        from recaudo_externo_disp
       where fec_corte_ini = w_fec_cor_ini
         and orden in (2,3,4)
         and idmunicipio is not null;



    delete
      from recaudo_externo_disp
       where valor = 0;


    COMMIT;

    -- actualiza cuenta contable simit
    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select ctacon_fcm,
                                                                           '',
                                                                           '',
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre ||
                                                                           ' FCM (2.5%)'
                                                                      from fcm   f,
                                                                           banco b
                                                                     where r.ori_idbanco =
                                                                           b.idbanco)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Simit';


        update recaudo_externo_disp r
           set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select ctacon_fcm,
                                                                               '',
                                                                               '',
                                                                               'RECAUDO ' ||
                                                                               r.indtipo ||
                                                                               ' EXTERNO ' ||
                                                                               b.nombre ||
                                                                               ' FCM (3.25%)'
                                                                          from fcm   f,
                                                                               banco b
                                                                         where r.ori_idbanco =
                                                                               b.idbanco)
         where fec_dispersion >= w_fec_cor_ini
           and fec_dispersion <= w_fec_cor_fin
           and indtipo = 'POLCA'
           and concepto = 'Simit';

        commit;


        -- actualiza cuenta contable FCM POLCA
        update recaudo_local_disp r
           set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select ctacon_fcma,
                                                                               '',
                                                                               '',
                                                                               'RECAUDO ' ||
                                                                               r.indtipo ||
                                                                               ' LOCAL ' ||
                                                                               b.nombre ||
                                                                               ' FCM (1.8%)'
                                                                          from fcm   f,
                                                                               banco b
                                                                         where r.ori_idbanco =
                                                                               b.idbanco)
         where fec_dispersion >= w_fec_cor_ini
           and fec_dispersion <= w_fec_cor_fin
           and indtipo = 'POLCA'
           and concepto = 'FCM Polca';


    -- actualiza informacion contable concesionario
    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_puente,
                                                                           p.concesionario_s_cc,
                                                                           c.nit_c,
                                                                           ('RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' (6.5%)')
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.id_concesionario_liq =
                                                                           p.idconcesionario
                                                                       and r.id_concesionario_liq =
                                                                           c.idconcesionario)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Concesionario';

    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_puente,
                                                                           p.concesionario_pm_cc,
                                                                           c.nit_c,
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' (3.25%)'
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.id_concesionario_liq =
                                                                           p.idconcesionario
                                                                       and r.id_concesionario_liq =
                                                                           c.idconcesionario)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Concesionario';

    commit;


    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_puente,
                                                                           p.fondo_cob_concesionario_s_cc,
                                                                           c.nit_c,
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' Fondo Cobertura (1.0%)'
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.id_concesionario_liq =
                                                                           p.idconcesionario
                                                                       and r.id_concesionario_liq =
                                                                           c.idconcesionario)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Fondo Cobertura Concesionario';

    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_puente,
                                                                           p.fondo_cob_concesionario_pm_cc,
                                                                           c.nit_c,
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' Fondo Cobertura (0.5%)'
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.id_concesionario_liq =
                                                                           p.idconcesionario
                                                                       and r.id_concesionario_liq =
                                                                           c.idconcesionario)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Fondo Cobertura Concesionario';

    commit;


    -- actualiza cuenta contable fondo cobertura simir
    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_fondo_cobertura,
                                                                           p.fondo_cob_simit_s_cc,
                                                                           c.nit_c,
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' Fondo Cobertura (1.0%)'
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.id_concesionario_liq =
                                                                           p.idconcesionario
                                                                       and r.id_concesionario_liq =
                                                                           c.idconcesionario)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Fondo Cobertura Simit';

    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_fondo_cobertura,
                                                                           p.fondo_cob_simit_pm_cc,
                                                                           c.nit_c,
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' Fondo Cobertura (0.5%)'
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.id_concesionario_liq =
                                                                           p.idconcesionario
                                                                       and r.id_concesionario_liq =
                                                                           c.idconcesionario)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Fondo Cobertura Simit';

    commit;


    -- actualiza cuenta contable Equilibrio
    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_puente,
                                                                           p.equilibrio_economico_s_cc,
                                                                           c.nit_c,
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' Equilibrio (2.5%)'
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.id_concesionario_liq =
                                                                           p.idconcesionario
                                                                       and r.id_concesionario_liq =
                                                                           c.idconcesionario)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Equilibrio Economico';

    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_puente,
                                                                           p.equilibrio_economico_s_cc,
                                                                           c.nit_c,
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' Equilibrio (1.77%)'
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.id_concesionario_liq =
                                                                           p.idconcesionario
                                                                       and r.id_concesionario_liq =
                                                                           c.idconcesionario)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Equilibrio Economico';

    COMMIT;


    -- actualiza cuenta contable Municipio
    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select '29059004',
                                                                           '',
                                                                           '',
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           m.nombre ||
                                                                           ' Municipio'
                                                                      from fcm       f,
                                                                           banco     b,
                                                                           municipio m
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.idmunicipio =
                                                                           m.idmunicipio)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Municipio';

    -- actualiza cuenta contable Municipio
    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select '29059007',
                                                                           '',
                                                                           '',
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           m.nombre ||
                                                                           ' Municipio'
                                                                      from fcm       f,
                                                                           banco     b,
                                                                           municipio m
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.idmunicipio =
                                                                           m.idmunicipio)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Municipio';


    -- actualiza cuenta contable Tercero 1 - Simit
    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select '29059004',
                                                                           '',
                                                                           '',
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           t.nombre || ' ' ||
                                                                           m.nombre ||
                                                                           ' Municipio'
                                                                      from fcm       f,
                                                                           banco     b,
                                                                           municipio m,
                                                                           tercero   t
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.idmunicipio =
                                                                           m.idmunicipio
                                                                       and r.idmunicipio =
                                                                           t.idmunicipio
                                                                       and t.num_tercero = 1)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Tercero 1';

    -- actualiza cuenta contable Tercero 2 - Simit
    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select '29059004',
                                                                           '',
                                                                           '',
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           t.nombre || ' ' ||
                                                                           m.nombre ||
                                                                           ' Municipio'
                                                                      from fcm       f,
                                                                           banco     b,
                                                                           municipio m,
                                                                           tercero   t
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.idmunicipio =
                                                                           m.idmunicipio
                                                                       and r.idmunicipio =
                                                                           t.idmunicipio
                                                                       and t.num_tercero = 2)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Tercero 2';

    -- actualiza cuenta contable Tercero 3 - Simit
    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select '29059004',
                                                                           '',
                                                                           '',
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           t.nombre || ' ' ||
                                                                           m.nombre ||
                                                                           ' Municipio'
                                                                      from fcm       f,
                                                                           banco     b,
                                                                           municipio m,
                                                                           tercero   t
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.idmunicipio =
                                                                           m.idmunicipio
                                                                       and r.idmunicipio =
                                                                           t.idmunicipio
                                                                       and t.num_tercero = 3)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Tercero 3';

    -- actualiza cuenta contable Tercero 4 - Simit
    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select '29059004',
                                                                           '',
                                                                           '',
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           t.nombre || ' ' ||
                                                                           m.nombre ||
                                                                           ' Municipio'
                                                                      from fcm       f,
                                                                           banco     b,
                                                                           municipio m,
                                                                           tercero   t
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.idmunicipio =
                                                                           m.idmunicipio
                                                                       and r.idmunicipio =
                                                                           t.idmunicipio
                                                                       and t.num_tercero = 4)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Tercero 4';

    -- actualiza cuenta contable Tercero 1 - Polca
    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select '29059007',
                                                                           '',
                                                                           '',
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           t.nombre || ' ' ||
                                                                           m.nombre ||
                                                                           ' Municipio'
                                                                      from fcm       f,
                                                                           banco     b,
                                                                           municipio m,
                                                                           tercero   t
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.idmunicipio =
                                                                           m.idmunicipio
                                                                       and r.idmunicipio =
                                                                           t.idmunicipio
                                                                       and t.num_tercero = 1)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Tercero 1';

    -- actualiza cuenta contable Tercero 2 - Polca
    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select '29059007',
                                                                           '',
                                                                           '',
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           t.nombre || ' ' ||
                                                                           m.nombre ||
                                                                           ' Municipio'
                                                                      from fcm       f,
                                                                           banco     b,
                                                                           municipio m,
                                                                           tercero   t
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.idmunicipio =
                                                                           m.idmunicipio
                                                                       and r.idmunicipio =
                                                                           t.idmunicipio
                                                                       and t.num_tercero = 2)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Tercero 2';

    -- actualiza cuenta contable Tercero 3 - Polca
    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select '29059007',
                                                                           '',
                                                                           '',
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           t.nombre || ' ' ||
                                                                           m.nombre ||
                                                                           ' Municipio'
                                                                      from fcm       f,
                                                                           banco     b,
                                                                           municipio m,
                                                                           tercero   t
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.idmunicipio =
                                                                           m.idmunicipio
                                                                       and r.idmunicipio =
                                                                           t.idmunicipio
                                                                       and t.num_tercero = 3)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Tercero 3';

    -- actualiza cuenta contable Tercero 4 - Polca
    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select '29059007',
                                                                           '',
                                                                           '',
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           t.nombre || ' ' ||
                                                                           m.nombre ||
                                                                           ' Municipio'
                                                                      from fcm       f,
                                                                           banco     b,
                                                                           municipio m,
                                                                           tercero   t
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.idmunicipio =
                                                                           m.idmunicipio
                                                                       and r.idmunicipio =
                                                                           t.idmunicipio
                                                                       and t.num_tercero = 4)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Tercero 4';


    -- actualiza cuenta contable Acuerdo Pago - SIMIT
    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select '29059004',
                                                                           '',
                                                                           '',
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           m.nombre ||
                                                                           ' Acuerdo Pago'
                                                                      from fcm       f,
                                                                           banco     b,
                                                                           municipio m
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.idmunicipio =
                                                                           m.idmunicipio)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Acuerdo Pago';

    -- actualiza cuenta contable Acuerdo Pago - SIMIT
    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select '29059007',
                                                                           '',
                                                                           '',
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           m.nombre ||
                                                                           ' Acuerdo Pago'
                                                                      from fcm       f,
                                                                           banco     b,
                                                                           municipio m
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.idmunicipio =
                                                                           m.idmunicipio)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Acuerdo Pago';


    -- actualiza informacion contable concesionario contravencional
    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_puente,
                                                                           p.concesionario_s_cc,
                                                                           c.nit_c,
                                                                           ('RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' Contravencional')
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.id_concesionario_pro =
                                                                           p.idconcesionario
                                                                       and r.id_concesionario_pro =
                                                                           c.idconcesionario)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Concesionario Contravencional';

    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_puente,
                                                                           p.concesionario_pm_cc,
                                                                           c.nit_c,
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' Contravencional'
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.id_concesionario_pro =
                                                                           p.idconcesionario
                                                                       and r.id_concesionario_pro =
                                                                           c.idconcesionario)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Concesionario Contravencional';

    -- actualiza informacion contable fcm contravencional
    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_puente,
                                                                           p.concesionario_s_cc,
                                                                           c.nit_c,
                                                                           ('RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' FCM Contravencional')
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.id_concesionario_pro =
                                                                           p.idconcesionario
                                                                       and r.id_concesionario_pro =
                                                                           c.idconcesionario)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Fcm Contravencional';

    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_puente,
                                                                           p.concesionario_pm_cc,
                                                                           c.nit_c,
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' FCM Contravencional'
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.id_concesionario_pro =
                                                                           p.idconcesionario
                                                                       and r.id_concesionario_pro =
                                                                           c.idconcesionario)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Fcm Contravencional';


    -- actualiza cuenta contable sevial
    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_puente,
                                                                           p.sevial_pp_cc,
                                                                           '8301123291',
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' Sevial (5.7%)'
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.id_concesionario_liq =
                                                                           p.idconcesionario
                                                                       and r.id_concesionario_liq =
                                                                           c.idconcesionario)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Sevial';

    COMMIT;


    -- actualiza cuenta contable Polca
    update recaudo_externo_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) = (select f.ctacon_polca,
                                                                           '',
                                                                           '',
                                                                           'RECAUDO ' ||
                                                                           r.indtipo ||
                                                                           ' EXTERNO ' ||
                                                                           b.nombre || ' ' ||
                                                                           c.nombre ||
                                                                           ' (39.78%)'
                                                                      from fcm                        f,
                                                                           banco                      b,
                                                                           p_dispersion_concesionario p,
                                                                           concesionario              c
                                                                     where r.ori_idbanco =
                                                                           b.idbanco
                                                                       and r.id_concesionario_liq =
                                                                           p.idconcesionario
                                                                       and r.id_concesionario_liq =
                                                                           c.idconcesionario)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Polca';


    -- actualiza cuenta contable partida credito
    update recaudo_externo_disp r
       set (cre_cta_con, cre_cen_cos, cre_nit_ter) = (select c.cta_contable,
                                                             '',
                                                             ''
                                                        from cta_recaudo_concesionario c
                                                       where c.idbanco =
                                                             r.ori_idbanco
                                                         and c.indtipo =
                                                             r.indtipo
                                                         and c.tipocuenta =
                                                             r.ori_tipocuenta
                                                         and c.cuenta =
                                                             r.ori_cuenta
                                                         and c.idconcesionario =
                                                             r.id_concesionario_liq)
     where fec_dispersion >= w_fec_cor_ini
       and fec_dispersion <= w_fec_cor_fin;


    -- obtiene cantidad de registros procesados
    select count(*)
      into w_registros
      from recaudo_externo_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    p_error := 'Dispersion recaudo OK. Registros: ' ||
               w_registros;


    sp_log(p_usuario,
           'Dispersa Recaudo Externo',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia || '-' ||
           p_fec_fin_ano || '-' || p_fec_fin_mes || '-' || p_fec_fin_dia);
    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [dispersa_recaudo_externo] ' || SQLERRM,
            p_error);
  END dispersa_recaudo_externo;

  PROCEDURE causa_gas_recaudo_externo(p_fec_ini_ano number,
                                      p_fec_ini_mes number,
                                      p_fec_ini_dia number,
                                      p_fec_fin_ano number,
                                      p_fec_fin_mes number,
                                      p_fec_fin_dia number,
                                      p_usuario     varchar2,
                                      p_error       OUT VARCHAR2) as

    w_fec_cor_ini date;
    w_fec_cor_fin date;
    /*w_fecmin_cor_ini date;*/
    /*w_fecmax_cor_fin date;*/
    w_registros number;
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error);

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

    delete from recaudo_externo_causacion
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and operacion = 'GASTO';

    COMMIT;

    -- obtener partidas vlr neto concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null,
             sum(s_valor_28),
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_puente),
             max(p.concesionario_s_cc),
             max(c.nit_c),
             1, -- orden
             'Por Pagar Recaudo ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (6.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr neto concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null, -- valor debito
             sum(p_valor_41), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_puente),
             max(p.concesionario_pm_cc),
             max(c.nit_c),
             1, -- orden
             'Por Pagar Recaudo ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (3.25%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas fondo cobertura concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null,
             sum(s_valor_5),
             '',
             '',
             '',
             max(f.ctacon_puente),
             max(p.fondo_cob_concesionario_s_cc),
             max(c.nit_c),
             2, -- orden
             'Por Pagar Fondo Cobertura Conces ' || max(indtipo) ||
             ' Externo ' || max(c.nombre) || ' (0.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas fondo cobertura concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null,
             sum(p_valor_5),
             '',
             '',
             '',
             max(f.ctacon_puente),
             max(p.fondo_cob_concesionario_pm_cc),
             max(c.nit_c),
             2, -- orden
             'Por Pagar Fondo Cobertura Conces ' || max(indtipo) ||
             ' Externo ' || max(c.nombre) || ' (0.25%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas debito vlr neto concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             sum(s_valor_28),
             null,
             max(p.ctacon_gas), -- cuenta debito
             max(p.concesionario_s_cc), -- centro debito
             max(c.nit_c), -- nit debito
             '',
             '',
             '',
             3, -- orden
             'Gasto Recaudo ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (6.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas debito vlr neto concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             sum(p_valor_41),
             null,
             max(p.ctacon_gas), -- cuenta debito
             max(p.concesionario_pm_cc), -- centro debito
             max(c.nit_c), -- nit debito
             '',
             '',
             '',
             3, -- orden
             'Gasto Recaudo ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (3.25%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas fondo cobertura concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             sum(s_valor_5),
             null,
             max(p.ctacon_gas), -- cuenta debito
             max(p.fondo_cob_concesionario_s_cc),
             max(c.nit_c), -- nit debito
             '',
             '',
             '',
             4, -- orden
             'Gasto Fondo Cobertura Conces ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (0.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas fondo cobertura concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             sum(p_valor_5),
             null,
             max(p.ctacon_gas), -- cuenta debito
             max(p.fondo_cob_concesionario_pm_cc),
             max(c.nit_c), -- nit debito
             '',
             '',
             '',
             4, -- orden
             'Gasto Fondo Cobertura Conces ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (0.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas sevial
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario,
             sum(p_valor_9), -- valor debito
             null, -- valor credito
             max(p.ctacon_gas), -- cuenta debito
             max(p.sevial_pp_cc),
             '8301123291', -- nit debito
             '',
             '',
             '',
             5, -- orden
             'Gasto Sevial ' || max(indtipo) || ' Externo ' || ' (3.0%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = p.idconcesionario
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas sevial
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario,
             null, -- valor debito
             sum(p_valor_9), -- valor credito
             '', -- cuenta credito
             '', -- cc credito
             '', -- nit credito
             max(f.ctacon_puente), -- cuenta debito
             max(p.sevial_pp_cc),
             '8301123291', -- nit debito
             6, -- orden
             'Gasto Sevial ' || max(indtipo) || ' Externo ' || ' (3.0%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = p.idconcesionario
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas debito honorarios contravencional
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             sum(s_valor_11),
             null,
             max(f.ctacon_puente_ext),
             '0532',
             max(c.nit_c),
             '',
             '',
             '',
             7, -- orden
             'Honorarios ' || max(indtipo) || ' Externo ' || max(c.nombre) ||
             ' (9.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.id_concesionario_pro = c.idconcesionario
       group by r.id_concesionario_liq,
                r.id_concesionario_pro,
                r.idbanco,
                r.cta_recaudo;

    -- obtener partidas debito honorarios contravencional
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             sum(p_valor_24),
             null,
             max(f.ctacon_puente_ext),
             '0532',
             max(c.nit_c),
             '',
             '',
             '',
             7, -- orden
             'Honorarios ' || max(indtipo) || ' Externo ' || max(c.nombre) ||
             ' (9.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_pro = c.idconcesionario
       group by r.id_concesionario_liq,
                r.id_concesionario_pro,
                r.idbanco,
                r.cta_recaudo;

    -- obtener partidas debio iva honorarios contravencional
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             ROUND(sum(s_valor_11) * (max(f.iva) / 100), 2),
             null,
             max(f.ctacon_puente_ext),
             '0532',
             max(c.nit_c),
             '',
             '',
             '',
             8, -- orden
             'Iva Honorarios ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (16%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.id_concesionario_pro = c.idconcesionario
       group by r.id_concesionario_liq,
                r.id_concesionario_pro,
                r.idbanco,
                r.cta_recaudo;

    -- obtener partidas debito iva honorarios contravencional
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             ROUND(sum(p_valor_24) * (max(f.iva) / 100), 2),
             null,
             max(f.ctacon_puente_ext),
             '0532',
             max(c.nit_c),
             '',
             '',
             '',
             8, -- orden
             'Iva Honorarios ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (16%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_pro = c.idconcesionario
       group by r.id_concesionario_liq,
                r.id_concesionario_pro,
                r.idbanco,
                r.cta_recaudo;

    -- obtener partidas credito retefuente honorarios
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null,
             ROUND(sum(s_valor_11) * (max(f.retencion_fuente) / 100), 2),
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             '0532',
             max(c.nit_c), -- nit credito
             9, -- orden
             'Rfte Honorarios ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (11%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.id_concesionario_pro = c.idconcesionario
       group by r.id_concesionario_liq,
                r.id_concesionario_pro,
                r.idbanco,
                r.cta_recaudo;

    -- obtener partidas credito retefuente honorarios
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null,
             ROUND(sum(p_valor_24) * (max(f.retencion_fuente) / 100), 2),
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             '0532',
             max(c.nit_c), -- nit credito
             9, -- orden
             'Rfte Honorarios ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (11%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_pro = c.idconcesionario
       group by r.id_concesionario_liq,
                r.id_concesionario_pro,
                r.idbanco,
                r.cta_recaudo;

    -- obtener partidas credito cuentas por pagar
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null,
             ROUND(sum(s_valor_11) + sum(s_valor_11) * (max(f.iva) / 100) -
                   sum(s_valor_11) * (max(f.retencion_fuente) / 100),
                   2),
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             '0532',
             max(c.nit_c), -- nit credito
             10, -- orden
             'CXP Operador ' || max(indtipo) || ' Externo ' ||
             max(c.nombre),
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.id_concesionario_pro = c.idconcesionario
       group by r.id_concesionario_liq,
                r.id_concesionario_pro,
                r.idbanco,
                r.cta_recaudo;

    -- obtener partidas credito cuentas por pagar
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null,
             ROUND(sum(p_valor_24) + sum(p_valor_24) * (max(f.iva) / 100) -
                   sum(s_valor_24) * (max(f.retencion_fuente) / 100),
                   2),
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             '0532',
             max(c.nit_c), -- nit credito
             10, -- orden
             'CXP Operador ' || max(indtipo) || ' Externo ' ||
             max(c.nombre),
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_pro = c.idconcesionario
       group by r.id_concesionario_liq,
                r.id_concesionario_pro,
                r.idbanco,
                r.cta_recaudo;

    -- obtener partidas debito honorarios sevial
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             sum(p_valor_14),
             null,
             max(f.ctacon_puente_ext),
             '0511',
             '8301123291',
             '',
             '',
             '',
             11, -- orden
             'Honorarios Sevial ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (2.7%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas debito iva honorarios sevial
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             ROUND(sum(p_valor_14) * (max(f.iva) / 100), 2),
             null,
             max(f.ctacon_puente_ext),
             '0511',
             '8301123291',
             '',
             '',
             '',
             12, -- orden
             'Iva Honorarios Sevial ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (16%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas credito rfte honorarios sevial
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null,
             ROUND(sum(p_valor_14) * (max(f.retencion_fuente) / 100), 2),
             '',
             '',
             '',
             max(f.ctacon_puente_ext),
             '0511',
             '8301123291',
             13, -- orden
             'Rfte Honorarios Sevial ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (11%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas credito timbre honorarios sevial
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null,
             ROUND(sum(p_valor_14) * (max(f.impuesto_timbre_tercero) / 100),
                   2),
             '',
             '',
             '',
             max(f.ctacon_puente_ext),
             '0511',
             '8301123291',
             14, -- orden
             'Timbre Honorarios Sevial ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (1.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas credito CXP honorarios sevial
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null,
             ROUND(sum(p_valor_14) + sum(p_valor_14) * (max(f.iva) / 100) -
                   sum(p_valor_14) * (max(f.retencion_fuente) / 100) -
                   sum(p_valor_14) * (max(f.impuesto_timbre_tercero) / 100),
                   2),
             '',
             '',
             '',
             max(f.ctacon_puente_ext),
             '0511',
             '8301123291',
             14, -- orden
             'CXP Honorarios Sevial ' || max(indtipo) || ' Externo ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_externo_causacion
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and operacion = 'GASTO';

    p_error := 'Causado Gasto Recuado Externo exitosamente. Registros: ' ||
               w_registros;

    sp_log(p_usuario,
           'Cuasacion Gasto Recaudo Externo',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia || '-' ||
           p_fec_fin_ano || '-' || p_fec_fin_mes || '-' || p_fec_fin_dia);

    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [causa_gas_recaudo_externo] ' || SQLERRM,
            p_error);
  END causa_gas_recaudo_externo;

  PROCEDURE causa_ing_recaudo_externo(p_fec_ini_ano number,
                                      p_fec_ini_mes number,
                                      p_fec_ini_dia number,
                                      p_fec_fin_ano number,
                                      p_fec_fin_mes number,
                                      p_fec_fin_dia number,
                                      p_usuario     varchar2,
                                      p_error       OUT VARCHAR2) as

    w_fec_cor_ini date;
    w_fec_cor_fin date;
    /*w_fecmin_cor_ini date;*/
    /*w_fecmax_cor_fin date;*/
    w_registros number;
  begin

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error);

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

    delete from recaudo_externo_causacion
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and operacion = 'INGRESO';

    COMMIT;

    -- obtener partidas vlr recaudo
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             sum(valor_total), -- valor debito
             null, -- valor credito
             max(c.cta_contable), -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             '', -- cuenta credito
             '', -- cc credito
             '', -- nit credito
             1, -- orden
             'Ingreso Recaudo ' || max(r.indtipo) || ' Externo ' ||
             max(b.nombre),
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             cta_recaudo_concesionario   c,
             banco                       b
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.idbanco = b.idbanco
         and r.cta_recaudo = c.cuenta
         and r.idbanco = c.idbanco
         and r.indtipo = c.indtipo
         and r.id_concesionario_liq = c.idconcesionario
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr recaudo
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             sum(valor_total), -- valor debito
             null, -- valor credito
             max(c.cta_contable), -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             '', -- cuenta credito
             '', -- cc credito
             '', -- nit credito
             1, -- orden
             'Ingreso Recaudo ' || max(r.indtipo) || ' Externo ' ||
             max(b.nombre),
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             cta_recaudo_concesionario   c,
             banco                       b
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.idbanco = b.idbanco
         and r.cta_recaudo = c.cuenta
         and r.idbanco = c.idbanco
         and r.indtipo = c.indtipo
         and r.id_concesionario_liq = c.idconcesionario
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr neto municipio
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(s_valor_8 - s_valor_10 - s_valor_11 - s_valor_12 +
                 valor_adicional), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             '29059004',
             '',
             '',
             2, -- orden
             'Ingreso Municipio Recaudo ' || max(r.indtipo) ||
             ' Externo (90%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr neto municipio
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(p_valor_21 - p_valor_23 - p_valor_24 - p_valor_25 +
                 valor_adicional), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             '29059007',
             '',
             '',
             2, -- orden
             'Ingreso Municipio Recaudo ' || max(r.indtipo) ||
             ' Externo (45%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr contravencional x propietario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(s_valor_11), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta debito
             '0532', -- centro debito
             max(c.nit_c), -- nit debito
             3, -- orden
             'Ingreso Contravencional Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(c.nombre) || ' (9.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f, concesionario c
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and f.nit_fcm = '8000826650'
         and c.idconcesionario = r.id_concesionario_pro
       group by r.id_concesionario_pro, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr contravencional x propietario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(p_valor_24), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta debito
             '0532', -- centro debito
             max(c.nit_c), -- nit debito
             3, -- orden
             'Ingreso Contravencional Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(c.nombre) || ' (9.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f, concesionario c
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
         and c.idconcesionario = r.id_concesionario_pro
       group by r.id_concesionario_pro, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr contravencional fcm
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(s_valor_12), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta debito
             '0531', -- centro debito
             '8000826650', -- nit debito
             3, -- orden
             'Ingreso FCM Contravencional Recaudo ' || max(r.indtipo) ||
             ' Externo (9.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and f.nit_fcm = '8000826650'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr contravencional fcm
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(p_valor_25), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta debito
             '0531', -- centro debito
             '8000826650', -- nit debito
             3, -- orden
             'Ingreso FCM Contravencional Recaudo ' || max(r.indtipo) ||
             ' Externo (9.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr neto concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null, -- valor debito
             sum(s_valor_28), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(p.ctacon_ing),
             max(p.concesionario_s_cc),
             max(c.nit_c),
             4, -- orden
             'Ingreso Concesionario Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(c.nombre) || ' (6.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr neto concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null, -- valor debito
             sum(p_valor_41), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(p.ctacon_ing),
             max(p.concesionario_pm_cc),
             max(c.nit_c),
             4, -- orden
             'Ingreso Concesionario Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(c.nombre) || ' (3.25%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr fondo cobertura concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null, -- valor debito
             sum(s_valor_5), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(p.ctacon_ing),
             max(p.fondo_cob_concesionario_s_cc),
             max(c.nit_c),
             5, -- orden
             'Ingreso Fondo Concesionario Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(c.nombre) || ' (0.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr fondo cobertura concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null, -- valor debito
             sum(p_valor_5), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(p.ctacon_ing),
             max(p.fondo_cob_concesionario_pm_cc),
             max(c.nit_c),
             5, -- orden
             'Ingreso Fondo Concesionario Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(c.nombre) || ' (0.25%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr equilibrio economico
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null, -- valor debito
             sum(s_valor_7), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(p.ctacon_ing),
             max(p.equilibrio_economico_s_cc),
             max(c.nit_c),
             5, -- orden
             'Ingreso Equilibrio Economico Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(c.nombre) || ' (2.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr equilibrio economico
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null, -- valor debito
             sum(p_valor_7 + p_valor_10), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(p.ctacon_ing),
             max(p.equilibrio_economico_pm_cc),
             max(c.nit_c),
             5, -- orden
             'Ingreso Equilibrio Economico Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(c.nombre) || ' (3.77%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr fondo cobertura fcm
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(s_valor_6), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_ingreso),
             max(p.fondo_cob_simit_s_cc),
             max(f.nit_fcm),
             6, -- orden
             'Ingreso Fondo FCM Recaudo ' || max(r.indtipo) ||
             ' Externo  (0.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and p.idconcesionario = r.id_concesionario_liq
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr fondo cobertura fcm
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(p_valor_6), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_ingreso),
             max(p.fondo_cob_simit_pm_cc),
             max(f.nit_fcm),
             6, -- orden
             'Ingreso Fondo FCM Recaudo ' || max(r.indtipo) ||
             ' Externo  (0.25%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and p.idconcesionario = r.id_concesionario_liq
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr simit
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(s_valor_3), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_ingreso),
             max(p.simit_s_cc),
             max(f.nit_fcm),
             7, -- orden
             'Ingreso FCM Recaudo ' || max(r.indtipo) ||
             ' Externo  (2.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and p.idconcesionario = r.id_concesionario_liq
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr simit
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(p_valor_3 + p_valor_8), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_ingreso),
             max(p.simit_pm_cc),
             max(f.nit_fcm),
             7, -- orden
             'Ingreso FCM Recaudo ' || max(r.indtipo) ||
             ' Externo  (3.25%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and p.idconcesionario = r.id_concesionario_liq
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr iva contravencional x municipio
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             sum(s_valor_14), -- valor debito
             null, -- valor credito
             max(f.ctacon_puente_ext), -- cuenta debito
             '', -- centro debito
             max(m.nit_m), -- nit debito
             '',
             '',
             '',
             8, -- orden
             'CXC IVA Contravencional Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(m.nombre) || ' (16%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f, municipio m
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and f.nit_fcm = '8000826650'
         and m.idmunicipio = r.idmunicipio
       group by r.idmunicipio, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr iva contravencional x municipio
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             sum(p_valor_27), -- valor debito
             null, -- valor credito
             max(f.ctacon_puente_ext), -- cuenta debito
             '', -- centro debito
             max(m.nit_m), -- nit debito
             '',
             '',
             '',
             8, -- orden
             'CXC IVA Contravencional Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(m.nombre) || ' (16%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f, municipio m
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
         and m.idmunicipio = r.idmunicipio
       group by r.idmunicipio, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr iva contravencional x concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(s_valor_14) - round(sum(s_valor_12) * max(f.iva) / 100, 2), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             '0532', -- centro credito
             max(c.nit_c), -- nit credito
             9, -- orden
             'IVA por Pagar Contravencional Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(c.nombre) || ' (16%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f, concesionario c
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and f.nit_fcm = '8000826650'
         and c.idconcesionario = r.id_concesionario_pro
       group by r.id_concesionario_pro, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr iva contravencional x concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(p_valor_27) - round(sum(p_valor_25) * max(f.iva) / 100, 2), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             '0532', -- centro credito
             max(c.nit_c), -- nit credito
             9, -- orden
             'IVA por Pagar Contravencional Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(c.nombre) || ' (16%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f, concesionario c
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
         and c.idconcesionario = r.id_concesionario_pro
       group by r.id_concesionario_pro, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr iva contravencional fcm
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             round(sum(s_valor_12) * max(f.iva) / 100, 2), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             '0531', -- centro credito
             max(f.nit_fcm), -- nit credito
             9, -- orden
             'IVA por Pagar Contravencional Recaudo ' || max(r.indtipo) ||
             ' Externo FCM (16%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and f.nit_fcm = '8000826650'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr iva contravencional fcm
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             round(sum(p_valor_25) * max(f.iva) / 100, 2), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             '0531', -- centro credito
             max(f.nit_fcm), -- nit credito
             9, -- orden
             'IVA por Pagar Contravencional Recaudo ' || max(r.indtipo) ||
             ' Externo FCM (16%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr 1.8 fcm cp
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(p_valor_13), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             max(p.fcm_cp_cc), -- centro credito
             max(f.nit_fcm), -- nit credito
             10, -- orden
             'Ingreso FCM POLCA ' || max(r.indtipo) || ' Externo 1.8% ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
         and p.idconcesionario = r.id_concesionario_liq
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr 1.8 fcm cp
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(p_valor_12), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             '', -- centro credito
             max(f.nit_polca), -- nit credito
             11, -- orden
             'Ingreso POLCA ' || max(r.indtipo) || ' Externo 39.78% ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr 2.7 sevial cp
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(p_valor_14), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             max(p.sevial_cp_cc), -- centro credito
             max(c.nit_c), -- nit credito
             12, -- orden
             'Ingreso SEVIAL POLCA ' || max(r.indtipo) || ' Externo 2.7% ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             fcm                         f,
             p_dispersion_concesionario  p,
             concesionario               c
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
         and p.idconcesionario = '03'
         and c.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr 3.0 sevial pp
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(p_valor_9), -- valor credito
             '',
             '',
             '',
             max(p.ctacon_ing), -- cuenta credito
             max(p.sevial_pp_cc), -- centro credito
             max(c.nit_c), -- nit credito
             13, -- orden
             'Ingreso SEVIAL  ' || max(r.indtipo) || ' Externo 3.0% ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             fcm                         f,
             p_dispersion_concesionario  p,
             concesionario               c
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
         and p.idconcesionario = '03'
         and c.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr iva 2.7
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(p_valor_18), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             max(p.sevial_cp_cc), -- centro credito
             max(c.nit_c), -- nit credito
             14, -- orden
             'IVA SEVIAL Recaudo  ' || max(r.indtipo) || ' Externo 2.7% ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             fcm                         f,
             p_dispersion_concesionario  p,
             concesionario               c
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
         and p.idconcesionario = '03'
         and c.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr iva 1.8
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(p_valor_16), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             max(p.fcm_cp_cc), -- centro credito
             max(f.nit_fcm), -- nit credito
             15, -- orden
             'IVA FCM Recaudo  ' || max(r.indtipo) || ' Externo 1.8% ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             fcm                         f,
             p_dispersion_concesionario  p,
             concesionario               c
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
         and p.idconcesionario = '03'
         and c.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr timbre 1.8 + 2.7
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(p_valor_17), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             '0533', -- centro credito
             max(f.nit_fcm), -- nit credito
             16, -- orden
             'Timbre FCM Recaudo  ' || max(r.indtipo) ||
             ' Externo 2.7 + 1.8 % ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas debito vlr timbre 1.8 + 2.7
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             sum(p_valor_17), -- valor debito
             null, -- valor credito
             max(f.ctacon_puente_ext), -- cuenta credito
             '0533', -- centro credito
             max(f.nit_fcm), -- nit credito
             '',
             '',
             '',
             17, -- orden
             'Timbre FCM Recaudo  ' || max(r.indtipo) ||
             ' Externo 2.7 + 1.8 % ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
       group by r.idbanco, r.cta_recaudo;

    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_externo_causacion
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and operacion = 'INGRESO';

    p_error := 'Causado Ingreso Recuado Externo exitosamente. Registros: ' ||
               w_registros;

    sp_log(p_usuario,
           'Cuasacion Ingreso Recaudo Externo',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia || '-' ||
           p_fec_fin_ano || '-' || p_fec_fin_mes || '-' || p_fec_fin_dia);

    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [causa_ing_recaudo_local] ' || SQLERRM,
            p_error);
  END causa_ing_recaudo_externo;

  /*PROCEDURE generaRpt1(p_fec_ini_ano number,
                       p_fec_ini_mes number,
                       p_fec_ini_dia number,
                       p_fec_fin_ano number,
                       p_fec_fin_mes number,
                       p_fec_fin_dia number,
                       p_usuario     varchar2,
                       p_error       OUT VARCHAR2) as

    w_fec_cor_ini date;
    w_fec_cor_fin date;
    numRegistros  number;

  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error);
    if (not p_error is null) then
      return;
    end if;

    -- Si pasa todas las validaciones
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

    delete from rpt1;

    insert into rpt1
      (tiporec,
       ind_tipo,
       idmunicipio,
       municipio_nombre,
       concesionario1,
       concesionario2,
       concesionario3,
       concesionario4,
       concesionario5,
       valor_total,
       valor_ot)
      select TIPOREC,
             IND_TIPO,
             IDMUNICIPIO,
             max(MUNICIPIO_NOMBRE),
             0,
             0,
             0,
             0,
             0,
             sum(VALOR_TOTAL),
             sum(VALOR_OT)
        from VW_RPT1_DETALLE
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
       group by IDMUNICIPIO, TIPOREC, IND_TIPO;

    commit;

    -- procesar concesionario 1
    select count(*)
      into numRegistros
      from VW_RPT1_DETALLE v
     where v.IDCONCESIONARIO = 1;

    if (numRegistros > 0) then
      update rpt1 r
         set r.concesionario1 = (select sum(v.VALOR_TOTAL)
                                   from VW_RPT1_DETALLE v
                                  where v.idmunicipio = r.idmunicipio
                                    and v.TIPOREC = r.TIPOREC
                                    and v.IND_TIPO = r.IND_TIPO
                                    and v.IDCONCESIONARIO = 1);

    end if;

    -- procesar concesionario 2
    select count(*)
      into numRegistros
      from VW_RPT1_DETALLE v
     where v.IDCONCESIONARIO = 2;

    if (numRegistros > 0) then
      update rpt1 r
         set r.concesionario2 = (select sum(v.VALOR_TOTAL)
                                   from VW_RPT1_DETALLE v
                                  where v.idmunicipio = r.idmunicipio
                                    and v.TIPOREC = r.TIPOREC
                                    and v.IND_TIPO = r.IND_TIPO
                                    and v.IDCONCESIONARIO = 2);

    end if;

    -- procesar concesionario 3
    select count(*)
      into numRegistros
      from VW_RPT1_DETALLE v
     where v.IDCONCESIONARIO = 3;

    if (numRegistros > 0) then
      update rpt1 r
         set r.concesionario3 = (select sum(v.VALOR_TOTAL)
                                   from VW_RPT1_DETALLE v
                                  where v.idmunicipio = r.idmunicipio
                                    and v.TIPOREC = r.TIPOREC
                                    and v.IND_TIPO = r.IND_TIPO
                                    and v.IDCONCESIONARIO = 3);

    end if;

    -- procesar concesionario 4
    select count(*)
      into numRegistros
      from VW_RPT1_DETALLE v
     where v.IDCONCESIONARIO = 4;

    if (numRegistros > 0) then
      update rpt1 r
         set r.concesionario4 = (select sum(v.VALOR_TOTAL)
                                   from VW_RPT1_DETALLE v
                                  where v.idmunicipio = r.idmunicipio
                                    and v.TIPOREC = r.TIPOREC
                                    and v.IND_TIPO = r.IND_TIPO
                                    and v.IDCONCESIONARIO = 4);

    end if;

    -- procesar concesionario 5
    select count(*)
      into numRegistros
      from VW_RPT1_DETALLE v
     where v.IDCONCESIONARIO = 5;

    if (numRegistros > 0) then
      update rpt1 r
         set r.concesionario5 = (select sum(v.VALOR_TOTAL)
                                   from VW_RPT1_DETALLE v
                                  where v.idmunicipio = r.idmunicipio
                                    and v.TIPOREC = r.TIPOREC
                                    and v.IND_TIPO = r.IND_TIPO
                                    and v.IDCONCESIONARIO = 5);

    end if;

    commit;

    p_error := 'OK';

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [generaRpt1] ' || SQLERRM, p_error);
  END generaRpt1;
*/

end pk_proc;
/


spool off
