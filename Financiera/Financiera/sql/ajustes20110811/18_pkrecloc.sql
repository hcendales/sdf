---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 20/10/2011, 18:29:03 --
---------------------------------------------

spool 18_pkrecloc.log

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
                                        
                                        
end PK_RECLOC;
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
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), b.cuentacontable, (  case when r.valor_total > 0 then b.ctacontperiodoant else c.cta_cont_period_ant end ) )  as cuenta,
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
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), b.cuentacontable, (  case when r.valor_total > 0 then b.ctacontperiodoant else c.cta_cont_period_ant end ) )  as cuenta,
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
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), b.cuentacontable, (  case when r.valor_total > 0 then b.ctacontperiodoant else c.cta_cont_period_ant end ) )  as cuenta,
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
             decode(to_char(r.fec_corte,'yyyy'),to_char(r.fec_tran,'yyyy'), b.cuentacontable, (  case when r.valor_total > 0 then b.ctacontperiodoant else c.cta_cont_period_ant end ) )  as cuenta,
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
