--------------------------------------------
-- Export file for user SIMIT             --
-- Created by user on 28/06/2011, 8:24:48 --
--------------------------------------------

spool 01_repro.log

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
