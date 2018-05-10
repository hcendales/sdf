PROCEDURE contabiliza_recaudo_externo(p_feccor_ini_ano number,
                                        p_feccor_ini_mes number,
                                        p_feccor_ini_dia number,
                                        p_usuario        varchar2,
                                        p_error          OUT VARCHAR2) AS
    w_fec_cor_ini date;
    w_registros   number;
  
    w_fec_cor_ini_s char(8);
    w_concepto      varchar(250);
  
  BEGIN
    -- VALIDACIONES
    if (not p_usuario = '99999999') THEN
      sp_v_usuario(p_usuario, p_error, 'pk_proc');
      IF not P_ERROR is null THEN
        return;
      END IF;
    END IF;
  
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
       and tipoContable = 'REC';
  
    -- contabilizar valores de recuado simit
    -- and liquidador no sea simit capital
    -- and acuerdo de pago sea 0
    -- and valor contravencional sea 0
  
    w_concepto := 'REC INGRESO PART CONCESIONARIO CONCESIONARIO  6,5% (6.45%)';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             b.cuentacontable as cuenta,
             r.s_valor_4 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '20111' || substr(r.id_concesionario_liq, 2, 1) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'REC INGRESO FONDO COB CONCESIONARIO ( 0,5%)';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             b.cuentacontable as cuenta,
             r.s_valor_5 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '20112' || substr(r.id_concesionario_liq, 2, 1) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING FONDO COB ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'REC INGRESO EQUILIBRIO ECO ( 2,5%)';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             b.cuentacontable as cuenta,
             r.s_valor_7 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '20113' || substr(r.id_concesionario_liq, 2, 1) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING EQUILIBRIO ECO ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'REC INGRESO FCM ( 2,5% 0R 1,05%)';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             b.cuentacontable as cuenta,
             r.s_valor_3 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '20113' || substr(r.id_concesionario_liq, 2, 1) as centrobeneficio,
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
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'REC INGRESO FONDO COB FCM ( 0,5%)';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             b.cuentacontable as cuenta,
             r.s_valor_6 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '20114' || substr(r.id_concesionario_liq, 2, 1) as centrobeneficio,
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
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';
  
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             cr.cta_contable as cuenta,
             r.valor_total as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             (b.nombre || ' ' || r.cta_recaudo) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
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
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'PARTICIPACION MUNICIPIO';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (ROUND(r.s_valor_26,0) + ROUND(r.s_valor_19,0) + ROUND(r.s_valor_21,0) + ROUND(r.s_valor_23,0) +
             ROUND(r.s_valor_25,0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
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
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT'
         and r.validador_fecha = '000';
  
    w_concepto := 'PARTICIPACION MUNICIPIO METROTRANSITO';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(mt.nit_m, 0, 9) as cuenta,
             (ROUND(r.s_valor_26,0) + ROUND(r.s_valor_19,0) + ROUND(r.s_valor_21,0) + ROUND(r.s_valor_23,0) +
             ROUND(r.s_valor_25,0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(mt.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             municipio                      mt
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and mt.idmunicipio = '08001001'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT'
         and r.validador_fecha <> '000';
  
    w_concepto := 'ACUERDO PAGO MUNICIPIO';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.s_valor_10) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('ACUERDO PAGO MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
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
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT'
         and r.validador_fecha = '000';
  
    w_concepto := 'ACUERDO PAGO MUNICIPIO METROTRANSITO';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(mt.nit_m, 0, 9) as cuenta,
             (r.s_valor_10) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('ACUERDO PAGO MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(mt.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             municipio                      mt
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and mt.idmunicipio = '08001001'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT'
         and r.validador_fecha <> '000';
  
    w_concepto := 'REC GASTO PART CONCESIONARIO REMO (6.5%, 6,45%))';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             c.cta_contable_liquidacion as cuenta,
             r.s_valor_4 as importe,
             '' as indicadorimpuesto,
             '200102' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC GASTO PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(C.NIT_C, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'REC GASTO FONDO COB CONCESIONARIO ( 0,5%)';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             C.CTA_CONTABLE_FONDO as cuenta,
             r.s_valor_5 as importe,
             '' as indicadorimpuesto,
             '200102' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC GASTO FONDO COB ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(C.NIT_C, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(C.NIT_C, 0, 9) as cuenta,
             ROUND(R.s_valor_4, 0) + ROUND(R.s_valor_5, 0) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('OTRO ACREEDOR ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(C.NIT_C, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             (R.NUM_LIQUIDACION || 'A') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '01' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (ROUND(r.s_valor_4, 0) + ROUND(r.s_valor_5, 0) +
             ROUND(r.s_valor_7, 0) + ROUND(r.s_valor_3, 0) +
             ROUND(r.s_valor_6, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CXC 10% AL MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '1401020102' as cuentadivergente,
             to_char(r.fec_corte, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             (R.NUM_LIQUIDACION || 'A') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '11' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (ROUND(r.s_valor_4, 0) + ROUND(r.s_valor_5, 0) +
             ROUND(r.s_valor_7, 0) + ROUND(r.s_valor_3, 0) +
             ROUND(r.s_valor_6, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CXC 10% AL MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '1401020102' as cuentadivergente,
             to_char(r.fec_corte, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'PARTICIPACION CONTRAVENCIONAL concesionario';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             ROUND(r.s_valor_9 / 2, 2) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PART CONTRAVENCIONAL ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '2905901005' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'PARTICIPACION IVA CONTRAVENCIONAL concesionario';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             ROUND(r.s_valor_14 / 2, 2) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PART IVA CONTRAVENCIONAL  ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '2905901009' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             f.ctacon_fcm as cuenta,
             (r.s_valor_9 - ROUND(r.s_valor_9 / 2, 2)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION CONTRAVENCIONAL FCM') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'PARTICIPACION IVA CONTRAVENCIONAL FCM';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             f.ctacon_impuestos as cuenta,
             (r.s_valor_14 - ROUND(r.s_valor_14 / 2, 2)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION IVA CONTRAVENCIONAL FCM') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'CRUCE CXC A SIMIT 19% IVA';
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
             'ZT' as clasedoc,
             'FCM1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             '1470909003' as cuenta,
             (ROUND(r.s_valor_9, 0) + ROUND(r.s_valor_14, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CRUCE CXC A SIMIT') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';
  
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'FCM1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (ROUND(r.s_valor_9, 0) + ROUND(r.s_valor_14, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CRUCE CXP A SIMIT') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_corte, 'ddMMyyyy') as fechabase,
             'Z002' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';
  
    w_concepto := 'RECAUDO NO DISTRIBUIDO MUNICIPIO SIMIT';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             r.valor_total as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('RECAUDO NO DISTRIBUIDO MUNICIPIO SIMIT') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '2905901008' as cuentadivergente,
             to_char(r.fec_corte, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
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
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT'
         and r.ind_proceso = 0;
  
    w_concepto := 'REC INGRESO PART CONCESIONARIO CONCESIONARIO  3,25% (3.23%)';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             b.cuentacontable as cuenta,
             r.p_valor_4 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '20121' || substr(r.id_concesionario_liq, 2, 1) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'REC INGRESO FONDO COB CONCESIONARIO ( 0,25%)';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             b.cuentacontable as cuenta,
             r.p_valor_5 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '20122' || substr(r.id_concesionario_liq, 2, 1) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING FONDO COB ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'REC INGRESO EQUILIBRIO ECO ( 3,77%)';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             b.cuentacontable as cuenta,
             (r.p_valor_7 + r.p_valor_10) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '20123' || substr(r.id_concesionario_liq, 2, 1) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING EQUILIBRIO ECO ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'REC INGRESO FCM ( 3,25% = 1.25 + 2)';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             b.cuentacontable as cuenta,
             (r.p_valor_3 + r.p_valor_8) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '20123' || substr(r.id_concesionario_liq, 2, 1) as centrobeneficio,
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
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             b.cuentacontable as cuenta,
             r.p_valor_6 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '20124' || substr(r.id_concesionario_liq, 2, 1) as centrobeneficio,
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
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             b.cuentacontable as cuenta,
             r.p_valor_9 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '201213' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING PART CONCES SEVIAL 3.0%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             cr.cta_contable as cuenta,
             r.valor_total as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             (b.nombre || ' ' || r.cta_recaudo) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
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
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(f.nit_polca, 0, 9) as cuenta,
             (r.p_valor_12 - r.p_valor_18 - r.p_valor_16) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('OTRO ACREEDOR POLCA 39,78') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_polca, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'PARTICIPACION MUNICIPIO';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (ROUND(r.p_valor_39,0) + ROUND(r.p_valor_32,0) + ROUND(r.p_valor_34,0) + ROUND(r.p_valor_36,0) +
             ROUND(r.p_valor_38,0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '2905900701' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.validador_fecha = '000';
  
    w_concepto := 'PARTICIPACION MUNICIPIO METROTRANSITO';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(mt.nit_m, 0, 9) as cuenta,
             (ROUND(r.p_valor_39,0) + ROUND(r.p_valor_32,0) + ROUND(r.p_valor_34,0) + ROUND(r.p_valor_36,0) +
             ROUND(r.p_valor_38,0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(mt.nit_m, 0, 9) as nittercero,
             '2905900701' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             municipio                      mt
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and mt.idmunicipio = '08001001'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.validador_fecha <> '000';
  
    w_concepto := 'ACUERDO PAGO MUNICIPIO';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.p_valor_23) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('ACUERDO PAGO MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
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
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.validador_fecha = '000';
  
    w_concepto := 'ACUERDO PAGO MUNICIPIO METROTRANSITO';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(mt.nit_m, 0, 9) as cuenta,
             (r.p_valor_23) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('ACUERDO PAGO MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(mt.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             municipio                      mt
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and mt.idmunicipio = '08001001'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.validador_fecha <> '000';
  
    w_concepto := 'REC GASTO PART CONCESIONARIO (3.25%, 3,23%))';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             c.cta_contable_liquidacion as cuenta,
             r.p_valor_4 as importe,
             '' as indicadorimpuesto,
             '200102' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC GASTO PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(C.NIT_C, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             c.cta_contable_liquidacion as cuenta,
             r.p_valor_9 as importe,
             '' as indicadorimpuesto,
             '200102' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC GASTO PART CONCES SEVIAL 3%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             r.p_valor_9 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CXP PART SEVIAL 3%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             C.CTA_CONTABLE_FONDO as cuenta,
             r.p_valor_5 as importe,
             '' as indicadorimpuesto,
             '200102' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC GASTO FONDO COB ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(C.NIT_C, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'OTRO ACREEDOR CONCESIONARIO ( 3,25% + 0,25%, 3.23% + 0%)';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(C.NIT_C, 0, 9) as cuenta,
             ROUND(R.p_valor_4, 0) + ROUND(R.p_valor_5, 0) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('OTRO ACREEDOR ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(C.NIT_C, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             (r.p_valor_14 + r.p_valor_20 + r.p_valor_19 - r.p_valor_18) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION SEVIAL 2.7 ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '2905901001' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             (r.p_valor_18) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION IVA SEVIAL 2.7 ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '2905901002' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             '2905901003' as cuenta,
             (r.p_valor_13 - r.p_valor_16 - r.p_valor_20 - r.p_valor_19) as importe,
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
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             '2905901004' as cuenta,
             (r.p_valor_16) as importe,
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
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             (R.NUM_LIQUIDACION || 'A') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '01' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (ROUND(r.p_valor_4, 0) + ROUND(r.p_valor_5, 0) +
             ROUND(r.p_valor_7 + r.p_valor_10, 0) +
             ROUND(r.p_valor_3 + r.p_valor_8, 0) + ROUND(r.p_valor_6, 0) +
             ROUND(r.p_valor_9, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CXC 10% AL MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '1401020102' as cuentadivergente,
             to_char(r.fec_corte, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             (R.NUM_LIQUIDACION || 'A') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '11' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (ROUND(r.p_valor_4, 0) + ROUND(r.p_valor_5, 0) +
             ROUND(r.p_valor_7 + r.p_valor_10, 0) +
             ROUND(r.p_valor_3 + r.p_valor_8, 0) + ROUND(r.p_valor_6, 0) +
             ROUND(r.p_valor_9, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CXC 10% AL MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '1401020102' as cuentadivergente,
             to_char(r.fec_corte, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'PARTICIPACION CONTRAVENCIONAL concesionario';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             ROUND(r.p_valor_22 / 2, 2) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PART CONTRAVENCIONAL ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '2905901005' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'PARTICIPACION IVA CONTRAVENCIONAL concesionario';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             ROUND(r.p_valor_27 / 2, 2) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PART IVA CONTRAVENCIONAL  ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '2905901009' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             f.ctacon_fcm as cuenta,
             (r.p_valor_22 - ROUND(r.p_valor_22 / 2, 2)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION CONTRAVENCIONAL FCM') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'PARTICIPACION IVA CONTRAVENCIONAL FCM';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             f.ctacon_impuestos as cuenta,
             (r.p_valor_27 - ROUND(r.p_valor_27 / 2, 2)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION IVA CONTRAVENCIONAL FCM') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'CRUCE CXC A SIMIT 19%+IVA';
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
             'ZT' as clasedoc,
             'FCM1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             '1470909003' as cuenta,
             
             -- 9.5 + IVA +9.5 + IVA
             ROUND(ROUND(r.p_valor_22 / 2, 2), 0) +
             ROUND(ROUND(r.p_valor_27 / 2, 2), 0) +
             ROUND((r.p_valor_22 - ROUND(r.p_valor_22 / 2, 2)), 0) +
             ROUND((r.p_valor_27 - ROUND(r.p_valor_27 / 2, 2)), 0) as importe,
             
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CRUCE CXC A SIMIT 19+iva') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
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
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'FCM1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             
             -- 9.5 + IVA +9.5 + IVA
             ROUND(ROUND(r.p_valor_22 / 2, 2), 0) +
             ROUND(ROUND(r.p_valor_27 / 2, 2), 0) +
             ROUND((r.p_valor_22 - ROUND(r.p_valor_22 / 2, 2)), 0) +
             ROUND((r.p_valor_27 - ROUND(r.p_valor_27 / 2, 2)), 0) as importe,
             
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CRUCE CXP A SIMIT 19+iva') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_corte, 'ddMMyyyy') as fechabase,
             'Z002' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
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
             'ZT' as clasedoc,
             'FCM1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             '1470909002' as cuenta,
             
             -- 2.7 + IVA + 1.8 + IVA
             (ROUND(r.p_valor_14 + r.p_valor_20 + r.p_valor_19 -
                    r.p_valor_18,
                    0) + ROUND(r.p_valor_18, 0) +
             ROUND(r.p_valor_13 - r.p_valor_16 - r.p_valor_20 -
                    r.p_valor_19,
                    0) + ROUND(r.p_valor_16, 0)) as importe,
             
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
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
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
             'ZT' as clasedoc,
             'FCM1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(f.nit_polca, 0, 9) as cuenta,
             
             -- 2.7 + IVA + 1.8 + IVA
             (ROUND(r.p_valor_14 + r.p_valor_20 + r.p_valor_19 -
                    r.p_valor_18,
                    0) + ROUND(r.p_valor_18, 0) +
             ROUND(r.p_valor_13 - r.p_valor_16 - r.p_valor_20 -
                    r.p_valor_19,
                    0) + ROUND(r.p_valor_16, 0)) as importe,
             
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
             'Z002' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
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
             'ZE' as clasedoc,
             'FCM1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'S' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             '5111110112' as cuenta,
             (r.p_valor_14 + r.p_valor_20 + r.p_valor_19) as importe,
             'V5' as indicadorimpuesto,
             '100761' as centrocosto,
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
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
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
             'ZE' as clasedoc,
             'FCM1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'S' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             (r.p_valor_14 + r.p_valor_20 + r.p_valor_19) as importe,
             'V5' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CXP SEVIAL 2,7%+IVA') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';
  
    w_concepto := 'RECAUDO NO DISTRIBUIDO MUNICIPIO SIMIT';
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             r.valor_total as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('RECAUDO NO DISTRIBUIDO MUNICIPIO SIMIT') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '2905901008' as cuentadivergente,
             to_char(r.fec_corte, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
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
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.ind_proceso = 0;
  
    delete recaudo_externo_contabilidad r
     where r.importe = 0
       and r.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
       and tipocontable = 'REC';
  
    update recaudo_externo_contabilidad r
       set r.importe = ROUND(r.importe, 0)
     where r.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
       and tipocontable = 'REC';
  
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
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             a.referencia as referencia,
             a.textocabezera as textocabezera,
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
             'REC' as tipocontable
        from fcm f,
             (select c.referencia,
                     max(c.textocabezera) as textocabezera,
                     max(c.asignacion) as asignacion,
                     sum(case c.clavecontable
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
                 and c.sociedad = 'PFC1'
                 and tipocontable = 'REC'
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
             'ZT' as clasedoc,
             'FCM1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             a.referencia as referencia,
             a.textocabezera as textocabezera,
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
             'REC' as tipocontable
        from fcm f,
             (select c.referencia,
                     max(c.textocabezera) as textocabezera,
                     max(c.asignacion) as asignacion,
                     sum(case c.clavecontable
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
                 and tipocontable = 'REC'
               group by c.referencia) a
       where f.nit_fcm = '8000826650'
         and a.importe <> 0;
  
    commit;
  
    sp_log(p_usuario,
           'Contabiliza Recaudo Externo',
           p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
           p_feccor_ini_dia);
  
    commit;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [contabiliza_recaudo_externo] ' || SQLERRM,
            p_error);
    
  END contabiliza_recaudo_externo;