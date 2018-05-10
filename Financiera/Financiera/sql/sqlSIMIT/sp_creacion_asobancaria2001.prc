create or replace procedure sp_creacion_Asobancaria2001(p_fecha varchar2) is
  -- p_fecha yyyymmdd
  v_sec    number;
  V_VRTREC number;
  CURSOR cctas IS
    select '7709998003392' iac, '186001061' cta
      from dual
    union
    select '7709998003408' iac, '186001079' cta
      from dual
    union
    select '7709998003415' iac, '186001053' cta
      from dual
    union
    select '7709998003422' iac, '186001020' cta
      from dual
    union
    select '7709998003439' iac, '186001046' cta
      from dual
    union
    select '7709998003446' iac, '186001087' cta from dual;

begin

  for b in cctas loop
    dbms_output.put_line('***' || b.iac || '_' || p_fecha);

    v_sec    := 2;
    V_VRTREC := 0;
    -- "Registro de encabezado de archivo"
    dbms_output.put_line('' || '01' || '8000826650' || p_fecha || '050' || to_char(b.cta, '00000000000000000') ||
                         TO_CHAR(SYSDATE, 'YYYYMMDD') ||
                         TO_CHAR(SYSDATE, 'HHMI') || 'A' || '01');

    -- "Registro de encabezado de lote"
    dbms_output.put_line('' || '05' || to_char(b.iac, '0000000000000') ||
                         '0001');

    -- "Registro de Detalle"
    for c in (select *
                from recaudo_externo t
               where t.fec_corte = to_date(p_fecha, 'yyyymmdd') and t.idbanco = 50 AND T.CTA_RECAUDO = B.cta) loop
      dbms_output.put_line('' || '06' || c.num_liquidacion || '2' ||
                           c.idmunicipio || c.indfecha2002 ||
                           c.validador_fecha || '0' || -- base 10
                           to_char(c.valor_adicional, '0000000000') ||
                           to_char(c.identificacion, '0000000000000') || '1' || -- base 11
                           replace(to_char(c.valor_total, '00000000000.00'),
                                   '.',
                                   '') || '01' || -- PROPAG
                           '01' || -- MEDPAG
                           '000000' || -- NUMOPE
                           '000000' || -- NUMAUT
                           '000' || -- CODENTDEB
                           '0010' || -- CODSUC
                           to_char(v_sec, '0000000') || -- SEC
                           '000' -- CAUDEV
                           );
      v_sec    := v_sec + 1;
      V_VRTREC := V_VRTREC + c.valor_adicional;
    end loop;

    -- "Registro de control de lote"
    dbms_output.put_line('' || '08' || to_char(v_sec - 1, '000000000') || -- TOTREG
                         to_char(V_VRTREC, '000000000000000000') || -- VRTREC
                         '0001' -- NUMLOT
                         );

    -- "Registro de control de archivo"
    dbms_output.put_line('' || '09' || to_char(v_sec - 1, '000000000') || -- TOTREG
                         to_char(V_VRTREC, '000000000000000000') -- VRTREC
                         );
  end loop;

end sp_creacion_Asobancaria2001;
/

