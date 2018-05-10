PROCEDURE contabiliza_pago_externo(p_feccor_ini_ano number,
                                     p_feccor_ini_mes number,
                                     p_feccor_ini_dia number,
                                     p_usuario        varchar2,
                                     p_error          OUT VARCHAR2) AS
    w_fec_cor_ini date;
    w_registros   number;
  
    w_fec_cor_ini_s char(8);
    w_concepto      varchar(250);
    aaaa0115        char(8);
  
  BEGIN
    -- VALIDACIONES
    if (not p_usuario = '99999999') THEN
      sp_v_usuario(p_usuario, p_error, 'pk_proc');
      IF not P_ERROR is null THEN
        return;
      END IF;
    END IF;
  
    aaaa0115 := '1501' || trim(to_char(p_feccor_ini_ano + 1));
  
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
       and tipoContable = 'PAG';
  
    w_concepto := 'PAGO PARTICIPACION MUNICIPIO';
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
      select to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.s_valor_26) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.nit_municipio, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'PAGO PARTICIPACION TERCERO 1';
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
      select to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.s_valor_19) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION TERCERO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_TERCERO1, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'PAGO PARTICIPACION TERCERO 2';
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
      select to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.s_valor_21) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION TERCERO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_TERCERO2, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'PAGO PARTICIPACION TERCERO 3';
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
      select to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.s_valor_23) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION TERCERO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_TERCERO3, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'PAGO PARTICIPACION TERCERO 4';
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
      select to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.s_valor_25) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION TERCERO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_TERCERO4, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'PAGO CONTRAV CONCES nomConsecionario';
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
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             ROUND(r.s_valor_9 / 2, 2) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO CONTRAV CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '2905901005' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_CONCESIONARIOZON, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'PAGO IVA CONTRAV CONCES nomConsecionario';
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
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             ROUND(r.s_valor_14 / 2, 2) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO IVA CONTRAV CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '2905901009' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_CONCESIONARIOZON, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'PAGO CONTRAV FCM';
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
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             '2905901006' as cuenta,
             (r.s_valor_9 - ROUND(r.s_valor_9 / 2, 2)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO CONTRAV FCM ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(f.nit_fcm, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
         and f.nit_fcm = '8000826650'
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'PAGO IVA CONTRAV FCM';
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
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             '2905901010' as cuenta,
             (r.s_valor_14 - ROUND(r.s_valor_14 / 2, 2)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO IVA CONTRAV FCM ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(f.nit_fcm, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
         and f.nit_fcm = '8000826650'
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'PAGO PARTICIPACION MUNICIPIO';
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
      select to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.p_valor_39) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '2905900701' as cuentadivergente,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.nit_municipio, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'PAGO PARTICIPACION TERCERO 1';
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
      select to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.p_valor_32) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION TERCERO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_TERCERO1, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'PAGO PARTICIPACION TERCERO 2';
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
      select to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.p_valor_34) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION TERCERO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_TERCERO2, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'PAGO PARTICIPACION TERCERO 3';
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
      select to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.p_valor_36) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION TERCERO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_TERCERO3, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'PAGO PARTICIPACION TERCERO 4';
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
      select to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.p_valor_38) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION TERCERO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_TERCERO4, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'PAGO POLCA 39_78';
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
      select to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(f.nit_polca, 0, 9) as cuenta,
             (r.p_valor_12 - r.p_valor_18 - r.p_valor_16) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO POLCA') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_polca, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and f.nit_fcm = '8000826650'
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
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
      select to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             (r.p_valor_14 + r.p_valor_20 + r.p_valor_19 - r.p_valor_18) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION SEVIAL 2.7%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '2905901001' as cuentadivergente,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and f.nit_fcm = '8000826650'
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.Fec_Dispersion_con = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'PAGO PARTICIPACION SEVIAL IVA 2.7%';
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
      select to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             (r.p_valor_18) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION SEVIAL IVA 2.7%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '2905901002' as cuentadivergente,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and f.nit_fcm = '8000826650'
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.Fec_Dispersion_con = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'PAGO PARTICIPACION FCM 1.8%';
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
      select to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             '2905901003' as cuenta,
             (r.p_valor_13 - r.p_valor_16 - r.p_valor_20 - r.p_valor_19) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION FCM 1.8%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and f.nit_fcm = '8000826650'
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.Fec_Dispersion_con = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'PAGO PARTICIPACION FCM IVA 1.8%';
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
      select to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             '2905901004' as cuenta,
             (r.p_valor_16) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION FCM IVA 1.8%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and f.nit_fcm = '8000826650'
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.Fec_Dispersion_con = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'PAGO CONTRAV CONCES nomConsecionario';
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
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             ROUND(r.p_valor_22 / 2, 2) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO CONTRAV CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '2905901005' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_CONCESIONARIOZON, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'PAGO IVA CONTRAV CONCES nomConsecionario';
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
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             ROUND(r.p_valor_27 / 2, 2) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO IVA CONTRAV CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '2905901009' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_CONCESIONARIOZON, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'PAGO CONTRAV FCM';
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
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             '2905901006' as cuenta,
             (r.p_valor_22 - ROUND(r.p_valor_22 / 2, 2)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO CONTRAV FCM ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(f.nit_fcm, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
         and f.nit_fcm = '8000826650'
         and r.indTipo = 'POLCA';
  
    w_concepto := 'PAGO IVA CONTRAV FCM';
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
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             '2905901010' as cuenta,
             (r.p_valor_27 - ROUND(r.p_valor_27 / 2, 2)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO IVA CONTRAV FCM ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(f.nit_fcm, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
         and f.nit_fcm = '8000826650'
         and r.indTipo = 'POLCA';
  
    w_concepto := 'REG CTA PTE PAS DISP BCOAVVILLAS Y BANCAFE';
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
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             a.referencia as referencia,
             a.textocabezera as textocabezera,
             '50' as clavecontable,
             '2905901012' as cuenta,
             a.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechavalor,
             a.asignacion AS asignacion,
             ('REG CTA PTE PAS DISP BCO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(round(importe, 0)) as valor,
                     max(asignacion) as asignacion,
                     referencia,
                     textocabezera
                from recaudo_externo_contabilidad
               where fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and tipocontable = 'PAG'
                 and (textocabezera like '% 086%' or
                     textocabezera like '% 186%')
               group by referencia, textocabezera) a,
             fcm f;
  
    w_concepto := 'REG CTA PTE PAS DISP BCO OTROS BANCOS';
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
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             a.referencia as referencia,
             a.textocabezera as textocabezera,
             '50' as clavecontable,
             '2905901013' as cuenta,
             a.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechavalor,
             a.asignacion AS asignacion,
             ('REG CTA PTE PAS DISP BCO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(round(importe, 0)) as valor,
                     max(asignacion) as asignacion,
                     referencia,
                     textocabezera
                from recaudo_externo_contabilidad
               where fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and tipocontable = 'PAG'
                 and not (textocabezera like '% 086%' or
                      textocabezera like '% 186%')
               group by referencia, textocabezera) a,
             fcm f;
  
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
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             (r.s_valor_4) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_CONCESIONARIO, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
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
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             (r.s_valor_5) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PART FONDO CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_FONDO, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'PAGO PARTICIPACION SEVIAL 3%';
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
      select to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             (r.p_valor_9) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION SEVIAL 3%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and f.nit_fcm = '8000826650'
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.Fec_Dispersion_con = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
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
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             (r.p_valor_4) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_CONCESIONARIO, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
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
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             (r.p_valor_5) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PART FONDO CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_FONDO, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
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
      select to_char(w_fec_cor_ini, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             a.referencia as referencia,
             a.textocabezera as textocabezera,
             '50' as clavecontable,
             '2905901012' as cuenta,
             a.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechavalor,
             a.asignacion AS asignacion,
             ('REG CTA PTE PAS DISP BCO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(round(importe, 0)) as valor,
                     max(asignacion) as asignacion,
                     referencia,
                     textocabezera
                from recaudo_externo_contabilidad
               where fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and tipocontable = 'PAG'
                 and instr(referencia, 'G') > 0
                 and (textocabezera like '% 086%' or
                     textocabezera like '% 186%')
               group by referencia, textocabezera) a,
             fcm f;
  
    w_concepto := 'REG CTA PTE PAS DISP BCO OTROS BANCOS';
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
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             a.referencia as referencia,
             a.textocabezera as textocabezera,
             '50' as clavecontable,
             '2905901013' as cuenta,
             a.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechavalor,
             a.asignacion AS asignacion,
             ('REG CTA PTE PAS DISP BCO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(round(importe, 0)) as valor,
                     max(asignacion) as asignacion,
                     referencia,
                     textocabezera
                from recaudo_externo_contabilidad
               where fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and tipocontable = 'PAG'
                 and instr(referencia, 'G') > 0
                 and not (textocabezera like '% 086%' or
                      textocabezera like '% 186%')
               group by referencia, textocabezera) a,
             fcm f;
  
    -- Contabiliza pago realizado por el banco
  
    w_concepto := 'divipo MUNICIPIO nombre';
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
    
      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             d.IDMUNICIPIO AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
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
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden = 1) d,
             municipio m,
             cta_recaudo_concesionario ct
       where d.idmunicipio = m.idmunicipio
         and d.id_concesionario_liq = ct.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;
  
    w_concepto := 'terceros';
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
    
      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(d.des_nit, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(d.des_nit, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
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
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (2, 3, 4)) d,
             cta_recaudo_concesionario ct
       where d.id_concesionario_liq = ct.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;
  
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
    
      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
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
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (7)) d,
             cta_recaudo_concesionario ct,
             concesionario c
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_liq = c.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;
  
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
    
      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
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
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (8)) d,
             cta_recaudo_concesionario ct,
             concesionario c
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_liq = c.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;
  
    w_concepto := 'pago concesioanrio ZONAL';
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
    
      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
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
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (13)) d,
             cta_recaudo_concesionario ct,
             concesionario c
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_pro = c.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;
  
    w_concepto := 'pago FCM contravencional';
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
    
      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
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
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (14)) d,
             cta_recaudo_concesionario ct,
             fcm f
       where d.id_concesionario_liq = ct.idconcesionario
         and f.nit_fcm = '8000826650'
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;
  
    w_concepto := 'Liquidacion POLCA';
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
    
      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_polca, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_polca, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
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
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (12)) d,
             cta_recaudo_concesionario ct,
             concesionario c,
             fcm f
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_liq = c.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta
         and f.nit_fcm = '8000826650';
  
    w_concepto := 'POLCA SEVIAL';
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
      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_sevial, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
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
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (10)) d,
             cta_recaudo_concesionario ct,
             concesionario c,
             fcm f
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_liq = c.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta
         and f.nit_fcm = '8000826650';
  
    w_concepto := 'Impuestos FCM';
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
      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
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
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (9)
                 and concepto = 'Impuestos FCM') d,
             cta_recaudo_concesionario ct,
             concesionario c,
             fcm f
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_liq = c.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta
         and f.nit_fcm = '8000826650';
  
    w_concepto := 'Polca FCM';
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
      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
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
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (11)) d,
             cta_recaudo_concesionario ct,
             concesionario c,
             fcm f
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_liq = c.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta
         and f.nit_fcm = '8000826650';
  
    w_concepto := 'pago equlibrio economico';
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
    
      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
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
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (9)
                 and concepto <> 'Impuestos FCM') d,
             cta_recaudo_concesionario ct,
             concesionario c
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_liq = c.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;
  
    w_concepto := 'pago equlibrio economico';
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
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             '01' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             s.valor * -1 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             ('CXC EQUILIBRIO ECONOMICO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '1470901501' as cuentadivergente,
             '08102015' as fechabase,
             'Z000' as condicionpago,
             substr(s.nitPago, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(s_valor_7 + p_valor_7 + p_valor_10) as valor,
                     r.id_concesionario_liq as id_concesionario_liq,
                     r.cta_recaudo as cta_recaudo,
                     max(r.fec_dispersion_con) as fec_dispersion,
                     max(r.nit_concesionario) as nitPago
                from vw_recaudo_externo_liquidacion r
               where r.fec_dispersion_con = w_fec_cor_ini
                 and r.idbanco in ('50', '52')
                 and r.id_concesionario_liq = 5
               group by r.id_concesionario_liq, r.cta_recaudo) s,
             concesionario c,
             fcm f
       where s.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650';
  
    w_concepto := 'REG CTA PTE PAS DISP BCO avvillas-bancafe';
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
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             a.referencia as referencia,
             a.textocabezera as textocabezera,
             '40' as clavecontable,
             '2905901012' as cuenta,
             a.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechavalor,
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
             'PAG' as tipocontable
        from (select sum(round(importe, 0)) as valor,
                     referencia,
                     textocabezera
                from recaudo_externo_contabilidad
               where fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and tipocontable = 'PAG'
                 and textocabezera like 'BAN PAG%'
                 and not
                      cuenta in
                      ('1110063202', '1110063402', '1110063802', '1110063902')
               group by referencia, textocabezera) a,
             fcm f;
  
    w_concepto := 'REG CTA PTE PAS DISP BCO otros bancos';
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
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             a.referencia as referencia,
             a.textocabezera as textocabezera,
             '40' as clavecontable,
             '2905901013' as cuenta,
             a.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechavalor,
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
             'PAG' as tipocontable
        from (select sum(round(importe, 0)) as valor,
                     referencia,
                     textocabezera
                from recaudo_externo_contabilidad
               where fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and tipocontable = 'PAG'
                 and textocabezera like 'BAN PAG%'
                 and cuenta in
                     ('1110063202', '1110063402', '1110063802', '1110063902')
               group by referencia, textocabezera) a,
             fcm f;
  
    update recaudo_externo_contabilidad
       set importe = importe * -1
     where importe < 0;
  
    w_concepto := 'pago fond fcm';
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
    
      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
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
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (6)) d,
             cta_recaudo_concesionario ct,
             concesionario c
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_liq = c.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;
  
    w_concepto := 'pago fond fcm';
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
    
      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '01' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             aaaa0115 as fechabase,
             'Z000' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
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
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (6)) d,
             cta_recaudo_concesionario ct,
             concesionario c
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_liq = c.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;
  
    w_concepto := 'TRANSFERENCIA LIQUIDACION FCM';
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
    
      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
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
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (5)) d,
             cta_recaudo_concesionario ct,
             concesionario c,
             fcm f
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;
  
    w_concepto := 'TRANSFERENCIA LIQUIDACION FCM';
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
    
      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '40' as clavecontable,
             ct.cta_con_s as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
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
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (5)) d,
             cta_dispersion_fcm ct,
             concesionario c,
             fcm f
       where ct.nit_fcm = '8000826650'
         and ct.idbancorec = d.ori_idbanco
         and d.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650';
  
    w_concepto := 'TRANSFERENCIA MUN ACUERDO PAGO';
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
    
      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             d.IDMUNICIPIO AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
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
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden = 15) d,
             municipio m,
             cta_recaudo_concesionario ct,
             fcm f
       where d.idmunicipio = m.idmunicipio
         and f.nit_fcm = '8000826650'
         and d.id_concesionario_liq = ct.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;
  
    w_concepto := 'TRANSFERENCIA MUN ACUERDO PAGO';
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
    
      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '40' as clavecontable,
             ct.cta_con_ac as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             d.IDMUNICIPIO AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
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
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden = 15) d,
             municipio m,
             cta_dispersion_fcm ct,
             fcm f
       where d.idmunicipio = m.idmunicipio
         and f.nit_fcm = '8000826650'
         and ct.nit_fcm = '8000826650'
         and ct.idbancorec = d.ori_idbanco;
  
    w_concepto := 'RETE FTE CONTRAV nomConcesionario';
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
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             '50' as clavecontable,
             '2905901011' as cuenta,
             s.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             ('RETE FTE CONTRAV  ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(r.s_valor_16 + r.p_valor_29) as valor,
                     r.id_concesionario_pro as id_concesionario_pro,
                     r.cta_recaudo as cta_recaudo,
                     max(r.fec_dispersion_con) as fec_dispersion
                from vw_recaudo_externo_liquidacion r
               where r.fec_dispersion_con = w_fec_cor_ini
                 and r.idbanco in ('50', '52')
               group by r.id_concesionario_pro, r.cta_recaudo) s,
             concesionario c
       where s.id_concesionario_pro = c.idconcesionario;
  
    w_concepto := 'RETE FTE CONTRAV nomConcesionario';
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
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             '40' as clavecontable,
             '2905901011' as cuenta,
             s.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             ('PAG RETE FTE CONTRAV  ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(r.s_valor_16 + r.p_valor_29) as valor,
                     r.id_concesionario_pro as id_concesionario_pro,
                     r.cta_recaudo as cta_recaudo,
                     max(r.fec_dispersion_con) as fec_dispersion
                from vw_recaudo_externo_liquidacion r
               where r.fec_dispersion_con = w_fec_cor_ini
                 and r.idbanco in ('50', '52')
               group by r.id_concesionario_pro, r.cta_recaudo) s,
             concesionario c
       where s.id_concesionario_pro = c.idconcesionario;
  
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
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             '50' as clavecontable,
             '2905901007' as cuenta,
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
             'PAG' as tipocontable
        from (select sum(r.p_valor_20 + r.p_valor_19) as valor,
                     r.id_concesionario_liq as id_concesionario_liq,
                     r.cta_recaudo as cta_recaudo,
                     max(r.fec_dispersion_con) as fec_dispersion
                from vw_recaudo_externo_liquidacion r
               where r.fec_dispersion_con = w_fec_cor_ini
                 and r.idbanco in ('50', '52')
               group by r.id_concesionario_liq, r.cta_recaudo) s,
             concesionario c,
             fcm f
       where s.id_concesionario_liq = c.idconcesionario
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
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             '40' as clavecontable,
             '2905901007' as cuenta,
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
             'PAG' as tipocontable
        from (select sum(r.p_valor_20 + r.p_valor_19) as valor,
                     r.id_concesionario_liq as id_concesionario_liq,
                     r.cta_recaudo as cta_recaudo,
                     max(r.fec_dispersion_con) as fec_dispersion
                from vw_recaudo_externo_liquidacion r
               where r.fec_dispersion_con = w_fec_cor_ini
                 and r.idbanco in ('50', '52')
               group by r.id_concesionario_liq, r.cta_recaudo) s,
             concesionario c,
             fcm f
       where s.id_concesionario_liq = c.idconcesionario
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
             'ZD' as clasedoc,
             'FCM1' as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             '50' as clavecontable,
             '1470909002' as cuenta,
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
             'PAG' as tipocontable
        from (select sum(r.p_valor_14 + r.p_valor_13) as valor,
                     r.id_concesionario_liq as id_concesionario_liq,
                     r.cta_recaudo as cta_recaudo,
                     max(r.fec_dispersion_con) as fec_dispersion
                from vw_recaudo_externo_liquidacion r
               where r.fec_dispersion_con = w_fec_cor_ini
                 and r.idbanco in ('50', '52')
               group by r.id_concesionario_liq, r.cta_recaudo) s,
             concesionario c,
             fcm f
       where s.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650';
  
    w_concepto := 'VALOR CXC SIMIT CAPITAL';
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
             'ZD' as clasedoc,
             'FCM1' as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             '01' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             s.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             ('VALOR CXC SIMIT CAPITAL') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             '08102015' as fechabase,
             'Z000' as condicionpago,
             substr(s.nitPago, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(r.p_valor_13 - r.p_valor_16 - r.p_valor_20 -
                         r.p_valor_19) as valor,
                     r.id_concesionario_liq as id_concesionario_liq,
                     r.cta_recaudo as cta_recaudo,
                     max(r.fec_dispersion_con) as fec_dispersion,
                     max(r.nit_concesionario) as nitPago
                from vw_recaudo_externo_liquidacion r
               where r.fec_dispersion_con = w_fec_cor_ini
                 and r.id_concesionario_liq = '05'
                 and r.idbanco in ('50', '52')
               group by r.id_concesionario_liq, r.cta_recaudo) s,
             concesionario c,
             fcm f
       where s.id_concesionario_liq = c.idconcesionario
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
             'ZD' as clasedoc,
             'FCM1' as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             '21' as clavecontable,
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
             'PAG' as tipocontable
        from (select sum(r.p_valor_14) as valor,
                     r.id_concesionario_liq as id_concesionario_liq,
                     r.cta_recaudo as cta_recaudo,
                     max(r.fec_dispersion_con) as fec_dispersion,
                     max(r.nit_concesionario) as nitPago
                from vw_recaudo_externo_liquidacion r
               where r.fec_dispersion_con = w_fec_cor_ini
                 and r.idbanco in ('50', '52')
               group by r.id_concesionario_liq, r.cta_recaudo) s,
             concesionario c,
             fcm f
       where s.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650';
  
    w_concepto := 'TRANF FCM REC POLCA';
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
             'ZD' as clasedoc,
             'FCM1' as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             '40' as clavecontable,
             ct.cta_con_pa as cuenta,
             s.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             ('TRANF FCM REC POLCA 1.8 CON IMPUESTOS') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(r.p_valor_13) as valor,
                     r.id_concesionario_liq as id_concesionario_liq,
                     r.cta_recaudo as cta_recaudo,
                     max(r.fec_dispersion_con) as fec_dispersion,
                     max(r.nit_concesionario) as nitPago,
                     max(r.idbanco) as idbanco
                from vw_recaudo_externo_liquidacion r
               where r.fec_dispersion_con = w_fec_cor_ini
                 and r.id_concesionario_liq <> '05'
                 and r.idbanco in ('50', '52')
               group by r.id_concesionario_liq, r.cta_recaudo) s,
             concesionario c,
             fcm f,
             cta_dispersion_fcm ct
       where s.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and ct.nit_fcm = '8000826650'
         and ct.idbancorec = s.idbanco;
  
    w_concepto := 'TRANF FCM REC POLCA  Impuestos FCM';
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
             'ZD' as clasedoc,
             'FCM1' as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             '40' as clavecontable,
             ct.cta_con_pa as cuenta,
             s.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             ('TRANF FCM REC POLCA  Impuestos FCM') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(r.p_valor_13 - r.p_valor_15) as valor,
                     r.id_concesionario_liq as id_concesionario_liq,
                     r.cta_recaudo as cta_recaudo,
                     max(r.fec_dispersion_con) as fec_dispersion,
                     max(r.nit_concesionario) as nitPago,
                     max(r.idbanco) as idbanco
                from vw_recaudo_externo_liquidacion r
               where r.fec_dispersion_con = w_fec_cor_ini
                 and r.id_concesionario_liq = '05'
                 and r.idbanco in ('50', '52')
               group by r.id_concesionario_liq, r.cta_recaudo) s,
             concesionario c,
             fcm f,
             cta_dispersion_fcm ct
       where s.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and ct.nit_fcm = '8000826650'
         and ct.idbancorec = s.idbanco;
  
    ---
  
    w_concepto := 'ANT OPER PART CONTRAV';
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
    
      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'FCM1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '21' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             substr('PAG OPER PART CONTRAV' || c.nombre, 0, 9) AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
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
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (13)) d,
             cta_recaudo_concesionario ct,
             concesionario c
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_pro = c.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;
  
    w_concepto := 'TRANF CONTRAV PART FCM';
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
    
      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'FCM1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '40' as clavecontable,
             ct.cta_con_pa as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             'TRANF CONTRAV PART FCM' AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
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
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (14)) d,
             cta_dispersion_fcm ct,
             fcm f
       where f.nit_fcm = '8000826650'
         and ct.nit_fcm = '8000826650'
         and ct.idbancorec = d.ori_idbanco;
  
    w_concepto := 'CRUCE CXC SIMIT CONTRAVENCIONA 22,04%';
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
    
      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'FCM1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             '1470909003' as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             'CRUCE CXC SIMIT CONTRAVENCIONA 22,04%' AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
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
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (13, 14)) d,
             cta_dispersion_fcm ct,
             fcm f
       where f.nit_fcm = '8000826650'
         and ct.nit_fcm = '8000826650'
         and ct.idbancorec = d.ori_idbanco;
  
    delete recaudo_externo_contabilidad r
     where r.importe = 0
       and r.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
       and tipocontable = 'PAG';
  
    update recaudo_externo_contabilidad r
       set r.importe = ROUND(r.importe, 0)
     where r.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
       and tipocontable = 'PAG';
  
    update recaudo_externo_contabilidad r
       set r.receptoralternativo = ''
     where r.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
       and tipocontable = 'PAG'
       and substr(r.nittercero, 0, 9) = substr(r.receptoralternativo, 0, 9);
  
    w_concepto := 'AJUSTE PESOS DETALLE';
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
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(w_fec_cor_ini, 'ddMMyyyy'), 0, 25) as textocabezera,
             (case
               when a.importe > 0 then
                '50'
               else
                '40'
             end) as clavecontable,
             (case
               when a.importe > 0 then
                '4810900202'
               else
                '5810900202'
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
                           when '40' then
                            c.importe
                           else
                            c.importe * -1
                         end) as importe
                from recaudo_externo_contabilidad c
               where c.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and c.sociedad = 'PFC1'
                 and c.tipocontable = 'PAG'
                 and c.cuenta = '2905901012') a
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
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(w_fec_cor_ini, 'ddMMyyyy'), 0, 25) as textocabezera,
             (case
               when a.importe > 0 then
                '40'
               else
                '50'
             end) as clavecontable,
             '2905901012' as cuenta,
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
                           when '40' then
                            c.importe
                           else
                            c.importe * -1
                         end) as importe
                from recaudo_externo_contabilidad c
               where c.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and c.sociedad = 'PFC1'
                 and c.tipocontable = 'PAG'
                 and c.cuenta = '2905901012') a
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
             'ZD' as clasedoc,
             'FCM1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(w_fec_cor_ini, 'ddMMyyyy'), 0, 25) as textocabezera,
             (case
               when a.importe > 0 then
                '50'
               else
                '40'
             end) as clavecontable,
             '1470901106' as cuenta,
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
             'PAG' as tipocontable
        from fcm f,
             (select sum(case c.clavecontable
                           when '40' then
                            c.importe
                           when '01' then
                            c.importe
                           when '21' then
                            c.importe
                           else
                            c.importe * -1
                         end) as importe
                from recaudo_externo_contabilidad c
               where c.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and c.sociedad = 'FCM1'
                 and tipocontable = 'PAG'
               group by c.referencia) a
       where f.nit_fcm = '8000826650'
         and a.importe <> 0;
  
    commit;
  
    delete from recaudo_externo_contabilidad r
     where to_char(to_date(r.fechadoc, 'ddMMyyyy'), 'yyyyMMdd') <=
           to_char(w_fec_cor_ini - 90, 'yyyyMMdd');
  
    commit;
  
    sp_log(p_usuario,
           'Contabiliza Pago Rec Externo',
           p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
           p_feccor_ini_dia);
  
    commit;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [contabiliza_pago_externo] ' || SQLERRM,
            p_error);
    
  END contabiliza_pago_externo;